#!/usr/bin/env python3
"""Checks every patched app for a newer public version and test-patches it.

For each app in the patch bundle, this script:

1. Reads the versions the bundle targets (Morphe CLI `list-patches`).
2. Reads the public versions on APKPure (apkeep). APKPure lists public
   releases only, so beta builds are not reported.
3. Asks Google Play which version it serves to an ordinary phone, using a
   throwaway account (PLAY_EMAIL, PLAY_AAS_TOKEN) or, without one, an
   anonymous login from Aurora Store's token dispenser. A newer APKPure
   version that Play does not serve yet is a staged rollout. It is still
   tested, because dev is for testing, and the issue says it is a rollout.
4. When APKPure has a newer version, downloads it and checks its signing
   certificate against the app's known-good certificate in
   .github/app-certs.json. APKPure has been found modifying apps, and a
   modified app cannot carry the developer's certificate, so a download
   whose certificate does not match is reported and not used. A matching
   download is checked for the Android TV build and patched with every patch
   for the app. Some apps share a package with their Android TV app, and
   APKPure can list only the TV build. Then the phone build Google Play
   serves is used instead: when Play still serves the targeted version, the
   app is up to date, and when Play serves a newer one, that download is
   checked and patched. Downloads are only patched on the runner, never
   installed.
5. Writes a Markdown and JSON report, and with --issues keeps one GitHub
   issue per app and version up to date: it opens "App update: <App>
   <version>", updates it on later runs, and closes it once the latest
   main release (--stable-mpp) targets that version. A version bumped on
   dev stays open for people to report how the pre-release works.

The design follows hxreborn's app update check
(https://github.com/hxreborn/morphe-patches, GPL-3.0). It does not bypass
any site's bot protection.
"""

import argparse
import functools
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.parse
import urllib.request
import zipfile
from pathlib import Path

ISSUE_LABEL = "app update"
REVIEW_LABEL = "needs review"
READY_LABEL = "ready to bump"
TESTING_LABEL = "testing on dev"
TITLE_PREFIX = "App update: "


def run(cmd, timeout=600):
    return subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)


def cli(args, cli_path):
    base = ["java", "-jar", cli_path] if cli_path.endswith(".jar") else [cli_path]
    return base + args


# ── Versions ────────────────────────────────────────────────────────────────

def version_key(version):
    """Numeric parts first, so 22.0.0.321 > 22.0.0.36 and 10.44.2 > 10.9.0."""
    return [int(part) for part in re.findall(r"\d+", version)]


RELEASE_DATE = re.compile(r"(\d{4})\.(\d{2})\.(\d{2})$")


def compare(a, b):
    """-1, 0, or 1 as version a is older than, the same as, or newer than b."""
    # Hulu's versions are "6.34.0+18552420-google", but APKPure lists only the
    # build part, "18552420-google". When only one side has a "+", compare the
    # build parts.
    if ("+" in a) != ("+" in b):
        a, b = a.split("+", 1)[-1], b.split("+", 1)[-1]
    key_a, key_b = version_key(a), version_key(b)
    if "+" not in a:
        # Disney+'s build parts are "rc3-2026.11.02": a release candidate number
        # that starts over with every version, then the build date. APKPure lists
        # only that part, so the date orders them, not the release candidate.
        # Its old releases, such as "3.5.0-rc4", have no date and are older.
        date_a, date_b = RELEASE_DATE.search(a), RELEASE_DATE.search(b)
        if date_a and date_b:
            key_a = [int(part) for part in date_a.groups()] + key_a
            key_b = [int(part) for part in date_b.groups()] + key_b
        elif date_a or date_b:
            return 1 if date_a else -1
    return (key_a > key_b) - (key_a < key_b)


def newer(a, b):
    return compare(a, b) > 0


version_order = functools.cmp_to_key(compare)


# ── The bundle ──────────────────────────────────────────────────────────────

