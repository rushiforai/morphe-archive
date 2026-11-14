#!/usr/bin/env python3
"""Check whether an app's Firebase API key rejects a non-original signing certificate.

External network use: this sends three Firebase Installations create requests to
Google using values read from the APK. Run it only after the user agreed.
It never prints the API key. Usage:
    firebase-signer-probe.py <original.apk> <package> <original-signer-sha1> [--aapt2 PATH]
"""
import argparse, base64, json, re, secrets, subprocess, sys, urllib.error, urllib.request

def resource(dump: str, name: str) -> str:
    match = re.search(r'string/%s\n\s+\(\) "([^"]+)"' % re.escape(name), dump)
    if not match:
        sys.exit(f"Missing resource string: {name}")
    return match.group(1)

def new_fid() -> str:
    raw = bytearray(secrets.token_bytes(17)); raw[0] = 0x70 | (raw[0] & 0x0F)
    return base64.urlsafe_b64encode(bytes(raw)).decode().rstrip("=")[:22]

def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("apk"); parser.add_argument("package"); parser.add_argument("original_sha1")
    parser.add_argument("--aapt2", default="aapt2")
    args = parser.parse_args()
    dump = subprocess.run([args.aapt2, "dump", "resources", args.apk], capture_output=True, text=True, check=True).stdout
    key, app_id, project = resource(dump, "google_api_key"), resource(dump, "google_app_id"), resource(dump, "project_id")
    base = f"https://firebaseinstallations.googleapis.com/v1/projects/{project}/installations"

    def call(label, package, cert):
        fid = new_fid()
        headers = {"Content-Type": "application/json", "x-goog-api-key": key}
        if package: headers["X-Android-Package"] = package
        if cert: headers["X-Android-Cert"] = cert
        body = json.dumps({"fid": fid, "appId": app_id, "authVersion": "FIS_v2", "sdkVersion": "a:17.2.0"}).encode()
        try:
            with urllib.request.urlopen(urllib.request.Request(base, data=body, headers=headers, method="POST"), timeout=30) as reply:
                created = json.loads(reply.read())
                # Delete needs the refresh token (not the short-lived auth token); unverified form per the REST reference.
                cleanup = urllib.request.Request(f"{base}/{fid}", method="DELETE",
                    headers={"x-goog-api-key": key, "Authorization": "FIS_v2 " + created.get("refreshToken", "")})
                try:
                    with urllib.request.urlopen(cleanup, timeout=30) as done: note = f"cleanup HTTP {done.status}"
                except urllib.error.HTTPError as error: note = f"cleanup HTTP {error.code} (installation remains, unbound and inactive)"
                return f"{label}: HTTP {reply.status} created; {note}"
        except urllib.error.HTTPError as error:
            detail = json.loads(error.read().decode() or "{}").get("error", {}).get("message", "")
            return f"{label}: HTTP {error.code} {detail[:160]}"

    print(call("A original cert + package (control)", args.package, args.original_sha1.upper()))
    print(call("B random non-original cert + package", args.package, secrets.token_hex(20).upper()))
    print(call("C no Android headers", None, None))

if __name__ == "__main__":
    main()
