#!/usr/bin/env python3
"""Checks a release before and after it is published, so Morphe Manager is
never sent to a bundle that is missing or broken.

Morphe Manager reads patches-bundle.json from the branch, follows its
download_url to the .mpp on the GitHub release, and checks the bundle's
signature against public_key. semantic-release commits patches-bundle.json and
pushes the tag before it creates the GitHub release, so a failure in between
leaves the branch pointing at a release that does not exist. That happened to
v1.2.0-dev.10, when GitHub refused to store semantic-release's git note.

    built      Runs as semantic-release's prepare step, after the bundle is
               built and before anything is pushed. Fails the release when
               patches-bundle.json or the .mpp is wrong.

        python3 .github/scripts/check_release.py built --version 1.2.0-dev.11

    published  Runs after the Release step, even when it failed. Reads
               patches-bundle.json from the branch on GitHub and checks that
               its release, its .mpp, and the .mpp's version and signature all
               match. With --repair, a missing release or .mpp is published
               from the bundle this run built, after the same checks.

        python3 .github/scripts/check_release.py published --branch dev --repair
"""

import argparse
import base64
import hashlib
import json
import os
import struct
import subprocess
import sys
import tempfile
import urllib.error
import urllib.request
import zipfile
from pathlib import Path

MAGIC = "MorpheSig1"
BUNDLE_JSON = Path("patches-bundle.json")
PUBLIC_KEY = Path("morphe-signing.pub")
LIBS = Path("patches/build/libs")


class ReleaseError(Exception):
    pass


def expected_url(repo, version):
    return f"https://github.com/{repo}/releases/download/v{version}/patches-{version}.mpp"


def check_bundle_json(bundle, version, repo, public_key):
    """Problems with patches-bundle.json for this version, as a list."""
    problems = []
    if bundle.get("version") != version:
        problems.append(f"patches-bundle.json has version {bundle.get('version')!r}, not {version!r}")
    if bundle.get("download_url") != expected_url(repo, version):
        problems.append(f"patches-bundle.json download_url is {bundle.get('download_url')!r}, "
                        f"not {expected_url(repo, version)!r}")
    if bundle.get("public_key") != public_key:
        problems.append("patches-bundle.json public_key does not match morphe-signing.pub")
    return problems


def manifest_version(data):
    """The Version line of the bundle's META-INF/MANIFEST.MF, or None."""
    with tempfile.TemporaryFile() as tmp:
        tmp.write(data)
        tmp.seek(0)
        with zipfile.ZipFile(tmp) as bundle:
            bad = bundle.testzip()
            if bad:
                raise ReleaseError(f"the .mpp entry {bad} is damaged")
            names = bundle.namelist()
            if not any(n.endswith(".dex") for n in names):
                raise ReleaseError("the .mpp has no .dex file, so it was not built for Android")
            if "META-INF/MANIFEST.MF" not in names:
                raise ReleaseError("the .mpp has no META-INF/MANIFEST.MF")
            manifest = bundle.read("META-INF/MANIFEST.MF").decode("utf-8", "replace").replace("\r\n", "\n")
    # Manifest lines longer than 72 bytes continue on the next line after a space.
    manifest = manifest.replace("\n ", "")
    for line in manifest.split("\n"):
        if line.startswith("Version:"):
            return line.split(":", 1)[1].strip()
    return None


def signature_problem(data, public_key):
    """Why the bundle's signature is not valid for public_key, or None.

    The Morphe Gradle plugin signs SHA-256 of the whole file, with the zip
    comment length set to 0 and no comment, prefixed with "MorpheSig1". The zip
    comment then holds "MorpheSig1 <public key> <signature>", both base64."""
    eocd = data.rfind(b"PK\x05\x06")
    if eocd < 0 or eocd + 22 > len(data):
        return "it is not a zip file"
    length = struct.unpack("<H", data[eocd + 20:eocd + 22])[0]
    comment = data[eocd + 22:eocd + 22 + length].decode("ascii", "replace").split()
    if len(comment) != 3 or comment[0] != MAGIC:
        return "it is not signed (no MorpheSig1 zip comment)"
    if comment[1] != public_key:
        return "it is signed with a different key than morphe-signing.pub"
    try:
        from cryptography.exceptions import InvalidSignature
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey
    except ImportError:
        return "the cryptography package is not installed, so the signature could not be checked"
    digest = hashlib.sha256(data[:eocd + 20] + b"\0\0").digest()
    try:
        Ed25519PublicKey.from_public_bytes(base64.b64decode(public_key)).verify(
            base64.b64decode(comment[2]), MAGIC.encode() + digest)
    except (InvalidSignature, ValueError):
        return "its signature does not verify"
    return None


