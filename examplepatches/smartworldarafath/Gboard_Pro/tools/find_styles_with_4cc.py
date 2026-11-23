import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

matches = re.findall(r'<style name="([^"]+)"[^>]*>.*?<item name="attr_0x7f0404cc">([^<]+)</item>.*?</style>', text, re.DOTALL)
for s, val in matches:
    print(f"Style {s} has attr_0x7f0404cc = {val}")
