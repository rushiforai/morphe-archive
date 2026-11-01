"""Independently check decoded Weerplaza 3.13.1 patch effects and retained paths."""
import argparse
import hashlib
import json
import subprocess
from urllib.parse import urlsplit, unquote
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from verify_weerplaza_maps import verify_maps

A = '{http://schemas.android.com/apk/res/android}'
APP = 'com/meteoplaza/app/'
NAVIGATION_BODY_SHA256 = '77e8a087a8fbc271f0cc0966f153bc601a3f576400f24f11a6f64a4c0ce1068a'
PAGE_FINISHED_SHA256 = 'fd9e7dfa369b95891eea3ff787481113ad00553134e2a4e39ad7e244e4b34ea9'
HOURLY_BODY_SHA256 = '30c850314b82828a42ad81d195afb11310742015f49e1c93194f863422d2bd64'
NAMES = {'Hide ads', 'Hide Premium banner', 'Disable tracking', 'Skip consent screens', 'Fix Google Maps'}
BANNERS = ['activity_current_and_extremes', 'fragment_sun', 'fragment_splash', 'fragment_splash_pro', 'fragment_flash', 'fragment_settings_menu']
ASSETS = ['openwrapsdk.js', 'omsdk-v1.js', 'apn_omsdk.js', 'apn_renderNativeAssets.html', 'apn_vastvideo.html', 'mobilevastplayer.js', 'astmediationmanager.js', 'pob_mraid.js', 'dsa_page.html', 'PubMatic_Logo.svg', 'pob_info_button.svg', 'pob_person_button.svg']

def zero_dp(value):
    """Accept equivalent apktool renderings of the compiled zero-dp value."""
    return isinstance(value, str) and re.fullmatch(r'0(?:\.0+)?(?:dp|dip)', value) is not None

def resource(root, path):
    p = root / path
    return p if p.exists() else root / 'apktool' / path

def method(root, cls, signature):
    paths = list(root.glob(f'smali*/{cls}.smali')) + list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths) == 1, f'Expected one {cls}, found {len(paths)}'
    match = re.search(r'^\.method[^\n]* ' + re.escape(signature) + r'\n(.*?)^\.end method', paths[0].read_text(), re.M | re.S)
    assert match, f'Missing {cls}->{signature}'
    lines, annotations = [], 0
    for raw in match[1].splitlines():
        line = raw.strip()
        if line.startswith('.annotation'): annotations += 1
        if line.startswith('.end annotation'):
            annotations -= 1
            continue
        if annotations or not line or line.startswith(('.', ':', '#')): continue
        lines.append(line.split('    #')[0])
    return lines

def canonical_method(root, cls, signature, skip=0):
    """Resolve label names to relative instruction targets for preserved-body checks."""
    paths = list(root.glob(f'smali*/{cls}.smali')) + list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths) == 1, cls
    match = re.search(r'^\.method[^\n]* ' + re.escape(signature) + r'\n(.*?)^\.end method', paths[0].read_text(), re.M | re.S)
    assert match, signature
    labels, instructions, annotations = {}, [], 0
    for raw in match[1].splitlines():
        line = raw.strip()
        if line.startswith('.annotation'): annotations += 1
        if line.startswith('.end annotation'):
            annotations -= 1
            continue
        if annotations or not line or line.startswith(('.', '#')): continue
        if line.startswith(':'):
            labels[line] = len(instructions)
        else:
            instructions.append(line.split('    #')[0])
    return [re.sub(r'(?<!\S):[a-zA-Z0-9_]+', lambda m: '@' + str(labels[m[0]] - skip), line)
            for line in instructions[skip:]]


def verify_hourly_promotion(root, premium):
    signature = 'k(Ljava/util/List;ZLud/a;Landroidx/compose/runtime/Composer;I)V'
    code = canonical_method(root, 'd8/q0', signature)
    assert (code[:2] == ['if-nez p1, @2', 'return-void']) == premium, 'Skip only unsubscribed hourly Premium notice'
    body = canonical_method(root, 'd8/q0', signature, 2 if premium else 0)
    assert hashlib.sha256('\n'.join(body).encode()).hexdigest() == HOURLY_BODY_SHA256, 'Preserve subscribed hourly forecast body and original branch targets'
    assert any('Ld8/c1;->m(' in line for line in body), 'Retain real hourly forecast rendering'

