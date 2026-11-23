with open('temp_decompiled/smali/com/akshaykadam/pixelboard/extension/R$string.smali', 'r', encoding='utf-8') as f:
    smali_c = f.read()

if 'gboard_patches_restarting' not in smali_c:
    with open('temp_decompiled/smali/com/akshaykadam/pixelboard/extension/R$string.smali', 'a', encoding='utf-8') as f:
        f.write('\n.field public static gboard_patches_restarting:I = 0x7f030068\n.field public static gboard_patches_warning_label:I = 0x7f030069\n')
    print("Added to R$string.smali")

with open('temp_decompiled/res/values/strings.xml', 'r', encoding='utf-8') as f:
    xml_c = f.read()

if 'gboard_patches_restarting' not in xml_c:
    xml_c = xml_c.replace('</resources>', '    <string name="gboard_patches_restarting">Restarting...</string>\n    <string name="gboard_patches_warning_label">Warning</string>\n</resources>')
    with open('temp_decompiled/res/values/strings.xml', 'w', encoding='utf-8') as f:
        f.write(xml_c)
    print("Added to strings.xml")
