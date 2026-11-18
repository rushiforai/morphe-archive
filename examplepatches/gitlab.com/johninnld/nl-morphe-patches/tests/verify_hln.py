"""Independently verify emitted HLN controls and preserved publisher contracts."""
import argparse
import hashlib
import json
import os
import tempfile
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from hln_contracts import *
from verify_weerplaza import canonical_method


def source(root, cls):
    paths = list(root.glob(f'smali*/{cls}.smali')) + list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths) == 1, f'HLN expected one {cls}, found {len(paths)}'
    return paths[0].read_text()


def code(root, cls, sig, skip=0):
    return [s.replace('const-string/jumbo ', 'const-string ') for s in canonical_method(root, cls, sig, skip)]


def digest(lines):
    return hashlib.sha256('\n'.join(lines).encode()).hexdigest()


def physical(root,cls,sig,lines):
    match=re.search(r'^\.method[^\n]* '+re.escape(sig)+r'\n(.*?)^\.end method',source(root,cls),re.M|re.S)
    locals_=re.search(r'\.locals (\d+)',match[1])
    assert locals_, 'HLN decoded method needs explicit locals'
    count=int(locals_[1])
    return [re.sub(r'\bp(\d+)\b',lambda m:'v'+str(count+int(m[1])),line) for line in lines]


def prefix(root, item, expected):
    actual = code(root, *item)
    assert physical(root,*item,actual[:len(expected)]) == physical(root,*item,expected), f'HLN missing typed override {item}'
    return len(expected)


def verify(root: Path, selected: set[str]) -> None:
    assert selected <= NAMES, selected - NAMES
    from hln_listening import verify_listening
    verify_listening(root, selected)
    ads = bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'})
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    premium = 'Hide Premium banner' in selected
    full = 'Read full articles' in selected
    marketing = premium or full
    from hln_legacy_marketing import verify_legacy_marketing
    verify_legacy_marketing(root, marketing or tracking)
    from hln_personalisation import verify_personalisation
    verify_personalisation(root, 'Skip consent screens' in selected)
    from hln_companion import verify_companion
    verify_companion(root, ads)
    if full:
        prefix(root, FULL, ['const/4 v0, 0x0', 'move/16 p3, v0'])
    if marketing:
        prefix(root, MARKETING, ['new-instance v0, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;', 'const/4 v1, 0x0', 'sget-object v2, Lkt5;->a:Lkt5;', 'invoke-direct {v0, v1, v2}, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;-><init>(ZLjava/util/List;)V', 'return-object v0'])
        prefix(root, PAYWALL, ['new-instance v0, Ljava/util/ArrayList;', 'invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V', 'return-object v0'])
    if tracking:
        prefix(root, AMALIA, ['new-instance v0, Lk10;', 'sget-object v1, Llbi;->a:Llbi;', 'invoke-direct {v0, v1}, Lk10;-><init>(Ljava/lang/Object;)V', 'return-object v0'])
    if marketing or tracking:
        prefix(root, MARKETING_LIST, ['new-instance v0, Ljava/util/ArrayList;', 'invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V', 'return-object v0'])
        prefix(root, MARKETING_FLOW, ['new-instance v0, Ljava/util/ArrayList;', 'invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V', 'new-instance v1, Lq3g;', 'invoke-direct {v1, v0}, Lq3g;-><init>(Ljava/lang/Object;)V', 'return-object v1'])
    if premium:
        for item in PREMIUM: prefix(root, item, ['return-void'])
    if 'Skip consent screens' in selected:
        prefix(root, CONSENT, ['sget-object v0, Llbi;->a:Llbi;', 'return-object v0'])
    if tracking:
        for item in TRACK_VOID: prefix(root, item, ['return-void'])
        for item in TRACK_FALSE: prefix(root, item, ['const/4 v0, 0x0', 'return v0'])
        for item in TRACK_TRUE: prefix(root, item, ['const/4 v0, 0x1', 'return v0'])
        for item in TRACK_UNIT: prefix(root, item, ['sget-object v0, Llbi;->a:Llbi;', 'return-object v0'])
    if ads or premium:
        for name, enabled in [('morpheAds', ads), ('morphePremium', premium)]:
            assert code(root, OWNER, name + '()Z')[:2] == [f'const/4 v0, 0x{int(enabled):x}', 'return v0']
        verify_filters(root, ads, premium)
    if ads:
        prefix(root, ('i96','<init>(ZZZZZZ)V'), [f'const/4 p{i}, 0x0' for i in range(1, 5)])
    verify_game(root, ads)
    verify_models(root, ads or premium)
    verify_call_kinds(root)
    verify_tracking_state(root, tracking)
    verify_special(root, ads, tracking, ads or premium)
    verify_preserved(root, selected)
    verify_typed_boundaries(root, tracking, marketing or tracking)
    from hln_catsure import verify_catsure
    verify_catsure(root, tracking)
    from hln_onboarding import verify_onboarding
    verify_onboarding(root, 'Skip consent screens' in selected)


