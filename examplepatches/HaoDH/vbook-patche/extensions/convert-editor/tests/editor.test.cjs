const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const root=path.join(__dirname,'..','src');
function host(settings={}) {
  const state={settings:{api_key:'test-key',...settings},rows:new Map(),calls:[],logs:[],book:'book-1',status:200,finish:'stop',bad:false,
    toc:[{id:'a',position:0},{id:'s_section_1',position:1},{id:'b',position:2},{id:'c',position:4}],
    chapters:{0:'Đoạn một.',2:'Đoạn hai.',4:'Đoạn ba.'}};
  const context=vm.createContext({JSON,Math,Date,String,Number,Array,Object,RegExp,parseInt,isNaN,
    Response:{success:data=>({code:0,data}),error:data=>({code:1,data})},
    localConfig:{getItem:k=>state.settings[k]??null},
    localBook:{getInfo:()=>({id:state.book,lastReadChapterIndex:0}),getTableOfContent:()=>state.toc,
      getChapterContent:p=>state.chapters[p]===undefined?null:{content:{raw:state.chapters[p]}}},
    localDatabase:{get:(b,t,k)=>state.rows.get(b+'|'+t+'|'+k)??null,
      list:(b,t)=>[...state.rows.entries()].filter(([key])=>key.startsWith(b+'|'+t+'|')).map(([key,value])=>({key:key.slice((b+'|'+t+'|').length),value})),
      upsert:(b,t,k,v)=>{state.rows.set(b+'|'+t+'|'+k,v);return true;}},
    console:{log:s=>state.logs.push(s)},
    fetch:(url,options)=>{
      const body=JSON.parse(options.body);state.calls.push({url,options,body});
      const input=JSON.parse(body.messages[1].content).paragraphs;
      return {ok:state.status===200,status:state.status,text:()=>state.status!==200?'{}':JSON.stringify({choices:[{finish_reason:state.finish,message:{content:state.bad?'invalid':JSON.stringify({paragraphs:state.reply===undefined?input.map(x=>'Đã sửa: '+x):state.reply})}}]})};
    }});
  context.load=name=>vm.runInContext(fs.readFileSync(path.join(root,name),'utf8'),context,{filename:name});
  state.run=(name,...args)=>{context.load(name);return context.execute(...args);};
  return state;
}
test('live editing returns Vietnamese paragraphs and reuses saved results',()=>{
  const h=host();const a=h.run('translate.js','Hắn đối nàng nói.\nNàng gật đầu.','vi-convert','vi','chapterContent');
  assert.equal(a.code,0);assert.equal(a.data,'Đã sửa: Hắn đối nàng nói.\nĐã sửa: Nàng gật đầu.');
  assert.equal(h.calls.length,1);
  assert.equal(h.run('translate.js','Hắn đối nàng nói.','vi-convert','vi','chapterContent').code,0);
  assert.equal(h.calls.length,1);assert.equal(h.calls[0].url,'https://api.deepseek.com/chat/completions');
});
test('settings, model and book changes never reuse stale cache',()=>{
  const h=host();const run=()=>h.run('translate.js','Văn bản.','vi-convert','vi','chapterContent');
  run();h.settings.instructions='Giữ ta/ngươi';run();h.book='book-2';run();h.settings.translate_model='deepseek-v4-pro';run();
  assert.equal(h.calls.length,4);
});
test('missing key and provider failures do not cache or expose keys',()=>{
  const h=host({api_key:''});assert.equal(h.run('translate.js','Văn bản.','','vi','chapterContent').code,1);assert.equal(h.calls.length,0);
  for(const status of [401,402,429,500]){const a=host();a.status=status;const r=a.run('translate.js','Văn bản.','','vi','chapterContent');assert.equal(r.code,1);assert.equal(a.rows.size,0);assert.ok(!r.data.includes('test-key'));}
  for(const mode of ['bad','length']){const a=host();if(mode==='bad')a.bad=true;else a.finish='length';assert.equal(a.run('translate.js','Văn bản.','','vi','chapterContent').code,1);assert.equal(a.rows.size,0);}
});
test('nonchapter text is passed through without spending API calls',()=>{
  const h=host();assert.equal(h.run('translate.js','Tên truyện.','','vi','detail').data,'Tên truyện.');assert.equal(h.calls.length,0);
});
test('long paragraph is split safely and no chunk is lost',()=>{
  const h=host();const text=Array.from({length:1800},(_,i)=>'nội_dung_'+i).join(' ');const r=h.run('translate.js',text,'','vi','chapterContent');
  assert.equal(r.code,0);assert.ok(h.calls.length>1);
  const inputs=h.calls.flatMap(c=>JSON.parse(c.body.messages[1].content).paragraphs);
  assert.equal(inputs.join(' '),text);assert.ok(inputs.every(s=>s.length<=4000));
});
test('batch uses inclusive one-based TOC order and shares cache with live reader',()=>{
  const h=host({chapter_from:'2',chapter_to:'3'});h.chapters[2]='<p>Đoạn hai.</p><p>Dòng khác.</p>';
  const r=h.run('batch.js');assert.equal(r.code,0);assert.equal(h.calls.length,2);
  const before=h.calls.length;assert.equal(h.run('translate.js','Đoạn hai.\nDòng khác.','','vi','chapterContent').code,0);assert.equal(h.calls.length,before);
  assert.ok(!h.calls.some(c=>c.options.body.includes('Đoạn một.')));
});
test('batch rejects invalid ranges before spending money; missing chapters are reported',()=>{
  for(const settings of [{chapter_from:'3',chapter_to:'2'},{chapter_from:'0',chapter_to:'1'},{chapter_from:'1x',chapter_to:'2'},{chapter_from:'1',chapter_to:'4'}]){
    const h=host(settings);assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,0);
  }
  const h=host({chapter_from:'1',chapter_to:'3'});delete h.chapters[2];assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,2);
});
test('batch stops on API error and resumes from saved paragraphs',()=>{
  const h=host({chapter_from:'1',chapter_to:'2'});h.status=402;assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,1);
  h.status=200;assert.equal(h.run('batch.js').code,0);const n=h.calls.length;assert.equal(h.run('batch.js').code,0);assert.equal(h.calls.length,n);
});
test('missing, extra, empty or nonstring output paragraphs never enter cache',()=>{
  for(const reply of [[],['a','b'],[''],[null],[99]]){
    const h=host();h.reply=reply;assert.equal(h.run('translate.js','Nội dung.','','vi','chapterContent').code,1);assert.equal(h.rows.size,0);
  }
});
test('cached data is checked against exact input even when keys collide or rows are corrupted',()=>{
  const h=host();h.run('translate.js','Nội dung.','','vi','chapterContent');
  const key=[...h.rows.keys()][0];const row=JSON.parse(h.rows.get(key));row.source='Một đoạn khác';h.rows.set(key,JSON.stringify(row));
  h.run('translate.js','Nội dung.','','vi','chapterContent');assert.equal(h.calls.length,2);
  h.rows.set(key,'broken');h.run('translate.js','Nội dung.','','vi','chapterContent');assert.equal(h.calls.length,3);
});
test('actions and config expose a preview and use book-specific settings',()=>{
  const h=host({chapter_from:'2',chapter_to:'3'});h.toc[2].title={raw:'Chương hai'};h.toc[3].title={raw:'Chương ba'};
  const cfg=h.run('config.js');assert.equal(cfg.code,0);assert.ok(cfg.data['instructions_book-1']);
  const action=h.run('action.js');assert.match(action.data.edit_range.description,/Chương hai/);assert.match(action.data.edit_range.description,/Chương ba/);
  h.book='';assert.equal(Object.keys(h.run('action.js').data).length,0);
});
test('editable system prompt expands DeepSeek Translate placeholders and keeps output contract',()=>{
  const h=host({system_prompt:'Biên tập {source_language} -> {target_language}\n{style_prompt}\n{source_prompt}\n{custom_instruction}\n{memory_prompt}',
    'instructions_book-1':'Giữ xưng hô ta/ngươi', 'glossary_book-1':'Trúc Cơ: giữ nguyên'});
  h.run('translate.js','Văn bản.','','vi','chapterContent');
  const prompt=h.calls[0].body.messages[0].content;
  assert.match(prompt,/Giữ xưng hô ta\/ngươi/);assert.match(prompt,/Trúc Cơ/);
  assert.ok(!/\{(?:source_language|target_language|style_prompt|source_prompt|custom_instruction|memory_prompt)\}/.test(prompt));
  assert.match(prompt,/JSON/);assert.match(prompt,/paragraphs/);
  const cfg=h.run('config.js').data;assert.ok(cfg.system_prompt);assert.equal(cfg.editing_prompts.mode,'database');
});
test('custom genre prompts appear in picker and invalidate cache when edited',()=>{
  const h=host();h.rows.set('|editing_prompts|cung-dau','Cổ phong tiết chế, giữ vai vế cung đình.');
  assert.ok(h.run('style.js').data.some(x=>x.id==='cung-dau'));
  h.settings.translate_style='cung-dau';h.run('translate.js','Văn bản.','','vi','chapterContent');
  assert.match(h.calls[0].body.messages[0].content,/vai vế cung đình/);
  h.rows.set('|editing_prompts|cung-dau','Câu ngắn gọn, không suy đoán vai vế.');
  h.run('translate.js','Văn bản.','','vi','chapterContent');assert.equal(h.calls.length,2);
  h.settings.system_prompt='Chỉ sửa cú pháp {custom_instruction}';h.run('translate.js','Văn bản.','','vi','chapterContent');assert.equal(h.calls.length,3);
});
test('language declaration passes the host base-language gate for a Vietnamese convert book',()=>{
  const h=host();const languages=h.run('language.js').data;
  const target=languages.find(l=>l.type==='to');
  const primary=id=>String(id).replace(/_/g,'-').split('-')[0].toLowerCase();
  // vBook 1.2.9 i4j.g() compares Locale.getLanguage(), not the full extension ID.
  assert.equal(primary('vi-convert'),'vi');
  assert.notEqual(primary(target.id),'vi','target must differ at the base-language level or the host never calls translate.js');
  assert.ok(languages.some(l=>l.type==='from' && primary(l.id)==='vi'));
  assert.match(target.name,/Việt/);
  const result=h.run('translate.js','Hắn đối nàng nói.','vi',target.id,'chapterContent');
  assert.equal(result.code,0);assert.equal(h.calls.length,1);
  assert.match(h.calls[0].body.messages[0].content,/tiếng Việt tự nhiên/);
});
test('language diagnostic explains cached batch results versus live display without calling API',()=>{
  const h=host({translate_from_language:'vi',translate_to_language:'vi'});
  let r=h.run('check-language.js');assert.equal(r.code,1);assert.match(r.data,/Tiếng Việt – biên tập/);
  h.settings.translate_to_language='qaa';r=h.run('check-language.js');assert.equal(r.code,0);assert.match(r.data,/tải lại chương/);assert.equal(h.calls.length,0);
});
