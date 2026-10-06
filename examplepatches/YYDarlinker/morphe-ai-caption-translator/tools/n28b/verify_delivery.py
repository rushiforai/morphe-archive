"""N28B offline evidence, scope/frozen checks and guarded independent delivery packaging."""
from pathlib import Path
import argparse, hashlib, json, re, shutil, subprocess, xml.etree.ElementTree as ET, zipfile
ROOT=Path(__file__).resolve().parents[2];RECORDS=ROOT/'build/n28b-records'
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
CHANGED={'CaptionLanguageContext','DeepSeekConfig','RebuildApi','RebuildCache','RebuildController',
         'RebuildNumbers','RebuildPlanner','RebuildProtocol','RebuildReview','RebuildSemantics'}
ALLOWED={PREFIX+n+'.java' for n in CHANGED}
ALLOWED.update('extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/'+n+'.java'
               for n in ['N28ALanguageContextTest','RebuildIntegrationTest','NativeRendererN23Test'])
def git(*args):return subprocess.check_output(['git',*args],cwd=ROOT).decode('utf-8').strip()
def digest(p):
    h=hashlib.sha256()
    with p.open('rb') as f:
        while chunk:=f.read(4*1024*1024):h.update(chunk)
    return h.hexdigest().upper()
def save(name,obj):
    RECORDS.mkdir(parents=True,exist_ok=True);(RECORDS/name).write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def prepare():
    assert not (RECORDS/'history-before.json').exists(),'History snapshot already exists'
    paths={p for p in (ROOT/'build/local-test').glob('*') if p.is_file() and '-n28b' not in p.name}
    paths.update(p for p in ROOT.glob('build/*-composition*/**/*.apk') if p.is_file() and 'n28b' not in str(p))
    save('history-before.json',[{'path':str(p.relative_to(ROOT)),'bytes':p.stat().st_size,'sha256':digest(p)} for p in sorted(paths)])
    save('start.json',{'head':git('rev-parse','HEAD'),'source_anchor':git('rev-parse','anchor/n28a-d683e59'),
        'planning_docs_preserved':['CODEX-EXECUTION-WORKFLOW.md','PROJECT-STATE.md','N28A-REVIEW.md','N28B-CODEX-TASK.md']})
    print('HISTORY_PROTECTED',len(paths))
def frozen():
    tracked=git('ls-tree','-r','--name-only','d683e59').splitlines()
    changed=[p for p in git('diff','--name-only','d683e59','--','.').splitlines() if p in tracked and not p.startswith('docs/')]
    assert set(changed)==ALLOWED,changed
    added=git('ls-files','--others','--exclude-standard').splitlines()
    assert not [p for p in added if p.startswith(('patches/src/main/','extensions/extension/src/main/'))]
    # Only explicit scope parameters in the two fixed old English/Chinese fixture classes.
    for name in ['RebuildIntegrationTest','NativeRendererN23Test']:
        path='extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/'+name+'.java'
        before=subprocess.check_output(['git','show','d683e59:'+path],cwd=ROOT).decode('utf-8').replace('\r\n','\n')
        after=(ROOT/path).read_text(encoding='utf-8')
        assert after.replace(', CaptionLanguageContext.LEGACY','').replace(',CaptionLanguageContext.LEGACY','')==before,name
    for p in ['ACCEPTANCE.md','scoreboard/results/frozen-baseline.json',PREFIX+'RebuildPageLayout.java',
              PREFIX+'CaptionOverlayV2.java',PREFIX+'NativeCaptionBridge.java',PREFIX+'RebuildSource.java',
              PREFIX+'CaptionUnicode.java',PREFIX+'CaptionLanguageProfile.java',PREFIX+'TargetLanguage.java']:
        assert git('hash-object',p)==git('rev-parse','d683e59:'+p),p
    frozen_blobs={p:git('hash-object',p) for p in tracked if p.startswith(('patches/src/main/','localization/'))}
    for p,blob in frozen_blobs.items():assert blob==git('rev-parse','d683e59:'+p),p
    tests=[p for p in tracked if p.startswith('extensions/extension/src/test/') and p.endswith('.java')]
    save('frozen-blobs.json',{'baseline':'d683e59','changed_existing_non_docs':changed,
        'original_java_test_files':len(tests),'original_tests_changed':[p for p in changed if '/src/test/' in p],
        'approved_observer_contract_updates':2,'old_fixture_assertions_unchanged':True,
        'frozen_pager_renderer_source_native_resources_build_acceptance':True,'frozen_resource_patch_files':len(frozen_blobs)})
    print('FROZEN_PASS',len(changed),'old_fixed_fixture_assertions_unchanged=true')