def verify_filters(root, ads, premium):
    # Actual emitted helper interpreter is exercised on independently described DTOs.
    from hln_emitted import evaluate, obj
    a = obj('com/popular/core/model/data/ArticleItem', advertorial=False, id='a')
    b = obj('com/popular/core/model/data/ArticleItem', advertorial=False, id='b')
    sponsored = obj('com/popular/core/model/data/ArticleItem', advertorial=True, id='s')
    ad = obj(MODEL+'Advertisement')
    label = obj(MODEL+'PremiumLabelComponent')
    editorial = obj(MODEL+'ParagraphComponent', id='last substantive paragraph')
    cases = [None, [], [a, b], (a, b), [ad, editorial, label], [sponsored, a, b]]
    for values in cases:
        expected = None if values is None else [v for v in values if not (ads and v in [ad, sponsored]) and not (premium and v is label)]
        actual = evaluate(root, 'morpheFilter(Ljava/util/List;)Ljava/util/List;', [values])
        assert actual == expected and (values is None or actual is not values), 'HLN filter retains order and input immutability'
    for typ in ['PromoBannerTeaser','RegionPromotionTeaser']:
        value = obj(MODEL+typ, e=[a], c=[a])
        assert evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[value]) is value, typ
    for typ in ['DealsBannerTeaser','ShopListTeaser','GamesPromoTeaser']:
        value = obj(MODEL+typ)
        actual = evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[value])
        assert (not actual) if ads else (actual is value), 'HLN commercial card follows ads selection: '+typ
    # HLNVERTORIAL primary with editorial siblings promotes one item, without duplication.
    values = [a, b]
    actual = evaluate(root, 'morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;', [sponsored, values, []])
    assert actual is (a if ads else sponsored)
    assert values == ([b] if ads else [a,b])

    # These regressions run on the real emitted helper methods for every
    # individual selection, as well as in the source-instruction unit tests.
    inline=obj(MODEL+'InlineArticleComponent',c='editorial-id',d=obj(MODEL+'InlineArticleComponent$Properties',h=None,i=None,readMore=True))
    assert evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[inline]) is inline, 'Preserve original editorial inline author/date/read-more with absent body'
    overlay=obj(MODEL+'MediaOverlayComponent',c='editorial-id',d=obj(MODEL+'MediaOverlayComponent$Properties',a=None,b=None,c=None,d=None))
    assert evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[overlay]) is overlay, 'Preserve originally empty editorial media overlay'
    mixed=obj(MODEL+'MediaOverlayComponent',c='id',d=obj(MODEL+'MediaOverlayComponent$Properties',a=ad,b=editorial,c=None,d=None))
    actual=evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[mixed])
    if ads:
        assert not actual['d']['a'] and actual['d']['b'] is editorial and actual['c']=='id', 'Remove only genuine commercial overlay child'
    else:assert actual is mixed
    for typ in ['MarketingComponent','MarketingPositionTeaser']:
        value=obj(MODEL+typ)
        actual=evaluate(root,'morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;',[value])
        assert (not actual) if premium else (actual is value), 'Remove only the selected empty marketing display'
    metadata=obj(MODEL+'Metadata',d='ADVERTORIAL',f=True)
    actual=evaluate(root,'morpheArticleComponents(Ljava/util/List;L'+MODEL+'Metadata;)Ljava/util/List;',[[editorial],metadata])
    assert actual==([] if ads else [editorial]), 'Never retain paid advertorial body after removing its disclosure'