def smali_string(literal):
    assert literal.startswith('"') and literal.endswith('"'), literal
    escapes = {'n':'\n', 'r':'\r', 't':'\t', 'b':'\b', 'f':'\f', '"':'"', "'":"'", '\\':'\\'}
    def decode(match):
        value = match[1]
        return chr(int(value[1:],16)) if value.startswith('u') else escapes[value]
    return re.sub(r'\\(u[0-9a-fA-F]{4}|.)', decode, literal[1:-1])


def verify_web_control(root, control, enabled):
    client = APP + 'views/webview/NativeAdsWebView$c'
    name = 'morpheClean' + control
    paths = list(root.glob(f'smali*/{client}.smali')) + list(root.glob(f'smali/smali*/{client}.smali'))
    present = (' ' + name + '(') in paths[0].read_text()
    assert present == enabled, 'Install remote ' + control + ' sanitizer'
    finished = method(root, client, 'onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V')
    calls = [line for line in finished if '->morpheClean' in line]
    expected = 'invoke-static {p1}, L' + client + ';->' + name + '(Landroid/webkit/WebView;)V'
    assert (expected in calls) == enabled, 'Inject sanitizer using original WebView parameter after super'
    assert 'invoke-super {p0, p1, p2}' in finished[0]
    if enabled:
        body = method(root, client, name + '(Landroid/webkit/WebView;)V')
        assert body[-1] == 'return-void' and any('->evaluateJavascript(' in line for line in body)
        script = smali_string(body[0].split(', ', 1)[1])
        exercise_sanitizer(script, control)


