import re

def check_xml(path):
    print(f"=== Checking {path} ===")
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    patterns = [
        r'<com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference[^>]*pref_key_appearance[^>]*>.*?<\/com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference>',
        r'<com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference[^>]*pref_key_board_ui[^>]*>.*?<\/com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference>',
        r'<com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference[^>]*pref_key_app_updates[^>]*>.*?<\/com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference>',
        r'<com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference[^>]*pref_key_about[^>]*>.*?<\/com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference>',
        r'<com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference[^>]*0x7f140a65[^>]*>.*?<\/com\.google\.android\.apps\.inputmethod\.latin\.preference\.HeaderPreference>'
    ]

    for p in patterns:
        m = re.search(p, content, re.DOTALL)
        if m:
            print("MATCH:", m.group(0))
        else:
            print("NOT FOUND FOR PATTERN:", p[:50])

check_xml('temp_decompiled/res/xml/settings.xml')
