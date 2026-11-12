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
function ngInboxSetup_(){const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);const headers={Inbox:['operationId','reporter','conditionJson','action','receivedAt','state','reason','policyVersion','decisionJson'],ReviewPolicy:['key','value']};for(const name of [...Object.keys(headers),...NG_REVIEW_SHEETS,'ReviewTransfer']){const expected=headers[name]||headers.Inbox;let s=b.getSheetByName(name)||b.insertSheet(name);if(s.getLastRow()===0)s.getRange(1,1,1,expected.length).setValues([expected]);else if(JSON.stringify(s.getRange(1,1,1,expected.length).getValues()[0])!==JSON.stringify(expected))throw Error('Unexpected '+name+' headers');}}
function ngInboxValidate_(r){
 if(!r||typeof r.operationId!=='string'||!/^[a-f0-9]{64}$/.test(r.operationId)||!['upsert','delete'].includes(r.action))throw Error('Invalid operation');
 if(!['id','wacchoi','prefix','suffix','name','trip','keyword','reporter'].includes(r.kind)||typeof r.value!=='string'||r.value.length<1||r.value.length>2000)throw Error('Invalid personal condition');
 if(typeof r.board!=='string'||!(r.board==='*'||/^([a-z0-9.-]+)(:\d+)?(\/[A-Za-z0-9_.-]+)+$/.test(r.board))||r.board.length>300)throw Error('Invalid board');
 if(r.regex!==true&&(r.flags&0x20)===0&&['prefix','suffix'].includes(r.kind)&&!/^[A-Za-z0-9+/]{4}$/.test(r.value))throw Error('Invalid Wacchoi part');
 if(r.regex!==true&&(r.flags&0x20)===0&&r.kind==='wacchoi'&&!/^[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}$/.test(r.value))throw Error('Invalid Wacchoi');
 if(r.kind==='id'&&r.regex!==true&&(r.flags&0x20)===0&&!/^[A-Za-z0-9+/!_.-]{1,100}$/.test(r.value))throw Error('Invalid ID');
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
function ngBindReporterDevice_(body){
 if(typeof body.device!=='string'||!/^[a-f0-9]{64}$/.test(body.device)||typeof body.deviceKey!=='string'||!/^[a-f0-9]{64}$/.test(body.deviceKey))throw Error('Invalid device identity');
 const props=PropertiesService.getScriptProperties();if(!props.getProperty('REPORTER_PEPPER'))throw Error('Run setupSharedNg first');
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{ngDeviceReporter_(body,props,SpreadsheetApp.openById(NG_CONFIG.spreadsheetId));return ngJson_({ok:true});}finally{lock.releaseLock();}
}
function ngReceivePersonal_(body){
 if(body.version!==2||body.action!=='personal'||typeof body.device!=='string'||!/^[a-f0-9]{64}$/.test(body.device)||!Array.isArray(body.reports)||!body.reports.length||body.reports.length>20)throw Error('Invalid personal batch');
 const incoming=body.reports.map(ngInboxValidate_),props=PropertiesService.getScriptProperties(),pepper=props.getProperty('REPORTER_PEPPER');if(!pepper)throw Error('Run setupSharedNg first');
 const reporter=ngHash_(pepper+':'+body.device);
 if(!body.deviceKey&&ngReporterIgnored_(reporter))return ngJson_({ok:true,accepted:new Set(incoming.map(r=>r.operationId)).size,ack:incoming.map(r=>r.operationId)});
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  ngInboxSetup_();const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngRecoverPersonalTransfer_(b);ngRecoverReporterExclusions_(b,props);ngRecoverReporterRestores_(b,props);const reporter=ngDeviceReporter_(body,props,b);ngApplyReporterExclusions_(b,props);ngRecoverReporterExclusions_(b,props);
  if(ngReporterIgnored_(reporter))return ngJson_({ok:true,accepted:new Set(incoming.map(r=>r.operationId)).size,ack:incoming.map(r=>r.operationId)});
  const s=b.getSheetByName('Inbox'),rows=ngAllPersonalRows_(b),known=new Set(rows.filter(r=>r[1]===reporter).map(r=>r[0]));
  const day=new Date().toISOString().slice(0,10);let used=rows.filter(r=>r[1]===reporter&&String(r[4]).startsWith(day)).length;let accepted=0;
  for(const r of incoming){if(known.has(r.operationId))continue;if(++used>100)throw Error('Daily report limit');known.add(r.operationId);accepted++;}
  const staged=[];for(const r of incoming)if(!rows.some(row=>row[0]===r.operationId&&row[1]===reporter)&&!staged.some(row=>row[0]===r.operationId))staged.push([r.operationId,reporter,JSON.stringify(r.condition),r.action,new Date().toISOString(),'pending','awaiting_policy',0,'{}']);
  if(staged.length)s.getRange(s.getLastRow()+1,1,staged.length,9).setValues(staged);
  return ngJson_({ok:true,accepted,ack:incoming.map(r=>r.operationId)});
 }finally{lock.releaseLock();}
}
function reviewPersonalNg(){
 const lock=LockService.getScriptLock();if(!lock.tryLock(1000))return 'busy';
 try{const snapshot={},count=ngReviewPersonalLocked_(snapshot);ngReviewedCachePut_(ngExportReviewedLocked_(snapshot.rows));return count;}finally{lock.releaseLock();}
}
function ngReviewPersonalLocked_(snapshot){
 ngInboxSetup_();const b=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngRecoverPersonalTransfer_(b);const props=PropertiesService.getScriptProperties();ngRecoverReporterRestores_(b,props);ngApplyReporterExclusions_(b,props);ngRecoverReporterExclusions_(b,props);const s=b.getSheetByName('Inbox'),rows=ngAllPersonalRows_(b),before=JSON.stringify(rows);
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
  if(decision.state==='approved'&&(x.c.board==='unknown.invalid/unresolved'||!ngMatchModeSupported_(x.c)||!ngRegexValid_(x.c)||(x.c.kind==='reporter'&&x.c.board!=='edge/all'))){decision.state='pending';decision.reason='scope_or_lifetime_review';}
  if(x.row[3]==='upsert'&&x.c.kind==='keyword'&&!ngShareableKeyword_(x.c.value)){decision.state='rejected';decision.reason='ineligible_keyword';}
  x.row[5]=decision.state;x.row[6]=decision.reason;x.row[7]=policyVersion;x.row[8]=JSON.stringify(decision);
 }
 const latest=new Set(Array.from(active.values()).map(x=>x.row));
 for(const row of rows)if(row[5]==='pending'&&!latest.has(row)){row[5]='withdrawn';row[6]='reporter_superseded';}
 if(before!==JSON.stringify(rows)||ngRows_(b.getSheetByName('Inbox')).some(row=>!ngEmptyInboxRow_(row)&&row[6]!=='awaiting_policy')||(b.getSheetByName('Reviewed')&&ngRows_(b.getSheetByName('Reviewed')).length))ngStorePersonalRows_(b,rows);
 if(snapshot)snapshot.rows=rows;return rows.length;
}
function ngReviewConfig_(book){
 let config=JSON.parse(PropertiesService.getScriptProperties().getProperty('REVIEW_POLICY_JSON')||'{}');
 const sheet=book.getSheetByName('ReviewPolicy');if(sheet)for(const row of ngRows_(sheet)){if(!row[0])continue;const key=String(row[0]);if(!['words','exceptions','identityVotes','wordVotes','boards','policyVersion'].includes(key))throw Error('Unknown review policy key');config[key]=JSON.parse(String(row[1]));}
 return config;
}
function reviewSelectedPersonalNg(){
 const book=SpreadsheetApp.getActiveSpreadsheet();if(!book||book.getId()!==NG_CONFIG.spreadsheetId)throw Error('共有NGの管理シートから実行してください');
 const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(!['Inbox','Reviewed',...NG_REVIEW_SHEETS].includes(sheet.getName())||!range||range.getRow()<2)throw Error('Inboxまたは種類別の審査シートで対象行を選んでください');
 const ui=SpreadsheetApp.getUi(),response=ui.prompt('審査結果','approved / pending / rejected を入力',ui.ButtonSet.OK_CANCEL);if(response.getSelectedButton()!==ui.Button.OK)return;
 const state=response.getResponseText().trim();if(!['approved','pending','rejected'].includes(state))throw Error('Invalid review state');
 const row=sheet.getRange(range.getRow(),1,1,9).getValues()[0],c=JSON.parse(row[2]);
 if(state==='approved'&&c.kind==='keyword'&&!ngShareableKeyword_(c.value))throw Error('NGワードは5文字以上・英字のみ不可です');
 if(state==='approved'&&(c.board==='unknown.invalid/unresolved'||!ngMatchModeSupported_(c)||!ngRegexValid_(c)))throw Error('板が不明、未対応の一致方式、構文が不正な正規表現は配信できません');
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
 const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(!['Inbox','Reviewed',...NG_REVIEW_SHEETS].includes(sheet.getName())||!range||range.getRow()<2)throw Error('Inboxまたは種類別の審査シートで対象行を選んでください');
 const row=sheet.getRange(range.getRow(),1,1,9).getValues()[0],condition=JSON.parse(row[2]);
 setReviewedSharedNgRevoked_(ngConditionKey_(condition),revoked);
 SpreadsheetApp.getUi().alert(revoked?'条件を配信停止にしました。次回の配信更新で反映します。':'配信停止を解除しました。審査条件を満たす場合、次回の配信更新で再開します。');
}
function revokeSelectedReviewedSharedNg(){setSelectedReviewedSharedNgRevoked_(true);}
function resumeSelectedReviewedSharedNg(){setSelectedReviewedSharedNgRevoked_(false);}

