package io.github.pengusto.patches.mihon.tests;

import android.app.Instrumentation;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import kotlin.coroutines.CoroutineContext;
import org.json.*;

/** Real installed-APK deletion boundary, filesystem and preference acceptance. */
public final class MihonRetention extends Instrumentation {
    private Bundle arguments;
    private Context target;
    private final JSONArray cases = new JSONArray();
    private File root;

    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); this.arguments=arguments; start(); }

    static Field field(Class<?> type, String name) throws Exception {
        while (type!=null) { try { Field f=type.getDeclaredField(name); f.setAccessible(true); return f; }
            catch(NoSuchFieldException e) { type=type.getSuperclass(); } }
        throw new NoSuchFieldException(name);
    }
    static Object get(Object owner, String name) throws Exception { return field(owner.getClass(),name).get(owner); }
    static void put(Object owner, String name, Object value) throws Exception { field(owner.getClass(),name).set(owner,value); }
    static Method method(Object owner, String name, int count) {
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())
            if(m.getName().equals(name)&&m.getParameterCount()==count){m.setAccessible(true);return m;}
        throw new IllegalArgumentException("Missing actual APK method: "+owner.getClass().getName()+"."+name+"/"+count);
    }
    static Object call(Object owner, String name, Object... args) throws Exception {
        try{return method(owner,name,args.length).invoke(owner,args);}catch(InvocationTargetException e){throw new RuntimeException(e.getCause());}
    }
    static Object provide(Object graph, String name) throws Exception { return call(get(graph,name+"Provider"),"invoke"); }
    static void preference(Object prefs, String name, Object value) throws Exception { call(get(prefs,name),"set",value); }
    static Object model(String name) throws Exception {
        Class<?> type=Class.forName(name+"$Companion");Method create=type.getDeclaredMethod("create");create.setAccessible(true);
        Object companion=Modifier.isStatic(create.getModifiers())?null:field(Class.forName(name),"Companion").get(null);
        return create.invoke(companion);
    }
    static Object checkResult(Object value) throws Exception {
        while(value!=null&&value.getClass().getName().equals("kotlin.Result"))value=get(value,"value");
        if(value!=null&&value.getClass().getName().equals("kotlin.Result$Failure"))throw new RuntimeException((Throwable)get(value,"exception"));
        return value;
    }
    static Object suspend(Object owner, String name, Object... values) throws Exception {
        Method m=method(owner,name,values.length+1);
        CoroutineContext context=(CoroutineContext)Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
        NativeContinuation.Completion completion=new NativeContinuation.Completion(context);
        NativeContinuation continuation=new NativeContinuation(completion);
        Object[] args=Arrays.copyOf(values,values.length+1);args[values.length]=continuation;
        Object result;
        try{result=m.invoke(owner,args);}catch(InvocationTargetException e){throw new RuntimeException(e.getCause());}
        if(result instanceof Enum<?> && ((Enum<?>)result).name().equals("COROUTINE_SUSPENDED"))result=continuation.await();
        return checkResult(result);
    }
    static String hash(byte[] data) throws Exception {
        StringBuilder s=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(data))s.append(String.format("%02x",b&255));return s.toString();
    }
    static byte[] read(InputStream in) throws Exception { try(in){return in.readAllBytes();} }

    private JSONObject runCase(Object manager,Object provider,Object prefs,Object source,String label,
            boolean read,boolean bookmark,boolean removeBookmarks,Set<String> exclusions,boolean retain) throws Exception {
        preference(prefs,"removeExcludeCategories",exclusions);
        preference(prefs,"removeBookmarkedChapters",removeBookmarks);
        Object manga=model("tachiyomi.domain.manga.model.Manga");
        put(manga,"id",9900000001L);put(manga,"source",9900000002L);put(manga,"title","Penguin "+label);
        Object chapter=model("tachiyomi.domain.chapter.model.Chapter");
        put(chapter,"id",9900000003L);put(chapter,"mangaId",9900000001L);put(chapter,"name","Chapter 1");
        put(chapter,"url","/penguin/chapter-1");put(chapter,"read",read);put(chapter,"bookmark",bookmark);
        Object mangaDir=suspend(provider,"getMangaDir-0E7RQCE$app",source,"Penguin "+label);
        Collection<?> names=(Collection<?>)call(provider,"getValidChapterDirNames","Chapter 1",null,"/penguin/chapter-1");
        Object chapterDir=call(mangaDir,"createDirectory",names.iterator().next());
        Uri directoryUri=(Uri)call(chapterDir,"getUri");
        if(!"file".equals(directoryUri.getScheme()))throw new AssertionError("Expected owned local fixture directory");
        File page=new File(directoryUri.getPath(),"001.png");
        Uri uri=Uri.fromFile(page);
        if(!new File(uri.getPath()).getCanonicalPath().startsWith(root.getCanonicalPath()+"/"))throw new AssertionError("Unowned file URI: "+uri);
        Bitmap bitmap=Bitmap.createBitmap(32,48,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.rgb(32,155,170));
        try(OutputStream out=target.getContentResolver().openOutputStream(uri)){if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,out))throw new AssertionError("Cannot write fixture PNG");}
        byte[] original=read(target.getContentResolver().openInputStream(uri));
        suspend(manager,"deleteChapters",Collections.singletonList(chapter),manga,source);
        boolean exists=page.exists();
        boolean unchanged=exists&&hash(original).equals(hash(read(target.getContentResolver().openInputStream(uri))));
        return new JSONObject().put("name",label).put("read",read).put("bookmark",bookmark)
            .put("exclude",new JSONArray(exclusions)).put("expectedRetained",retain).put("actualRetained",exists)
            .put("retainedBytesUnchanged",unchanged).put("passed",retain?(exists&&unchanged):!exists);
    }

    private void seedLibrary(Object graph) throws Exception {
        preference(call(graph,"getBasePreferences"),"shownOnboardingFlow",true);
        preference(call(graph,"getBasePreferences"),"downloadedOnly",true);
        Object library=call(graph,"getLibraryPreferences");preference(library,"downloadBadge",true);preference(library,"unreadBadge",false);
        File covers=target.getExternalFilesDir("covers/custom");if(covers==null)throw new AssertionError("Missing owned cover storage");covers.mkdirs();
        StringBuilder key=new StringBuilder();for(byte b:MessageDigest.getInstance("MD5").digest("9900000001".getBytes(StandardCharsets.UTF_8)))key.append(String.format("%02x",b&255));
        Bitmap bitmap=Bitmap.createBitmap(480,680,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(bitmap);canvas.drawColor(Color.rgb(17,83,105));
        Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);paint.setColor(Color.rgb(103,228,212));canvas.drawCircle(380,100,180,paint);
        paint.setColor(Color.WHITE);paint.setTextSize(48);paint.setFakeBoldText(true);canvas.drawText("PENGUIN",40,350,paint);canvas.drawText("OFFLINE",40,410,paint);
        paint.setTextSize(25);paint.setFakeBoldText(false);canvas.drawText("Synthetic test chapter",40,475,paint);
        try(FileOutputStream out=new FileOutputStream(new File(covers,key.toString()))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}
    }

    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            if(!"true".equals(arguments.getString("disposable"))||!"ranchu".equals(Build.HARDWARE))throw new AssertionError("Only the owned disposable emulator is allowed");
            target=getTargetContext();if(!target.getPackageName().equals("app.mihon"))throw new AssertionError("Wrong target");
            root=new File(target.getFilesDir(),"penguin-retention-fixture");root.mkdirs();
            File marker=new File(root,".owner");String owner="PenguinMihonRetentionFixture-2026-10-29";
            if(marker.exists()&&!new String(read(new FileInputStream(marker)),StandardCharsets.UTF_8).equals(owner))throw new AssertionError("Foreign fixture root");
            try(FileOutputStream out=new FileOutputStream(marker)){out.write(owner.getBytes(StandardCharsets.UTF_8));}
            Object app=target.getApplicationContext();Object graph=call(app,"getGraph");
            Object storagePrefs=provide(graph,"storagePreferences");
            preference(storagePrefs,"baseStorageDirectory",Uri.fromFile(root).toString());
            Object manager=provide(graph,"downloadManager");Object provider=get(manager,"provider");Object prefs=get(manager,"downloadPreferences");
            Object storage=get(provider,"storageManager");
            boolean ready=false;for(int i=0;i<40;i++){Object dir=call(storage,"getChildDirectory","downloads");if(dir!=null&&((Uri)call(dir,"getUri")).getPath().startsWith(root.getAbsolutePath()+"/")){ready=true;break;}Thread.sleep(100);}
            if(!ready)throw new AssertionError("Owned storage preference was not observed");
            Class<?> sourceType=Class.forName("eu.kanade.tachiyomi.source.Source");
            Object source=Proxy.newProxyInstance(sourceType.getClassLoader(),new Class<?>[]{sourceType},(proxy,m,args)->{
                if(m.getName().equals("getId"))return 9900000002L;
                if(m.getName().equals("getName"))return "Penguin synthetic source";
                if(m.getName().equals("getLang"))return "en";
                if(m.getName().equals("toString"))return "9900000002";
                if(m.getName().equals("hashCode"))return 9902;
                if(m.getName().equals("equals"))return proxy==args[0];
                throw new UnsupportedOperationException("Unexpected source call: "+m);
            });
            if(arguments.getString("mode").startsWith("ui-")) {
                seedLibrary(graph);
                JSONObject uiCase=runCase(manager,provider,prefs,source,"offline test",true,false,false,Set.of("0"),true);
                cases.put(uiCase);
                Object cache=get(manager,"cache");
                // Files were created by the real provider after the cache's initial scan.
                // Ask the real cache to rescan instead of forging its in-memory index.
                suspend(get(cache,"sourceManager"),"getOrStub",9900000002L);
                call(cache,"invalidateCache");
                boolean expected=uiCase.getBoolean("actualRetained"), observed=!expected;
                for(int i=0;i<100;i++) {
                    observed=(Boolean)call(cache,"isChapterDownloaded","Chapter 1",null,"/penguin/chapter-1","Penguin offline test",9900000002L);
                    Object job=get(cache,"renewalJob");
                    if(observed==expected && job!=null && (Boolean)call(job,"isCompleted"))break;
                    Thread.sleep(100);
                }
                if(observed!=expected)throw new AssertionError("Real cache did not observe fixture filesystem");
                uiCase.put("realCacheDownloaded",observed);
                // Let the app's own debounced disk-cache write finish before process exit.
                Thread.sleep(1300);
            } else {
            cases.put(runCase(manager,provider,prefs,source,"excluded-default-read",true,false,false,Set.of("0"),true));
            cases.put(runCase(manager,provider,prefs,source,"excluded-default-unread",false,false,false,Set.of("0"),false));
            cases.put(runCase(manager,provider,prefs,source,"no-exclusion-read",true,false,false,Set.of(),false));
            cases.put(runCase(manager,provider,prefs,source,"other-exclusion-read",true,false,false,Set.of("4"),false));
            cases.put(runCase(manager,provider,prefs,source,"protected-bookmark",true,true,false,Set.of(),true));
            cases.put(runCase(manager,provider,prefs,source,"removable-bookmark",true,true,true,Set.of(),false));
            }
            int failures=0;for(int i=0;i<cases.length();i++)if(!cases.getJSONObject(i).getBoolean("passed"))failures++;
            JSONObject report=new JSONObject().put("mode",arguments.getString("mode")).put("cases",cases).put("failures",failures)
                .put("apkSha256",hash(read(new FileInputStream(target.getApplicationInfo().sourceDir))));
            File file=new File(target.getCacheDir(),"penguin-retention-"+arguments.getString("mode")+".json");
            try(FileOutputStream out=new FileOutputStream(file)){out.write(report.toString(2).getBytes(StandardCharsets.UTF_8));}
            result.putString("stream",report.toString(2)+"\n");
            finish(failures==0?-1:0,result);
        } catch(Throwable failure) {
            StringWriter trace=new StringWriter();failure.printStackTrace(new PrintWriter(trace));result.putString("stream",trace.toString());finish(0,result);
        }
    }
}
