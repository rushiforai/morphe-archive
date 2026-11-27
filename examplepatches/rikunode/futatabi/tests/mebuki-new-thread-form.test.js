// Exercise exactly the Java-generated handoff scripts against a synthetic form.
// No WebView login, network, Turnstile solving, or POST.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const scripts = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const events = [], files = [], previews = [], tags = [{name:'tags[0].name',value:''}];
let invalid=false, disabled=true;
const submit={textContent:'スレッドを作成する',matches:q=>q===':disabled'&&disabled};
const outsidePreviews = [];
const attachmentFieldset = {querySelectorAll:q=>q==='img[alt]'?previews:[]};
const attachmentInput = {closest:q=>q==='fieldset'?attachmentFieldset:null};
const form={
  querySelectorAll(q){return {'img[alt]':[...outsidePreviews,...previews],'button[type=submit]':[submit],'input[name]':tags}[q]||[]},
  querySelector(q){return q==='input[type=hidden][name=attachments]'?attachmentInput:q==='[aria-invalid=true]'&&invalid?{}:null}
};
let dropped;
class Input {
  get value(){return this._value || ''}
  set value(v){this._value=v}
  closest(q){return q==='form'?form:null}
  dispatchEvent(e){events.push(e.type)}
}
class Textarea extends Input {
  get value(){return super.value}
  set value(v){super.value=v}
  closest(q){return q==='section'?section:super.closest(q)}
}
const section = {dispatchEvent(e){dropped=e;return true}};
const title = new Input(), body = new Textarea();
const location = {origin:'https://mebuki.moe', pathname:'/app/new', search:''};
const stored = new Map(), dispatched = [];
const window = {dispatchEvent:e=>dispatched.push(e)};
const localStorage = {setItem:(key,value)=>stored.set(key,value),getItem:key=>stored.get(key)??null};
class File {
  constructor(parts,name,options){this.bytes=Buffer.concat(parts.map(x=>Buffer.from(x instanceof File?x.bytes:x)));this.name=name;this.type=options.type;this.lastModified=options.lastModified??123;this.size=this.bytes.length}
}
class DataTransfer {constructor(){this.files=files;this.items={add:f=>files.push(f)}}}
class Event {constructor(type,options){this.type=type;Object.assign(this,options)}}
const ctx = vm.createContext({location,window,localStorage,CustomEvent:Event,HTMLInputElement:Input,HTMLTextAreaElement:Textarea,DataTransfer,File,Event,DragEvent:Event,atob,
  document:{querySelector(q){return {'input[name=name]':title,'textarea[name=content]':body,'input[name=attachments]':{}}[q]||null}}});
