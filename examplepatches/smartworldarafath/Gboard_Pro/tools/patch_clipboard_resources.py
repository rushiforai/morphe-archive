import xml.etree.ElementTree as ET

# 1. Update arrays.xml
arrays_path = 'temp_decompiled/res/values/arrays.xml'
with open(arrays_path, 'r', encoding='utf-8') as f:
    arrays_content = f.read()

# Replace or update array_0x7f03004a
std_values = '''    <string-array name="array_0x7f03004a">
        <item>1</item>
        <item>24</item>
        <item>168</item>
        <item>720</item>
        <item>never</item>
    </string-array>
    <string-array name="clipboard_retention_standard_entries">
        <item>1 hour</item>
        <item>24 hours</item>
        <item>7 days</item>
        <item>30 days</item>
        <item>Never (Unlimited)</item>
    </string-array>
    <string-array name="clipboard_retention_hourly_values">
        <item>1</item>
        <item>2</item>
        <item>3</item>
        <item>6</item>
        <item>12</item>
        <item>18</item>
        <item>24</item>
    </string-array>
    <string-array name="clipboard_retention_hourly_entries">
        <item>1 hour</item>
        <item>2 hours</item>
        <item>3 hours</item>
        <item>6 hours</item>
        <item>12 hours</item>
        <item>18 hours</item>
        <item>24 hours</item>
    </string-array>'''

import re
pattern = r'<string-array name="array_0x7f03004a">.*?</string-array>'
arrays_content = re.sub(pattern, std_values, arrays_content, flags=re.DOTALL)

with open(arrays_path, 'w', encoding='utf-8') as f:
    f.write(arrays_content)
print("Updated arrays.xml with standard & hourly retention arrays")

# 2. Update setting_clipboard.xml
clip_xml_path = 'temp_decompiled/res/xml/setting_clipboard.xml'
with open(clip_xml_path, 'r', encoding='utf-8') as f:
    clip_content = f.read()

new_sliders = '''    <com.google.android.libraries.inputmethod.preferencewidgets.LabelSummarySliderPreference android:persistent="true" android:title="@string/string_0x7f140b69" android:key="@string/string_0x7f140911" android:entries="@array/clipboard_retention_standard_entries" android:entryValues="@array/array_0x7f03004a" app:attr_0x7f040569="0" app:attr_0x7f04095c="@string/string_0x7f1413f8" />
    <com.google.android.libraries.inputmethod.preferencewidgets.LabelSummarySliderPreference android:persistent="true" android:title="Custom hourly retention" android:key="clipboard_hourly_retention" android:entries="@array/clipboard_retention_hourly_entries" android:entryValues="@array/clipboard_retention_hourly_values" app:attr_0x7f040569="0" app:attr_0x7f04095c="@string/string_0x7f1413f8" />'''

slider_pattern = r'<com\.google\.android\.libraries\.inputmethod\.preferencewidgets\.LabelSummarySliderPreference.*?\/>'
clip_content = re.sub(slider_pattern, new_sliders, clip_content, flags=re.DOTALL)

with open(clip_xml_path, 'w', encoding='utf-8') as f:
    f.write(clip_content)
print("Updated setting_clipboard.xml with both sliders")

# 3. Patch LabelSummarySliderPreference.smali
slider_smali = 'temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/preferencewidgets/LabelSummarySliderPreference.smali'
with open(slider_smali, 'r', encoding='utf-8') as f:
    smali_code = f.read()

# In ai(I)V: after invoke-virtual {p0, v0}, Landroidx/preference/Preference;->ae(Ljava/lang/String;)Z
hook_ai = '''    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->ae(Ljava/lang/String;)Z

    move-result v0

    invoke-static {p0, v0}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardPreferenceHelper;->onSliderChanged(Ljava/lang/Object;Ljava/lang/String;)V'''

if 'GboardClipboardPreferenceHelper;->onSliderChanged' not in smali_code:
    target_ai = 'invoke-virtual {p0, v0}, Landroidx/preference/Preference;->ae(Ljava/lang/String;)Z\n\n    move-result v0'
    replacement_ai = target_ai + '\n\n    iget-object v1, p0, Lcom/google/android/libraries/inputmethod/preferencewidgets/LabelSummarySliderPreference;->L:[Ljava/lang/CharSequence;\n    aget-object v1, v1, p1\n    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;\n    move-result-object v1\n    invoke-static {p0, v1}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardPreferenceHelper;->onSliderChanged(Ljava/lang/Object;Ljava/lang/String;)V'
    smali_code = smali_code.replace(target_ai, replacement_ai)
    print("Hooked onSliderChanged into ai(I)V")

# In a(Lcel;)V: right before return-void
if 'GboardClipboardPreferenceHelper;->onBindPreferenceView' not in smali_code:
    bind_target = 'return-void\n.end method'
    bind_replacement = '''    iget-object v0, p1, Lcel;->a:Landroid/view/View;
    invoke-static {p0, v0}, Lcom/akshaykadam/pixelboard/extension/clipboard/GboardClipboardPreferenceHelper;->onBindPreferenceView(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method'''
    # replace only in method a(Lcel;)V
    m = re.search(r'(\.method public final a\(Lcel;\)V.*?)(return-void\n\.end method)', smali_code, re.DOTALL)
    if m:
        before = m.group(1)
        smali_code = smali_code[:m.start(2)] + bind_replacement + smali_code[m.end(2):]
        print("Hooked onBindPreferenceView into a(Lcel;)V")

with open(slider_smali, 'w', encoding='utf-8') as f:
    f.write(smali_code)
print("Saved LabelSummarySliderPreference.smali")
