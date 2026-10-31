/** Generate a full data-only snapshot after review; publish only this output. */
function exportReviewedSharedNg(){
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{return ngExportReviewedLocked_();}finally{lock.releaseLock();}
}
function ngExportReviewedLocked_(){
 ngReviewPersonalLocked_();const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId),rows=ngRows_(book.getSheetByName('Inbox')),active=new Map();
 for(const row of rows){const c=ngParsedInboxCondition_(row);if(!c)continue;const key=ngConditionKey_(c);active.set(row[1]+':'+key,{row,c,key});}
 const groups=new Map();for(const x of active.values())if(x.row[3]==='upsert'&&x.row[5]==='approved'){
  const key=x.key;if(!groups.has(key))groups.set(key,{id:key,board:ngFamilyBoard_(x.c.board),boardName:ngFamilyName_(x.c.board),kind:x.c.kind,value:x.c.value,period:"",votes:0,revoked:false,minLevel:JSON.parse(x.row[8]).minLevel,minVotes:1});groups.get(key).votes++;
 }
 const rules=Array.from(groups.values()).sort((a,b)=>a.id.localeCompare(b.id));
 const revoked=JSON.parse(PropertiesService.getScriptProperties().getProperty('REVIEW_REVOKED_IDS')||'[]');for(const rule of rules)if(revoked.includes(rule.id))rule.revoked=true;
 const fingerprint=ngHash_(JSON.stringify(rules)),props=PropertiesService.getScriptProperties();
 let revision=Number(props.getProperty('EXPORT_REVISION')||0);if(props.getProperty('EXPORT_HASH')!==fingerprint){revision++;props.setProperty('EXPORT_HASH',fingerprint);props.setProperty('EXPORT_REVISION',String(revision));}
 return JSON.stringify({format:1,ok:true,revision,full:true,rules,nextOffset:null},null,2);
}
/** Optional time-trigger entry point. The fine-grained GitHub token stays in GAS properties. */
function publishReviewedSharedNg(){
 const lock=LockService.getScriptLock();lock.waitLock(15000);try{return ngPublishReviewedLocked_();}finally{lock.releaseLock();}
}
function ngPublishReviewedLocked_(){
 const props=PropertiesService.getScriptProperties(),token=props.getProperty('GITHUB_FEED_TOKEN');if(!token)throw Error('GITHUB_FEED_TOKEN is not configured');
 const repo=props.getProperty('GITHUB_FEED_REPO')||'areteruhiro/Haiagaru-Morphe',branch=props.getProperty('GITHUB_FEED_BRANCH')||'dev',path=props.getProperty('GITHUB_FEED_PATH')||'rules/shared-ng.json';
 if(!/^[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+$/.test(repo)||!/^rules\/[A-Za-z0-9_.\/-]+\.json$/.test(path)||path.includes('..'))throw Error('Invalid GitHub destination');
 const content=ngExportReviewedLocked_(),url='https://api.github.com/repos/'+repo+'/contents/'+path,headers={Authorization:'Bearer '+token,Accept:'application/vnd.github+json','X-GitHub-Api-Version':'2022-11-28'};
 const previous=UrlFetchApp.fetch(url+'?ref='+encodeURIComponent(branch),{headers,muteHttpExceptions:true});let sha;
 if(previous.getResponseCode()===200){const data=JSON.parse(previous.getContentText());sha=data.sha;if(Utilities.newBlob(Utilities.base64Decode(data.content)).getDataAsString('UTF-8')===content)return 'unchanged';}
 else if(previous.getResponseCode()!==404)throw Error('GitHub read failed: '+previous.getResponseCode());
 const payload={message:'chore: update reviewed shared NG feed [skip ci]',branch,content:Utilities.base64Encode(content,Utilities.Charset.UTF_8)};if(sha)payload.sha=sha;
 const response=UrlFetchApp.fetch(url,{method:'put',headers,contentType:'application/json',payload:JSON.stringify(payload),muteHttpExceptions:true});
 if(![200,201].includes(response.getResponseCode()))throw Error('GitHub publish failed: '+response.getResponseCode());return 'published';
}

function installSharedNgReviewTrigger(){
 const functions=['reviewPersonalNg'];
 for(const trigger of ScriptApp.getProjectTriggers())if(functions.includes(trigger.getHandlerFunction()))ScriptApp.deleteTrigger(trigger);
 ScriptApp.newTrigger('reviewPersonalNg').timeBased().everyHours(1).create();
}

/** Publication is configured separately so review works before a GitHub credential exists. */
function installSharedNgPublishTrigger(){
 if(!PropertiesService.getScriptProperties().getProperty('GITHUB_FEED_TOKEN'))throw Error('GITHUB_FEED_TOKEN is not configured');
 for(const trigger of ScriptApp.getProjectTriggers())if(trigger.getHandlerFunction()==='publishReviewedSharedNg')ScriptApp.deleteTrigger(trigger);
 ScriptApp.newTrigger('publishReviewedSharedNg').timeBased().everyHours(1).create();
}

/** Anonymous reads expose only the same approved data as the optional GitHub feed. */
function reviewedSharedNgFeed(e){
 const cache=CacheService.getScriptCache();let data=cache.get('reviewed-feed-v7');
 if(!data){data=exportReviewedSharedNg();if(data.length<20000)cache.put('reviewed-feed-v7',data,300);}
 // Older clients reject unknown kinds; expose the new kind only on explicit capability opt-in.
 const feed=JSON.parse(data),cap=e&&e.parameter||{};feed.rules=feed.rules.filter(r=>(cap.reporter==='1'||r.kind!=='reporter')&&(cap.globalIdentity==='1'||r.board!=='*'||!['id','wacchoi','prefix','suffix'].includes(r.kind)));data=JSON.stringify(feed);
 return ContentService.createTextOutput(data).setMimeType(ContentService.MimeType.JSON);
}
/** Read-only audit: never re-review, publish, change revision, or log personal values. */
function auditReviewedSharedNg(){
 const lock=LockService.getScriptLock();lock.waitLock(15000);
 try{return ngAuditReviewedLocked_();}catch(unavailable){const result={ok:false,readOnly:true,issues:{AUDIT_CONFIGURATION_OR_STORAGE_ERROR:1}};console.log(JSON.stringify(result));return result;}finally{lock.releaseLock();}
}
function ngAuditReviewedLocked_(){
 const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId),sheet=book.getSheetByName('Inbox');
 const issues={},warnings={},states={},reasons={},kinds={},active=new Map();
 function issue(code){issues[code]=(issues[code]||0)+1;}
 function warning(code){warnings[code]=(warnings[code]||0)+1;}
 const rows=sheet?ngRows_(sheet):[];if(!sheet)issue('INBOX_MISSING');
 for(const row of rows){
  if(ngEmptyInboxRow_(row))continue;
  try{
   const raw=JSON.parse(row[2]),c=ngInboxValidate_(Object.assign({},raw,{operationId:row[0],action:row[3]})).condition;
   if(typeof row[1]!=='string'||!row[1])throw Error('reporter');
   const key=ngConditionKey_(c);active.set(row[1]+':'+key,{row,c,key});
  }catch(invalid){if(row[5]==='rejected'&&row[6]==='invalid_inbox_row')warning('QUARANTINED_INBOX_ROW');else issue('INVALID_INBOX_ROW');}
 }
 const votes=new Map(),approved=new Map();
 for(const x of active.values())if(x.row[3]==='upsert')votes.set(x.key,(votes.get(x.key)||0)+1);
 const config=ngReviewConfig_(book),overrides=JSON.parse(PropertiesService.getScriptProperties().getProperty('REVIEW_OVERRIDES')||'{}');
 let waitingReview=0,withdrawn=0;
 for(const x of active.values()){
  const rawState=String(x.row[5]),state=['pending','approved','rejected','withdrawn'].includes(rawState)?rawState:'invalid_state',reason=String(x.row[6]);states[state]=(states[state]||0)+1;if(state==='invalid_state')issue('INVALID_REVIEW_STATE');
  // Only known reason codes reach logs; sheet text itself is untrusted/private.
  const reasonCode=['invalid_value','ineligible_keyword','disabled_personal_condition','unresolved_board','regular_expression_review','unsupported_native_match_mode','missing_board_scope','independent_reports','insufficient_reports','poster_name_review','unsupported_kind','dictionary_exception','no_dictionary_match','dictionary_and_reports','dictionary_waiting_reports','reporter_deleted','manual_review','scope_or_lifetime_review','awaiting_policy'].includes(reason)?reason:'unrecognized_reason';reasons[reasonCode]=(reasons[reasonCode]||0)+1;
  kinds[x.c.kind]=(kinds[x.c.kind]||0)+1;
  if(x.row[3]==='delete'){withdrawn++;if(state!=='withdrawn')issue('WITHDRAWAL_NOT_REVIEWED');continue;}
  const policy=Object.assign({},config,(config.boards||{})[x.c.board]||{});
  const expected=overrides[x.key]||ngPolicy_(x.c,votes.get(x.key),policy);
  const identity=['id','wacchoi','prefix','suffix','reporter'].includes(x.c.kind);
  const unsafe=x.c.board==='unknown.invalid/unresolved'||x.c.regex||((x.c.flags&0x70)!==0&&(x.c.flags&0x70)!==0x10)||(x.c.kind==='reporter'&&x.c.board!=='edge/all');
  const expectedState=unsafe&&expected.state==='approved'?'pending':expected.state;
  if(state!==expectedState){waitingReview++;issue('REVIEW_STATE_MISMATCH');}
  if(state==='approved'){
   if(unsafe||expectedState!=='approved')issue('UNSAFE_APPROVAL');
   let decision;try{decision=JSON.parse(x.row[8]);}catch(invalid){issue('INVALID_DECISION');continue;}
   if(!Number.isInteger(decision.minLevel)||decision.minLevel<1||decision.minLevel>5)issue('INVALID_FILTER_LEVEL');
   approved.set(x.key,(approved.get(x.key)||0)+1);
  }
 }
 const cached=CacheService.getScriptCache().get('reviewed-feed-v7');let cachedPublished=null;
 if(cached)try{
  const feed=JSON.parse(cached),seen=new Set();cachedPublished=feed.rules.length;
  if(!feed.ok||!feed.full||!Array.isArray(feed.rules))throw Error('format');
  for(const rule of feed.rules){
   if(seen.has(rule.id))issue('DUPLICATE_FEED_CONDITION');seen.add(rule.id);
   if(rule.period!==''||rule.board!==ngFamilyBoard_(rule.board)||rule.minVotes!==1)issue('INVALID_PARENT_SCOPE_FEED');
   for(const key of ['reporter','operationId','sourceScope'])if(key in rule)issue('PRIVATE_METADATA_IN_FEED');
   if(rule.votes!==approved.get(rule.id))warning('CACHED_FEED_NEEDS_REFRESH');
  }
  if(seen.size!==approved.size)warning('CACHED_FEED_NEEDS_REFRESH');
 }catch(invalid){issue('INVALID_FEED_CACHE');}
 const probes=[
  ngFamilyBoard_('5ch/android')===ngFamilyBoard_('5ch/poverty'),
  ngFamilyBoard_('mercury.bbspink.com/erobbs')!==ngFamilyBoard_('5ch/android'),
  ngFamilyName_('jbbs.shitaraba.net/game/123')==='したらば掲示板',
  ngPolicy_({board:'5ch/all',kind:'keyword',value:'今すぐ死ね',period:'',flags:16},1).state==='approved',
  ngPolicy_({board:'5ch/all',kind:'keyword',value:'ordinary-neutral-audit日本語',period:'',flags:16},50).state==='pending',
  ngPolicy_({board:'5ch/all',kind:'id',value:'AuditId',period:'',flags:16},1).state==='approved',
  ngPolicy_({board:'unknown.invalid/unresolved',kind:'id',value:'AuditId',period:'',flags:16},50).state==='pending',
  ngPolicy_({board:'edge/all',kind:'keyword',value:'今すぐ死ね',period:'',flags:32,regex:true},50).state==='pending'
 ];if(probes.some(ok=>!ok))issue('POLICY_PROBE_FAILED');
 const result={ok:Object.keys(issues).length===0,readOnly:true,totalInboxRows:rows.length,latestReporterConditions:active.size,activeReporterConditions:Array.from(votes.values()).reduce((a,b)=>a+b,0),withdrawn,states,reasons,kinds,approvedConditions:approved.size,waitingReview,cachedPublished,issues,warnings,policyProbes:probes.length};
 console.log(JSON.stringify(result));return result;
}
