"""N28A offline evidence checks. Never downloads, signs, installs or changes historical outputs."""
from pathlib import Path
import argparse, hashlib, json, re, shutil, struct, subprocess, xml.etree.ElementTree as ET, zipfile
ROOT=Path(__file__).resolve().parents[2]
RECORDS=ROOT/'build/n28a-records'
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
NEW={'CaptionLanguageProfile.java','CaptionLanguageContext.java','CaptionUnicode.java'}
def git(*args):return subprocess.check_output(['git',*args],cwd=ROOT).decode('utf-8').strip()
def digest(p):
    h=hashlib.sha256()
    with p.open('rb') as f:
        while chunk:=f.read(4*1024*1024):h.update(chunk)
    return h.hexdigest().upper()
def save(name,value):
    RECORDS.mkdir(parents=True,exist_ok=True)
    (RECORDS/name).write_text(json.dumps(value,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def frozen():
    tracked=git('ls-tree','-r','--name-only','7f9c639').splitlines()
    all_changes=git('diff','--name-only','7f9c639','--','.').splitlines()
    changed=[p for p in all_changes if p in tracked and not p.startswith('docs/')]
    added=set(p for p in all_changes if p not in tracked)
    added.update(git('ls-files','--others','--exclude-standard').splitlines())
    production_added={p for p in added if p.startswith(('extensions/extension/src/main/','patches/src/main/'))}
    assert production_added=={PREFIX+n for n in NEW},sorted(production_added)
    assert changed==[PREFIX+'RebuildController.java'],changed
    old_tests=[p for p in tracked if p.startswith('extensions/extension/src/test/') and p.endswith('.java')]
    current=subprocess.check_output(['git','diff','7f9c639','--',PREFIX+'RebuildController.java'],cwd=ROOT).decode('utf-8')
    save('frozen-blobs.json',{'baseline':'7f9c639','changed_existing_non_docs_files':changed,'original_java_test_files_unchanged':len(old_tests),'controller_diff':current,'acceptance_and_frozen_baseline_unchanged':True})
    print('FROZEN_BLOB_PASS changed_existing=RebuildController.java original_test_files='+str(len(old_tests)))
def prepare():
    assert git('rev-parse','anchor/n26-restored-20261002')=='45a7cc499c63866207742018f24e6132d45d13e1'
    targets=set()
    targets.update(p for p in (ROOT/'build/local-test').glob('*') if p.is_file() and '-n28a' not in p.name)
    targets.update((ROOT/'recovered/1.3.5').glob('*.mpp'))
    targets.update(ROOT.glob('build/*-composition*/**/*.apk'))
    targets.update(ROOT.glob('build/**/generated-before-reset/**/*.mpp'))
    targets.update(ROOT.glob('.verification/n28-abandon-20261002/generated-before-reset/*'))
    targets={p for p in targets if p.is_file() and 'n28a' not in str(p)}
    save('history-before.json',[{'path':str(p.relative_to(ROOT)),'bytes':p.stat().st_size,'sha256':digest(p)} for p in sorted(targets)])
    save('start.json',{'head':git('rev-parse','HEAD'),'restoration_anchor':git('rev-parse','anchor/n26-restored-20261002'),'n26r_anchor':git('rev-parse','anchor/n26r-1b9e429')})
    print('HISTORY_PROTECTED',len(targets))
def package():
    mpp=ROOT/'build/local-test/patches-1.3.5-本地测试包-n28a.mpp';mpe=ROOT/'build/local-test/extension-1.3.5-本地测试包-n28a.mpe'
    assert not mpp.exists() and not mpe.exists(),'Never overwrite a delivery'
    source=ROOT/'patches/build/libs/patches-1.3.5.mpp'
    with zipfile.ZipFile(source) as z,zipfile.ZipFile(ROOT/'build/local-test/patches-1.3.5-本地测试包-n26.mpp') as old:
        assert z.testzip() is None and len(z.namelist())==len(set(z.namelist()))
        assert set(z.namelist())==set(old.namelist())
        differences=[n for n in z.namelist() if z.read(n)!=old.read(n)]
        assert set(differences)=={'META-INF/MANIFEST.MF','extensions/extension.mpe'},differences
        data=z.read('extensions/extension.mpe');check_dex(data)
        for marker in (b'CaptionControlsAvoidance',b'CAPTION_UI_AVOIDANCE_',b'onPlayerControlsVisibility'):assert marker not in data,marker
        for name in NEW:assert name.replace('.java','').encode() in data,name
    shutil.copyfile(source,mpp);mpe.write_bytes(data)
    save('bundle.json',{'mpp':str(mpp),'mpe':str(mpe),'changed_entries_vs_n26':differences,'patch_classes_dex_and_all_resources_byte_identical_to_n26':True,'embedded_mpe_identical':True})
    print('BUNDLE_PASS',mpp.stat().st_size,mpe.stat().st_size)
def check_dex(data):
    assert data[:4]==b'dex\n' and struct.unpack_from('<I',data,32)[0]==len(data)
    import zlib
    assert struct.unpack_from('<I',data,8)[0]==zlib.adler32(data[12:])&0xffffffff
    assert data[12:32]==hashlib.sha1(data[32:]).digest()
def results():
    suites=[]
    for p in (ROOT/'extensions/extension/build/test-results/testDebugUnitTest').glob('TEST-*.xml'):
        e=ET.parse(p).getroot();suites.append({'name':e.attrib['name'],**{k:int(e.attrib.get(k,0)) for k in ('tests','failures','errors','skipped')}})
    sums={k:sum(s[k] for s in suites) for k in ('tests','failures','errors','skipped')};sums['suites']=len(suites)
    legacy=[s for s in suites if '.N28A' not in s['name']];new=[s for s in suites if '.N28A' in s['name']]
    assert sum(s['tests'] for s in legacy)==440 and len(legacy)==58
    assert sums['failures']==sums['errors']==sums['skipped']==0,sums
    before=json.loads((RECORDS/'baseline/legacy-activate.json').read_text(encoding='utf-8'))
    after=json.loads((RECORDS/'legacy-activate.json').read_text(encoding='utf-8'))
    assert before==after,{k:(before.get(k),after.get(k)) for k in before if before.get(k)!=after.get(k)}
    save('legacy-equality.json',{'same_input_same_config':True,'all_fields_equal':True,'fields':list(before),'baseline_prompt_hash':before['prompt_hash'],'baseline_fidelity_hash':before['fidelity_hash'],'request_bytes':len(before['request_json'][0].encode()),'remote_api_calls':0})
    save('java-counts.json',{**sums,'legacy_tests':440,'new_tests':sum(s['tests'] for s in new),'suite_counts':suites})
    print('JAVA_PASS',sums,'new=',sum(s['tests'] for s in new),'LEGACY_ACTIVATE_EQUAL')
def finish():
    frozen();results()
    history=json.loads((RECORDS/'history-before.json').read_text(encoding='utf-8'))
    for item in history:
        p=ROOT/item['path'];assert p.stat().st_size==item['bytes'] and digest(p)==item['sha256'],str(p)
    save('history-after.json',{'unchanged':len(history),'total':len(history)})
    out=ROOT/'build/n28a-composition-final';src=out/'patched-unsigned.apk';apk=out/'YouTube-21.16.256-本地测试包-n28a-unsigned.apk'
    if not apk.exists():shutil.copyfile(src,apk)
    assert apk.read_bytes()==src.read_bytes()
    log=(RECORDS/'composition.log').read_text(encoding='utf-8-sig',errors='replace')
    passes=len(re.findall(r'^PASS ',log,re.M));assert passes==84 and 'COMPOSITION_PASS' in log,passes
    assert (out/'structure.txt').read_bytes()==(ROOT/'build/n26-composition-final/structure.txt').read_bytes()
    assert (out/'selection.txt').read_bytes()==(ROOT/'build/n26-composition-final/selection.txt').read_bytes()
    with zipfile.ZipFile(apk) as z:
        assert z.testzip() is None and len(z.namelist())==len(set(z.namelist()))
        dexes=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)]
        for n in dexes:
            data=z.read(n);check_dex(data)
            for marker in (b'CaptionControlsAvoidance',b'CAPTION_UI_AVOIDANCE_',b'onPlayerControlsVisibility'):assert marker not in data,marker
        assert len(dexes)==11
        dex_data=b''.join(z.read(n) for n in dexes)
        for name in NEW:assert name.replace('.java','').encode() in dex_data,name
    artifacts=[ROOT/'build/local-test/patches-1.3.5-本地测试包-n28a.mpp',ROOT/'build/local-test/extension-1.3.5-本地测试包-n28a.mpe',apk]
    save('artifacts.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in artifacts])
    save('inputs.json',[{'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)} for p in [next(ROOT.glob('com.google.android.youtube_21.16.256*.apk')),ROOT/'patches-1.44.0.mpp',ROOT/'.verification/toolchain/morphe-patcher-1.14.1-all.jar']])
    print('DELIVERY_PASS history=',len(history),'composition=',passes,'root_dex=',len(dexes))
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','frozen','package','results','finish']);args=parser.parse_args();globals()[args.action]()
