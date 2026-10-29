// Synthetic public structures only. No publisher HTML, prose or identifiers.
const assert = require('node:assert/strict'), vm = require('node:vm');
const input = JSON.parse(require('node:fs').readFileSync(0, 'utf8'));
function scenario(host, denied, optional, arrangement='single', firstUnrelated=false, toolbar='none') {
  const observers = [], removed = [], styles = [], keys = ['eventor_initialized','eventor_sessionId','eventor_userId','eventor_prev_at','eventor_prev_loggedIn'];
  const storage = new Map([...keys.map(k => [k, 'id']), ['consentedCookies','false'], ['app_data','native'], ['deviceLogged','true'], ['unrelated','keep']]);
  function changed(target, attributeName, type = 'attributes') {
    for (const o of observers) if (o.active && (type === 'childList' || !o.options.attributeFilter || o.options.attributeFilter.includes(attributeName))) o.records.push({target, attributeName, type});
  }
  class Element {
    constructor(tag, classes = '', attrs = {}) {
      this.tagName = tag.toUpperCase(); this.attrs = {...attrs, class: classes}; this.children = []; this.parentNode = null;
      this.style = {getPropertyValue: k => this.style[k] || '', getPropertyPriority: () => '', setProperty: (k,v) => {this.style[k] = v}, removeProperty: k => {this.style[k] = ''}};
      let display = ''; Object.defineProperty(this.style, 'display', {get: () => display, set: v => {display = v; changed(this, 'style')}});
    }
    get id() {return this.getAttribute('id')} set id(v) {this.setAttribute('id',v)}
    getAttribute(k) {return this.attrs[k] ?? null}
    setAttribute(k,v) {v = String(v); if (this.attrs[k] !== v) {this.attrs[k] = v; changed(this,k)}}
    removeAttribute(k) {if (k in this.attrs) {delete this.attrs[k]; changed(this,k)}}
    matches(selector) {return selector.split(',').some(s => {
      s = s.trim();const child=s.lastIndexOf('>');if(child>=0)return this.matches(s.slice(child+1))&&!!this.parentNode?.matches(s.slice(0,child));
      const attrs = [...s.matchAll(/\[([^\]=]+)(?:=['"]?([^\]'"]*)['"]?)?\]/g)]; s = s.replace(/\[[^\]]*\]/g,'');
      return attrs.every(m => this.getAttribute(m[1]) !== null && (m[2] === undefined || this.getAttribute(m[1]) === m[2])) &&
        (!s.match(/^[\w-]+/) || this.tagName.toLowerCase() === s.match(/^[\w-]+/)[0]) &&
        [...s.matchAll(/\.([\w-]+)/g)].every(m => (this.attrs.class || '').split(/\s+/).includes(m[1]));
    })}
    querySelectorAll(s) {return this.children.flatMap(c => [...(c.matches(s) ? [c] : []), ...c.querySelectorAll(s)])}
    querySelector(s) {return this.querySelectorAll(s)[0] || null}
    appendChild(c) {this.children.push(c); c.parentNode = this; if(c.tagName === 'STYLE') styles.push(c); changed(this,null,'childList'); return c}
    replaceChildren(...nodes) {this.children = []; for(const n of nodes)this.appendChild(n); changed(this,null,'childList')}
    click() {if(this.onclick)this.onclick({preventDefault(){}})}
  }
  const doc = new Element('html'); doc.head = doc.appendChild(new Element('head')); doc.body = doc.appendChild(new Element('body','homepage'));
  doc.createElement = tag => new Element(tag); doc.getElementById = id => styles.find(s => s.id === id) || null; doc.documentElement = doc;
  const add = (tag, classes, attrs, parent = doc.body) => parent.appendChild(new Element(tag,classes,attrs));
  const link = (parent, href) => add('a','',{href},parent);
  const share = add('div','share-stickybar'), sticky = add('div','share-stickybar-outer');
  let closeCalls = 0, purchases = 0, manual = 0;
  const shop = add('aside','announcement-bar light',{'data-template':'default','data-id':'7','data-show-in-pulse':'true'});
  link(shop,'https://winkel.ftm.nl/products/example').onclick=()=>purchases++;
  link(shop,'https://winkel.ftm.nl/products/example');
  const close = add('button','close',{},shop);
  const service = new Element('aside','announcement-bar',{'data-template':'default'}); link(service,'https://www.ftm.nl/service');
  const form = new Element('aside','announcement-bar',{'data-template':'subscription'}); add('form','',{},form); link(form,'https://winkel.ftm.nl/products/example');
  const trial1 = add('aside','trial-member-announcement header-announcement'); link(trial1,'/start/trial');
  const trial2 = add('aside','trial-member-announcement diapositive-announcement'); link(trial2,'https://www.ftm.eu/start/trial');
  const trust = add('div','part trust-nugget-pp'); link(trust,'/proefabonnement');
  const retained = ['banner-pp','text-pp','frame-pp','rawhtml-pp','image-gallery-pp','trust-nugget-pp','cookie-unconsent','account'].map(c=>add('div',c));
  for(const path of ['/app-login','/profiel','/start/trial','/proefabonnement','/signup','/payment','/privacy'])link(add('form','manual-membership'),path).onclick=()=>manual++;
  for(const tag of ['audio','video'])retained.push(add(tag,''));
  for(const [tag,classes] of [['div','trial-member-announcement header-announcement'],['aside','trial-member-announcement unknown'],['div','trust-nugget-pp'],['div','banner-pp'],['main','account-choice']]){const n=add(tag,classes);link(n,'/start/trial');link(n,'/proefabonnement');retained.push(n)}
  let cardActions=0,accountActions=0;
  function card(){
    const anchor=add('a','content-link',{href:'/articles/example'});anchor.onclick=()=>cardActions++;
    const wrap=add('div','img-wrap',{},anchor);wrap.style.filter='none';
    const image=add('img','',{src:'https://images.example.test/card.webp'},wrap);image.style.filter='none';image.style.opacity='1';
    const overlay=add('div','app-locked-overlay',{},wrap);overlay.style.display='flex';add('i','fa-solid fa-lock',{},overlay);add('p','',{},overlay);
    return {anchor,wrap,image,overlay};
  }
  const cards=[card(),card(),card()];
  const manualOverlay=add('div','app-locked-overlay',{},add('form','account-controls'));manualOverlay.onclick=()=>accountActions++;
  const otherOverlays=[manualOverlay,add('div','app-locked-overlay'),add('span','app-locked-overlay',{},add('div','img-wrap')),add('div','app-locked-overlay',{},add('section','img-wrap')),add('div','app-locked-overlay',{},add('section','manual-image-controls',{},add('div','img-wrap'))),add('div','membership-overlay',{},add('div','img-wrap'))];
  const consent = add('aside','cookie-consent');
  const user = {loggedIn:true,account:{id:123},consentedCookies:false}, userBefore = JSON.stringify(user);
  const local = {announcement:'99',removeItem(k){removed.push(k);storage.delete(k)}};
  const ctx = {document:doc,location:{hostname:host,href:'https://'+host+'/article'},URL:optional === 'url' ? undefined : URL,window:{FTM:{user}},get localStorage(){if(denied)throw Error('storage denied');return local}};
  ctx.MutationObserver = optional === 'observer' ? undefined : class {
    constructor(callback){this.callback=callback;this.records=[];observers.push(this)}
    observe(_root,options){this.active=true;this.options=options}
    disconnect(){this.active=false;this.records=[]}
  };
  function flush(){for(let i=0;i<15;i++){const pending=observers.filter(o=>o.records.length);if(!pending.length)return;for(const o of pending){const r=o.records;o.records=[];o.callback(r)}}throw Error('mutation loop')}
  const site = ['www.ftm.nl','www.ftm.eu'].includes(host.toLowerCase());
  // Structural visibility only; ftm_browser_fixtures.py verifies real layer/cascade priority.
  function hidden(n){return n.style.display === 'none' || styles.some(s=>s.textContent.replace(/@layer[\w.\s-]+\{/g,'').split('}').some(rule=>{const [selectors,body]=rule.split('{');return body?.includes('display:none!important') && n.matches(selectors)}))}
  const coll = nodes => ({nodes,length:nodes.length,hide(){nodes.forEach(n=>n.style.display='none');return this},show(){nodes.forEach(n=>n.style.display='');return this},data(k){const n=nodes[0],key='data-'+k.replace(/[A-Z]/g,c=>'-'+c.toLowerCase()),v=n?.getAttribute(key);return v==='true'?true:v==='false'?false:k==='id'?Number(v):v},hasClass(c){return !!nodes[0]?.matches('.'+c)}});
  ctx.Oe=()=>coll(doc.querySelectorAll('.announcement-bar')); ctx.le=s=>coll(s==='body'?[doc.body]:doc.querySelectorAll(s)); ctx.Dt=()=>true;ctx.me=()=>true;ctx.tp=()=>{throw Error('manual subscription flow')};
  vm.createContext(ctx);
  if(input.announcementFunctions){vm.runInContext(input.announcementFunctions,ctx);assert.deepEqual(ctx.Oe().nodes,[shop],'actual announcement selector singleton')}
  close.onclick=e=>{closeCalls++;if(input.announcementFunctions)ctx.qA(e);else{e.preventDefault();shop.style.display='none';share.style.display='';if(!denied)local.announcement=local.announcement+',7'}};
  function show(){if(input.announcementFunctions&&!denied){ctx.FA()}else{shop.style.display='';share.style.display='none'}}
  function run(){for(const s of input.scripts)vm.runInContext(s,ctx,{timeout:1000});flush()}
  if(arrangement!=='single'){
    const commercial=arrangement==='commercial', tag=arrangement==='nonaside'?'div':'aside';
    const other=add(tag,'announcement-bar',{'data-template':'default','data-id':commercial?'8':'42','data-show-in-pulse':'true'});
    link(other,commercial||arrangement==='nonaside'?'https://winkel.ftm.nl/products/second':'/service');
    if(arrangement==='form'){const f=add('form','manual',{},other);link(f,'https://winkel.ftm.nl/products/manual').onclick=()=>manual++}
    const otherClose=add('button','close',{},other);
    // Both buttons bind the publisher's real global handler in private probes.
    const dismiss=e=>{closeCalls++;if(input.announcementFunctions)ctx.qA(e);else{e.preventDefault();doc.querySelectorAll('.announcement-bar').forEach(n=>n.style.display='none');share.style.display='';if(!denied)local.announcement+=','+doc.querySelectorAll('.announcement-bar')[0].getAttribute('data-id')}};
    close.onclick=dismiss;otherClose.onclick=dismiss;
    if(firstUnrelated){doc.body.children=doc.body.children.filter(n=>n!==other);doc.body.children.unshift(other)}
    if(input.announcementFunctions)assert.deepEqual(ctx.Oe().nodes,doc.querySelectorAll('.announcement-bar'),'actual multi-root selector');
    show();if(denied){shop.style.display='';other.style.display=''}
    if(commercial){shop.style.display='block';other.style.display='flex'}else share.style.display=toolbar;
    const dismissedBefore=local.announcement, toolbarBefore=share.style.display;
    run();const active=site&&input.ads&&optional!=='url';
    assert.equal(hidden(shop),active,'multi-root commercial announcement');
    assert.equal(hidden(other),commercial&&active,'second commercial or unrelated announcement');
    if(commercial&&active){
      assert.equal(share.style.display,'','all commercial roots restore share toolbar');assert.equal(closeCalls,1,'one global close for commercial group');
      assert.equal(local.announcement,denied?dismissedBefore:dismissedBefore+','+(firstUnrelated?'8':'7'),'only publisher-selected commercial dismissal is stored');
      const closed=closeCalls;run();run();assert.equal(closeCalls,closed,'group cleanup is idempotent');
      show();flush();assert.equal(hidden(shop),true);assert.equal(hidden(other),true);assert.equal(share.style.display,'','later global show preserves share recovery');
      // A closed group can become mixed, then safe again after a notice leaves.
      const notice=add('div','announcement-bar',{'data-id':'42'});notice.style.display='block';share.style.display='none';
      const beforeMixed=closeCalls, beforeIDs=local.announcement;run();assert.equal(closeCalls,beforeMixed);assert.equal(hidden(notice),false);assert.equal(local.announcement,beforeIDs);assert.equal(share.style.display,'none');
      doc.body.replaceChildren(...doc.body.children.filter(n=>n!==notice));flush();assert.equal(closeCalls,beforeMixed+1,'a previously closed group recovers after an unrelated notice leaves');assert.equal(share.style.display,'','safe-again group restores share controls');
      // Each closed root must retain its own display beneath the marker.
      for(const [n,display] of [[shop,'block'],[other,'flex']]){n.replaceChildren(new Element('form','service-replacement'));flush();assert.equal(hidden(n),false,'each commercial root can become a visible form');assert.equal(n.style.display,display,'each root retains its own prior display')}
    }else{
      assert.equal(closeCalls,0,'mixed group cannot invoke global close');assert.equal(local.announcement,dismissedBefore,'mixed group keeps all dismissal IDs');assert.equal(share.style.display,toolbarBefore,'mixed group keeps existing toolbar state');
      assert.equal(hidden(other),false,'unrelated notice remains visible');if(arrangement==='form'){other.querySelector('form').querySelector('a').click();assert.equal(manual,1,'unrelated form remains functional')}
      if(active){doc.body.replaceChildren(...doc.body.children.filter(n=>n!==other));flush();assert.equal(closeCalls,1,'formerly mixed group closes once unrelated root is removed');assert.equal(share.style.display,'','newly safe group restores share controls');assert.equal(local.announcement,denied?dismissedBefore:dismissedBefore+',7')}
    }
    assert.equal(JSON.stringify(user),userBefore);return;
  }
  show(); run();
  const ads=site&&input.ads&&optional!=='url', premium=site&&input.premium&&optional!=='url';
  assert.equal(hidden(shop),ads,'automatic product announcement');
  assert.equal(hidden(trial1),premium,'header trial announcement');assert.equal(hidden(trial2),premium,'diapositive trial announcement');assert.equal(hidden(trust),premium,'subscription trust nugget');
  assert.equal(hidden(consent),site&&input.consent);assert.equal(hidden(sticky),site&&input.premium);
  function checkCard(c){
    assert.equal(hidden(c.overlay),site&&input.premium,'account-required image overlay');
    assert.equal(hidden(c.image),false);assert.equal(hidden(c.wrap),false);assert.equal(hidden(c.anchor),false);
    assert.ok(doc.querySelectorAll('img').includes(c.image),'image remains in document');assert.ok(doc.querySelectorAll('a').includes(c.anchor),'card link remains in document');assert.equal(c.anchor.getAttribute('href'),'/articles/example');
    assert.equal(c.wrap.querySelector('img'),c.image,'original image identity');assert.equal(c.image.getAttribute('src'),'https://images.example.test/card.webp');assert.equal(c.image.style.filter,'none');assert.equal(c.image.style.opacity,'1');assert.equal(c.wrap.style.filter,'none');
    c.anchor.click();assert.equal(cardActions,++checkedCards,'card link remains functional');
  }
  let checkedCards=0;cards.forEach(checkCard);
  const futureCard=card();flush();checkCard(futureCard);futureCard.overlay.style.display='flex';flush();assert.equal(hidden(futureCard.overlay),site&&input.premium,'publisher display cannot restore image overlay');
  for(const n of otherOverlays)assert.equal(hidden(n),false,'unrelated/manual overlay');manualOverlay.click();assert.equal(accountActions,1,'manual account overlay remains functional');
  if(ads){assert.equal(share.style.display,'','close restores share toolbar');assert.equal(closeCalls,1)}else assert.equal(closeCalls,0);
  assert.equal(styles.length,site?Number(input.consent)+2*Number(input.premium)+Number(input.ads):0,'one stylesheet per boundary');
  assert.equal(observers.length,site&&optional!=='observer'?Number(input.premium)+Number(input.ads):0,'one observer per promotion cleanup');
  const registrations=observers.length, closes=closeCalls;run();run();assert.equal(observers.length,registrations,'one observer per cleanup');assert.equal(closeCalls,closes,'repeated cleanup does not dismiss twice');
  for(const n of [service,form,...retained])assert.equal(hidden(n),false,'noncommercial content');
  if(optional!=='observer'){
    show();flush();assert.equal(hidden(shop),ads,'publisher show cannot resurrect ads');if(ads)assert.equal(share.style.display,'','later publisher show restores share controls');
    doc.body.appendChild(service);doc.body.appendChild(form);doc.body.appendChild(new Element('div','announcement-bar',{'data-id':'99'}));if(input.announcementFunctions)assert.deepEqual(ctx.Oe().nodes,doc.querySelectorAll('.announcement-bar'),'actual selector includes non-aside notices');run();assert.equal(hidden(service),false);assert.equal(hidden(form),false);
    const noGlobalClose=closeCalls;shop.style.display='block';flush();assert.equal(closeCalls,noGlobalClose,'multi-root close cannot dismiss another notice');assert.equal(hidden(service),false);assert.equal(hidden(form),false);
    // Mutation reclassification must release the exact same DOM root.
    shop.replaceChildren(new Element('form','membership-form'));flush();assert.equal(hidden(shop),false,'replacement manual form');
    shop.replaceChildren(new Element('a','',{href:'/service'}));flush();assert.equal(hidden(shop),false,'replacement service notice');
    shop.replaceChildren(new Element('a','',{href:'https://winkel.ftm.nl/products/later'}),close);flush();assert.equal(hidden(shop),ads,'reclassified replacement');
    for(const href of ['https://winkel.ftm.nl.evil.test/products/x','https://notwinkel.ftm.nl/products/x','https://winkel.ftm.nl@evil.test/products/x','https://[invalid','javascript:alert(1)','ftp://winkel.ftm.nl/products/x','https://winkel.ftm.nl/products%2fx','https://winkel.ftm.nl/x?next=/products/x']){
      shop.replaceChildren(new Element('a','',{href}));flush();assert.equal(hidden(shop),false,href);
    }
    for(const href of ['https://www.ftm.nl.evil.test/start/trial','https://www.ftm.nl/start/trial/more','https://www.ftm.nl/start%2ftrial','https://evil.test/proefabonnement']){
      trial1.replaceChildren(new Element('a','',{href}));trust.replaceChildren(new Element('a','',{href}));flush();assert.equal(hidden(trial1),false,href);assert.equal(hidden(trust),false,href);
    }
    for(const n of [trial2,trust]){const manualForm=new Element('form','membership');manualForm.appendChild(new Element('a','',{href:n===trust?'/proefabonnement':'/start/trial'}));n.replaceChildren(manualForm);flush();assert.equal(hidden(n),false,'manual form replaces trial promotion')}
    const futureTrial=add('aside','trial-member-announcement header-announcement');link(futureTrial,'/start/trial');flush();assert.equal(hidden(futureTrial),premium,'future trial promotion');
    const manualShop=add('aside','announcement-bar',{'data-template':'default'});const shopForm=add('form','membership',{},manualShop);link(shopForm,'https://winkel.ftm.nl/products/manual');flush();assert.equal(hidden(manualShop),false,'manual shop form');
    const future=add('aside','announcement-bar',{'data-template':'default'});link(future,'http://WINKEL.FTM.NL/products/later');flush();assert.equal(hidden(future),ads,'future automatic promotion');
  }
  assert.equal(JSON.stringify(user),userBefore);for(const [key,value] of [['consentedCookies','false'],['app_data','native'],['deviceLogged','true'],['unrelated','keep']])assert.equal(storage.get(key),value);
  assert.deepEqual([...new Set(removed)].sort(),site&&input.tracking&&!denied?[...keys].sort():[]);assert.equal(purchases,0);assert.equal(manual,0);assert.ok(local.announcement.split(',').includes('99'),'unrelated dismissal ID survives');
  for(const l of doc.querySelectorAll('a'))if(l.parentNode.matches('form.manual-membership'))l.click();assert.equal(manual,7,'manual membership controls remain functional');
}
for(const host of ['www.ftm.nl','www.ftm.eu','WWW.FTM.NL','www.ftm.nl.evil.test','ftm.nl','other.test'])for(const denied of [false,true])for(const optional of ['none','url','observer'])scenario(host,denied,optional);
for(const arrangement of ['commercial','service','form','nonaside'])for(const first of [false,true])for(const denied of [false,true])for(const toolbar of ['', 'none'])scenario('www.ftm.nl',denied,'none',arrangement,first,toolbar);
console.log('PASS emitted DOM: promotions, close/share semantics, replacements, future mutations, exact URLs, optional APIs, idempotence and retained state');
