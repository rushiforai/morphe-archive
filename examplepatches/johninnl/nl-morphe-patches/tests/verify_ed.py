"""Verify ED controls against frozen publisher methods and emitted behavior.

The snapshots come from ED 9.22.0, not from AD. The shared DTO interpreter
executes the emitted helpers on independent commercial/editorial object graphs.
Each allowed edit is inverted and the complete original control flow, switch
maps, exception ranges, access flags and register counts must match its pin.
"""
import argparse
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from ad_onboarding import method, digest, Obj, VM, EncryptedPreferences
from verify_ad import verify_filters, verify_call_kinds
from ed_annoyances import verify_vacancy_widgets, verify_personalisation_notice

HERE = Path(__file__).parent
ORIGINALS = json.loads((HERE / "ed_originals.json").read_text())
EDITS = {(row["class"], row["signature"]): row for row in json.loads((HERE / "ed_edits.json").read_text())}
NAMES = {"Hide ads", "Disable tracking", "Skip consent screens", "Hide Premium banner", "Read full articles", "Hide empty listening carousel"}
OWNER = "com/kubus/module/network/model/SectionResponse"
TOPICS = "com/kubusapp/onboarding/OnBoardingPushNotificationActivity"
A = "{http://schemas.android.com/apk/res/android}"
FLAGS = {
    "delivery_metrics_exported_to_big_query_enabled": "false",
    "firebase_analytics_collection_deactivated": "true",
    "firebase_analytics_collection_enabled": "false",
    "firebase_crashlytics_collection_enabled": "false",
    "firebase_performance_collection_deactivated": "true",
    "google_analytics_adid_collection_enabled": "false",
    "google_analytics_default_allow_ad_personalization_signals": "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled": "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled": "false",
}


def physical(lines, locals_count):
    """DEX may spell an incoming register as pN or its physical vN alias."""
    result = []
    for line in lines:
        line = re.sub(r"\bp(\d+)\b", lambda m: "v" + str(locals_count + int(m[1])), line).replace("const-string/jumbo ", "const-string ")
        if line.startswith("invoke-") and "/range " in line:
            match = re.search(r"\{v(\d+) \.\. v(\d+)\}", line)
            assert match
            registers = ", ".join("v" + str(i) for i in range(int(match[1]), int(match[2]) + 1))
            line = line.replace("/range ", " ").replace(match[0], "{" + registers + "}")
        result.append(line)
    return result


def active_controls(selected):
    tracking = bool(selected & {"Disable tracking", "Skip consent screens"})
    return {
        "ads": tracking or "Hide ads" in selected,
        "tracking": tracking,
        "consent": "Skip consent screens" in selected,
        "premium": "Hide Premium banner" in selected,
        "full": "Read full articles" in selected,
        "marketing": bool(selected & {"Hide Premium banner", "Read full articles"}),
        "automaticMarketing": bool(selected & {"Skip consent screens", "Hide Premium banner", "Read full articles"}),
        "filters": tracking or bool(selected & {"Hide ads", "Hide Premium banner"}),
        "flags": True,
        "listening": "Hide empty listening carousel" in selected,
    }


def restored(m, row, active):
    remove, replacements = set(), {}
    delta = 0
    if row is None or not active[row["control"]]:
        return m.canonical()
    prefix = row["prefix"]
    if prefix:
        actual = list(m.instructions[:len(prefix)])
        expected = list(prefix)
        for i, instruction in enumerate(expected):
            if instruction.endswith(", @original"):
                label = actual[i].rsplit(", ", 1)[1]
                assert m.labels[label] == len(prefix), "ED guard must enter the real original instruction"
                actual[i] = instruction
        assert physical(actual, m.locals) == physical(expected, m.locals), (row["class"], row["signature"], "typed selected prefix", actual, expected)
        remove.update(range(len(prefix)))
        delta = len(prefix)
    for site in row["sites"]:
        if not active[site.get("control", row["control"])]:
            continue
        index = site["index"] + delta
        new, old = site["new"], site["old"]
        actual = m.instructions[index:index + len(new)]
        assert physical(actual, m.locals) == physical(new, m.locals), (row["class"], row["signature"], index, actual, new)
        if old:
            replacements[index] = old[0]
            remove.update(range(index + 1, index + len(new)))
        else:
            remove.update(range(index, index + len(new)))
        delta += len(new) - len(old)
    # DEX switch data alignment can add an unreachable terminal nop. The
    # shared parser drops this pad only when it is not a real branch target.
    return m.canonical(remove, replacements)


