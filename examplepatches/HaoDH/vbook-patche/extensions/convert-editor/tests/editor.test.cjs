const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const root=path.join(__dirname,'..','src');
function host(settings={}) {
  const state={settings:{api_key:'test-key',...settings},rows:new Map(),calls:[],logs:[],book:'book-1',status:200,finish:'stop',bad:false,terms:[],
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
      return {ok:status===200,status:status,text:()=>status!==200?'{}':JSON.stringify({choices:[{finish_reason:finish,message:{content:content}}]})};
    }});
  // vBook 1.2.9 inlines only the entry script's imports; it has no runtime load().
  state.run=(name,...args)=>{
    const entry=fs.readFileSync(path.join(root,name),'utf8');
    const compiled=entry.replace(/load\(['"](.*?\.js)['"]\);?/g,(_,file)=>fs.readFileSync(path.join(root,file),'utf8'));
    vm.runInContext(compiled,context,{filename:name});
    return context.execute(...args);
  };
  return state;
}

test('whole chapter is sent once; AI can join broken sentences and freely reflow paragraphs',()=>{
  const h=host();const source='tu vi\ntừ nguyên anh trung kỳ\nHắn bước ra.\nHắn nói: “Đi thôi.”';
  const edited='Tu vi từ Nguyên Anh trung kỳ.\n\nHắn bước ra và nói:\n“Đi thôi.”';
  h.respond=()=>edited;
  assert.equal(h.run('translate.js',source,'vi','qaa','chapterContent').data,edited);
  assert.equal(h.calls.length,1);assert.equal(h.calls[0].body.messages[1].content,source);
  assert.ok(!h.calls[0].body.messages[0].content.includes('giữ đủ và đúng từng id'));
  assert.match(h.calls[0].body.messages[0].content,/tự nối.*tách đoạn/i);
});

test('153-line long chapter is never split, including when old batch preference is one',()=>{
  const h=host({paragraph_batch_size:'1'});
  const text=Array.from({length:153},(_,i)=>'Đoạn '+i+': '+('nội dung '.repeat(25))).join('\n').trim();
  assert.ok(text.length>12000);h.respond=input=>input;
  assert.equal(h.run('translate.js',text,'vi','qaa','chapterContent').data,text.replace(/ +\n/g,'\n'));
  assert.equal(h.calls.length,1);
  const manifest=JSON.parse(fs.readFileSync(path.join(root,'..','plugin.json'),'utf8'));
  assert.equal(manifest.config.max_length,0);assert.equal(manifest.config.max_line,0);
  assert.equal(h.calls[0].body.thinking.type,'disabled');
});

test('complete result is cached as a whole and original line boundaries are not guessed locally',()=>{
  const h=host();h.respond=input=>input;
  const text='tu vi\ntừ nguyên anh trung kỳ\n\n“Ta đi đây.”';
  h.run('translate.js',text,'vi','qaa','chapterContent');
  assert.equal(h.calls[0].body.messages[1].content,text);
  assert.equal(h.run('translate.js',text,'vi','qaa','chapterContent').data,text);
  assert.equal(h.calls.length,1);assert.ok([...h.rows.keys()].some(k=>k.includes('|edited_chapters|')));
});

test('model, prompt and book changes cannot reuse the wrong full chapter',()=>{
  const h=host();const run=()=>h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  run();h.settings.instructions='Giữ ta/ngươi';run();h.settings.translate_model='deepseek-v4-pro';run();h.book='book-2';run();
  assert.equal(h.calls.length,4);
});

test('corrupt cache and exact-input collisions do not display another chapter',()=>{
  const h=host();h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  const key=[...h.rows.keys()][0];const row=JSON.parse(h.rows.get(key));row.source='Sai chương';h.rows.set(key,JSON.stringify(row));
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');assert.equal(h.calls.length,2);
  h.rows.set(key,'broken');h.run('translate.js','Nội dung.','vi','qaa','chapterContent');assert.equal(h.calls.length,3);
});

test('missing API key fails before a paid request and never logs the saved key',()=>{
  const h=host({api_key:''});assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);assert.equal(h.calls.length,0);
  for(const status of [400,401,402,403,429,500]) {
    const a=host();a.status=status;const result=a.run('translate.js','Nội dung.','vi','qaa','chapterContent');
    assert.equal(result.code,1);assert.equal(a.calls.length,1);assert.equal(a.rows.size,0);
    assert.ok(!result.data.includes('test-key'));assert.ok(!a.logs.join('').includes('test-key'));
  }
});

test('malformed, empty, old paragraph envelopes and cut-off results are never cached or retried',()=>{
  for(const payload of [{},{text:''},{text:12},{text:'   '},{paragraphs:['a','b']}]) {
    const h=host();h.payload=()=>payload;
    assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);
    assert.equal(h.calls.length,1);assert.equal(h.rows.size,0);
  }
  for(const mode of ['json','length']) {
    const h=host();if(mode==='json')h.bad=true;else h.finish='length';
    assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);
    assert.equal(h.calls.length,1);assert.equal(h.rows.size,0);
  }
});

