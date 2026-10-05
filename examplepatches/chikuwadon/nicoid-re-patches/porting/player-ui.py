#!/usr/bin/env python3
"""Apply after cache and player refinements; keep private app data independent of SAF."""
from pathlib import Path
import re,sys
root=Path(sys.argv[1])/'smali'
p=root/'e/e/a/v0.smali';p.write_text(p.read_text().replace('Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;','Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;'))
for base in ['e/e/a','com/sauzask/nicoid']:
 for p in (root/base).rglob('*.smali'):
  s=p.read_text()
  s=re.sub(r'invoke-virtual(/range)? (\{[^}]+\}), Landroid/widget/Button;->setBackgroundResource\(I\)V',lambda m:'invoke-static'+(m[1] or '')+' '+m[2]+', Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V',s)
  form=p.name in ['h1.smali','x2.smali','v0$a.smali']
  method='showForm' if form else 'showDialog'
  s=re.sub(r'invoke-virtual(/range)? (\{[^}]+\}), Landroid/app/AlertDialog;->show\(\)V',lambda m:'invoke-static'+(m[1] or '')+' '+m[2]+', Le/e/a/PlaybackSession;->'+method+'(Landroid/app/AlertDialog;)V',s)
  p.write_text(s)
# Notify only after a guarded cache worker has actually been started (also queued items).
p=root/'com/sauzask/nicoid/NicoidDownloadCache.smali';s=p.read_text()
pat=r'(\.method public final b\(Landroid/content/Intent;\)V\n)(.*?)(\.end method)'
def started(m):
 old='    invoke-virtual {v0}, Ljava/lang/Thread;->start()V'
 assert m[2].count(old)==1
 return m[1]+m[2].replace(old,old+'\n    invoke-static {p0}, Le/e/a/CacheFolders;->started(Landroid/content/Context;)V')+m[3]
s,n=re.subn(pat,started,s,flags=re.S);assert n==1;p.write_text(s)

# Framework-owned settings dialogs are not opened by the app's AlertDialog hooks.
p=root/'com/sauzask/nicoid/NicoidSetting.smali';s=p.read_text()
pat=r'(\.method public onCreate\(Landroid/os/Bundle;\)V\n)(.*?)(\.end method)'
def preference_dialogs(m):
 assert m[2].count('    return-void')==1
 return m[1]+m[2].replace('    return-void','    invoke-static {p0}, Le/e/a/PreferenceDialogs;->attach(Landroid/preference/PreferenceActivity;)V\n    return-void')+m[3]
s,n=re.subn(pat,preference_dialogs,s,flags=re.S);assert n==1;p.write_text(s)
