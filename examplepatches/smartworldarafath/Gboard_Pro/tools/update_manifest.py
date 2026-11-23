with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    manifest = f.read()

old_act = '<activity android:exported="false" android:name="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" android:theme="@style/style_0x7f150431"/>'
new_act = '''<activity android:exported="true" android:name="com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity" android:theme="@style/style_0x7f150431">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <action android:name="com.akshaykadam.pixelboard.action.UPDATES" />
                <action android:name="com.akshaykadam.pixelboard.action.APPEARANCE" />
                <action android:name="com.akshaykadam.pixelboard.action.BOARD_UI" />
                <action android:name="com.akshaykadam.pixelboard.action.ABOUT" />
                <category android:name="android.intent.category.DEFAULT" />
            </intent-filter>
        </activity>'''

manifest = manifest.replace(old_act, new_act)

with open('temp_decompiled/AndroidManifest.xml', 'w', encoding='utf-8') as f:
    f.write(manifest)

print("Updated AndroidManifest.xml successfully!")
