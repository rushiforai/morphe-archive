"""Verify exact NOS Teletekst2.8.10 source and emitted native behaviour."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from brabant_smali import canonical
from brabant_effects import restore_edits,restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali
from verify_parool import sdk_classes
from rtl_vm import Reference,VmThrown
from teletekst_contracts import CONTRACTS,BASE_SHA256
from teletekst_vm import Fixture,A,MODULE,FACTORY,TRACKER,EVENT,MULTI,SDK,PROMO,STORAGE,MAIN,OBSERVER,REPO,PROVIDE,TRACK,POLICY

NAMES={'Disable tracking','Hide promotions'}
TRACKING_EDIT={'owner':MODULE,'signature':PROVIDE,'index':2,'original':[],
 'replacement':['const/4 v0, 0x0','new-array v0, v0, ['+TRACKER,'new-instance v1, '+MULTI,
                'invoke-direct {v1, v0}, '+MULTI+'-><init>(['+TRACKER+')V','return-object v1']}
PROMOTION_EDIT={'owner':PROMO,'signature':POLICY,'index':0,'original':[],
 'replacement':['const/4 v0, 0x0','return v0']}


def verify_factory(f,disabled):
    for television in (False,True):
        f.television=television;f.events.clear()
        before={k:list(v) for k,v in f.context.value.items()}
        tracker=f.run(FACTORY,'provideTracker('+MODULE+'Landroid/content/Context;)'+TRACKER,(f.new(MODULE),f.context))[0]
        assert tracker.descriptor==(MULTI if disabled else SDK),'Teletekst still initializes the analytics SDK'
        assert sum(e[0]=='sdk-created' for e in f.events)==int(not disabled)
        assert f.context.value==before,'Teletekst factory changed retained state'
        if disabled:
            array=tracker.value[MULTI+'->mTrackers:['+TRACKER]
            assert isinstance(array,Reference) and array.value==[],'Teletekst tracker array is null/nonempty'
        for _ in range(4):f.invoke(TRACKER+'->'+TRACK,(tracker,Reference({},EVENT)))
        assert sum(e[0]=='sdk-event' for e in f.events)==4*int(not disabled)
    for entry,args in [(MODULE,(f.new(MODULE),0)),(FACTORY,(f.new(MODULE),0))]:
        f.events.clear();sig=PROVIDE if entry==MODULE else 'provideTracker('+MODULE+'Landroid/content/Context;)'+TRACKER
        try:f.run(entry,sig,args)
        except VmThrown as e:assert e.value.descriptor=='Ljava/lang/NullPointerException;'
        else:raise AssertionError('Teletekst factory lost native context validation')
        assert not f.events
    # Run the unchanged nonempty native aggregator too, so zero-dispatch is
    # established by its actual loop rather than a no-op fixture boundary.
    event=Reference({},EVENT);delegates=Reference([f.new(SDK),f.new(SDK)],'['+TRACKER)
    multi=f.new(MULTI);f.run(MULTI,'<init>(['+TRACKER+')V',(multi,delegates));f.events.clear()
    f.run(MULTI,TRACK,(multi,event))
    assert len(f.events)==2 and all(e==('sdk-event',event) for e in f.events)


def verify_promotions(f,hidden,tracking):
    f.television=False
    tracker=f.run(MODULE,PROVIDE,(f.new(MODULE),f.context))[0]
    for page,installed in [('818',False),('818',True),('101',False)]:
        f.prefs.clear();store=f.new(STORAGE);f.run(STORAGE,'<init>(Landroid/content/SharedPreferences;)V',(store,f.preferences))
        controller=f.new(PROMO)
        f.run(PROMO,'<init>(Landroidx/fragment/app/FragmentManager;'+STORAGE+TRACKER+')V',
              (controller,Reference({},'Landroidx/fragment/app/FragmentManager;'),store,tracker))
        f.events.clear();visible=[]
        for _ in range(4):
            before=sum(e[0]=='promotion' for e in f.events)
            f.run(PROMO,'handleDialog(Ljava/lang/String;Z)V',(controller,page,int(installed)))
            visible.append(sum(e[0]=='promotion' for e in f.events)>before)
        eligible=page=='818' and not installed and not hidden
        assert visible==([False,False,True,False] if eligible else [False]*4),'Teletekst still shows its promotion or changed native visit rules'
        assert f.prefs.get(page,0)==(3 if eligible else 0),'Teletekst hidden promo changed local visit storage'
        assert sum(e[0]=='sdk-event' for e in f.events)==int(eligible and not tracking),'Teletekst promotion/tracking controls are coupled'


def verify_lifecycle(f,tracking):
    f.television=False;tracker=f.run(MODULE,PROVIDE,(f.new(MODULE),f.context))[0]
    main=f.new(MAIN,{MAIN+'->analyticsTracker:'+TRACKER:tracker,
                     MAIN+'->handler:Landroid/os/Handler;':Reference({},'Landroid/os/Handler;'),
                     MAIN+'->refreshtask:Ljava/lang/Runnable;':Reference({},'Ljava/lang/Runnable;'),
                     MAIN+'->focuspoint:Landroid/widget/LinearLayout;':Reference({},'Landroid/widget/LinearLayout;')})
    f.events.clear();f.run(MAIN,'createPageTracker(Ljava/lang/String;Ljava/lang/Boolean;)V',(main,'101',Reference(False,'Ljava/lang/Boolean;')))
    assert sum(e[0]=='sdk-event' for e in f.events)==int(not tracking)
    assert f.repo.value[REPO+'->_currentPageTracker:Lnl/npo/tag/sdk/tracker/PageTracker;']==0
    for tv,seconds in [(False,-1),(False,0),(False,15),(True,-1)]:
        f.prefs['auto_refresh']=str(seconds);main.value[MAIN+'->isTelevision:Z']=int(tv);f.events.clear()
        f.run(MAIN,'autorefreshtask()V',(main,))
        refresh=[e for e in f.events if e[0]=='refresh'];expected=60 if tv else seconds
        assert len(refresh)==int(expected>0)
        if expected>0:assert refresh[0][1] is main.value[MAIN+'->refreshtask:Ljava/lang/Runnable;'] and refresh[0][2]==expected*1000
    f.events.clear();f.run(MAIN,'onPause()V',(main,))
    assert [e[0] for e in f.events]==['activity-pause','remove-refresh','clear-focus']


def verify(root,selected,apk):
    assert selected<=NAMES
    source=Smali(root);decl=DexDeclarations.from_apk(apk)
    if not selected:assert decl.source_sha256==BASE_SHA256
    edits=([TRACKING_EDIT] if 'Disable tracking' in selected else [])+([PROMOTION_EDIT] if 'Hide promotions' in selected else [])
    for owner,sig,flags,local,count,digest in CONTRACTS:
        actual=decl.classes[owner].methods[sig];body=source.body(owner,sig);v=canonical(body)
        assert actual.access_flags==flags and int(re.search(r'\.locals (\d+)',body)[1])==local,'Teletekst ABI changed'
        owned=[e for e in edits if (e['owner'],e['signature'])==(owner,sig)]
        if owned:v=restore_alignment(restore_edits(v,owned,local),count)
        assert len(v.code)==count and v.digest()==digest,'Teletekst retained graph changed: '+owner+'->'+sig
    assert ET.parse(root/'AndroidManifest.xml').getroot().get('package')=='com.eoffice.android'
    sdk,archive=sdk_classes()
    try:
        f=Fixture(source,decl,sdk)
        verify_factory(f,'Disable tracking' in selected)
        verify_promotions(f,'Hide promotions' in selected,'Disable tracking' in selected)
        verify_lifecycle(f,'Disable tracking' in selected)
    finally:archive.close()
    print('PASS NOS Teletekst: '+(', '.join(sorted(selected)) or 'original')+f' ({len(CONTRACTS)} method contracts)')


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('root',type=Path);p.add_argument('--apk',type=Path,required=True);p.add_argument('-e',action='append',default=[],choices=sorted(NAMES));a=p.parse_args();verify(a.root,set(a.e),a.apk)