def bundle_apps(cli_path, mpp):
    """{package: {"versions": set, "patches": [name, ...]}} from list-patches."""
    out = run(cli(["list-patches", f"--patches={mpp}", "-p", "-v", "-x", "-u=false"], cli_path)).stdout
    apps = {}
    for block in out.split("\nIndex: "):
        name = re.search(r"^Name: (.+)$", block, re.M)
        if not name:
            continue
        for package, versions in re.findall(
            r"Package name: (\S+)\s*\n\s*Compatible versions:\s*\n((?:\t\t.+\n?)*)", block
        ):
            app = apps.setdefault(package, {"versions": set(), "patches": []})
            app["versions"].update(v.strip() for v in versions.splitlines() if v.strip())
            if name.group(1) not in app["patches"]:
                app["patches"].append(name.group(1))
    return apps


def app_names(repo):
    """{package: name} from the patches' Constants.kt files (the first name wins)."""
    names = {}
    pattern = re.compile(r'name\s*=\s*"([^"]+)"\s*,\s*packageName\s*=\s*("[^"]+"|[A-Z_]+)', re.S)
    for path in sorted(Path(repo, "patches/src/main/kotlin").rglob("Constants.kt")):
        text = path.read_text()
        for name, package in pattern.findall(text):
            if not package.startswith('"'):
                # packageName = PACKAGE_NAME, a constant in the same file.
                constant = re.search(rf'{package}\s*=\s*"([^"]+)"', text)
                if not constant:
                    continue
                package = constant.group(1)
            names.setdefault(package.strip('"'), name)
    return names


# ── APKPure ─────────────────────────────────────────────────────────────────

def apkpure_versions(package):
    out = run(["apkeep", "-a", package, "-d", "apk-pure", "-l"], timeout=120).stdout
    match = re.search(r"\|\s*(.+)", out)
    return [v.strip() for v in match.group(1).split(",") if v.strip()] if match else []


DISPENSER_URL = "https://auroraoss.com/api/auth"
PLAY_DETAILS_URL = "https://android.clients.google.com/fdfe/details"


def proto_fields(buf):
    """The fields of a protobuf message, as {field number: [values]}."""
    fields, i = {}, 0
    while i < len(buf):
        key, i = proto_varint(buf, i)
        number, wire = key >> 3, key & 7
        if wire == 0:
            value, i = proto_varint(buf, i)
        elif wire == 2:
            size, i = proto_varint(buf, i)
            value, i = buf[i:i + size], i + size
        elif wire == 1:
            value, i = buf[i:i + 8], i + 8
        elif wire == 5:
            value, i = buf[i:i + 4], i + 4
        else:
            raise ValueError(f"unsupported wire type {wire}")
        fields.setdefault(number, []).append(value)
    return fields


def proto_varint(buf, i):
    result = shift = 0
    while True:
        byte = buf[i]
        i += 1
        result |= (byte & 0x7F) << shift
        shift += 7
        if not byte & 0x80:
            return result, i


