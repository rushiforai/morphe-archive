"""Independent native and manifest contracts for De Tijd 5.6.1 outputs.

Snapshots contain hashes and public descriptors only, never configuration keys,
tokens or publisher source. Instruction, exception-table and switch-payload
normalization is local so this verifier has no unrelated app dependencies.
"""
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET


A = "{http://schemas.android.com/apk/res/android}"
MANIFEST_FLAGS = {
    "firebase_analytics_collection_enabled": ("true", "false"),
    "firebase_analytics_collection_deactivated": ("false", "true"),
    "google_analytics_adid_collection_enabled": ("true", "false"),
    "google_analytics_ssaid_collection_enabled": ("true", "false"),
    "google_analytics_default_allow_analytics_storage": ("true", "false"),
    "google_analytics_default_allow_ad_storage": ("true", "false"),
    "google_analytics_default_allow_ad_user_data": ("true", "false"),
    "google_analytics_default_allow_ad_personalization_signals": ("true", "false"),
}
_METHOD = re.compile(r"^\.method ([^\n]+)\n(.*?)^\.end method", re.M | re.S)
_LABEL = re.compile(r"(?<![\w:]):[A-Za-z0-9_]+")
_REGISTER = re.compile(r"\b([vp])(\d+)\b")


def _source(root, owner):
    paths = list(root.glob(f"smali*/{owner}.smali")) + list(root.glob(f"smali/smali*/{owner}.smali"))
    assert len(paths) == 1, (owner, "expected one native class", len(paths))
    return paths[0].read_text()


def method_record(root, owner, signature):
    """Resolve code/try/payload labels and parameter registers structurally."""
    candidates = [(head, body) for head, body in _METHOD.findall(_source(root, owner))
                  if head.split()[-1] == signature]
    assert len(candidates) == 1, (owner, signature, "expected one concrete method")
    header, body = candidates[0]
    flags = header.split()[:-1]
    register = re.search(r"^\s*\.(locals|registers) (\d+)", body, re.M)
    assert register, (owner, signature, "concrete method register declaration")
    parameters = re.findall(r"\[*L[^;]+;|\[*[ZBCSIJFD]", signature.split("(", 1)[1].split(")", 1)[0])
    incoming = (0 if "static" in flags else 1) + sum(2 if p in {"J", "D"} else 1 for p in parameters)
    locals_count = int(register[2]) - (incoming if register[1] == "registers" else 0)
    assert locals_count >= 0, (owner, signature, "register bounds")
    instructions, labels, catches, payloads = [], {}, [], []
    annotation = 0
    payload = None
    pending_label = None
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith(".annotation"):
            annotation += 1
        if line.startswith(".end annotation"):
            annotation -= 1
            continue
        if annotation or not line or line.startswith("#"):
            continue
        if payload is not None:
            if line.startswith(".end "):
                payload = None
            else:
                payloads[-1]["entries"].append(line)
            continue
        if line.startswith((".packed-switch ", ".sparse-switch", ".array-data ")):
            assert pending_label is not None, (owner, signature, "unlabelled payload")
            labels[pending_label] = "$payload" + str(len(payloads))
            payloads.append({"header": line, "entries": []})
            payload = line.split()[0]
            pending_label = None
        elif line.startswith((".catch ", ".catchall ")):
            catches.append(line)
        elif line.startswith(":"):
            labels[line] = "@" + str(len(instructions))
            pending_label = line
        elif not line.startswith("."):
            instructions.append(line.split("    #", 1)[0])
            pending_label = None
    assert annotation == 0 and payload is None, (owner, signature, "complete method parse")

    def normalize(line):
        # Configuration literals can contain register-like words or colons.
        # Normalize only the code prefix before a quoted literal.
        prefix, quote, suffix = line.partition('"')
        prefix = _REGISTER.sub(lambda m: "r" + str(int(m[2]) + (locals_count if m[1] == "p" else 0)), prefix)
        prefix = _LABEL.sub(lambda m: labels[m[0]], prefix)
        return (prefix + quote + suffix).replace("const-string/jumbo ", "const-string ")

    return {
        "flags": flags,
        "registers": locals_count + incoming,
        "code": [normalize(line) for line in instructions],
        "catches": [normalize(line) for line in catches],
        "payloads": [{"header": row["header"], "entries": [normalize(line) for line in row["entries"]]}
                     for row in payloads],
    }


