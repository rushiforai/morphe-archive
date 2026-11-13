"""Regression test: extend only the in-memory tab LRU from eight to twelve.

The native tab generator reuses v12 for the reflection argument arrays and the
later tab-cache bound. Never change its initial value (three).
"""
from pathlib import Path

REVISION=Path(__file__).resolve().parents[1]
REVISIONS=REVISION.parent
REPOSITORY=REVISION.parents[2]
NEW=(REVISION/"build_mpp.py").read_text()
OLD=(REVISIONS/"v2.0.1-dev.7/build_mpp.py").read_text()
EXPECTED=(OLD.replace('from patch_207 import OVERRIDES, stage',
                      'sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "v2.0.1-dev.7"))\nfrom patch_207 import OVERRIDES, stage')
             .replace('VERSION = "2.0.1-dev.7"',
                      'VERSION = "2.0.1-dev.8"')
             .replace('"    const/16 v12, 0x8\\n"',
                      '"    const/16 v12, 0xc\\n"')
             .replace('        *sorted((ROOT / "java").rglob("*.java")),',
                      '        ROOT.parent / "v2.0.1-dev.7/java/e/e/a/SmoothTabRestore204.java",\n'
                      '        *sorted((ROOT / "java").rglob("*.java")),'))
assert NEW==EXPECTED,"Unexpected change beyond version, tab-cache limit, and preserved restore class"
assert 'native_arity = "    const/4 v12, 0x3"' in NEW
assert 'tab_host.count(array_use) != 2' in NEW
assert 'tab_host.replace(lru_anchor' in NEW
assert '    const/16 v12, 0xc' in NEW
assert NEW.count('ROOT.parent / "v2.0.1-dev.7/java/e/e/a/SmoothTabRestore204.java"')==1
assert (REVISIONS/"v2.0.1-dev.7/java/e/e/a/SmoothTabRestore204.java").is_file()

# Run the exact source-level replacement against the native tab host smali,
# checking both reflection constructor arrays and the subsequent LRU loop.
native=(REPOSITORY/"porting/revisions/v1.10.1/helpers/e/e/a/MultiTabs227$Host.smali").read_text()
arity="    const/4 v12, 0x3"
array="    new-array v15, v12"
anchor=("    :goto_19a\n"
        "    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;")
assert native.count(arity)==1
assert native.count(array)==2
assert native.count(anchor)==1
assert native.index(arity)<native.index(array)<native.rindex(array)<native.index(anchor)
updated=native.replace(anchor,(
    "    :goto_19a\n"
    "    const/16 v12, 0xc\n"
    "    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;"))
assert updated.count("    const/16 v12, 0xc")==1
assert updated.index("    const/16 v12, 0xc")>updated.rindex(array)
assert updated.count(arity)==1
assert updated.count(array)==2

# No persisted data, startup load, or tab-list schema should change.
workflow=(REPOSITORY/".github/workflows/private-build.yml").read_text()
assert 'builder=porting/revisions/v2.0.1-dev.8' in workflow
assert 'nicoid-re-v2.0.1-dev.8-mpp' in workflow
assert 'nicoid-re-v2.0.1-dev.8-source' in workflow
assert (REVISION/"verify_ci_candidate.py").read_text().count(
    'expected == "2.0.1-dev.8"')==1
print("PASS: native 3-argument tab construction, separate 12-tab LRU, unchanged startup semantics")