class SeedVM(VM):
    """Reuse the instruction engine; supply only Android encrypted storage."""
    def __init__(self, root, topics):
        self.root, self.topics = root, topics
        self.stack, self.events, self.static = [], [], {}
        self.steps = 0

    def invoke(self, ref, values, kind):
        if ref == "Ljld;-><init>(B)V":
            assert kind == "invoke-direct" and values[1] == 4, "ED's actual channel-storage constructor branch"
            values[0].fields["b"] = Obj("Lgog;", {"value": Obj("Lcdf;", {"encrypted": self.topics})})
            return None
        if ref == "Lgog;->getValue()Ljava/lang/Object;":
            return values[0].fields["value"]
        if ref == "Lcdf;->contains(Ljava/lang/String;)Z":
            assert values[1] == "USER_CHANNELS"
            return self.topics.key in self.topics.physical
        if ref == "Lcdf;->edit()Landroid/content/SharedPreferences$Editor;":
            return Obj("Liaf;", {"target": self.topics, "pending": {}})
        return super().invoke(ref, values, kind)


def verify_helpers(root, active):
    text = next(root.glob("smali*/" + OWNER + ".smali")).read_text()
    names = set(re.findall(r"^\.method[^\n]* (morphe\w+)\(", text, re.M))
    expected = {"morpheAds", "morphePremium", "morpheFilter", "morphePrimary", "morpheNormalize", "morpheOverlay", "morpheSingle", "morpheEmpty", "morpheArticleComponents"} if active["filters"] else set()
    if active["filters"]:
        expected.add("morpheVacancyHtml")
    if active["tracking"]:
        expected |= {"morpheSuppressFiam", "morpheAdvertisingInfo"}
    assert names == expected, ("ED only selected helper dependencies", names, expected)
    if active["filters"]:
        for name, flag in [("morpheAds", "ads"), ("morphePremium", "premium")]:
            assert method(root, OWNER, name + "()Z").instructions[:2] == [f"const/4 v0, 0x{int(active[flag]):x}", "return v0"]
        verify_filters(root, active["ads"], active["premium"])
        verify_vacancy_widgets(root, active["ads"])
        verify_call_kinds(root, {
            ('Ljava/lang/String;', 'matches(Ljava/lang/String;)Z'),
            ('Ljava/util/regex/Pattern;', 'compile(Ljava/lang/String;)Ljava/util/regex/Pattern;'),
            ('Ljava/util/regex/Pattern;', 'matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;'),
            ('Ljava/util/regex/Matcher;', 'find()Z'),
            ('Ljava/util/regex/Matcher;', 'group()Ljava/lang/String;'),
        })
    if active["tracking"]:
        assert method(root, OWNER, "morpheSuppressFiam(Lif6;Z)V").canonical()["instructions"] == ["if-eqz p0, @2", "iput-boolean p1, p0, Lif6;->c:Z", "return-void"]
        assert method(root, OWNER, "morpheAdvertisingInfo()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;").instructions == [
            "new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;", "const-string v1, \"\"", "const/4 v2, 0x1", "invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V", "return-object v0"]
    router = next(root.glob("smali*/edj.smali")).read_text()
    helpers = set(re.findall(r"^\.method[^\n]* (morphe\w+)\(", router, re.M))
    assert helpers == ({"morpheSeedTopicChoices", "morpheContinueGuest"} if active["consent"] else set())
    if active["consent"]:
        guest = method(root, "edj", "morpheContinueGuest(Landroid/content/Context;)V")
        assert guest.instructions == ["sget-object v0, Lcdj;->PUSH_NOTIFICATION_SCREEN:Lcdj;", "const/4 v1, 0x0", "invoke-static {p0, v0, v1}, Ledj;->b(Landroid/content/Context;Lcdj;Landroid/content/Intent;)V", "return-void"]
        verify_onboarding_calls(root)
        for existing in [None, [], ["existing-topic", "another-topic"]]:
            topics = EncryptedPreferences(existing)
            before = dict(topics.physical)
            vm = SeedVM(root, topics)
            vm.call("edj", "morpheSeedTopicChoices()V", [])
            if existing is None:
                assert topics.physical[topics.key] == frozenset() and len(topics.writes) == 1
            else:
                assert topics.physical == before and not topics.writes
            after = dict(topics.physical)
            vm.call("edj", "morpheSeedTopicChoices()V", [])
            assert topics.physical == after and len(topics.writes) == (1 if existing is None else 0)
            assert topics.physical["unrelated-encrypted-key"] == before["unrelated-encrypted-key"]


