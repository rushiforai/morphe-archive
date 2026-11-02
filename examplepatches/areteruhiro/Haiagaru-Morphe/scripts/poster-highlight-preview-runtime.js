// Isolated verification packages only; restore original highlight preferences.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const P='app.morphe.extension.chmate.',app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))){reject('verification app required');return;}
 const H=Java.use(P+'PosterHighlight'),prefs=app.getSharedPreferences('haiagaru.poster-highlight',0),backup={};
 for(const k of ['rules','color','enabled'])backup[k]={had:prefs.contains(k),value:k==='rules'?prefs.getString(k,'[]'):k==='enabled'?prefs.getBoolean(k,false):prefs.getInt(k,0)};
 const Str=Java.use('java.lang.String'),Group=Java.use('android.view.ViewGroup'),Spinner=Java.use('android.widget.Spinner'),Text=Java.use('android.widget.TextView');let dialog,checks=0;
 function check(ok,msg){if(!ok)throw Error(msg);checks++;}
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function reload(){const m=H.class.getDeclaredMethod('reload',Java.array('java.lang.Class',[]));m.setAccessible(true);m.invoke(null,Java.array('java.lang.Object',[]));}
 function walk(v,out){out.push(v);if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i),out);}return out;}
 function pick(s,i){s.setSelection(i);s.getOnItemSelectedListener().onItemSelected(s,null,i,s.getItemIdAtPosition(i));}
 try{
 const rules=[{kind:1,scope:2,target:'',value:'PreviewFixtureA',enabled:true,colorIndex:-1},{kind:1,scope:2,target:'',value:'PreviewFixtureB',enabled:false,colorIndex:3}];
 prefs.edit().putInt('color',0).putBoolean('enabled',false).putString('rules',JSON.stringify(rules)).commit();reload();
 Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='投稿者の強調')d.dismiss();},onComplete(){}});
 H.showSettings(Java.use(P+'Haiagaru').toolbarActivity(null));
 Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='投稿者の強調')dialog=Java.retain(d);},onComplete(){}});
 check(!!dialog,'dialog exists');const root=Java.cast(field(field(dialog,'spec'),'view'),Group),all=walk(root,[]),samples=all.filter(v=>v.getTag(0x48690d01)!==null).map(v=>Java.cast(v,Text)),selectors=all.filter(v=>Spinner.class.isInstance(v)).map(v=>Java.cast(v,Spinner));
 check(samples.length===3,'common and individual previews');check(selectors.length===3,'three selectors');
 function color(i){return Number(String(samples[i].getTag(0x48690d01)));}
 check(color(0)===0x55ffc107&&color(1)===color(0),'initial inherited color');check(color(2)===0x55ef5350,'individual red');
 function rows(){return Java.use(P+'SettingsFormKt').settingsRows(root);}
 function previewRows(){const a=rows(),out=[];for(let i=0;i<a.size();i++){const row=Java.cast(a.get(i),Java.use(P+'BoundSetting'));if(row.getPreviewColor()!==null)out.push(row);}return out;}
 check(previewRows().length===3,'settings adapter retains previews rather than folding into help');
 const before=previewRows()[0];pick(selectors[0],1);check(color(0)===0x5542a5f5&&color(1)===color(0),'blue updates inherited');check(color(2)===0x55ef5350,'custom color unchanged');check(!before.equals(previewRows()[0]),'preview state changes row equality');
 pick(selectors[1],3);check(color(1)===0x5566bb6a,'individual green');pick(selectors[0],6);check(color(0)===0x55ab47bc&&color(1)===0x5566bb6a,'custom stops inheritance');
 pick(selectors[1],0);check(color(1)===color(0),'inherit selection shows common immediately');pick(selectors[0],11);check(color(1)===0x559e9e9e,'inherited follows later common update');
 const saved=JSON.parse(String(prefs.getString('rules','[]')));check(saved[0].colorIndex===-1&&saved[1].colorIndex===3,'save semantics retained');check(!prefs.getBoolean('enabled',true)&&saved[1].enabled===false,'enabled flags retained');
 dialog.dismiss();
 const U=Java.use('sun.misc.Unsafe'),uf=U.class.getDeclaredField('theUnsafe');uf.setAccessible(true);const I=Java.use(P+'PosterHighlight$Identity'),identity=Java.cast(uf.get(null),U).allocateInstance(I.class),posterField=identity.getClass().getDeclaredField('poster');posterField.setAccessible(true);posterField.set(identity,Java.use(P+'PosterHighlightRules$Poster').$new('PreviewFixtureA','',''));
 const edit=H.class.getDeclaredMethod('edit',Java.array('java.lang.Class',[Java.use('android.app.Activity').class,I.class,Java.use('java.lang.Integer').TYPE.value]));edit.setAccessible(true);edit.invoke(null,Java.array('java.lang.Object',[Java.use(P+'Haiagaru').toolbarActivity(null),identity,Java.use('java.lang.Integer').$new(1)]));
 Java.choose(P+'HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(field(field(d,'spec'),'title'))==='IDで強調')dialog=Java.retain(d);},onComplete(){}});
 const editAll=walk(Java.cast(field(field(dialog,'spec'),'view'),Group),[]),editSamples=editAll.filter(v=>v.getTag(0x48690d01)!==null),editSelectors=editAll.filter(v=>Spinner.class.isInstance(v)).map(v=>Java.cast(v,Spinner));
 check(editSamples.length===1&&editSelectors.length===2,'registration screen preview');pick(editSelectors[1],2);check(Number(String(editSamples[0].getTag(0x48690d01)))===0x5542a5f5,'registration selection updates sample');check(prefs.getString('rules','[]').toString()===JSON.stringify(saved),'registration preview does not save a rule');
 resolve({checks,previewCount:3,registrationPreview:true});
 }catch(e){console.log('PREVIEW_TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}finally{if(dialog)dialog.dismiss();const e=prefs.edit();for(const k of Object.keys(backup)){const b=backup[k];if(!b.had)e.remove(k);else if(k==='rules')e.putString(k,b.value);else if(k==='enabled')e.putBoolean(k,b.value);else e.putInt(k,b.value);}e.commit();reload();}
})));}};
