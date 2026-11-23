with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'if \("blush_lilac"\.equals\(selectedTheme\)\) \{.*?\}(?=\s*//|\s*return|\s*if \("ocean"\.equals)', text, re.DOTALL)
if m:
    print(m.group(0)[:1500])