test('obvious summary of a long chapter is rejected without using paragraph counts',()=>{
  const h=host();h.respond=()=> 'Tóm tắt ngắn.';
  assert.equal(h.run('translate.js','Nội dung cả chương. '.repeat(100),'vi','qaa','chapterContent').code,1);
  assert.equal(h.rows.size,0);assert.equal(h.calls.length,1);
});

test('nonchapter content passes through and empty chapters never spend tokens',()=>{
  const h=host();assert.equal(h.run('translate.js','Tên truyện.','vi','qaa','detail').data,'Tên truyện.');
  assert.equal(h.run('translate.js','  \n ','vi','qaa','chapterContent').data,'');assert.equal(h.calls.length,0);
});

test('HTML, entities and Unicode are normalized without a 4000-character paragraph split',()=>{
  const h=host();h.respond=input=>input;
  const text='A'.repeat(5000);
  const result=h.run('translate.js','<p>'+text+'</p><script>ignore()</script><p>&#x1F600; &amp; &quot;B&quot;</p>','vi','qaa','chapterContent');
  assert.equal(result.data,text+'\n😀 & "B"');assert.equal(h.calls.length,1);
});

test('custom prompt variables stay usable and whole-chapter format overrides old line constraints',()=>{
  const h=host({system_prompt:'{source_language} → {target_language}\n{style_prompt}\n{source_prompt}\n{custom_instruction}\n{memory_prompt}',
    'instructions_book-1':'Giữ ta/ngươi','glossary_book-1':'Giữ Trúc Cơ'});
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');const prompt=h.calls[0].body.messages[0].content;
  assert.match(prompt,/Giữ ta\/ngươi/);assert.match(prompt,/Giữ Trúc Cơ/);assert.match(prompt,/nguyên chương/);
  assert.ok(!/\{(?:source_language|target_language|style_prompt|source_prompt|custom_instruction|memory_prompt)\}/.test(prompt));
});

test('custom styles still appear and editing a style invalidates the chapter cache',()=>{
  const h=host({translate_style:'cung-dau'});h.rows.set('|editing_prompts|cung-dau','Cổ phong tiết chế');
  assert.ok(h.run('style.js').data.some(x=>x.id==='cung-dau'));
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');h.rows.set('|editing_prompts|cung-dau','Giữ vai vế');
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');assert.equal(h.calls.length,2);
});

test('names are learned from the same chapter call and only relevant memory is sent later',()=>{
  const h=host();h.terms=[['character','Lâm Phàm'],['place','Thanh Vân Sơn']];
  h.run('translate.js','Lâm Phàm đến Thanh Vân Sơn.','vi','qaa','chapterContent');
  assert.equal(h.rows.get('book-1|ce_characters|Lâm Phàm'),'Lâm Phàm');assert.equal(h.calls.length,1);
  h.terms=[];h.run('translate.js','Lâm Phàm quay lại.','vi','qaa','chapterContent');
  assert.match(h.calls[1].body.messages[0].content,/Lâm Phàm/);assert.ok(!h.calls[1].body.messages[0].content.includes('Thanh Vân Sơn'));
  h.book='book-2';h.run('translate.js','Lâm Phàm quay lại.','vi','qaa','chapterContent');
  assert.ok(!h.calls[2].body.messages[0].content.includes('Lâm Phàm'));
});

