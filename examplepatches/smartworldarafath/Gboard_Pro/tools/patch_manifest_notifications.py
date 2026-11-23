manifest_path = 'temp_decompiled/AndroidManifest.xml'
with open(manifest_path, 'r', encoding='utf-8') as f:
    c = f.read()

# 1. Add POST_NOTIFICATIONS permission
if 'android.permission.POST_NOTIFICATIONS' not in c:
    c = c.replace('<uses-permission android:name="android.permission.INTERNET"/>',
                  '<uses-permission android:name="android.permission.INTERNET"/>\n    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>')
    print('Added POST_NOTIFICATIONS permission')
else:
    print('POST_NOTIFICATIONS already present')

# 2. Add GboardUpdateCheckReceiver
if 'com.akshaykadam.pixelboard.extension.updater.GboardUpdateCheckReceiver' not in c:
    receiver_xml = '''        <receiver android:name="com.akshaykadam.pixelboard.extension.updater.GboardUpdateCheckReceiver" android:exported="true">
            <intent-filter>
                <action android:name="com.akshaykadam.pixelboard.action.CHECK_UPDATE"/>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
            </intent-filter>
        </receiver>'''
    c = c.replace('</application>', receiver_xml + '\n    </application>')
    print('Added GboardUpdateCheckReceiver')
else:
    print('GboardUpdateCheckReceiver already present')

with open(manifest_path, 'w', encoding='utf-8') as f:
    f.write(c)
print('Saved AndroidManifest.xml')
