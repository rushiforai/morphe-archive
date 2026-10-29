"""Execute emitted NRC DOM policy and private shipped paywall modules in Chromium.

NRC_SOURCE_MAIN may point to the privately fetched main JS; no publisher source,
article text, credentials or browser profile is stored in this repository.
"""
from html.parser import HTMLParser
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
from ftm_browser_fixtures import chromium_binary


class Result(HTMLParser):
    value = None
    def handle_starttag(self, _tag, attrs):
        if 'data-result' in dict(attrs):self.value=json.loads(dict(attrs)['data-result'])


def run_browser(runner, data, source=None):
    browser=chromium_binary()
    if not browser:
        assert os.environ.get('NRC_REQUIRE_BROWSER')!='1','Chromium required for NRC fixtures'
        print('SKIP NRC Chromium: set CHROME_BIN');return None
    with tempfile.TemporaryDirectory(prefix='nrc-browser-') as temp:
        root=Path(temp)
        if source:
            # Read a private artifact into a private fixture; never write it to Git.
            (root/'source.js').write_bytes(source.read_bytes())
            script='<script>self.webpackChunkfront=[];</script><script src="source.js"></script>'
        else:script=''
        payload=json.dumps(data).replace('<',r'\u003c')
        html='<!doctype html><meta charset="utf-8"><body>'+script+'<script>'+runner.replace('INPUT',payload)+'</script>'
        page=root/'fixture.html';page.write_text(html)
        process=subprocess.run([browser,'--headless=new','--disable-gpu','--disable-background-networking','--disable-extensions','--disable-dev-shm-usage','--allow-file-access-from-files','--no-first-run','--no-default-browser-check','--virtual-time-budget=4000',f'--user-data-dir={root/"profile"}','--dump-dom',page.as_uri()],capture_output=True,text=True,timeout=30)
        assert process.returncode==0,'NRC Chromium failed: '+str(process.returncode)
        parsed=Result();parsed.feed(process.stdout)
        assert parsed.value and 'error' not in parsed.value,'NRC browser fixture: '+str(parsed.value)
        return parsed.value


DOM_RUNNER=r'''
(async function(){
const input=INPUT,results=[];
try{
for(const [host,path] of [['www.nrc.nl','/nieuws/2026/10/27/example-a1/appview'],['www.nrc.nl','/new/appview'],['www.nrc.nl','/login/appview'],['example.test','/news/appview']]){
 const frame=window.document.createElement('iframe');window.document.body.appendChild(frame);const w=frame.contentWindow,document=w.document;const getComputedStyle=w.getComputedStyle.bind(w);
 let callbacks=0;const OriginalObserver=w.MutationObserver;w.MutationObserver=class extends OriginalObserver{constructor(callback){super((...args)=>{callbacks++;if(callbacks>100)throw Error('MutationObserver loop');callback(...args)})}};
 document.body.innerHTML='<main><div class="vorm__article-content googlebot-article-content"><p>Opening</p><figure><img alt="Editorial"></figure><p>Final substantive paragraph</p><iframe title="Editorial embed"></iframe></div><div class="banner"><div data-banner-position="inline"></div></div><div class="banner" id="editorial-banner">Service notice</div><div data-paywall-topbanner></div><div data-paywall class="paywall hidden"></div><div class="paywall-overcontent-container"></div><form id="manual"><button>Login</button></form></main>';
 document.body.setAttribute('data-page-type',path.includes('/nieuws/')?'article':path.includes('login')?'login':'new-index');
 document.body.classList.add('has-paywall');document.documentElement.classList.add('disable-overflow-fixed');
 const content=document.querySelector('.vorm__article-content'),nodes=[...content.childNodes],body=content.innerHTML;
 const slot=document.querySelector('[data-banner-position]'),ad=slot.parentNode,premium=document.querySelector('[data-paywall-topbanner]'),wall=document.querySelector('[data-paywall]');
 const manual=document.getElementById('manual'),notice=document.getElementById('editorial-banner');
 const loc={hostname:host,pathname:path};
 for(const script of input.scripts)w.Function('location',script)(loc);
 await Promise.resolve();
 const scoped=host==='www.nrc.nl'&&!path.includes('login');
 // Every helper must keep manual account forms even inside an appview.
 results.push({host,path,scoped,ad:getComputedStyle(ad).display,premium:getComputedStyle(premium).display,wall:getComputedStyle(wall).display,body:content.innerHTML===body&&nodes.every((n,i)=>content.childNodes[i]===n),manual:getComputedStyle(manual).display!=='none'&&getComputedStyle(notice).display!=='none',unlocked:!document.body.classList.contains('has-paywall')});
 if(scoped){
  const future=document.createElement('div');future.className='banner';future.innerHTML='<div data-banner-position="inlinevideo"></div>';document.body.appendChild(future);
  ad.style.display='block';premium.style.display='block';
  await new Promise(resolve=>setTimeout(resolve,1));
  results[results.length-1].future=getComputedStyle(future).display;results[results.length-1].reinserted=getComputedStyle(ad).display;
  const settled=callbacks;await new Promise(resolve=>setTimeout(resolve,10));results[results.length-1].quiet=callbacks===settled&&callbacks<100;
  // Reused commercial root becomes an editorial notice; its owned marker
  // must be removed without overwriting the publisher's inline style.
  slot.removeAttribute('data-banner-position');await new Promise(resolve=>setTimeout(resolve,1));results[results.length-1].reused=getComputedStyle(ad).display;
  document.body.setAttribute('data-page-type','login');await new Promise(resolve=>setTimeout(resolve,1));results[results.length-1].manualTransition=getComputedStyle(premium).display;

 }
 for(const key of Object.keys(w))if(key.startsWith('__morpheNrc'))delete w[key];
 document.head.querySelectorAll('style[id^="morphe-nrc-"]').forEach(s=>s.remove());frame.remove();
}
const out=document.createElement('output');out.setAttribute('data-result',JSON.stringify({results}));document.body.replaceChildren(out);
}catch(error){const out=document.createElement('output');out.setAttribute('data-result',JSON.stringify({error:String(error),stack:error.stack}));document.body.replaceChildren(out)}
})();
'''


