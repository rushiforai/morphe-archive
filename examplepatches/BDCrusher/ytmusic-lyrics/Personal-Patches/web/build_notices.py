"""Deterministic, offline notices for every independently selectable personal feature."""
from pathlib import Path
r=Path(__file__).resolve().parents[1]
version=next(s.split('=',1)[1].strip() for s in (r/'gradle.properties').read_text(encoding='utf-8').splitlines() if s.startswith('version'))
header=f'''BDCrusher YT-Music personal patches {version}
Personal derivative; not an official Morphe, Better Lyrics or Shaders release.
Android adapters: BDCrusher (2026), GPL-3.0.
Morphe upstream: v1.48.0-dev.19 / db2338b3bf8a0342b50c738cbc7cf50b0ce0d15c; original notices apply.
Better Lyrics comparison: 3.0.1 / 7a6a6a104d0667baac6df9f3e126385e3822f179.
Provider decoder bodies retained from 272d7c16c9e882b28170277e3cbc876f11169995 match 3.0.1.
Braccato core1.16.11 and parsers0.4.0: MIT. Playback uses core highlighting; highlight0.3.2 is upstream's TTML editor.
Shaders:1.5.1 / 88be3b81450b8d66bd8af445bf6062caac7d2747, GPL-3.0.
Kawarp core1.3.1 and ALTCHA2.5.0: see original licenses below. Normal service verification is preserved.
Satoshi by Indian Type Foundry: original Fontshare embedding terms below.
'''
pieces=[header]
for p in [r/'NOTICE',r/'LICENSE',*sorted((r/'third-party-notices').iterdir())]:
    if p.is_file():pieces.append('\n===== '+p.name+' =====\n'+p.read_text(encoding='utf-8-sig'))
text='\n'.join(pieces)
for folder in ['bdcrusher-common','bdcrusher-lyrics']:
    target=r/'patches/src/main/resources'/folder/'NOTICE.txt';target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,encoding='utf-8',newline='\n')
print(f'Prepared personal feature notices ({len(text.encode())} bytes)')
