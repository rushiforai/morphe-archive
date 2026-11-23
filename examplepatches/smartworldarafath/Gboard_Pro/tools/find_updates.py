import os

for root, dirs, files in os.walk(r'd:\Gemini Antigravity Project\Project 31 Gboard\pixelboard-patches\extensions'):
    for f in files:
        if f.endswith('.java'):
            p = os.path.join(root, f)
            lines = open(p, encoding='utf-8', errors='ignore').readlines()
            for i, line in enumerate(lines):
                for kw in ['update', 'Update', 'About', 'about', 'version', 'Version']:
                    if kw in line and not line.strip().startswith('//'):
                        print(f'{f}:{i+1}: {line.strip()[:100]}')
                        break