def check_mpp(data, version, public_key, name):
    """Problems with one .mpp file, as a list."""
    try:
        found = manifest_version(data)
    except (ReleaseError, zipfile.BadZipFile) as e:
        return [f"{name}: {e}"]
    problems = []
    if found != version:
        problems.append(f"{name}: its manifest says version {found!r}, not {version!r}")
    why = signature_problem(data, public_key)
    if why:
        problems.append(f"{name}: {why}")
    return problems


def built_mpps(libs):
    return sorted(libs.glob("patches-*.mpp")) if libs.exists() else []


def check_built(version, repo, root=Path(".")):
    """Problems with this run's patches-bundle.json and .mpp, as a list."""
    public_key = (root / PUBLIC_KEY).read_text().strip()
    bundle = json.loads((root / BUNDLE_JSON).read_text())
    problems = check_bundle_json(bundle, version, repo, public_key)
    mpps = built_mpps(root / LIBS)
    names = [p.name for p in mpps]
    if names != [f"patches-{version}.mpp"]:
        # The GitHub release uploads every patches-*.mpp, so a second one would be published too.
        problems.append(f"{LIBS} holds {names or 'no .mpp'}, not only patches-{version}.mpp")
    for mpp in mpps:
        if mpp.name == f"patches-{version}.mpp":
            problems += check_mpp(mpp.read_bytes(), version, public_key, mpp.name)
    return problems


def run(cmd, check=True):
    result = subprocess.run(cmd, capture_output=True, text=True)
    if check and result.returncode:
        raise ReleaseError(f"{' '.join(cmd[:3])} failed: {result.stderr.strip() or result.stdout.strip()}")
    return result


def gh_json(path):
    """A GitHub API response, or None for 404."""
    result = run(["gh", "api", path], check=False)
    if result.returncode:
        if "404" in result.stderr or "Not Found" in result.stderr:
            return None
        raise ReleaseError(f"gh api {path} failed: {result.stderr.strip()}")
    return json.loads(result.stdout)


def download(url):
    request = urllib.request.Request(url, headers={"User-Agent": "release-check"})
    try:
        with urllib.request.urlopen(request, timeout=120) as response:
            return response.read()
    except urllib.error.HTTPError as e:
        raise ReleaseError(f"{url} returned HTTP {e.code}")
    except (urllib.error.URLError, TimeoutError) as e:
        raise ReleaseError(f"{url} could not be downloaded: {e}")


def remote_ref(ref):
    return run(["git", "ls-remote", "origin", ref]).stdout.strip() != ""


def push_target(repo):
    """Where to push: with GH_TOKEN, the token semantic-release pushes with."""
    token = os.environ.get("GH_TOKEN")
    return f"https://x-access-token:{token}@github.com/{repo}.git" if token else "origin"


def branch_bundle(branch):
    run(["git", "fetch", "--quiet", "origin", branch])
    return json.loads(run(["git", "show", f"origin/{branch}:{BUNDLE_JSON}"]).stdout)


