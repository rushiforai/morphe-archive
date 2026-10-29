#!/usr/bin/env python3
"""Fresh-hierarchy UI controls for the owned penguin AVD; raw PNG/XML evidence."""
import argparse
import json
from pathlib import Path
import sys
import time
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'finamp'))
import android_acceptance as base

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--package', choices=('me.ash.reader','app.morphe.manager','com.android.documentsui','com.android.packageinstaller','com.android.settings','android'), default='me.ash.reader')
p.add_argument('--out', type=Path, default=base.REPO_ROOT / '.scratch/readyou/android/ui')
s = p.add_subparsers(dest='command', required=True)
s.add_parser('inspect'); s.add_parser('back'); s.add_parser('hide-ime'); s.add_parser('launch')
c=s.add_parser('capture');c.add_argument('label')
w=s.add_parser('wait');w.add_argument('label')
t=s.add_parser('tap');t.add_argument('label');t.add_argument('--contains',action='store_true');t.add_argument('--index',type=int);t.add_argument('--hold',action='store_true')
t=s.add_parser('type');t.add_argument('value');t.add_argument('--index',type=int);t.add_argument('--replace',action='store_true')
t=s.add_parser('scroll');t.add_argument('direction',choices=('up','down'))
a=p.parse_args();base.PACKAGE=a.package;base.OUT_ROOT=base.REPO_ROOT / '.scratch/readyou/android'
u=base.Android(out=a.out)
if a.command=='inspect':
    root=u.dump()[0]
    labels=[{'label':x['text'] or x['content-desc'], 'kind':'text' if x['text'] else 'desc', **({'checked':x['checked']} if x['checkable']=='true' else {})} for x in u.labels(root)]
    toggles=[{'class':n.get('class'), 'checked':n.get('checked'), 'bounds':n.get('bounds')} for n in root.iter('node') if n.get('checkable')=='true']
    print(json.dumps({'labels':labels,'toggles':toggles},ensure_ascii=False))
elif a.command=='wait':
    deadline=time.monotonic()+40
    while time.monotonic()<deadline:
        try:
            u.find(u.dump()[0],a.label)
            print(json.dumps({'observed':a.label}))
            break
        except RuntimeError: time.sleep(0.2)
    else: raise RuntimeError('Expected visible label did not appear: '+a.label)
elif a.command=='launch': u.launch(restart=True)
elif a.command=='capture': u.capture(a.label)
elif a.command=='tap':
    # A provider refresh or Compose transition can briefly expose a partial tree.
    # Require the same usable target twice before the final fresh guarded tap.
    prior=None
    for attempt in range(6):
        try:
            node=u.find(u.dump()[0],a.label,contains=a.contains,index=a.index)
            bounds=u.tap_bounds(node)
            if bounds==prior: break
            prior=bounds
        except RuntimeError:
            prior=None
        time.sleep(0.2)
    else: raise RuntimeError('No stable visible target: '+a.label)
    u.tap(a.label,contains=a.contains,index=a.index,hold=a.hold)
elif a.command=='type':u.type_text(a.value,index=a.index,replace=a.replace)
elif a.command=='scroll':u.scroll(a.direction)
elif a.command=='back':u.back()
elif a.command=='hide-ime':u.hide_ime()
