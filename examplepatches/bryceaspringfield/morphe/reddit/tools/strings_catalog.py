#!/usr/bin/env python3
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, '../extensions/reddit/src/main/java/io/github/bryceaspringfield/morphe/extension/reddit')
LIT = r'"((?:[^"\\]|\\.)*)"'


def unescape(s):
    return json.loads('"' + s + '"')


def pairs():
    text = open(os.path.join(SRC, 'Strings.java'), encoding='utf-8').read()
    out = []
    for m in re.finditer(r'\bes\(\s*((?:' + LIT + r'\s*\+?\s*)+),\s*((?:' + LIT + r'\s*\+?\s*)+)\);', text):
        en = ''.join(unescape(x) for x in re.findall(LIT, m.group(1)))
        es = ''.join(unescape(x) for x in re.findall(LIT, m.group(3)))
        out.append((en, es))
    return out


def literals():
    found = {}
    for name in sorted(os.listdir(SRC)):
        if not name.endswith('.java') or name == 'Strings.java':
            continue
        text = open(os.path.join(SRC, name), encoding='utf-8').read()
        text = re.sub(r'"\s*\+\s*\n\s*"', '', text)
        for line in text.split('\n'):
            if re.search(r'\bLog\.[a-z]\(|Logger\.|TAG,|throw new|Pattern\.compile|getIdentifier|findPreference|\.matches\(|replaceAll', line):
                continue
            for raw in re.findall(LIT, line):
                s = unescape(raw)
                if len(s) < 2 or re.fullmatch(r'[a-z0-9_.:/$-]+', s) or '://' in s or s.startswith('morphe_'):
                    continue
                if not (re.match(r'[A-Z]', s) or '%s' in s or '%d' in s):
                    continue
                if not (' ' in s or re.fullmatch(r'[A-Z][a-z]+', s)):
                    continue
                found.setdefault(s, name)
    return found


def main():
    known = pairs()
    english = [en for en, _ in known]
    for name in sorted(os.listdir(SRC)):
        if name.endswith('.java'):
            text = open(os.path.join(SRC, name), encoding='utf-8').read()
            for one, many in re.findall(r'count\([^,()]+(?:\([^()]*\))?,\s*' + LIT + r',\s*' + LIT + r'\)', text):
                key = unescape(one) + '|' + unescape(many)
                if key not in english:
                    english.append(key)
    if '--missing' in sys.argv:
        have = set(english)
        for s, where in literals().items():
            if s not in have:
                print(f'{where}\t{s}')
        return
    os.makedirs(os.path.join(ROOT, 'translations'), exist_ok=True)
    with open(os.path.join(ROOT, 'translations/en.txt'), 'w', encoding='utf-8') as fh:
        for s in english:
            fh.write(json.dumps(s, ensure_ascii=False) + '\n')
    print(len(english), 'strings')


if __name__ == '__main__':
    main()