test('auto learning never overwrites manual names or invalidates paid chapter results',()=>{
  const h=host();h.rows.set('book-1|ce_characters|Lâm Phàm','Tên chuẩn');h.terms=[['character','Lâm Phàm']];
  const run=()=>h.run('translate.js','Lâm Phàm đến.','vi','qaa','chapterContent');
  run();assert.equal(h.rows.get('book-1|ce_characters|Lâm Phàm'),'Tên chuẩn');run();assert.equal(h.calls.length,1);
  h.settings.memory_revision='2';run();assert.equal(h.calls.length,2);
});

test('memory switches, literal-name validation and per-table cap remain enforced',()=>{
  for(const setting of ['auto_memory','use_memory']) {
    const h=host({[setting]:'false'});h.terms=[['character','Lâm Phàm']];
    h.run('translate.js','Lâm Phàm đến.','vi','qaa','chapterContent');assert.ok(!h.rows.has('book-1|ce_characters|Lâm Phàm'));
  }
  const h=host();h.terms=[['character','Không Có'],['character','Hắn'],['url','Lâm Phàm'],['place','A'.repeat(100)]];
  h.run('translate.js','Lâm Phàm đến.','vi','qaa','chapterContent');assert.equal([...h.rows.keys()].filter(k=>k.includes('|ce_')).length,0);
  for(let i=0;i<200;i++)h.rows.set('book-1|ce_characters|Nhân Vật '+i,'Nhân Vật '+i);
  h.terms=[['character','Lâm Phàm']];h.run('translate.js','Lâm Phàm về.','vi','qaa','chapterContent');assert.ok(!h.rows.has('book-1|ce_characters|Lâm Phàm'));
});

test('A–B uses inclusive TOC order and shares the exact full chapter with live reader',()=>{
  const h=host({chapter_from:'2',chapter_to:'3'});h.chapters[2]='<p>tu vi</p><p>từ nguyên anh trung kỳ</p>';
  assert.equal(h.run('batch.js').code,0);assert.equal(h.calls.length,2);
  assert.equal(h.calls[0].body.messages[1].content,'tu vi\ntừ nguyên anh trung kỳ');
  assert.equal(h.run('translate.js',h.chapters[2],'vi','qaa','chapterContent').code,0);assert.equal(h.calls.length,2);
});

test('A–B validates scope/ranges before API calls and reports chapters unavailable locally',()=>{
  for(const settings of [{chapter_from:'3',chapter_to:'2'},{chapter_from:'0',chapter_to:'1'},{chapter_from:'1x',chapter_to:'2'},{chapter_from:'1',chapter_to:'4'}]) {
    const h=host(settings);assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,0);
  }
  const noBook=host();noBook.book='';assert.equal(noBook.run('batch.js').code,1);assert.equal(noBook.calls.length,0);
  const h=host({chapter_from:'1',chapter_to:'3'});delete h.chapters[2];assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,2);
});

test('A–B resumes from successful chapters after a later API billing failure',()=>{
  const h=host({chapter_from:'1',chapter_to:'2'});h.respond=input=>{if(input.includes('Đoạn hai'))h.status=402;return input;};
  assert.equal(h.run('batch.js').code,1);assert.equal(h.calls.length,2);
  h.status=200;h.respond=input=>input;assert.equal(h.run('batch.js').code,0);assert.equal(h.calls.length,3);
});

test('native single-pass settings keep API input visible without obsolete paragraph controls',()=>{
  const h=host({api_key:''});
  for(const book of ['', 'book-1']) {
    h.book=book;const cfg=h.run('config.js');assert.equal(cfg.code,0);assert.equal(cfg.data.api_key.mode,'input');
    assert.equal(cfg.data.paragraph_batch_size,undefined);assert.ok(cfg.data.system_prompt);
  }
  assert.equal(h.calls.length,0);
});

