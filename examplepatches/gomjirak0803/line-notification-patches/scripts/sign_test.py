"""Sign the validated ARM64 test APK with a persistent local key. Does not install."""
from pathlib import Path
import json
import os
import secrets
import subprocess
from build import ROOT, TOOLS, tool_paths
from validate import sha256


def main():
    java, _, _, _, _ = tool_paths()
    output = ROOT / "artifacts"
    summary = json.loads((output / "validation-summary.json").read_text(encoding="utf-8"))
    source = output / "line-arm64-validation-unsigned.apk"
    expected = next(row["outputSha256"] for row in summary["inputs"] if row["variant"] == "arm64")
    if sha256(source) != expected:
        raise SystemExit("APK changed after validation; refusing to sign")
    signing = TOOLS / "signing"
    signing.mkdir(exist_ok=True)
    key = signing / "line-notifications-test.p12"
    password = signing / "password.txt"
    if not key.exists():
        if password.exists():
            raise SystemExit("Incomplete signing state: inspect .tools/signing before retrying")
        password.write_text(secrets.token_urlsafe(32), encoding="ascii")
        env = dict(os.environ, LINE_PATCH_SIGNING_PASSWORD=password.read_text(encoding="ascii"))
        subprocess.run([str(java.with_name("keytool.exe")), "-genkeypair", "-keystore", str(key),
                        "-storetype", "PKCS12", "-alias", "line-notifications-test", "-keyalg", "RSA",
                        "-keysize", "2048", "-validity", "3650", "-dname", "CN=Local LINE notification test",
                        "-storepass:env", "LINE_PATCH_SIGNING_PASSWORD", "-keypass:env", "LINE_PATCH_SIGNING_PASSWORD"],
                       env=env, check=True)
    if not password.exists():
        raise SystemExit("Signing password unavailable; key was left unchanged")
    sdk = TOOLS / "android-sdk/build-tools/35.0.0"
    target = output / "line-arm64-test.apk"
    aligned = output / "line-arm64-test-aligned.apk"
    subprocess.run([str(sdk / "zipalign.exe"), "-f", "-p", "4", str(source), str(aligned)], check=True)
    signer = [str(java), "-jar", str(sdk / "lib/apksigner.jar")]
    subprocess.run([*signer, "sign", "--ks", str(key), "--ks-key-alias", "line-notifications-test",
                    "--ks-pass", "file:" + str(password), "--out", str(target), str(aligned)], check=True)
    verification = subprocess.run([*signer, "verify", "--verbose", "--print-certs", str(target)],
                                  check=True, capture_output=True, text=True)
    (output / "test-apk-signature.txt").write_text(verification.stdout, encoding="utf-8")
    report = {"apk": target.name, "sha256": sha256(target), "unsignedSourceSha256": expected,
              "bundleSha256": summary["bundleSha256"], "signed": True, "installed": False,
              "containsOptionalFisRepair": True}
    (output / "test-apk.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
