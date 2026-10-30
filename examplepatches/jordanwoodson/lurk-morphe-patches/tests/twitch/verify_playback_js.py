#!/usr/bin/env python3
"""Execute the original RN auto-advance callback with the actual emitted enabled-argument edit.

Usage: python3 tests/twitch/verify_playback_js.py DECOMPILED_JS STOCK_HBC PATCHED_HBC MANIFEST
Use STOCK_HBC for PATCHED_HBC as a negative control; the next-video assertion must fail.
"""
from pathlib import Path
import json
import re
import subprocess
import sys

source = Path(sys.argv[1]).read_text()
start = source.index('Original name: useClipAutoAdvance,')
start = source.index('r5 = function(a0, a1, a2)', start) + len('r5 = ')
end = source.index('};\n                r0 = 11;', start) + 1
effect = source[start:end]
effect = re.sub(r'function\([^)]*\) \{', lambda m: m[0] + 'var ' + ','.join(f'r{i}' for i in range(32)) + ';', effect)
manifest = json.loads(Path(sys.argv[4]).read_text())
edits = [e for e in manifest['edits'] if e['key'] == 'autoplay_next_video_off']
assert len(edits) == 1
edit = edits[0]
assert edit['original'] == '440c070171'  # GetByIdShort r12, r7, 'enabled' (31.8.0 string 113)
assert edit['replacement'] == '960c100c0c'
offset = edit['offset']
stock = Path(sys.argv[2]).read_bytes()[offset:offset + 5]
patched = Path(sys.argv[3]).read_bytes()[offset:offset + 5]
assert stock.hex() == edit['original']
def enabled(code, requested):
    if code == bytes.fromhex('440c070171'):
        return requested
    assert code == bytes.fromhex('960c100c0c'), code.hex()
    # LoadConstFalse r12; Mov r12,r12. Two reachable instructions, no padding/relocation.
    return False

runner = r'''
const assert=require('node:assert/strict');
function run(enabled, index=0, rows=2) {
    const calls=[], commits=[], scrolls=[];
    const _closure1_slot0=enabled;
    const _closure1_slot2=()=>index;
    const _closure0_slot0=()=>({clipAutoAdvance:{shouldAdvance:()=>true}});
    const _closure0_slot1=new Proxy({}, {get:()=>0});
    const _closure1_slot7={getState:()=>({obstructionCount:0})};
    const _closure1_slot8={current:{identity:'feed',clipItemIds:new Set(),adItemIds:new Set()}};
    const _closure1_slot3='feed';
    const _closure1_slot4={current:rows};
    const _closure1_slot9={current:()=>calls.push('auto')};
    const _closure1_slot6=i=>commits.push(i);
    const _closure1_slot5={current:{scrollToIndex:()=>scrolls.push(true)}};
    const effect=EFFECT;
    effect('clip','one',index);
    effect('clip','one',index);
    return {calls,commits,scrolls};
}
assert.deepEqual(run(STOCK_ENABLED),{calls:['auto'],commits:[1],scrolls:[true]},'stock automatic advance negative control');
assert.deepEqual(run(PATCHED_ENABLED),{calls:[],commits:[],scrolls:[]},'patched next-video must not advance');
assert.deepEqual(run(false),{calls:[],commits:[],scrolls:[]},'existing false option');
assert.deepEqual(run(true,1,2),{calls:[],commits:[],scrolls:[]},'last row stays put');
console.log('PASS: original RN clip completion callback: stock advance, emitted disabled argument, no duplicate advance, end-of-feed bound');
'''.replace('EFFECT', effect).replace('STOCK_ENABLED', str(enabled(stock, True)).lower()).replace(
    'PATCHED_ENABLED', str(enabled(patched, True)).lower())
subprocess.run(['node', '-'], input=runner, text=True, check=True)
