// Ads-only verification packages. Local View fixtures only; no network or user data changes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.adsonly(191|226|242)$/.test(String(app.getPackageName())))throw Error('Ads-only app required');
 Java.classFactory.loader=app.getClassLoader();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),F=Java.use('android.widget.FrameLayout'),LP=Java.use('android.widget.FrameLayout$LayoutParams'),V=Java.use('android.view.View'),T=Java.use('android.widget.TextView');let n=0;
 function check(ok,msg){if(!ok)throw Error(msg);console.log('PASS '+msg);n++;}
 Java.scheduleOnMainThread(()=>{try{
  check(H.adsOnlyBuild()&&H.shouldHideAds(),'isolated runtime always hides advertisements');
  const ad=F.$new(app);ad.setLayoutParams(LP.$new(300,120));H.hideAdView(ad);check(ad.getVisibility()===8&&ad.getLayoutParams().height.value===0,'ad view collapsed');
  const screen=F.$new(app);screen.setId(0x01020002);screen.setLayoutParams(LP.$new(300,500));H.hideAdView(screen);check(screen.getVisibility()===0&&screen.getLayoutParams().height.value===500,'Activity content host protected');
  const popup=Java.registerClass({name:'app.morphe.extension.chmate.AdsOnlyPopupFixture',superClass:F,fields:{mActivePopup:'java.lang.Object'},methods:{$init:[{argumentTypes:['android.content.Context'],implementation(c){this.$super.$init(c);}}]}}).$new(app);
  popup.setLayoutParams(LP.$new(300,200));H.hideAdView(popup);check(popup.getVisibility()===0&&popup.getLayoutParams().height.value===200,'empty response popup host protected');
  const row=T.$new(app);row.setText.overload('java.lang.CharSequence').call(row,Java.use('java.lang.String').$new('ordinary response'));row.setLayoutParams(LP.$new(300,100));H.hideHomeBanner(row);check(row.getVisibility()===0&&String(row.getText())==='ordinary response','ordinary response not classified as home banner');
  check(H.retargetSelfIntent(null)===null,'null native intent preserved');
  console.log('ADS_ONLY_RUNTIME_COMPLETE '+n+' checks');
 }catch(e){console.log('FAIL '+e.stack);}});
});