class PlayStore:
    """The versions Google Play serves to an ordinary phone.

    With PLAY_EMAIL and PLAY_AAS_TOKEN set (a throwaway Google account that is
    not in any beta program), apkeep downloads the app from Play as a Pixel 9a
    and the version is read from the download. GitHub's runners use this,
    because Aurora's token dispenser refuses them.

    Without them, it logs in once with an anonymous account from Aurora Store's
    token dispenser, sending the Pixel 9a profile in
    .github/play-device.properties, and reads each app's details page.

    Staged rollouts reach only some devices, so a version Play does not serve
    to this phone is treated as not yet public.
    """

    def __init__(self, profile, aapt2=None, workdir=None):
        self.profile = profile
        self.aapt2 = aapt2
        self.workdir = workdir
        self.email = os.environ.get("PLAY_EMAIL")
        self.aas_token = os.environ.get("PLAY_AAS_TOKEN")
        self.auth = None
        self.error = None
        self.downloads = {}

    def account_version(self, package):
        """The versionName of the APK Play gives the throwaway account, or None.
        The download is kept for downloaded(package)."""
        folder = Path(tempfile.mkdtemp(dir=self.workdir, prefix="play-"))
        result = run(["apkeep", "-a", package, "-d", "google-play", "-e", self.email, "-t", self.aas_token,
                      "-o", "split_apk=true", str(folder)], timeout=900)
        base = next(folder.rglob(f"{package}.apk"), None)
        if base is None:
            # apkeep's output never contains the token, only the package and its error.
            print(f"  {package}: Google Play download failed: {(result.stdout + result.stderr).strip()[-300:]}",
                  flush=True)
            shutil.rmtree(folder, ignore_errors=True)
            return None
        self.downloads[package] = (folder, base)
        badging = run([self.aapt2, "dump", "badging", str(base)]).stdout
        found = re.search(r"versionName='([^']+)'", badging)
        return found.group(1) if found else None

    def downloaded(self, package):
        """(base APK, input to patch) of the phone build read by version(), or None.
        A split download is packed into one .apks archive for patching."""
        folder, base = self.downloads.get(package, (None, None))
        if base is None or not base.exists():
            return None
        splits = sorted(base.parent.glob("*.apk"))
        if len(splits) == 1:
            return base, base
        archive = folder / f"{package}.apks"
        with zipfile.ZipFile(archive, "w", zipfile.ZIP_STORED) as z:
            for split in splits:
                z.write(split, split.name)
        return base, archive

    def discard(self, package):
        """Deletes the kept download to free the runner's disk."""
        folder, _ = self.downloads.pop(package, (None, None))
        if folder is not None:
            shutil.rmtree(folder, ignore_errors=True)

    def login(self):
        props = {}
        for line in Path(self.profile).read_text().splitlines():
            line = line.strip()
            if line and not line.startswith("#") and "=" in line:
                key, value = line.split("=", 1)
                props[key] = value.replace("\\:", ":")
        request = urllib.request.Request(DISPENSER_URL, data=json.dumps(props).encode(), method="POST",
                                         headers={"Content-Type": "application/json",
                                                  "User-Agent": "com.aurora.store-4.8.3-75"})
        with urllib.request.urlopen(request, timeout=30) as response:
            self.auth = json.load(response)

    def version(self, package):
        """The versionName Play serves for the package, or None."""
        if self.email and self.aas_token:
            return self.account_version(package)
        if self.error:
            return None
        try:
            if self.auth is None:
                self.login()
        except Exception as e:
            self.error = f"Could not log in to Google Play: {e}"
            print(self.error, flush=True)
            return None
        request = urllib.request.Request(
            f"{PLAY_DETAILS_URL}?{urllib.parse.urlencode({'doc': package})}",
            headers={"Authorization": f"Bearer {self.auth['authToken']}",
                     "User-Agent": "Android-Finsky/41.2.29-23 (api=3,versionCode=84122900,sdk=35)",
                     "X-DFE-Device-Id": self.auth["gsfId"],
                     "X-DFE-Device-Config-Token": self.auth.get("deviceConfigToken", ""),
                     "X-DFE-Device-Checkin-Consistency-Token": self.auth.get("deviceCheckInConsistencyToken", ""),
                     "X-DFE-Client-Id": "am-android-google",
                     "Accept-Language": "en-US"})
        try:
            with urllib.request.urlopen(request, timeout=30) as response:
                body = response.read()
            # ResponseWrapper.payload.detailsResponse.item.details.appDetails.versionString
            message = body
            for number in (1, 2, 4, 13, 1):
                message = proto_fields(message)[number][0]
            return proto_fields(message)[4][0].decode()
        except Exception as e:
            print(f"  {package}: Google Play did not return a version ({e})", flush=True)
            return None


