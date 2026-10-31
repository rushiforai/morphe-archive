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
def method(classes,cls,name,desc=None):
    matches=[m for m in classes[cls].get_methods() if m.get_name()==name and (desc is None or m.get_descriptor().replace(' ','')==desc)]
    assert len(matches)==1,(cls,name,desc)
    return matches[0]
def ops(m):return [(i.get_name(),i.get_output()) for i in m.get_instructions()]
def text(m):return '\n'.join(i.get_output() for i in m.get_instructions())
def idx(m):return list(m.get_instructions_idx())
original=load_classes(a.original)
patched=load_classes(a.patched)
original_apk=APK(str(a.original))
apk=APK(str(a.patched))
version=original_apk.get_androidversion_name()
manifest=apk.get_android_manifest_xml()
original_manifest=original_apk.get_android_manifest_xml()
ns='{http://schemas.android.com/apk/res/android}'
with zipfile.ZipFile(a.original) as old,zipfile.ZipFile(a.patched) as new:
    check('ZIP integrity',new.testzip() is None)
    libs=[n for n in old.namelist() if n.startswith('lib/') and n.endswith('.so')]
    new_libs=[n for n in new.namelist() if n.startswith('lib/') and n.endswith('.so')]
    check('All native libraries byte-for-byte unchanged',bool(libs) and set(libs)==set(new_libs) and all(old.read(n)==new.read(n) for n in libs))
    check('Stale baseline profiles and transparency signature removed',all(n not in new.namelist() for n in ['assets/dexopt/baseline.prof','assets/dexopt/baseline.profm','META-INF/code_transparency_signed.jwt']))
check('All original Java/JNI class names retained',set(original).issubset(set(patched)))
check('Separate application ID',apk.get_package()==a.package_name)
check('Correct visible label',apk.get_app_name()==(a.app_name or 'Muse'))
check('Original SDK bounds retained',apk.get_min_sdk_version()==original_apk.get_min_sdk_version() and apk.get_target_sdk_version()==original_apk.get_target_sdk_version())
check('Original version retained',apk.get_androidversion_name()==version and apk.get_androidversion_code()==original_apk.get_androidversion_code())
check('No split-required flag or requiredSplitTypes',all(e.get(ns+'isSplitRequired') not in ('true','1','0xffffffff') and e.get(ns+'requiredSplitTypes') is None for e in manifest.iter()))
check('No stale Play split metadata',not any((e.get(ns+'name') or '').startswith('com.android.vending.splits') for e in manifest.iter('meta-data')))
check('Application class preserved',manifest.find('application').get(ns+'name')==original_manifest.find('application').get(ns+'name'))
for tag,attr in [('provider','authorities'),('permission','name')]:
    nodes=list(manifest.iter(tag)); old_nodes=list(original_manifest.iter(tag))
    check(tag+' identities isolated',len(nodes)==len(old_nodes) and all(e.get(ns+attr) and e.get(ns+attr).startswith(a.package_name+'.') for e in nodes))
check('MC Debug gate enabled',ops(method(patched,'Lcom/facebook/aura/utils/HatchUtil;','isInternalSettingsEnabled'))==[('const/4','v0, 1'),('return','v0')])
if version=='14.0.0.4.149':
    menu_desc='(Lcom/facebook/aura/header/view/HeaderLeadingButton;Lkotlin/jvm/functions/Function0;LX/2hU;ZLX/2yV;II)V'
    surface_desc='(LX/2Pp;Ljava/lang/String;Lkotlin/jvm/functions/Function0;LX/2hU;ZFLcom/facebook/aura/vds/compose/icons/AuraIconSize;LX/C9Z;LX/2hU;ZLX/2yV;II)V'
    menu=method(patched,'Lcom/facebook/aura/header/view/HatchHeaderLeadingButtonKt;','HatchHeaderLeadingButton',menu_desc)
    surface=method(patched,'Lcom/facebook/aura/vds/compose/button/AuraElevatedButtonKt;','AuraElevatedIconSurface-7poYlZM',surface_desc)
    callback='Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;'
    json_callback='AuraMCDebugJsonBridge'
else:
    menu_desc='(Lcom/facebook/aura/header/view/HeaderLeadingButton;Lkotlin/jvm/functions/Function0;LX/2hz;ZLX/2Os;II)V'
    surface_desc='(LX/2QG;Ljava/lang/String;Lkotlin/jvm/functions/Function0;LX/2hz;ZFLcom/facebook/aura/vds/compose/icons/AuraIconSize;LX/FMb;LX/2hz;ZLX/2Os;II)V'
    menu=method(patched,'Lcom/facebook/aura/header/view/HatchHeaderLeadingButtonKt;','HatchHeaderLeadingButton',menu_desc)
    surface=method(patched,'Lcom/facebook/aura/vds/compose/button/AuraElevatedButtonKt;','AuraElevatedIconSurface-7poYlZM',surface_desc)
    callback='Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;'
    json_callback='AuraMCDebugJsonBridge'
