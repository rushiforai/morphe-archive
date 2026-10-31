/** Parent bulletin-board scope; individual board names and dates are not public identifiers. */
function ngFamilyBoard_(scope){
 if(scope==='*'||scope==='unknown.invalid/unresolved')return scope;
 let host=String(scope).split('/')[0].toLowerCase();
 if(['5ch','5ch.io','5ch.net'].includes(host)||host.endsWith('.5ch.io')||host.endsWith('.5ch.net')||host.endsWith('.2ch.net'))return '5ch/all';
 if(host==='pink'||host==='bbspink.com'||host.endsWith('.bbspink.com'))return 'pink/all';
 if(['edge','bbs.eddibb.cc','bbs.eddibb.net'].includes(host))return 'edge/all';
 if(host==='jbbs.livedoor.jp')host='jbbs.shitaraba.net';
 for(const domain of ['open2ch.net','2ch.sc','talk.jp'])if(host===domain||host.endsWith('.'+domain))host=domain;
 return host+'/all';
}
function ngFamilyName_(scope){const group=ngFamilyBoard_(scope);return {'5ch/all':'5ch','edge/all':'エッヂ','pink/all':'PINK','jbbs.shitaraba.net/all':'したらば掲示板','open2ch.net/all':'おーぷん2ch','2ch.sc/all':'2ch.sc','talk.jp/all':'Talk','bbs.punipuni.eu/all':'ぷにぷに','*':'すべての掲示板','unknown.invalid/unresolved':'掲示板を特定できません'}[group]||group.slice(0,-4);}
// Hidden/chain presentation flags do not create separate votes for the same condition.
function ngConditionKey_(c){return ngHash_(JSON.stringify([ngFamilyBoard_(c.board),c.kind,c.value,"",c.regex,c.flags&~9]));}
/** Personal registrations enter Inbox first; they never become public rules on receipt. */
function ngInboxSetup_(){const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);const headers={Inbox:['operationId','reporter','conditionJson','action','receivedAt','state','reason','policyVersion','decisionJson'],ReviewPolicy:['key','value']};for(const name of Object.keys(headers)){let s=b.getSheetByName(name)||b.insertSheet(name);if(s.getLastRow()===0)s.getRange(1,1,1,headers[name].length).setValues([headers[name]]);else if(JSON.stringify(s.getRange(1,1,1,headers[name].length).getValues()[0])!==JSON.stringify(headers[name]))throw Error('Unexpected '+name+' headers');}}
function ngInboxValidate_(r){
 if(!r||typeof r.operationId!=='string'||!/^[a-f0-9]{64}$/.test(r.operationId)||!['upsert','delete'].includes(r.action))throw Error('Invalid operation');
 if(!['id','wacchoi','prefix','suffix','name','trip','keyword','reporter'].includes(r.kind)||typeof r.value!=='string'||r.value.length<1||r.value.length>2000)throw Error('Invalid personal condition');
 if(typeof r.board!=='string'||!(r.board==='*'||/^([a-z0-9.-]+)(:\d+)?(\/[A-Za-z0-9_.-]+)+$/.test(r.board))||r.board.length>300)throw Error('Invalid board');
 if(['prefix','suffix'].includes(r.kind)&&!/^[A-Za-z0-9+/]{4}$/.test(r.value))throw Error('Invalid Wacchoi part');
 if(r.kind==='wacchoi'&&!/^[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}$/.test(r.value))throw Error('Invalid Wacchoi');
 if(r.kind==='id'&&r.regex!==true&&!/^[A-Za-z0-9+/!_.-]{1,100}$/.test(r.value))throw Error('Invalid ID');
 if(r.kind==='reporter'&&(ngFamilyBoard_(r.board)!=='edge/all'||r.regex===true||r.flags!==16||!/^[A-Za-z0-9+/!_.-]{1,100}$/.test(r.value)))throw Error('Invalid reporter ID');
 if(!Number.isInteger(r.flags)||r.flags<0||r.flags>65535)throw Error('Invalid flags');
 const c={board:r.board==='unknown.invalid/unresolved'?'*':ngFamilyBoard_(r.board),kind:r.kind,value:r.value,period:"",regex:r.regex===true||(r.flags&0x20)!==0,flags:r.flags};
 return {operationId:r.operationId,action:r.action,condition:c};
}
/** A malformed administrative/imported row must not stop valid reports from being reviewed. */
function ngParsedInboxCondition_(row){
 try{
  if(typeof row[1]!=='string'||!row[1])return null;
  const c=JSON.parse(row[2]);return ngInboxValidate_(Object.assign({},c,{operationId:row[0],action:row[3]})).condition;
 }catch(invalid){return null;}
}
function ngEmptyInboxRow_(row){return row.every(value=>value===''||value===null||value===undefined);}
function ngReceivePersonal_(body){
 if(body.version!==2||body.action!=='personal'||typeof body.device!=='string'||!/^[a-f0-9]{64}$/.test(body.device)||!Array.isArray(body.reports)||!body.reports.length||body.reports.length>20)throw Error('Invalid personal batch');
 const incoming=body.reports.map(ngInboxValidate_),props=PropertiesService.getScriptProperties(),pepper=props.getProperty('REPORTER_PEPPER');if(!pepper)throw Error('Run setupSharedNg first');
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  ngInboxSetup_();const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId),s=b.getSheetByName('Inbox'),rows=ngRows_(s),reporter=ngHash_(pepper+':'+body.device),known=new Set(rows.filter(r=>r[1]===reporter).map(r=>r[0]));
  const day=new Date().toISOString().slice(0,10);let used=rows.filter(r=>r[1]===reporter&&String(r[4]).startsWith(day)).length;let accepted=0;
  for(const r of incoming){if(known.has(r.operationId))continue;if(++used>100)throw Error('Daily report limit');known.add(r.operationId);accepted++;}
  const staged=[];for(const r of incoming)if(!rows.some(row=>row[0]===r.operationId&&row[1]===reporter)&&!staged.some(row=>row[0]===r.operationId))staged.push([r.operationId,reporter,JSON.stringify(r.condition),r.action,new Date().toISOString(),'pending','awaiting_policy',0,'{}']);
  if(staged.length)s.getRange(s.getLastRow()+1,1,staged.length,9).setValues(staged);
  return ngJson_({ok:true,accepted,ack:incoming.map(r=>r.operationId)});
 }finally{lock.releaseLock();}
}
function reviewPersonalNg(){
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{return ngReviewPersonalLocked_();}finally{lock.releaseLock();}
}
function ngReviewPersonalLocked_(){
 ngInboxSetup_();const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId),s=b.getSheetByName('Inbox'),rows=ngRows_(s),props=PropertiesService.getScriptProperties();
 const config=ngReviewConfig_(b),overrides=JSON.parse(props.getProperty('REVIEW_OVERRIDES')||'{}');let policyVersion=Number(config.policyVersion||props.getProperty('REVIEW_POLICY_VERSION')||1);
 const active=new Map();for(const row of rows){
  if(ngEmptyInboxRow_(row))continue;
  const c=ngParsedInboxCondition_(row);
  if(!c){row[5]='rejected';row[6]='invalid_inbox_row';row[7]=policyVersion;row[8]=JSON.stringify({state:'rejected',reason:'invalid_inbox_row',minLevel:5,minVotes:1});continue;}
  const key=ngConditionKey_(c);active.set(row[1]+':'+key,{row,c,key});
 }
 const groups=new Map();for(const x of active.values())if(x.row[3]==='upsert'){if(!groups.has(x.key))groups.set(x.key,new Set());groups.get(x.key).add(x.row[1]);}
 for(const x of active.values()){
  const perBoard=(config.boards||{})[ngFamilyBoard_(x.c.board)]||{},policy=Object.assign({},config,perBoard);
  const decision=x.row[3]==='delete'?{state:'withdrawn',reason:'reporter_deleted',minLevel:5,minVotes:0}:overrides[x.key]||ngPolicy_(x.c,(groups.get(x.key)||new Set()).size,policy);
  if(decision.state==='approved'&&(x.c.board==='unknown.invalid/unresolved'||x.c.regex||((x.c.flags&0x70)!==0&&(x.c.flags&0x70)!==0x10)||(x.c.kind==='reporter'&&x.c.board!=='edge/all'))){decision.state='pending';decision.reason='scope_or_lifetime_review';}
  if(x.row[3]==='upsert'&&x.c.kind==='keyword'&&!ngShareableKeyword_(x.c.value)){decision.state='rejected';decision.reason='ineligible_keyword';}
  x.row[5]=decision.state;x.row[6]=decision.reason;x.row[7]=policyVersion;x.row[8]=JSON.stringify(decision);
 }
 if(rows.length)s.getRange(2,1,rows.length,9).setValues(rows);
 return rows.length;
}
function ngReviewConfig_(book){
 let config=JSON.parse(PropertiesService.getScriptProperties().getProperty('REVIEW_POLICY_JSON')||'{}');
 const sheet=book.getSheetByName('ReviewPolicy');if(sheet)for(const row of ngRows_(sheet)){if(!row[0])continue;const key=String(row[0]);if(!['words','exceptions','identityVotes','wordVotes','boards','policyVersion'].includes(key))throw Error('Unknown review policy key');config[key]=JSON.parse(String(row[1]));}
 return config;
}
function reviewSelectedPersonalNg(){
 const book=SpreadsheetApp.getActiveSpreadsheet();if(!book||book.getId()!==NG_CONFIG.spreadsheetId)throw Error('共有NGの管理シートから実行してください');
 const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(sheet.getName()!=='Inbox'||!range||range.getRow()<2)throw Error('Inboxの対象行を選んでください');
 const ui=SpreadsheetApp.getUi(),response=ui.prompt('審査結果','approved / pending / rejected を入力',ui.ButtonSet.OK_CANCEL);if(response.getSelectedButton()!==ui.Button.OK)return;
 const state=response.getResponseText().trim();if(!['approved','pending','rejected'].includes(state))throw Error('Invalid review state');
 const row=sheet.getRange(range.getRow(),1,1,9).getValues()[0],c=JSON.parse(row[2]);
 if(state==='approved'&&c.kind==='keyword'&&!ngShareableKeyword_(c.value))throw Error('NGワードは5文字以上・英字のみ不可です');
 if(state==='approved'&&(c.board==='unknown.invalid/unresolved'||((c.flags&0x70)!==0&&(c.flags&0x70)!==0x10)||(['id','wacchoi','prefix','suffix'].includes(c.kind)&&c.board==='*')||c.regex))throw Error('板が不明な条件、正規表現は配信できません');
 const props=PropertiesService.getScriptProperties(),overrides=JSON.parse(props.getProperty('REVIEW_OVERRIDES')||'{}');const key=ngConditionKey_(c);
 overrides[key]={state,reason:'manual_review',minLevel:5,minVotes:1};props.setProperty('REVIEW_OVERRIDES',JSON.stringify(overrides));reviewPersonalNg();
}