def download(package, version, workdir):
    target = Path(workdir, f"{package}-{version}")
    target.mkdir(parents=True, exist_ok=True)
    # apkeep requires the APKPure warning to be acknowledged; the certificate
    # check below is what makes a download trustworthy.
    run(["apkeep", "-a", f"{package}@{version}", "-d", "apk-pure", "-o", "acknowledge_dangers=true",
         str(target)], timeout=900)
    files = [p for p in target.iterdir() if p.suffix in (".apk", ".xapk")]
    if not files:
        return None
    path = files[0]
    if path.suffix == ".xapk":
        # An XAPK holds the base and split APKs; repack them as an .apks for the CLI.
        apks = target / f"{package}.apks"
        with zipfile.ZipFile(path) as source, zipfile.ZipFile(apks, "w") as dest:
            for entry in source.namelist():
                if entry.endswith(".apk"):
                    dest.writestr(Path(entry).name, source.read(entry))
        return apks
    return path


def base_apk(apk, tmp):
    """The base APK itself, or extracted from an .apks bundle."""
    if apk.suffix != ".apks":
        return apk
    with zipfile.ZipFile(apk) as bundle:
        names = [n for n in bundle.namelist() if "config." not in n and n.endswith(".apk")]
        if not names:
            return None
        base = Path(tmp, "base.apk")
        base.write_bytes(bundle.read(names[0]))
        return base


# apksigner's wording changes between build-tools versions: "Signer #1 certificate",
# "V3.0 Signer: certificate", and, for apps that rotated their key, a signer per
# Android version range such as "V3.1 Signer: (minSdkVersion=33, ...) certificate".
# Read every signer's digest whatever the wording, except Google Play's source stamp.
CERT_DIGEST = re.compile(r"^(?!Source Stamp)[^\n]*certificate SHA-256 digest: ([0-9a-f]{64})", re.M)


def signing_cert(apk, apksigner):
    """The SHA-256 digests of the APK's signing certificates, or None."""
    if not apksigner:
        return None
    with tempfile.TemporaryDirectory() as tmp:
        base = base_apk(apk, tmp)
        if base is None:
            print(f"  {apk.name}: no base APK found")
            return None
        result = run([apksigner, "verify", "--print-certs", str(base)])
        # Any signer matching the known certificate is enough.
        found = CERT_DIGEST.findall(result.stdout)
        if found:
            return found
        if result.returncode == 0:
            print(f"  {apk.name}: apksigner verified the APK, but its output format is not recognized:")
        else:
            print(f"  {apk.name}: apksigner could not verify the APK:")
        print("  " + (result.stdout + result.stderr).strip()[:1000])
        return None


def version_code(apk, aapt2):
    """The base APK's versionCode, or None."""
    if not aapt2:
        return None
    with tempfile.TemporaryDirectory() as tmp:
        base = base_apk(apk, tmp)
        if base is None:
            return None
        found = re.search(r"versionCode='(\d+)'", run([aapt2, "dump", "badging", str(base)]).stdout)
        return int(found.group(1)) if found else None


def version_name(apk, aapt2):
    """The base APK's versionName, or None."""
    if not aapt2:
        return None
    with tempfile.TemporaryDirectory() as tmp:
        base = base_apk(apk, tmp)
        if base is None:
            return None
        found = re.search(r"versionName='([^']+)'", run([aapt2, "dump", "badging", str(base)]).stdout)
        return found.group(1) if found else None


def is_tv_build(apk, aapt2):
    """True when the base APK declares the Android TV (leanback) feature."""
    if not aapt2:
        return None
    with tempfile.TemporaryDirectory() as tmp:
        base = base_apk(apk, tmp)
        if base is None:
            return None
        badging = run([aapt2, "dump", "badging", str(base)]).stdout
        return "android.software.leanback" in badging


# ── Patching ────────────────────────────────────────────────────────────────

def patch_check(apk, patches, cli_path, mpp, workdir):
    result = Path(workdir, apk.stem + "-result.json")
    args = ["patch", f"--patches={mpp}", "--exclusive", "-f", "--continue-on-error",
            "-r", str(result), "-o", str(Path(workdir, apk.stem + "-patched.apk"))]
    for name in patches:
        args += ["-e", name]
    process = run(cli(args + [str(apk)], cli_path), timeout=1800)
    if not result.exists():
        return {"applied": [], "failed": [], "error": (process.stdout + process.stderr)[-1500:]}
    data = json.loads(result.read_text())
    failed = [f if isinstance(f, str) else f.get("name") for f in data.get("failedPatches") or []]
    applied = [a if isinstance(a, str) else a.get("name") for a in data.get("appliedPatches") or []]
    return {"applied": applied, "failed": failed}