def exercise_sanitizer(script, control):
    # Execute the actual emitted Javascript with a small platform-boundary DOM fixture.
    # Assertions concern its observable effects, not mocked internal patch functions.
    runner = r'''
const vm = require('node:vm'), assert = require('node:assert/strict');
const input = JSON.parse(require('node:fs').readFileSync(0, 'utf8'));
(async function () {
  let writes = 0, observers = [], observing = false, notifications = 0;
  function mutate() {
    writes++;
    if (observing) {
      if (++notifications > 100) throw Error('Self-triggering sanitizer mutation loop');
      queueMicrotask(() => observers.forEach(o => o.callback([])));
    }
  }
  function style() {
    const values = new Map(), priorities = new Map();
    return {
      getPropertyValue(k) { return values.get(k) || ''; },
      getPropertyPriority(k) { return priorities.get(k) || ''; },
      setProperty(k,v,p='') { values.set(k,v); priorities.set(k,p); mutate(); },
      removeProperty(k) { const old=values.get(k)||''; values.delete(k); priorities.delete(k); mutate(); return old; },
      get overflow() { return values.get('overflow') || ''; },
      set overflow(v) { this.setProperty('overflow',v); }
    };
  }
  function anchor(href) { return { href, style:style() }; }
  const hidden = new Set(), popup = { classList: {
    contains(c) { return hidden.has(c); }, add(c) { hidden.add(c); mutate(); }
  }};
  const anchors = [anchor('/abonneren/'),anchor('https://www.weerplaza.nl/bevestigen'),
    anchor('https://account.infoplaza.com/abonneren'),anchor('/weerbericht/'),
    anchor('https://weerplaza.nl.attacker.test/abonneren/')];
  const styles=[], body={style:style()}; body.style.overflow='hidden';
  const document={body,head:{appendChild(s){styles.push(s);mutate();}},documentElement:{},
    createElement(tag){ assert.equal(tag,'style'); return {textContent:''}; },
    querySelectorAll(selector){
      if(selector==='.js-premium-popup')return [popup];
      if(selector==='a[href]')return anchors;
      throw Error('Unexpected broad selector: '+selector);
    }};
  const window={wpAppBanner:{banners:[{id:'ad'}],targeting:{city:'Amsterdam'},add(){},get(){return []},android(){return []},ios(){return []}}};
  const context={window,document,location:{hostname:'webapp.weerplaza.nl',href:'https://webapp.weerplaza.nl/weerbericht/'},
    URL,Promise,MutationObserver:class {constructor(callback){this.callback=callback;observers.push(this)}observe(_,options){
      assert.equal(options.childList,true);assert.equal(options.subtree,true);assert.equal(options.attributes,true);
      assert.deepEqual(Array.from(options.attributeFilter),['class','style']);observing=true;}}
  };
  vm.createContext(context); vm.runInContext(input.script,context);
  const flush=async()=>{for(let i=0;i<12;i++)await Promise.resolve()}; await flush();
  assert.equal(styles.length,1); assert.equal(observers.length,1);
  const css=styles[0].textContent; assert(!css.includes('.news-item')); assert(!css.includes('iframe'));
  if(input.control==='Ads') {
    for(const selector of ['SnippetBanner','.banner.snippet','div-Web_APP-Weerplaza_NL-'])assert(css.includes(selector));
    for(const method of ['get','android','ios'])assert.deepEqual(JSON.parse(JSON.stringify(window.wpAppBanner[method]())),{targeting:{},banners:[]});
    window.wpAppBanner.add('test');assert.equal(window.wpAppBanner.banners.length,0);
    assert.equal(hidden.has('hidden'),false);assert.equal(body.style.overflow,'hidden');
    assert.equal(anchors[0].style.getPropertyValue('display'),'');
    const previous=window.wpAppBanner.android;observers[0].callback([]);await flush();assert.equal(window.wpAppBanner.android,previous);
    window.wpAppBanner={targeting:{country:'NL'},banners:[{}]};observers[0].callback([]);await flush();
    assert.deepEqual(JSON.parse(JSON.stringify(window.wpAppBanner.android())),{targeting:{},banners:[]});
  } else {
    assert(css.includes('.js-premium-popup'));assert(hidden.has('hidden'));assert.equal(body.style.overflow,'');
    assert.equal(window.wpAppBanner.banners.length,1);
    if(input.control==='Premium') {
      assert(css.includes('.js-not-premium'));assert(css.includes('.js-premium'));
      for(const a of anchors.slice(0,2)){assert.equal(a.style.getPropertyValue('display'),'none');assert.equal(a.style.getPropertyPriority('display'),'important');}
    } else assert.equal(anchors[0].style.getPropertyValue('display'),'');
    for(const a of anchors.slice(2))assert.equal(a.style.getPropertyValue('display'),'');
    // A legitimate weather modal's scroll lock survives while refusal popup is hidden.
    body.style.overflow='hidden';observers[0].callback([]);await flush();assert.equal(body.style.overflow,'hidden');
    // Activating the refusal popup later repairs its own scroll lock.
    hidden.delete('hidden');observers[0].callback([]);await flush();assert(hidden.has('hidden'));assert.equal(body.style.overflow,'');
    if(input.control==='Premium'){
      const a=anchor('/abonneren');anchors.push(a);observers[0].callback([]);await flush();assert.equal(a.style.getPropertyValue('display'),'none');
    }
  }
  const previousWrites=writes;observers[0].callback([]);await flush();assert.equal(writes,previousWrites,'Idempotent observer');
  vm.runInContext(input.script,context);await flush();assert.equal(styles.length,1);assert.equal(observers.length,1);
  const external={window:{},location:{hostname:'account.infoplaza.com'},document:{createElement(){throw Error('Touched external page')}}};
  vm.createContext(external);vm.runInContext(input.script,external);
})().catch(error=>{console.error(error);process.exitCode=1});
'''
    result = subprocess.run(['node', '-e', runner], input=json.dumps({'script':script,'control':control}), text=True, capture_output=True)
    assert result.returncode == 0, 'Remote '+control+' sanitizer behavior: '+result.stderr


