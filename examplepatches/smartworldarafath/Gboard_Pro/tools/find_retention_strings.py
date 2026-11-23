import xml.etree.ElementTree as ET

tree = ET.parse('temp_decompiled/res/values/strings.xml')
root = tree.getroot()

keywords = ['1 hour', '24 hour', '7 day', '30 day', 'never', 'unlimited']
for s in root.iter('string'):
    text = s.text or ''
    if any(k in text.lower() for k in keywords):
        print(f"{s.attrib.get('name')}: {text}")