def package():
    mpp=ROOT/'build/local-test/patches-1.3.5-本地测试包-n28b.mpp';mpe=ROOT/'build/local-test/extension-1.3.5-本地测试包-n28b.mpe'
    assert not mpp.exists() and not mpe.exists(),'Never overwrite a delivery'
    source=ROOT/'patches/build/libs/patches-1.3.5.mpp'
    with zipfile.ZipFile(source) as z,zipfile.ZipFile(ROOT/'build/local-test/patches-1.3.5-本地测试包-n28a.mpp') as old:
        assert z.testzip() is None and len(z.namelist())==len(set(z.namelist()))
        assert set(z.namelist())==set(old.namelist())
        changed=[n for n in z.namelist() if z.read(n)!=old.read(n)]
        assert set(changed)<={'META-INF/MANIFEST.MF','extensions/extension.mpe'},changed
        assert 'extensions/extension.mpe' in changed
        data=z.read('extensions/extension.mpe')
        for marker in [b'n28b-policy-v1',b'CaptionLanguageContext',b'NEUTRAL_PROMPT']:assert marker in data,marker
        for marker in [b'CaptionControlsAvoidance',b'CAPTION_UI_AVOIDANCE_',b'onPlayerControlsVisibility']:assert marker not in data,marker
    shutil.copyfile(source,mpp);mpe.write_bytes(data)
    save('bundle.json',{'mpp':str(mpp),'mpe':str(mpe),'changed_entries_vs_n28a':changed,'embedded_mpe_identical':True})
    print('BUNDLE_PASS',mpp.stat().st_size,mpe.stat().st_size)
def archive_candidate():
    """Preserve the earlier candidate before final packaging; historical deliveries stay untouched."""
    candidate=ROOT/'build/local-test/patches-1.3.5-本地测试包-n28b.mpp'
    current=ROOT/'patches/build/libs/patches-1.3.5.mpp'
    with zipfile.ZipFile(candidate) as a,zipfile.ZipFile(current) as b:
        assert set(a.namelist())==set(b.namelist())
        changed=[n for n in a.namelist() if a.read(n)!=b.read(n)]
        assert set(changed)<={'META-INF/MANIFEST.MF'},changed
    folder=RECORDS/'candidates';assert not folder.exists();folder.mkdir()
    records=[]
    for p in [candidate,ROOT/'build/local-test/extension-1.3.5-本地测试包-n28b.mpe']:
        dest=folder/p.name
        assert dest.resolve().is_relative_to(ROOT.resolve()) and p.resolve().is_relative_to(ROOT.resolve())
        records.append({'candidate_path':str(dest),'bytes':p.stat().st_size,'sha256':digest(p)})
        p.rename(dest)
    save('candidate-history.json',{'earlier_candidates':records,'zip_entry_content_changes':changed,
        'reason':'Final test/build regenerated ZIP packaging metadata; product entry bytes unchanged except permitted build manifest.'})
    print('CANDIDATE_PRESERVED entries_changed=',changed)
def results():
    suites=[]
    for p in (ROOT/'extensions/extension/build/test-results/testDebugUnitTest').glob('TEST-*.xml'):
        root=ET.parse(p).getroot();suites.append({'name':root.attrib['name'],**{k:int(root.attrib.get(k,0)) for k in ['tests','failures','errors','skipped']}})
    totals={k:sum(s[k] for s in suites) for k in ['tests','failures','errors','skipped']}
    old=[s for s in suites if '.N28B' not in s['name']];new=[s for s in suites if '.N28B' in s['name']]
    assert sum(s['tests'] for s in old)==490,totals
    assert totals['failures']==totals['errors']==totals['skipped']==0,totals
    save('java-counts.json',{**totals,'suites':len(suites),'n28a_tests':490,'new_tests':sum(s['tests'] for s in new),'suite_counts':suites})
    original=json.loads((ROOT/'build/n28a-records/legacy-activate.json').read_text(encoding='utf-8'))
    current=json.loads((RECORDS/'legacy-activate.json').read_text(encoding='utf-8'))
    assert original==current,{k:current.get(k) for k in original if original.get(k)!=current.get(k)}
    before=json.loads((RECORDS/'baseline/legacy-region-golden.json').read_text(encoding='utf-8'))
    after=json.loads((RECORDS/'legacy-region-golden.json').read_text(encoding='utf-8'))
    assert len(before)==len(after)==18
    assert before==after,[(i,[k for k in a if a.get(k)!=b.get(k)]) for i,(a,b) in enumerate(zip(before,after)) if a!=b]
    save('legacy-equality.json',{'n28a_activate_all_fields_equal':True,'regional_cases':18,'regional_all_fields_equal':True,
        'baseline_source':'exact d683e59 product blobs; same test and fixture','source_codes':['en','en-US','en-GB'],
        'target_spellings':['zh-Hans','zh-Hant','zh-CN','zh-TW','zh_Hans','zh-Hant-TW']})
    matrix=[]
    for path in sorted(RECORDS.glob('*-trace.json')):
        for row in json.loads(path.read_text(encoding='utf-8')):row['evidence']=path.name;matrix.append(row)
    for row in after:
        req=json.loads(row['request_json'][0]);system=req['messages'][0]['content']
        matrix.append({'source':row['source'],'target_input':row['target_input'],'target':row['target'],'ui':'baseline_default',
            'systemPromptHash':hashlib.sha256(system.encode()).hexdigest(),'cacheKeyHash':row['cache_key'],
            'policy':'n28b-policy-v1|'+row['source']+'|'+row['target_input'].replace('_','-')+'|legacy_en_zh','network':True,'cache':False,'calls':row['network_calls'],
            'warm_calls':0,'warm_attempts':row['warm_attempts'],'accepted':True,'golden_all_fields_equal':True,
            'presentation_policy':'legacy_n26','evidence':'legacy-region-golden.json'})
    assert matrix and all('systemPromptHash' in r and 'cacheKeyHash' in r and 'policy' in r for r in matrix)
    save('policy-trace-matrix.json',{'remote_translation_calls':0,'scope_version':'n28b-policy-v1','rows':matrix})
    print('JAVA_PASS',totals,'NEW',sum(s['tests'] for s in new),'GOLDEN_REGIONS',len(after),'TRACE_ROWS',len(matrix))