def run_web_policy(root, control, url):
    code = canonical_method(root, APP+'views/webview/NativeAdsWebView$c', 'morpheBlock'+control+'(Ljava/lang/String;)Z')
    registers, result, pc = {'p0':url}, None, 0
    for _ in range(1000):
        line=code[pc]; pc+=1
        if line.startswith('const-string'):
            target,value=line.split(' ',1)[1].split(', ',1);registers[target]=json.loads(value)
        elif line.startswith('const/4'):
            target,value=line.split(' ',1)[1].split(', ',1);registers[target]=int(value,16)
        elif line.startswith('sget-object'): registers[line.split(' ')[1].rstrip(',')]='Locale.ROOT'
        elif line.startswith('move-result'): registers[line.split(' ')[1]]=result
        elif line.startswith('invoke-'):
            args=line.split('{',1)[1].split('}',1)[0].split(', '); values=[registers[a] for a in args]
            if 'Uri;->parse' in line: result=urlsplit(values[0])
            elif 'Uri;->getHost' in line: result=values[0].netloc.rsplit('@',1)[-1].split(':',1)[0] or None
            elif 'Uri;->getPath' in line: result=unquote(values[0].path)
            elif 'String;->toLowerCase' in line: result=values[0].lower()
            elif 'String;->equals' in line: result=values[0]==values[1]
            elif 'String;->endsWith' in line: result=values[0].endswith(values[1])
            else: raise AssertionError('Unexpected policy operation '+line)
        elif line.startswith(('if-eqz','if-nez')):
            op,reg,target=line.replace(',','').split();value=bool(registers[reg])
            if value == (op=='if-nez'):pc=int(target[1:])
        elif line.startswith('goto'):pc=int(line.split('@')[1])
        elif line.startswith('return '):return bool(registers[line.split()[1]])
        else:raise AssertionError('Unsupported policy instruction '+line)
    raise AssertionError('Policy did not terminate')


def verify_web_policy(root, control, enabled):
    client=APP+'views/webview/NativeAdsWebView$c';name='morpheBlock'+control
    paths=list(root.glob(f'smali*/{client}.smali'))+list(root.glob(f'smali/smali*/{client}.smali'))
    assert ((' '+name+'(') in paths[0].read_text()) == enabled, 'Install '+control+' WebView request policy'
    if not enabled:return
    response = method(root,client,'shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;')
    calls = [i for i,line in enumerate(response) if '->'+name+'(Ljava/lang/String;)Z' in line]
    assert len(calls) == 1, 'Link emitted '+control+' request policy'
    i = calls[0]
    assert response[i].startswith('invoke-static {p2}') and response[i+1] == 'move-result v0'
    assert response[i+2].startswith('if-eqz v0, :'), 'Allow only the false policy result'
    assert any('Landroid/webkit/WebResourceResponse;-><init>' in line for line in response), 'Return empty blocked response'
    tests = {
        'Ads': ['https://pubads.g.doubleclick.net/gampad/ads?x=1','https://PUBADS.G.DOUBLECLICK.NET/gampad/ads','https://html-load.com/vendor.js','https://sub.content-loader.com/x','https://css-load.com/x','https://html-load.cc/x','https://img-load.com/x','https://ad-delivery.net/x','https://cadmus.script.ac/x'],
        'Tracking': ['https://www.googletagmanager.com/gtag/js','https://google-analytics.com/g/collect','https://stats.bluebillywig.com/x','https://analytics.infraloods.nl/js/script.js','https://o74248.ingest.us.sentry.io/api/451/envelope/','https://imweather.com/api/auth/_log?x=1','https://report.error-report.com/x','https://cdn.pushalert.co/x','https://api.privacy-center.org/v1/events','https://api.privacy-center.org/v1/sync','https://api.pushalert.co/x','https://weerplaza761.pushalert.co/x'],
        'Consent': ['https://sdk.privacy-center.org/abc-123/loader.js','https://SDK.PRIVACY-CENTER.ORG/abc-123/loader.js'],
    }[control]
    allowed=['https://webapp.weerplaza.nl/weerbericht/','https://www.weerplaza.nl/js/site.min.js','https://account.infoplaza.com/','https://billing.infoplaza.com/','https://user-kv-worker.infoplaza.workers.dev/v1/tmc/favorites','https://infoplaza.fotoloods.nl/embed/x','https://storage.fotoloods.nl/photo.jpg','https://imweather.com/widget/map','https://imweather.com/api/auth/session','https://imweather.com/api/auth/_logExtra','https://notimweather.com/api/auth/_log','https://cdn.bluebillywig.com/player.js','https://infoplaza.bbvms.com/metadata','https://weerplaza.nl.evil.test/js/site.min.js','https://example.com/path/google-analytics.com?host=sentry.io','https://notgoogle-analytics.com/collect','https://doubleclick.net.attacker.test/ad','https://notdoubleclick.net/ad','https://sentry.io.attacker.test/envelope','https://sdk.privacy-center.org/config.json','https://api.privacy-center.org/v1/config']
    for url in tests:assert run_web_policy(root,control,url),control+' blocks '+url
    for url in allowed:assert not run_web_policy(root,control,url),control+' preserves '+url

