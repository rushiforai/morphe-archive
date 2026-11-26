// Exercise exactly the Java-generated handoff scripts against a synthetic form.
// No WebView login, network, Turnstile solving, or POST.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const scripts = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const form = {}, events = [], files = [];
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
const window = {};
class File {
  constructor(parts,name,options){this.bytes=Buffer.concat(parts.map(x=>Buffer.from(x)));this.name=name;this.type=options.type}
}
class DataTransfer {constructor(){this.items={add:f=>files.push(f)}}}
class Event {constructor(type,options){this.type=type;Object.assign(this,options)}}
const ctx = vm.createContext({location,window,HTMLInputElement:Input,HTMLTextAreaElement:Textarea,DataTransfer,File,Event,DragEvent:Event,atob,
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
assert.equal(title.value,'title');assert.equal(body.value,'fixture');
assert.deepEqual(events,['input','change','input','change']);
assert.equal(run('chunk'),true);
assert.equal(run('finish'),true);
assert.equal(files.length,1);assert.equal(files[0].name,'attachment.jpg');assert.equal(files[0].type,'image/jpeg');
assert.equal(files[0].bytes.toString(),'abc');assert.equal(dropped.type,'drop');
assert.equal(window['fixture-draft'],undefined);assert.equal(run('finish'),false);
console.log('PASS official-form draft scripts: origin/path guard, title/body, image bytes, single drop, no submission');
