with open('temp_decompiled/smali_classes3/rkb.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m_a = re.search(r'\.method public static final a\(Landroid/content/Context;Ljava/lang/String;\)Landroid/content/Context;.*?\.end method', text, re.DOTALL)
if m_a:
    print("=== METHOD a ===")
    print(m_a.group(0))

m_b = re.search(r'\.method public static final b\(Ljava/lang/String;\)Lrka;.*?\.end method', text, re.DOTALL)
if m_b:
    print("=== METHOD b ===")
    print(m_b.group(0))
