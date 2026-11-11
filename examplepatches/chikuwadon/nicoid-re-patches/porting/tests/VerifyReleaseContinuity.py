#!/usr/bin/env python3
"""Check release helper APIs and feature entry points against an assembled development DEX."""
from pathlib import Path
import re
import sys

release, current, native = map(Path, sys.argv[1:4])

def body(name):
    return (current / 'e/e/a' / (name + '.smali')).read_text()

def method(text, name):
    match = re.search(r'^\.method[^\n]* ' + re.escape(name) + r'\([^\n]*\n.*?^\.end method', text, re.M | re.S)
    assert match, name
    return match.group(0)

checks = 0
for old in (release / 'e/e/a').glob('*.smali'):
    if '$' in old.name:
        continue  # Compiler-generated callbacks are checked through their feature entry points.
    new = current / 'e/e/a' / old.name
    assert new.exists(), ('Missing feature class', old.name)
    signature = r'^\.method[^\n]*\bpublic\b[^\n]* ([^\s]+\([^\n]+)'
    before = set(re.findall(signature, old.read_text(), re.M))
    after = set(re.findall(signature, new.read_text(), re.M))
    missing = {s for s in before-after if not s.startswith(('lambda$', 'access$'))}
    assert not missing, (old.name, missing)
    checks += 1

for feature, owner, function, target in [
    ('Shorts overlay', 'ModernShorts', 'install', 'Review181;->shortOverlay'),
    ('My page', 'FollowFeed', 'load', 'AccountPage;->load'),
]:
    if target:
        assert target in method(body(owner), function), feature
        checks += 1

# These integrations retain DEX-only helpers and therefore use reflection from Java.
for owner, function, cls, target, descriptor in [
    ('ThemeChoice','apply','StartupScreen','register','(Landroid/app/Activity;)V'),
    ('PlaybackSession','prepared','MediaControls','attach','(Ljava/lang/Object;Z)V'),
    ('PlaybackSession','destroy','MediaControls','detach','(Ljava/lang/Object;)V'),
    ('PlaybackSession','prefs','NoMini','migrate','(Landroid/content/Context;)V'),
    ('PlaybackSession','formDialog','FeedbackFixes','form','(Landroid/app/AlertDialog;)V'),
    ('ModernShorts','fillVideo','CommentVisuals','fullViewport','(Landroid/view/View;)V'),
]:
    caller = method(body(owner), function)
    assert '"e.e.a.'+cls+'"' in caller and '"'+target+'"' in caller, (owner,target)
    assert re.search(r'^\.method[^\n]*\bpublic\b[^\n]* '+re.escape(target+descriptor)+r'$', body(cls), re.M), (cls,target)
    checks += 1

# In the single-handoff implementation, overlay permission is verified by
# PlaybackTransfer221.popup, not by the obsolete PlaybackSession.leave fallback.
policy=method(body('PlaybackSession'),'leave')
popup=method(body('PlaybackTransfer221'),'popup')
assert 'Le/e/a/PlaybackTransfer221;->policy(Ljava/lang/Object;Z)I' in policy, "Modern playback policy is not used"
assert 'Le/e/a/NoMini;->canDrawOverlays(Landroid/content/Context;)Z' in popup, "Popup overlay permission check lost"
checks += 2

assert '"amoled"' in body('ThemeRules') and '"MyThemeAMOLED"' in body('ThemeRules')
assert 'AMOLED' in body('ThemeChoice')
assert '.method public static spinner(' in body('ThemeChoice') and '.method public static tree(' in body('ThemeChoice')
checks += 3

cache=(native/'com/sauzask/nicoid/NicoidDownloadCache.smali').read_text()
for target in ('CacheFolders;->started','CacheProgress;->title','CacheProgress;->transfer','CacheProgress;->bytes','CacheProgress;->done'):
    assert target in cache,target
    checks += 1
for target in ('CacheProgress;->prepare','CacheProgress;->asset','CacheProgress;->bytes'):
    assert target in body('CacheHls'),target
    checks += 1
assert 'CreatorPage;->following' in (native/'com/sauzask/nicoid/NicoidFavUserActivity.smali').read_text()
checks += 1
print(f'Release continuity: {checks} API and feature-entry checks passed')
