"""Run the existing release-check shell blocks against offline GitHub/Git fixtures.

Run with: python -m unittest discover -s .github/scripts/tests -v
Requires Bash and its standard utilities; no GitHub credentials or network are used.
"""

import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[3]
BASH = next(
    (str(p) for p in (Path(r"C:\Program Files\Git\bin\bash.exe"),)
     if p.is_file()),
    shutil.which("bash"),
)


def shell_step(filename, step_name):
    """Extract one literal run block, keeping the workflow as the tested source."""
    lines = (ROOT / ".github/workflows" / filename).read_text(encoding="utf-8").splitlines()
    start = lines.index("      - name: " + step_name)
    run = next(i for i in range(start + 1, len(lines)) if lines[i] == "        run: |")
    body = []
    for line in lines[run + 1:]:
        if line.strip() and not line.startswith("          "):
            break
        body.append(line[10:] if line.strip() else "")
    if not body:
        raise AssertionError("Missing run block: " + step_name)
    return "\n".join(body) + "\n"


PUBLISHED_MOCKS = r'''
git() {
  case "$1" in
    ls-remote) printf '%s\trefs/tags/v1.2.3\n' "$AUDIT_TAG_COMMIT" ;;
    cat-file) return 0 ;;
    rev-parse) printf '%s\n' "$AUDIT_PARENT" ;;
    *) echo "unexpected git call: $*" >&2; return 99 ;;
  esac
}
gh() {
  if [ "$1 $2" != "release view" ]; then
    echo "unexpected gh call: $*" >&2; return 99
  fi
  printf '%s\n' "$AUDIT_REMOTE_DIGEST"
}
'''

STABLE_MOCKS = r'''
jq() {
  case "$2" in
    '.version // ""') field=version ;;
    '.download_url // ""') field=download_url ;;
    *) echo "unexpected jq call: $*" >&2; return 99 ;;
  esac
  "$AUDIT_PYTHON" -c 'import json,sys; print(json.load(sys.stdin).get(sys.argv[1]) or "")' "$field"
}
gh() {
  case "$1 $2" in
    'api '*) printf '%s\n' "$AUDIT_METADATA" ;;
    'release view') printf '%s\n' "$AUDIT_PRERELEASE" ;;
    *) echo "unexpected gh call: $*" >&2; return 99 ;;
  esac
}
curl() {
  printf '%s\n' "$*" > curl-called.txt
  return "$AUDIT_DOWNLOAD_STATUS"
}
'''


@unittest.skipUnless(BASH, "Bash is required for offline workflow checks")
class ReleaseChecksTest(unittest.TestCase):
    def run_block(self, filename, step_name, mocks, env, setup=None):
        with tempfile.TemporaryDirectory(prefix="heval-release-check-") as tmp:
            directory = Path(tmp)
            if setup:
                setup(directory)
            output = directory / "github-output.txt"
            script = directory / "check.sh"
            script.write_text(mocks + shell_step(filename, step_name), encoding="utf-8")
            process_env = os.environ.copy()
            # All GitHub/Git calls in these blocks resolve to the functions above.
            process_env.update(env)
            process_env.update(GITHUB_OUTPUT=output.as_posix(), GITHUB_REPOSITORY="audit/repo",
                               REPO="audit/repo", AUDIT_PYTHON=sys.executable)
            result = subprocess.run([BASH, str(script)], cwd=directory, env=process_env,
                                    capture_output=True, text=True, timeout=30)
            return result, output.read_text() if output.exists() else "", (directory / "curl-called.txt").exists()

    def published(self, count=1, tag=None, parent=None, digest=None):
        content = b"offline test bundle"
        local_digest = "sha256:" + hashlib.sha256(content).hexdigest()

        def setup(directory):
            libs = directory / "patches/build/libs"
            libs.mkdir(parents=True)
            for index in range(count):
                (libs / ("patches-1.2.%d.mpp" % (3 + index))).write_bytes(content)

        return self.run_block(
            "release.yml", "Check for a release published by this run", PUBLISHED_MOCKS,
            {"RUN_SHA": "a" * 40, "AUDIT_TAG_COMMIT": tag or "a" * 40,
             "AUDIT_PARENT": parent or "b" * 40,
             "AUDIT_REMOTE_DIGEST": local_digest if digest is None else digest}, setup,
        )

    def test_no_bundle_is_not_attested(self):
        result, output, _ = self.published(count=0)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("published=false", output)

    def test_ambiguous_bundles_are_not_attested(self):
        result, output, _ = self.published(count=2)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("published=false", output)

    def test_current_run_and_matching_digest_are_attested(self):
        result, output, _ = self.published()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("published=true", output)
        self.assertIn("tag=v1.2.3", output)

    def test_release_commit_directly_after_run_is_accepted(self):
        result, output, _ = self.published(tag="c" * 40, parent="a" * 40)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("published=true", output)

    def test_another_run_cannot_attest_an_older_tag(self):
        result, output, _ = self.published(tag="c" * 40)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("published=false", output)

    def test_digest_mismatch_fails_without_attesting(self):
        result, output, _ = self.published(digest="sha256:" + "0" * 64)
        self.assertEqual(result.returncode, 1, result.stderr)
        self.assertIn("published=false", output)
        self.assertNotIn("published=true", output)
        self.assertIn("::error::", result.stdout)

    def test_missing_asset_on_this_runs_release_fails(self):
        result, output, _ = self.published(digest="")
        self.assertEqual(result.returncode, 1, result.stderr)
        self.assertNotIn("published=true", output)
        self.assertIn("::error::", result.stdout)

    def stable(self, version="1.2.3", download=None, prerelease="false", download_status="0"):
        metadata = {"version": version,
                    "download_url": download or "https://github.com/audit/repo/releases/download/v1.2.3/patches-1.2.3.mpp"}
        return self.run_block(
            "verify-stable-metadata.yml", "Check main's patches-bundle.json", STABLE_MOCKS,
            {"AUDIT_METADATA": json.dumps(metadata), "AUDIT_PRERELEASE": prerelease,
             "AUDIT_DOWNLOAD_STATUS": download_status},
        )

    def test_stable_download_is_checked(self):
        result, _, downloaded = self.stable()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(downloaded)

    def test_prerelease_version_is_rejected(self):
        result, _, downloaded = self.stable(version="1.2.3-dev.1")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(downloaded)

    def test_missing_version_is_rejected(self):
        result, _, downloaded = self.stable(version=None)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(downloaded)

    def test_wrong_asset_version_is_rejected(self):
        result, _, downloaded = self.stable(download="https://example.invalid/patches-9.9.9.mpp")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(downloaded)

    def test_github_prerelease_flag_is_rejected(self):
        result, _, downloaded = self.stable(prerelease="true")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(downloaded)

    def test_missing_asset_fails_check(self):
        result, _, downloaded = self.stable(download_status="22")
        self.assertNotEqual(result.returncode, 0)
        self.assertTrue(downloaded)


if __name__ == "__main__":
    unittest.main()
