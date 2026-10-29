"""Run emitted FTM cleanup in a real Chromium CSS engine on synthetic pages.

Optional locally/CI: discover Chromium, or set FTM_BROWSER_BINARY (CHROME_BIN is
also accepted). Set FTM_REQUIRE_BROWSER=1 to reject a missing browser. No browser
profile, publisher source, remote page or third-party Python package is used.
"""
from html.parser import HTMLParser
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


def chromium_binary():
    explicit = os.environ.get('FTM_BROWSER_BINARY') or os.environ.get('CHROME_BIN')
    if explicit:
        binary = shutil.which(explicit) or str(Path(explicit).expanduser())
        assert Path(binary).is_file(), 'FTM browser binary does not exist: ' + binary
        return binary
    names = ['chromium', 'chromium-browser', 'google-chrome', 'google-chrome-stable', 'microsoft-edge']
    candidates = [shutil.which(name) for name in names]
    candidates += [
        '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
        '/Applications/Chromium.app/Contents/MacOS/Chromium',
        '/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge',
    ]
    for variable in ['PROGRAMFILES', 'PROGRAMFILES(X86)', 'LOCALAPPDATA']:
        base = os.environ.get(variable)
        if base:
            candidates += [str(Path(base) / suffix) for suffix in ['Google/Chrome/Application/chrome.exe', 'Microsoft/Edge/Application/msedge.exe']]
    return next((candidate for candidate in candidates if candidate and Path(candidate).is_file()), None)


# Synthetic cascade contracts for the six independently observed publisher
# contexts. No publisher stylesheet, markup, text or account state is copied.
PUBLISHER = '''
body.ftm-app .article-card .app-locked-overlay,
body.ftm-app .article-card-horizontal .app-locked-overlay,
body.ftm-app .homepage-article-card .app-locked-overlay,
body.ftm-app .newsletter-card .app-locked-overlay,
body.myFtm.ftm-app .cards .article-card .app-locked-overlay,
body.homepage.ftm-app .part.article.featured .app-locked-overlay{display:flex!important}
'''

RUNNER = r'''
const input=INPUT;
const variants=[['ftm-app','','article-card'],['ftm-app','','article-card-horizontal'],['ftm-app','','homepage-article-card'],['ftm-app','','newsletter-card'],['myFtm ftm-app','cards','article-card'],['homepage ftm-app','','part article featured']];
const results=[];
try{
 for(const [bodyClass,parentClass,cardClass] of variants)for(const order of ['publisher-first','cleanup-first']){
  const frame=document.createElement('iframe');document.body.appendChild(frame);
  const w=frame.contentWindow,d=w.document;
  d.open();d.write('<!doctype html><head></head><body></body>');d.close();d.body.className=bodyClass;
  const parent=d.createElement('div');parent.className=parentClass;d.body.appendChild(parent);
  const card=d.createElement('a');card.className=cardClass;card.setAttribute('href','/articles/example');
  card.innerHTML='<div class="img-wrap"><img alt="" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"><div class="app-locked-overlay" style="display:none"><i class="fa-solid fa-lock"></i><p>Example</p></div></div>';
  parent.appendChild(card);
  const overlay=card.querySelector('.app-locked-overlay'),image=card.querySelector('img'),wrap=image.parentNode,href=card.getAttribute('href');
  const negatives=d.createElement('div');negatives.innerHTML='<form><div class="app-locked-overlay"><button type="button">Manual</button></div></form><div class="app-locked-overlay"></div><section class="img-wrap"><div class="app-locked-overlay"></div></section><div class="img-wrap"><span class="app-locked-overlay"></span><section><div class="app-locked-overlay"></div></section><div class="membership-overlay"></div></div>';
  card.appendChild(negatives);
  const manual=negatives.querySelector('button'),unrelated=[...negatives.querySelectorAll('.app-locked-overlay,.membership-overlay')];
  let clicks=0,manualClicks=0;card.addEventListener('click',e=>{e.preventDefault();clicks++});manual.addEventListener('click',e=>{e.stopPropagation();manualClicks++});
  const publisher=d.createElement('style');publisher.textContent=input.publisher;d.head.appendChild(publisher);
  const display=n=>w.getComputedStyle(n).display;
  const before=display(overlay);publisher.remove();
  if(order==='publisher-first')d.head.appendChild(publisher);
  // Only location is a synthetic boundary so exact emitted host guards run on
  // a local file. document, CSSOM, style resolution and mutations are real.
  for(const script of input.scripts)w.Function('location',script)({hostname:'www.ftm.nl',href:'https://www.ftm.nl/article'});
  if(order==='cleanup-first')d.head.appendChild(publisher);
  const after=display(overlay);
  const late=d.createElement('style');late.textContent=input.publisher;d.head.appendChild(late);
  const reinserted=display(overlay);
  const future=card.cloneNode(true);parent.appendChild(future);
  const futureOverlay=future.querySelector('div.img-wrap > div.app-locked-overlay');
  overlay.style.display='flex';
  const laterDisplay=display(overlay);
  card.click();manual.click();
  const imageStyle=w.getComputedStyle(image);
  results.push({context:bodyClass+'/'+parentClass+'/'+cardClass,order,before,after,reinserted,future:display(futureOverlay),laterDisplay,
    images:card.querySelector('img')===image&&image.isConnected&&display(image)!=='none'&&display(wrap)!=='none'&&imageStyle.filter==='none'&&imageStyle.opacity==='1',
    links:card.getAttribute('href')===href&&card.isConnected&&display(card)!=='none'&&clicks===1,
    negatives:unrelated.every(n=>display(n)!=='none')&&manualClicks===1});
  frame.remove();
 }
 document.body.dataset.result=JSON.stringify({results,userAgent:navigator.userAgent});
}catch(error){document.body.dataset.result=JSON.stringify({error:String(error),results})}
'''


