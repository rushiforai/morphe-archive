import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

m = re.search(r'<style name="DayNightTheme\.NoActionBar"[^>]*>.*?</style>', text, re.DOTALL)
if m:
    print(m.group(0))
else:
    print("DayNightTheme.NoActionBar not found")
