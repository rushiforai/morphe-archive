#!/usr/bin/env python3
from pathlib import Path
import sys

root = Path(sys.argv[1])
p = root / 'smali/com/sauzask/nicoid/NicoidTopActivity.smali'
s = p.read_text()
needle = '    invoke-static {v0, v7}, Le/e/a/ModernShorts;->finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V'
assert s.count(needle) == 1
p.write_text(s.replace(needle, '    invoke-static {v0, v7}, Le/e/a/AccountPage;->addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V\n\n' + needle))
p = next(root.glob('smali*/e/e/a/i2$a.smali'))
s = p.read_text()
assert '/v1/users/me/watch/history?target=' in s
p.write_text(s.replace('/v1/users/me/watch/history?target=', '/v2/users/me/watch/history?target='))
p = next(root.glob('smali*/e/e/a/i2$a$a.smali'))
s = p.read_text()
needle = '    const/16 v1, 0xc9\n\n    if-eq v0, v1, :cond_0'
assert needle in s
p.write_text(s.replace(needle, needle + '\n\n    const/16 v1, 0xcc\n\n    if-eq v0, v1, :cond_0'))
