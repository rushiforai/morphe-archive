#!/usr/bin/env python3
"""Verify all local runtime modules survive filtering; reject incomplete overlays."""
from pathlib import Path
from tempfile import TemporaryDirectory
from prepare_upstream import clean_other_sources

with TemporaryDirectory() as tmp:
    root = Path(tmp)
    patches = root / "patches/src/main/kotlin/app/morphe/patches"
    (patches / "realmelink").mkdir(parents=True)
    for path in (patches / "shared/compat/AppCompatibilities.kt",
                 root / "patches/src/main/java/app/morphe/patches/shared/misc/png/PngImage.java"):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.touch()
    java = root / "extensions/extension/src/main/java"
    runtime = java / "app/hxreborn/extension/realmelink"
    runtime.mkdir(parents=True)
    (runtime / "ModeKeeper.java").touch()
    try:
        clean_other_sources(root)
    except RuntimeError:
        pass
    else:
        raise AssertionError("missing UI module accepted")
    (runtime / "ModeSettingsUi.java").touch()
    (java / "Other.java").touch()
    clean_other_sources(root)
    assert (runtime / "ModeKeeper.java").is_file()
    assert (runtime / "ModeSettingsUi.java").is_file()
    assert not (java / "Other.java").exists()
print("PASS: complete realme extension retained")
