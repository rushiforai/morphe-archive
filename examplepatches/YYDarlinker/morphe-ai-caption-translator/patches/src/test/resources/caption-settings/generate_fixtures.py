"""Build three tiny, unsigned resource APKs for CaptionSettingsResourceTest (no proprietary input)."""
import argparse
from pathlib import Path
import subprocess
import zipfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--sdk', type=Path, required=True)
parser.add_argument('--addon', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
a = parser.parse_args()
a.output.mkdir(parents=True, exist_ok=False)
aapt = a.sdk / 'build-tools/36.0.0' / ('aapt2.exe' if (a.sdk / 'build-tools/36.0.0/aapt2.exe').exists() else 'aapt2')
with zipfile.ZipFile(a.addon) as bundle:
    strings = bundle.read('captionlocales/values/caption_addon_strings.xml')

for case in ('absent', 'custom', 'existing-loopback'):
    folder = a.output / case
    (folder / 'res/xml').mkdir(parents=True)
    (folder / 'res/values').mkdir()
    (folder / 'res/values/strings.xml').write_bytes(strings)
    network = '' if case == 'absent' else ' android:networkSecurityConfig="@xml/host_security"'
    (folder / 'AndroidManifest.xml').write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.google.android.youtube" android:versionCode="1" android:versionName="21.41.525">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
<application android:label="Host fixture" android:usesCleartextTraffic="true" android:allowBackup="false"'''
        + network + '/></manifest>', encoding='utf-8')
    stock = '<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android"><Preference android:key="host_row" android:title="Host row"/></PreferenceScreen>'
    morphe = '''<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
<PreferenceScreen android:key="morphe_settings_screen_12_video" android:title="Video">
<PreferenceScreen android:key="morphe_vot_screen" android:title="Voice over translation"/>
<Preference android:key="host_row" android:title="Host row"/>
</PreferenceScreen></PreferenceScreen>'''
    names = ('settings_fragment', 'settings_fragment_cairo') if case == 'absent' else ('morphe_prefs', 'morphe_prefs_icons', 'morphe_prefs_icons_bold')
    for name in names:
        (folder / f'res/xml/{name}.xml').write_text(stock if case == 'absent' else morphe, encoding='utf-8')
    if case != 'absent':
        loop = '<domain-config cleartextTrafficPermitted="true"><domain includeSubdomains="false">127.0.0.1</domain></domain-config>' if case == 'existing-loopback' else ''
        (folder / 'res/raw').mkdir()
        (folder / 'res/raw/host_ca.pem').write_bytes(b'Host certificate fixture: preserve these bytes\n')
        (folder / 'res/xml/host_security.xml').write_text('''<network-security-config>
<base-config cleartextTrafficPermitted="false"><trust-anchors><certificates src="system"/><certificates src="@raw/host_ca"/></trust-anchors></base-config>
<domain-config cleartextTrafficPermitted="true"><domain includeSubdomains="true">host.example</domain><trust-anchors><certificates src="user"/></trust-anchors></domain-config>
<debug-overrides><trust-anchors><certificates src="user" overridePins="true"/></trust-anchors></debug-overrides>'''
            + loop + '</network-security-config>', encoding='utf-8')
    subprocess.run([str(aapt), 'compile', '--dir', str(folder / 'res'), '-o', str(folder / 'compiled.zip')], check=True)
    subprocess.run([str(aapt), 'link', '-o', str(folder / 'input.apk'), '--manifest', str(folder / 'AndroidManifest.xml'),
                    '-I', str(a.sdk / 'platforms/android-35/android.jar'), str(folder / 'compiled.zip')], check=True)
    print('FIXTURE_BUILT', case, flush=True)
