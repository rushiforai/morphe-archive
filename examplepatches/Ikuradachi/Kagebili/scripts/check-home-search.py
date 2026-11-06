"""Check emitted Home search precedence; pass the emitted HomeFragmentV2.smali path."""
from pathlib import Path
import sys

from home_smali import PAGER, TABS, SEARCH, method, run, state

text = Path(sys.argv[1]).read_text()
body = method(text, 'morpheReconcileSingleHomePage')
hide_body = method(text, 'hideHomeSearchBar')
for count in (0, 1, 2, 5):
    s = state(count=count, stored=3)
    run(body, s, hide_body)
    assert s['root']['views'][SEARCH]['visibility'] == (0 if count == 1 else 8)
    assert s['root']['views'][SEARCH]['parent']['visibility'] == (0 if count == 1 else 8)
    assert s['hidden'] == (count == 1)
    assert s['stored'] == (0 if count == 1 else 3)
for count in (0, 2):
    s = state(); run(body, s, hide_body)
    s['events'].clear(); s['root']['views'][PAGER]['adapter']['count'] = count
    run(body, s, hide_body)
    assert s['events'] == [('tabs', 0), ('search', 8), ('parent', 8)]
    assert not s['hidden']
for missing in ('root', 'pager', 'adapter', 'tabs', 'search', 'parent'):
    for count in (0, 1, 2):
        s = state(count=count)
        if missing == 'root': s['root'] = None
        elif missing == 'adapter': s['root']['views'][PAGER]['adapter'] = None
        elif missing == 'parent': s['root']['views'][SEARCH]['parent'] = None
        else: s['root']['views'].pop({'pager': PAGER, 'tabs': TABS, 'search': SEARCH}[missing])
        run(body, s, hide_body)
s = state(count=2, visibility=8); run(body, s, hide_body)
assert s['root']['views'][TABS]['visibility'] == 8, 'restored an unrelated hidden row'
print('PASS: emitted Home search precedence, count transitions and missing bindings')
