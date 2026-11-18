#!/usr/bin/env python3
"""Exercise release preparation boundaries without builds, network or project writes.

Run: python3 scripts/check_release.py
"""

import base64
import hashlib
import json
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

from prepare_release import package_url
from publish_release import validate_distribution


VERSION = "1.0.0"
PROJECT = "https://gitlab.com/solo-patches/solo-patches"


def main():
    script = Path(__file__).with_name("prepare_release.py")
    with tempfile.TemporaryDirectory(prefix="solo-release-check-") as directory:
        folder = Path(directory)
        bundle = folder / "input.mpp"
        patch_list = folder / "patches-list.json"
        key = folder / "morphe-signing.pub"
        notes = folder / "notes.txt"
        public_key = base64.b64encode(bytes(range(32))).decode("ascii")
        # Structural fixture only: signing belongs to the pinned plugin and verification to Patcher.
        signature = base64.b64encode(bytes(range(64))).decode("ascii")
        key.write_text(public_key + "\n", encoding="ascii")
        notes.write_text("Candidate notes.\n", encoding="utf-8")
        data = {"version": VERSION, "patches": [{"name": "Hide ads", "description": "Hide ads.", "default": True}]}
        patch_list.write_text(json.dumps(data), encoding="utf-8")

        def make_bundle(version=VERSION, comment=None, dex=True):
            with zipfile.ZipFile(bundle, "w") as archive:
                folded = version[:3] + "\r\n " + version[3:]
                archive.writestr("META-INF/MANIFEST.MF", f"Manifest-Version: 1.0\r\nVersion: {folded}\r\n\r\nName: fixture\r\nVersion: not-main\r\n\r\n")
                if dex:
                    archive.writestr("classes.dex", b"dex\n039\0fixture")
                archive.comment = (comment if comment is not None else f"MorpheSig1 {public_key} {signature}").encode("ascii")

        def run(output, *extra, good=True):
            result = subprocess.run([
                sys.executable, str(script), "--tag", f"v{VERSION}", "--project-url", PROJECT,
                "--bundle", str(bundle),
                "--patch-list", str(patch_list), "--public-key", str(key), "--notes", str(notes),
                "--output", str(output), *extra,
            ], capture_output=True, text=True, timeout=10)
            assert (result.returncode == 0) == good, result.stderr
            if not good:
                assert not output.exists(), "Rejected input created release output"
            return result

        make_bundle()
        output = folder / "dist"
        run(output)
        expected = {f"patches-{VERSION}.mpp", "patches-list.json", "patches-bundle.json", "morphe-signing.pub", "SHA256SUMS", "release-notes.md"}
        assert {entry.name for entry in output.iterdir()} == expected, "Unexpected distributable or missing asset"
        assert (output / f"patches-{VERSION}.mpp").read_bytes() == bundle.read_bytes(), "Signed bundle bytes changed"
        metadata = json.loads((output / "patches-bundle.json").read_text(encoding="utf-8"))
        assert metadata["version"] == VERSION
        assert metadata["download_url"] == f"{PROJECT}/-/releases/v{VERSION}/downloads/patches-{VERSION}.mpp"
        assert metadata["page_url"] == f"{PROJECT}/-/releases/v{VERSION}"
        assert metadata["public_key"] == public_key
        assert not metadata["created_at"].endswith("Z") and "+" not in metadata["created_at"], "Manager expects offset-free UTC LocalDateTime"
        assert metadata["description"].startswith(f"# Solo Patches v{VERSION}\n") and "Candidate notes." in metadata["description"]
        checksums = (output / "SHA256SUMS").read_text(encoding="ascii").splitlines()
        assert len(checksums) == len(expected) - 1
        for line in checksums:
            digest, name = line.split("  ", 1)
            assert name in expected - {"SHA256SUMS"}
            assert hashlib.sha256((output / name).read_bytes()).hexdigest() == digest

        # Root metadata can be committed explicitly; CI must reproduce it rather than relabel it.
        source = output / "patches-bundle.json"
        repeat = folder / "repeat"
        run(repeat, "--source-metadata", str(source))
        assert (repeat / "patches-bundle.json").read_bytes() == source.read_bytes()
        altered = folder / "source.json"
        for field, value in (("version", "9.0.0"), ("download_url", "https://example.com/wrong.mpp"), ("created_at", "2026-11-10T00:00:00Z"), ("public_key", "invalid")):
            changed = dict(metadata, **{field: value})
            altered.write_text(json.dumps(changed), encoding="utf-8")
            run(folder / f"bad-source-{field}", "--source-metadata", str(altered), good=False)

        for index, extra in enumerate((
            ("--tag", "v1.0"), ("--tag", "v01.0.0"), ("--tag", "v1.0.0-beta.1"),
            ("--tag", "../v1.0.0"), ("--project-url", "http://gitlab.com/solo/patches"),
            ("--project-url", PROJECT + "?x=1"), ("--project-url", PROJECT + "/../other"),
            ("--project-url", "https://gitlab.com//solo-patches/solo-patches"),
        )):
            run(folder / f"bad-argument-{index}", *extra, good=False)
        for api, project_id in (("https://example.com/api/v4", "123"), ("https://gitlab.com/api/v4", "../123")):
            try:
                package_url(api, project_id, PROJECT, VERSION)
            except ValueError:
                pass
            else:
                raise AssertionError("Unsafe package API coordinates were accepted")

        make_bundle(version="1.0.1")
        run(folder / "bad-manifest", good=False)
        make_bundle(dex=False)
        run(folder / "bad-android", good=False)
        for index, comment in enumerate(("", "MorpheSig1 bad bad", f"MorpheSig1 {base64.b64encode(bytes(32)).decode('ascii')} {signature}")):
            make_bundle(comment=comment)
            run(folder / f"bad-signature-{index}", good=False)
        make_bundle()
        for index, changed in enumerate(({"version": "1.0.1", "patches": data["patches"]}, {"version": VERSION, "patches": []}, {"version": VERSION, "patches": data["patches"] * 2})):
            patch_list.write_text(json.dumps(changed), encoding="utf-8")
            run(folder / f"bad-patch-list-{index}", good=False)
        patch_list.write_text(json.dumps(data), encoding="utf-8")
        assert validate_distribution(output, f"v{VERSION}", PROJECT, source)[0] == VERSION
        unexpected = output / "stock.apk"
        unexpected.write_bytes(b"not a distributable")
        try:
            validate_distribution(output, f"v{VERSION}", PROJECT, source)
        except ValueError:
            pass
        else:
            raise AssertionError("Unexpected APK was accepted for publication")
        unexpected.unlink()
        staged_list = output / "patches-list.json"
        original_list = staged_list.read_bytes()
        staged_list.write_text(json.dumps(dict(data, patches=[dict(data["patches"][0], description="tampered")])) + "\n", encoding="utf-8")
        try:
            validate_distribution(output, f"v{VERSION}", PROJECT, source)
        except ValueError:
            pass
        else:
            raise AssertionError("Modified distributable passed checksum validation")
        staged_list.write_bytes(original_list)
        refused = subprocess.run([sys.executable, str(script.with_name("publish_release.py")), "--tag", f"v{VERSION}", "--directory", str(output)],
                                 env={}, capture_output=True, text=True, timeout=10)
        assert refused.returncode != 0 and "GITLAB_TOKEN is required" in refused.stderr, "Publication ran without a GitLab token"
        before = {path.name: path.read_bytes() for path in output.iterdir()}
        result = subprocess.run([
            sys.executable, str(script), "--tag", f"v{VERSION}", "--project-url", PROJECT,
            "--bundle", str(bundle),
            "--patch-list", str(patch_list), "--public-key", str(key), "--notes", str(notes), "--output", str(output),
        ], capture_output=True, text=True, timeout=10)
        assert result.returncode != 0, "Existing immutable output was overwritten"
        assert before == {path.name: path.read_bytes() for path in output.iterdir()}, "Rejected overwrite changed output"
    print("PASS: release versions, Manager metadata, signed-byte preservation, checksums and immutable output boundaries")


if __name__ == "__main__":
    main()