def verify_dom(scripts, ads, tracking, premium, full):
    evidence=run_browser(DOM_RUNNER,dict(scripts=scripts))
    if evidence is None:return
    assert len(evidence['results'])==4,evidence
    for row in evidence['results']:
        assert row['body'] and row['manual'],row
        assert row['ad']==('none' if ads and row['scoped'] else 'block'),row
        assert row['premium']==('none' if premium and row['scoped'] else 'block'),row
        is_article='/nieuws/' in row['path']
        assert row['wall']==('none' if full and row['scoped'] and is_article else 'block'),row
        assert row['unlocked']==bool(full and row['scoped'] and is_article),row
        if row['scoped']:
            assert row['future']==('none' if ads else 'block'),row
            assert row['reinserted']==('none' if ads else 'block'),row
            assert row['quiet'] and row['reused']=='block' and row['manualTransition']=='block',row
    print('PASS NRC Chromium emitted DOM: received body nodes, media, manual forms, positive ad/premium/wall roots and late mutations')


SOURCE_RUNNER=r'''
(async function(){
const input=INPUT;
try{
 window.nmt={};
 const modules=self.webpackChunkfront[0][1],cache={},requests=[],events=[];let parsedResponses=0;
 console.info=(...args)=>events.push('info:'+args.map(String).join(' '));
 const path='./front/static/js/src/';
 document.body.innerHTML=(input.body||'<div class="vorm__article-content"><p>First</p><p>Middle</p><p>Final</p><iframe title="Editorial"></iframe></div>')+'<div data-paywall class="hidden"></div>';
 document.body.setAttribute('data-page-type','article');
 const article=document.querySelector('.vorm__article-content'),original=[...article.childNodes];
 function jq(value){
  const nodes=typeof value==='string'?[...document.querySelectorAll(value)]:[value];
  return {length:nodes.length,0:nodes[0],width:()=>400,addClass(c){nodes.forEach(n=>n.classList.add(c));return this},removeClass(c){nodes.forEach(n=>n.classList.remove(c));return this},attr(k,v){if(v===undefined)return nodes[0]&&nodes[0].getAttribute(k);nodes.forEach(n=>n.setAttribute(k,v));return this},focus(){return this},is(){return false}};
 }
 jq.get=()=>{events.push('config/campaign');throw Error('Configuration must not be fetched on non-OK wall decision')};
 const meta={pageType:()=> 'article',articleType:()=> 'article',isFree:()=>false,isSafe:()=>false,isAppView:()=>true,id:()=>1,authors:()=>[],articleSection:()=> 'test',publishedAt:()=> '2026-10-27',updatedAt:()=> '2026-10-27',isNativeAdPage:()=>false,isRunner:()=>false,isLiveblog:()=>false,keywords:()=>[],dossier:()=>'',rubric:()=>'',isExpiredArticle:()=>false,isArchived:()=>false};
 const visitor={getSubscriberStatus:()=>Promise.resolve(false),isLoggedIn:()=>false,appPlatform:()=> 'android',getLoginStatus:()=>Promise.resolve({})};
 class Analytics{pushToDataLayer(){}}
 class LoginModal{constructor(){events.push('login-modal')}}
 const noop=function(){};
 const mocks={
  [path+'utils/CommonDOMLookups.js']:{Q2:jq(document.documentElement),gD:jq(document.body),ru:[article]},
  [path+'utils/PageMetaData.js']:{Z:meta},[path+'utils/VisitorMetaData.js']:{Z:visitor},
  [path+'utils/getParam.js']:{Z:()=>null},[path+'utils/getPaperContext.js']:{Z:()=>null},
  [path+'utils/storageAvailable.js']:{Z:()=>false},[path+'utils/createGuid.js']:{Z:()=> 'synthetic-session'},
  [path+'de/getPaperContext.js']:{Z:()=>null},
  [path+'utils/loadScript.js']:{Z:()=>Promise.reject(Error('Synthetic disabled collector'))},
  [path+'utils/loadSplitStylesheet.js']:{Z:()=>Promise.resolve()},
  [path+'services/trackers/GoogleTagManager.js']:{Z:Analytics},
  [path+'ui/LoginModal.js']:{default:LoginModal},
  [path+'constants/Breakpoints.js']:{yp:640},
  './node_modules/jquery/dist/jquery.js':jq,
 };
 function require(name){
  if(mocks[name])return mocks[name];
  if(cache[name])return cache[name].exports;
  if(name===path+'paywall/Paywall.js'||name===path+'paywall/Zephr.js'){
   const module={exports:{}};cache[name]=module;modules[name](module,module.exports,require);return module.exports;
  }
  return new Proxy({Z:noop,default:noop},{get:(target,k)=>k in target?target[k]:noop});
 }
 require.d=(target,definitions)=>{for(const key in definitions)Object.defineProperty(target,key,{get:definitions[key],enumerable:true})};
 require.n=value=>()=>value;
 window.fetch=async(url,options)=>{requests.push([url,options.method]);return {ok:input.status>=200&&input.status<300,status:input.status,json(){parsedResponses++;throw Error('Decision body parsed')}}};
 const exported=require(path+'paywall/Paywall.js'),Paywall=exported.ZP;
 const wall=new Paywall();await wall.initializationPromise;await Promise.resolve();await Promise.resolve();
 for(const script of input.scripts||[])Function('location',script)({hostname:'www.nrc.nl',pathname:'/nieuws/2026/10/27/synthetic-a1/appview'});
 await new Promise(resolve=>setTimeout(resolve,10));
 const retained=original.every((node,i)=>article.childNodes[i]===node)&&article.childNodes.length===original.length;
 const hashes=[...article.querySelectorAll('p[data-original-sha256]')].map(p=>p.getAttribute('data-original-sha256'));
 const completed=wall.isInitialized===true;
 // Positive control executes the original destructive operation for each
 // content-blocking wall type: the test can detect deleted final paragraphs.
 const clipping=[];
 for(const type of [exported.w2.HARD,exported.w2.OVERCONTENT,exported.w2.OVERLAY_TO_BELOWCONTENT]){
  const content=document.createElement('div');content.innerHTML='<p>First</p><p>Middle</p><p>Final</p>';
  Paywall.prototype.clipArticleContent.call({articleContent:content,paywallType:type},1);clipping.push(content.children.length);
 }
 const out=document.createElement('output');out.setAttribute('data-result',JSON.stringify({retained,completed,requests,events,clipping,hashes,parsedResponses}));document.body.replaceChildren(out);
}catch(error){const out=document.createElement('output');out.setAttribute('data-result',JSON.stringify({error:String(error),stack:error.stack}));document.body.replaceChildren(out)}
})();
'''


