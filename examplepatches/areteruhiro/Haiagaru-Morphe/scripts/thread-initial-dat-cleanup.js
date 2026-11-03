rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings only');
 const F=Java.use('java.io.File'),marker=F.$new(app.getFilesDir(),'thread-prefetch-owned-fixture'),root=F.$new(app.getExternalFilesDir(null),'2chMate/dat'),dat=F.$new(root,'android_1790000021.dat');
 function read(file){const r=Java.use('java.io.BufferedReader').$new(Java.use('java.io.InputStreamReader').$new(Java.use('java.io.FileInputStream').$new(file),'MS932'));try{return String(r.readLine());}finally{r.close();}}
 if(!marker.isFile()||read(marker)!=='android_1790000021'||!dat.isFile()||!read(dat).includes('Single download response 1'))throw Error('fixture ownership mismatch; leave data intact');
 const R=Java.use('app.morphe.extension.chmate.ReadingPosition'),field=R.class.getDeclaredField('SESSIONS');field.setAccessible(true);const sessions=Java.cast(field.get(null),Java.use('java.util.Map'));
 const entries=sessions.entrySet().toArray();for(let i=0;i<entries.length;i++){const e=Java.cast(entries[i],Java.use('java.util.Map$Entry')),s=Java.cast(e.getValue(),Java.use('app.morphe.extension.chmate.ReadingPosition$Session'));if(String(s.inspectedKey.value).includes('/android/1790000021/')){s.close();sessions.remove(e.getKey());}}
 const db=Java.use('android.database.sqlite.SQLiteDatabase').openDatabase(String(app.getDatabasePath('roidon.sqlite').getAbsolutePath()),null,0);try{db.execSQL("DELETE FROM bookmarks WHERE name='android' AND created=1790000021 AND title='Haiagaru latency verification'");}finally{db.close();}
 let hash='';const digest=Java.use('java.security.MessageDigest').getInstance('SHA-256').digest(Java.use('java.lang.String').$new('5ch/test/read.cgi/android/1790000021/').getBytes('UTF-8'));for(let i=0;i<digest.length;i++)hash+=((Number(digest[i])+256)%256).toString(16).padStart(2,'0');
 const position=F.$new(F.$new(app.getFilesDir(),'haiagaru-reading-position'),hash+'.json');if(position.exists()&&!read(position).includes('1790000021'))throw Error('position ownership mismatch');
 const deleted=[];for(const file of [dat,F.$new(root,'android_1790000021.idx'),marker,position])if(file.exists()){if(!file.delete())throw Error('fixture deletion failed');deleted.push(String(file.getName()));}
 resolve({version:pkg.slice(-3),ownedFixtureRemoved:deleted});
}catch(e){reject(Error(String(e.stack||e)));}})));}};