# ── Report ──────────────────────────────────────────────────────────────────

def check(apps, names, certs, cli_path, mpp, workdir, aapt2, apksigner, only, keep_dir, play):
    results = []
    for package in sorted(apps, key=lambda p: names.get(p, p).lower()):
        if only and package not in only:
            continue
        app = apps[package]
        pinned = max(app["versions"], key=version_order) if app["versions"] else None
        record = {"package": package, "name": names.get(package, package), "pinned": pinned,
                  "targets": sorted(app["versions"], key=version_order)}
        public = apkpure_versions(package)
        candidates = sorted((v for v in public if not pinned or newer(v, pinned)), key=version_order, reverse=True)
        if not public:
            record["status"] = "not on APKPure"
        elif not candidates:
            record["status"] = "up to date"
            record["latest"] = max(public, key=version_order)
        else:
            # Google Play's version for an ordinary phone shows whether the newer
            # APKPure version is out to everyone or still a staged rollout. Dev is
            # for testing, so a rollout is still tested and can be bumped there;
            # the issue and the dev commit say it is a rollout.
            record["play"] = play.version(package)
        if candidates:
            # Some apps share a package with their Android TV app, whose version
            # numbers can sort above the phone app's (Tubi's TV build is 10.44.5000).
            # The newest phone build is used, trying up to three versions.
            first_tv = None
            for version in candidates[:3]:
                outcome = check_version(package, version, app, certs, cli_path, mpp, workdir, aapt2,
                                        apksigner, keep_dir)
                if outcome.get("tv_build"):
                    record.setdefault("tv_builds_skipped", []).append(version)
                    first_tv = first_tv or (version, outcome)
                    continue
                # APKPure can shorten the name (Disney+'s "rc1-2026.11.20"), so the
                # report uses the version name inside the APK, which the pin needs.
                latest = outcome.get("version_name") or version
                served = record.get("play")
                record.update(outcome, status="update", latest=latest,
                              rollout=served is not None and newer(latest, served))
                break
            else:
                # APKPure has only the Android TV build of the newer versions, as it
                # does for ABC News, Peacock, and Tubi. The phone build Google Play
                # serves decides instead.
                served = record.get("play")
                if served and pinned and not newer(served, pinned):
                    record.update(status="up to date", latest=served)
                elif served and (found := play.downloaded(package)):
                    base, patch_input = found
                    outcome = inspect_apk(package, base, patch_input, app, certs, cli_path, mpp, workdir,
                                          aapt2, apksigner, keep_dir)
                    record.update(outcome, status="update", source="Google Play",
                                  latest=outcome.get("version_name") or served, rollout=False)
                elif first_tv:
                    # Play's version is unknown, so the update is reported for review.
                    version, outcome = first_tv
                    record.update(outcome, status="update", latest=outcome.get("version_name") or version)
            play.discard(package)
        print(f"{record['name']}: {record['status']} {record.get('latest', '')}", flush=True)
        results.append(record)
    return results


def check_version(package, version, app, certs, cli_path, mpp, workdir, aapt2, apksigner, keep_dir):
    """Downloads one version from APKPure, checks its certificate and build, and test-patches it."""
    apk = download(package, version, workdir)
    if apk is None:
        return {"download": "failed"}
    outcome = inspect_apk(package, apk, apk, app, certs, cli_path, mpp, workdir, aapt2, apksigner, keep_dir)
    # Free the runner's disk before the next download.
    shutil.rmtree(apk.parent, ignore_errors=True)
    return outcome


