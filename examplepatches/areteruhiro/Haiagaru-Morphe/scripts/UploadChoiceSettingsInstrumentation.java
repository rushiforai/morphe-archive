package app.haiagaru.tests.uploadchoice;

import android.app.*;
import android.content.*;
import android.graphics.Rect;
import android.os.*;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Exercises the chooser without invoking any upload or posting method. */
public class UploadChoiceSettingsInstrumentation extends Instrumentation {
    int checks;
    void check(boolean condition,String label){if(!condition)throw new AssertionError(label);checks++;}
    static Method method(Class<?> owner,String name,Class<?>...args)throws Exception{
        Method result=owner.getDeclaredMethod(name,args);result.setAccessible(true);return result;
    }
    static Field field(Class<?> owner,String name)throws Exception{Field f=owner.getDeclaredField(name);f.setAccessible(true);return f;}
    <T>T main(Callable<T> action)throws Exception{
        FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);
    }
    AccessibilityNodeInfo find(AccessibilityNodeInfo node,String label){
        if(node==null)return null;
        if(node.isVisibleToUser()&&(label.contentEquals(node.getText()==null?"":node.getText())||label.contentEquals(node.getHintText()==null?"":node.getHintText())))return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=find(node.getChild(i),label);if(found!=null)return found;}
        return null;
    }
    AccessibilityNodeInfo editable(AccessibilityNodeInfo node){
        if(node==null)return null;if(node.isVisibleToUser()&&node.isEditable())return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=editable(node.getChild(i));if(found!=null)return found;}return null;
    }
    void query(String text)throws Exception{
        AccessibilityNodeInfo input=editable(getUiAutomation().getRootInActiveWindow());
        check(input!=null,"search input available");Bundle args=new Bundle();args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,text);
        check(input.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,args),"set search query");
    }
    String tree(AccessibilityNodeInfo node){if(node==null)return "";String s="["+node.getClassName()+":"+node.getText()+":"+node.getContentDescription()+"]";for(int i=0;i<node.getChildCount();i++)s+=tree(node.getChild(i));return s;}
    AccessibilityNodeInfo findAll(String label){
        AccessibilityNodeInfo found=find(getUiAutomation().getRootInActiveWindow(),label);
        if(found!=null)return found;
        for(android.view.accessibility.AccessibilityWindowInfo window:getUiAutomation().getWindows()){
            found=find(window.getRoot(),label);if(found==null)found=findDescription(window.getRoot(),label);if(found!=null)return found;
        }
        return null;
    }
    void tap(String label)throws Exception{
        AccessibilityNodeInfo node=null;
        for(int i=0;i<70;i++){node=findAll(label);if(node!=null)break;Thread.sleep(100);}
        check(node!=null,"visible chooser control "+label);
        AccessibilityNodeInfo target=node;boolean clicked=false;
        for(int i=0;i<6&&target!=null;i++,target=target.getParent())if(target.performAction(AccessibilityNodeInfo.ACTION_CLICK)){clicked=true;break;}
        if(!clicked){
            Rect r=new Rect();node.getBoundsInScreen(r);long now=SystemClock.uptimeMillis();
            sendPointerSync(MotionEvent.obtain(now,now,MotionEvent.ACTION_DOWN,r.centerX(),r.centerY(),0));
            sendPointerSync(MotionEvent.obtain(now,now+50,MotionEvent.ACTION_UP,r.centerX(),r.centerY(),0));
        }
        Thread.sleep(150);
    }
    AccessibilityNodeInfo findDescription(AccessibilityNodeInfo node,String label){
        if(node==null)return null;
        if(node.isVisibleToUser()&&label.contentEquals(node.getContentDescription()==null?"":node.getContentDescription()))return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=findDescription(node.getChild(i),label);if(found!=null)return found;}
        return null;
    }
    void quietPreference(SharedPreferences prefs,String key,List<Runnable> restores){
        boolean had=prefs.contains(key),value=prefs.getBoolean(key,false);
        prefs.edit().putBoolean(key,true).commit();
        restores.add(()->{SharedPreferences.Editor edit=prefs.edit();if(had)edit.putBoolean(key,value);else edit.remove(key);edit.commit();});
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){
        Bundle result=new Bundle();Activity activity=null;ExecutorService worker=Executors.newSingleThreadExecutor();
        SharedPreferences feature=null,upload=null;boolean had=false,previous=false,hadImage=false,hadVideo=false;
        String beforeImage=null,beforeVideo=null;File image=null;
        List<Runnable> restores=new ArrayList<>();
        try{
            android.accessibilityservice.AccessibilityServiceInfo info=getUiAutomation().getServiceInfo();
            info.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;getUiAutomation().setServiceInfo(info);
            Context app=getTargetContext();check(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated application");
            ClassLoader loader=app.getClassLoader();String base="app.morphe.extension.chmate.";
            File recoveryRoot=new File(app.getCacheDir(),"display-recovery-fixture-"+System.nanoTime());recoveryRoot.mkdirs();
            File recoveryDb=new File(recoveryRoot,"fixture.sqlite");
            String recoveryPrefix="haiagaru.recovery-test."+System.nanoTime()+".";
            List<SharedPreferences> recoveryPrefs=new ArrayList<>();
            Context fixture=new ContextWrapper(app){
                @Override public File getDatabasePath(String name){return recoveryDb;}
                @Override public File getFilesDir(){return recoveryRoot;}
                @Override public SharedPreferences getSharedPreferences(String name,int mode){
                    SharedPreferences prefs=app.getSharedPreferences(recoveryPrefix+name,mode);
                    if(!recoveryPrefs.contains(prefs))recoveryPrefs.add(prefs);return prefs;
                }
            };
            try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(recoveryDb,null)){
                db.execSQL("CREATE TABLE bookmarks(name TEXT,created LONG,title TEXT,flag INTEGER,read_count INTEGER,bookmark_order INTEGER,UNIQUE(name,created))");
                db.execSQL("CREATE TABLE boards(name TEXT UNIQUE,flag INTEGER,board_order INTEGER)");
                db.execSQL("INSERT INTO bookmarks VALUES('fixture',123,'synthetic favorite',3,7,8),('fixture',456,'synthetic history',0,1,0)");
                db.execSQL("INSERT INTO boards VALUES('synthetic board',2,9)");
                Class<?> recovery=loader.loadClass(base+"HomeDisplayRecovery");
                SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(fixture);
                SharedPreferences fold=(SharedPreferences)method(loader.loadClass(base+"FeatureSwitches"),"prefs",Context.class).invoke(null,fixture);
                nativePrefs.edit().putBoolean("enableTabletHome2",true).putString("favoriteExcludeList","1,2,3").commit();
                fold.edit().putBoolean("automaticFoldMode",true).commit();
                String before=(String)method(recovery,"counts",Context.class).invoke(null,fixture);
                check(before.contains("お気に入り: 1件")&&before.contains("保存済みスレ情報: 2件"),"diagnostic counts actual favorite flag");
                check((Boolean)method(recovery,"phoneLayout",Context.class).invoke(null,fixture),"phone display recovery saves");
                check(!nativePrefs.getBoolean("enableTabletHome2",true)&&!nativePrefs.contains("favoriteExcludeList")&&!fold.getBoolean("automaticFoldMode",true),"only presentation reset");
                check(before.equals(method(recovery,"counts",Context.class).invoke(null,fixture)),"saved counts unchanged after recovery");
                check((Boolean)method(recovery,"phoneLayout",Context.class).invoke(null,fixture),"repeated recovery retains original snapshot");
                check((Boolean)method(recovery,"undo",Context.class).invoke(null,fixture),"previous display settings restored");
                check(nativePrefs.getBoolean("enableTabletHome2",false)&&nativePrefs.getString("favoriteExcludeList","").equals("1,2,3")&&!nativePrefs.contains("tabletHomeAlways2Pane")&&fold.getBoolean("automaticFoldMode",false),"exact values and absence restored");
                check(before.equals(method(recovery,"counts",Context.class).invoke(null,fixture)),"saved counts unchanged after undo");
                try(android.database.Cursor rows=db.rawQuery("SELECT title,flag FROM bookmarks ORDER BY rowid",null)){
                    check(rows.moveToFirst()&&rows.getString(0).equals("synthetic favorite")&&rows.getInt(1)==3&&rows.moveToNext()&&rows.getInt(1)==0,"database rows remain untouched");
                }
                Class<?> snapshots=loader.loadClass(base+"HaiagaruSyncSnapshot");
                byte[] saved=(byte[])method(snapshots,"capture",Context.class,int.class).invoke(null,fixture,1);
                org.json.JSONObject snapshot=new org.json.JSONObject(new String(saved,java.nio.charset.StandardCharsets.UTF_8));
                db.execSQL("UPDATE bookmarks SET flag=0,read_count=99 WHERE created=123");
                db.execSQL("UPDATE boards SET flag=0");
                method(snapshots,"restore",Context.class,org.json.JSONObject.class,int.class,boolean.class).invoke(null,fixture,snapshot,1,false);
                try(android.database.Cursor rows=db.rawQuery("SELECT flag,read_count FROM bookmarks WHERE created=123",null)){
                    check(rows.moveToFirst()&&rows.getInt(0)==3&&rows.getInt(1)==99,"saved favorite restored while newer read position retained");
                }
                try(android.database.Cursor rows=db.rawQuery("SELECT flag FROM boards",null)){
                    check(rows.moveToFirst()&&rows.getInt(0)==2,"saved board favorite restored");
                }
                File[] safetyCopies=new File(recoveryRoot,"haiagaru-sync-recovery").listFiles();
                check(safetyCopies!=null&&safetyCopies.length>0,"restore creates pre-restore safety copy");
            }finally{for(SharedPreferences prefs:recoveryPrefs)prefs.edit().clear().commit();recoveryDb.delete();}
            Class<?> hosts=loader.loadClass(base+"MediaUploadHosts");
            feature=(SharedPreferences)method(loader.loadClass(base+"FeatureSwitches"),"prefs",Context.class).invoke(null,app);
            had=feature.contains("chooseUploadHostEachTime");previous=feature.getBoolean("chooseUploadHostEachTime",false);
            upload=app.getSharedPreferences("haiagaru_upload_hosts",0);
            hadImage=upload.contains("imageHost");beforeImage=upload.getString("imageHost","native");
            hadVideo=upload.contains("videoHost");beforeVideo=upload.getString("videoHost","native");
            upload.edit().putString("imageHost","native").putString("videoHost","native").commit();
            feature.edit().putBoolean("chooseUploadHostEachTime",false).commit();
            activity=startActivitySync(new Intent().setClassName(app.getPackageName(),base+"ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            final Activity host=activity;
            EditText body=main(()->{
                EditText editor=new EditText(host);host.setContentView(editor);
                method(hosts,"bindEditor",Activity.class,EditText.class,String.class).invoke(null,host,editor,"https://egg.5ch.io/test/read.cgi/android/1794740000/");
                return editor;
            });
            Thread.sleep(250);
            image=File.createTempFile("haiagaru-chooser-fixture",".png",app.getCacheDir());
            try(FileOutputStream stream=new FileOutputStream(image)){stream.write(new byte[]{(byte)137,80,78,71,13,10,26,10});}
            Object[] arguments={image};Method handles=method(hosts,"handles",Object[].class);
            check(!(Boolean)handles.invoke(null,(Object)arguments),"OFF uses configured native route");
            feature.edit().putBoolean("chooseUploadHostEachTime",true).commit();
            Future<String> selected=worker.submit(()->{
                try{
                    boolean custom=(Boolean)handles.invoke(null,(Object)arguments);
                    ThreadLocal<?> local=(ThreadLocal<?>)field(hosts,"activeDestination").get(null);
                    Object value=local.get();String provider=value==null?"native":(String)field(value.getClass(),"image").get(value);
                    local.remove();return custom+":"+provider;
                }catch(InvocationTargetException e){throw new RuntimeException(e.getCause());}
            });
            tap("uguu.se");
            check(selected.get(10,TimeUnit.SECONDS).equals("true:uguu"),"selected provider reaches upload dispatch");
            check(upload.getString("imageHost","").equals("native"),"per-file choice does not change saved provider");
            Future<Boolean> canceled=worker.submit(()->{
                try{handles.invoke(null,(Object)arguments);return false;}
                catch(InvocationTargetException e){return e.getCause() instanceof IOException;}
            });
            tap("キャンセル");check(canceled.get(10,TimeUnit.SECONDS),"cancel aborts dispatch");
            SharedPreferences intro=app.getSharedPreferences("haiagaru.settings-introduction",0);
            quietPreference(intro,"automaticBackupOfferedV1",restores);
            intro.edit().remove("automaticBackupOfferedV1").commit();
            java.util.concurrent.atomic.AtomicInteger continued=new java.util.concurrent.atomic.AtomicInteger();
            Class<?> backupIntro=loader.loadClass(base+"SettingsBackupIntroduction");
            main(()->{method(backupIntro,"offer",Activity.class,Runnable.class).invoke(null,host,(Runnable)continued::incrementAndGet);return null;});
            tap("あとで");Thread.sleep(200);
            check(intro.getBoolean("automaticBackupOfferedV1",false)&&continued.get()==1,"backup advice shown once and skip continues");
            main(()->{method(backupIntro,"offer",Activity.class,Runnable.class).invoke(null,host,(Runnable)continued::incrementAndGet);return null;});
            check(continued.get()==2,"second settings open does not repeat advice");
            intro.edit().remove("automaticBackupOfferedV1").commit();
            SharedPreferences localBackup=app.getSharedPreferences("haiagaru.local-auto-backup",0);
            Map<String,?> backupBefore=new HashMap<>(localBackup.getAll());
            main(()->{method(backupIntro,"offer",Activity.class,Runnable.class).invoke(null,host,(Runnable)continued::incrementAndGet);return null;});
            tap("ローカル");
            boolean localShown=false;
            for(int i=0;i<60;i++){if(find(getUiAutomation().getRootInActiveWindow(),"ローカル自動バックアップを有効にする")!=null){localShown=true;break;}Thread.sleep(100);}
            check(localShown,"local recommendation opens periodic backup settings");
            check(backupBefore.equals(localBackup.getAll()),"choosing local does not enable backup or change options");
            tap("戻る");
            boolean mega=(Boolean)method(loader.loadClass(base+"HaiagaruMegaSync"),"enabled",Context.class).invoke(null,app);
            if(mega){
                ActivityMonitor monitor=addMonitor(base+"BackupSettingsActivity",new ActivityResult(Activity.RESULT_CANCELED,null),true);
                try{
                    intro.edit().remove("automaticBackupOfferedV1").commit();
                    main(()->{method(backupIntro,"offer",Activity.class,Runnable.class).invoke(null,host,(Runnable)continued::incrementAndGet);return null;});
                    tap("MEGA");
                    for(int i=0;i<40&&monitor.getHits()==0;i++)Thread.sleep(100);
                    check(monitor.getHits()==1,"MEGA recommendation opens existing backup setup without transfer");
                }finally{removeMonitor(monitor);}
            }
            main(()->{
                LinearLayout root=new LinearLayout(host);
                Class<?> section=loader.loadClass(base+"SettingsSection");
                LinearLayout parent=(LinearLayout)method(section,"add",LinearLayout.class,String.class,String.class,boolean.class)
                        .invoke(null,root,"親の設定","説明",true);
                TextView label=new TextView(host);label.setText("入力する項目名");parent.addView(label);
                EditText value=new EditText(host);value.setText("SECRET_VALUE_MUST_NOT_BE_COPIED");parent.addView(value);
                Class<?> copy=loader.loadClass(base+"SettingsCopy");
                String hierarchy=(String)method(copy,"hierarchy",String.class,ViewGroup.class).invoke(null,"Haiagaru設定 > テスト",root);
                check(hierarchy.contains("親の設定")&&hierarchy.contains("入力する項目名"),"collapsed descendants in hierarchy");
                check(!hierarchy.contains("SECRET_VALUE"),"setting values excluded");
                ClipboardManager clipboard=(ClipboardManager)host.getSystemService(Context.CLIPBOARD_SERVICE);
                ClipData oldClip=clipboard.getPrimaryClip();
                try{
                    method(copy,"copy",Context.class,String.class).invoke(null,host,hierarchy);
                    check(hierarchy.contentEquals(clipboard.getPrimaryClip().getItemAt(0).getText()),"hierarchy reaches clipboard");
                }finally{
                    if(oldClip!=null)clipboard.setPrimaryClip(oldClip);
                    else if(Build.VERSION.SDK_INT>=28)clipboard.clearPrimaryClip();
                }
                LinearLayout settings=new LinearLayout(host);
                method(loader.loadClass(base+"ThreadListThumbnailSettings"),"addSettings",LinearLayout.class,Activity.class).invoke(null,settings,host);
                boolean grouped=false;
                for(int i=0;i<settings.getChildCount();i++)if(section.isInstance(settings.getChildAt(i))){
                    ViewGroup child=(ViewGroup)settings.getChildAt(i);
                    if(!field(section,"title").get(child).equals("画像取得・表示の対象"))continue;
                    check(field(section,"collapsed").getBoolean(child),"target group initially collapsed");
                    String tree=(String)method(copy,"hierarchy",String.class,ViewGroup.class).invoke(null,"対象",child);
                    check(tree.contains("レート制限対象サイト")&&tree.contains("画像を表示しない板"),"both controls in one target group");grouped=true;
                }
                check(grouped,"unified target group exists");
                return null;
            });
            quietPreference(app.getSharedPreferences("haiagaru.settings-introduction",0),"supportOffered",restores);
            quietPreference(app.getSharedPreferences("haiagaru.personal-ng-submissions",0),"settingsConsentShownV1",restores);
            quietPreference(feature,"minimalSetupPromptV1",restores);
            main(()->{host.finish();return null;});
            activity=startActivitySync(new Intent().setClassName(app.getPackageName(),base+"HaiagaruSettingsActivity")
                    .putExtra("haiagaru.settings.search","画像取得・表示の対象").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            final Activity screen=activity;
            ClipboardManager clipboard=(ClipboardManager)app.getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData oldClip=main(clipboard::getPrimaryClip);
            try{
                AccessibilityNodeInfo label=null;
                for(int i=0;i<100;i++){
                    label=find(getUiAutomation().getRootInActiveWindow(),"画像取得のレート制限対象サイト");
                    if(label!=null)break;Thread.sleep(100);
                }
                check(label!=null,"real settings text label in search result");
                Rect bounds=new Rect();label.getBoundsInScreen(bounds);long now=SystemClock.uptimeMillis();
                sendPointerSync(MotionEvent.obtain(now,now,0,bounds.centerX(),bounds.centerY(),0));
                Thread.sleep(800);
                sendPointerSync(MotionEvent.obtain(now,SystemClock.uptimeMillis(),1,bounds.centerX(),bounds.centerY(),0));
                String copyLabel=null;
                for(int i=0;i<70;i++){
                    AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();
                    if(findAll("コピー")!=null){copyLabel="コピー";break;}
                    if(findAll("Copy")!=null){copyLabel="Copy";break;}
                    Thread.sleep(100);
                }
                if(copyLabel==null){
                    android.graphics.Bitmap screenShot=getUiAutomation().takeScreenshot();
                    if(screenShot!=null)try(FileOutputStream imageOut=new FileOutputStream(new File(app.getExternalFilesDir(null),"selection-debug.png"))){screenShot.compress(android.graphics.Bitmap.CompressFormat.PNG,100,imageOut);screenShot.recycle();}
                }
                check(copyLabel!=null,"long press opens native text selection toolbar; bounds="+bounds+" tree="+tree(getUiAutomation().getRootInActiveWindow()));
                tap(copyLabel);Thread.sleep(150);
                String copied=main(()->clipboard.getPrimaryClip().getItemAt(0).getText().toString());
                check(!copied.isEmpty()&&"画像取得のレート制限対象サイト".contains(copied),"selected setting wording reaches clipboard");
                tap("階層をコピー");
                String tree="";
                for(int i=0;i<100;i++){
                    tree=main(()->clipboard.hasPrimaryClip()?clipboard.getPrimaryClip().getItemAt(0).getText().toString():"");
                    if(tree.startsWith("Haiagaru設定\n"))break;
                    Thread.sleep(100);
                }
                check(tree.startsWith("Haiagaru設定\n")&&tree.contains("画像を表示しない板を選択"),"real top-bar hierarchy copy");
                tap("画像取得のレート制限対象サイト");
                tap("キャンセル");
                boolean settingsReturned=false;
                for(int i=0;i<60;i++){if(findAll("階層をコピー")!=null){settingsReturned=true;break;}Thread.sleep(100);}
                check(settingsReturned,"normal setting tap remains functional after selection");
                main(()->{screen.onBackPressed();return null;});
                for(int i=0;i<60&&findAll("最低限構成を選び直す")==null;i++)Thread.sleep(100);
                Thread.sleep(200);
                tap("スレッド");
                boolean scoped=false;
                for(int i=0;i<60;i++){if(findAll("このカテゴリ内を検索")!=null){scoped=true;break;}Thread.sleep(100);}
                check(scoped,"category has scoped search field");
                Rect searchBounds=new Rect();editable(getUiAutomation().getRootInActiveWindow()).getBoundsInScreen(searchBounds);
                check(searchBounds.height()/app.getResources().getDisplayMetrics().density<=52f,"search field is slim");
                query("MEGA");boolean empty=false;
                for(int i=0;i<80;i++){if(findAll("見つかりませんでした。短い言葉で探してみてください。")!=null){empty=true;break;}Thread.sleep(100);}
                check(empty&&findAll("MEGAバックアップ・同期")==null,"category excludes controls in other categories");
                query("読書位置");boolean positive=false;
                for(int i=0;i<80;i++){if(findAll("更新・画面切替時の読書位置を補助保存する")!=null){positive=true;break;}Thread.sleep(100);}
                check(positive,"category search includes collapsed descendants");
                main(()->{screen.onBackPressed();return null;});
                Thread.sleep(250);
                check(findAll("このカテゴリ内を検索")!=null,"back clears query while keeping category");
                main(()->{screen.onBackPressed();return null;});Thread.sleep(250);query("MEGA");
                boolean global=false;
                for(int i=0;i<100;i++){if(findAll("MEGAバックアップ・同期")!=null){global=true;break;}Thread.sleep(100);}
                check(global,"home search still finds other categories");
            }finally{
                main(()->{if(oldClip!=null)clipboard.setPrimaryClip(oldClip);else if(Build.VERSION.SDK_INT>=28)clipboard.clearPrimaryClip();return null;});
            }
            result.putString("result","PASS "+checks+" chooser/settings checks; uploads=0");
            finish(-1,result);
        }catch(Throwable error){result.putInt("checksPassed",checks);result.putString("result",android.util.Log.getStackTraceString(error));finish(0,result);}
        finally{
            worker.shutdownNow();
            if(feature!=null){SharedPreferences.Editor edit=feature.edit();if(had)edit.putBoolean("chooseUploadHostEachTime",previous);else edit.remove("chooseUploadHostEachTime");edit.commit();}
            if(upload!=null){SharedPreferences.Editor edit=upload.edit();if(hadImage)edit.putString("imageHost",beforeImage);else edit.remove("imageHost");if(hadVideo)edit.putString("videoHost",beforeVideo);else edit.remove("videoHost");edit.commit();}
            if(image!=null)image.delete();
            if(activity!=null){Activity close=activity;runOnMainSync(close::finish);}
            Collections.reverse(restores);for(Runnable restore:restores)restore.run();
        }
    }
}
