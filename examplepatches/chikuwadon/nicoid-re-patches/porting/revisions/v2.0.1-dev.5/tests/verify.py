"""Contracts for immediate ListView rendering, bounded cache and single jump."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
source=(root/"java/e/e/a/SmoothTabRestore204.java").read_text()
builder=(root/"build_mpp.py").read_text()
workflow=(root.parents[2]/".github/workflows/private-build.yml").read_text()
for needle in (
 "ScrollRestorePolicy205.ready", "ScrollRestorePolicy205.userMoved",
 "ScrollRestorePolicy205.MAX_WAIT_MS", "restoring(ListView list)",
 "PENDING.remove(list)", "apply(list,position,top)",
 "if(everVisible&&!visible)", "PENDING.get(list)!=this",
 "MAIN.postDelayed(this,ScrollRestorePolicy205.RETRY_MS)"
):
 assert needle in source,needle
# Never blank the video list or move through partial pages merely to load more.
for forbidden in ("setForeground(", "setVisibility(", "class Mask", "setSelectionFromTop(next,", "ScrollRestorePolicy204.next("):
 assert forbidden not in source,forbidden
assert source.count("apply(list,position,top);")==2
assert 'list.setSelectionFromTop(p,t);' in source
assert 'if(previous!=null&&previous.position==position&&previous.top==top)return;' in source
assert 'if(justApplied(list,position,top))return;' in source
assert 'VERSION = "2.0.1-dev.5"' in builder
assert 'const/16 v12, 0x8' in builder
assert "Unexpected native tab cache limit" in builder
assert "nicoid_capture_keep_saved_scroll" in builder
assert 'SmoothTabRestore204;->restoring' in builder
assert 'v2.0.1-dev.4/java' in builder
assert 'nicoid-re-v2.0.1-dev.5-mpp' in workflow
assert 'nicoid-re-v2.0.1-dev.5-source' in workflow
print("PASS: native list always visible, one-shot final restore, cache LRU 8, capture guard & artifact naming")
