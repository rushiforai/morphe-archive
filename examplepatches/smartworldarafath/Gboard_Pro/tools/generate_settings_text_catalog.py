import xml.etree.ElementTree as ET
import os

xml_path = 'pixelboard-patches/extensions/extension/src/main/settings-text/gboard_settings_text.xml'
tree = ET.parse(xml_path)
root = tree.getroot()

declared_locales = [l for l in root.get('locales', '').split() if l]

string_entries = []
plural_entries = []

for entry in root:
    tag = entry.tag
    name = entry.get('name')
    if tag == 'string':
        translations = {}
        for t in entry.findall('translation'):
            loc = t.get('locale')
            txt = t.text or ''
            translations[loc] = txt
        string_entries.append((name, translations))
    elif tag == 'plurals':
        quantities = []
        for item in entry.findall('item'):
            q = item.get('quantity')
            translations = {}
            for t in item.findall('translation'):
                loc = t.get('locale')
                txt = t.text or ''
                translations[loc] = txt
            quantities.append((q, translations))
        plural_entries.append((name, quantities))

def escape_java(s):
    return s.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n').replace('\r', '')

lines = [
    "package com.akshaykadam.pixelboard.extension.settings;",
    "",
    "import java.util.HashMap;",
    "import java.util.Map;",
    "import com.akshaykadam.pixelboard.extension.R;",
    "",
    "final class GboardSettingsTextCatalog {",
    "    private static final Map<String, Map<Integer, String>> CATALOGS = createCatalogs();",
    "    private static final Map<Integer, String> ENGLISH = CATALOGS.get(\"en\");",
    "",
    "    private GboardSettingsTextCatalog() {}",
    "",
    "    static String template(int resId, String languageTag) {",
    "        if (languageTag != null) {",
    "            Map<Integer, String> catalog = CATALOGS.get(languageTag);",
    "            if (catalog != null) {",
    "                String text = catalog.get(resId);",
    "                if (text != null) return text;",
    "            }",
    "        }",
    "        return ENGLISH != null ? ENGLISH.get(resId) : null;",
    "    }",
    "",
    "    static String quantityTemplate(int resId, String languageTag, int quantity) {"
]

for name, quantities in plural_entries:
    one_txt = ""
    other_txt = ""
    for q, trans in quantities:
        if q == 'one':
            one_txt = trans.get('en', '')
        elif q == 'other':
            other_txt = trans.get('en', '')
    if not other_txt and quantities:
        other_txt = quantities[-1][1].get('en', '')
    lines.append(f"        if (resId == R.string.{name}) {{")
    lines.append(f'            return quantity == 1 ? "{escape_java(one_txt)}" : "{escape_java(other_txt)}";')
    lines.append("        }")

lines.extend([
    "        return null;",
    "    }",
    "",
    "    private static Map<String, Map<Integer, String>> createCatalogs() {",
    "        Map<String, Map<Integer, String>> catalogs = new HashMap<String, Map<Integer, String>>();"
])

for locale in declared_locales:
    lines.append("        {")
    lines.append("            Map<Integer, String> map = new HashMap<Integer, String>();")
    for name, translations in string_entries:
        txt = translations.get(locale, translations.get('en', ''))
        lines.append(f'            map.put(R.string.{name}, "{escape_java(txt)}");')
    lines.append(f'            catalogs.put("{locale}", map);')
    lines.append("        }")

lines.extend([
    "        return catalogs;",
    "    }",
    "}",
    ""
])

target_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardSettingsTextCatalog.java'
os.makedirs(os.path.dirname(target_path), exist_ok=True)
with open(target_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

print(f"Generated GboardSettingsTextCatalog.java with {len(string_entries)} strings for {len(declared_locales)} locales successfully!")
