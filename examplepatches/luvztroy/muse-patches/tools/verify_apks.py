
import argparse, hashlib, json, re, zipfile
from pathlib import Path
from loguru import logger
logger.remove()
from androguard.core.apk import APK
from androguard.core.dex import DEX

parser=argparse.ArgumentParser()
parser.add_argument('original',type=Path)
parser.add_argument('patched',type=Path)
parser.add_argument('--trust',action='store_true')
parser.add_argument('--package-name',default='com.facebook.aura.mcdebug')
parser.add_argument('--app-name')
parser.add_argument('--output',required=True,type=Path)
a=parser.parse_args()
checks=[]
def check(name,condition):
    if not condition: raise AssertionError(name)
    checks.append(name); print('PASS:',name,flush=True)
def load_classes(path):
    with zipfile.ZipFile(path) as z:
        dexes=[DEX(z.read(n)) for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)]
    return {c.get_name():c for d in dexes for c in d.get_classes()}
original=load_classes(a.original)
patched=load_classes(a.patched)
def method(classes,cls,name,desc=None):
    matches=[m for m in classes[cls].get_methods() if m.get_name()==name and (desc is None or m.get_descriptor().replace(' ','')==desc)]
    assert len(matches)==1,(cls,name,desc)
    return matches[0]
def ops(m):return [(i.get_name(),i.get_output()) for i in m.get_instructions()]
def text(m):return '\n'.join(i.get_output() for i in m.get_instructions())
def pm(cls,name,desc=None):return method(patched,cls,name,desc)
def idx(m):return list(m.get_instructions_idx())

with zipfile.ZipFile(a.original) as old,zipfile.ZipFile(a.patched) as new:
    check('ZIP integrity',new.testzip() is None)
    libs=[n for n in old.namelist() if n.startswith('lib/') and n.endswith('.so')]
    check('All 35 native libraries byte-for-byte unchanged',len(libs)==35 and all(old.read(n)==new.read(n) for n in libs))
    check('Stale baseline profiles and transparency signature removed',all(n not in new.namelist() for n in ['assets/dexopt/baseline.prof','assets/dexopt/baseline.profm','META-INF/code_transparency_signed.jwt']))
check('All original Java/JNI class names retained',set(original)==set(patched))
apk=APK(str(a.patched)); manifest=apk.get_android_manifest_xml(); ns='{http://schemas.android.com/apk/res/android}'
check('Separate application ID',apk.get_package()==a.package_name)
check('Correct visible label',apk.get_app_name()==(a.app_name or 'Muse'))
check('Original SDK bounds retained',apk.get_min_sdk_version()=='29' and apk.get_target_sdk_version()=='36')
check('Original version retained',apk.get_androidversion_name()=='13.0.0.4.159' and apk.get_androidversion_code()=='1061801514')
check('No split-required flag or requiredSplitTypes',all(e.get(ns+'isSplitRequired') not in ('true','1','0xffffffff') and e.get(ns+'requiredSplitTypes') is None for e in manifest.iter()))
check('No stale Play split metadata',not any((e.get(ns+'name') or '').startswith('com.android.vending.splits') for e in manifest.iter('meta-data')))
check('JNI application class preserved',manifest.find('application').get(ns+'name')=='com.facebook.aura.app.AuraApplication')
for tag,attr,count in [('provider','authorities',5),('permission','name',2)]:
    nodes=list(manifest.iter(tag));check(tag+' identities isolated',len(nodes)==count and all(e.get(ns+attr).startswith(a.package_name+'.') for e in nodes))
check('MC Debug gate enabled',ops(pm('Lcom/facebook/aura/utils/HatchUtil;','isInternalSettingsEnabled'))==[('const/4','v0, 1'),('return','v0')])
for cls in ['LX/FV2;','LX/FV3;','LX/FV4;']:
    check(cls+' trust registry remains original',all(ops(m)==ops(method(patched,cls,m.get_name(),m.get_descriptor().replace(' ',''))) for m in original[cls].get_methods()))

guards=Path(__file__).resolve().parents[1]/'src/main/resources/muse/guards.tsv'
if not a.trust:
    for row in guards.read_text().splitlines():
        cls,signature,*_=row.split('\t')
        if 'HatchUtil;' in cls:continue
        name,desc=signature.split('(',1);desc='('+desc
        check('Default retains '+cls+'->'+signature,ops(method(original,cls,name,desc))==ops(pm(cls,name,desc)))
else:
    trues=[('CRQ','A03'),('CRQ','A04'),('CQa','A00'),('CQa','A02'),('CR1','A04'),('CSF','A01'),('CSH','A01')]
    for cls,name in trues:check(cls+'.'+name+' permits locally',ops(pm('LX/'+cls+';',name))==[('const/4','v0, 1'),('return','v0')])
    check('FV0 decision retains production routing',ops(pm('LX/CRQ;','A02'))==[('const/4','v0, 0'),('return','v0')])
    for name in ['A00','A01']:
        check('CRT.'+name+' no-op',ops(pm('LX/CRT;',name))==[('return-void','')])
        seq=ops(pm('LX/CR1;',name));check('CR1.'+name+' initialization retained',[x[0] for x in seq]==['iget-object','const/4','invoke-virtual','return-void'] and 'AtomicBoolean;->set' in seq[2][1])
    for cls in ['CSF','CSH']:check(cls+' returns real input intent',ops(pm('LX/'+cls+';','AAa'))==[('return-object','v3')])
    provider=text(pm('LX/CQa;','A01')); check('Provider acquisition and platform rejection handling retained','acquireUnstableContentProviderClient' in provider and 'LX/CR' not in provider)
    bwf=text(pm('LX/BWF;','A01'));check('BWF availability retained; local signer/system-origin restrictions removed','getApplicationInfo' in bwf and '->enabled' in bwf and not any(s in bwf for s in ['MessageDigest','->signatures','->flags','LX/CRQ;']))
    cpz=idx(pm('LX/CPz;','ABD'));pos=next(i for i,(_,ins) in enumerate(cpz) if 'LX/CQ5;->A02' in ins.get_output());off,br=cpz[pos+1]
    check('CPz skips only local preflight',br.get_name().startswith('goto') and 'LX/001;->A12' in dict(cpz)[off+br.get_ref_off()*2].get_output())
    cpy=text(pm('LX/CPy;','A00')); check('Account transport uses self identity, not forged platform trust','LX/CRQ;->A04' not in cpy and 'getPackageName()' in cpy)
    wa=pm('Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;','readWhatsAppAccount');seq=idx(wa);byoff=dict(seq)
    gotos=[(off,ins) for off,ins in seq if ins.get_name().startswith('goto')]
    check('WhatsApp local owner check bypass reaches actual resolver',any('getContentResolver()' in byoff[off+ins.get_ref_off()*2].get_output() for off,ins in gotos))
    check('Actual WhatsApp response, expiry and token fields retained',all(s in text(wa) for s in ['response_code','wire_version','expiration_ts','restricted_token','currentTimeMillis']))

result={'input_sha256':hashlib.sha256(a.original.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(a.patched.read_bytes()).hexdigest(),'local_trust_enabled':a.trust,'checks':checks,'passed':True,'runtime_tested':False,'signed':False,'note':'Static APK verification, not phone/runtime/login testing.'}
a.output.write_text(json.dumps(result,indent=2)+'\n')
print('VERIFIED',len(checks),'checks')
