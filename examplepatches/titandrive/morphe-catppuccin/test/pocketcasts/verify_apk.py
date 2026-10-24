#!/usr/bin/env python3
"""Check decoded isolated Pocket Casts test APK before installing it."""
from pathlib import Path
import sys
import xml.etree.ElementTree as E
import hashlib
p=Path(sys.argv[1]);ns='{http://schemas.android.com/apk/res/android}'
manifest=E.parse(p/'AndroidManifest.xml').getroot()
package='au.com.shiftyjelly.pocketcasts.catppuccin.test'
assert manifest.get('package')==package
providers=[node.get(ns+'authorities') for node in manifest.iter('provider')]
assert len(providers)==len(set(providers))
assert all(value.startswith(package+'.') for value in providers)
app=manifest.find('application')
assert app.get(ns+'label')=='Pocket Casts Theme Test'
styles={e.get('name'):e for e in E.parse(p/'res/values/styles.xml').getroot()}
colors={e.get('name'):e.text.lower() for e in E.parse(p/'res/values/colors.xml').getroot()}
def resolve(value):
 return colors[value.removeprefix('@color/')] if value.startswith('@color/') else value
for variant,bg,accent in [('Latte','#ffeff1f5','#ff8839ef'),('Macchiato','#ff24273a','#ffc6a0f6'),('Radioactivity',None,None)]:
 s=styles['Catppuccin.PocketCasts.'+variant]
 items={i.get('name'):resolve(i.text.lower()) for i in s}
 for i in s:
  if i.get('name')=='android:textColorSecondary': assert i.text.startswith('@color/')
 if bg:
  color=lambda value:int(value.lstrip('#'),16)|0xff000000
  assert color(items['primary_ui_01'])==color(bg) and color(items['primary_interactive_01'])==color(accent)
 assert len(items)>=107
 if variant=='Latte':assert s.get('parent')=='@style/ThemeLight'
 else:assert s.get('parent')=='@style/ThemeDark'
for cls in ['mtd','utd']:
 text=next(p.glob('smali*/'+cls+'.smali')).read_text()
 for name in ['CATPPUCCIN_LATTE','CATPPUCCIN_MACCHIATO','RADIOACTIVITY']:assert name in text
assert 'PocketThemes;->palette' in next(p.glob('smali*/ow9.smali')).read_text()
assert 'PocketFont;->install' in next(p.glob('smali*/au/com/shiftyjelly/pocketcasts/PocketCastsApplication.smali')).read_text()
font=p/'assets/catppuccin/pocketcasts-custom.ttf'
assert font.stat().st_size>10000
print('PASS: isolated package/providers, three themes, Compose hook and embedded font')

if len(sys.argv)>2:
 stock=Path(sys.argv[2])
 originals={e.get('name'):e for e in E.parse(stock/'res/values/styles.xml').getroot()}
 for name,original in originals.items():
  expected={i.get('name'):i.text for i in original if i.get('name') not in ('android:fontFamily','fontFamily')}
  actual={i.get('name'):i.text for i in styles[name] if i.get('name') not in ('android:fontFamily','fontFamily')}
  assert expected==actual,name
  assert original.get('parent')==styles[name].get('parent'),name
 print('PASS: original theme styles retain their colors and parents')

for variant,number in [('Latte','1'),('Macchiato','2'),('Radioactivity','3')]:
 style=styles['Catppuccin.PocketCasts.'+variant]
 assert next(i.text for i in style if i.get('name')=='catppuccin_pocket_variant')==number
featured=next(p.glob('smali*/fi1.smali')).read_text()
for method in ['surfaceColor','featuredTextColor','featuredChipBackground']:assert 'PocketSurfaces;->'+method in featured
mini=next(p.glob('smali*/au/com/shiftyjelly/pocketcasts/player/view/MiniPlayer.smali')).read_text()
assert 'PocketSurfaces;->surfaceColor' in mini and 'PocketSurfaces;->accentTint' in mini
assert 'PocketSurfaces;->player' in next(p.glob('smali*/fh9.smali')).read_text()
print('PASS: Featured and now-playing hooks are present and scoped to added themes')

chapter=next(p.glob('smali*/au/com/shiftyjelly/pocketcasts/player/view/ChapterProgressBar.smali')).read_text()
assert 'PocketSurfaces;->chapterProgress' in chapter
for cls in ['eb8','o54']:
 assert 'PocketSurfaces;->loadNotes' in next(p.glob('smali*/'+cls+'.smali')).read_text()
print('PASS: Up Next paint and both show-notes WebView hooks are present')

aliases=list(manifest.iter('activity-alias'))
assert aliases and all(n.get(ns+'name').startswith(package+'.') for n in aliases)
assert any(n.get(ns+'name')==package+'.ui.MainActivityDefault' for n in aliases)
for cls in ['eb8','hb8']:
 assert 'PocketSurfaces;->notesSurfaceColor' in next(p.glob('smali*/'+cls+'.smali')).read_text()
assert 'PocketSurfaces;->notesRoot' in next(p.glob('smali*/hb8.smali')).read_text()
print('PASS: test icon aliases resolve in the test namespace; notes backgrounds are themed before first display')
