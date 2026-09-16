from pathlib import Path
import json
ROOT=Path(__file__).resolve().parents[1]
s=(ROOT/"patches/src/main/kotlin/dev/dva11/gboard/MidnightRedThemePatch.kt").read_text()
assert 'name = "Gboard AMOLED Theme Studio"' in s
assert 'packageName = PACKAGE_NAME' in s
assert 'AppTarget(' not in s
assert 'ActivityThread;->currentApplication()' in s
assert 'Landroid/app/ActivityThread' in s
assert 'Landroidx/fragment/app/Fragment;->getContext()' not in s
assert 'getMethod(Ljava/lang/String;[Ljava/lang/Class;)' not in s
assert 'new-instance v12, Ljxq;' in s
assert 'new-instance v12, Ljyj;' not in s
assert 'definingClass = "Ljxu;"' in s
assert 'val adapterAnchor = themeListing.instructionMatches.lastOrNull()' in s
assert 'adapterAnchor.index' in s
assert 'additionalThemesOption' not in s
assert 'parseAdditionalThemes' not in s
assert 'buildSpecs' not in s
assert 'slugify' not in s
assert 'Additional theme #' not in s
assert 'split(";;")' not in s
assert 'default = "(none)"' not in s
for x in ['DEFAULT_THEME_NAME','DEFAULT_BACKGROUND','DEFAULT_PRIMARY','DEFAULT_SECONDARY','DEFAULT_TERTIARY']:
    assert f'default = {x}' in s
m=json.loads((ROOT/"verification-manifest.json").read_text())
props=(ROOT/"gradle.properties").read_text()
version=next(line.split("=",1)[1].strip() for line in props.splitlines() if line.replace(" ", "").startswith("version="))
assert m["version"]==version
assert m["package"]=="com.google.android.inputmethod.latin" and m["supportedVersion"]=="Any"
print("PASS: source invariants")
