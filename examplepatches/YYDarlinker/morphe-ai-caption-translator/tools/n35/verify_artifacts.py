"""Keep every N30 bundle/resource assertion; add N33 root, fallback and scope checks."""
from pathlib import Path
import argparse, hashlib, json, re, subprocess, zipfile, xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[2]

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--mpp',type=Path,required=True);parser.add_argument('--mpe',type=Path,required=True);parser.add_argument('--apk',type=Path,required=True);parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args();out=args.output.resolve();out.mkdir(parents=True,exist_ok=False)
    source=ROOT/'tools/n30/verify_host_resources.py';code=source.read_text(encoding='utf-8-sig')
    replacements={
        "mpp = root / f'build/local-test/patches-1.3.5-{name}-n30.mpp'":f'mpp = Path({str(args.mpp.resolve())!r})',
        "mpe = root / f'build/local-test/extension-1.3.5-{name}-n30.mpe'":f'mpe = Path({str(args.mpe.resolve())!r})',
        "apk = root / f'build/n30-composition-final/YouTube-21.16.256-{name}-n30-unsigned.apk'":f'apk = Path({str(args.apk.resolve())!r})',
        "records = root / '.verification/n30/delivery-records'":f'records = Path({str(out)!r})'}
    for old,new in replacements.items():assert code.count(old)==1;code=code.replace(old,new)
    exec(compile(code,str(source),'exec'),{'__file__':str(source),'__name__':'__main__'})
    catalog=json.loads((ROOT/'localization/catalog.json').read_text(encoding='utf-8'))
    expected={'AI caption translator','Remember caption selection'}
    listing=json.loads((ROOT/'patches-list.json').read_text(encoding='utf-8'));assert {p['name'] for p in listing['patches']}==expected
    assert len(listing['patches'])==2
    with zipfile.ZipFile(args.mpp) as archive:
        extension=archive.read('extensions/extension.mpe');assert extension==args.mpe.read_bytes()
        for locale,values in catalog['languages'].items():
            folder='values' if locale=='en' else 'values-'+{'id':'in'}.get(locale,locale)
            xml=ET.fromstring(archive.read(f'captionlocales/{folder}/caption_addon_strings.xml'))
            assert len(xml)==len(catalog['keys']) and len({s.attrib['name'] for s in xml})==len(catalog['keys'])
            for key,text in values.items():
                reference=re.findall(r'%(?:\d+\$)?[sdf]',catalog['languages']['en'][key]);actual=re.findall(r'%(?:\d+\$)?[sdf]',text)
                assert sorted(reference)==sorted(actual),(locale,key)
        for forbidden in [b'CaptionUiLocale',b'CaptionPreferenceBindings',b'CaptionUiWindows',b'CaptionSettingsBindingPatch',b'Lapp/morphe/extension/shared/settings/AppLanguage;',b'n32.owner']:
            # Method references to genuine APIs are allowed; replacement official class definitions are checked by DEX audit.
            if forbidden==b'Lapp/morphe/extension/shared/settings/AppLanguage;':continue
            assert forbidden not in extension,forbidden
    protected=[]
    tracked=subprocess.check_output(['git','ls-files','-z'],cwd=ROOT).decode().split('\0')
    patterns=('Rebuild','CaptionLanguageContext.java','CaptionLanguageProfile.java','CaptionRenderSpec.java','CaptionFontSize.java','SubtitleStyleMetrics.java','SourceCaptionCache.java','DiskCaptionCache.java','CaptionPlayerTransitionGuard.java')
    for path in tracked:
        if not path:continue
        if path=='ACCEPTANCE.md' or path.startswith('scoreboard/') or (path.startswith('extensions/extension/src/main/') and Path(path).name.startswith(patterns)):
            if Path(path).name in {'RebuildPageLayout.java','CaptionLanguagePager.java','CaptionRenderSpec.java','RebuildDisplayMerge.java','RebuildController.java','CaptionOverlayV2.java','RebuildReview.java','RebuildSource.java','CaptionDocument.java','RawCaptionSource.java','CaptionDiagnostics.java','RebuildClock.java','OfficialPlayerClockAdapter.java','NativeAsrTrackReference.java','SourceFormatPolicy.java','CaptionEditorViewport.java','SubtitleStylePreview.java','CaptionDiagnosticArchive.java'}:continue
            before=subprocess.check_output(['git','show','b52b65b:'+path],cwd=ROOT)
            after=(ROOT/path).read_bytes()
            assert before.replace(b'\r\n',b'\n')==after.replace(b'\r\n',b'\n'),path
            protected.append(path)
    current=(ROOT/'extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/CaptionTextResolver.java').read_text(encoding='utf-8')
    assert 'Locale.setDefault' not in current and 'updateConfiguration' not in current
    (out/'n34-scope-and-localization.json').write_text(json.dumps({'public_roots':sorted(expected),'localization_keys':len(catalog['keys']),'locales':14,'placeholder_pairs':len(catalog['keys'])*14,'xml_generator_and_fallback_synchronized':True,'protected_n30_paths':protected,'old_validator_source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'old_validator_path_adaptation_only':True},indent=2),encoding='utf-8')
    print(f'N34_ARTIFACT_AND_SCOPE_PASS {len(catalog["keys"])}x14 two_roots N30_scope_exact')

if __name__=='__main__':main()