test('Vietnamese editing target still passes the native base-language gate',()=>{
  const h=host();const languages=h.run('language.js').data;
  assert.equal(languages.find(x=>x.type==='from').id,'vi');assert.equal(languages.find(x=>x.type==='to').id,'qaa');
  const a=h.run('check-language.js');assert.equal(a.code,1);
  h.settings.translate_to_language='qaa';assert.equal(h.run('check-language.js').code,0);assert.equal(h.calls.length,0);
});

test('action previews the selected chapter range without spending API calls',()=>{
  const h=host({chapter_from:'2',chapter_to:'3'});h.toc[2].title={raw:'Chương hai'};h.toc[3].title={raw:'Chương ba'};
  const result=h.run('action.js');assert.match(result.data.edit_range.description,/Chương hai/);assert.match(result.data.edit_range.description,/Chương ba/);
  assert.equal(h.calls.length,0);
});

test('model picker exposes DeepSeek plus the free providers',()=>{
  const ids=host().run('model.js').data.map(m=>m.id);
  for(const id of ['deepseek-flash','deepseek-v4-pro','gemini-flash-lite','openrouter-free','groq-free','custom'])
    assert.ok(ids.includes(id),id);
});

test('a free provider routes to its own endpoint without DeepSeek-only fields',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls.length,1);assert.match(h.calls[0].url,/generativelanguage\.googleapis\.com/);
  assert.equal(h.calls[0].options.headers.Authorization,'Bearer g-key');
  assert.equal(h.calls[0].body.model,'gemini-flash-lite-latest');assert.equal(h.calls[0].body.thinking,undefined);
});

test('a free provider over quota falls back once to paid DeepSeek Flash',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.statusFor=url=>url.includes('deepseek')?200:429;
  assert.equal(h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls.length,2);assert.match(h.calls[0].url,/googleapis/);assert.match(h.calls[1].url,/api\.deepseek\.com/);
  assert.equal(h.calls[1].body.model,'deepseek-flash');assert.equal(h.calls[1].body.thinking.type,'disabled');
  assert.ok([...h.rows.keys()].some(k=>k.includes('|edited_chapters|')));
});

test('fallback is skipped when turned off or when no DeepSeek key is set',()=>{
  const off=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key',fallback_deepseek:'false'});off.status=429;
  assert.equal(off.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);assert.equal(off.calls.length,1);
  const noKey=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key',api_key:''});noKey.status=429;
  assert.equal(noKey.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);assert.equal(noKey.calls.length,1);
});

test('a wrong/missing free-provider key (401/403) surfaces instead of silently billing DeepSeek',()=>{
  for(const status of [401,403]) {
    const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'bad-key'});
    h.statusFor=url=>url.includes('deepseek')?200:status;
    const result=h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent');
    assert.equal(result.code,1,status);              // surfaced as an error
    assert.equal(h.calls.length,1,status);           // only the free provider, no DeepSeek call
    assert.match(h.calls[0].url,/googleapis/);
    assert.ok(h.calls.every(c=>!/api\.deepseek\.com/.test(c.url)),status);
    assert.equal(h.rows.size,0,status);
  }
});

test('the default/priority model is a settable config field',()=>{
  const cfg=host().run('config.js').data;
  assert.equal(cfg.translate_model.mode,'input');
  assert.match(cfg.translate_model.subtitle,/gemini-flash-lite/);
});

test('with no model set, the reader uses the configured default instead of hardcoded DeepSeek',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');  // vBook passes no model arg
  assert.match(h.calls[0].url,/generativelanguage\.googleapis\.com/);
});

