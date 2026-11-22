Java.perform(()=>{
 const App=Java.use('android.app.ActivityThread').currentApplication(), p='app.morphe.extension.chmate.';
 if(!String(App.getPackageName()).endsWith('.haiagaru.reporter242'))throw Error('Isolated reporter242 required');
 const hist=Java.use(p+'GigaFileUploadHistory'), File=Java.use('java.io.File');
 const dir=File.$new(App.getCacheDir(),'gigafile-fixture-'+Date.now()); if(!dir.mkdir())throw Error('fixture storage directory');
 const path=String(dir.getAbsolutePath());
 const CTX=Java.registerClass({name:'app.haiagaru.test.GigaHistoryContext'+Date.now(),
   superClass:Java.use('android.content.ContextWrapper'),methods:{$init:[{returnType:'void',argumentTypes:['android.content.Context'],implementation:function(c){this.$super.$init(c);}}],getNoBackupFilesDir:[{returnType:'java.io.File',argumentTypes:[],implementation:function(){return File.$new(path);}}]}});
 const context=CTX.$new(App);
 let checks=0;
 function check(ok, label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 const url='https://34.gigafile.nu/0901-123456789abcdefg';
 const secret='Q1w2';
 const valid={url,key:secret,name:'verification only.txt'};
 try{
   hist.save(context,JSON.stringify([valid]));
   hist.save(context,JSON.stringify([valid,{url:url+'?key=1',key:'bad'},{url:'https://evil.test/',key:'fake'}]));
   let loaded=hist.load(context);
   check(loaded.length()===1,'repeated scans and untrusted links do not add duplicates');
   check(String(loaded.getJSONObject(0).getString('key'))===secret,'saved deletion key survives storage reload');
   check(String(loaded.getJSONObject(0).getString('url'))===url,'share URL is stored separately without the key');
   hist.save(context,'invalid');
   check(hist.load(context).length()===1,'invalid page input does not overwrite history');
   check(File.$new(dir,'haiagaru-gigafile-uploads.json').isFile(),'history saved to the private non-backup file');
   console.log('RESULT PASS '+checks+' GigaFile history checks (fixture only)');
 } finally { for(let i of dir.listFiles()||[])i.delete(); dir.delete(); }
});