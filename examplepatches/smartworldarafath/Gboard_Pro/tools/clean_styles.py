with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Clean DayNightTheme.NoActionBar
import re
content = re.sub(
    r'<style name="DayNightTheme\.NoActionBar" parent="@style/style_0x7f150a23">\s*<item name="android:windowAnimationStyle">@style/GboardProWindowAnimations</item>\s*<item name="android:navigationBarColor">\?attr_0x7f0404e7</item>\s*</style>',
    '<style name="DayNightTheme.NoActionBar" parent="@style/style_0x7f150a23">\n        <item name="android:navigationBarColor">?attr_0x7f0404e7</item>\n    </style>',
    content
)

# 2. Clean GboardProWindowAnimations and style_0x7f150431
content = re.sub(
    r'\s*<style name="GboardProWindowAnimations"[^>]*>.*?</style>\s*<style name="style_0x7f150431"[^>]*>.*?</style>',
    '\n    <style name="style_0x7f150431" parent="@style/style_0x7f150430" />',
    content,
    flags=re.DOTALL
)

with open('temp_decompiled/res/values/styles.xml', 'w', encoding='utf-8') as f:
    f.write(content)

print("styles.xml cleaned successfully!")