def verify_game(root, ads):
    sig = '<init>(Lcom/google/ads/interactivemedia/v3/api/AdsLoader;Lcom/google/ads/interactivemedia/v3/api/AdsRequest;Lcom/google/ads/interactivemedia/v3/api/AdsRenderingSettings;Lcb7;)V'
    body = code(root,'o37',sig)
    load = 'invoke-interface {p1, p2}, Lcom/google/ads/interactivemedia/v3/api/AdsLoader;->requestAds(Lcom/google/ads/interactivemedia/v3/api/AdsRequest;)V'
    disabled = ['const-string p1, "disabled"', 'invoke-virtual {p0, p1}, Lo37;->b(Ljava/lang/String;)V']
    assert (load in body) != ads, 'HLN game requestAds must use the existing error continuation'
    assert (body[-3:-1] == disabled) == ads, 'HLN game supported error state completes its original callback'


def verify_models(root, active):
    from hln_models import LISTS
    for name,sig,params,mixed,expected in LISTS:
        count = 2*len(params) + (2 if mixed else 0) if active else 0
        body = code(root, MODEL+name, sig)
        if active:
            for offset,p in enumerate(params):
                call = body[2*offset]
                assert '->morphe' + ('ArticleComponents' if name=='ArticleDetailResponse' else 'Filter') + '(' in call, name
                assert body[2*offset+1] == f'move-result-object p{p}', name
            if mixed: assert '->morphePrimary(' in body[2*len(params)], name
        assert digest(code(root, MODEL+name, sig,count)) == expected, 'HLN constructor preserves original raw/cache assignments: '+name


