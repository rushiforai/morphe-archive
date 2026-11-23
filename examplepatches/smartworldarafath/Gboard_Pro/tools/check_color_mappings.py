import re

colors_to_check = [
    'color_0x7f06013a', # colorBackground
    'color_0x7f06014f', # colorPrimary
    'color_0x7f060150', # colorPrimaryContainer
    'color_0x7f060143', # colorOnPrimaryContainer
    'color_0x7f060155', # textColorPrimary
    'color_0x7f060159', # textColorSecondary
    'color_0x7f06013c', # colorError
    'color_0x7f06013f', # colorOnSurface
    'color_0x7f060140', # colorOnSurfaceVariant
    'color_0x7f06015b', # colorSecondary
    'color_0x7f06015c', # colorSecondaryContainer
    'color_0x7f060161', # colorSurface
    'color_0x7f060162', # colorSurfaceVariant
    'color_0x7f060163', # colorTertiary
    'color_0x7f060164', # colorTertiaryContainer
]

for xml_file in ['temp_decompiled/res/values/colors.xml', 'temp_decompiled/res/values-v31/colors.xml']:
    print(f"=== {xml_file} ===")
    with open(xml_file, 'r', encoding='utf-8') as f:
        t = f.read()
    for c in colors_to_check:
        m = re.search(r'<color name="' + c + r'">([^<]+)</color>', t)
        if m:
            print(f"  {c}: {m.group(1)}")
