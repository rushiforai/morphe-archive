/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.feeder.tests;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.*;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageView;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.zip.GZIPOutputStream;

/** Actual original/patched reader and loader, synthetic articles on an owned AVD. */
public final class FeederAcceptance extends Instrumentation {
    private static final String PKG = "com.nononsenseapps.feeder";
    private static final String EXT = "io.github.pengusto.patches.extension.feeder.";
    private Context context;
    private volatile Activity activity;
    private Bundle args;
    private int checks;
    private String stage = "setup";
    private interface Work { void run() throws Exception; }
    private interface Condition { boolean get() throws Exception; }
    @Override public void onCreate(Bundle args) {
        super.onCreate(args); this.args = args;
        if (!"ranchu".equals(Build.HARDWARE) || !"true".equals(args.getString("disposable")))
            throw new IllegalStateException("Explicit disposable emulator required");
        start();
    }
    private void check(boolean ok, String message) { if (!ok) throw new AssertionError(stage+": "+message); checks++; }
    private void main(Work work) throws Exception {
        Throwable[] failure = {null}; runOnMainSync(() -> { try {work.run();} catch(Throwable t){failure[0]=t;} });
        if(failure[0]!=null) throw new Exception(stage,failure[0]);
    }
    private void await(Condition condition, String message) throws Exception {
        long until=SystemClock.uptimeMillis()+20000;
        while(!condition.get() && SystemClock.uptimeMillis()<until) Thread.sleep(100);
        check(condition.get(),message);
    }
    private Class<?> app(String name) throws Exception { return Class.forName(name,true,context.getClassLoader()); }
    private SQLiteDatabase db() { return SQLiteDatabase.openDatabase(context.getDatabasePath("rssDatabase").getPath(),null,SQLiteDatabase.OPEN_READWRITE); }
    private void seed() throws Exception {
        // Use the original app to initialize its own schema first.
        startActivitySync(context.getPackageManager().getLaunchIntentForPackage(PKG).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        await(() -> context.getDatabasePath("rssDatabase").isFile(),"Native database initialized");
        try(SQLiteDatabase db=db()) {
            try(Cursor c=db.rawQuery("SELECT count(*) FROM feeds WHERE id<>391 AND NOT (id=1 AND title='Feeder News' AND url='https://news.nononsenseapps.com/index.atom')",null)) {
                check(c.moveToFirst()&&c.getInt(0)==0,"Refuse non-fixture subscriptions");
            }
            try(Cursor c=db.rawQuery("SELECT count(*) FROM feed_items WHERE (feed_id<>1 AND (id NOT BETWEEN 391001 AND 391011 OR feed_id<>391)) OR feed_id IS NULL",null)) {
                check(c.moveToFirst()&&c.getInt(0)==0,"Refuse non-fixture articles");
            }
            if (android.database.DatabaseUtils.longForQuery(db,"SELECT count(*) FROM feeds WHERE id=391",null)==0) {
                ContentValues feed=defaults(db,"feeds"); feed.put("id",391);feed.put("title","Penguin391 offline");
                feed.put("url","https://penguin391.invalid/feed");feed.put("open_articles_with","");
                feed.put("last_sync",System.currentTimeMillis()); db.insertOrThrow("feeds",null,feed);
            }
            String png=picture(Bitmap.CompressFormat.PNG), jpeg=picture(Bitmap.CompressFormat.JPEG), webp=picture(Bitmap.CompressFormat.WEBP_LOSSLESS);
            File localImage=new File(context.getFilesDir(),"penguin391-source.png");
            try(OutputStream out=new FileOutputStream(localImage)){out.write(android.util.Base64.decode(png.substring(png.indexOf(',')+1),android.util.Base64.DEFAULT));}
            String fileUri=localImage.toURI().toString();
            String[] bodies={
                "<img src='"+png+"' width='1600' height='1000' alt='Penguin391 diagram'>",
                "<a href='#anchor'><img src='"+png+"' alt='Penguin391 linked'></a><p>Before anchor</p>"+"<p>Scroll context</p>".repeat(30)+"<p id='anchor'>Penguin391 anchor target</p>",
                "<img src='data:image/png;base64,Zm9v' alt='Penguin391 broken'>",
                "<img src='data:image/png;base64,Zm9v' srcset='"+fileUri+" 1600w' alt='Penguin391 srcset'>",
                "<table><tr><td><img src='"+png+"' alt='Penguin391 table'></td></tr></table>",
                "<img src='data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==' alt='Penguin391 gif'>",
                "<img src='"+jpeg+"' alt='Penguin391 jpeg'>",
                "<img src='"+webp+"' alt='Penguin391 webp'>",
                "<img src='"+png+"'>",
                "<p><a href='#anchor'>Native text link</a></p>"+"<p>Text link scroll context</p>".repeat(30)+"<p id='anchor'>Text target</p>",
                "<p>Penguin391 header article</p>"
            };
            File articles=new File(context.getFilesDir(),"articles");check(articles.exists()||articles.mkdirs(),"Article directory");
            for(int i=1;i<=bodies.length;i++) {
                long id=391000+i;
                if(android.database.DatabaseUtils.longForQuery(db,"SELECT count(*) FROM feed_items WHERE id=?",new String[]{""+id})==0) {
                    ContentValues item=defaults(db,"feed_items");item.put("id",id);item.put("feed_id",391);
                    item.put("guid","penguin391-"+i);item.put("title","Penguin391 article "+i);item.put("plain_title","Penguin391 article "+i);
                    item.put("link","https://penguin391.invalid/article/"+i);item.put("pub_date","2026-10-24T00:00:00Z");
                    if(i==11)item.put("image_url","{\"type\":\"MediaImage\",\"url\":\""+fileUri+"\",\"width\":1600,\"height\":1000}");
                    item.put("bookmarked",1);item.put("notified",1);db.insertOrThrow("feed_items",null,item);
                }
                File file=new File(articles,id+".txt.gz");
                if(!file.exists()||i==4||i==10)try(OutputStream out=new GZIPOutputStream(new FileOutputStream(file))) {
                    out.write(("<p>Penguin391 start</p>"+bodies[i-1]+"<p>Penguin391 end</p>").getBytes(java.nio.charset.StandardCharsets.UTF_8));
                }
            }
        }
        context.getSharedPreferences("penguin391-fixture",0).edit().putString("marker","preserve-settings-and-subscriptions").commit();
    }
    private ContentValues defaults(SQLiteDatabase db,String table) {
        ContentValues values=new ContentValues();try(Cursor c=db.rawQuery("PRAGMA table_info("+table+")",null)) {
            while(c.moveToNext())if(c.getInt(3)!=0) {
                if(c.getString(2).equals("TEXT"))values.put(c.getString(1),"");else values.put(c.getString(1),0);
            }
        }return values;
    }
    private String picture(Bitmap.CompressFormat format) throws Exception {
        Bitmap b=Bitmap.createBitmap(1600,1000,Bitmap.Config.ARGB_8888); Canvas c=new Canvas(b);c.drawColor(Color.WHITE);
        Paint p=new Paint(Paint.ANTI_ALIAS_FLAG); p.setColor(Color.rgb(0,100,160));c.drawRect(0,0,1600,180,p);
        p.setColor(Color.WHITE);p.setTextSize(64);c.drawText("Penguin391 zoom test",60,115,p);
        for(int i=0;i<8;i++){p.setColor(Color.rgb(20+i*25,130,180));c.drawRect(100+i*180,300,220+i*180,750,p);}
        p.setColor(Color.BLACK);p.setTextSize(22);c.drawText("Small detail: 0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ",100,850,p);
        ByteArrayOutputStream out=new ByteArrayOutputStream();b.compress(format,95,out);b.recycle();
        String mime=format==Bitmap.CompressFormat.PNG?"png":format==Bitmap.CompressFormat.JPEG?"jpeg":"webp";
        return "data:image/"+mime+";base64,"+android.util.Base64.encodeToString(out.toByteArray(),android.util.Base64.NO_WRAP);
    }
    private void open(int index,String alt) throws Exception {
        stage="article "+index;
        Intent intent=new Intent(Intent.ACTION_VIEW,Uri.parse("https://feederapp.nononsenseapps.com/article/"+(391000+index)))
            .setClassName(PKG,"com.nononsenseapps.feeder.ui.MainActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivitySync(intent);await(() -> node(alt)!=null,"Native reader/image visible: "+alt);Thread.sleep(350);
    }
    private AccessibilityNodeInfo find(AccessibilityNodeInfo n,String value) {
        if(n==null)return null;
        if(n.isVisibleToUser()&&(value.toUpperCase(Locale.ROOT).equals(n.getText()==null?"":n.getText().toString().toUpperCase(Locale.ROOT))||value.contentEquals(n.getContentDescription()==null?"":n.getContentDescription())))return n;
        for(int i=0;i<n.getChildCount();i++){AccessibilityNodeInfo found=find(n.getChild(i),value);if(found!=null)return found;}
        return null;
    }
    private AccessibilityNodeInfo node(String value) { return find(getUiAutomation().getRootInActiveWindow(),value); }
    private AccessibilityNodeInfo imageWithoutCaption(AccessibilityNodeInfo n) {
        if(n==null)return null;
        Rect r=new Rect();n.getBoundsInScreen(r);
        if(n.isVisibleToUser()&&n.isClickable()&&n.getText()==null&&r.height()>200)return n;
        for(int i=0;i<n.getChildCount();i++){
            AccessibilityNodeInfo found=imageWithoutCaption(n.getChild(i));if(found!=null)return found;
        }return null;
    }
    private void tap(String value) throws Exception {
        AccessibilityNodeInfo n=node(value);check(n!=null,"Visible control "+value);Rect r=new Rect();n.getBoundsInScreen(r);
        touch(r.exactCenterX(),r.exactCenterY());Thread.sleep(200);
    }
    private void touch(float x,float y) {
        long t=SystemClock.uptimeMillis();
        for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_UP}) {
            MotionEvent e=MotionEvent.obtain(t,SystemClock.uptimeMillis(),action,x,y,0);e.setSource(InputDevice.SOURCE_TOUCHSCREEN);
            check(getUiAutomation().injectInputEvent(e,true),"Touch injected");e.recycle();
        }
    }
    private Object visible() throws Exception { Field f=app(EXT+"ImageZoom").getDeclaredField("visible");f.setAccessible(true);return f.get(null); }
    private ImageView zoomView() throws Exception {
        Dialog d=(Dialog)visible();return (ImageView)findView(d.getWindow().getDecorView());
    }
    private View findView(View n) {
        if(n.getClass().getName().equals(EXT+"ImageZoom$ZoomView"))return n;
        if(n instanceof ViewGroup)for(int i=0;i<((ViewGroup)n).getChildCount();i++) {
            View found=findView(((ViewGroup)n).getChildAt(i));if(found!=null)return found;
        }return null;
    }
    private void loaded() throws Exception {await(() -> visible()!=null&&zoomView()!=null&&zoomView().getDrawable()!=null&&((Dialog)visible()).getWindow().getDecorView().hasWindowFocus()&&(node("Image zoom 100%")!=null||node("Bildzoom 100%")!=null),"Native Coil image decoded");}
    private void back() throws Exception {await(()->((Dialog)visible()).getWindow().getDecorView().hasWindowFocus(),"Viewer/menu receives Back focus");Thread.sleep(150);sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);await(()->visible()==null,"Back closes viewer/menu");}
    private void capture(String label) throws Exception {
        File file=new File(context.getCacheDir(),"penguin391-"+label+".png");
        try(OutputStream out=new FileOutputStream(file)){check(getUiAutomation().takeScreenshot().compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot "+label);}
    }
    private String shell(String command) throws Exception {
        try(InputStream in=new ParcelFileDescriptor.AutoCloseInputStream(getUiAutomation().executeShellCommand(command))) {
            return new String(in.readAllBytes(),java.nio.charset.StandardCharsets.UTF_8).trim();
        }
    }
    private Object model(String uri) throws Exception {
        Object source=app("com.nononsenseapps.feeder.model.html.LinearImageSource")
            .getConstructor(String.class,Integer.class,Integer.class,Float.class,Integer.class)
            .newInstance(uri,3200,1800,null,null);
        return app("com.nononsenseapps.feeder.model.html.LinearImage").getConstructor(Set.class,List.class,
            app("com.nononsenseapps.feeder.model.html.LinearText"),String.class)
            .newInstance(Collections.emptySet(),List.of(source),null,null);
    }
    private void show(String uri) throws Exception {
        Object model=model(uri);
        main(()->check((Boolean)app(EXT+"ImageZoom").getMethod("click",Object.class,Object.class,Object.class)
            .invoke(null,model,Collections.emptyMap(),null),"Viewer accepts image"));
    }
    private static final class HttpFixture implements AutoCloseable {
        final java.net.ServerSocket server;
        final java.util.concurrent.atomic.AtomicInteger requests=new java.util.concurrent.atomic.AtomicInteger();
        final byte[] bytes;
        final long delay;
        HttpFixture(byte[] bytes,long delay) throws Exception {
            this.bytes=bytes;this.delay=delay;
            server=new java.net.ServerSocket(0,10,java.net.InetAddress.getByName("127.0.0.1"));
            Thread thread=new Thread(()->{
                while(!server.isClosed())try {
                    java.net.Socket socket=server.accept();
                    Thread worker=new Thread(()->{
                        try(java.net.Socket s=socket) {
                            s.setSoTimeout(5000);
                            BufferedReader reader=new BufferedReader(new InputStreamReader(s.getInputStream(),java.nio.charset.StandardCharsets.US_ASCII));
                            String line;while((line=reader.readLine())!=null&&!line.isEmpty()){}requests.incrementAndGet();
                            if(delay>0)Thread.sleep(delay);
                            OutputStream out=s.getOutputStream();
                            out.write(("HTTP/1.1 200 OK\r\nContent-Type: image/png\r\nCache-Control: public, max-age=86400\r\nContent-Length: "+bytes.length+"\r\nConnection: close\r\n\r\n").getBytes(java.nio.charset.StandardCharsets.US_ASCII));
                            out.write(bytes);out.flush();
                        }catch(Exception ignored){} // Cancellation is an expected socket-close path.
                    });worker.setDaemon(true);worker.start();
                }catch(IOException ignored){}
            });thread.setDaemon(true);thread.start();
        }
        String uri() {return "http://127.0.0.1:"+server.getLocalPort()+"/penguin391.png";}
        public void close() throws IOException {server.close();}
    }
    private void network() throws Exception {
        stage="native cache/network policy/cancellation";
        Method getRepo=activity.getClass().getDeclaredMethod("getRepository");getRepo.setAccessible(true);
        Object repo=getRepo.invoke(activity);
        Method set=repo.getClass().getMethod("setLoadImageOnlyOnWifi",boolean.class);
        Object flow=repo.getClass().getMethod("getLoadImageOnlyOnWifi").invoke(repo);
        boolean prior=(Boolean)flow.getClass().getMethod("getValue").invoke(flow);
        String policy=shell("cmd netpolicy list wifi-networks");
        check(policy.lines().allMatch(s->s.equals("AndroidWifi;none")),"Only default disposable AVD Wi-Fi policy accepted");
        android.net.ConnectivityManager cm=(android.net.ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
        check(cm.getNetworkCapabilities(cm.getActiveNetwork()).hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI),"Disposable Wi-Fi active");
        Bitmap bitmap=Bitmap.createBitmap(3200,1800,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.CYAN);
        ByteArrayOutputStream out=new ByteArrayOutputStream();bitmap.compress(Bitmap.CompressFormat.PNG,100,out);bitmap.recycle();
        byte[] bytes=out.toByteArray();
        try {
            main(()->set.invoke(repo,false));
            String cached;
            try(HttpFixture server=new HttpFixture(bytes,0)) {
                cached=server.uri();show(cached);loaded();
                check(server.requests.get()==1,"Native loader fetches local HTTP fixture once");
                check(zoomView().getDrawable().getIntrinsicWidth()<=2500&&zoomView().getDrawable().getIntrinsicHeight()<=2500,"Native decode remains capped at 2500 pixels");
                back();
            }
            show(cached);loaded();back(); // Server stopped: image must come from native cache.
            main(()->set.invoke(repo,true));
            shell("cmd netpolicy set metered-network AndroidWifi true");
            await(()->!cm.getNetworkCapabilities(cm.getActiveNetwork()).hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_NOT_METERED),"Wi-Fi marked metered for policy test");
            show(cached);loaded();back();
            try(HttpFixture server=new HttpFixture(bytes,0)) {
                show(server.uri());await(()->node("Retry")!=null,"Uncached image blocked on metered connection");
                check(server.requests.get()==0,"Wi-Fi-only policy prevents an actual HTTP request");
                main(()->set.invoke(repo,false));tap("Retry");loaded();check(server.requests.get()==1,"Native setting change enables retry");back();
            }
            try(HttpFixture server=new HttpFixture(bytes,3000)) {
                show(server.uri());await(()->server.requests.get()==1,"Delayed request in flight");
                Dialog pending=(Dialog)visible();tap("Close");await(()->visible()==null,"Pending request viewer closes");
                Thread.sleep(3500);check(!pending.isShowing()&&visible()==null,"Late callback cannot reopen or update a dismissed viewer");
            }
            Object job=app(EXT+"FeederHooks").getMethod("job").invoke(null);
            app(EXT+"FeederHooks").getMethod("cancel",Object.class).invoke(null,job);
            check((Boolean)job.getClass().getMethod("isCancelled").invoke(job),"Native request Job cancellation binding works");
        } finally {
            main(()->set.invoke(repo,prior));shell("cmd netpolicy set metered-network AndroidWifi undefined");
            check(policy.equals(shell("cmd netpolicy list wifi-networks")),"Original emulator network policy restored");
            check(prior==(Boolean)flow.getClass().getMethod("getValue").invoke(flow),"Native image setting restored");
        }
    }
    private float[] matrix() throws Exception {float[] v=new float[9];main(()->zoomView().getImageMatrix().getValues(v));return v;}
    private void pinch(ImageView image,boolean expand) throws Exception {
        int[] loc=new int[2];main(()->image.getLocationOnScreen(loc));
        float cx=loc[0]+image.getWidth()/2f,cy=loc[1]+image.getHeight()/2f;
        long down=SystemClock.uptimeMillis();
        for(int step=0;step<=15;step++) {
            float distance=expand?120+Math.min(step,14)*40:680-Math.min(step,14)*40;
            MotionEvent.PointerProperties[] props={new MotionEvent.PointerProperties(),new MotionEvent.PointerProperties()};
            MotionEvent.PointerCoords[] coords={new MotionEvent.PointerCoords(),new MotionEvent.PointerCoords()};
            for(int i=0;i<2;i++){props[i].id=i;props[i].toolType=MotionEvent.TOOL_TYPE_FINGER;coords[i].x=cx;coords[i].y=cy+(i==0?-distance:distance);coords[i].pressure=1;coords[i].size=1;}
            int count=step==0?1:2;
            int action=step==0?MotionEvent.ACTION_DOWN:step==1?MotionEvent.ACTION_POINTER_DOWN|(1<<MotionEvent.ACTION_POINTER_INDEX_SHIFT):step==15?MotionEvent.ACTION_POINTER_UP|(1<<MotionEvent.ACTION_POINTER_INDEX_SHIFT):MotionEvent.ACTION_MOVE;
            MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,count,props,coords,0,0,1,1,0,0,InputDevice.SOURCE_TOUCHSCREEN,0);
            check(getUiAutomation().injectInputEvent(e,true),"Real multi-pointer event");e.recycle();Thread.sleep(25);
        }
        MotionEvent up=MotionEvent.obtain(down,SystemClock.uptimeMillis(),MotionEvent.ACTION_UP,cx,cy-(expand?680:120),0);up.setSource(InputDevice.SOURCE_TOUCHSCREEN);getUiAutomation().injectInputEvent(up,true);up.recycle();Thread.sleep(250);
    }
    private void suite() throws Exception {
        open(1,"Penguin391 diagram");tap("Penguin391 diagram");loaded();capture("after");
        ImageView view=zoomView();float[] initial=matrix();
        tap("Zoom in");check(matrix()[0]>initial[0],"Accessible zoom button changes actual matrix");
        tap("Reset");check(Math.abs(matrix()[0]-initial[0])<.001,"Reset restores fit");
        pinch(view,true);check(matrix()[0]>initial[0]*2,"Pinch enlarges actual image: before="+initial[0]+", after="+matrix()[0]);capture("zoomed");
        float[] prior=matrix();int[] loc=new int[2];main(()->view.getLocationOnScreen(loc));
        long down=SystemClock.uptimeMillis();
        for(int i=0;i<=10;i++) {
            int action=i==0?MotionEvent.ACTION_DOWN:i==10?MotionEvent.ACTION_UP:MotionEvent.ACTION_MOVE;
            MotionEvent e=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,loc[0]+view.getWidth()/2f+20*i,loc[1]+view.getHeight()/2f+10*i,0);
            e.setSource(InputDevice.SOURCE_TOUCHSCREEN);getUiAutomation().injectInputEvent(e,true);e.recycle();Thread.sleep(20);
        }
        check(Math.abs(matrix()[2]-prior[2])>30,"Drag pans enlarged image: before="+prior[2]+", after="+matrix()[2]+", zoom="+matrix()[0]/initial[0]);
        tap("Reset");int cx=loc[0]+view.getWidth()/2,cy=loc[1]+view.getHeight()/2;touch(cx,cy);Thread.sleep(80);touch(cx,cy);Thread.sleep(250);
        check(Math.abs(matrix()[0]/initial[0]-3)<.01,"Double-tap zooms to 3x");
        Thread.sleep(350);touch(cx,cy);Thread.sleep(80);touch(cx,cy);Thread.sleep(250);
        check(Math.abs(matrix()[0]-initial[0])<.001,"Double-tap resets");
        for(int i=0;i<8;i++)tap("Zoom in");check(Math.abs(matrix()[0]/initial[0]-8)<.01,"Zoom capped at 8x");
        for(int i=0;i<14;i++)tap("Zoom out");check(Math.abs(matrix()[0]-initial[0])<.001,"Cannot zoom below fit");
        back();check(node("Penguin391 diagram")!=null,"Article remains after viewer Back");
        open(2,"Penguin391 linked");tap("Penguin391 linked");await(()->node("View image")!=null,"Linked image menu");capture("link-menu");
        tap("View image");loaded();tap("Close");await(()->visible()==null,"Close button dismisses viewer");
        tap("Penguin391 linked");tap("Open link");await(()->node("Penguin391 anchor target")!=null,"Original link callback and fragment target preserved");
        open(3,"Penguin391 broken");tap("Penguin391 broken");await(()->node("Retry")!=null,"Broken image error with retry");
        tap("Retry");await(()->node("Retry")!=null,"Retry remains safe on invalid image");back();
        String[] names={"Penguin391 srcset","Penguin391 table","Penguin391 gif","Penguin391 jpeg","Penguin391 webp"};
        for(int i=0;i<names.length;i++){open(i+4,names[i]);tap(names[i]);loaded();check(zoomView().getDrawable().getIntrinsicWidth()>0,"Decoded format/table/srcset "+names[i]);back();}
        open(9,"Penguin391 start");
        await(()->imageWithoutCaption(getUiAutomation().getRootInActiveWindow())!=null,"Uncaptioned image clickable in native reader");
        AccessibilityNodeInfo uncaptioned=imageWithoutCaption(getUiAutomation().getRootInActiveWindow());
        Rect bounds=new Rect();uncaptioned.getBoundsInScreen(bounds);touch(bounds.exactCenterX(),bounds.exactCenterY());loaded();
        check(node("Image")!=null,"Null caption uses image title without verifier/type error");back();
        open(11,"Penguin391 header article");
        await(()->imageWithoutCaption(getUiAutomation().getRootInActiveWindow())!=null,"Header image clickable");
        AccessibilityNodeInfo hero=imageWithoutCaption(getUiAutomation().getRootInActiveWindow());
        Rect heroBounds=new Rect();hero.getBoundsInScreen(heroBounds);touch(heroBounds.exactCenterX(),heroBounds.exactCenterY());loaded();back();
        network();
        stage="German large-text viewer";
        open(1,"Penguin391 diagram");
        android.content.res.Configuration previous=new android.content.res.Configuration(activity.getResources().getConfiguration());
        try {
            main(()->{
                android.content.res.Configuration de=new android.content.res.Configuration(previous);
                de.setLocale(Locale.GERMAN);de.fontScale=1.5f;
                activity.getResources().updateConfiguration(de,activity.getResources().getDisplayMetrics());
            });
            tap("Penguin391 diagram");loaded();
            for(String label:new String[]{"Schließen","Zurücksetzen","Vergrößern","Verkleinern"}) {
                AccessibilityNodeInfo control=node(label);check(control!=null,"German control present: "+label);
                Rect r=new Rect();control.getBoundsInScreen(r);Bitmap screen=getUiAutomation().takeScreenshot();
                check(r.left>=0&&r.top>=0&&r.right<=screen.getWidth()&&r.bottom<=screen.getHeight(),"Large-text control fits: "+label);screen.recycle();
            }
            tap("Vergrößern");tap("Zurücksetzen");tap("Schließen");await(()->visible()==null,"German close works");
        } finally {
            main(()->activity.getResources().updateConfiguration(previous,activity.getResources().getDisplayMetrics()));
        }
        open(1,"Penguin391 diagram");tap("Penguin391 diagram");loaded();Dialog old=(Dialog)visible();
        main(()->activity.recreate());await(()->!old.isShowing()&&visible()==null,"Activity recreation dismisses viewer");
        await(()->node("Penguin391 diagram")!=null,"Reader restored after recreation");tap("Penguin391 diagram");loaded();
        main(()->activity.moveTaskToBack(true));await(()->visible()==null,"App stop dismisses viewer and cancels request");
        open(10,"Native text link");check(node("Text target")==null,"Text target starts offscreen");
        Rect textBounds=new Rect();node("Native text link").getBoundsInScreen(textBounds);
        touch(textBounds.left+20,textBounds.exactCenterY());await(()->node("Text target")!=null,"Native text links unaffected");
        try(SQLiteDatabase db=db()) {
            check(android.database.DatabaseUtils.longForQuery(db,"SELECT count(*) FROM feeds WHERE id=391",null)==1,"Subscription retained");
            check(android.database.DatabaseUtils.longForQuery(db,"SELECT count(*) FROM feed_items WHERE feed_id=391 AND bookmarked=1",null)==11,"Bookmarks retained");
        }
        check("preserve-settings-and-subscriptions".equals(context.getSharedPreferences("penguin391-fixture",0).getString("marker","")),"Preferences retained");
    }
    @Override public void onStart() {
        Bundle result=new Bundle();try {
            context=getTargetContext();
            ((Application)context.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
                public void onActivityResumed(Activity a){activity=a;}
                public void onActivityCreated(Activity a,Bundle b){} public void onActivityStarted(Activity a){} public void onActivityPaused(Activity a){}
                public void onActivityStopped(Activity a){} public void onActivitySaveInstanceState(Activity a,Bundle b){} public void onActivityDestroyed(Activity a){}
            });
            if("baseline".equals(args.getString("mode"))) {
                seed();open(1,"Penguin391 diagram");tap("Penguin391 diagram");Thread.sleep(350);
                check(node("Zoom in")==null,"Original APK reproduces missing viewer/zoom");capture("before");
            } else if("suite".equals(args.getString("mode")))suite();else throw new IllegalArgumentException("mode");
            result.putString("stream","PASS: native Feeder reader/loader/gestures/data; "+checks+" assertions\n");finish(Activity.RESULT_OK,result);
        }catch(Throwable e){try{capture("failure");}catch(Exception ignored){}android.util.Log.e("PenguinFeederAcceptance",stage,e);result.putString("stream","FAIL: "+stage+"\n"+android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}
    }
}