def inspect_apk(package, apk, patch_input, app, certs, cli_path, mpp, workdir, aapt2, apksigner, keep_dir):
    """Checks a download's certificate and build, and test-patches patch_input
    (the APK itself, or an .apks archive of its splits)."""
    outcome = {}
    digest = signing_cert(apk, apksigner)
    known = certs.get(package, [])
    outcome["cert"] = ("unreadable" if digest is None else "no known certificate" if not known
                       else "matches" if set(digest) & set(known) else "does not match")
    outcome["cert_digest"] = digest
    if outcome["cert"] != "does not match":
        outcome["tv_build"] = is_tv_build(apk, aapt2)
        outcome["version_code"] = version_code(apk, aapt2)
        outcome["version_name"] = version_name(apk, aapt2)
        if not outcome["tv_build"]:
            outcome["patches"] = patch_check(patch_input, app["patches"], cli_path, mpp, workdir)
            patched = Path(workdir, patch_input.stem + "-patched.apk")
            if fully_patched(outcome) and patched.exists():
                # Kept for the launch check on an emulator.
                keep_dir.mkdir(parents=True, exist_ok=True)
                shutil.move(str(patched), keep_dir / f"{package}.apk")
                outcome["patched_apk"] = f"{package}.apk"
    for leftover in Path(workdir).glob(patch_input.stem + "-*"):
        leftover.unlink(missing_ok=True)
    return outcome


def fully_patched(record):
    patches = record.get("patches") or {}
    return bool(patches.get("applied")) and not patches.get("failed") and not patches.get("error") \
        and record.get("cert") != "does not match"


def summary_cell(record):
    patches = record.get("patches")
    if record.get("download") == "failed":
        return "download failed"
    if record.get("cert") == "does not match":
        return "certificate does not match, not used"
    if not patches:
        return ""
    if patches.get("error"):
        return "patching did not run"
    total = len(patches["applied"]) + len(patches["failed"])
    text = f"{len(patches['applied'])}/{total} applied"
    if patches["failed"]:
        text += ", failed: " + ", ".join(patches["failed"])
    return text


def render(results):
    lines = ["# App updates", "", "| App | Targeted | APKPure | Patches | Status |",
             "|-----|----------|---------|---------|--------|"]
    for r in results:
        if r["status"] != "update":
            continue
        build = " (Android TV build)" if r.get("tv_build") else ""
        build += " (staged rollout)" if r.get("rollout") else ""
        flag = "needs review" if review_reasons(r) else "ready to bump"
        lines.append(f"| {r['name']} | `{r['pinned']}` | `{r['latest']}`{build} | {summary_cell(r)} | {flag} |")
    if len(lines) == 4:
        lines.append("| Every app is up to date. | | | | |")
    missing = [r["name"] for r in results if r["status"] == "not on APKPure"]
    if missing:
        lines += ["", "Not on APKPure: " + ", ".join(missing) + "."]
    return "\n".join(lines) + "\n"


# ── Issues ──────────────────────────────────────────────────────────────────

def gh(*args, stdin=None):
    process = subprocess.run(["gh", *args], input=stdin, capture_output=True, text=True)
    if process.returncode != 0:
        print(process.stderr, file=sys.stderr)
    return process.stdout


def review_reasons(r):
    """What needs a person's attention before the pin can move to this version."""
    reasons = []
    patches = r.get("patches") or {}
    if r.get("download") == "failed":
        reasons.append("The download from APKPure failed. Get this version from Google Play or APKMirror and test it.")
    if r.get("cert") == "does not match":
        reasons.append("The download's signing certificate does not match the developer's. Do not trust this file; "
                       "get this version from Google Play or APKMirror.")
    elif r.get("cert") == "no known certificate":
        reasons.append("No known-good certificate is recorded for this app, so the download could not be verified. "
                       "Record one with .github/scripts/record_certs.py from a Google Play copy.")
    elif r.get("cert") == "unreadable":
        reasons.append("The download's signing certificate could not be read.")
    if patches.get("error"):
        reasons.append("Patching did not run. Check the log below.")
    for name in patches.get("failed", []):
        reasons.append(f"The patch \"{name}\" failed on this version and needs an update.")
    if r.get("tv_build"):
        reasons.append("APKPure serves the Android TV build for this version. Check whether the phone build "
                       "also updated before moving the phone pin.")
    return reasons