const run = name => vm.runInContext(scripts[name],ctx);
location.origin='https://example.invalid';
for(const step of ['ready','begin','chunk','finish'])assert.equal(run(step),false);
assert.equal(title.value,'');assert.equal(files.length,0);
location.origin='https://mebuki.moe';
location.pathname='/app/t/fixture123';
assert.equal(run('begin'),false);
location.pathname='/app/new';location.search='?fixture=1';
assert.equal(run('begin'),false);
location.search='';
assert.equal(run('ready'),true);
assert.equal(run('begin'),true);
assert.equal(title.value,'fixture');assert.equal(body.value,'title');
assert.equal(run('banner'),true);assert.equal(stored.get('pwa-install-dismissed'),'true');assert.equal(dispatched[0].type,'local-storage-change');assert.equal(dispatched[0].detail.value,true);
assert.equal(run('banner'),true);assert.equal(dispatched.length,1,'already dismissed: no React event');
location.origin='https://example.invalid';assert.equal(run('banner'),false);assert.equal(dispatched.length,1);location.origin='https://mebuki.moe';
assert.deepEqual(events,['input','change','input','change']);
assert.equal(run('imageReady'),false);
assert.equal(run('observe').disabled,true);
assert.equal(run('observe').tagMissing,true);
tags[0].value='fixture-tag';invalid=true;disabled=false;
assert.equal(run('observe').disabled,false);assert.equal(run('observe').tagMissing,false);assert.equal(run('observe').invalid,true);
assert.equal(run('chunk'),true);
assert.equal(run('finish'),true);
assert.equal(files.length,1);assert.equal(files[0].name,'attachment.jpg');assert.equal(files[0].type,'image/jpeg');
assert.equal(files[0].bytes.toString(),'abc');assert.equal(dropped.type,'drop');
assert.equal(window['fixture-draft'],undefined);assert.equal(run('finish'),false);
assert.equal(run('imageReady'),false,'dispatch alone does not confirm attachment');
outsidePreviews.push({alt:'upload_abcdef.jpg',src:'blob:outside'});
assert.equal(run('imageReady'),false,'unrelated preview outside attachment fieldset');
previews.push({alt:'attachment.jpg',src:'blob:fixture'});assert.equal(run('imageReady'),false,'pre-normalization name is not official state');
previews[0]={alt:'upload_abcdef.png',src:'blob:fixture'};assert.equal(run('imageReady'),false,'wrong extension');
previews[0]={alt:'upload_abcdef.jpg',src:'https://example.invalid/picture.jpg'};assert.equal(run('imageReady'),false,'not local blob preview');
previews[0]={alt:'upload_abcdef.jpg',src:'blob:fixture'};assert.equal(run('imageReady'),true);
previews.push({alt:'upload_123456.jpg',src:'blob:second'});assert.equal(run('imageReady'),false,'not exactly one image');
previews.length=0;
if(process.argv[3]){
  // Execute the relevant functions from the actual locally captured official assets.
  // No copied third-party source is committed, no site navigation or network here.
  const path=require('node:path');
  const load=name=>fs.readFileSync(path.join(process.argv[3],name),'utf8');
  const util=load('utils-BJPiTKUD.js'), attachment=load('use-file-attachments-DEVUA6os.js'),
    route=load('app._main.new-DfgTN12t.js');
  function span(source,start,end){
    const a=source.indexOf(start),b=source.indexOf(end,a+start.length);
    assert.ok(a>=0&&b>a,'official function boundary '+start);return source.slice(a,b);
  }
  const normalize=span(util,'var rd=new WeakSet','function sd(');
  const state=span(attachment,'var W={spoiler:','export{N as i');
  const drop=span(route,'me=e=>{e.preventDefault()','},t[8]=')+'}';
  const fileTypes=span(util,'Ru=[',';Yl(');
  assert.ok(attachment.includes('alt:e.file.name'),'official preview uses normalized name');
  assert.ok(attachment.includes('n=u.get(t)')&&attachment.includes('src:n'),'official preview uses generated URL');
  assert.ok(route.includes('onDrop:we')&&route.includes('files:i.attachments'),'official drop and preview share hook state');
  assert.ok(route.includes('C(t,m.attachments),ee(t,{method:')&&route.includes('C(n,m.attachments),N(n,{schema:p})'),'official submit and validation consume same state');
  let reactState,reactRef;
  const official=vm.createContext({
    File,WeakSet,WeakMap,Array,Symbol,
    T:{useState(initial){if(reactState===undefined)reactState=initial;return [reactState,fn=>{reactState=fn(reactState)}]},
       useRef(initial){return reactRef??(reactRef={current:initial})}},
    j:{c:n=>Array(n).fill(Symbol.for('react.memo_cache_sentinel'))},
    A:()=>({open(){}}),C:()=>{}
  });
  vm.runInContext(normalize+';var o=od,r=ad,a=id;var '+fileTypes+';var n=Ru;'+state+
    ';var i=J({maxCount:1});function be(e){return Ru.some(t=>e.name.toLowerCase().endsWith(t))};var '+drop,official);
  const original=files[0];
  official.event={preventDefault(){},dataTransfer:{files:[original]}};
  vm.runInContext('me(event);i=J({maxCount:1})',official);
  const storedFile=official.i.attachments[0].file;
  assert.equal(official.i.attachments.length,1);assert.notEqual(storedFile.name,original.name);
  assert.match(storedFile.name,/^upload_[a-z0-9]{0,6}\.jpg$/);
  assert.equal(storedFile.bytes.toString(),'abc');assert.equal(storedFile.type,original.type);
  assert.equal(storedFile.lastModified,original.lastModified);
  const payload=new Map([['attachments','placeholder']]);
  official.formData={delete:k=>payload.delete(k),append:(k,v)=>payload.set(k,v)};
  vm.runInContext('q(formData,i.attachments)',official);
  assert.equal(payload.get('attachments'),storedFile,'actual official multipart builder uses normalized state');
  assert.equal(payload.get('attachmentAttrs[0].withMetadata'),'');
  previews.push({alt:storedFile.name,src:'blob:official-thumbnail'});
  assert.equal(previews[0].alt===original.name,false,'beta.30 false-negative reproduced');
  if(process.argv[4]){
    const baseline=JSON.parse(fs.readFileSync(process.argv[4],'utf8'));
    assert.equal(vm.runInContext(baseline.imageReady,ctx),false,'actual beta.30 generated script rejects official state');
  }
  assert.equal(run('imageReady'),true,'beta.31 accepts the actual normalized official attachment');
  console.log('PASS official asset execution: drop -> React hook state -> renamed File -> multipart builder; beta.30 false negative reproduced, beta.31 passes');
}
title.value='';body.value='';events.length=0;
assert.equal(run('beginEmpty'),true);assert.equal(title.value,'fixture');assert.equal(body.value,'');
assert.deepEqual(events,['input','change'],'no empty-body validation event');
location.origin='https://example.invalid';
assert.equal(run('imageReady'),false);assert.equal(run('observe'),false);
console.log('PASS official-form scripts: origin, title/body, no redundant input, one drop, actual preview gate, idempotent banner, read-only disabled/tag observation, no submission');