def verify_premium_navigation(root, premium):
    client=APP+'views/webview/NativeAdsWebView$c'
    signature='shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z'
    code=canonical_method(root,client,signature)
    expected=['invoke-static {p2}, L'+client+';->morpheBlockPremiumNavigation(Ljava/lang/String;)Z',
              'move-result v0','if-eqz v0, @5','const/4 v0, 0x1','return v0']
    assert (code[:5] == expected) == premium, 'Prevent exact own-host subscription redirects before native/external routing'
    body=canonical_method(root,client,signature,5 if premium else 0)
    assert hashlib.sha256('\n'.join(body).encode()).hexdigest() == NAVIGATION_BODY_SHA256, 'Preserve original non-subscription navigation'
    if premium:
        for url in ['https://webapp.weerplaza.nl/abonneren','https://www.weerplaza.nl/abonneren/?source=app','https://weerplaza.nl/bevestigen','https://www.weerplaza.nl/bevestigen/']:
            assert run_web_policy(root,'PremiumNavigation',url), 'Block premium navigation '+url
        for url in ['https://account.infoplaza.com/abonneren','https://billing.infoplaza.com/bevestigen','https://webapp.weerplaza.nl/weerbericht/?next=/abonneren','https://webapp.weerplaza.nl/weerinhetnieuws/abonneren/story','https://www.weerplaza.nl/abonneren-extra','https://weerplaza.nl.attacker.test/abonneren','https://www.weerplaza.nl/bevestigen/me']:
            assert not run_web_policy(root,'PremiumNavigation',url), 'Preserve navigation '+url


