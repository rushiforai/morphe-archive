// Real response fragment and controls. No NG writes, posting, DAT removal or external requests.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),F=Java.use('app.morphe.extension.chmate.FilterPosition');
 const V=Java.use('android.view.View'),Group=Java.use('android.view.ViewGroup'),Toggle=Java.use('android.widget.ToggleButton');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['persistentBottomQuickFilters','bottomQuickFilterPanel','compactQuickFilters','quickFilterExtras','quickFilterCounts','quickFilterAA','quickFilterMine','quickFilterReplies'],old=prefs.getAll();
 let fragment,activity,root,list,baseline,baselineMargin,baselineHeight,panel,checks=0,failed=false,aa,aaChanged=false,popup,adapter,originalExtra;
 const Margins=Java.use('android.view.ViewGroup$MarginLayoutParams');
 function margin(){return Java.cast(list.getLayoutParams(),Margins).bottomMargin.value;}
 const Popup=Java.use('android.widget.PopupWindow');
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function getPanel(){const found=activity.getWindow().getDecorView().findViewWithTag('haiagaru.persistentBottomFilters');return found?Java.cast(found,V):null;}
 function update(values){const edit=prefs.edit();Object.keys(values).forEach(k=>values[k]===null?edit.remove(k):edit.putBoolean(k,values[k]));edit.commit();E.updateOptions(activity);}
 function controls(view){const out=[];function walk(v){if(Toggle.class.isInstance(v))out.push(Java.retain(Java.cast(v,Toggle)));if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let n=0;n<g.getChildCount();n++)walk(g.getChildAt(n));}}walk(view);return out;}
 function restore(){if(popup&&popup.isShowing())popup.dismiss();const edit=prefs.edit();keys.forEach(k=>old.containsKey(k)?edit.putBoolean(k,Java.cast(old.get(k),Java.use('java.lang.Boolean')).booleanValue()):edit.remove(k));edit.commit();E.updateOptions(activity);if(adapter&&originalExtra){const on=E.selected(adapter);for(let n=4;n<7;n++)if(on[n]!==originalExtra[n-4])E.toggle.overload('java.lang.Object','int','boolean').call(E,adapter,n,true);}}
 function findPopup(next){setTimeout(()=>Java.perform(()=>Java.choose(Popup.$className,{onMatch(p){if(p.isShowing())popup=Java.retain(p);},onComplete(){main(next);}})),100);}
 function main(fn,delay){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(failed)return;try{fn();}catch(e){failed=true;console.log('FAIL '+e.stack);if(activity)restore();}})),delay||800);}
 function begin(){main(()=>{
  check(!!fragment,'visible response fragment');activity=fragment.getActivity();root=fragment.getView();list=F.findList(root);check(!!list,'native response list');adapter=Java.retain(E.adapter(fragment));const selected=E.selected(adapter);originalExtra=[selected[4],selected[5],selected[6]];
  update({persistentBottomQuickFilters:null,bottomQuickFilterPanel:false});
  main(()=>{baseline=list.getPaddingBottom();baselineMargin=margin();baselineHeight=list.getHeight();check(getPanel()===null,'default OFF has no pinned panel');
   update({persistentBottomQuickFilters:true,bottomQuickFilterPanel:false,quickFilterExtras:true,quickFilterCounts:false,quickFilterAA:true,quickFilterMine:true,quickFilterReplies:true});
   main(()=>{panel=Java.retain(getPanel());check(!!panel&&panel.isShown(),'ON displays without opening transient bottom panel');
    const area=Java.use('android.graphics.Rect').$new(),rect=Java.use('android.graphics.Rect').$new();check(list.getGlobalVisibleRect(area)&&panel.getGlobalVisibleRect(rect),'panel and list have visible bounds');
    check(rect.left.value>=area.left.value&&rect.right.value<=area.right.value,'panel stays in its own thread pane');
    check(rect.top.value===area.bottom.value&&rect.bottom.value===area.bottom.value+panel.getHeight(),'panel is below real response viewport and above native bottom toolbar');
    check(list.getPaddingBottom()===baseline&&margin()===baselineMargin+panel.getHeight()&&list.getHeight()===baselineHeight-panel.getHeight(),'native viewport height reserves panel space without changing padding');
    const buttons=controls(panel);check(buttons.filter(b=>b.getVisibility()===0).length===7,'all seven enabled filters visible');
    check(!buttons.some(b=>String(b.getText()).includes('(')),'counts remain OFF');
    aa=buttons.find(b=>String(b.getText())==='AA');check(!!aa,'AA button found');const before=aa.isChecked();aa.performClick();aaChanged=true;
    main(()=>{check(aa.isChecked()!==before,'filter toggles immediately');aa.performClick();aaChanged=false;
     main(()=>{check(aa.isChecked()===before,'filter selection restored');
      check(getPanel()!==null,'filter action does not close pinned panel');
      check(margin()===baselineMargin+panel.getHeight(),'no cumulative viewport reservation after refresh');
      update({compactQuickFilters:true});main(()=>{check(getPanel()!==null&&getPanel().isShown(),'top filter hidden does not hide bottom');
       update({compactQuickFilters:false,bottomQuickFilterPanel:true});main(()=>{check(getPanel()!==null,'top filter coexistence and transient option independent');
        update({quickFilterAA:false,quickFilterMine:false,quickFilterReplies:false});main(()=>{check(controls(getPanel()).filter(b=>b.getVisibility()===0).length===4,'individual extra-filter visibility honored');
         update({persistentBottomQuickFilters:false});main(()=>{check(getPanel()===null,'OFF removes pinned panel immediately');check(list.getPaddingBottom()===baseline&&margin()===baselineMargin&&list.getHeight()===baselineHeight,'OFF restores native viewport and padding');
          check(E.open(fragment),'transient bottom filter still opens');findPopup(()=>{check(!!popup&&popup.isShowing(),'transient popup remains supported');popup.dismiss();
           main(()=>{check(!popup.isShowing(),'transient popup dismisses');restore();console.log('PERSISTENT_BOTTOM_FILTER_COMPLETE '+checks+' checks; preferences and filter restored; no data writes');});
          });
         });
        });
       });
      });
     });
    });
   },1600);
  });
 });}
 const type=pkg.endsWith('191')?'o.pa':'jp.syoboi.a2chMate.ui.reslist.ResListFragment';
 Java.choose(type,{onMatch(f){const view=f.getView(),rect=Java.use('android.graphics.Rect').$new();if(f.isResumed()&&view&&view.isAttachedToWindow()&&view.getGlobalVisibleRect(rect)&&rect.width()>200)fragment=Java.retain(f);},onComplete(){begin();}});
});