class _Result(HTMLParser):
    value = None

    def handle_starttag(self, _tag, attrs):
        attributes = dict(attrs)
        if 'data-result' in attributes:
            self.value = json.loads(attributes['data-result'])


def verify_cascade(scripts, premium):
    browser = chromium_binary()
    if not browser:
        assert os.environ.get('FTM_REQUIRE_BROWSER') != '1', 'FTM Chromium regression required; set FTM_BROWSER_BINARY'
        print('SKIP FTM real-browser cascade: set FTM_BROWSER_BINARY to a Chromium executable')
        return False
    data = json.dumps(dict(scripts=scripts, publisher=PUBLISHER)).replace('<', r'\u003c')
    html = '<!doctype html><meta charset="utf-8"><body><script>' + RUNNER.replace('INPUT', data) + '</script>'
    with tempfile.TemporaryDirectory(prefix='ftm-emitted-cascade-') as directory:
        root = Path(directory)
        page = root / 'fixture.html'
        page.write_text(html)
        command = [browser, '--headless=new', '--disable-gpu', '--disable-background-networking', '--disable-extensions', '--disable-dev-shm-usage', '--no-first-run', '--no-default-browser-check', f'--user-data-dir={root / "profile"}', '--dump-dom', page.as_uri()]
        result = subprocess.run(command, capture_output=True, text=True, timeout=30)
        assert result.returncode == 0, 'FTM browser process failed: ' + str(result.returncode)
        parsed = _Result()
        parsed.feed(result.stdout)
        evidence = parsed.value
        assert evidence and 'error' not in evidence, 'FTM browser fixture failed: ' + str(evidence)
        assert len(evidence['results']) == 12, evidence
        for case in evidence['results']:
            assert case['before'] == 'flex', case
            expected = 'none' if premium else 'flex'
            assert all(case[key] == expected for key in ['after', 'reinserted', 'future', 'laterDisplay']), 'Emitted card CSS cascade: ' + str(case)
            assert case['images'] and case['links'] and case['negatives'], case
    print('PASS FTM real-browser emitted CSS: six publisher contexts, both orders, late reinsertion, future cards, images/links and manual negatives; ' + evidence['userAgent'])
    return True


