"""Execute NOS Teletekst methods with explicit Android/SDK boundaries."""
import re
from brabant_smali import canonical
from rtl_vm import Memory,Reference,VmThrown,execute,is_zero
from verify_dumpert import absolute_registers,audit_call
from teletekst_contracts import CONTRACTS

A='Lnl/nos/teletekst/'
MODULE=A+'modules/AnalyticsModule;'
FACTORY=A+'modules/AnalyticsModule_ProvideTrackerFactory;'
TRACKER='Lnl/nos/analytics/Tracker;'
EVENT='Lnl/nos/analytics/TrackingEvent;'
MULTI='Lnl/nos/analytics/trackers/MultiTracker;'
SDK=A+'analytics/trackers/sdk/SdkTracker;'
PROMO=A+'voetbalscores/VoetbalscoresDialogController;'
STORAGE=A+'pageview/PageViewStorage;'
MAIN=A+'activities/Main;'
OBSERVER='Lnl/nos/sdk/analytics/PageLifecycleObserver;'
REPO='Lnl/nos/sdk/analytics/npotag/PageTrackerRepository;'
PROVIDE='provideTracker(Landroid/content/Context;)'+TRACKER
TRACK='track('+EVENT+')V'
POLICY='dialogShouldBeShown(Ljava/lang/String;Z)Z'


class Fixture:
    def __init__(self,source,declarations,sdk):
        self.source,self.declarations,self.sdk=source,declarations,sdk
        self.rows={r[:2]:r for r in CONTRACTS};self.programs={};self.events=[];self.statics={}
        self.memory=Memory(self.parents);self.memory.statics=self.statics
        self.native=set();self.television=False;self.prefs={}
        self.context=Reference({'retained_ids':['existing-party','existing-dam'],'pending_measurement':['old-event']},'Landroid/content/Context;')
        self.preferences=Reference(self.prefs,'Landroid/content/SharedPreferences;')
        self.repo=self.new(REPO);self.run(REPO,'<init>()V',(self.repo,))
        self.observer=self.new(OBSERVER)
        self.statics[OBSERVER+'->INSTANCE:'+OBSERVER]=self.observer
        self.statics[OBSERVER+'->pageTrackerRepository:'+REPO]=self.repo
        self.native={(MODULE,PROVIDE),(FACTORY,'provideTracker('+MODULE+'Landroid/content/Context;)'+TRACKER),
                     (MULTI,'<init>(['+TRACKER+')V'),(MULTI,TRACK),
                     (PROMO,POLICY),(PROMO,'showDialog()V'),(STORAGE,'getPageViews(Ljava/lang/String;)I'),(STORAGE,'addPageView(Ljava/lang/String;)V'),
                     (REPO,'getCurrent()Lnl/npo/tag/sdk/tracker/PageTracker;'),(REPO,'clear()V'),(OBSERVER,'onShow()V'),(OBSERVER,'onPause()V')}

    def parents(self,owner):
        if owner in self.declarations.classes:
            c=self.declarations.classes[owner];return tuple(x for x in (c.superclass,*c.interfaces) if x)
        c=self.sdk(owner);assert c,'Missing Teletekst platform type: '+owner
        return tuple(x for x in (c[1],*self.sdk.interfaces(owner)) if x)

    def defaults(self,value):
        owner=value.descriptor
        while owner in self.declarations.classes:
            for line in self.source.text(owner).splitlines():
                if not line.startswith('.field ') or 'static' in line.split():continue
                m=re.search(r' ([^ ]+):([^ ]+)(?: |$)',line);assert m
                value.value.setdefault(owner+'->'+m[1]+':'+m[2],0)
            owner=self.declarations.classes[owner].superclass
        return value

    def new(self,owner,fields=None):
        value=self.defaults(Reference({},owner));value.value.update(fields or {});return value

    def program(self,owner,sig):
        key=owner,sig
        if key not in self.programs:
            assert key in self.rows,'Unpinned Teletekst execution: '+str(key)
            value=canonical(self.source.body(owner,sig))
            value.program.instructions=[absolute_registers(l,self.rows[key][3]) for l in value.program.instructions]
            self.programs[key]=value.program
        return self.programs[key]

    def run(self,owner,sig,args=(),start=0,stop_at=(),registers=None):
        local=self.rows[owner,sig][3];frame={'v'+str(local+i):v for i,v in enumerate(args)};frame.update(registers or {})
        value=execute(self.program(owner,sig),frame,self.invoke,start=start,stop_at=stop_at,memory=self.memory,
                      trace=lambda line:audit_call(line,owner,self.declarations,self.sdk))
        return value,frame

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if (owner,sig) in self.native:return self.run(owner,sig,args)[0]
        if target=='Ljava/lang/Object;-><init>()V':self.defaults(args[0]);return None
        if owner=='Lkotlin/jvm/internal/Intrinsics;' and sig.startswith('checkNotNull'):
            if is_zero(args[0]):raise VmThrown(Reference({},'Ljava/lang/NullPointerException;'))
            return None
        if target=='Ldagger/internal/Preconditions;->checkNotNullFromProvides(Ljava/lang/Object;)Ljava/lang/Object;':
            assert not is_zero(args[0]);return args[0]
        if target==A+'util/DeviceUtil;->isTelevision(Landroid/content/Context;)Z':return int(self.television)
        if owner==SDK and sig=='<init>(Landroid/content/Context;Z)V':
            assert args[1] is self.context and args[2]==int(self.television)
            self.events.append(('sdk-created',args[0]));return None
        if target==TRACKER+'->'+TRACK:
            if args[0].descriptor==MULTI:return self.run(MULTI,TRACK,args)[0]
            assert args[0].descriptor==SDK;self.events.append(('sdk-event',args[1]));return None
        if target=='Ljava/lang/String;->equals(Ljava/lang/Object;)Z':return int(args[0]==args[1])
        if target=='Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I':return args[0].value.get(args[1],args[2])
        if target=='Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;':return args[0].value.get(args[1],args[2])
        if target=='Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':return Reference(args[0].value,'Landroid/content/SharedPreferences$Editor;')
        if target=='Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;':args[0].value[args[1]]=args[2];return args[0]
        if target=='Landroid/content/SharedPreferences$Editor;->apply()V':return None
        if owner==A+'voetbalscores/VoetbalscoresDialog;' and sig=='newInstance()'+owner:return self.new(owner)
        if sig=='show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V' and owner==A+'voetbalscores/VoetbalscoresDialog;':self.events.append(('promotion',args[0]));return None
        if owner.startswith(A+'analytics/events/') and sig.startswith('<init>('):return None
        if target=='Ljava/lang/Boolean;->booleanValue()Z':return int(args[0].value)
        if target==A+'analytics/PageNameFormatterKt;->formatPageForAnalytics(Ljava/lang/String;Z)Ljava/lang/String;':return 'fixture-page/'+args[0]
        if target=='Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;':return self.preferences
        if target=='Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I':return int(args[0])
        if target=='Landroid/os/Handler;-><init>()V':return None
        if target=='Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z':self.events.append(('refresh',args[1],args[2]));return 1
        if target=='Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V':self.events.append(('remove-refresh',args[1]));return None
        if target==A+'activities/Hilt_Main;->onPause()V':self.events.append(('activity-pause',));return None
        if target=='Landroid/widget/LinearLayout;->clearFocus()V':self.events.append(('clear-focus',));return None
        raise AssertionError('Unmodeled Teletekst boundary: '+target)
