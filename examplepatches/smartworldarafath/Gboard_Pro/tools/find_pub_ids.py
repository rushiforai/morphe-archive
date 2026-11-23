import xml.etree.ElementTree as ET

tree = ET.parse('temp_decompiled/res/values/public.xml')
root = tree.getroot()

for p in root.iter('public'):
    name = p.attrib.get('name')
    if name == 'setting_clipboard':
        print(f"setting_clipboard ID: {p.attrib.get('id')}")
    if name in ['array_0x7f03004a', 'string_0x7f140b69', 'string_0x7f140911']:
        print(f"{name} ID: {p.attrib.get('id')}")
