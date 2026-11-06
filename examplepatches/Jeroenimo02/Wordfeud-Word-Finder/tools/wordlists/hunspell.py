"""Expands a Hunspell dictionary (.dic + .aff) into its word forms (standard library only).

Supports the affix features the Finnish dictionary we use needs: SFX/PFX rules with strip, add and condition, cross
products (a prefix with "Y" also applies to suffixed forms), flag type "num" (comma separated) or single
characters. Twofold affixes (continuation flags on affixes) and compounding are not expanded.
"""
import re


def parse_aff(text):
    rules = {}
    flag_num = False
    for line in text.splitlines():
        p = line.split()
        if not p:
            continue
        if p[0] == "FLAG" and len(p) > 1:
            flag_num = p[1] == "num"
        if len(p) >= 4 and p[0] in ("SFX", "PFX"):
            if p[1] not in rules:
                rules[p[1]] = [p[0], p[2] == "Y", []]
                continue
            if len(p) >= 5:
                strip = "" if p[2] == "0" else p[2]
                add = p[3].split("/")[0]
                add = "" if add == "0" else add
                cond = None
                if p[4] != ".":
                    cond = re.compile(("^" if p[0] == "PFX" else "") + p[4] + ("$" if p[0] == "SFX" else ""))
                rules[p[1]][2].append((strip, add, cond))
    return rules, flag_num


def _apply(rules, word, flag):
    kind, _, entries = rules[flag]
    out = []
    for strip, add, cond in entries:
        if cond is not None and not cond.search(word):
            continue
        if kind == "SFX":
            if strip and not word.endswith(strip):
                continue
            out.append(word[: len(word) - len(strip)] + add)
        else:
            if strip and not word.startswith(strip):
                continue
            out.append(add + word[len(strip):])
    return out


def expand(dic_text, aff_text):
    """Yields every word form (with duplicates) of the dictionary."""
    rules, flag_num = parse_aff(aff_text)
    lines = dic_text.splitlines()
    for line in lines[1:]:  # the first line is the entry count
        line = line.strip()
        if not line:
            continue
        word, _, flags = line.partition("/")
        flags = flags.split()[0] if flags else ""
        fl = [f for f in (flags.split(",") if flag_num else list(flags)) if f in rules]
        yield word
        suffixed = []
        for f in fl:
            if rules[f][0] == "SFX":
                suffixed += _apply(rules, word, f)
        yield from suffixed
        for f in fl:
            if rules[f][0] == "PFX":
                yield from _apply(rules, word, f)
                if rules[f][1]:
                    for s in suffixed:
                        yield from _apply(rules, s, f)
