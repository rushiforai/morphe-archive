import re

arrays_path = 'temp_decompiled/res/values/arrays.xml'
with open(arrays_path, 'r', encoding='utf-8') as f:
    text = f.read()

new_array = '''    <string-array name="array_0x7f03004a">
        <item>1</item>
        <item>2</item>
        <item>3</item>
        <item>6</item>
        <item>12</item>
        <item>18</item>
        <item>24</item>
    </string-array>'''

text = re.sub(r'<string-array name="array_0x7f03004a">.*?</string-array>', new_array.strip(), text, flags=re.DOTALL)

with open(arrays_path, 'w', encoding='utf-8') as f:
    f.write(text)

print("Updated array_0x7f03004a successfully!")
