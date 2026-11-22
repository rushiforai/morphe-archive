/** Same NFKC, whitespace-free code-point count as the Android submission policy. */
function ngShareableKeyword_(raw){
 const value=ngText_(raw).replace(/\s/g,'');
 return Array.from(value).length>=5&&!Array.from(value).every(c=>/\p{Letter}/u.test(c)&&/\p{Script=Latin}/u.test(c));
}
/** Data-only moderation policy, configurable per board from Script Properties. */
function ngMatchModeSupported_(c){return [0,16,32].includes(c.flags&0x70);}
/** Java Pattern syntax is validated by Android, never by GAS's different RegExp engine.
 * Keep expressions as bounded data; receivers skip an invalid Pattern individually. */
function ngRegexValid_(c){
 if(typeof c.value!=='string'||!c.value.length||c.value.length>2000)return false;
 if(!c.regex&&(Number(c.flags)&32)===0)return true;
 const ranges=/\\(?:x\{([0-9a-f]{1,6})\}|u([0-9a-f]{4}))\s*-\s*\\(?:x\{([0-9a-f]{1,6})\}|u([0-9a-f]{4}))/gi;
 for(const match of c.value.matchAll(ranges)){
  const a=parseInt(match[1]||match[2],16),b=parseInt(match[3]||match[4],16);
  const low=Math.min(a,b),high=Math.max(a,b);
  if((low<=0xf8ff&&high>=0xe000)||(low<=0xffffd&&high>=0xf0000)||(low<=0x10fffd&&high>=0x100000))return false;
 }
 return true;
}
function ngPolicy_(c,votes,config){
 if(!c.value||c.value.length>2000)return {state:'rejected',reason:'invalid_value',minLevel:5,minVotes:0};
 if(c.kind==='keyword'&&!ngShareableKeyword_(c.value))return {state:'rejected',reason:'ineligible_keyword',minLevel:5,minVotes:0};
 if((c.flags&4)!==0)return {state:'pending',reason:'disabled_personal_condition',minLevel:5,minVotes:0};
 if(c.board==='unknown.invalid/unresolved')return {state:'pending',reason:'unresolved_board',minLevel:5,minVotes:0};
 if(!ngMatchModeSupported_(c))return {state:'pending',reason:'unsupported_native_match_mode',minLevel:5,minVotes:0};
 if(!ngRegexValid_(c))return {state:'rejected',reason:'invalid_regular_expression',minLevel:5,minVotes:0};
 if(c.kind==='reporter'&&(c.board!=='edge/all'||! /^[A-Za-z0-9+/!_.-]{1,100}$/.test(c.value)))return {state:'pending',reason:'missing_board_scope',minLevel:5,minVotes:0};
 if(!['id','wacchoi','prefix','suffix','reporter','name','trip','keyword'].includes(c.kind))return {state:'pending',reason:'unsupported_kind',minLevel:5,minVotes:0};
 return {state:votes>=1?'approved':'pending',reason:votes>=1?'basic_rules_passed':'insufficient_reports',minLevel:1,minVotes:1};
}
if(typeof module!=='undefined')module.exports={ngPolicy_};
