import xml.etree.ElementTree as ET

for fn in ['temp_decompiled/res/values/arrays.xml', 'temp_decompiled/res/values/strings.xml']:
    try:
        tree = ET.parse(fn)
        root = tree.getroot()
        for elem in root:
            name = elem.attrib.get('name')
            if name in ['array_0x7f03004a', 'string_0x7f140b69', 'string_0x7f140911', 'string_0x7f1413f8']:
                if elem.tag == 'string-array':
                    items = [it.text for it in elem.findall('item')]
                    print(f'{name} (array): {items}')
                else:
                    print(f'{name}: {elem.text}')
    except Exception as e:
        print(f'Error reading {fn}: {e}')
