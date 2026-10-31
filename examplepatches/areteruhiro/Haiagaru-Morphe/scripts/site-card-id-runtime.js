// URL enumeration only: never requests metadata or modifies any thread/preferences.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 try{const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('verification package required');
 const P='app.morphe.extension.chmate.',URLs=Java.use(P+'PreviewUrls'),Cards=Java.use(P+'SiteCards'),S=Java.use('java.lang.String'),m=Cards.class.getDeclaredMethod('urls',Java.array('java.lang.Class',[Java.use('java.lang.CharSequence').class]));m.setAccessible(true);let checks=0;function check(v,s){if(!v)throw Error(s);checks++;}function cards(text){return Java.cast(m.invoke(null,Java.array('java.lang.Object',[Java.use('android.text.SpannableStringBuilder').$new(S.$new(text))])),Java.use('java.util.List'));}
 const ids=['eRNd.ru1f','ID:eRNd.ru1f','ID: eRNd.ru1f','ID：eRNd.ru1f','ID: Abcd.efgh','ID：Abcd.efgh','ID : Abcd.efgh','ID:\tAbcd.efgh','ID:Abcd.efgh/0'];
 for(const id of ids){check(URLs.extract(S.$new(id),8).isEmpty(),'ID URL rejected');check(cards(id).isEmpty(),'ID never enters card lookup');}
 const actual='101 エッヂの名無し 2026/10/31(土) 19:50:16.569 ID:eRNd.ru1f\n>>55\n誰か一人にほかの2人\n勿論';check(cards(actual).isEmpty(),'reported response no site card');
 let result=cards('ID: Abcd.efgh\nhttps://example.org/article');check(result.size()===1&&String(result.get(0))==='https://example.org/article','real URL preserved after ID');result=cards('ID：Abcd.efgh example.org/page');check(result.size()===1&&String(result.get(0))==='https://example.org/page','subsequent bare domain preserved');
 for(const prefix of ['https://','ttps://','tps://','ttp://','tp://','//']){result=cards('ID: '+prefix+'example.org/page');check(result.size()===1,'explicit abbreviated URL retained');}
 resolve({version:pkg.slice(-3),checks,noMetadataRequests:true,reportedIdRejected:true});
 }catch(e){reject(Error(String(e.stack||e)));}
})));}};