test('custom provider normalizes the base URL and requires an explicit model id',()=>{
  const h=host({translate_model:'custom',custom_api_key:'c-key',custom_base_url:'https://host/v1',custom_model:'glm-4.6-flash',api_key:''});
  h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls[0].url,'https://host/v1/chat/completions');assert.equal(h.calls[0].body.model,'glm-4.6-flash');
  const noModel=host({translate_model:'custom',custom_api_key:'c-key',custom_base_url:'https://host/v1',api_key:''});
  assert.equal(noModel.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);assert.equal(noModel.calls.length,0);
});

test('free and DeepSeek results cache separately so switching provider does not reuse the other',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.run('translate.js','Cùng một chương.','vi','qaa','chapterContent');assert.equal(h.calls.length,1);
  h.settings.translate_model='deepseek-flash';h.run('translate.js','Cùng một chương.','vi','qaa','chapterContent');
  assert.equal(h.calls.length,2);assert.match(h.calls[1].url,/api\.deepseek\.com/);
});

test('a transient 503 retries the SAME free provider before touching DeepSeek',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.statusFor=(url,n)=>n===1?503:200;   // busy once, then OK
  assert.equal(h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls.length,2);assert.ok(h.calls.every(c=>/googleapis/.test(c.url)));
});

test('a persistent 503 falls back to DeepSeek only after retrying the free provider',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.statusFor=url=>url.includes('deepseek')?200:503;
  assert.equal(h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls.length,4);   // 3 Gemini attempts + 1 DeepSeek
  assert.ok(h.calls.slice(0,3).every(c=>/googleapis/.test(c.url)));assert.match(h.calls[3].url,/api\.deepseek\.com/);
});

test('a quota 429 does not waste free-provider retries, falls straight to DeepSeek',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.statusFor=url=>url.includes('deepseek')?200:429;
  assert.equal(h.run('translate.js','Nội dung chương.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls.length,2);assert.match(h.calls[0].url,/googleapis/);assert.match(h.calls[1].url,/api\.deepseek\.com/);
});

test('Cloudflare Workers AI builds a per-account endpoint and uses its default model',()=>{
  const h=host({translate_model:'cloudflare-free',cloudflare_api_key:'cf-key',cloudflare_account_id:'acc123'});h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,0);
  assert.equal(h.calls[0].url,'https://api.cloudflare.com/client/v4/accounts/acc123/ai/v1/chat/completions');
  assert.equal(h.calls[0].options.headers.Authorization,'Bearer cf-key');
  assert.equal(h.calls[0].body.model,'@cf/meta/llama-3.3-70b-instruct-fp8-fast');
  const noAcc=host({translate_model:'cloudflare-free',cloudflare_api_key:'cf-key',api_key:''});
  assert.equal(noAcc.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);assert.equal(noAcc.calls.length,0);
});

test('custom JSON mode off omits response_format and accepts a plain-text reply',()=>{
  const h=host({translate_model:'custom',custom_api_key:'c',custom_base_url:'http://127.0.0.1:8080',custom_model:'local',custom_json_mode:'false',api_key:''});
  h.rawContent='Đoạn văn đã biên tập.';   // raw text, not a JSON envelope
  assert.equal(h.run('translate.js','Nội dung gốc.','vi','qaa','chapterContent').data,'Đoạn văn đã biên tập.');
  assert.equal(h.calls[0].body.response_format,undefined);assert.equal(h.calls[0].url,'http://127.0.0.1:8080/chat/completions');
});

test('custom JSON mode on still requires a valid JSON envelope',()=>{
  const h=host({translate_model:'custom',custom_api_key:'c',custom_base_url:'http://127.0.0.1:8080',custom_model:'local',api_key:''});
  h.rawContent='văn bản thuần, không JSON';
  assert.equal(h.run('translate.js','Nội dung gốc.','vi','qaa','chapterContent').code,1);
  assert.deepEqual(h.calls[0].body.response_format,{type:'json_object'});
});

test('genre style presets are offered in the style picker',()=>{
  const ids=host().run('style.js').data.map(s=>s.id);
  for(const id of ['natural','wuxia','modern','ngontinh','cungdau','huyenhuyen','khoahuyen','trinhtham'])
    assert.ok(ids.includes(id),id);
});