def verify_private_source(status=403,scripts=None):
    explicit=os.environ.get('NRC_SOURCE_MAIN')
    default=Path(os.environ.get('TMPDIR','/tmp'))/'re/expanded-nrc/web-main-2.js'
    source=Path(explicit) if explicit else default
    if not source.is_file():
        assert os.environ.get('NRC_REQUIRE_SOURCE')!='1','NRC private source required; set NRC_SOURCE_MAIN'
        print('SKIP NRC private original-source paywall regression: set NRC_SOURCE_MAIN');return
    assert hashlib.sha256(source.read_bytes()).hexdigest()=='4acb6d3561884488614326cedb5d10d0aa8862e07d4e692fa1da186823790f4a','Private NRC source changed; re-audit decision/render contracts'
    from nrc_private_fixtures import fixtures
    bodies=fixtures()
    for body in bodies or [None]:
        data=dict(status=status,scripts=scripts or [])
        if body:data['body']=body['html']
        evidence=run_browser(SOURCE_RUNNER,data,source)
        if evidence is None:return
        assert evidence['requests']==[['/paywall-api/api/zephr','POST']],evidence
        assert evidence['retained'] and evidence['completed'] and evidence['parsedResponses']==0,evidence
        assert 'config/campaign' not in evidence['events'],evidence
        assert evidence['clipping']==[1,1,1],evidence
        if body:assert evidence['hashes']==body['hashes'],'All genuine supplied paragraph nodes/order and final substantive hash '+body['id']
    print('PASS NRC original remote paywall module: non-OK decision completes before config/render/clipping; three destructive wall positive controls; '+str(len(bodies))+' genuine premium body shapes retained')


if __name__=='__main__':verify_private_source()