def check_published(branch, repo, public_key, bundle):
    """Problems with the release that the branch's patches-bundle.json names.
    Returns (problems, release or None)."""
    version = bundle.get("version", "")
    tag = f"v{version}"
    problems = check_bundle_json(bundle, version, repo, public_key)
    release = gh_json(f"repos/{repo}/releases/tags/{tag}")
    if release is None:
        return problems + [f"patches-bundle.json on {branch} names {tag}, but there is no GitHub release {tag}"], None
    if release.get("draft"):
        problems.append(f"the GitHub release {tag} is still a draft")
    if bool(release.get("prerelease")) != (branch != "main"):
        problems.append(f"the GitHub release {tag} is {'' if release.get('prerelease') else 'not '}a pre-release")
    if not remote_ref(f"refs/notes/semantic-release-{tag}"):
        # semantic-release reads the release channel from this note. Without it,
        # the next release on the branch may not count this one.
        problems.append(f"the git note refs/notes/semantic-release-{tag} is not on GitHub")
    asset = f"patches-{version}.mpp"
    if asset not in [a["name"] for a in release.get("assets", [])]:
        return problems + [f"the GitHub release {tag} has no {asset}"], release
    try:
        data = download(bundle["download_url"])
    except ReleaseError as e:
        return problems + [str(e)], release
    return problems + check_mpp(data, version, public_key, asset), release


def repair(branch, repo, public_key, bundle, release):
    """Publishes the release or the .mpp that is missing, from this run's build."""
    version = bundle["version"]
    tag = f"v{version}"
    local = LIBS / f"patches-{version}.mpp"
    if not local.exists():
        raise ReleaseError(f"{local} was not built in this run, so {tag} cannot be repaired here")
    problems = check_mpp(local.read_bytes(), version, public_key, local.name)
    if problems:
        raise ReleaseError("the bundle this run built is wrong too: " + "; ".join(problems))
    if not remote_ref(f"refs/tags/{tag}"):
        raise ReleaseError(f"the tag {tag} is not on GitHub, so its release cannot be created")
    note = f"refs/notes/semantic-release-{tag}"
    if not remote_ref(note):
        channel = json.dumps({"channels": [None if branch == "main" else branch]}, separators=(",", ":"))
        run(["git", "notes", "--ref", f"semantic-release-{tag}", "add", "--force", "-m", channel, tag])
        run(["git", "push", push_target(repo), f"{note}:{note}"])
        print(f"Pushed the missing git note {note}: {channel}")
    if release is None:
        with tempfile.NamedTemporaryFile("w", suffix=".md", delete=False) as notes:
            notes.write(bundle.get("description") or tag)
        cmd = ["gh", "release", "create", tag, str(local), "--repo", repo, "--verify-tag", "--title", tag,
               "--notes-file", notes.name]
        if branch != "main":
            cmd.append("--prerelease")
        else:
            cmd.append("--latest")
        run(cmd)
        print(f"Created the missing GitHub release {tag} with {local.name}.")
    else:
        if local.name not in [a["name"] for a in release.get("assets", [])]:
            run(["gh", "release", "upload", tag, str(local), "--repo", repo])
            print(f"Uploaded {local.name} to the GitHub release {tag}.")


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = parser.add_subparsers(dest="mode", required=True)
    built = sub.add_parser("built")
    built.add_argument("--version", required=True)
    published = sub.add_parser("published")
    published.add_argument("--branch", required=True)
    published.add_argument("--repair", action="store_true")
    parser.add_argument("--repo", default=os.environ.get("GITHUB_REPOSITORY", "semicoloncolonel/tv-morphe-patches"))
    args = parser.parse_args()

    if args.mode == "built":
        problems = check_built(args.version, args.repo)
        if problems:
            print("The release was stopped before anything was pushed:", *problems, sep="\n- ")
            return 1
        print(f"patches-bundle.json and patches-{args.version}.mpp are ready to release.")
        return 0

    public_key = PUBLIC_KEY.read_text().strip()
    try:
        bundle = branch_bundle(args.branch)
        problems, release = check_published(args.branch, args.repo, public_key, bundle)
        if problems and args.repair:
            print("Found:", *problems, sep="\n- ")
            repair(args.branch, args.repo, public_key, bundle, release)
            problems, _ = check_published(args.branch, args.repo, public_key, bundle)
    except ReleaseError as e:
        problems = [str(e)]
    if problems:
        print(f"Morphe Manager cannot use the bundle that {args.branch} names:", *problems, sep="\n- ")
        return 1
    print(f"{args.branch} names v{bundle['version']}, and its release and signed .mpp check out.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
