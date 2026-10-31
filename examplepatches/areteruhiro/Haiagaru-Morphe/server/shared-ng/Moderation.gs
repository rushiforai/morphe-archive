/** Same NFKC, whitespace-free code-point count as the Android submission policy. */
function ngShareableKeyword_(raw){
 const value=ngText_(raw).replace(/\s/g,'');
 return Array.from(value).length>=5&&!Array.from(value).every(c=>/\p{Letter}/u.test(c)&&/\p{Script=Latin}/u.test(c));
}
/** Data-only moderation policy, configurable per board from Script Properties. */
function ngPolicy_(condition, votes, config) {
  config=config||{};
  const dictionary=config.words||[
    {term:'殺すぞ',level:1,match:'contains'},
    {term:'死ね',level:2,match:'contains'},
    {term:'氏ね',level:3,match:'contains'},
    {term:'くたばれ',level:3,match:'contains'},
    {term:'ガイジ',level:4,match:'contains'}
  ];
  const c=condition, external=!c.board.startsWith('5ch/')&&!c.board.startsWith('bbs.eddibb.cc/');
  if(!c.value||c.value.length>2000)return {state:'rejected',reason:'invalid_value',minLevel:5,minVotes:0};
  if(c.kind==='keyword'&&!ngShareableKeyword_(c.value))return {state:'rejected',reason:'ineligible_keyword',minLevel:5,minVotes:0};
  if((c.flags&4)!==0)return {state:'pending',reason:'disabled_personal_condition',minLevel:5,minVotes:0};
  if(c.board==='unknown.invalid/unresolved')return {state:'pending',reason:'unresolved_board',minLevel:5,minVotes:0};
  if(c.regex||(c.flags&0x20)!==0)return {state:'pending',reason:'regular_expression_review',minLevel:5,minVotes:0};
  if((c.flags&0x70)!==0&&(c.flags&0x70)!==0x10)return {state:'pending',reason:'unsupported_native_match_mode',minLevel:5,minVotes:0};
  if(c.kind==='reporter'&&(c.board!=='edge/all'||! /^[A-Za-z0-9+/!_.-]{1,100}$/.test(c.value)))return {state:'pending',reason:'missing_board_scope',minLevel:5,minVotes:0};
  if(['id','wacchoi','prefix','suffix','reporter'].includes(c.kind)){
    const minimum=1; // Required report count is selected by each Android client.
    return {state:votes>=minimum?'approved':'pending',reason:votes>=minimum?'independent_reports':'insufficient_reports',minLevel:['prefix','suffix'].includes(c.kind)?4:3,minVotes:minimum};
  }
  if(c.kind==='name'||c.kind==='trip')return {state:'pending',reason:'poster_name_review',minLevel:5,minVotes:0};
  if(c.kind!=='keyword')return {state:'pending',reason:'unsupported_kind',minLevel:5,minVotes:0};
  const value=ngText_(c.value),excluded=(config.exceptions||[]).some(v=>typeof v==='string'&&ngText_(v)!==''&&value.includes(ngText_(v)));
  if(excluded)return {state:'pending',reason:'dictionary_exception',minLevel:5,minVotes:0};
  let hit=null;
  for(const word of dictionary){
    if(typeof word.term!=='string'||!Number.isInteger(word.level)||word.level<1||word.level>5)continue;
    const term=ngText_(word.term);if(!term)continue;
    if((word.match==='exact'?value===term:value.includes(term))&&(!hit||word.level<hit.level))hit=word;
  }
  if(!hit)return {state:'pending',reason:'no_dictionary_match',minLevel:5,minVotes:0};
  const minimum=1; // Legacy server vote thresholds no longer override app settings.
  return {state:votes>=minimum?'approved':'pending',reason:votes>=minimum?'dictionary_and_reports':'dictionary_waiting_reports',minLevel:hit.level,minVotes:minimum};
}
if(typeof module!=='undefined')module.exports={ngPolicy_};