test('shared glossary applies to every book while per-book glossary stays story-specific',()=>{
  const h=host({shared_glossary:'Giữ ta/ngươi',['glossary_book-1']:'Giữ Trúc Cơ'});
  h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  const prompt=h.calls[0].body.messages[0].content;
  assert.match(prompt,/DÙNG CHUNG/);assert.match(prompt,/Giữ ta\/ngươi/);
  assert.match(prompt,/RIÊNG CHO TRUYỆN/);assert.match(prompt,/Giữ Trúc Cơ/);
  h.book='book-2';h.run('translate.js','Nội dung.','vi','qaa','chapterContent');
  const prompt2=h.calls[1].body.messages[0].content;
  assert.match(prompt2,/Giữ ta\/ngươi/);assert.ok(!prompt2.includes('Giữ Trúc Cơ'));
});

test('a chapter that overruns the output budget is split in half on the same source, not sent to DeepSeek',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});
  const text='Đoạn một dài hơn.\n\nĐoạn hai dài hơn.';
  h.finishFor=input=>input.length>text.length*0.7?'length':'stop';  // full chapter truncates; a half completes
  h.respond=input=>input;
  const result=h.run('translate.js',text,'vi','qaa','chapterContent');
  assert.equal(result.code,0);assert.equal(result.data,text);
  assert.equal(h.calls.length,3);   // 1 full (cut off) + 2 halves
  assert.ok(h.calls.every(c=>/googleapis/.test(c.url)));
});

test('auto-split off lets a truncated chapter fall back to DeepSeek instead of splitting',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key',auto_split:'false'});h.respond=input=>input;
  h.finishFor=(input,n)=>n===1?'length':'stop';
  const result=h.run('translate.js','Đoạn một.\n\nĐoạn hai.','vi','qaa','chapterContent');
  assert.equal(result.code,0);assert.equal(h.calls.length,2);
  assert.match(h.calls[0].url,/googleapis/);assert.match(h.calls[1].url,/api\.deepseek\.com/);
});

test('a truncated chapter with no interior break cannot be split and falls back',()=>{
  const h=host({translate_model:'gemini-flash-lite',gemini_api_key:'g-key'});h.respond=input=>input;
  h.finishFor=(input,n)=>n===1?'length':'stop';
  const result=h.run('translate.js','Một dòng không thể chia.','vi','qaa','chapterContent');
  assert.equal(result.code,0);assert.equal(h.calls.length,2);
  assert.match(h.calls[1].url,/api\.deepseek\.com/);
});

test('memory export shares learned names and import adds them to another story without overwriting',()=>{
  const h=host();
  h.rows.set('book-1|ce_characters|Lâm Phàm','Lâm Phàm');
  h.rows.set('book-1|ce_places|Thanh Vân Sơn','Thanh Vân Sơn');
  assert.equal(h.run('export-memory.js').code,0);
  assert.equal(h.rows.get('|ce_shared_memory|character|Lâm Phàm'),'Lâm Phàm');
  assert.equal(h.rows.get('|ce_shared_memory|place|Thanh Vân Sơn'),'Thanh Vân Sơn');
  h.book='book-2';h.rows.set('book-2|ce_characters|Lâm Phàm','Tên đã có');
  assert.equal(h.run('import-memory.js').code,0);
  assert.equal(h.rows.get('book-2|ce_characters|Lâm Phàm'),'Tên đã có');       // existing not overwritten
  assert.equal(h.rows.get('book-2|ce_places|Thanh Vân Sơn'),'Thanh Vân Sơn');  // new one added
});

test('export with no learned memory and import from an empty clipboard both report cleanly',()=>{
  const empty=host();assert.equal(empty.run('export-memory.js').code,1);
  const noClip=host();assert.equal(noClip.run('import-memory.js').code,1);
  const noBook=host();noBook.book='';assert.equal(noBook.run('export-memory.js').code,1);assert.equal(noBook.run('import-memory.js').code,1);
});

