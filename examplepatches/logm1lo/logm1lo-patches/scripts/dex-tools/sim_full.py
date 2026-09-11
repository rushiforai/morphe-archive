#!/usr/bin/env python3
"""Full Application clinit state machine simulator for (v3, v4) key recovery."""
import ctypes
u32 = lambda x: ctypes.c_uint32(x).value

def java_hashcode(s):
    h = 0
    for c in s:
        h = (31 * h + ord(c)) & 0xFFFFFFFF
    return h

def charAt(s, i):
    return ord(s[i])

# Switch cases (from the DEX sparse-switch)
CASES = {
    0xfe5971ce: 'sswitch_29b', 0xff9a5d3a: 'sswitch_277', 0xff9bd29f: 'sswitch_262',
    0xff9efc21: 'sswitch_22d', 0xff9f0110: 'sswitch_220', 0xffd985df: 'sswitch_1fc',
    0xffe551e2: 'sswitch_1e3', 0xffe56eb0: 'sswitch_1b3', 0xffe5868c: 'sswitch_188',
    0x1ab77d: 'sswitch_180', 0x1c12ec: 'sswitch_146', 0x316000: 'sswitch_109',
    0x33dc1e: 'sswitch_db', 0x6434c8: 'sswitch_a0', 0x643d7b: 'sswitch_97',
    0x8076e2: 'sswitch_8b', 0xb65cc5: 'sswitch_6d', 0xbe48cb: 'sswitch_4d',
}

def simulate(v3, v4, max_steps=200):
    """Simulate the state machine. Returns (status, path, decrypted_strings)."""
    # First dispatch
    v6 = u32(u32(0x0733 * 0x0733 ^ v3) + 0x1a76)
    path = []
    decrypted = []
    for step in range(max_steps):
        if v6 not in CASES:
            return ('nomatch', path, decrypted, hex(v6))
        name = CASES[v6]
        path.append(name)
        if name == 'sswitch_180':
            # terminal: System.setProperty(v7, v8)
            return ('terminal', path, decrypted, None)
        if name == 'sswitch_4d':
            # reads fields, branches to cond_5d or sswitch_6d etc.
            # sswitch_4d -> if sget-boolean != 0 -> cond_5d (hashcode^v4) else goto_284
            # This requires knowing the boolean field value (native). Assume a path.
            # cond_5d: v6 = hashCode('\u06da\u06d7\u1a74') ^ v4
            v6 = u32(java_hashcode('\u06da\u06d7\u1a74') ^ v4)
        elif name == 'sswitch_6d':
            # sswitch_6d: calls a function, if result != 0 -> cond_7d (charAt routing) else goto_2cc
            # cond_7d: v5 = charAt('\u0730\u06e8\u0736',1) ^ v4 -> ... -> v6 = ... via goto_164
            # Complex; for now route via the charAt computation
            s = '\u0730\u06e8\u0736'
            v5 = u32(charAt(s, 1) ^ v4)
            v5 = u32(v5 * charAt(s, 0))
            v6 = u32(v5 - charAt(s, 2))
        elif name == 'sswitch_1e3':
            # decrypt case! uses v2 key. Then cond_1f0: v6 = hashCode('\u06db\u073a\u06db') ^ v3
            decrypted.append(('sswitch_1e3', 'v2'))
            v6 = u32(java_hashcode('\u06db\u073a\u06db') ^ v3)
        elif name == 'sswitch_1b3':
            decrypted.append(('sswitch_1b3', 'v2'))
            v6 = u32(java_hashcode('\u073a\u0730\u1a7b') ^ v3)
        elif name == 'sswitch_188':
            # aget-short, then cond_194: v6 = ... charAt
            s = '\u1a79\u073f\u06ec'
            v11 = u32(charAt(s, 1) ^ v4)
            v11 = u32(v11 * charAt(s, 0))
            v6 = u32(v11 - charAt(s, 2))
        elif name == 'sswitch_db':
            # sget-object + sget-boolean; if != 0 -> cond_eb else goto_e5
            s = '\u06d6\u0733\u06d6'
            v6 = u32(u32(charAt(s, 0) * 0x3c1 + charAt(s, 1) * 0x1f) ^ v4 + charAt(s, 2))
        elif name == 'sswitch_109':
            # singleton init + sget; if >= 0 -> ... else cond_126
            s = '\u06d7\u06e7\u073d'
            v5 = u32(charAt(s, 1) ^ v4)
            v5 = u32(v5 * charAt(s, 0))
            v6 = u32(v5 - charAt(s, 2))
        elif name == 'sswitch_146':
            # add/sub arithmetic; if <= 0 -> cond_15c else...
            s = '\u06db\u073f\u05a8'
            v5 = u32(charAt(s, 1) ^ v3)
            v5 = u32(v5 * charAt(s, 0))
            v6 = u32(v5 - charAt(s, 2))
        elif name == 'sswitch_a0':
            s = '\u1a76\u06dc\u05a1'
            v13 = u32(charAt(s, 1) * charAt(s, 2) ^ v4 + charAt(s, 0))
            v6 = u32(v13)
        elif name == 'sswitch_97':
            return ('throw', path, decrypted, None)
        elif name == 'sswitch_8b':
            v6 = 0x52de
        elif name == 'sswitch_1fc':
            v6 = u32(java_hashcode('\u06d8\u0736\u06d9') ^ v3)
        elif name == 'sswitch_220':
            v6 = 0x93e4 + 0x14
        elif name == 'sswitch_22d':
            v6 = u32(u32(charAt('\u06e0\u06d8\u1a73', 0) * 0x3c1 + charAt('\u06e0\u06d8\u1a73', 1) * 0x1f) ^ v4 + charAt('\u06e0\u06d8\u1a73', 2))
        elif name == 'sswitch_262':
            v6 = 0x63fb
        elif name == 'sswitch_277':
            v6 = u32(charAt('\u06dc\u06e8\u06dc', 1) ^ v4)
            v6 = u32(v6 * charAt('\u06dc\u06e8\u06dc', 0) - charAt('\u06dc\u06e8\u06dc', 2))
        elif name == 'sswitch_29b':
            v6 = u32(u32(charAt('\u1a7a\u06da\u06e7', 0) * 0x3c1 + charAt('\u1a7a\u06da\u06e7', 1) * 0x1f) ^ v3 + charAt('\u1a7a\u06da\u06e7', 2))
        else:
            return ('unknown_case', path, decrypted, name)
    return ('loop', path, decrypted, None)

if __name__ == '__main__':
    import sys
    # Test all v3 candidates with v4=0
    v3_candidates = {
        0x29492e, 0x282c5f, 0x291a3, 0x1581, 0x57ce7b, 0x57f72c, 0xb38845,
        0x859666, 0x8dfa7c, 0xfe6a8371, 0xffa996ed, 0xffa86c00, 0xffad3582,
        0xffad32b3, 0xffeabf40, 0xffd6e345, 0xffd68013, 0xffd6b83f}
    for v3 in sorted(v3_candidates):
        result = simulate(v3, 0)
        status = result[0]
        path = result[1]
        dec = result[2]
        print(f'v3={hex(v3)}: {status} path={path[:4]}... dec={dec[:2]}')
