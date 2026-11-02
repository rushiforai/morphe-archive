/** Spreadsheet-backed, data-only shared NG service. */
const NG_CONFIG = Object.freeze({spreadsheetId:'1mKo9ogD2ePwu16hgya8pu2-fF7g-I3ERPgm18PCO_oc', maxRules:10000, maxBatch:20, dailyReports:100, pageSize:200});
const NG_HEADERS = {
  Rules:['id','board','kind','valueJson','period','votes','revoked','revision','updatedAt'],
  Votes:['ruleId','reporter','createdAt','conditionJson'],
  Changes:['revision','ruleJson'],
  Pending:['reporter','conditionJson','createdAt'],
};
function setupSharedNg(){
  const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);
  Object.keys(NG_HEADERS).forEach(name=>{let sheet=book.getSheetByName(name);if(!sheet)sheet=book.insertSheet(name);
    if(sheet.getLastRow()===0){sheet.getRange(1,1,1,NG_HEADERS[name].length).setValues([NG_HEADERS[name]]);sheet.setFrozenRows(1);}
    else if(JSON.stringify(sheet.getRange(1,1,1,NG_HEADERS[name].length).getValues()[0])!==JSON.stringify(NG_HEADERS[name]))throw Error('Unexpected sheet headers: '+name);
  });
  const props=PropertiesService.getScriptProperties();if(!props.getProperty('REPORTER_PEPPER'))props.setProperty('REPORTER_PEPPER',Utilities.getUuid()+Utilities.getUuid());
  if(!props.getProperty('REVISION'))props.setProperty('REVISION','0');
}
function onOpen(){SpreadsheetApp.getUi().createMenu('共有NG').addItem('共有NGシートを準備','setupSharedNg').addItem('選択した条件を配信停止','revokeSelectedSharedNg').addItem('個人NGを自動審査','reviewPersonalNg').addItem('選択した個人NGの審査結果を変更','reviewSelectedPersonalNg').addItem('種類別シートの条件を配信停止','revokeSelectedReviewedSharedNg').addItem('種類別シートの配信停止を解除','resumeSelectedReviewedSharedNg').addItem('毎時の自動審査を設定','installSharedNgReviewTrigger').addItem('毎時のGitHub配信を設定','installSharedNgPublishTrigger').addItem('承認済みNGをGitHubへ配信','publishReviewedSharedNg').addToUi();}
function revokeSelectedSharedNg(){const book=SpreadsheetApp.getActiveSpreadsheet();if(!book||book.getId()!==NG_CONFIG.spreadsheetId)throw Error('共有NGのスプレッドシートから実行してください');const sheet=book.getActiveSheet(),range=sheet.getActiveRange();if(sheet.getName()!=='Rules'||!range||range.getRow()<2)throw Error('Rulesシートで停止する条件の行を選択してください');revokeSharedNg(String(sheet.getRange(range.getRow(),1,1,1).getValues()[0][0]));}
function ngJson_(value){return ContentService.createTextOutput(JSON.stringify(value)).setMimeType(ContentService.MimeType.JSON);}
function ngHash_(text){return Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_256,text,Utilities.Charset.UTF_8).map(b=>('0'+((b+256)%256).toString(16)).slice(-2)).join('');}
function ngText_(value){return String(value).normalize('NFKC').replace(/\s+/g,' ').trim();}
function ngValidate_(r){
  if(!r||typeof r.board!=='string'||!/^([a-z0-9.-]+)(:\d+)?(\/[A-Za-z0-9_.-]+)+$/.test(r.board)||r.board.length>300)throw Error('Invalid board');
  if(!['id','wacchoi','keyword'].includes(r.kind)||typeof r.value!=='string'||r.value.length>2000||typeof r.period!=='string')throw Error('Invalid condition');
  const value=r.kind==='keyword'?ngText_(r.value):r.value;
  if(r.kind==='id'&&!/^[A-Za-z0-9+/!_.-]{1,100}$/.test(value))throw Error('Invalid ID');
  if(r.kind==='wacchoi'&&!/^[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}$/.test(value))throw Error('Invalid Wacchoi');
  if(r.kind==='keyword'&&(value.length<50||r.period!==''))throw Error('Keyword must contain at least 50 characters');
  if(r.kind!=='keyword'){
    if(!/^20\d{2}-\d{2}-\d{2}$/.test(r.period))throw Error('Invalid period');
    const d=new Date(r.period+'T00:00:00Z');if(!Number.isFinite(d.getTime())||d.toISOString().slice(0,10)!==r.period)throw Error('Invalid date');
    if(r.kind==='wacchoi'&&d.getUTCDay()!==4)throw Error('Invalid week');
  }
  const tuple=[r.board,r.kind,value,r.period];return {id:ngHash_(JSON.stringify(tuple)),board:r.board,kind:r.kind,value,period:r.period};
}
function ngPublic_(row){return {id:String(row[0]),board:String(row[1]),kind:String(row[2]),value:JSON.parse(String(row[3])),period:String(row[4]),votes:Number(row[5]),revoked:row[6]===true};}
function ngRows_(sheet){return sheet.getLastRow()<2?[]:sheet.getRange(2,1,sheet.getLastRow()-1,sheet.getLastColumn()).getValues();}
/** Complete the write-ahead batch before serving data. Votes remain the authoritative count. */
function ngRecover_(book,props){
  const revoked=props.getProperty('REVOKE_PENDING');
  if(revoked){
    const operation=JSON.parse(revoked),sheet=book.getSheetByName('Rules'),rows=ngRows_(sheet),index=rows.findIndex(r=>r[0]===operation.id);
    if(index<0)throw Error('Revocation target missing');
    const row=rows[index];row[6]=true;row[7]=operation.revision;row[8]=operation.time;
    sheet.getRange(index+2,1,1,9).setValues([row]);
    book.getSheetByName('Changes').appendRow([operation.revision,JSON.stringify(ngPublic_(row))]);
    SpreadsheetApp.flush();props.setProperty('REVISION',String(Math.max(Number(props.getProperty('REVISION')||0),operation.revision)));props.deleteProperty('REVOKE_PENDING');
  }
  const journal=props.getProperty('PENDING');if(!journal)return;
  const span=JSON.parse(journal),pending=book.getSheetByName('Pending').getRange(span.start,1,span.count,3).getValues();
  const votesSheet=book.getSheetByName('Votes'),rulesSheet=book.getSheetByName('Rules'),changesSheet=book.getSheetByName('Changes');
  const votes=ngRows_(votesSheet),known=new Set(votes.map(v=>String(v[0])+':'+String(v[1]))),added=[];
  for(const row of pending){const condition=JSON.parse(row[1]),key=condition.id+':'+row[0];if(!known.has(key)){known.add(key);added.push([condition.id,row[0],row[2],row[1]]);}}
  if(added.length){votesSheet.getRange(votesSheet.getLastRow()+1,1,added.length,4).setValues(added);SpreadsheetApp.flush();votes.push(...added);}
  const rows=ngRows_(rulesSheet),byId=new Map(rows.map((r,i)=>[String(r[0]),i]));
  let revision=Math.max(Number(props.getProperty('REVISION')||0),...rows.map(r=>Number(r[7])||0));
  const counts=new Map();for(const v of votes){if(!counts.has(v[0]))counts.set(v[0],new Set());counts.get(v[0]).add(v[1]);}
  const changes=[],seen=new Set();
  for(const p of pending){const r=JSON.parse(p[1]);if(seen.has(r.id))continue;seen.add(r.id);let i=byId.get(r.id);
    if(i===undefined){i=rows.length;rows.push([r.id,r.board,r.kind,JSON.stringify(r.value),r.period,0,false,0,'']);byId.set(r.id,i);}
    const row=rows[i];row[5]=(counts.get(r.id)||new Set()).size;row[7]=++revision;row[8]=p[2];changes.push([revision,JSON.stringify(ngPublic_(row))]);
  }
  if(rows.length)rulesSheet.getRange(2,1,rows.length,9).setValues(rows);
  if(changes.length)changesSheet.getRange(changesSheet.getLastRow()+1,1,changes.length,2).setValues(changes);
  SpreadsheetApp.flush();props.setProperty('REVISION',String(revision));props.deleteProperty('PENDING');
}
function doGet(e){try{
  if(e&&e.parameter&&e.parameter.action==='edgeLevels')return edgeLevelFeed_();
  if(e&&e.parameter&&e.parameter.action==='reviewed')return reviewedSharedNgFeed(e);
  const params=e&&e.parameter?e.parameter:{},since=params.since===undefined?0:Number(params.since),offset=params.offset===undefined?0:Number(params.offset),snapshot=params.snapshot===undefined?null:Number(params.snapshot);
  if(!Number.isSafeInteger(since)||since<0||!Number.isSafeInteger(offset)||offset<0||offset>NG_CONFIG.maxRules||(snapshot!==null&&(!Number.isSafeInteger(snapshot)||snapshot<0))||(offset>0&&snapshot===null))throw Error('Invalid cursor');
  const props=PropertiesService.getScriptProperties();
  if(props.getProperty('PENDING')||props.getProperty('REVOKE_PENDING')){const recovery=LockService.getScriptLock();recovery.waitLock(15000);try{ngRecover_(SpreadsheetApp.openById(NG_CONFIG.spreadsheetId),props);}finally{recovery.releaseLock();}}
  const revision=Number(props.getProperty('REVISION')||0);
  if(snapshot!==null&&snapshot!==revision)return ngJson_({ok:true,revision,restart:true});
  if(since>revision)throw Error('Cursor ahead of server');
  if(since===revision&&since!==0)return ngJson_({ok:true,revision,unchanged:true});
  const cache=CacheService.getScriptCache(),key='feed2:'+revision+':'+since+':'+offset,hit=cache.get(key);if(hit)return ContentService.createTextOutput(hit).setMimeType(ContentService.MimeType.JSON);
  const lock=LockService.getScriptLock();lock.waitLock(10000);
  let response;try{
    const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngRecover_(book,props);const current=Number(props.getProperty('REVISION')||0);
    if(snapshot!==null&&snapshot!==current)return ngJson_({ok:true,revision:current,restart:true});
    // The latest revision on each rule is enough for a delta. Never scan the
    // ever-growing vote/change history to answer a read request.
    const rows=ngRows_(book.getSheetByName('Rules')).filter(row=>since===0||Number(row[7])>since);
    if(offset>rows.length)throw Error('Invalid page offset');
    const selected=rows.slice(offset,offset+NG_CONFIG.pageSize);
    response={ok:true,revision:current,full:since===0,rules:selected.map(ngPublic_),nextOffset:offset+selected.length<rows.length?offset+selected.length:null};
  }finally{lock.releaseLock();}
  const json=JSON.stringify(response);if(json.length<20000)cache.put('feed2:'+response.revision+':'+since+':'+offset,json,900);return ContentService.createTextOutput(json).setMimeType(ContentService.MimeType.JSON);
}catch(err){return ngJson_({ok:false,error:String(err.message||err)});}}
function doPost(e){
  try{const raw=e&&e.postData?e.postData.contents:'';if(raw.length<=65536&&Utilities.newBlob(raw).getBytes().length<=65536){const personal=JSON.parse(raw);if(personal.version===2)return ngReceivePersonal_(personal);}}catch(error){return ngJson_({ok:false,error:String(error.message||error)});}
  const lock=LockService.getScriptLock();try{
  const raw=e&&e.postData?e.postData.contents:'';if(raw.length>65536||Utilities.newBlob(raw).getBytes().length>65536)throw Error('Request too large');const body=JSON.parse(raw);
  if(body.version!==1||typeof body.device!=='string'||!/^[a-f0-9]{64}$/.test(body.device)||!Array.isArray(body.reports)||body.reports.length===0||body.reports.length>NG_CONFIG.maxBatch)throw Error('Invalid batch');
  const incoming=body.reports.map(ngValidate_),props=PropertiesService.getScriptProperties(),pepper=props.getProperty('REPORTER_PEPPER');if(!pepper)throw Error('Run setupSharedNg first');
  if(props.getProperty('ALLOW_LEGACY_REPORTS')!=='true')throw Error('Legacy reports disabled; use reviewed personal submissions');
  const reporter=ngHash_(pepper+':'+body.device);lock.waitLock(15000);
  const book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngRecover_(book,props);
  const rulesSheet=book.getSheetByName('Rules'),votesSheet=book.getSheetByName('Votes');
  const rows=ngRows_(rulesSheet),votes=ngRows_(votesSheet),byId=new Map(rows.map((r,i)=>[String(r[0]),i]));
  const known=new Set(votes.filter(v=>String(v[1])===reporter).map(v=>String(v[0]))),now=new Date(),day=now.toISOString().slice(0,10);
  let daily=votes.filter(v=>String(v[1])===reporter&&new Date(v[2]).toISOString().slice(0,10)===day).length;
  const added=[];
  for(const r of incoming){if(known.has(r.id))continue;if(daily>=NG_CONFIG.dailyReports)throw Error('Daily report limit');
    let index=byId.get(r.id);if(index===undefined){if(rows.length>=NG_CONFIG.maxRules)throw Error('Rule limit');index=rows.length;rows.push([r.id,r.board,r.kind,JSON.stringify(r.value),r.period,0,false,0,'']);byId.set(r.id,index);}
    const row=rows[index];if(row[6]===true)continue;
    known.add(r.id);added.push([reporter,JSON.stringify(r),now.toISOString()]);daily++;
  }
  // Validate the entire batch before any write; a lost response can be retried without a second vote.
  if(added.length){const sheet=book.getSheetByName('Pending'),start=sheet.getLastRow()+1;sheet.getRange(start,1,added.length,3).setValues(added);SpreadsheetApp.flush();props.setProperty('PENDING',JSON.stringify({start,count:added.length}));ngRecover_(book,props);}
  return ngJson_({ok:true,accepted:added.length,revision:Number(props.getProperty('REVISION')||0)});
}catch(err){return ngJson_({ok:false,error:String(err.message||err)});}finally{if(lock.hasLock())lock.releaseLock();}}
/** Run from the authenticated Apps Script editor; not exposed through the Web API. */
function revokeSharedNg(id){if(typeof id!=='string'||!/^[a-f0-9]{64}$/.test(id))throw Error('Invalid ID');const lock=LockService.getScriptLock();lock.waitLock(15000);try{
  const props=PropertiesService.getScriptProperties(),book=SpreadsheetApp.openById(NG_CONFIG.spreadsheetId);ngRecover_(book,props);const sheet=book.getSheetByName('Rules'),rows=ngRows_(sheet),index=rows.findIndex(r=>r[0]===id);if(index<0)throw Error('Not found');
  if(rows[index][6]===true)return;
  props.setProperty('REVOKE_PENDING',JSON.stringify({id,revision:Number(props.getProperty('REVISION')||0)+1,time:new Date().toISOString()}));ngRecover_(book,props);
}finally{lock.releaseLock();}}
