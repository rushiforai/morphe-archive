import re

# 1. Restore temp_decompiled/res/xml/setting_clipboard.xml
clip_xml_path = 'temp_decompiled/res/xml/setting_clipboard.xml'
restored_clip_xml = '''<?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen android:title="@string/string_0x7f140b68" android:key="@string/string_0x7f140a67"
  xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto">
    <SwitchPreferenceCompat android:persistent="true" android:title="@string/string_0x7f140b7d" android:key="@string/string_0x7f140928" />
    <SwitchPreferenceCompat android:persistent="true" android:title="@string/string_0x7f140b8a" android:key="@string/string_0x7f140945" android:defaultValue="true" />
    <SwitchPreferenceCompat android:persistent="true" android:title="@string/string_0x7f140ba0" android:key="@string/string_0x7f140963" android:defaultValue="true" />
    <com.google.android.libraries.inputmethod.preferencewidgets.LabelSummarySliderPreference android:persistent="true" android:title="@string/string_0x7f140b69" android:key="@string/string_0x7f140911" android:entries="@array/array_0x7f03004a" android:entryValues="@array/array_0x7f03004a" app:attr_0x7f040569="0" app:attr_0x7f04095c="@string/string_0x7f1413f8" />
</PreferenceScreen>
'''

with open(clip_xml_path, 'w', encoding='utf-8') as f:
    f.write(restored_clip_xml.strip() + '\n')
print("Restored setting_clipboard.xml to pristine original state")

# 2. Clean up arrays.xml
arrays_path = 'temp_decompiled/res/values/arrays.xml'
with open(arrays_path, 'r', encoding='utf-8') as f:
    arrays_text = f.read()

# Remove the extra arrays added for custom retention
for array_name in ['clipboard_retention_standard_entries', 'clipboard_retention_hourly_values', 'clipboard_retention_hourly_entries']:
    arrays_text = re.sub(rf'\s*<string-array name="{array_name}">.*?</string-array>', '', arrays_text, flags=re.DOTALL)

with open(arrays_path, 'w', encoding='utf-8') as f:
    f.write(arrays_text)
print("Cleaned up custom arrays from arrays.xml")

# 3. Remove hooks from LabelSummarySliderPreference.smali
slider_smali = 'temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/preferencewidgets/LabelSummarySliderPreference.smali'
with open(slider_smali, 'r', encoding='utf-8') as f:
    smali_text = f.read()

# Remove onSliderChanged hook
smali_text = re.sub(
    r'\n\s*iget-object v1, p0, Lcom/google/android/libraries/inputmethod/preferencewidgets/LabelSummarySliderPreference;->L:\[Ljava/lang/CharSequence;\s*aget-object v1, v1, p1\s*invoke-interface \{v1\}, Ljava/lang/CharSequence;->toString\(\)Ljava/lang/String;\s*move-result-object v1\s*invoke-static \{p0, v1\}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardPreferenceHelper;->onSliderChanged\(Ljava/lang/Object;Ljava/lang/String;\)V',
    '',
    smali_text
)

# Remove onBindPreferenceView hook
smali_text = re.sub(
    r'\n\s*iget-object v0, p1, Lcel;->a:Landroid/view/View;\s*invoke-static \{p0, v0\}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardPreferenceHelper;->onBindPreferenceView\(Ljava/lang/Object;Landroid/view/View;\)V',
    '',
    smali_text
)

with open(slider_smali, 'w', encoding='utf-8') as f:
    f.write(smali_text)
print("Removed hooks from LabelSummarySliderPreference.smali")