def verify(root: Path, selected: set[str]) -> None:
    assert selected <= NAMES, selected - NAMES
    # Every named control includes Maps compatibility through dependencies.
    verify_maps(root, bool(selected))
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    ads = tracking or 'Hide ads' in selected
    premium = 'Hide Premium banner' in selected
    consent = 'Skip consent screens' in selected
    def prefix(cls, sig, code, enabled, label):
        actual = method(root, cls, sig)
        assert (actual[:len(code)] == code) == enabled, label + f' (expected patched={enabled}): {cls}->{sig}'
    def stopped(cls, sig, enabled=ads): prefix(cls, sig, ['return-void'], enabled, 'Suppress sink')
    def false(cls, sig, enabled): prefix(cls, sig, ['const/4 v0, 0x0', 'return v0'], enabled, 'Disable gate')
    false('j9/j$a', 'a()Z', ads)
    for cls, sig in [
        ('k9/d', 'f()V'), ('m9/e', 'f()V'), ('k9/d', 'q()V'), ('m9/e', 'r()V'),
        ('l7/e', 'd(Lj9/c;Landroidx/compose/runtime/Composer;I)V'),
        ('j9/r', 'j(Lj9/c;Landroidx/compose/ui/Modifier;ZLandroidx/compose/runtime/Composer;II)V'),
        (APP+'MeteoPlazaActivity', 'n0()V'), (APP+'views/webview/NativeAdsWebView', 'n(F)V'),
        (APP+'views/webview/NativeAdsWebView', 'z(Z)V'),
        ('com/google/android/gms/ads/MobileAds', 'initialize(Landroid/content/Context;)V'), ('m7/b', 'b(Landroid/content/Context;)V')]: stopped(cls, sig)
    for cls, sig in [('i1/a', 't(Lk1/e;)Z'), ('i1/e', 'D(Lk1/e;Z)Z')]: false(cls, sig, ads)
    weather = method(root, 'b8/o', 'p(Lcom/meteoplaza/app/model/LocationData;Lcom/meteoplaza/app/model/Snow;Lcom/meteoplaza/app/model/MeteoBlockResponse;)V')
    assert (weather[:3] == ['const/4 v0, 0x0', 'invoke-static {p0, p1, p2, p3, v0}, Lb8/o;->r(Lb8/o;Lcom/meteoplaza/app/model/LocationData;Lcom/meteoplaza/app/model/Snow;Lcom/meteoplaza/app/model/MeteoBlockResponse;Lcom/android/volley/VolleyError;)V', 'return-void']) == ads, 'Complete weather through original empty-targeting callback'
    completion = method(root, 'b8/o', 'r(Lb8/o;Lcom/meteoplaza/app/model/LocationData;Lcom/meteoplaza/app/model/Snow;Lcom/meteoplaza/app/model/MeteoBlockResponse;Lcom/android/volley/VolleyError;)V')
    assert any('->v2(' in x for x in completion) and any('HashMap;-><init>' in x for x in completion), 'Retain weather publication'
    for layout in BANNERS + ['main_drawer']:
        doc = ET.parse(resource(root, f'res/layout/{layout}.xml'))
        id_ = '@id/bottom_navigation_view_ad_holder' if layout == 'main_drawer' else '@id/banner_container'
        el, = [e for e in doc.iter() if e.get(A+'id') == id_]
        assert (el.get(A+'visibility') == 'gone' and zero_dp(el.get(A+'layout_height'))) == ads, 'Collapse '+layout
    verify_hourly_promotion(root, premium)
    verify_premium_navigation(root, premium)
    stopped('l8/g', 'j(Landroidx/appcompat/app/AppCompatActivity;)V', premium)
    prefix('l7/g$d', 'a(Lt9/l;Lld/e;)Ljava/lang/Object;', ['sget-object v0, Lfd/i0;->a:Lfd/i0;', 'return-object v0'], premium, 'Complete declined-consent collector')
    for menu in ['nav_menu', 'nav_menu_nl', 'nav_menu_nl_winter']:
        doc = ET.parse(resource(root, f'res/menu/{menu}.xml'))
        el, = [e for e in doc.iter() if e.get(A+'id') == '@id/nav_remove_ads']
        assert (el.get(A+'visible') == 'false') == premium, 'Hide subscription menu '+menu
    for layout, id_ in [('fragment_settings_menu', 'menu_subscriptions'), ('main_drawer', 'promotion_paywall')]:
        el, = [e for e in ET.parse(resource(root, f'res/layout/{layout}.xml')).iter() if e.get(A+'id') == '@id/'+id_]
        assert (el.get(A+'visibility') == 'gone') == premium, 'Hide premium '+id_
    false('t9/y', 'z()Z', consent)
    show = method(root, 't9/y', 'I(Lt9/y;Landroid/app/Activity;)Lfd/i0;')
    assert any('Lt9/z$a;' in x for x in show), 'Retain ConsentNotRequired completion'
    assert any('showPreferences$default' in x for x in method(root, 'v9/d', 'g(Landroid/app/Activity;)V')), 'Retain manual privacy'
    manifest = ET.parse(resource(root, 'AndroidManifest.xml'))
    md = {e.get(A+'name'):e.get(A+'value') for e in manifest.iter('meta-data')}
    for name, value in [('firebase_analytics_collection_deactivated','true'), ('firebase_performance_collection_deactivated','true'), ('firebase_crashlytics_collection_enabled','false'), ('firebase_sessions_enabled','false'), ('delivery_metrics_exported_to_big_query_enabled','false')]:
        assert (md.get(name) == value) == tracking, 'Hard collection flag '+name
    for name in ['com.google.firebase.installations.FirebaseInstallationsRegistrar', 'com.google.firebase.remoteconfig.RemoteConfigRegistrar', 'com.google.firebase.messaging.FirebaseMessagingRegistrar', 'com.google.firebase.perf.FirebasePerfRegistrar']:
        assert 'com.google.firebase.components:'+name in md, 'Retain functional '+name
    for e in manifest.iter('meta-data'):
        n=e.get(A+'name','')
        if tracking: assert not (n.startswith('com.google.firebase.components:com.google.firebase.crashlytics.') or n.startswith('com.google.firebase.components:com.google.firebase.inappmessaging.') or n.endswith('FirebaseSessionsRegistrar') or n.endswith('AnalyticsConnectorRegistrar')), n
    for name, enabled in [('com.google.android.gms.ads.MobileAdsInitProvider',ads),('infoplaza.network.ads.ppid.PPIDContentProvider',tracking)]:
        el, = [e for e in manifest.iter('provider') if e.get(A+'name') == name]
        assert (el.get(A+'enabled') == 'false') == enabled, 'Disable provider '+name
    assert any(e.get(A+'name') == 'com.google.firebase.provider.FirebaseInitProvider' and e.get(A+'enabled','true') == 'true' for e in manifest.iter('provider'))
    perms={e.get(A+'name','') for e in manifest.iter('uses-permission')}
    assert {'android.permission.INTERNET','android.permission.ACCESS_FINE_LOCATION','android.permission.POST_NOTIFICATIONS'} <= perms
    assert ('com.google.android.gms.permission.AD_ID' not in perms) == tracking
    assert (not any(p.startswith('infoplaza.network.ads.ppid.') for p in perms)) == tracking
    for asset in ASSETS: assert resource(root,'assets/'+asset).exists() != ads, 'Ad asset '+asset
    assert resource(root,'assets/webview/web_sdk.html').exists(), 'Retain manual Didomi assets'
    for sig in ['b(Landroid/content/Context;)V','c(Ljava/lang/String;Ljava/lang/String;)V','d(Landroid/app/Activity;Ljava/lang/String;)V','e(Z)V','f(Ljava/lang/String;)V','g(Ljava/util/List;)V']: stopped('u7/b',sig,tracking)
    stopped('p9/a','a(Lo9/e;)V',tracking)
    for sig in ['d(Ljava/lang/String;)V','e(Ljava/lang/Throwable;)V','f(Ljava/lang/String;Ljava/lang/String;)V']: stopped('com/google/firebase/crashlytics/a',sig,tracking)
    prefix('com/google/firebase/crashlytics/a','b()Lcom/google/firebase/crashlytics/a;', ['new-instance v0, Lcom/google/firebase/crashlytics/a;', 'const/4 v1, 0x0', 'invoke-direct {v0, v1}, Lcom/google/firebase/crashlytics/a;-><init>(Le4/y;)V','return-object v0'],tracking,'Retain inert non-null Crashlytics')
    false('e4/e0','d()Z',tracking)
    false('com/google/firebase/messaging/k0','a()Z',tracking)
    false('io/didomi/sdk/s9','a(Ljava/lang/String;Ljava/lang/String;)Z',tracking)
    false('io/didomi/sdk/apiEvents/b','b([Lio/didomi/sdk/i;)Z',tracking)
    stopped('io/didomi/sdk/apiEvents/b','c([Lio/didomi/sdk/i;)V',tracking)
    stopped('io/didomi/sdk/apiEvents/b','f()V',tracking)
    stopped('m1/i','y(Ljava/util/Map;)V',tracking)
    prefix('n9/e','a()Ljava/lang/String;',['const-string v0, ""','return-object v0'],tracking,'Blank PPID')
    adid=method(root,'com/google/android/gms/ads/identifier/AdvertisingIdClient','getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;')
    assert any('00000000-0000-0000-0000-000000000000' in x for x in adid) == tracking, 'Opt-out advertising identifier'
    rc='com/revenuecat/purchases/'
    for name in ['getAutomaticDeviceIdentifierCollectionEnabled','getDiagnosticsEnabled']: false(rc+'PurchasesConfiguration', name+'()Z',tracking)
    for cls,sig in [('PurchasesOrchestrator','setFirebaseAppInstanceID(Ljava/lang/String;)V'),('PurchasesOrchestrator','setAttributes(Ljava/util/Map;)V'),('subscriberattributes/SubscriberAttributesManager','collectDeviceIdentifiers(Ljava/lang/String;Landroid/app/Application;)V'),('common/events/EventsManager','track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V'),('common/events/EventsManager','flushEvents(Lcom/revenuecat/purchases/common/Delay;)V'),('common/events/EventsManager','flushLegacyEvents()V'),('common/events/EventsManager','performPriorityFlush()V'),('common/diagnostics/DiagnosticsSynchronizer','syncDiagnosticsFileIfNeeded()V'),('common/diagnostics/DiagnosticsSynchronizer','syncDiagnosticsFileIfBigEnough()V'),('common/diagnostics/DiagnosticsTracker','trackEvent(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V'),('common/diagnostics/DiagnosticsTracker','trackEventInCurrentThread$purchases_defaultsBc8Release(Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;)V')]: stopped(rc+cls,sig,tracking)
    for args in ['', 'Ljava/lang/String;']:
        prefix(rc+'subscriberattributes/caching/SubscriberAttributesCache','getUnsyncedSubscriberAttributes('+args+')Ljava/util/Map;', ['invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;','move-result-object v0','return-object v0'],tracking,'Suppress cached optional attributes')
    for control, enabled in [('Ads', ads), ('Premium', premium), ('Consent', consent)]:
        verify_web_control(root, control, enabled)
    for control, enabled in [('Ads', ads), ('Tracking', tracking), ('Consent', consent)]:
        verify_web_policy(root, control, enabled)
    finished = method(root, APP+'views/webview/NativeAdsWebView$c', 'onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V')
    original_finished = [line for line in finished if '->morpheClean' not in line]
    assert hashlib.sha256('\n'.join(original_finished).encode()).hexdigest() == PAGE_FINISHED_SHA256, 'Preserve original page-finished weather/title callbacks'
    # These version-specific instruction digests were measured from the independent input.
    # Catch accidental changes to consent writes, weather configuration and purchase callbacks.
    retained = [('io/didomi/sdk/Didomi', 'setUserAgreeToAll()Z', '6361d881f58d5ce2be415e2a0ea9114234c145ff3e508c2d1df9d6e044190e35'), ('io/didomi/sdk/Didomi', 'setUserDisagreeToAll()Z', 'c73003d3e1324d67c611fd07cee77b50ddf4f3e1ed15a804bb48f9d3cc853df8'), ('io/didomi/sdk/Didomi', 'setCurrentUserStatus(Lio/didomi/sdk/models/CurrentUserStatus;)Z', '165d3d0f746d72072d2893f13c74156300df591f6f373216ac9240d8e44086aa'), ('v9/d', 'g(Landroid/app/Activity;)V', '2af310a3e01b20989ed7f99ee538705f713721b223b2a0ec3bfa6ebc1c540405'), ('com/meteoplaza/app/q', 'b()V', '601ee239f24821f2e0be8c28e3e0e160ba0cc57ae17a554a18e754bb1588afca'), ('com/meteoplaza/app/a', 'a(Landroid/content/Context;)V', '0fb5c8367f6a498671ce9e5de7e0047b7cb2457ba4eed3d32714c326920332aa'), ('com/meteoplaza/app/api/MeteoBlockRequest', '<init>(Lcom/android/volley/k$b;Lcom/android/volley/k$a;)V', 'cde4337ff4b6412d5777e110428fb706956e90b24ae8e18f199361fcdbe11684'), ('com/revenuecat/purchases/identity/IdentityManager', 'logIn(Ljava/lang/String;Lud/p;Lud/l;)V', 'da240231e7b857da356208159981585abab8b1b96be0b5f730d4d975829b9fd0'), ('com/revenuecat/purchases/PostReceiptHelper', 'postReceiptAndSubscriberAttributes(Ljava/lang/String;Ljava/lang/String;ZLcom/revenuecat/purchases/common/ReceiptInfo;Lcom/revenuecat/purchases/PostReceiptInitiationSource;Lcom/revenuecat/purchases/models/PurchaseState;Lud/l;Lud/q;)V', '61a555e9bfbe9317c8551ea97695c08236c71cd57fe1a6aa0afb7036635a0ff1')]
    for cls, signature, expected in retained:
        actual = hashlib.sha256('\n'.join(method(root, cls, signature)).encode()).hexdigest()
        assert actual == expected, 'Preserve functional method '+cls+'->'+signature

    print('PASS Weerplaza: '+(', '.join(sorted(selected)) or 'original'))

if __name__ == '__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('decoded',type=Path);p.add_argument('-e',dest='selected',action='append',default=[],choices=sorted(NAMES));a=p.parse_args();verify(a.decoded,set(a.selected))
