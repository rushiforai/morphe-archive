"""Verify theme hooks, stable resource IDs and explicit styles in the applied APK."""
from pathlib import Path
import re
import sys
import xml.etree.ElementTree as ET

root = Path(sys.argv[1])
def smali(name):
    return next(root.glob('smali*/'+name+'.smali')).read_text()
dynamic = smali('e/e/a/DynamicTheme')
for method in ('apply', 'isNight', 'textColor', 'background', 'button'):
    assert 'Le/e/a/ThemeChoice;->'+method+'(' in dynamic
settings = smali('com/sauzask/nicoid/NicoidSetting')
assert 'Le/e/a/ThemeChoice;->settings(Landroid/preference/PreferenceActivity;)V' in settings
assert 'new-instance v1, Le/e/a/DynamicTheme$Refresh;' not in settings
assert settings.index('DynamicTheme;->apply') < settings.index('PreferenceActivity;->onCreate')
choice = re.sub(r'\\u([0-9a-fA-F]{4})', lambda m: chr(int(m[1], 16)), smali('e/e/a/ThemeChoice'))
for item in ('app_theme', 'ライトモード', 'ダークモード', 'Material You'):
    assert item in choice
assert 'registerActivityLifecycleCallbacks' in choice
assert 'ThemeChoice;->stamp' in choice
callback = smali('e/e/a/ThemeChoice$1')
assert 'onActivityResumed' in callback and 'ThemeChoice;->access$100' in callback
assert 'Activity;->recreate()V' in smali('e/e/a/ThemeChoice$1$$ExternalSyntheticLambda0')
styles = {s.attrib['name']:s for s in ET.parse(root/'res/values/styles.xml').getroot() if s.tag=='style'}
assert styles['MyThemeLight'].attrib['parent'] == '@style/Theme.AppCompat.Light'
assert styles['MyThemeDark'].attrib['parent'] == '@style/Theme.AppCompat'
for name in ('MyThemeLight', 'MyThemeDark'):
    attrs = {i.attrib['name']:i.text for i in styles[name]}
    assert attrs['colorAccent'] == '@color/theme_colorAccent'
    assert 'nicoidSurface' in attrs
    assert 'android:colorBackground' in attrs
assert 'MyThemeMaterialYou' in styles
public = {p.attrib['name']:p.attrib['id'] for p in ET.parse(root/'res/values/public.xml').getroot()}
assert public['MyTheme'] == '0x7f1000a2'
assert public['colorAccent'] == '0x7f03005e'
print('PASS: theme routing, settings listener replacement, resume refresh, fixed style parents and original resource IDs')
