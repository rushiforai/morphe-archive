"""Audit decoded original/patched Wuplay APKs independently of the patcher."""
import argparse
from pathlib import Path
import re
import subprocess
from atv_smali import classes, methods

HOOK = 'Lapp/wuplay/androidtv/WuPlayApplication;->onCreate()V'
CALL = 'invoke-static/range {p0 .. p0}, Lnl/johninnl/wuplay/CatalogChannels;->install(Landroid/app/Application;)V'
SETTINGS = 'Lapp/wuplay/androidtv/ui/screens/PlayerScreenKt$$ExternalSyntheticLambda6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;'
SETTINGS_CALL = 'invoke-static {v12, v1}, Lnl/johninnl/wuplay/NativeChannelSettings;->appendRow(Ljava/lang/Object;Ljava/lang/Object;)V'
FOCUS = 'Lapp/wuplay/androidtv/ui/components/FilterChipRowKt$$ExternalSyntheticLambda5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;'
IDENTITY = 'Lapp/wuplay/androidtv/TvAppContainer;-><init>(Lapp/wuplay/androidtv/WuPlayApplication;)V'
SIGNER = 'const-string v3, "ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f"'


def without_instruction(rows, index):
    result = rows[:index] + rows[index + 1:]
    def adjust(line):
        parts = re.split(r'("(?:\\.|[^"\\])*")', line)
        return ''.join(part if i % 2 else re.sub(r'@(\d+)',
            lambda match: '@' + str(int(match[1]) - (int(match[1]) > index)), part)
            for i, part in enumerate(parts))
    return [adjust(line) for line in result]


def verify(original, patched):
    before, after = methods(original), methods(patched)
    old_classes, new_classes = classes(original), classes(patched)
    assert set(old_classes) <= set(new_classes), 'Original classes removed'
    assert set(before) <= set(after), 'Original methods removed'
    changed = [name for name, body in before.items() if after[name] != body]
    assert set(changed) == {HOOK, SETTINGS, IDENTITY, FOCUS}, f'Unexpected native changes: {changed}'
    body = after[HOOK].copy()
    assert body[-1] == 'return-void'
    assert body[-2] == CALL, body[-2]
    del body[-2]
    assert body == before[HOOK], 'Lifecycle hook did not preserve original code'
    body = after[SETTINGS]
    assert body.count(SETTINGS_CALL) == 1, 'Native Settings entry missing or duplicated'
    index = body.index(SETTINGS_CALL)
    assert body[index - 2] == 'move-object/from16 v0, p0', 'Wrong native callback receiver'
    assert body[index - 1] == 'iget-object v1, v0, Lapp/wuplay/androidtv/ui/screens/PlayerScreenKt$$ExternalSyntheticLambda6;->f$5:Ljava/lang/Object;', 'Wrong native Back callback'
    restored = without_instruction(body, index)
    restored = without_instruction(restored, index - 1)
    restored = without_instruction(restored, index - 2)
    assert restored == before[SETTINGS], 'Settings hook changed other merged-lambda branches or native items'
    body = after[IDENTITY]
    assert body.count(SIGNER) == 1, 'Missing/duplicated original signing identity'
    assert without_instruction(body, body.index(SIGNER)) == before[IDENTITY], 'Registration compatibility changed unrelated container behavior'
    body = after[FOCUS]
    assert len(body) == len(before[FOCUS]), 'Focus boundary changed method size'
    delta = [i for i, (a, b) in enumerate(zip(before[FOCUS], body)) if a != b]
    assert len(delta) == 1, 'Unrelated focus callback changes'
    assert before[FOCUS][delta[0]] == 'const/4 v14, 0x1' and body[delta[0]] == 'const/4 v14, 0x0', 'Wrong native final-row boundary'
    added = set(new_classes) - set(old_classes)
    assert added and all(name.startswith('Lnl/johninnl/wuplay/') for name in added), added
    for required in ('CatalogChannels', 'CatalogSettingsActivity', 'NativeCatalogs', 'CatalogPublisher', 'CatalogPolicy', 'NativeChannelSettings'):
        assert f'Lnl/johninnl/wuplay/{required};' in added
    print(f'PASS: {len(old_classes)} original classes; exact lifecycle/Settings/focus hooks and scoped original build identity; {len(added)} owned extension classes; no bundled Kotlin replacement')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('patched', type=Path)
    parser.add_argument('--apk', type=Path, help='Audit selector visibility in the actual APK manifest')
    args = parser.parse_args()
    verify(args.original, args.patched)
    if args.apk:
        manifest = subprocess.check_output(['aapt', 'dump', 'xmltree', str(args.apk), 'AndroidManifest.xml'], text=True)
        activities = re.split(r'(?m)^      E: activity ', manifest)[1:]
        selector = [block for block in activities if '"nl.johninnl.wuplay.CatalogSettingsActivity"' in block]
        assert len(selector) == 1, 'Missing/duplicate internal selector activity'
        block = re.split(r'(?m)^      E: (?:provider|receiver|service|activity-alias) ', selector[0])[0]
        assert 'android:exported(0x01010010)=(type 0x12)0x0' in block, 'Selector is externally exported'
        assert 'E: intent-filter' not in block, 'Selector still has an external launcher entry'
        print('PASS: selector is internal to Wuplay and has no separate TV launcher entry')