GUEST_RUNNER = r'''
const input=INPUT,results=[];
try{
 const cases=[];
 for(const host of ['www.ftm.nl','www.ftm.eu']){
  const base={host,path:'/start/splash',classes:'app-fish-layout app-splash',loggedIn:false,link:'/skip-start'};
  cases.push({...base,expected:true},{...base,link:'https://'+host+'/skip-start',expected:true});
  for(const path of ['/start','/start/locale-switcher','/start/determine-default-locale','/app-login','/start/trial','/profiel','/','/start/splash/','/start%2Fsplash'])cases.push({...base,path});
  for(const classes of ['app-fish-layout app-locale-switcher','app-splash','app-fish-layout','account-choice'])cases.push({...base,classes});
  for(const loggedIn of [true,null,'false','missing','no-user','no-ftm'])cases.push({...base,loggedIn});
  for(const link of [null,'/skip-start?login=1','/skip-start#login','/skip-start/','/skip%2Dstart','/app-login','https://'+host+'.example/skip-start','https://other.example/skip-start','http://'+host+'/skip-start','https://user:pass@'+host+'/skip-start','//'+(host.endsWith('.nl')?'www.ftm.eu':'www.ftm.nl')+'/skip-start'])cases.push({...base,link});
  cases.push({...base,host:host+'.example'},{...base,protocol:'http:'},{...base,missingURL:true},{...base,outsideMain:true});
 }
 for(const c of cases){
  const frame=document.createElement('iframe');document.body.appendChild(frame);
  const w=frame.contentWindow,d=w.document;
  d.open();d.write('<!doctype html><head></head><body><main id="main-content"><a class="login" href="/app-login">Account</a><a class="edition" href="/start/locale-switcher">Edition</a></main></body>');d.close();
  d.body.className=c.classes;
  if(c.link!==null){const a=d.createElement('a');a.className='skip';a.setAttribute('href',c.link);(c.outsideMain?d.body:d.querySelector('main')).appendChild(a)}
  const user={loggedIn:c.loggedIn,consentedCookies:false,subscription:{type:null}},native={startupBaseHost:c.host};
  if(c.loggedIn==='missing')delete user.loggedIn;
  if(c.loggedIn!=='no-ftm')w.FTM=c.loggedIn==='no-user'?{}:{user};
  w.localStorage.setItem('consentedCookies','false');w.localStorage.setItem('app_data','preserve-native');
  const snapshot=()=>JSON.stringify({user,native,cookie:w.localStorage.getItem('consentedCookies'),app:w.localStorage.getItem('app_data')});
  const before=snapshot(),visits=[],clicks=[];
  const location=new URL((c.protocol||'https:')+'//'+c.host+c.path);
  location.replace=url=>visits.push(url);
  d.addEventListener('click',e=>{e.preventDefault();clicks.push(e.target.className)});
  for(let repeat=0;repeat<3;repeat++)for(const script of input.scripts)
   w.Function('location','URL',script)(location,c.missingURL?undefined:URL);
  d.querySelector('.login').click();d.querySelector('.edition').click();
  results.push({host:c.host,path:c.path,link:c.link,classes:c.classes,loggedIn:c.loggedIn,
   visits,expected:!!c.expected&&input.consent,unchanged:before===snapshot(),
   manual:clicks.join(',')==='login,edition'&&d.querySelector('.login').isConnected&&d.querySelector('.edition').isConnected});
  frame.remove();
 }
 document.body.dataset.result=JSON.stringify({results});
}catch(error){document.body.dataset.result=JSON.stringify({error:String(error),results})}
'''


def verify_guest_start(scripts, consent):
    """Run the actual emitted policy; only navigation is replaced by a recorder."""
    browser = chromium_binary()
    if not browser:
        assert os.environ.get('FTM_REQUIRE_BROWSER') != '1', 'FTM guest startup requires Chromium'
        print('SKIP FTM guest startup browser regression: Chromium unavailable')
        return False
    data = json.dumps(dict(scripts=scripts, consent=consent)).replace('<', r'\u003c')
    with tempfile.TemporaryDirectory(prefix='ftm-emitted-guest-') as directory:
        root = Path(directory)
        page = root / 'fixture.html'
        page.write_text('<!doctype html><body><script>' + GUEST_RUNNER.replace('INPUT', data) + '</script>')
        result = subprocess.run([browser, '--headless=new', '--disable-gpu', '--disable-background-networking',
            '--disable-extensions', '--no-first-run', '--no-default-browser-check', f'--user-data-dir={root / "profile"}',
            '--dump-dom', page.as_uri()], capture_output=True, text=True, timeout=30)
        assert result.returncode == 0, 'FTM guest browser failed: ' + str(result.returncode)
        parsed = _Result()
        parsed.feed(result.stdout)
        evidence = parsed.value
        assert evidence and 'error' not in evidence, 'FTM guest fixture failed: ' + str(evidence)
        assert len(evidence['results']) == 72, evidence
        for case in evidence['results']:
            expected = ['https://' + case['host'] + '/skip-start'] if case['expected'] else []
            assert case['visits'] == expected, 'FTM guest startup navigation: ' + str(case)
            assert case['unchanged'] and case['manual'], case
    print('PASS FTM emitted guest startup: both editions, exact route/state/link scope, once, retained manual controls; 72 cases')
    return True
