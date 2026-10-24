// Timing and Java types only: no post bodies, IDs, URLs or preferences are logged.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 const Clock=Java.use('android.os.SystemClock'),restores=[],stats={},types={};
 const targets={PosterHighlight:['decorate'],ExtraQuickFilters:['collect','filterCollected'],PopularNativeRows:['save'],EmojiFontFallback:['processText'],XPostPreview:['onBound']};
 for(const name of Object.keys(targets)){const type=Java.use('app.morphe.extension.chmate.'+name);
  for(const methodName of targets[name])for(const method of type[methodName].overloads){const key=name+'.'+methodName;stats[key]={calls:0,totalMs:0,maxMs:0};
   method.implementation=function(){const start=Clock.uptimeMillis();try{
    if(key==='PosterHighlight.decorate'&&arguments[0]){const n=String(arguments[0].getClass().getName());types[n]=(types[n]||0)+1;}
    return method.apply(this,arguments);
   }finally{const elapsed=Number(Clock.uptimeMillis()-start),s=stats[key];s.calls++;s.totalMs+=elapsed;s.maxMs=Math.max(s.maxMs,elapsed);}};
   restores.push(method);
  }
 }
 console.log('RENDER_PROFILE_READY');
 Java.scheduleOnMainThread(function(){Java.use('app.morphe.extension.chmate.ExtraQuickFilters').refreshPopularity();console.log('RENDER_PROFILE_REFRESHED');});
 setTimeout(()=>Java.perform(function(){for(const m of restores)m.implementation=null;console.log(JSON.stringify({stats,sourceTypes:types}));console.log('RENDER_PROFILE_HOOKS_REMOVED');}),10000);
});
