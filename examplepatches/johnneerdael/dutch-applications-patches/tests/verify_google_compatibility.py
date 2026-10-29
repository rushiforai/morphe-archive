"""Verify re-signing compatibility in independently decoded real APK output."""
import argparse
import base64
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET


def verify(root: Path, expected_certificate: str) -> None:
    files = list(root.glob("smali*/patches/buienalarm/extension/SignatureCompatibility.smali"))
    assert len(files) == 1, "Google compatibility helper must be included"
    helper = files[0].read_text()
    getter = re.search(r"\.method[^\n]*getOriginalCertificate\(\)Ljava/lang/String;\n(.*?)\.end method", helper, re.S)
    assert getter
    cert = re.search(r'const-string(?:/jumbo)? [vp]\d+, "([A-Za-z0-9+/=]+)"', getter[1])
    assert cert, "Helper must contain the original input certificate"
    assert hashlib.sha256(base64.b64decode(cert[1], validate=True)).hexdigest() == expected_certificate
    assert '"org.yoki.android.buienalarm"' in helper, "Other packages must retain real metadata"
    redirected = 0
    unredirected = []
    for path in root.glob("smali*/**/*.smali"):
        if "/patches/buienalarm/extension/" in str(path):
            continue
        text = path.read_text()
        redirected += text.count("SignatureCompatibility;->getPackageInfo(")
        if "Landroid/content/pm/PackageManager;->getPackageInfo(" in text:
            unredirected.append(str(path))
    assert redirected == 50, f"Expected all 50 bundled PackageManager lookups, got {redirected}"
    assert not unredirected, f"Unwrapped lookups: {unredirected}"
    assert "firebaseRemoteConfig" in "".join(p.read_text() for p in root.glob("smali*/com/meteoplaza/api/android/a.smali")), "Retain weather Remote Config"
    network = ET.parse(root / "res/xml/network_security_config.xml")
    assert not network.findall(".//pin-set"), "No app-config pinning existed to remove"
    anchors = network.find("base-config/trust-anchors")
    assert anchors is not None
    assert [e.get("src") for e in anchors] == ["system"], "Do not weaken production TLS trust"
    print("PASS: original certificate retained; 50 SDK lookups wrapped; weather configuration and TLS trust retained")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("decoded", type=Path)
    parser.add_argument("certificate_sha256")
    args = parser.parse_args()
    verify(args.decoded, args.certificate_sha256)
