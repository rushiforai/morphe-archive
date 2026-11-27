"""YouTube APKs for the follow-Morphe tests: download one from APKMirror and check it.

python3 apk.py download VERSION OUT.apk
python3 apk.py verify APK VERSION SIGNATURES_JSON
python3 apk.py names APK
"""

import html
import json
import os
import re
import subprocess
import sys
import tempfile
import time
from pathlib import Path

UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36"
BASE = "https://www.apkmirror.com"
NAMES = Path(__file__).resolve().parent / "youtube-names.txt"
YOUTUBE = "com.google.android.youtube"


class FetchError(Exception):
    def __init__(self, url, status, challenge=False):
        reason = f"HTTP {status}" if status else "curl failed"
        if challenge:
            reason += (", a Cloudflare challenge (a bot check), which this workflow does not try to pass;"
                       " the next run tries again")
        super().__init__(f"{url}: {reason}")
        self.status = status
        self.challenge = challenge

    @property
    def retryable(self):
        return not self.challenge and (self.status is None or self.status >= 500)


def is_challenge(status, body):
    """Cloudflare's "Just a moment..." page, which only a browser running its script gets past."""
    return status == 403 and "<title>Just a moment...</title>" in body


def with_retries(call, attempts, wait, sleep=time.sleep):
    """Run call, again after a wait while it fails with a server error or a curl failure."""
    for attempt in range(1, attempts + 1):
        try:
            return call()
        except FetchError as error:
            if not error.retryable or attempt == attempts:
                raise
            print(f"{error}, trying again in {wait} s", flush=True)
            sleep(wait)


class Session:
    def __init__(self):
        handle, self.jar = tempfile.mkstemp(suffix=".cookies")
        os.close(handle)

    def fetch(self, url, referer, out=None):
        command = ["curl", "-sS", "-L", "-A", UA, "-e", referer, "-c", self.jar, "-b", self.jar,
                   "-w", "\n%{http_code}", "--max-time", "600"]
        if out:
            command += ["-o", out]
        command.append(url)
        run = subprocess.run(command, capture_output=True, encoding="utf-8", errors="replace")
        if run.returncode:
            print(run.stderr.strip(), flush=True)
            raise FetchError(url, None)
        body, _, code = run.stdout.rpartition("\n")
        print(f"GET {url} -> {code} ({os.path.getsize(out) if out else len(body)} bytes)", flush=True)
        if code != "200":
            status = int(code) if code.isdigit() else None
            raise FetchError(url, status, challenge=not out and is_challenge(status, body))
        return body

    def get(self, url, referer=BASE, out=None):
        return self.fetch(url, referer, out)


def download(version, out, session=Session, sleep=time.sleep):
    """The plain APK (badge APK, arch universal, DPI nodpi) of one YouTube version.

    A server error starts the whole chain again in a new session: the file's link carries a key that one
    request spends, so the same link asked again answers 403.
    """
    with_retries(lambda: _download_once(session(), version, out), attempts=3, wait=30, sleep=sleep)


def _download_once(session, version, out):
    release = f"{BASE}/apk/google-inc/youtube/youtube-{version.replace('.', '-')}-release/"
    page = session.get(release)
    variant = None
    for row in re.findall(r'<div class="table-row headerFont">(.*?)</div>\s*</div>', page, re.S):
        text = re.sub(r"\s+", " ", html.unescape(re.sub(r"<[^>]+>", " ", row)))
        link = re.search(r'href="([^"]+-android-apk-download/)"', row)
        if link and " APK " in f" {text} " and "universal" in text and "nodpi" in text:
            variant = link.group(1)
    if not variant:
        sys.exit(f"APKMirror lists no universal nodpi APK of YouTube {version}")
    page = session.get(BASE + variant, release)
    key = re.search(r'href="([^"]*/download/\?key=[^"]*)"', page)
    if not key:
        sys.exit("No download key on the variant page")
    step = html.unescape(key.group(1))
    if "forcebaseapk" not in step:
        step += "&forcebaseapk=true"
    page = session.get(BASE + step, BASE + variant)
    final = re.search(r'href="([^"]*download\.php\?[^"]*)"', page)
    if not final:
        sys.exit("No download.php link")
    session.get(BASE + html.unescape(final.group(1)), BASE + step, out=out)


def build_tool(name):
    sdk = Path(os.environ.get("ANDROID_HOME") or os.environ["ANDROID_SDK_ROOT"])
    newest = max((sdk / "build-tools").iterdir(), key=lambda path: tuple(int(p) for p in re.findall(r"\d+", path.name)))
    for candidate in (name, name + ".exe", name + ".bat"):
        if (newest / candidate).is_file():
            return str(newest / candidate)
    raise FileNotFoundError(f"{name} in {newest}")


def tool_output(*command):
    return subprocess.run(command, check=True, capture_output=True, encoding="utf-8", errors="replace").stdout


def verify(apk, version, signatures):
    """The file is YouTube at that version, signed with one of Morphe's declared certificates."""
    badging = tool_output(build_tool("aapt2"), "dump", "badging", apk)
    package = re.search(r"package: name='([^']*)'.*?versionName='([^']*)'", badging)
    if not package or package.groups() != (YOUTUBE, version):
        sys.exit(f"Expected {YOUTUBE} {version}, the APK is {package.groups() if package else 'unreadable'}")
    certificates = tool_output(build_tool("apksigner"), "verify", "--print-certs", apk)
    digests = set(re.findall(r"certificate SHA-256 digest: ([0-9a-f]{64})", certificates))
    if not digests & set(signatures):
        sys.exit(f"Signed with {sorted(digests)}, none of Morphe's {signatures}")
    print(f"YouTube {version}, signed with {sorted(digests & set(signatures))[0]}")


def missing_names(resources_dump, names):
    present = set(re.findall(r"resource 0x[0-9a-f]+ (\S+)", resources_dump))
    return [name for name in names if name not in present]


def names(apk):
    """Every YouTube resource Jimaku looks up by name exists in this APK."""
    wanted = [line.strip() for line in NAMES.read_text(encoding="utf-8").splitlines() if line.strip()]
    missing = missing_names(tool_output(build_tool("aapt2"), "dump", "resources", apk), wanted)
    if missing:
        sys.exit("Missing in this YouTube version: " + ", ".join(missing))
    print(f"All {len(wanted)} names Jimaku looks up are present")


def main():
    command, *args = sys.argv[1:]
    if command == "download":
        download(*args)
    elif command == "verify":
        verify(args[0], args[1], json.loads(args[2]))
    elif command == "names":
        names(*args)
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