def verify_onboarding_calls(root):
    """Resolve new router helper calls against emitted ABI and minSDK32 APIs."""
    from ad_sdk import sdk_classes
    sdk, archive = sdk_classes()
    try:
        for signature in ["morpheSeedTopicChoices()V", "morpheContinueGuest(Landroid/content/Context;)V"]:
            helper = method(root, "edj", signature)
            assert {"public", "static"} <= helper.flags
            assert helper.locals == (3 if "Seed" in signature else 2)
            for line in helper.instructions:
                if not line.startswith("invoke-"):
                    continue
                kind = line.split()[0].removesuffix("/range")
                owner, target = line.split("}, ")[1].split("->")
                platform = sdk(owner)
                if platform is not None:
                    interface, _, methods = platform
                    assert target in methods, ("ED helper API available at minSDK32", owner, target)
                    flags = methods[target]
                    assert flags & 1, "ED helper platform target must be public"
                else:
                    callee = method(root, owner[1:-1], target)
                    assert "public" in callee.flags, "ED helper app target must be public"
                    flags = 8 if "static" in callee.flags else 0
                    text = next(root.glob("smali*/" + owner[1:-1] + ".smali")).read_text()
                    interface = bool(re.search(r"^\.class[^\n]*\binterface\b", text, re.M))
                assert bool(flags & 8) == (kind == "invoke-static"), line
                if kind != "invoke-static":
                    expected = "invoke-direct" if target.startswith("<init>") else ("invoke-interface" if interface else "invoke-virtual")
                    assert kind == expected, ("ED helper invoke kind", line)
    finally:
        archive.close()


def verify_manifest(root, active):
    manifest = ET.parse(root / "AndroidManifest.xml").getroot()
    assert manifest.get("package") == ORIGINALS["package"]
    entries = list(manifest.iter("meta-data"))
    fiam = [e.get(A + "name") for e in entries if e.get(A + "name", "").startswith("com.google.firebase.components:com.google.firebase.inappmessaging.")]
    assert len(fiam) == (0 if active["tracking"] else 4), "ED FIAM registrations"
    for name, expected in FLAGS.items():
        values = [e.get(A + "value") for e in entries if e.get(A + "name") == name]
        assert values == ([expected] if active["tracking"] else ORIGINALS["metadata"][name]), (name, values)
    permissions = {p.get(A + "name") for p in manifest.iter("uses-permission")}
    assert {"com.google.android.c2dm.permission.RECEIVE", "android.permission.POST_NOTIFICATIONS"} <= permissions, "Keep real push delivery"


def verify(root, selected):
    assert selected <= NAMES, selected - NAMES
    active = active_controls(selected)
    verify_manifest(root, active)
    verify_helpers(root, active)
    if active["consent"]:
        verify_personalisation_notice(root)
    originals = {(c, s) for c, s, _ in ORIGINALS["methods"]}
    assert set(EDITS) <= originals, "Every edit must have an independent ED original pin"
    for cls, sig, expected in ORIGINALS["methods"]:
        observed = restored(method(root, cls, sig), EDITS.get((cls, sig)), active)
        assert digest(observed) == expected, (cls, sig, "complete preserved publisher method/CFG")
    print(f"PASS ED: {len(ORIGINALS['methods'])} original/retained methods, exact selected edits, emitted DTO/identifier/storage behavior; " + (", ".join(sorted(selected)) or "original"))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    parser.add_argument("-e", "--enable", action="append", default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, set(args.enable))


if __name__ == "__main__":
    main()