def play_note(r):
    if r.get("play") is None:
        return "its version could not be read"
    if r.get("rollout"):
        return (f"serves `{r['play']}` to an ordinary phone, so `{r['latest']}` is a staged rollout "
                "that has not reached everyone yet")
    return f"serves `{r['play']}` to an ordinary phone, so this version is out to everyone"


def issue_body(r):
    build = "Android TV build" if r.get("tv_build") else "phone build" if r.get("tv_build") is False else "not checked"
    lines = [
        f"A newer public version of {r['name']} is on {r.get('source', 'APKPure')}.",
        "",
        f"- Package: `{r['package']}`",
        f"- Targeted by the patches: {', '.join(f'`{v}`' for v in r['targets'])}",
        f"- On {r.get('source', 'APKPure')}: `{r['latest']}` ({build})",
        f"- Google Play: {play_note(r)}.",
    ]
    if r.get("cert"):
        cert = {
            "matches": "matches the developer's known certificate",
            "does not match": "does NOT match the developer's known certificate. This download may be "
                              "modified, so it was not used. Get this version from Google Play or APKMirror instead",
            "no known certificate": "not checked, because no known-good certificate is recorded yet",
            "unreadable": "could not be read",
        }[r["cert"]]
        lines.append(f"- Signing certificate: {cert}.")
    patches = r.get("patches")
    if r.get("download") == "failed":
        lines.append("- Test patch: the download failed.")
    elif patches and patches.get("error"):
        lines += ["- Test patch: patching did not run.", "", "```", patches["error"].strip(), "```"]
    elif patches:
        lines.append(f"- Test patch: {summary_cell(r)}.")
        if patches["applied"]:
            lines += ["", "Applied:", *[f"- {name}" for name in patches["applied"]]]
        if patches["failed"]:
            lines += ["", "Failed:", *[f"- {name}" for name in patches["failed"]]]
    reasons = review_reasons(r)
    lines += ["", "## What to do", ""]
    if reasons:
        lines += [f"- [ ] {reason}" for reason in reasons]
    else:
        lines.append(f"- [ ] Every patch applied. Test it on a device, then move the pin to `{r['latest']}`.")
    lines += ["", "This issue is updated by the app update check and closes when a main release targets this version."]
    return "\n".join(lines) + "\n"


def set_review(number, needs_review, owner):
    """Labels the issue, and assigns it to the owner when it needs their review."""
    if needs_review:
        gh("issue", "edit", str(number), "--add-label", REVIEW_LABEL, "--remove-label", READY_LABEL,
           *(["--add-assignee", owner] if owner else []))
    else:
        gh("issue", "edit", str(number), "--add-label", READY_LABEL, "--remove-label", REVIEW_LABEL)


