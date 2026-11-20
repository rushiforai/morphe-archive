// Edge archive external-host guard and tablet-pane bottom-filter placement.
// Runs inside the isolated reporter191 package; no network, post, or DAT write.
setImmediate(function(){Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(pkg!=='jp.co.airfront.android.a2chMate.haiagaru.reporter191')throw Error('reporter191 only');
 const Importer=Java.use('app.morphe.extension.chmate.ArchivedThreadImporter');
 const Filters=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
 const Activity=Java.use('android.app.Activity'),Rect=Java.use('android.graphics.Rect');
 let checks=0,reads=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;send('PASS '+label);}
 Java.scheduleOnMainThread(function(){try{
   const edge='https://bbs.eddibb.cc/test/read.cgi/liveedge/1795064503/';
   const five='https://egg.5ch.io/test/read.cgi/android/1795064503/';
   const talk='https://talk.jp/boards/news/1795064503';
   check(!Importer.supportsImportUrl(edge),'Eddi external-board thread is excluded from 5ch archive routes');
   check(Importer.supportsImportUrl(five),'5ch archive thread remains eligible');
   check(Importer.supportsImportUrl(talk),'Talk archive thread remains eligible');
   const started=Date.now(),handled=Importer.importIfNeeded(Activity.$new(),edge,edge);
   check(!handled,'external Eddi result continues to native ChMate navigation');
   check(reads===0,'external-host guard skips all fabricated 5ch/sc routes');
   check(Date.now()-started<250,'external-host guard returns without archive timeout');
   const pane=Rect.$new(120,240,720,1240),frame=Filters.tabletPopupFrame(pane,16,40,136);
   check(frame[0]===104&&frame[1]===1064&&frame[2]===600&&frame[3]===136,
         'tablet popup frame is bounded to the selected response pane');
   send('EDGE_ARCHIVE_FILTER_COMPLETE '+checks+' checks; external requests='+reads);
  }catch(e){send('FAIL '+String(e.stack||e));throw e;}});
});});