def finalize_apk():
    out=ROOT/'build/n28b-composition-final';src=out/'patched-unsigned.apk';apk=out/'YouTube-21.16.256-本地测试包-n28b-unsigned.apk'
    if not apk.exists():shutil.copyfile(src,apk)
    assert digest(apk)==digest(src)
    save('composition-inputs.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in
        [next(ROOT.glob('com.google.android.youtube_21.16.256*.apk')),ROOT/'patches-1.44.0.mpp',
         ROOT/'build/local-test/patches-1.3.5-本地测试包-n28b.mpp',ROOT/'.verification/toolchain/morphe-patcher-1.14.1-all.jar']])
    archive=ROOT/'.verification/n26-rollback';manifest=json.loads((archive/'audit-tool/manifest.json').read_text(encoding='utf-8'))
    for row in manifest['files']:
        p=archive/row['path'];assert digest(p)==row['sha256'] and p.stat().st_size==row['bytes'],str(p)
    save('audit-tool-provenance.json',{'source_commit':manifest['source_commit'],'files_hash_verified':len(manifest['files']),
        'require_ai_observer':False,'normal_ai_translation_enabled':True})
    print('FINAL_APK_READY',apk.stat().st_size,'audit_tool_files=',len(manifest['files']))
def finish():
    frozen();results()
    history=json.loads((RECORDS/'history-before.json').read_text(encoding='utf-8'))
    for row in history:
        p=ROOT/row['path'];assert p.stat().st_size==row['bytes'] and digest(p)==row['sha256'],str(p)
    save('history-after.json',{'unchanged':len(history),'total':len(history)})
    out=ROOT/'build/n28b-composition-final';src=out/'patched-unsigned.apk';apk=out/'YouTube-21.16.256-本地测试包-n28b-unsigned.apk'
    if not apk.exists():shutil.copyfile(src,apk)
    assert digest(apk)==digest(src)
    log=(RECORDS/'composition.log').read_text(encoding='utf-8-sig',errors='replace')
    passes=len(re.findall(r'^PASS ',log,re.M));assert passes==84 and 'COMPOSITION_PASS' in log,passes
    for name in ['structure.txt','selection.txt']:assert (out/name).read_bytes()==(ROOT/'build/n28a-composition-final'/name).read_bytes(),name
    artifacts=[ROOT/'build/local-test/patches-1.3.5-本地测试包-n28b.mpp',ROOT/'build/local-test/extension-1.3.5-本地测试包-n28b.mpe',apk]
    save('artifacts.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in artifacts])
    # Composition/testClasses can regenerate the intermediate module archive. The verified,
    # locked local-test MPP above is the actual composition input and final delivery.
    intermediate=ROOT/'patches/build/libs/patches-1.3.5.mpp'
    save('module-intermediate.json',{'path':str(intermediate),'sha256':digest(intermediate),'delivery':False,
        'reason':'Gradle composition/testClasses may regenerate the intermediate module archive; use the frozen local-test delivery.'})
    print('DELIVERY_PASS history=',len(history),'composition=',passes)
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','frozen','package','archive_candidate','results','finalize_apk','finish']);globals()[parser.parse_args().action]()
