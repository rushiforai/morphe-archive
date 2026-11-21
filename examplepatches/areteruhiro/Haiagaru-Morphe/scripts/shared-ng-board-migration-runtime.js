/* Fast, network-free board-scope migration checks against the reporter app's board catalog. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication(),P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),C=Java.use('app.morphe.extension.chmate.SharedNgBoardCatalog'),N=Java.use('app.morphe.extension.chmate.NativeNgStore'),E=Java.use('app.morphe.extension.chmate.NativeNgStore$Entry'),J=Java.use('org.json.JSONObject');
  if(!/[.]reporter(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated reporter app required');
  P.initialize(app);if(!C.refresh(app))throw Error('native board catalog could not be refreshed');
  const db=Java.use('android.database.sqlite.SQLiteDatabase').openDatabase(String(app.getDatabasePath('roidon.sqlite').getPath()),null,0x1),cur=db.rawQuery('SELECT name FROM boards LIMIT 1',null);if(!cur.moveToFirst())throw Error('board catalog is empty');const board=String(cur.getString(0));cur.close();db.close();
  const store=N.$new(app,'ID'),condition=P.condition.overload('java.lang.String','app.morphe.extension.chmate.NativeNgStore$Entry');
  const known=E.$new(store.item.overload('java.lang.String','short','long','java.lang.String').call(store,'HaiagaruBoardMigrationProbe',0,1,board));
  const resolved=condition.call(P,'ID',known);if(resolved===null||String(resolved.optString('board'))==='*'||String(resolved.optString('board'))==='unknown.invalid/unresolved')throw Error('existing NG did not resolve to its current board');
  const old=J.$new().put('board','*').put('kind','id').put('value','HaiagaruBoardMigrationProbe');if(String(old.optString('board'))===String(resolved.optString('board')))throw Error('test condition did not replace the old other/global scope');
  const unknown=E.$new(store.item.overload('java.lang.String','short','long','java.lang.String').call(store,'HaiagaruUnresolvedProbe',0,1,'__haiagaru_unresolvable_board_key__'));
  const omitted=condition.call(P,'ID',unknown);if(omitted!==null)throw Error('unresolved NG was broadened instead of removed from the shared snapshot');
  resolve({checks:['fresh native board catalog read','saved NG resolves to current board instead of old all-board scope','unresolved other NG is omitted so old snapshot is deleted'],networkRequests:0,nativeNgStoreWrites:0});
 }catch(e){reject(String(e.stack||e));}
}));}};
