rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>{
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication();
  if(!/\.haiagaru\.reporter242$/.test(String(app.getPackageName())))throw Error('Use isolated reporter242');
  const File=Java.use('java.io.File'),Db=Java.use('android.database.sqlite.SQLiteDatabase');
  const db=Db.openDatabase(app.getDatabasePath('roidon.sqlite').getAbsolutePath(),null,1);
  const cursor=db.rawQuery('SELECT b.name,b.created,MAX(b.res_count,b.server_res_count),b.read_count,bd.server FROM bookmarks b LEFT JOIN boards bd ON bd.name=b.name WHERE b.created>0 ORDER BY MAX(b.res_count,b.server_res_count)-b.read_count DESC LIMIT 1',null);
  let board=null,id=0,total=0,read=0,server=null;
  try{if(cursor.moveToFirst()){board=String(cursor.getString(0));id=Number(cursor.getLong(1));total=Math.max(0,Number(cursor.getInt(2)));read=Math.max(0,Number(cursor.getInt(3)));server=cursor.isNull(4)?null:String(cursor.getString(4));}}finally{cursor.close();db.close();}
  if(!board||id<=0)throw Error('No bookmark available for read-only test');
  const version=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName);
  const History=Java.use('app.morphe.extension.chmate.RefreshTargetHistory');
  const url=String(History.url.overload('android.content.Context','java.lang.String','java.lang.String','long','java.lang.String').call(History,app,version,board,id,server));
  const Entry=Java.use('app.morphe.extension.chmate.BoardUrlPicker$Entry');
  const ArrayList=Java.use('java.util.ArrayList'),entries=ArrayList.$new();entries.add(Entry.$new('Frida read-only unread check',url,true,false));
  const Picker=Java.use('app.morphe.extension.chmate.BoardUrlPicker'),counts=Picker.unreadCounts(app,entries);
  if(!counts.containsKey(url))throw Error('unread count did not resolve native bookmark: '+url);
  const unread=Number(counts.get(url));
  if(unread<0||unread>Math.max(0,total-Math.min(read,total)))throw Error('unread count outside native bookmark range');
  resolve({passed:4,url,rawUnread:Math.max(0,total-read),filteredUnread:unread,ngOption:!!app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0).getBoolean('suppressNgReplyNotifications',true),readOnly:true,networkRequests:0});
 }catch(e){resolve({error:String(e)});}
}));
