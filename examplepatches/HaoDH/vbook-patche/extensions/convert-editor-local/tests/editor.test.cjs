const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const root=path.join(__dirname,'..','src');
// Local build default: a reachable local server so most tests run without extra setup.
function host(settings={}) {
  const state={settings:{local_base_url:'http://192.168.1.10:1234/v1',local_model:'qwen',...settings},rows:new Map(),calls:[],logs:[],book:'book-1',status:200,finish:'stop',bad:false,terms:[],
    toc:[{id:'a',position:0},{id:'s_section_1',position:1},{id:'b',position:2},{id:'c',position:4}],
    chapters:{0:'Đoạn một.',2:'Đoạn hai.',4:'Đoạn ba.'}};
  const context=vm.createContext({JSON,Math,Date,String,Number,Array,Object,RegExp,parseInt,isNaN,
    Response:{success:data=>({code:0,data}),error:data=>({code:1,data})},
    localConfig:{getItem:k=>state.settings[k]??null},
    localBook:{getInfo:()=>({id:state.book,lastReadChapterIndex:0}),getTableOfContent:()=>state.toc,
      getChapterContent:p=>state.chapters[p]===undefined?null:{content:{raw:state.chapters[p]}}},
    localDatabase:{get:(b,t,k)=>state.rows.get(b+'|'+t+'|'+k)??null,
      count:(b,t)=>[...state.rows.keys()].filter(key=>key.startsWith(b+'|'+t+'|')).length,
      list:(b,t)=>[...state.rows.entries()].filter(([key])=>key.startsWith(b+'|'+t+'|')).map(([key,value])=>({key:key.slice((b+'|'+t+'|').length),value})),
      upsert:(b,t,k,v)=>{state.rows.set(b+'|'+t+'|'+k,v);return true;}},
    console:{log:s=>state.logs.push(s)},
    fetch:(url,options)=>{
      const body=JSON.parse(options.body);state.calls.push({url,options,body});
      const input=body.messages[1].content;
      const reply=state.respond?state.respond(input):state.reply===undefined?'Đã sửa: '+input:state.reply;
      const payload=state.payload?state.payload(input):{text:reply,terms:state.terms};
      const content=state.rawContent!==undefined?state.rawContent:(state.bad?'invalid':JSON.stringify(payload));
      const status=state.statusFor?state.statusFor(url,state.calls.length):state.status;
      const finish=state.finishFor?state.finishFor(input,state.calls.length,url):state.finish;
      const fullBody=state.fullBody!==undefined?state.fullBody:(status!==200?'{}':JSON.stringify({choices:[{finish_reason:finish,message:{content:content}}]}));
      return {ok:status===200,status:status,text:()=>fullBody};
    }});
  state.run=(name,...args)=>{
    const entry=fs.readFileSync(path.join(root,name),'utf8');
    const compiled=entry.replace(/load\(['"](.*?\.js)['"]\);?/g,(_,file)=>fs.readFileSync(path.join(root,file),'utf8'));
    vm.runInContext(compiled,context,{filename:name});
    return context.execute(...args);
  };
  return state;
}

test('edits the whole chapter via the local endpoint with JSON mode off by default',()=>{
  const h=host();h.rawContent='Đoạn đã biên tập.';  // plain text, no JSON envelope
  const result=h.run('translate.js','Nội dung gốc.','vi','qaa','chapterContent');
  assert.equal(result.data,'Đoạn đã biên tập.');
  assert.equal(h.calls.length,1);
  assert.equal(h.calls[0].url,'http://192.168.1.10:1234/v1/chat/completions');
  assert.equal(h.calls[0].body.response_format,undefined);
  assert.equal(h.calls[0].options.headers.Authorization,'Bearer local');  // placeholder key
  assert.equal(h.calls[0].options.timeout,600000);
});

test('the reader and the A–B batch both use the local server (one source only)',()=>{
  const h=host({chapter_from:'1',chapter_to:'1'});h.respond=input=>input;
  h.run('translate.js','Mở đọc.','vi','qaa','chapterContent');
  assert.match(h.calls[0].url,/192\.168\.1\.10:1234/);
  assert.equal(h.run('batch.js').code,0);
  assert.match(h.calls[h.calls.length-1].url,/192\.168\.1\.10:1234/);
});

test('no cloud fallback: a local server error fails the edit without a second call',()=>{
  const h=host();h.status=500;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);
  assert.equal(h.calls.length,3);  // 3 retries on the same local server, then give up
  assert.ok(h.calls.every(c=>/192\.168\.1\.10/.test(c.url)));
  assert.equal(h.rows.size,0);
});

test('a bare IP:port endpoint gets /v1 added automatically',()=>{
  const h=host({local_base_url:'http://192.168.1.10:1234'});h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls[0].url,'http://192.168.1.10:1234/v1/chat/completions');
});

test('an explicit /v1 endpoint is kept, not doubled',()=>{
  const h=host({local_base_url:'http://192.168.1.10:1234/v1'});h.respond=input=>input;
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  assert.equal(h.calls[0].url,'http://192.168.1.10:1234/v1/chat/completions');
});

test('a 200 error body (wrong endpoint) surfaces the server message, no save',()=>{
  const h=host();h.fullBody=JSON.stringify({error:'Unexpected endpoint or method.'});
  const r=h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  assert.equal(r.code,1);
  assert.match(String(r.data),/Unexpected endpoint/);
  assert.equal(h.rows.size,0);
});

test('a 200 body with no choices surfaces the raw response',()=>{
  const h=host();h.fullBody='<html>not an API</html>';
  const r=h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  assert.equal(r.code,1);
  assert.match(String(r.data),/\/v1/);  // hint to check the /v1 path
});

test('missing endpoint fails before any network call',()=>{
  const h=host({local_base_url:''});
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);
  assert.equal(h.calls.length,0);
});