check('Top-left menu long-press hook attached',callback+'->maybeWrap' in text(menu))
check('Long-press preserves original tap callback',all(s in text(surface) for s in [callback+'->maybeAttachLongPress',callback+'->maybeKeepDefaultTap']))
if version=='14.0.0.4.149':
    nav_name='A0S'
    nav_desc='(LX/2yV;Ljava/lang/Object;I)Lcom/facebook/aura/navigation/AuraNavigator;'
    callback_desc='(Lcom/facebook/aura/header/view/HeaderLeadingButton;Lkotlin/jvm/functions/Function0;LX/2yV;)Lkotlin/jvm/functions/Function0;'
else:
    nav_name='A0M'
    nav_desc='(LX/2Os;)Lcom/facebook/aura/navigation/AuraNavigator;'
    callback_desc='(Lcom/facebook/aura/header/view/HeaderLeadingButton;Lkotlin/jvm/functions/Function0;LX/2Os;)Lkotlin/jvm/functions/Function0;'
callback_wrap=method(patched,callback,'maybeWrap',callback_desc)
nav_ref='LX/3NK;->'+nav_name+nav_desc
check('Long-press navigator accessor matches this Muse version',nav_ref.replace(' ','') in text(callback_wrap).replace(' ',''))
method(original,'LX/3NK;',nav_name,nav_desc)
json_menu=method(patched,'Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;','invoke','(Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;)V')
result_desc='(LX/2yV;I)LX/1dG;' if version=='14.0.0.4.149' else '(LX/2Os;I)LX/9IF;'
json_result=method(patched,'Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;','invoke',result_desc)
json_activity=method(patched,'Lcom/facebook/aura/main/AuraMainActivity;','onActivityResult','(IILandroid/content/Intent;)V')
check('Mobile Config import/export actions wired',all(s in text(json_menu) for s in ['exportOverrides','importOverrides']))
check('Mobile Config import/export menu options exposed',all(s in text(json_result) for s in ['Export modified flags','Import flags']))
check('Mobile Config document picker result wired',json_callback in text(json_activity))
if not a.trust:
    guard_name='guards-14.tsv' if version=='14.0.0.4.149' else 'guards.tsv'
    trust_classes={'LX/AOc;','LX/AOC;','LX/Ezu;','LX/CZ3;','LX/AO7;','LX/AO8;','LX/CWm;','LX/CWl;','Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;'}
    guards=Path(__file__).resolve().parents[1]/'src/main/resources/muse'/guard_name
    for row in guards.read_text().splitlines():
        cls,signature,*_=row.split('\t')
        if cls not in trust_classes: continue
        name,desc=signature.split('(',1);desc='('+desc
        check('Default retains '+cls+'->'+signature,ops(method(original,cls,name,desc))==ops(method(patched,cls,name,desc)))
elif version=='13.0.0.4.159':
    trues=[('CRQ','A03'),('CRQ','A04'),('CQa','A00'),('CQa','A02'),('CR1','A04'),('CSF','A01'),('CSH','A01')]
    for cls,name in trues:check(cls+'.'+name+' permits locally',ops(method(patched,'LX/'+cls+';',name))==[('const/4','v0, 1'),('return','v0')])
    check('Production routing remains disabled',ops(method(patched,'LX/CRQ;','A02'))==[('const/4','v0, 0'),('return','v0')])
    for name in ['A00','A01']:
        check('CRT.'+name+' no-op',ops(method(patched,'LX/CRT;',name))==[('return-void','')])
        seq=ops(method(patched,'LX/CR1;',name));check('CR1.'+name+' initialization retained',[x[0] for x in seq]==['iget-object','const/4','invoke-virtual','return-void'] and 'AtomicBoolean;->set' in seq[2][1])
    for cls in ['CSF','CSH']:check(cls+' returns real input intent',ops(method(patched,'LX/'+cls+';','AAa'))==[('return-object','v3')])
    provider=text(method(patched,'LX/CQa;','A01'));check('Provider acquisition and platform rejection handling retained','acquireUnstableContentProviderClient' in provider and 'LX/CR' not in provider)
    bwf=text(method(patched,'LX/BWF;','A01'));check('BWF availability retained; local signer/system-origin restrictions removed','getApplicationInfo' in bwf and '->enabled' in bwf and not any(s in bwf for s in ['MessageDigest','->signatures','->flags','LX/CRQ;']))
    cpz=idx(method(patched,'LX/CPz;','ABD'));pos=next(i for i,(_,ins) in enumerate(cpz) if 'LX/CQ5;->A02' in ins.get_output());off,br=cpz[pos+1]
    check('CPz skips only local preflight',br.get_name().startswith('goto') and 'LX/001;->A12' in dict(cpz)[off+br.get_ref_off()*2].get_output())
    cpy=text(method(patched,'LX/CPy;','A00'));check('Account transport uses self identity, not forged platform trust','LX/CRQ;->A04' not in cpy and 'getPackageName()' in cpy)
    wa=method(patched,'Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;','readWhatsAppAccount');seq=idx(wa);byoff=dict(seq)
    gotos=[(off,ins) for off,ins in seq if ins.get_name().startswith('goto')]
    check('WhatsApp local owner check bypass reaches actual resolver',any('getContentResolver()' in byoff[off+ins.get_ref_off()*2].get_output() for off,ins in gotos))
    check('WhatsApp response, expiry and token fields retained',all(s in text(wa) for s in ['response_code','wire_version','expiration_ts','restricted_token','currentTimeMillis']))
