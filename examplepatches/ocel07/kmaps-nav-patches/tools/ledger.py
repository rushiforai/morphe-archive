"""Build the classification ledger: every scanner candidate and every patch site, each with a verdict.

usage: ledger.py --hits a.tsv [--hits b.tsv ...] --rules rules.tsv --out ledger.tsv [--strict]

hits TSV (scan_smali.py / scan_atlan_epoch.py / export_patches.py):
    kind  class  desc  detail  n  <info columns...>
rules TSV (hand-written verdicts, '#' lines are comments):
    kind  class  desc  detail  n  verdict  ref  reason
  - '*' matches anything; class 'a/b/**' matches the package prefix, 'a/b/Cls**' the class and its inner classes.
  - the most specific matching rule wins (exact fields count more than wildcards).
  - ref '@col' takes the ref from that column of the hit row (e.g. '@patch_id' for exported patch rows).
verdicts: PATCHED (ref = patch id), OK (rate independent), INACTIVE (path not used on this head unit / config),
          OUT (outside the vehicle-navigation scope)
Candidates no rule matches are UNCLASSIFIED: classify them before shipping a build (docs/app-update-patch-plan.md L3).
Rules that match nothing are reported as STALE (code removed or renamed: re-check).
--strict exits 1 when anything is UNCLASSIFIED.
"""
import argparse, collections, sys

KEY = ('kind', 'class', 'desc', 'detail', 'n')
VERDICTS = {'PATCHED', 'OK', 'INACTIVE', 'OUT'}


def read_tsv(path):
    rows = []
    with open(path, encoding='utf-8') as f:
        header = None
        for line in f:
            line = line.rstrip('\n')
            if not line or line.startswith('#'):
                continue
            cols = line.split('\t')
            if header is None:
                header = cols
                continue
            rows.append(dict(zip(header, cols + [''] * (len(header) - len(cols)))))
    return header, rows


def field_score(pat, val, is_class=False):
    if pat == '*':
        return 0
    if is_class and pat.endswith('**'):          # 'pkg/**' = package, 'pkg/Cls**' = class and its inner classes
        return 1 if val.startswith(pat[:-2]) else None
    return 3 if pat == val else None


def match(rule, hit):
    total = 0
    for k in KEY:
        s = field_score(rule[k], hit.get(k, ''), k == 'class')
        if s is None:
            return None
        total += s
    return total


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--hits', action='append', required=True)
    ap.add_argument('--rules', required=True)
    ap.add_argument('--out', required=True)
    ap.add_argument('--strict', action='store_true')
    a = ap.parse_args()

    _, rules = read_tsv(a.rules)
    for i, r in enumerate(rules):
        r['_i'] = i
        if r['verdict'] not in VERDICTS:
            sys.exit(f'bad verdict in rule {i + 1}: {r}')
    hits, extra_cols = [], []
    for h in a.hits:
        hdr, rows = read_tsv(h)
        extra_cols += [c for c in hdr if c not in KEY and c not in extra_cols]
        hits += rows

    used = collections.Counter()
    out = []
    for h in hits:
        best = None
        for r in rules:
            s = match(r, h)
            if s is not None and (best is None or s > best[0]):
                best = (s, r)
        if best:
            r = best[1]
            used[r['_i']] += 1
            ref = h.get(r['ref'][1:], '') if r['ref'].startswith('@') else r['ref']   # '@col' = take ref from the hit row
            out.append((h, r['verdict'], ref, r['reason']))
        else:
            out.append((h, 'UNCLASSIFIED', '', ''))

    with open(a.out, 'w', encoding='utf-8', newline='\n') as o:
        o.write('\t'.join(list(KEY) + ['verdict', 'ref', 'reason'] + extra_cols) + '\n')
        for h, v, ref, why in sorted(out, key=lambda x: (x[1] != 'UNCLASSIFIED', x[0]['kind'], x[0]['class'], x[0]['desc'], x[0]['n'])):
            o.write('\t'.join([h.get(k, '') for k in KEY] + [v, ref, why] + [h.get(c, '') for c in extra_cols]) + '\n')

    cnt = collections.Counter(v for _, v, _, _ in out)
    print(f'{len(out)} rows:', dict(sorted(cnt.items())))
    unc = [h for h, v, _, _ in out if v == 'UNCLASSIFIED']
    for h in unc[:50]:
        print('  UNCLASSIFIED', '\t'.join(h.get(k, '') for k in KEY), h.get('method', ''))
    stale = [r for r in rules if not used[r['_i']]]
    for r in stale:
        print('  STALE rule', '\t'.join(r[k] for k in KEY), '->', r['verdict'], r['ref'])
    if a.strict and unc:
        return 1


if __name__ == '__main__':
    sys.exit(main())