def record_digest(record):
    return hashlib.sha256(json.dumps(record, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def _remove_prefix(record, count):
    def adjust(line):
        def target(match):
            index = int(match[1])
            assert index >= count, "Retained native branch enters inserted stub"
            return "@" + str(index - count)
        return re.sub(r"@(\d+)", target, line)
    return {
        "flags": record["flags"], "registers": record["registers"],
        "code": [adjust(line) for line in record["code"][count:]],
        "catches": [adjust(line) for line in record["catches"]],
        "payloads": [{"header": row["header"], "entries": [adjust(line) for line in row["entries"]]}
                     for row in record["payloads"]],
    }


def element_digest(node):
    def value(item):
        return [item.tag, sorted(item.attrib.items()), [value(child) for child in item]]
    return hashlib.sha256(json.dumps(value(node), separators=(",", ":")).encode()).hexdigest()


def _ad_rejection(record):
    """Execute the emitted stub at its Promise boundary, including arguments."""
    promise = object()
    registers = {"r1": object(), "r2": "unit", "r3": "template", "r4": {}, "r5": promise}
    rejected = []
    code = record["code"][:4]
    for line in code:
        if line.startswith("const-string "):
            dest, literal = line.split(" ", 1)[1].split(", ", 1)
            registers[dest] = json.loads(literal)
        elif line.startswith("invoke-interface "):
            match = re.fullmatch(r"invoke-interface \{(r\d+), (r\d+), (r\d+)\}, Lcom/facebook/react/bridge/Promise;->reject\(Ljava/lang/String;Ljava/lang/String;\)V", line)
            assert match, "Native ad completes through Promise.reject(String,String)"
            assert registers[match[1]] is promise, "Reject the incoming native-ad Promise"
            rejected.append((registers[match[2]], registers[match[3]]))
        elif line == "return-void":
            assert rejected == [("E_AD_DISABLED", "Ads disabled")], "Reject exactly once with the inert ad error"
            return
        else:
            raise AssertionError("Unexpected native-ad boundary operation")
    raise AssertionError("Native-ad loading Promise did not complete")


def verify_native(root, ads: bool, tracking: bool, promotions: bool = False):
    """Verify selection effects and original functional native bodies."""
    root = Path(root)
    original = json.loads(Path(__file__).with_name("detijd_native_originals.json").read_text())
    for row in original["methods"]:
        owner, signature = row["class"], row["signature"]
        record = method_record(root, owner, signature)
        assert record["registers"] == row["registers"], (owner, signature, "preserve native register allocation")
        policy = row["policy"]
        expected = row["sha256"]
        if policy == "skip-in-app" and promotions:
            assert record["code"][:2] == ["sget-object r0, Lau/i3;->SKIP:Lau/i3;", "return-object r0"], "In-app campaigns use the SDK SKIP completion"
            record = _remove_prefix(record, 2)
        elif policy == "stop" and tracking:
            assert record["code"][0] == "return-void", (owner, signature, "native tracking returns before sending")
            record = _remove_prefix(record, 1)
        elif policy == "reject-ad" and ads:
            _ad_rejection(record)
            record = _remove_prefix(record, 4)
        elif policy == "gemius-startup" and tracking:
            assert len(record["code"]) == 7 and record["code"][-1] == "return-void", "Keep only original application startup before Gemius"
            assert not any("Lcom/gemius/" in line for line in record["code"]), "Omit complete Gemius-only startup block"
            expected = row["without_gemius_sha256"]
        assert record_digest(record) == expected, (owner, signature, "preserve native body, exception table and payloads outside selected control")

    manifest = ET.parse(root / "AndroidManifest.xml").getroot()
    assert manifest.get("package") == original["package"], "De Tijd package identity"
    applications = manifest.findall("application")
    assert len(applications) == 1
    application = applications[0]
    metadata = application.findall("meta-data")
    for key, values in MANIFEST_FLAGS.items():
        actual = [node.get(A + "value") for node in metadata if node.get(A + "name") == key]
        assert actual == [values[int(tracking)]], (key, "analytics collection/consent flag")
    for name, expected in original["functional_metadata"].items():
        nodes = [node for node in metadata if node.get(A + "name") == name]
        assert len(nodes) == 1 and element_digest(nodes[0]) == expected, (name, "retain functional Firebase/push/platform metadata")
    for tag, name, expected in original["functional_components"]:
        nodes = [node for node in application.findall(tag) if node.get(A + "name") == name]
        assert len(nodes) == 1 and element_digest(nodes[0]) == expected, (name, "retain functional native component and intent filters")
    for key, expected in original["application_attributes"].items():
        assert application.get(A + key) == expected, (key, "retain native application configuration")
    permissions = {node.get(A + "name") for node in manifest.findall("uses-permission")}
    assert set(original["functional_permissions"]) <= permissions, "Retain network and push permissions"
    return len(original["methods"])
