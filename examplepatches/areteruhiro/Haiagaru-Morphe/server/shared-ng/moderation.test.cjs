const assert=require('node:assert/strict'),fs=require('node:fs'),vm=require('node:vm');
const ctx=vm.createContext({module:{exports:{}},ngText_:s=>s.normalize('NFKC').replace(/\s+/g,' ').trim()});vm.runInContext(fs.readFileSync(__dirname+'/Moderation.gs','utf8'),ctx);const policy=ctx.module.exports.ngPolicy_;let checks=0;
function check(value){assert.ok(value);checks++;}
const c={board:'5ch/all',kind:'keyword',value:'辞書にない文字列',period:'',flags:16};
for(const kind of ['id','wacchoi','prefix','suffix','keyword','name','trip','reporter']){
 const x={...c,kind,board:kind==='reporter'?'edge/all':'5ch/all',value:kind==='reporter'?'Reporter01':c.value};
 check(policy(x,1).state==='approved');check(policy(x,0).reason==='insufficient_reports');check(policy(x,1).minVotes===1);
}
for(const board of ['5ch/all','edge/all','pink/all','bbs.punipuni.eu/all','jbbs.shitaraba.net/all','*'])check(policy({...c,board},1).state==='approved');
check(policy({...c,regex:true,flags:32,value:'日本語.*対象'},1).state==='approved');
for(const value of ['(?i)日本語.*対象','\\Q日本語の文字列\\E','(?s:日本語.*対象)','日本語の不正['])check(policy({...c,regex:true,flags:32,value},1).state==='approved');
check(policy({...c,flags:64},1).reason==='unsupported_native_match_mode');
check(policy({...c,flags:4},1).reason==='disabled_personal_condition');
check(policy({...c,board:'unknown.invalid/unresolved'},1).reason==='unresolved_board');
check(policy({...c,value:''},1).state==='rejected');
check(policy(c,1,{words:[],exceptions:[c.value],wordVotes:999}).state==='approved');
for(const value of ['あ','a','abcd','abcde','ＡＢＣＤＥ','a b c d e','éÉabc','あいうえ','日 本 語'])check(policy({...c,value},99).reason==='ineligible_keyword');
for(const value of ['あいうえお','日本語の単語','abc12','𠮷𠮷𠮷𠮷𠮷'])check(policy({...c,value},1).state==='approved');
console.log('PASS '+checks+' basic-rule/regex/keyword moderation checks');
