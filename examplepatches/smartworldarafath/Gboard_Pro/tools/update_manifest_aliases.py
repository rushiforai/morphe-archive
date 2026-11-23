import os

path = r'temp_decompiled/AndroidManifest.xml'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

target = """        <activity-alias
            android:name="com.gboardpro.app.launcher.Default"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="true"
            android:exported="true"
            android:icon="@mipmap/ic_app"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>"""

replacement = """        <activity-alias
            android:name="com.gboardpro.app.launcher.Default"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="true"
            android:exported="true"
            android:icon="@mipmap/ic_app"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.Purple"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_purple"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.Slate"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_slate"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.ForestGreen"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_forest_green"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>
        <activity-alias
            android:name="com.gboardpro.app.launcher.NavyBlue"
            android:targetActivity="com.google.android.libraries.inputmethod.launcher.LauncherActivity"
            android:enabled="false"
            android:exported="true"
            android:icon="@mipmap/icon_navy_blue"
            android:label="@string/string_0x7f140c9a">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity-alias>"""

norm_content = content.replace('\\r\\n', '\\n')
norm_target = target.replace('\\r\\n', '\\n')
norm_rep = replacement.replace('\\r\\n', '\\n')

if norm_target in norm_content:
    norm_content = norm_content.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_content)
    print("AndroidManifest.xml launcher aliases added successfully!")
else:
    print("Target not found in AndroidManifest.xml")
