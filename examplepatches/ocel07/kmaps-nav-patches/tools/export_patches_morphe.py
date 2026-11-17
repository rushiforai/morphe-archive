"""Export the Morphe NAVER patch sites as ledger rows (kind PATCH).

usage: export_patches_morphe.py --out patches_<ver>.tsv
Rows: every Site in src/dev/ubxbridge/morphe/NaverSites.kt (class, note, first anchor line, n) plus the hand-written
sites of NaverPatch.kt listed in HAND below (keep HAND in sync when NaverPatch.kt gets a new hand site).
Patch ids come from export_patches_naver.ID (class simple name -> inventory id; see docs/naver-rate-patch.md).
"""
import argparse, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from export_patches_naver import ID  # noqa: E402

SITES = os.path.join(HERE, '..', 'patches', 'src', 'main', 'kotlin', 'app', 'kmaps', 'patches', 'naver', 'NaverSites.kt')
MRC = 'com/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/MergeRoadChecker'
HAND = [  # class, note, anchor first line, patch id  (NaverPatch.kt)
    ('com/naver/map/core/common/location/FusedLocationSource', 'N1 setInterval', 'const-wide/16 *, 0x3e8', 'N1'),
    ('com/naver/map/core/common/location/SystemLocationSource', 'N1 minTime', 'const-wide/16 *, 0x3e8', 'N1'),
    ('com/naver/map/core/navigation/NaviStore', 'B3 track', 'if-eqz *, L', 'guide-B3'),
    (MRC, 'M9 merge miss', 'add-int/lit8 v0, v0, 0x1', 'M9'),
    (MRC, 'M9 merge skip', 'add-int/lit8 v0, v0, 0x1', 'M9'),
]


KAKAO = os.path.join(HERE, '..', 'patches', 'src', 'main', 'kotlin', 'app', 'kmaps', 'patches', 'kakao', 'KakaoPatch.kt')


def kakao_rows():
    """KakaoPatch.kt sites: cls = "src:File.kt"; patch id = first word of the note (K1, K2, ...)"""
    kt = open(KAKAO, encoding='utf-8').read()
    rows, seen = [], {}
    for m in re.finditer(r'cls = "(src:[^"]+)", note = "([^"]*)".*?anchor = listOf\(\s*"((?:[^"\\]|\\.)*)"', kt, re.S):
        cls, note, a0 = m.group(1), m.group(2), m.group(3).replace('\\$', '$')
        k = (cls, note, a0)
        seen[k] = seen.get(k, 0) + 1
        rows.append(('PATCH', cls, note, a0, str(seen[k]), note.split()[0]))
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', required=True)
    ap.add_argument('--sites', default=SITES)
    ap.add_argument('--app', choices=['naver', 'kakao'], default='naver')
    a = ap.parse_args()
    if a.app == 'kakao':
        rows = kakao_rows()
        with open(a.out, 'w', encoding='utf-8', newline='\n') as o:
            o.write('kind\tclass\tdesc\tdetail\tn\tpatch_id\n')
            o.writelines('\t'.join(r) + '\n' for r in rows)
        print(len(rows), 'patch rows')
        return
    kt = open(a.sites, encoding='utf-8').read()
    rows, seen = [], {}
    for m in re.finditer(r'cls = "L([^"]+);", note = "([^"]*)".*?anchor = listOf\("((?:[^"\\]|\\.)*)"', kt, re.S):
        cls, note, a0 = m.group(1).replace('\\$', '$'), m.group(2), m.group(3).replace('\\$', '$')
        k = (cls, note, a0)
        seen[k] = seen.get(k, 0) + 1
        rows.append(('PATCH', cls, note, a0, str(seen[k]), ID.get(cls.rsplit('/', 1)[-1], '?')))
    for c, n, a0, i in HAND:
        rows.append(('PATCH', c, n, a0, '1', i))
    with open(a.out, 'w', encoding='utf-8', newline='\n') as o:
        o.write('kind\tclass\tdesc\tdetail\tn\tpatch_id\n')
        for r in rows:
            o.write('\t'.join(r) + '\n')
    unknown = [r[1] for r in rows if r[5] == '?']
    print(len(rows), 'patch rows', '(unknown id: %s)' % unknown if unknown else '')


if __name__ == '__main__':
    sys.exit(main())
