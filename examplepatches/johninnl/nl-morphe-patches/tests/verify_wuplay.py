"""Audit decoded original/patched Wuplay APKs independently of the patcher."""
import argparse
from pathlib import Path
from atv_smali import classes, methods

HOOK = 'Lapp/wuplay/androidtv/WuPlayApplication;->onCreate()V'
CALL = 'invoke-static/range {p0 .. p0}, Lnl/johninnl/wuplay/CatalogChannels;->install(Landroid/app/Application;)V'


def verify(original, patched):
    before, after = methods(original), methods(patched)
    old_classes, new_classes = classes(original), classes(patched)
    assert set(old_classes) <= set(new_classes), 'Original classes removed'
    assert set(before) <= set(after), 'Original methods removed'
    changed = [name for name, body in before.items() if after[name] != body]
    assert changed == [HOOK], f'Unexpected native changes: {changed}'
    body = after[HOOK].copy()
    assert body[-1] == 'return-void'
    assert body[-2] == CALL, body[-2]
    del body[-2]
    assert body == before[HOOK], 'Lifecycle hook did not preserve original code'
    added = set(new_classes) - set(old_classes)
    assert added and all(name.startswith('Lnl/johninnl/wuplay/') for name in added), added
    for required in ('CatalogChannels', 'CatalogSettingsActivity', 'NativeCatalogs', 'CatalogPublisher', 'CatalogPolicy'):
        assert f'Lnl/johninnl/wuplay/{required};' in added
    print(f'PASS: {len(old_classes)} original classes; exactly one additive lifecycle hook; {len(added)} owned extension classes; no bundled Kotlin replacement')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('patched', type=Path)
    args = parser.parse_args()
    verify(args.original, args.patched)