/** Pending queue plus reviewed history, ordered independently of sheet migration. */
function ngAllPersonalRows_(book){
 const unique=new Map();let serial=0;
 for(const name of ['Reviewed',...NG_REVIEW_SHEETS,'Inbox']){const sheet=book.getSheetByName(name);if(!sheet)continue;
  for(const row of ngRows_(sheet)){if(ngEmptyInboxRow_(row))continue;const key=row[0]&&row[1]?row[1]+':'+row[0]:'invalid:'+serial++;unique.set(key,row);}
 }
 return Array.from(unique.values()).sort((a,b)=>String(a[4]).localeCompare(String(b[4])));
}
function ngWritePersonalRows_(sheet,rows){
 const previous=Math.max(0,sheet.getLastRow()-1);
 if(rows.length)sheet.getRange(2,1,rows.length,9).setValues(rows);
 SpreadsheetApp.flush();
 if(previous>rows.length)sheet.getRange(rows.length+2,1,previous-rows.length,9).clearContent();
}
const NG_REVIEW_SHEETS=['NG_ID','NG_Word','NG_Wacchoi','NG_Name','NG_Reporter','NG_Other'];
function ngReviewSheetName_(row){
 try{const kind=JSON.parse(row[2]).kind;return kind==='id'?'NG_ID':kind==='keyword'?'NG_Word':['wacchoi','prefix','suffix'].includes(kind)?'NG_Wacchoi':['name','trip'].includes(kind)?'NG_Name':kind==='reporter'?'NG_Reporter':'NG_Other';}catch(invalid){return 'NG_Other';}
}
function ngCommitPersonalRows_(book,rows){
 for(const name of NG_REVIEW_SHEETS)ngWritePersonalRows_(book.getSheetByName(name),rows.filter(row=>row[6]!=='awaiting_policy'&&ngReviewSheetName_(row)===name));
 ngWritePersonalRows_(book.getSheetByName('Inbox'),rows.filter(row=>row[6]==='awaiting_policy'));
 const legacy=book.getSheetByName('Reviewed');if(legacy)ngWritePersonalRows_(legacy,[]);
}
/** Write-ahead snapshot makes moves and retries idempotent. */
function ngStorePersonalRows_(book,rows){
 const props=PropertiesService.getScriptProperties();
 ngWritePersonalRows_(book.getSheetByName('ReviewTransfer'),rows);
 props.setProperty('REVIEW_TRANSFER',JSON.stringify({phase:'staged',count:rows.length}));
 ngRecoverPersonalTransfer_(book);
 const cache=CacheService.getScriptCache();if(cache.remove)cache.remove(ngReviewedCacheKey_());
}
function ngRecoverPersonalTransfer_(book){
 const props=PropertiesService.getScriptProperties(),raw=props.getProperty('REVIEW_TRANSFER');if(!raw)return;
 const journal=JSON.parse(raw),sheet=book.getSheetByName('ReviewTransfer');
 if(journal.phase==='staged'){
  const rows=ngRows_(sheet);if(rows.length!==journal.count)throw Error('Review transfer snapshot incomplete');
  ngCommitPersonalRows_(book,rows);SpreadsheetApp.flush();props.setProperty('REVIEW_TRANSFER',JSON.stringify({phase:'committed'}));
 }else if(journal.phase!=='committed')throw Error('Invalid review transfer phase');
 ngWritePersonalRows_(sheet,[]);props.deleteProperty('REVIEW_TRANSFER');
}

