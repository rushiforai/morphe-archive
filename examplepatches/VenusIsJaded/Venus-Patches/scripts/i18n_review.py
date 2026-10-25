#!/usr/bin/env python3
"""Developer-only: validates and loads a hand-reviewed translation into scripts/i18n_overrides/<code>.json and patches/src/main/resources/venus/i18n/<code>.json.

    node scripts/i18n_strings.cjs > work/strings.json
    node scripts/i18n_plurals.cjs > work/plurals.json
    python3 scripts/i18n_review.py keys                 # numbered list of the texts a reviewer translates
    python3 scripts/i18n_review.py load <code> <file>   # file: one "index|text" per line (or JSON dict)

Never use Google Translate or Acorn. Every translation must be hand-reviewed for accuracy, tone, and CLDR plural forms.
Language names, times and "and" are left out of the list: scripts/i18n_cldr.cjs fills them from CLDR.
A plural text gives every form of its language joined by " || " (one || other, or one || few || many...).
Every {placeholder} and product name is checked before anything is written.
"""
import json, os, re, subprocess, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.makedirs(os.path.join(ROOT, 'work'), exist_ok=True)
STRINGS = json.loads(subprocess.check_output(['node', os.path.join(ROOT, 'scripts/i18n_strings.cjs')], text=True))
PL = json.loads(subprocess.check_output(['node', os.path.join(ROOT, 'scripts/i18n_plurals.cjs')], text=True))
SOURCE = open(os.path.join(ROOT, 'patches/src/main/resources/venus/bootstrap.js'), encoding='utf-8').read()
NAMES = set(re.findall(r':"([^"]+)"', re.search(r'const LANGUAGE_NAMES = \{([\s\S]*?)\};', SOURCE).group(1)))
UNITS = ('second', 'minute', 'hour', 'day', 'month', 'year')
CLDR = {'just now', '{time} ago', 'and', '{n} seconds ago', '{n} second ago'} | {f'{{n}} {u}s' for u in UNITS if u != 'second'} | {f'{{n}} {u}' for u in UNITS if u != 'second'}
KEYS = [k for k in STRINGS if k not in NAMES and k not in CLDR]
FORMS = {**{c: ['one', 'other'] for c in 'bg da de el es fi hu it nl no sv tr fr pt-BR hi'.split()},
         **{c: ['other'] for c in 'ja ko zh-CN zh-TW th vi id'.split()},
         **{c: ['one', 'few', 'many'] for c in 'ru uk pl'.split()}, **{c: ['one', 'few', 'other'] for c in 'hr cs lt ro'.split()}}
KEEP = ['Venus', 'Discord', 'Google Translate', 'ReviewDB', 'Nitro', 'GitHub', 'GIF', 'GPL-3.0', 'manti.vendicated.dev', '@unknown-user', 'Android', 'Revenge', 'Vendetta', 'Blurple']
ph = lambda t: sorted(re.findall(r'\{\w+\}', t))


def load(code, path):
    forms, out, errors = FORMS[code], {}, []
    for line in open(path, encoding='utf-8'):
        line = line.rstrip('\n')
        if not line.strip(): continue
        index, text = line.split('|', 1); key = KEYS[int(index)]
        if key in PL:
            parts = [p.strip() for p in text.split(' || ')]
            if len(parts) != len(forms): errors.append(f'{index}: needs {len(forms)} forms'); continue
            value = parts[0] if len(forms) == 1 else dict(zip(forms, parts))
        else:
            parts = [text.strip()]; value = parts[0]
        for t in parts:
            if ph(t) != ph(key): errors.append(f'{index}: placeholders in {t!r}')
            errors += [f'{index}: lost {k}' for k in KEEP if k in key and k not in t]
        out[key] = value
    missing = [i for i, k in enumerate(KEYS) if k not in out]
    if missing: errors.append(f'missing {missing}')
    if errors: raise SystemExit(code + ':\n' + '\n'.join(errors))
    with open(os.path.join(ROOT, f'scripts/i18n_overrides/{code}.json'), 'w', encoding='utf-8') as f:
        json.dump(out, f, ensure_ascii=False, indent=1); f.write('\n')
    pack_path = os.path.join(ROOT, f'patches/src/main/resources/venus/i18n/{code}.json')
    pack = json.load(open(pack_path, encoding='utf-8')); pack['strings'].update(out)
    pack['strings'] = {s: pack['strings'][s] for s in STRINGS if s in pack['strings']}
    with open(pack_path, 'w', encoding='utf-8') as f:
        json.dump(pack, f, ensure_ascii=False, indent=1); f.write('\n')
    print(code, 'ok', len(out))


if __name__ == '__main__':
    if sys.argv[1] == 'keys':
        for i, k in enumerate(KEYS): print(f'{i}|{k}')
    else: load(sys.argv[2], sys.argv[3])
