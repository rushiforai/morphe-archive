"""Regression: preserve 3-argument reflection arrays and isolate 8-tab LRU."""
from pathlib import Path

root = Path(__file__).resolve().parents[1]
repo = root.parents[2]
builder = (root / "build_mpp.py").read_text()
smali = (repo / "porting/revisions/v1.10.1/helpers/e/e/a/MultiTabs227$Host.smali").read_text()
signature = ".method activate(Ljava/lang/String;)V"
start = smali.index(signature)
native = smali[start:smali.index(".end method", start)]
arity = "    const/4 v12, 0x3"
array = "    new-array v15, v12"
loop = "    :goto_19a\n    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;"
assert native.count(arity) == 1
assert native.count(array) == 2
assert native.count(loop) == 1
assert native.index(arity) < native.index(array) < native.rindex(array) < native.index(loop)
assert 'native_arity = "    const/4 v12, 0x3"' in builder
assert 'tab_host.count(array_use) != 2' in builder
assert 'tab_host.replace(lru_anchor' in builder
assert 'const/16 v12, 0x8' in builder
assert 'tab_host.replace(cache_limit' not in builder
assert ':nicoid_capture_keep_saved_scroll' in builder
assert 'VERSION = "2.0.1-dev.6"' in builder
assert 'v2.0.1-dev.5/java' in builder
workflow = (repo / ".github/workflows/private-build.yml").read_text()
assert 'nicoid-re-v2.0.1-dev.6-mpp' in workflow
assert 'nicoid-re-v2.0.1-dev.6-source' in workflow
print("PASS: tab reflection 3 args, isolated LRU limit 8 and dev6 artifact naming")
