// Offline test: inject only an in-memory poster mapping, restore settings and map.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.resumefix(226|242)$/.test(String(app.getPackageName())))throw Error('Verification app required');
 Java.scheduleOnMainThread(()=>{
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),G=Java.use('app.morphe.extension.chmate.GifAutoFetch');
 const prefs=H.preferences(app),key='urlGifFetchMode',had=prefs.contains(key),saved=prefs.getInt(key,-1);
 const gif='https://example.invalid/haiagaru-test.gif?x=1',poster='http://127.0.0.1:1/haiagaru-test.jpg',jpg='https://example.invalid/still.jpg',video='https://example.invalid/movie.mp4';
 const field=G.class.getDeclaredField('POSTERS');field.setAccessible(true);const map=Java.cast(field.get(null),Java.use('java.util.Map')),previous=map.get(gif);
 let checks=0;function check(ok,s){if(!ok)throw Error(s);checks++;console.log('PASS '+s);}
 function project(input,body){return Array.from(G.project(app,body||'',Java.array('java.lang.String',input))).map(String);}
 try{
 map.put(gif,Java.use('java.lang.String').$new(poster));
 const expected=[[jpg,video,poster,gif],[jpg,video,poster],[jpg,video,gif],[jpg,video]];
 for(let mode=0;mode<4;mode++){
  prefs.edit().putInt(key,mode).commit();check(H.gifAutoFetchMode()===mode,'saved mode '+mode);
  const result=project([jpg,gif,video,poster],gif);check(JSON.stringify(result)===JSON.stringify(expected[mode]),'projection '+mode);
  check(JSON.stringify(project(result,gif))===JSON.stringify(result),'idempotent mode '+mode);
 }
 prefs.edit().putInt(key,0).commit();check(project([jpg,video],gif).includes(gif),'OFF to ON restores direct GIF');
 prefs.edit().putInt(key,3).commit();check(project([jpg,video],gif).length===2,'neither does not add media');
 const Profiles=Java.use('app.morphe.extension.chmate.SettingsProfiles'),JSONObject=Java.use('org.json.JSONObject');
 const root=JSONObject.$new('{"format":"haiagaru-settings","version":1,"settings":{"urlGifFetchMode":1}}');
 const cf=Profiles.class.getDeclaredField('RULES');cf.setAccessible(true);
 // catalog is populated by constructing the actual settings page below.
 const activity=H.toolbarActivity(null);check(!!activity,'activity available');
 const page=H.settingsCategory(activity,'MEDIA'),Group=Java.use('android.view.ViewGroup'),Spinner=Java.use('android.widget.Spinner');let gifChoice;
 function walk(v){if(Spinner.class.isInstance(v)){const s=Java.cast(v,Spinner);if(s.getCount()===4&&String(s.getItemAtPosition(2))==='GIFのみ')gifChoice=s;}if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}
 walk(page);check(!!gifChoice,'actual media settings contains four GIF choices');check(gifChoice.getSelectedItemPosition()===3,'GIF choice reflects saved mode');
 Profiles.catalog(activity);
 const values=Profiles.validate(root);check(values.containsKey(key),'settings sharing recognizes GIF mode');
 check(Profiles.exportData(app).getJSONObject('settings').getInt(key)===3,'export preserves GIF setting');
 console.log('GIF_AUTO_FETCH_COMPLETE '+checks+' checks; no network');
 }catch(e){console.log('FAIL '+e.stack);}finally{
 if(previous)map.put(gif,previous);else map.remove(gif);const e=prefs.edit();if(had)e.putInt(key,saved);else e.remove(key);e.commit();console.log('GIF_TEST_STATE_RESTORED');
 }
 });
});
