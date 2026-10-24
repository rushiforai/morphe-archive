// Scoped timing only; logs calls slower than 8 ms without response text/account data.
Java.perform(function(){
 const pkg=String(Java.use('android.app.ActivityThread').currentApplication().getPackageName());if(!pkg.endsWith('.resumefix242'))throw Error('Test only');
 const Clock=Java.use('android.os.SystemClock');
 const methods={EmojiFontFallback:['applyToRow','processText'],XPostPreview:['onBound','apply'],SiteCards:['onBound','decorate'],PosterHighlight:['decorate','apply'],ProgrammableNgController:['observeResponses'],XPostPreviewTouch:['onTouch']};
 for(const key of Object.keys(methods)){const type=Java.use('app.morphe.extension.chmate.'+key);for(const name of methods[key]){if(!type[name])continue;for(const method of type[name].overloads)method.implementation=function(){const t=Clock.uptimeMillis();try{return method.apply(this,arguments);}finally{const elapsed=Clock.uptimeMillis()-t;if(elapsed>=8)console.log('SLOW '+key+'.'+name+' '+elapsed+'ms');}};}}
 console.log('PROFILE_READY');
});
