import xml.etree.ElementTree as ET

tree = ET.parse('temp_decompiled/res/values/arrays.xml')
root = tree.getroot()

for arr in root.iter('string-array'):
    name = arr.attrib.get('name')
    items = [it.text for it in arr.findall('item')]
    if any('hour' in (x or '').lower() or 'day' in (x or '').lower() or x in ['1', '24', '168'] for x in items):
        print(f"{name}: {items}")