def sync_issues(results, owner, stable=None):
    """stable maps each package to the newest version the latest main release
    targets. An issue closes only when a main release targets its version, so
    a version bumped on dev stays open, labeled "testing on dev", for people
    to report how the pre-release works."""
    gh("label", "create", ISSUE_LABEL, "--force", "--color", "FBCA04",
       "--description", "A newer app version is available")
    gh("label", "create", REVIEW_LABEL, "--force", "--color", "D93F0B",
       "--description", "An app update needs a manual check or patch edit")
    gh("label", "create", READY_LABEL, "--force", "--color", "0E8A16",
       "--description", "Every patch applied to the new version")
    gh("label", "create", TESTING_LABEL, "--force", "--color", "1D76DB",
       "--description", "In a dev pre-release; comment with how it works on your device")
    issues = json.loads(gh("issue", "list", "--label", ISSUE_LABEL, "--state", "open", "--limit", "500",
                           "--json", "number,title") or "[]")
    for r in results:
        prefix = f"{TITLE_PREFIX}{r['name']} "
        mine = [i for i in issues if i["title"].startswith(prefix)]
        released = (stable or {}).get(r["package"], r["pinned"])
        for issue in mine:
            version = issue["title"][len(prefix):]
            if released and not newer(version, released):
                gh("issue", "close", str(issue["number"]), "--reason", "completed", "--comment",
                   f"The latest main release targets {r['name']} `{released}`, so this is closed.")
        tv_only = [v for v in r.get("tv_builds_skipped", []) if r["status"] != "update" or v != r.get("latest")]
        for issue in mine:
            version = issue["title"][len(prefix):]
            if version in tv_only and (not released or newer(version, released)):
                phone = (f"Google Play serves the phone build `{r['latest']}`, which has its own issue"
                         if r["status"] == "update" else
                         f"Google Play still serves {r['name']} `{r.get('play') or r['pinned']}` to phones")
                gh("issue", "close", str(issue["number"]), "--reason", "not planned", "--comment",
                   f"`{version}` is the Android TV build, and the patches target the phone app. {phone}, "
                   "so this is closed.")
        if r["status"] != "update":
            continue
        title = prefix + r["latest"]
        still_open = [i for i in mine if r["pinned"] is None or newer(i["title"][len(prefix):], r["pinned"])]
        if still_open:
            number = still_open[0]["number"]
            gh("issue", "edit", str(number), "--title", title, "--body-file", "-", stdin=issue_body(r))
        else:
            url = gh("issue", "create", "--title", title, "--label", ISSUE_LABEL, "--body-file", "-",
                     stdin=issue_body(r)).strip()
            number = url.rsplit("/", 1)[-1] if url else None
        if number:
            set_review(number, bool(review_reasons(r)), owner)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--cli", required=True, help="Morphe CLI jar, or the morphe command")
    parser.add_argument("--mpp", required=True, help="patch bundle (.mpp)")
    parser.add_argument("--repo", default=".", help="checkout of this repository")
    parser.add_argument("--aapt2", default=shutil.which("aapt2"), help="aapt2, to tell TV builds apart")
    parser.add_argument("--apksigner", default=shutil.which("apksigner"), help="apksigner, to read certificates")
    parser.add_argument("--certs", default=".github/app-certs.json", help="known-good certificates")
    parser.add_argument("--play-device", default=".github/play-device.properties",
                        help="device profile for the anonymous Google Play login")
    parser.add_argument("--only", default="", help="comma-separated package names")
    parser.add_argument("--out", default="app-updates")
    parser.add_argument("--workdir", default=tempfile.mkdtemp(prefix="app-updates-"))
    parser.add_argument("--issues", action="store_true", help="open, update, and close GitHub issues")
    parser.add_argument("--stable-mpp", help="the latest main release's bundle, which decides when issues close "
                        "(default: --mpp)")
    args = parser.parse_args()

    only = {p.strip() for p in args.only.split(",") if p.strip()}
    apps = bundle_apps(args.cli, args.mpp)
    if not apps:
        sys.exit("No apps found in the patch bundle.")
    certs_path = Path(args.certs)
    certs = json.loads(certs_path.read_text()) if certs_path.exists() else {}
    out = Path(args.out)
    results = check(apps, app_names(args.repo), certs, args.cli, args.mpp, args.workdir,
                    args.aapt2, args.apksigner, only, out / "patched", PlayStore(args.play_device, args.aapt2, args.workdir))

    out.mkdir(parents=True, exist_ok=True)
    (out / "app-updates.json").write_text(json.dumps(results, indent=2))
    (out / "app-updates.md").write_text(render(results))
    if args.issues:
        stable_apps = bundle_apps(args.cli, args.stable_mpp) if args.stable_mpp else apps
        stable = {p: max(a["versions"], key=version_order) for p, a in stable_apps.items() if a["versions"]}
        sync_issues(results, os.environ.get("GITHUB_REPOSITORY_OWNER"), stable)


if __name__ == "__main__":
    main()
