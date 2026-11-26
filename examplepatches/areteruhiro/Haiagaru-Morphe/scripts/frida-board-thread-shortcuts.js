rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>{
 let p,had,old;
 try{
  const H=Java.use('app.morphe.extension.chmate.Haiagaru'),c=H.applicationContextForExtension();
  const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-board-picker-probe.dex',c.getCacheDir().getAbsolutePath(),null,H.class.getClassLoader());
  const f=Java.ClassFactory.get(loader),P=f.use('app.morphe.extension.chmate.BoardUrlPickerProbe'),E=f.use('app.morphe.extension.chmate.BoardUrlPickerProbe$Entry');
  p=c.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);had=p.contains('boardUrlShortcuts');old=p.getString('boardUrlShortcuts','[]');let checks=0;
  function check(ok,label){if(!ok)throw Error(label);checks++;}
  for(let url of ['https://mevius.5ch.io/test/read.cgi/train/1794303138/128-','https://jbbs.shitaraba.net/bbs/read.cgi/computer/45040/1794743327/','https://talk.jp/boards/tvd/1753284221/7','https://may.2chan.net/b/res/1449065353.htm']){
   check(P.threadUrl(url),'thread URL');check(String(P.destination(c,url,true).getComponent().getClassName()).endsWith('jp.syoboi.a2chMate.activity.ResListActivity'),'thread direct route');
  }
  let web='https://example.com/about?q=hello#part';check(!P.threadUrl(web),'page distinction');
  check(String(P.destination(c,web,true).getComponent().getClassName()).endsWith('WebViewActivity'),'web route');
  check(String(P.destination(c,'https://mevius.5ch.io/train/',false).getComponent().getClassName()).endsWith('jp.syoboi.a2chMate.activity.ThreadListActivity'),'board native route');
  check(!P.validSaved('[{"name":"bad","url":"javascript:alert(1)"}]'),'reject executable URL');check(!P.validSaved('broken'),'reject corrupt backup');
  const manual=P.manualEntry('一致しない板','https://unlisted.example.org/bbs/',true);
  check(manual.board&&manual.url.includes('unlisted.example.org'),'manual board can be saved without a database match');
  check(String(P.destination(c,manual.url,!manual.board).getComponent().getClassName()).endsWith('jp.syoboi.a2chMate.activity.ThreadListActivity'),'manual board opens native board list');
  let rejected=false;try{P.manualEntry('thread','https://mevius.5ch.io/test/read.cgi/train/1794303138/',true);}catch(e){rejected=true;}
  check(rejected,'thread URL cannot be saved as board');
  p.edit().remove('boardUrlShortcuts').commit();check(P.custom(c).size()===0,'initial list empty');
  let boardRows=Java.use('java.util.ArrayList').$new();boardRows.add(E.$new.overload('java.lang.String','java.lang.String','boolean','boolean').call(E,'手動追加の板','https://mevius.5ch.io/train/',true,true));
  P.store(c,boardRows);check(P.custom(c).size()===1&&String(p.getString('boardUrlShortcuts','')).includes('"board":true'),'only selected board persisted');
  let rows=Java.use('java.util.ArrayList').$new();rows.add(E.$new('テストスレ','https://mevius.5ch.io/test/read.cgi/train/1794303138/',true));P.store(c,rows);check(P.custom(c).size()===1,'shortcut persisted');
  rows.clear();rows.add(E.$new('名前変更',web,true));P.store(c,rows);check(String(p.getString('boardUrlShortcuts','')).includes('名前変更'),'editing persisted');
  rows.clear();P.store(c,rows);check(P.custom(c).size()===0,'deletion persisted');resolve({passed:checks,openedExternalLinks:false});
 }catch(e){resolve({error:String(e)});}finally{if(p){let edit=p.edit();if(had)edit.putString('boardUrlShortcuts',old);else edit.remove('boardUrlShortcuts');edit.commit();}}
}));