def verify_call_kinds(root):
    from ad_sdk import sdk_classes
    sdk,archive=sdk_classes()
    try:
        for sig,body in re.findall(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method', source(root,OWNER),re.M|re.S):
            if not sig.startswith('morphe'): continue
            for kind,typ,target in re.findall(r'invoke-(static|virtual|interface|direct)(?:/range)?\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)',body):
                try:
                    text=source(root,typ[1:-1]);header=text.splitlines()[0]
                    declaration=re.search(r'^\.method ([^\n]*) '+re.escape(target)+r'$',text,re.M)
                    assert declaration, 'HLN actual APK target method missing: '+typ+'->'+target
                    assert (kind=='static') == ('static' in declaration[1].split()), target
                    if kind in {'virtual','interface'}: assert (kind=='interface') == ('interface' in header.split()), typ
                except AssertionError as error:
                    if not typ.startswith(('Ljava/','Landroid/')): raise error
                    contract=sdk(typ);assert contract, typ
                    if kind in {'virtual','interface'}:assert (kind=='interface')==contract[0],typ
                    while target not in contract[2] and contract[1]:contract=sdk(contract[1]);assert contract
                    assert target in contract[2] and (kind=='static') == bool(contract[2][target]&8), target
                    # These platform APIs all predate API32; never use List.of/copyOf.
                    assert (typ,target) in {('Ljava/util/List;','iterator()Ljava/util/Iterator;'),('Ljava/util/List;','add(Ljava/lang/Object;)Z'),('Ljava/util/List;','isEmpty()Z'),('Ljava/util/List;','remove(I)Ljava/lang/Object;'),('Ljava/util/Iterator;','hasNext()Z'),('Ljava/util/Iterator;','next()Ljava/lang/Object;'),('Ljava/util/ArrayList;','<init>()V'),('Ljava/lang/String;','equalsIgnoreCase(Ljava/lang/String;)Z'),('Ljava/lang/String;','matches(Ljava/lang/String;)Z'),('Ljava/lang/String;','replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;')}, (typ,target)
    finally:archive.close()


def verify_tracking_state(root, tracking):
    manifest=ET.parse(root/'AndroidManifest.xml')
    A='{http://schemas.android.com/apk/res/android}'
    entries=list(manifest.iter('meta-data'))
    fiam=[e.get(A+'name') for e in entries if e.get(A+'name','').startswith('com.google.firebase.components:com.google.firebase.inappmessaging.')]
    assert len(fiam)==(0 if tracking else 4), 'HLN FIAM registration set'
    if tracking:
        assert [e.get(A+'value') for e in entries if e.get(A+'name')=='firebase_analytics_collection_deactivated']==['true']
        flags = {
            'delivery_metrics_exported_to_big_query_enabled': 'false',
            'firebase_analytics_collection_enabled': 'false',
            'firebase_crashlytics_collection_enabled': 'false',
            'firebase_performance_collection_deactivated': 'true',
            'google_analytics_adid_collection_enabled': 'false',
            'google_analytics_default_allow_ad_personalization_signals': 'false',
            'com.facebook.sdk.AutoInitEnabled': 'false',
            'com.facebook.sdk.AutoLogAppEventsEnabled': 'false',
            'com.facebook.sdk.AdvertiserIDCollectionEnabled': 'false',
        }
        for name, value in flags.items():
            assert [e.get(A+'value') for e in entries if e.get(A+'name') == name] == [value], name
        ad_permissions = {'com.google.android.gms.permission.AD_ID',
                          'android.permission.ACCESS_ADSERVICES_AD_ID',
                          'android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
                          'android.permission.ACCESS_ADSERVICES_TOPICS',
                          'android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE'}
        permissions = {e.get(A+'name') for e in manifest.iter('uses-permission')}
        assert not permissions & ad_permissions, 'HLN advertising permissions removed'
        assert 'com.google.android.c2dm.permission.RECEIVE' in permissions, 'HLN retain push delivery'
        for name in ['com.google.firebase.components:com.google.firebase.messaging.FirebaseMessagingRegistrar',
                     'com.google.firebase.components:com.google.firebase.installations.FirebaseInstallationsRegistrar',
                     'com.google.firebase.components:com.google.firebase.remoteconfig.RemoteConfigRegistrar']:
            assert len([e for e in entries if e.get(A+'name') == name]) == 1, 'HLN retain functional registrar: ' + name
        for cls,sig in [('com/kubusapp/MainApplication','onCreate()V'),('com/kubusapp/MainActivity','onCreate(Landroid/os/Bundle;)V'),('dwh','b(Lbt3;)Ljava/lang/Object;')]:
            body=code(root,cls,sig)
            assert sum('->morpheSuppressFiam(' in l for l in body)==1, 'HLN guard every optional FIAM consumer: '+cls
            assert not any('Lff6;->c:Z' in l for l in body), cls
        guard=code(root,OWNER,'morpheSuppressFiam(Lff6;Z)V')
        assert guard==['if-eqz p0, @2','iput-boolean p1, p0, Lff6;->c:Z','return-void']

def removed_instructions(lines, indexes):
    """Remove only known edits while retaining branch destinations independently."""
    def target(match):
        old=int(match[1]);return '@'+str(sum(i not in indexes for i in range(old)))
    return [re.sub(r'@(\d+)',target,line) for i,line in enumerate(lines) if i not in indexes]


def verify_special(root,ads,tracking,filters):
    from hln_special import SPECIAL,FLAGS,SINGLES
    for cls,sig,expected in SPECIAL:
        body=code(root,cls,sig);remove=set()
        if tracking and cls in {'com/kubusapp/MainApplication','com/kubusapp/MainActivity','dwh'}:
            sites=[i for i,line in enumerate(body) if '->morpheSuppressFiam(' in line]
            assert len(sites)==1,cls
            i=sites[0];registers=body[i].split('{')[1].split('}')[0].split(', ')
            receiver,value=registers
            checks=[j for j in range(i-3,i) if body[j]=='nop'];assert len(checks)==1,cls
            body[checks[0]]=f'invoke-virtual {{{receiver}}}, Ljava/lang/Object;->getClass()Ljava/lang/Class;'
            body[i]=f'iput-boolean {value}, {receiver}, Lff6;->c:Z'
        elif tracking and cls=='afi':
            sites=[i for i,line in enumerate(body) if line=='const-string p1, "app_start"'];assert len(sites)==1
            i=sites[0]+1;assert body[i]=='nop'
            body[i]='invoke-virtual {p0, v4, p1}, Lcom/usabilla/sdk/ubform/Usabilla;->sendEvent(Landroid/content/Context;Ljava/lang/String;)V'
        elif tracking and cls=='gn0':
            assert body[2]=='return-void';remove.add(2)
        elif tracking and cls=='gk':
            sites=[i for i,line in enumerate(body) if line=='nop'];assert len(sites)==1
            body[sites[0]]='invoke-interface {p2, p1, v0, v1, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;'
        elif ads and cls=='o37':
            assert body[-3:-1]==['const-string p1, "disabled"','invoke-virtual {p0, p1}, Lo37;->b(Ljava/lang/String;)V']
            body[-3]='invoke-interface {p1, p2}, Lcom/google/ads/interactivemedia/v3/api/AdsLoader;->requestAds(Lcom/google/ads/interactivemedia/v3/api/AdsRequest;)V'
            remove.add(len(body)-2)
        # DEX switch payloads require even code-unit alignment. Replacing a
        # field write with an invoke changes code-unit width without adding an
        # executable instruction; apktool may emit one terminal padding nop.
        if body and body[-1]=='nop' and any(re.search(r'(?:packed|sparse)-switch \S+, @'+str(len(body))+r'$',line) for line in body):remove.add(len(body)-1)
        assert digest(removed_instructions(body,remove))==expected,'HLN preserve initialized startup/callback object and original flow: '+cls
    writes={}
    for cls,sig,expected in FLAGS:
        body=code(root,cls,sig);remove=set()
        selected_fields=({'k'} if ads else set())|({'l'} if tracking else set()) if cls==VIDEO else ({'e' if cls=='bj7' else 'l'} if ads else set())
        for i,line in enumerate(body):
            m=re.match(r'iput-boolean ([vp]\d+), [vp]\d+, L'+re.escape(cls)+r';->(\w+):Z$',line)
            if m and m[2] in selected_fields:
                assert body[i-1]==f'const/4 {m[1]}, 0x0',line
                # Every branch must land on the disabling const, never bypass it.
                assert not any(re.search(r'@'+str(i)+r'\b',l) for l in body), 'HLN flag constructor branch bypasses disabled value'
                remove.add(i-1);writes[(cls,m[2])]=writes.get((cls,m[2]),0)+1
        assert digest(removed_instructions(body,remove))==expected,'HLN preserve video live/resources/auth and game real feature flags: '+cls
    for cls,field,count in [(VIDEO,'k',2),(VIDEO,'l',3),('bj7','e',1),('bwg','l',1)]:
        enabled=tracking if cls==VIDEO and field=='l' else ads
        assert writes.get((cls,field),0)==(count if enabled else 0),(cls,field)
    for cls,sig,params,expected in SINGLES:
        body=code(root,cls,sig)
        if filters:
            assert sum('->morpheSingle(' in l for l in body)==len(params),cls
        assert digest(code(root,cls,sig,2*len(params) if filters else 0))==expected,'HLN preserve mandatory original media primary: '+cls

def verify_preserved(root, selected):
    from hln_retained import RETAINED, PREFIXED
    active = set(selected)
    if active & {'Disable tracking','Skip consent screens'}: active |= {'Hide ads','Disable tracking'}
    for cls, sig, expected in RETAINED:
        assert digest(code(root, cls, sig)) == expected, f'HLN functional method changed: {cls}->{sig}'
    for cls, sig, control, count, expected in PREFIXED:
        enabled = control in active or control == 'marketing' and bool(active & {'Read full articles','Hide Premium banner'}) or control == 'marketingRequests' and bool(active & {'Read full articles','Hide Premium banner','Disable tracking'})
        assert digest(code(root, cls, sig, count if enabled else 0)) == expected, f'HLN original remainder changed: {cls}->{sig}'


def verify_typed_boundaries(root, tracking, marketing_requests):
    """Resolve local completion objects against their real publisher callers."""
    for cls, sig in [('k10', '<init>(Ljava/lang/Object;)V'),
                     ('q3g', '<init>(Ljava/lang/Object;)V')]:
        declaration = re.search(r'^\.method ([^\n]*) ' + re.escape(sig) + '$', source(root, cls), re.M)
        assert declaration and 'public' in declaration[1].split(), 'HLN typed completion constructor is accessible'
    assert '.implements Ll10;' in source(root, 'k10'), 'HLN Amalia success must implement its caller result type'
    flow = source(root, 'q3g')
    assert '.implements Lrk6;' in flow, 'HLN marketing completion must be a real Flow'
    assert 'Lq3g;->_state$volatile:Ljava/lang/Object;' in flow, 'HLN StateFlow stores its initial payload'
    caller = source(root, 'k4m')
    assert 'Lnq8;->d' in caller and 'Lpw7;->H(Lrk6;Lbt3;)Ljava/lang/Object;' in caller
    first = code(root, 'pw7', 'H(Lrk6;Lbt3;)Ljava/lang/Object;')
    assert any('Expected at least one element' in line for line in first), 'Never substitute an empty Flow for first()'
    if tracking:
        prefix(root, AMALIA, ['new-instance v0, Lk10;', 'sget-object v1, Llbi;->a:Llbi;',
                             'invoke-direct {v0, v1}, Lk10;-><init>(Ljava/lang/Object;)V', 'return-object v0'])
        ids = 'be/persgroep/advertising/userprofile/IdManager'
        for sig in ['getCachedUserIds()Ljava/util/Map;', 'getUserIdsWithoutPrivacyCheck()Ljava/util/Map;']:
            prefix(root, (ids, sig), ['sget-object v0, Lmt5;->a:Lmt5;', 'return-object v0'])
        prefix(root, (ids, 'fetch-IoAF18A(Lzs3;)Ljava/lang/Object;'), ['const-string v0, ""', 'return-object v0'])
        for sig in ['getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;',
                    'getInfo()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;']:
            prefix(root, ('com/google/android/gms/ads/identifier/AdvertisingIdClient', sig), [
                'invoke-static {}, ' + TYPE + '->morpheAdvertisingInfo()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;',
                'move-result-object v0', 'return-object v0'])
    if marketing_requests:
        prefix(root, MARKETING_LIST, ['new-instance v0, Ljava/util/ArrayList;',
                                     'invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V', 'return-object v0'])
        prefix(root, MARKETING_FLOW, ['new-instance v0, Ljava/util/ArrayList;',
                                     'invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V',
                                     'new-instance v1, Lq3g;',
                                     'invoke-direct {v1, v0}, Lq3g;-><init>(Ljava/lang/Object;)V', 'return-object v1'])
    from hln_typed import verify_completions
    verify_completions(root, tracking, marketing_requests)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('decoded_root', type=Path)
    parser.add_argument('-e','--enabled', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.decoded_root, set(args.enabled))
    print('HLN emitted verification passed: ' + ', '.join(args.enabled))