/** Private moderation feedback. Only acknowledged states are returned to clients. */
function ngReceiveReporterExclusions_(body){
 if(body.version!==2||body.action!=='exclusions'||typeof body.device!=='string'||!/^[a-f0-9]{64}$/.test(body.device)||typeof body.deviceKey!=='string'||!/^[a-f0-9]{64}$/.test(body.deviceKey)||!Array.isArray(body.operations)||!body.operations.length||body.operations.length>20)throw Error('Invalid feedback batch');
 const seen=new Set();for(const op of body.operations){if(!op||typeof op.target!=='string'||!/^[a-f0-9]{64}$/.test(op.target)||typeof op.exclude!=='boolean'||!Number.isSafeInteger(op.revision)||op.revision<1||seen.has(op.target))throw Error('Invalid feedback operation');seen.add(op.target);}
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  const props=PropertiesService.getScriptProperties(),book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);if(!props.getProperty('REPORTER_PEPPER'))throw Error('Run setupSharedNg first');
  ngInboxSetup_();ngRecoverPersonalTransfer_(book);ngRecoverReporterExclusions_(book,props);ngRecoverReporterRestores_(book,props);const reporter=ngDeviceReporter_(body,props,book);
  if(ngReporterIgnored_(reporter))return ngJson_({ok:true,ack:body.operations});
  const sheet=ngReporterFeedbackSheet_(book);
  const rows=ngRows_(sheet),ack=[],now=new Date().toISOString(),own=ngPublicReporter_(reporter);
  for(const op of body.operations){
   if(op.target===own){ack.push(op);continue;}
   let index=rows.findIndex(row=>row[0]===reporter&&row[1]===op.target);
   if(index<0){if(rows.filter(row=>row[0]===reporter&&String(row[4]).startsWith(now.slice(0,10))).length>=NG_CONFIG.dailyReports)throw Error('Daily feedback limit');index=rows.length;rows.push([reporter,op.target,op.exclude,op.revision,now]);}
   else if(Number(rows[index][3])<op.revision)rows[index]=[reporter,op.target,op.exclude,op.revision,now];
   const row=rows[index];ack.push({target:op.target,exclude:row[2]===true,revision:Number(row[3])});
  }
  ngWriteReporterRows_(sheet,rows,5);ngApplyReporterExclusions_(book,props);ngRecoverReporterExclusions_(book,props);
  return ngJson_({ok:true,ack});
 }finally{lock.releaseLock();}
}
function ngWriteReporterRows_(sheet,rows,width){
 const previous=Math.max(0,sheet.getLastRow()-1);if(rows.length)sheet.getRange(2,1,rows.length,width).setValues(rows);SpreadsheetApp.flush();if(previous>rows.length)sheet.getRange(rows.length+2,1,previous-rows.length,width).clearContent();
}
function ngApplyReporterExclusions_(book,props){
 const limit=Number(props.getProperty('REPORTER_EXCLUSION_THRESHOLD')||0),sheet=book.getSheetByName('ReporterExclusions');if(!Number.isSafeInteger(limit)||limit<2||limit>100||!sheet)return;
 const ignored=new Set(ngIgnoredReporters_()),votes=new Map();
 for(const row of ngRows_(sheet))if(row[2]===true&&!ignored.has(row[0])){if(!votes.has(row[1]))votes.set(row[1],new Set());votes.get(row[1]).add(row[0]);}
 const restored=new Set(props.getKeys().filter(key=>key.startsWith('MANUAL_REPORTER_RESTORE_')).map(key=>key.slice('MANUAL_REPORTER_RESTORE_'.length)));
 const reporters=new Set(ignored);for(const row of ngAllPersonalRows_(book))reporters.add(row[1]);
 for(const [name,column] of [['ReporterDevices',1],['Votes',1],['Pending',0]]){const source=book.getSheetByName(name);if(source)for(const row of ngRows_(source))reporters.add(row[column]);}
 for(const reporter of reporters)if(typeof reporter==='string'&&/^[a-f0-9]{64}$/.test(reporter)&&!ignored.has(reporter)&&!restored.has(reporter)){
  const independent=new Set(votes.get(ngPublicReporter_(reporter))||[]);independent.delete(reporter);for(const voter of ignored)independent.delete(voter);
  if(independent.size>=limit){props.setProperty('AUTO_IGNORED_REPORTER_'+reporter,JSON.stringify({phase:'pending',cycle:Utilities.getUuid(),at:new Date().toISOString()}));ignored.add(reporter);}
 }
}
/** Archive commits before active data is removed; both operations are retryable. */
function ngExcludedArchive_(book){
 const headers=['reporter','sourceSheet','recordKey','rowJson','excludedAt','restoredAt'];let sheet=book.getSheetByName('除外済み');if(!sheet)sheet=book.insertSheet('除外済み');if(sheet.getLastRow()===0){sheet.getRange(1,1,1,6).setValues([headers]);sheet.setFrozenRows(1);}else if(JSON.stringify(sheet.getRange(1,1,1,6).getValues()[0])!==JSON.stringify(headers))throw Error('Unexpected archive headers');return sheet;
}
function ngReporterBlockState_(props,key){const raw=props.getProperty(key);return raw==='done'?{phase:'done'}:raw==='pending'?{phase:'pending',cycle:key,at:new Date().toISOString()}:JSON.parse(raw);}
function ngRecountLegacyReporterVotes_(book,props){
 const ruleSheet=book.getSheetByName('Rules'),voteSheet=book.getSheetByName('Votes');if(!ruleSheet||!voteSheet)return;
 const rules=ngRows_(ruleSheet),votes=ngRows_(voteSheet),changes=[];let revision=Math.max(Number(props.getProperty('REVISION')||0),...rules.map(row=>Number(row[7])||0));
 for(const row of rules){const count=new Set(votes.filter(vote=>vote[0]===row[0]).map(vote=>vote[1])).size;if(Number(row[5])===count)continue;row[5]=count;row[7]=++revision;row[8]=new Date().toISOString();changes.push([revision,JSON.stringify(ngPublic_(row))]);}
 if(rules.length)ruleSheet.getRange(2,1,rules.length,9).setValues(rules);const changeSheet=book.getSheetByName('Changes');if(changes.length&&changeSheet)changeSheet.getRange(changeSheet.getLastRow()+1,1,changes.length,2).setValues(changes);SpreadsheetApp.flush();props.setProperty('REVISION',String(revision));
}
function ngRecoverReporterExclusions_(book,props){
 const pending=props.getKeys().filter(key=>/^AUTO_IGNORED_REPORTER_[a-f0-9]{64}$/.test(key)&&ngReporterBlockState_(props,key).phase!=='done');if(!pending.length)return;
 ngRecoverPersonalTransfer_(book);ngRecover_(book,props);const removed=new Set(pending.map(key=>key.slice('AUTO_IGNORED_REPORTER_'.length))),states=new Map(pending.map(key=>[key.slice('AUTO_IGNORED_REPORTER_'.length),ngReporterBlockState_(props,key)]));
 const archive=ngExcludedArchive_(book),saved=ngRows_(archive),known=new Set(saved.map(row=>row[2]));
 for(const name of ['Reviewed',...NG_REVIEW_SHEETS,'Inbox','Votes','Pending']){const sheet=book.getSheetByName(name);if(!sheet)continue;const column=name==='Pending'?0:1;
  for(const row of ngRows_(sheet))if(removed.has(row[column])){const reporter=row[column],state=states.get(reporter),json=JSON.stringify(row),key=ngHash_(JSON.stringify([state.cycle,name,json]));if(!known.has(key)){saved.push([reporter,name,key,json,state.at,'']);known.add(key);}}
 }
 // No live row is touched until all archival rows are safely written.
 ngWriteReporterRows_(archive,saved,6);SpreadsheetApp.flush();
 ngStorePersonalRows_(book,ngAllPersonalRows_(book).filter(row=>!removed.has(row[1])));
 for(const [name,column] of [['Votes',1],['Pending',0]]){const sheet=book.getSheetByName(name);if(sheet)ngWriteReporterRows_(sheet,ngRows_(sheet).filter(row=>!removed.has(row[column])),name==='Votes'?4:3);}
 ngRecountLegacyReporterVotes_(book,props);
 for(const key of pending){const state=ngReporterBlockState_(props,key);state.phase='done';props.setProperty(key,JSON.stringify(state));}
 const cache=CacheService.getScriptCache();if(cache.remove)cache.remove(ngReviewedCacheKey_());
}
/** Editor/spreadsheet administrator only; never routed from the anonymous Web API. */
function restoreSelectedExcludedReporter(){
 const book=SpreadsheetApp.getActiveSpreadsheet();if(!book||book.getId()!==NG_CONFIG.spreadsheetId)throw Error('共有NGのスプレッドシートから実行してください');const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(sheet.getName()!=='除外済み'||!range||range.getRow()<2)throw Error('除外済みシートで復元する行を選択してください');
 return restoreExcludedReporter(String(sheet.getRange(range.getRow(),1,1,1).getValues()[0][0]));
}
function restoreExcludedReporter(reporter){
 if(typeof reporter!=='string'||!/^[a-f0-9]{64}$/.test(reporter))throw Error('Invalid reporter');const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  const props=PropertiesService.getScriptProperties(),book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngInboxSetup_();ngRecoverPersonalTransfer_(book);ngRecoverReporterExclusions_(book,props);
  if(String(props.getProperty('IGNORED_REPORTERS')||'').split(/[\s,]+/).includes(reporter))throw Error('手動の除外設定を確認してください');
  if(!ngRows_(ngExcludedArchive_(book)).some(row=>row[0]===reporter&&!row[5]))return 'already restored';
  props.setProperty('MANUAL_REPORTER_RESTORE_'+reporter,'true');props.setProperty('REPORTER_RESTORE_PENDING_'+reporter,new Date().toISOString());ngRecoverReporterRestores_(book,props);return 'restored';
 }finally{lock.releaseLock();}
}
function ngRecoverReporterRestores_(book,props){
 const pending=props.getKeys().filter(key=>/^REPORTER_RESTORE_PENDING_[a-f0-9]{64}$/.test(key));if(!pending.length)return;
 ngRecoverPersonalTransfer_(book);const archive=ngExcludedArchive_(book),saved=ngRows_(archive);
 for(const property of pending){const reporter=property.slice('REPORTER_RESTORE_PENDING_'.length),records=saved.filter(row=>row[0]===reporter&&!row[5]);
  const active=ngAllPersonalRows_(book),known=new Set(active.map(row=>row[1]+':'+row[0]));
  for(const record of records)if(['Reviewed',...NG_REVIEW_SHEETS,'Inbox'].includes(record[1])){const row=JSON.parse(record[3]);if(!Array.isArray(row)||row.length!==9||row[1]!==reporter)throw Error('Invalid archive row');const key=row[1]+':'+row[0];if(!known.has(key)){active.push(row);known.add(key);}}
  ngStorePersonalRows_(book,active.sort((a,b)=>String(a[4]).localeCompare(String(b[4]))));
  for(const name of ['Votes','Pending']){const sheet=book.getSheetByName(name);if(!sheet)continue;const rows=ngRows_(sheet),keys=new Set(rows.map(row=>JSON.stringify(row)));
   for(const record of records)if(record[1]===name){const row=JSON.parse(record[3]);if(!Array.isArray(row)||row.length!==(name==='Votes'?4:3)||row[name==='Votes'?1:0]!==reporter)throw Error('Invalid legacy archive');const key=JSON.stringify(row);if(!keys.has(key)){rows.push(row);keys.add(key);}}
   ngWriteReporterRows_(sheet,rows,name==='Votes'?4:3);
  }
  ngRecountLegacyReporterVotes_(book,props);for(const record of records)record[5]=props.getProperty(property);ngWriteReporterRows_(archive,saved,6);SpreadsheetApp.flush();
  props.deleteProperty('AUTO_IGNORED_REPORTER_'+reporter);props.deleteProperty(property);const cache=CacheService.getScriptCache();if(cache.remove)cache.remove(ngReviewedCacheKey_());
 }
}

function ngReporterFeedbackSheet_(book){const headers=['reporter','target','exclude','revision','updatedAt'];let sheet=book.getSheetByName('ReporterExclusions');if(!sheet)sheet=book.insertSheet('ReporterExclusions');if(sheet.getLastRow()===0){sheet.getRange(1,1,1,5).setValues([headers]);sheet.setFrozenRows(1);}else if(JSON.stringify(sheet.getRange(1,1,1,5).getValues()[0])!==JSON.stringify(headers))throw Error('Unexpected feedback headers');return sheet;}
function setupReporterFeedback(){const lock=LockService.getScriptLock();lock.waitLock(15000);try{const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngInboxSetup_();ngExcludedArchive_(book);ngReporterFeedbackSheet_(book);return 'ready';}finally{lock.releaseLock();}}
