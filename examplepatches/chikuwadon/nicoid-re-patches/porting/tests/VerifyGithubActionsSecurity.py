#!/usr/bin/env python3
"""Static guardrails for security-sensitive GitHub Actions changes.

No external dependencies or network access are required. Does not publish,
sign or modify releases. Keep this check alongside the workflow revisions.
"""
from __future__ import annotations

import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
WORKFLOWS = ROOT / ".github" / "workflows"
USES = re.compile(r"^[ \t]*(?:-[ \t]*)?uses:[ \t]*(\S+)", flags=re.MULTILINE)
FULL_PIN = re.compile(r"^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+@[a-f0-9]{40}$")
TAG_COMMENT = re.compile(r"#\s*v\d+(?:\.\d+)*\s*$")
workflows = {}
refs = 0

for path in sorted(WORKFLOWS.glob("*.yml")):
    text = path.read_text(encoding="utf-8")
    workflows[path.name] = text
    for match in USES.finditer(text):
        action = match.group(1)
        line = text[match.start():text.find("\n", match.start()) if "\n" in text[match.start():] else len(text)]
        assert FULL_PIN.fullmatch(action), (
            f"{path.name}: action must use an immutable full-length commit SHA: {action}"
        )
        assert TAG_COMMENT.search(line), f"{path.name}: pinned action needs an audited version comment"
        refs += 1
    assert "pull_request_target:" not in text, f"{path.name}: privileged PR target trigger needs manual review"

assert refs >= 12, "Action references unexpectedly disappeared"
# The official generated lockfile must cover every direct action reference and
# its transitive provenance; the authoritative network check runs in CI via
# `gh actions-lock --verify`.
lock = (WORKFLOWS / "actions.lock").read_text(encoding="utf-8")
assert "version: 'v0.0.3'" in lock
assert "workflows:" in lock and "dependencies:" in lock
for name, source in workflows.items():
    assert f"'.github/workflows/{name}':" in lock, f"Workflow not onboarded: {name}"
    for match in USES.finditer(source):
        assert "'" + match.group(1) + "'" in lock, f"Action missing from lockfile: {match.group(1)}"
assert "actions/attest@" in lock, "Missing locked transitive attestation dependency"

private = workflows["private-build.yml"]
main = workflows["verify-main.yml"]
release = workflows["release.yml"]
sync = workflows["sync-release-notes.yml"]
upload_versions = re.findall(
    r"uses:\s*actions/upload-artifact@[0-9a-f]{40}\s+#\s+v(\d+)", private
)
assert len(upload_versions) >= 2 and all(int(v) >= 6 for v in upload_versions), (
    "Only Node.js 24-compatible upload-artifact versions may be used"
)
assert "persist-credentials: false" in private
assert main.count("persist-credentials: false") >= 2
assert "permissions:\n  contents: read" in private
assert "permissions:\n  contents: read" in main
assert "workflow_dispatch:" in release
assert "inputs.release_confirmation == 'APPROVE'" in release
assert "    branches: [main]" not in release.split("jobs:")[0]  # never auto-release on push
assert "    push:" not in release.split("jobs:")[0]
assert "issues: write" not in release
assert "Fast-forward dev after a published stable release" in release
assert "git merge-base --is-ancestor origin/dev origin/main" in release
assert "git push origin HEAD:refs/heads/dev" in release
assert "git push --force" not in release
assert "inputs.confirmation == 'UPDATE'" in sync
assert "persist-credentials: false" in sync
config = json.loads((ROOT / ".releaserc").read_text(encoding="utf-8"))
plugins = [p[0] if isinstance(p, list) else p for p in config["plugins"]]
assert "@cleyrop-org/semantic-release-backmerge" not in plugins
assert "@semantic-release/github" in plugins
gh = config["plugins"][plugins.index("@semantic-release/github")][1]
assert gh.get("successCommentCondition") is False
assert gh.get("failCommentCondition") is False
assert gh.get("releasedLabels") is False

print(
    f"PASS: immutable SHA-pinned actions ({refs}), minimum read-only CI tokens, "
    "explicit release approval, separate non-destructive dev sync, no issue mutation"
)
