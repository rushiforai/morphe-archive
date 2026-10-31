from pathlib import Path
import json, urllib.request
root=Path(__file__).resolve().parents[1]
notices=root/'third-party-notices'
font=notices/'Fontshare-ITF-FFL-2.0.txt'
text=font.read_text(encoding='utf-8-sig')
if text.lstrip().startswith('"'):
    text=json.loads(text)
    font.write_text(text,encoding='utf-8')
license_url='https://raw.githubusercontent.com/stephenjjbrown/string-similarity-js/master/LICENSE.md'
with urllib.request.urlopen(license_url) as response:
    (notices/'Stephen-Brown-string-similarity-MIT.txt').write_bytes(response.read())
pieces=['BDCrusher YT-Music Lyrics 0.1.0-beta.1\nPersonal derivative; not an official Morphe or Better Lyrics release.\n\n'
        'Android host: BDCrusher (2026), GPL-3.0.\n'
        'Upstream: MorpheApp/morphe-patches adc2a9f901283c01e5e7fec99ffd96f601746d5b.\n'
        'Renderer: Better Lyrics Braccato @braccato/core 1.16.11, MIT.\n'
        'Parsers: @braccato/parsers 0.4.0, MIT.\n'
        'Provider decoding: better-lyrics/better-lyrics 272d7c16c9e882b28170277e3cbc876f11169995, GPL-3.0.\n'
        'Satoshi by Indian Type Foundry, unmodified embedded application font.\n'
        'Fontshare terms retrieved October 21, 2026; current version 2.0. The retained extension notice refers to the earlier 1.0.\n']
for file in [root/'NOTICE',root/'LICENSE',*sorted(notices.iterdir())]:
    if file.is_file():pieces.append('\n\n===== '+file.name+' =====\n\n'+file.read_text(encoding='utf-8-sig'))
(root/'patches/src/main/resources/bdcrusher-lyrics/NOTICE.txt').write_text('\n'.join(pieces),encoding='utf-8')
a=text.find('03 Embedding',text.find('03 Embedding')+1)
b=text.find('04 Third-party',a)
print(text[a:b])
print('Bundled',len(pieces)-1,'notice/license files')