test('shared-memory clipboard and genre/split settings appear in config',()=>{
  const cfg=host().run('config.js');
  assert.equal(cfg.data.shared_glossary.mode,'input');
  assert.equal(cfg.data.auto_split.mode,'toggle');
  assert.equal(cfg.data.ce_shared_memory.mode,'database');
});

test('action offers memory export/import without spending API calls',()=>{
  const h=host({chapter_from:'2',chapter_to:'3'});const result=h.run('action.js');
  assert.ok(result.data.export_memory);assert.ok(result.data.import_memory);
  assert.equal(result.data.export_memory.script,'export-memory.js');
  assert.equal(h.calls.length,0);
});

test('PC local (LAN) routes to the LAN endpoint, needs no key, defaults JSON mode off with a longer timeout',()=>{
  const h=host({translate_model:'lan-local',lan_base_url:'http://192.168.1.10:8080',lan_model:'qwen',api_key:''});
  h.rawContent='Đoạn đã biên tập.';   // plain text, no JSON envelope
  const result=h.run('translate.js','Nội dung gốc.','vi','qaa','chapterContent');
  assert.equal(result.data,'Đoạn đã biên tập.');
  assert.equal(h.calls[0].url,'http://192.168.1.10:8080/chat/completions');
  assert.equal(h.calls[0].body.response_format,undefined);
  assert.equal(h.calls[0].options.headers.Authorization,'Bearer local');   // placeholder key, none entered
  assert.equal(h.calls[0].options.timeout,600000);
});

test('request_timeout overrides the per-request timeout and LAN JSON mode can be turned on',()=>{
  const h=host({translate_model:'lan-local',lan_base_url:'http://127.0.0.1:8080',lan_model:'q',lan_json_mode:'true',request_timeout:'900',api_key:''});
  h.respond=input=>input;
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,0);
  assert.deepEqual(h.calls[0].body.response_format,{type:'json_object'});
  assert.equal(h.calls[0].options.timeout,900000);
});

test('PC local (LAN) without an endpoint fails before any call and does not fall back without a DeepSeek key',()=>{
  const h=host({translate_model:'lan-local',lan_model:'q',api_key:''});
  assert.equal(h.run('translate.js','Nội dung.','vi','qaa','chapterContent').code,1);
  assert.equal(h.calls.length,0);
});

test('LAN preset, timeout field appear in config and the model picker',()=>{
  const cfg=host().run('config.js');
  assert.equal(cfg.data.lan_base_url.mode,'input');
  assert.equal(cfg.data.lan_json_mode.mode,'toggle');
  assert.equal(cfg.data.request_timeout.format,'number');
  assert.ok(host().run('model.js').data.map(m=>m.id).includes('lan-local'));
});

test('A–B batch follows the reader\'s last-used model instead of defaulting to DeepSeek',()=>{
  const h=host({chapter_from:'1',chapter_to:'1',lan_base_url:'http://192.168.1.10:8080',lan_model:'q'});
  h.rawContent='Đã biên tập.';
  h.run('translate.js','Mở một chương trên trình đọc.','vi','qaa','chapterContent','lan-local');  // reader on LAN records it
  assert.equal(h.run('batch.js').code,0);
  assert.match(h.calls[h.calls.length-1].url,/192\.168\.1\.10:8080/);  // A–B used LAN, not DeepSeek
});

test('A–B batch override forces a model without opening the reader',()=>{
  const h=host({chapter_from:'1',chapter_to:'1',batch_model:'lan-local',lan_base_url:'http://127.0.0.1:8080',lan_model:'q'});
  h.rawContent='Đã biên tập.';
  assert.equal(h.run('batch.js').code,0);
  assert.match(h.calls[0].url,/127\.0\.0\.1:8080/);
});

test('A–B batch still defaults to DeepSeek when nothing else is selected',()=>{
  const h=host({chapter_from:'1',chapter_to:'1'});h.respond=input=>input;
  assert.equal(h.run('batch.js').code,0);
  assert.match(h.calls[0].url,/api\.deepseek\.com/);
});
