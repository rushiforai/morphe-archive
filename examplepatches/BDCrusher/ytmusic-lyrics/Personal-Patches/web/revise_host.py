"""Prepare the shared native/web provider catalog from pinned, retained upstream data."""
from pathlib import Path
import re, json, xml.etree.ElementTree as ET
root=Path(__file__).resolve().parents[1]
up=root.parent/'Research/Better-Lyrics/Sources/better-lyrics-272d7c16c9e8/src'
constants=(up/'core/constants.ts').read_text(encoding='utf-8')
section=constants[constants.index('key: "bLyrics-richsynced"'):]
providers=[dict(key=k,name=n,type=t) for k,n,t in re.findall(r'key:\s*"([^"]+)"\s*,\s*displayName:\s*"([^"]+)"\s*,\s*syncType:\s*"([^"]+)"',section)][:16]
assert len(providers)==16
icons=(up/'modules/ui/lyricsDock/icons.ts').read_text(encoding='utf-8')
sync={k:v for k,v in re.findall(r'(syllable|word|line|unsynced):\s*`([^`]+)`',icons)}
control=dict(re.findall(r'(\w+):\s*`([^`]+)`',icons[icons.index('export const controlIcons'):]))
catalog={'providers':providers,'icons':sync,'colors':{'syllable':'#fde69b','word':'#aad1ff','line':'#c9f8da','unsynced':'#b3b3b3'}}
assets=root/'patches/src/main/resources/bdcrusher-lyrics'
(assets/'providers.json').write_text(json.dumps(catalog,ensure_ascii=False,indent=2),encoding='utf-8')
(root/'web/src/catalog.js').write_text('// Better Lyrics 272d7c16c9e8, GPL-3.0; exact upstream icons and provider labels.\nexport const catalog='+json.dumps(catalog,ensure_ascii=False)+';\nexport const controls='+json.dumps({k:control[k] for k in ['copy','translate','romanize','refresh','chevron'] if k in control})+';\n',encoding='utf-8')
# Use precisely the SVG geometry in Android's native inline preference rows too.
for kind,svg in sync.items():
    element=ET.fromstring(svg); paths=[]
    for child in element:
        tag=child.tag.split('}')[-1];a=child.attrib
        if tag=='path': d=a['d']
        elif tag=='rect':
            x,y,w,h,r=[float(a.get(k,0)) for k in ['x','y','width','height','rx']]
            d=f'M{x+r},{y} H{x+w-r} Q{x+w},{y} {x+w},{y+r} V{y+h-r} Q{x+w},{y+h} {x+w-r},{y+h} H{x+r} Q{x},{y+h} {x},{y+h-r} V{y+r} Q{x},{y} {x+r},{y} Z'
            # SVG rounded rectangles use circular arcs, not quadratic approximations.
            d=f'M{x+r},{y} H{x+w-r} A{r},{r} 0 0 1 {x+w},{y+r} V{y+h-r} A{r},{r} 0 0 1 {x+w-r},{y+h} H{x+r} A{r},{r} 0 0 1 {x},{y+h-r} V{y+r} A{r},{r} 0 0 1 {x+r},{y} Z'
        else: raise ValueError(tag)
        paths.append(f'<path android:fillColor="{catalog["colors"][kind]}" android:fillAlpha="{a.get("fill-opacity","1")}" android:pathData="{d}"/>')
    (assets/f'bd_lyrics_{kind}.xml').write_text('<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="1024" android:viewportHeight="1024">'+''.join(paths)+'</vector>',encoding='utf-8')
print('Prepared 16 provider entries and four exact sync-type geometries')
