"""Staged scroll restorations must use one coordinator without clamped intermediate jumps."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
source=(root/"java/e/e/a/SmoothTabRestore204.java").read_text()
builder=(root/"build_mpp.py").read_text()
workflow=(root.parents[2]/".github/workflows/private-build.yml").read_text()
for requirement in (
 "getFirstVisiblePosition()","getForeground()","setForeground(mask)",
 "index==0&&top==0",
 "JOBS.get(list)==this","JOBS.remove(list)","setSelectionFromTop(index,top)",
 "ScrollRestorePolicy204.next","SystemClock.uptimeMillis()-started>12000L",
 "list.isShown()","previous.get()","existing.index==index&&existing.top==top"
):
 assert requirement in source,requirement
assert 'SmoothTabRestore204;->restoreList' in builder
assert 'SmoothTabRestore204;->restore' in builder
assert 'if count != 1' in builder
assert 'nicoid-re-v2.0.1-dev.4-mpp' in workflow
assert 'nicoid-re-v2-development-mpp' not in workflow
assert 'VERSION = "2.0.1-dev.4"' in builder
print("PASS: idempotent tab scroll coordinator and versioned workflow artifact")
