import xml.etree.ElementTree as ET

tree = ET.parse('temp_decompiled/AndroidManifest.xml')
root = tree.getroot()
android_ns = '{http://schemas.android.com/apk/res/android}'

for activity in root.iter('activity'):
    name = activity.attrib.get(android_ns + 'name')
    for intent_filter in activity.iter('intent-filter'):
        for action in intent_filter.iter('action'):
            act_name = action.attrib.get(android_ns + 'name')
            if act_name and 'FIRST_RUN' in act_name:
                print('FIRST_RUN Activity:', name)
