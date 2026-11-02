"""Verify actual emitted RainViewer original-certificate metadata behavior."""
import argparse
import base64
from pathlib import Path
import re
from verify_dumpert import Smali
from rtl_vm import Memory, Reference, execute, parse

ORIGINAL_SHA1 = "19b6f8aed1fc525366f2fd956276128d9a3942df"


def verify(root: Path, original: Path, attestation_disabled=False):
    actual, before = Smali(root), Smali(original)
    owner, signature = "Lc63;", "A(Landroid/content/Context;Ljava/lang/String;)[B"
    body = actual.body(owner, signature)
    assert "Landroid/util/Base64;->decode(Ljava/lang/String;I)[B" in body, "Original certificate override missing"
    decoded = []
    def boundary(method, args):
        assert method == "Landroid/util/Base64;->decode(Ljava/lang/String;I)[B", method
        raw = base64.b64decode(args[0], validate=True)
        assert raw.hex() == ORIGINAL_SHA1 and args[1] == 2
        decoded.append(raw)
        return Reference(raw, "[B")
    def calls(method, args):
        if method == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z":
            return args[0] == args[1]
        return boundary(method, args)
    result = execute(parse(body), {"p0": Reference({}, "Landroid/content/Context;"), "p1": "com.lucky_apps.RainViewer"}, calls, memory=Memory())
    assert result.value.hex() == ORIGINAL_SHA1 and len(decoded) == 1
    # A different package must take the original package-manager path, not get RainViewer's digest.
    def other(method, args):
        if method == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z":return False
        raise LookupError(method)
    try:
        execute(parse(body), {"p0": Reference({}, "Landroid/content/Context;"), "p1": "another.package"}, other, memory=Memory())
    except LookupError as error:
        assert str(error) == "Ljc8;->a(Landroid/content/Context;)Laj1;"
    else:
        raise AssertionError("Other package did not reach original lookup")
    # The genuine attestation generator and status-code enforcement must remain unmodified.
    from verify_dumpert import canonicalize
    for cls in ["Ljz5;", "Lsl;", "Lcom/lucky_apps/data/authorization/entity/raindrop/RaindropRequest;"]:
        for sig in re.findall(r"^\.method[^\n]* (\S+\([^\n]+)", before.text(cls), re.M):
            if attestation_disabled and cls == "Ljz5;" and sig == "b(ILft0;)Ljava/lang/Object;": continue
            assert canonicalize(actual.body(cls, sig)) == canonicalize(before.body(cls, sig)), "Attestation/response logic changed: " + cls + sig
    print("RainViewer self-certificate metadata verified; genuine attestation and server errors retained")


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("decoded", type=Path)
    p.add_argument("original", type=Path)
    p.add_argument("--attestation-disabled", action="store_true")
    a = p.parse_args()
    verify(a.decoded, a.original, a.attestation_disabled)