/** Revoke the reviewed aggregate, independently from one reporter's withdrawal. */
function setReviewedSharedNgRevoked_(key,revoked){
 if(typeof key!=='string'||!/^[a-f0-9]{64}$/.test(key))throw Error('Invalid reviewed rule ID');
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  const props=PropertiesService.getScriptProperties(),ids=new Set(JSON.parse(props.getProperty('REVIEW_REVOKED_IDS')||'[]'));
  if(revoked)ids.add(key);else ids.delete(key);
  props.setProperty('REVIEW_REVOKED_IDS',JSON.stringify(Array.from(ids).sort()));
 }finally{lock.releaseLock();}
}
function setSelectedReviewedSharedNgRevoked_(revoked){
 const book=SpreadsheetApp.getActiveSpreadsheet();if(!book||book.getId()!==NG_CONFIG.spreadsheetId)throw Error('共有NGの管理シートから実行してください');
 const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(sheet.getName()!=='Inbox'||!range||range.getRow()<2)throw Error('Inboxの対象行を選んでください');
 const row=sheet.getRange(range.getRow(),1,1,9).getValues()[0],condition=JSON.parse(row[2]);
 setReviewedSharedNgRevoked_(ngConditionKey_(condition),revoked);
 SpreadsheetApp.getUi().alert(revoked?'条件を配信停止にしました。次回の配信更新で反映します。':'配信停止を解除しました。審査条件を満たす場合、次回の配信更新で再開します。');
}
function revokeSelectedReviewedSharedNg(){setSelectedReviewedSharedNgRevoked_(true);}
function resumeSelectedReviewedSharedNg(){setSelectedReviewedSharedNgRevoked_(false);}
