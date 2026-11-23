import re

# 1. Update AndroidManifest.xml
manifest_path = 'temp_decompiled/AndroidManifest.xml'
with open(manifest_path, 'r', encoding='utf-8') as f:
    m = f.read()

target_act = '''<activity
            android:name="com.akshaykadam.pixelboard.extension.settings.GboardCustomClipboardRetentionActivity"
            android:exported="true"
            android:label="Clipboard Retention"
            android:theme="@style/style_0x7f150431"/>'''

rep_act = '''<activity
            android:name="com.akshaykadam.pixelboard.extension.settings.GboardCustomClipboardRetentionActivity"
            android:exported="true"
            android:label="Clipboard Retention"
            android:theme="@style/style_0x7f150431">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.DEFAULT" />
            </intent-filter>
        </activity>'''

m_norm = m.replace('\r\n', '\n')
target_act_norm = target_act.replace('\r\n', '\n')
rep_act_norm = rep_act.replace('\r\n', '\n')

if target_act_norm in m_norm:
    m_norm = m_norm.replace(target_act_norm, rep_act_norm)
    with open(manifest_path, 'w', encoding='utf-8') as f:
        f.write(m_norm)
    print("Updated AndroidManifest.xml for GboardCustomClipboardRetentionActivity!")
else:
    print("GboardCustomClipboardRetentionActivity target not found in manifest")

# 2. Update GboardCustomClipboardRetentionActivity.java
act_java_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardCustomClipboardRetentionActivity.java'
with open(act_java_path, 'r', encoding='utf-8') as f:
    act_code = f.read()

# Make sure saveRetentionHours saves to all relevant preference files
save_target = '''            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
            prefs.edit()
                    .putString(KEY_CLIPBOARD_RETENTION, String.valueOf(hours))
                    .putLong(KEY_CUSTOM_RETENTION, hours)
                    .apply();'''

save_rep = '''            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
            prefs.edit()
                    .putString(KEY_CLIPBOARD_RETENTION, String.valueOf(hours))
                    .putLong(KEY_CUSTOM_RETENTION, hours)
                    .apply();

            SharedPreferences gboardPrefs = getSharedPreferences(getPackageName() + "_preferences", Context.MODE_PRIVATE);
            gboardPrefs.edit()
                    .putString(KEY_CLIPBOARD_RETENTION, String.valueOf(hours))
                    .putLong(KEY_CUSTOM_RETENTION, hours)
                    .apply();'''

act_norm = act_code.replace('\r\n', '\n')
save_target_norm = save_target.replace('\r\n', '\n')
save_rep_norm = save_rep.replace('\r\n', '\n')

if save_target_norm in act_norm:
    act_norm = act_norm.replace(save_target_norm, save_rep_norm)
    with open(act_java_path, 'w', encoding='utf-8') as f:
        f.write(act_norm)
    print("Updated GboardCustomClipboardRetentionActivity.java save logic!")
