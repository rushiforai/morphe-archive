#!/usr/bin/env python3
"""Decode Discord's color token tables straight from the Hermes bundle, for testing Custom themes.

    python3 scripts/hbc/color_tables.py [work/new/assets/index.android.bundle] [out.json]

Writes {"raw": RawColors (591), "sem": SemanticColors (589), "exp": SemanticColorExperiments (590)} as JSON
(default work/discord_colors.json). These modules are straight-line object literals, so a tiny register machine
over their factory bytecode rebuilds them exactly. Theme slot keys come from Themes (588)."""
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from hbc import Bundle

def decode(bundle, module, themes):
    h = bundle.h
    regs, out = {}, None
    for ins in h.dis(h.func(bundle.modules[module])):
        parts = ins.split(None, 2)
        op = parts[1]
        args = [int(x) for x in parts[2].split(']')[0].strip('[').split(',')] if '[' in ins else []
        name = ins.split(';')[-1].strip().strip("'") if ';' in ins else None
        if op in ('NewObjectWithBuffer', 'NewObjectWithBufferLong'):
            keys = h.keys(args[1])
            regs[args[0]] = dict(zip(keys, h._literal(h.litOff + args[2], len(keys), h.string)))
        elif op == 'NewObject': regs[args[0]] = {}
        elif op == 'GetById' and name in themes: regs[args[0]] = themes[name]
        elif op == 'DefineOwnByVal': regs[args[0]][regs[args[2]]] = regs[args[1]]
        elif op == 'DefineOwnById': regs[args[0]][name] = regs[args[1]]
        elif op in ('PutOwnBySlotIdx', 'PutOwnBySlotIdxLong'):
            target = regs[args[0]]; target[list(target.keys())[args[2]]] = regs[args[1]]
        elif op == 'Mov': regs[args[0]] = regs.get(args[1])
        elif op == 'PutByIdStrict' and name == '_private': out = regs[args[1]]
    return out

def themes_of(bundle):
    # Themes (588): {ASH:'dark', LIGHT:'light', ONYX:'midnight', DARK:'darker'}.
    h = bundle.h
    for ins in h.dis(h.func(bundle.modules[588])):
        if 'NewObjectWithBufferLong' in ins:
            a = [int(x) for x in ins.split('[')[1].split(']')[0].split(',')]
            keys = h.keys(a[1])
            if 'ASH' in keys: return dict(zip(keys, h._literal(h.litOff + a[2], len(keys), h.string)))
    raise SystemExit('Themes (588) not found')

if __name__ == '__main__':
    path = sys.argv[1] if len(sys.argv) > 1 else 'work/new/assets/index.android.bundle'
    dest = sys.argv[2] if len(sys.argv) > 2 else 'work/discord_colors.json'
    B = Bundle(path)
    themes = themes_of(B)
    tables = {'raw': decode(B, 591, themes)['RawColors'], 'sem': decode(B, 589, themes)['SemanticColors'],
              'exp': decode(B, 590, themes)['SemanticColorExperiments'], 'themes': themes}
    slots = list(themes.values())
    broken = [k for k, v in tables['sem'].items() if not isinstance(v, dict) or not all(isinstance(v.get(s), dict) for s in slots)]
    if broken: raise SystemExit(f'{len(broken)} tokens decoded incompletely, e.g. {broken[:5]}')
    json.dump(tables, open(dest, 'w'))
    print(f"{len(tables['raw'])} raw colors, {len(tables['sem'])} semantic tokens, {len(tables['exp'])} experiment overrides, slots {slots} -> {dest}")
