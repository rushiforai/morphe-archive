const assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
const ctx=vm.createContext({module:{exports:{}},ngText_:s=>s.normalize('NFKC').replace(/\s+/g,' ').trim()});vm.runInContext(fs.readFileSync(__dirname+'/Moderation.gs','utf8'),ctx);const policy=ctx.module.exports.ngPolicy_;let checks=0;
const c={board:'5ch/poverty',kind:'keyword',value:'今すぐ死ね',period:''};
function check(v){assert.ok(v);checks++;}
check(policy(c,3).state==='approved');check(policy(c,0).state==='pending');check(policy(c,3).minLevel===2);
check(policy({...c,value:'普通の外字'},30).state==='pending');check(policy({...c,value:'そのガイジ'},3).minLevel===4);
check(policy({...c,regex:true},99).state==='pending');check(policy(c,9,{exceptions:['死ね']}).state==='pending');
for(const board of ['bbs.eddibb.cc/liveedge','bbs.punipuni.eu/livepunipuni','jbbs.shitaraba.net/game/123'])check(policy({...c,board},3).state==='approved');
for(const kind of ['id','wacchoi','prefix','suffix']){let x={board:'5ch/android',kind,value:kind==='id'?'abc123':'aBcD',period:'2026-10-22'};check(policy(x,1).state==='approved'&&policy(x,1).minVotes===1);check(policy(x,10).state==='approved');check(policy({...x,period:''},1).state==='approved');check(policy({...x,board:'other.example/board'},1).state==='approved');}
check(policy({...c,kind:'name'},100).state==='pending');check(policy({...c,value:''},3).state==='rejected');
check(policy(c,1,{words:[{term:'今すぐ死ね',level:5,match:'exact'}],wordVotes:1}).minLevel===5);
console.log('PASS '+checks+' moderation checks');

// More moderation cases: restrictions and external identities.
check(policy({...c,board:'unknown.invalid/unresolved',sourceScope:'android'},99).state==='pending');
check(policy({...c,flags:4},99).state==='pending');
check(policy({board:'bbs.eddibb.cc/liveedge',kind:'id',value:'abc',period:'2026-10-28'},5).state==='approved');
check(policy({board:'bbs.eddibb.cc/liveedge',kind:'suffix',value:'Ab12',period:''},1).state==='approved');
console.log('PASS external lifetime and disabled-scope checks');

for(const kind of ['id','wacchoi','prefix','suffix'])check(policy({board:'*',kind,value:kind==='wacchoi'?'Ab12-Cd34':'Ab12',period:''},99).state==='approved');
console.log('PASS '+checks+' total moderation checks');

check(policy({...c,flags:32,regex:false},99).state==='pending');
check(policy({...c,flags:64},99).state==='pending');
check(policy({...c,flags:16},3).state==='approved');
console.log('PASS '+checks+' moderation match-mode checks');

check(policy({...c,value:'ＡＢＣ日本' },3,{words:[{term:'ＡＢＣ日本',level:2,match:'exact'}]}).state==='approved');
check(policy({...c,value:'ＡＢＣ日本' },3,{words:[{term:'abc',level:2}],exceptions:['ＡＢＣ日本']}).reason==='dictionary_exception');
check(policy(c,99,{words:[{term:'',level:1}]}).state==='pending');
console.log('PASS '+checks+' final moderation checks');

for(const kind of ["id","wacchoi","prefix","suffix"])check(policy({board:"5ch/android",kind,value:"Ab12",period:"2026-10-22"},1,{identityVotes:{[kind]:999}}).minVotes===1);
check(policy(c,1,{wordVotes:999}).state==="approved");
console.log("PASS "+checks+" app-controlled threshold checks");

for(const value of ['あ','a','abcd','abcde','ＡＢＣＤＥ','a b c d e','éÉabc','あいうえ','日 本 語'])check(policy({...c,value},99).reason==='ineligible_keyword');
for(const value of ['あいうえお','日本語の単語','abc12','𠮷𠮷𠮷𠮷𠮷'])check(policy({...c,value},99).reason!=='ineligible_keyword');
console.log('PASS '+checks+' total moderation and keyword eligibility checks');