elif version=='14.0.0.4.149':
    trust_true=[
        ('LX/AOC;','A03','(Landroid/content/Context;II)Z'),
        ('LX/AOC;','A04','(Landroid/content/Context;Ljava/lang/String;)Z'),
        ('LX/Ezu;','A01','(Landroid/content/Context;)Z'),
        ('LX/Ezu;','A02','(LX/AOD;Z)Z'),
        ('LX/AO7;','A01','(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/ApplicationInfo;LX/AO7;)Z'),
        ('LX/AO8;','A01','(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;LX/AO8;)Z'),
        ('LX/CZ3;','A04','(Landroid/content/Context;LX/CXd;)Z')
    ]
    for cls,name,desc in trust_true:check(cls+'->'+name+' permits local caller',ops(method(patched,cls,name,desc))==[('const/4','v0, 1'),('return','v0')])
    check('AOC production-routing decision remains disabled',ops(method(patched,'LX/AOC;','A02','(Landroid/content/Context;)Z'))==[('const/4','v0, 0'),('return','v0')])
    for cls in ['LX/AO7;','LX/AO8;']:
        check(cls+' broadcast intent remains unchanged',ops(method(patched,cls,'AAZ','(Landroid/content/BroadcastReceiver;Landroid/content/Context;Landroid/content/Intent;)Landroid/content/Intent;'))==[('return-object','v3')])
    ao=text(method(patched,'LX/AOc;','A01','(Landroid/content/Context;Ljava/lang/String;)Z'))
    check('AOc keeps Facebook Services allowlist and enabled check only','com.facebook.services' in ao and 'com.facebook.services.dev' in ao and 'getApplicationInfo' in ao and '->enabled' in ao and not any(s in ao for s in ['MessageDigest','->signatures','->requestedPermissions','LX/AOC;']))
    provider=text(method(patched,'LX/Ezu;','A00','(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/ContentProviderClient;'))
    check('Ezu provider acquisition and platform rejection retained','acquireUnstableContentProviderClient' in provider and 'LX/AOC;->A02' not in provider and 'LX/Ezu;->A02' not in provider)
    for name in ['A00','A01']:
        seq=ops(method(patched,'LX/CZ3;',name,'()V'))
        check('CZ3.'+name+' initialization retained',[x[0] for x in seq]==['iget-object','const/4','invoke-virtual','return-void'] and 'AtomicBoolean;->set' in seq[2][1])
    cw=idx(method(patched,'LX/CWm;','ABB','(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;LX/CVI;)Ljava/util/ArrayList;'))
    pos=next(i for i,(_,ins) in enumerate(cw) if 'BaseBundle;->containsKey' in ins.get_output())
    off,branch=cw[pos+3];target=off+branch.get_ref_off()*2
    check('CWm bypasses only the local metadata preflight',branch.get_name().startswith('goto') and target==cw[pos+4][0])
    cwl=text(method(patched,'LX/CWl;','A00','(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Lkotlin/jvm/functions/Function0;LX/CWl;LX/CXI;LX/CVI;I)LX/CXg;'))
    check('Account transport uses self-package identity, not signer trust','LX/AOC;->A04' not in cwl and 'Context;->getPackageName()' in cwl and 'String;->equals' in cwl)
    wa=method(patched,'Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;','readWhatsAppAccount')
    seq=idx(wa);byoff=dict(seq);gotos=[(off,ins) for off,ins in seq if ins.get_name().startswith('goto')]
    check('WhatsApp local owner check bypass reaches actual resolver',any('getContentResolver()' in byoff[off+ins.get_ref_off()*2].get_output() for off,ins in gotos))
    check('WhatsApp response, expiry and token fields retained',all(s in text(wa) for s in ['response_code','wire_version','expiration_ts','restricted_token','currentTimeMillis']))
else:
    raise AssertionError('Unsupported verification version: '+str(version))
result={'input_sha256':hashlib.sha256(a.original.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(a.patched.read_bytes()).hexdigest(),'package_version':version,'local_trust_enabled':a.trust,'checks':checks,'passed':True,'runtime_tested':False,'signed':False,'note':'Static APK verification, not phone/runtime/login testing.'}
a.output.write_text(json.dumps(result,indent=2)+'\n')
print('VERIFIED',len(checks),'checks')