test('a truncated chapter is split in half on the same local server',()=>{
  const h=host();const text='Đoạn một dài hơn.\n\nĐoạn hai dài hơn.';
  h.finishFor=input=>input.length>text.length*0.7?'length':'stop';
  h.respond=input=>input;
  const result=h.run('translate.js',text,'vi','qaa','chapterContent');
  assert.equal(result.code,0);assert.equal(result.data,text);
  assert.equal(h.calls.length,3);
  assert.ok(h.calls.every(c=>/192\.168\.1\.10/.test(c.url)));
});

test('request_timeout overrides the default and JSON mode can be turned on',()=>{
  const h=host({local_json_mode:'true',request_timeout:'900'});h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,0);
  assert.deepEqual(h.calls[0].body.response_format,{type:'json_object'});
  assert.equal(h.calls[0].options.timeout,900000);
});

test('names are learned and only relevant memory is sent later',()=>{
  const h=host();h.terms=[['character','Lâm Phàm']];
  h.run('translate.js','Lâm Phàm đến.','vi','qaa','chapterContent');
  assert.equal(h.rows.get('book-1|ce_characters|Lâm Phàm'),'Lâm Phàm');
  h.terms=[];h.run('translate.js','Lâm Phàm quay lại.','vi','qaa','chapterContent');
  assert.match(h.calls[1].body.messages[0].content,/Lâm Phàm/);
});

test('config exposes only local fields (no DeepSeek/cloud keys)',()=>{
  const cfg=host().run('config.js').data;
  assert.equal(cfg.local_base_url.mode,'input');
  assert.equal(cfg.local_json_mode.mode,'toggle');
  assert.equal(cfg.request_timeout.format,'number');
  for(const gone of ['api_key','fallback_deepseek','gemini_api_key','cloudflare_api_key','custom_base_url','lan_base_url','batch_model'])
    assert.equal(cfg[gone],undefined,gone);
});

test('model picker offers a single local source',()=>{
  const ids=host().run('model.js').data.map(m=>m.id);
  assert.equal(ids.length,1);assert.equal(ids[0],'local');
});

test('genre style presets are still offered',()=>{
  const ids=host().run('style.js').data.map(s=>s.id);
  for(const id of ['natural','wuxia','ngontinh','cungdau','huyenhuyen','khoahuyen','trinhtham','modern'])
    assert.ok(ids.includes(id),id);
});

test('memory export/import works between stories',()=>{
  const h=host();h.rows.set('book-1|ce_characters|Lâm Phàm','Lâm Phàm');
  assert.equal(h.run('export-memory.js').code,0);
  assert.equal(h.rows.get('|ce_shared_memory|character|Lâm Phàm'),'Lâm Phàm');
  h.book='book-2';assert.equal(h.run('import-memory.js').code,0);
  assert.equal(h.rows.get('book-2|ce_characters|Lâm Phàm'),'Lâm Phàm');
});

test('Vietnamese editing target still passes the base-language gate',()=>{
  const h=host();const languages=h.run('language.js').data;
  assert.equal(languages.find(x=>x.type==='from').id,'vi');
  assert.equal(languages.find(x=>x.type==='to').id,'qaa');
  assert.equal(h.run('check-language.js').code,1);  // target not set yet
  h.settings.translate_to_language='qaa';assert.equal(h.run('check-language.js').code,0);
});
