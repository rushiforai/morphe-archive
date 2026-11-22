Java.perform(()=>{
 const p='app.morphe.extension.chmate.', app=Java.use('android.app.ActivityThread').currentApplication();
 const pkg=String(app.getPackageName());
 if(!pkg.endsWith('.haiagaru.reporter242'))throw Error('Isolated reporter242 required');
 const route=Java.use(p+'HissiMenuCompatibility'), native=Java.use(p+'GigaFileDownload');
 const transfer=Java.use(p+'GigaFileTransfer');
 const Intent=Java.use('android.content.Intent'), Uri=Java.use('android.net.Uri');
 const settings=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const key='gigaFileLinkMode', had=settings.contains(key), old=settings.getInt(key,0);
 const url='https://117.gigafile.nu/1126-b9a8dbb5d47ff073cb515075ca4bcd6d9', token=url.split('/').pop();
 let checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 try{
   for (let mode=0;mode<=2;mode++){
      settings.edit().putInt(key,mode).commit();
      const i=Intent.$new('android.intent.action.VIEW',Uri.parse(url)).setPackage(pkg);
      route.prepareExternalIntent(i);
      if(mode===1)check(i.getComponent()===null && i.getPackage()===null,'external browser leaves an unpinned web intent');
      else {
          check(String(i.getComponent().getClassName())===p+'MediaUploadWebActivity','Gigafile native destination mode '+mode);
          check(i.getBooleanExtra('directGiga',false)===(mode===2),'download flag mode '+mode);
      }
   }
   const page=(lock)=>'<button onclick="download(\''+token+'\', '+lock+', false);">Get</button>';
   check(!native.protectedFile(page(false),token).booleanValue(),'public file has no password');
   check(native.protectedFile(page(true),token).booleanValue(),'protected file requires password');
   check(native.protectedFile(page(false),'some-other-file')===null,'unrelated download controls rejected');
   check(String(native.directUrl(url,''))==='https://117.gigafile.nu/download.php?file='+token,'same-origin download URL');
   check(native.directUrl(url,'a?b')===null,'invalid password rejected');
   check(native.directUrl(url.replace('117.gigafile.nu','117.gigafile.nu.example.org'),'')===null,'lookalike host rejected');
   const multipart=String(transfer.multipartHeader('boundary','fixture','fixture.txt',0,1,7));
   check(multipart.includes('name="lifetime"\r\n\r\n7')&&multipart.includes('name="file"; filename="blob"'),'upload request sends lifetime and file part');
   const host=String(transfer.$new().uploadHost());
   check(/^[0-9]{1,4}\.gigafile\.nu$/.test(host),'live Gigafile upload server resolved by native client');
   console.log('RESULT PASS '+checks+' native GigaFile routing and transfer checks');
 } finally { const edit=settings.edit();if(had)edit.putInt(key,old);else edit.remove(key);edit.commit(); }
});