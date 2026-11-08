import android.graphics.Typeface;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.reflect.Field;

/** Isolated layout and verified viewer-setter checks; no app navigation. */
public final class PolishChecks {
    static int count;
    static void check(boolean value,String text) { if(!value)throw new AssertionError(text); count++;System.out.println("PASS: "+text); }
    public static final class Holder {
        public View a;
        public TextView authorTv,scoreTv,timeTv;
        public View commentTv;
    }
    public static final class Renderer {
        int duration;
        public void setDoubleTapZoomDuration(int value) { duration=value; }
        public void setZoomTransitionDuration(int value) { duration=value; }
    }
    public static final class Swipe {
        float sensitivity;
        public void setSensitivity(float value) { sensitivity=value; }
    }
    public static final class Fragment {
        public Renderer scaleImageView=new Renderer(),photoView=new Renderer();
        public Swipe swipeBackLayout=new Swipe();
    }
    public static final class PositionList extends android.widget.FrameLayout {
        PositionList(android.content.Context context){super(context);}
        public static int J(View child){return (Integer)child.getTag();}
        public int getScrollState(){return 0;}
    }
    public static final class PositionManager {
        int position=-1,offset;
        public void p1(int position,int offset){this.position=position;this.offset=offset;}
    }
    public static final class PositionFragment {
        public PositionList mRecyclerView;
        public java.util.List<Object> B=new java.util.ArrayList<>();
        public PositionManager D=new PositionManager();
        public String y="test-post",z="",P="";
        public Object v0;
    }
    static void transportChecks(ClassLoader loader)throws Exception {
        Class<?> adapter=Class.forName("net.dean.jraw.http.OkHttpAdapter",true,loader),protocol=Class.forName("okhttp3.Protocol",true,loader),clientType=Class.forName("okhttp3.OkHttpClient",true,loader);
        Object h2=protocol.getField("HTTP_2").get(null),http1=protocol.getField("HTTP_1_1").get(null),normal=adapter.getConstructor().newInstance(),client=adapter.getMethod("getNativeClient").invoke(normal);
        check(clientType.getMethod("protocols").invoke(client).equals(java.util.List.of(h2,http1)),"Reddit client prefers HTTP/2 with HTTP/1.1 fallback instead of obsolete SPDY");
        Object legacy=adapter.getConstructor(protocol).newInstance(http1);check(clientType.getMethod("protocols").invoke(adapter.getMethod("getNativeClient").invoke(legacy)).equals(java.util.List.of(http1)),"Explicit HTTP/1.1 adapter retains its supported transport");
        Object configured=adapter.getConstructor(clientType,protocol).newInstance(client,h2),copy=adapter.getMethod("getNativeClient").invoke(configured);
        for(String getter:new String[]{"connectionPool","dispatcher","dns","sslSocketFactory","hostnameVerifier","certificatePinner"})check(clientType.getMethod(getter).invoke(copy)==clientType.getMethod(getter).invoke(client),"HTTP/2 preference preserves native "+getter);
        try(java.net.ServerSocket server=new java.net.ServerSocket(0,1,java.net.InetAddress.getByName("127.0.0.1"))){server.setSoTimeout(5000);Thread responder=new Thread(()->{try(java.net.Socket socket=server.accept()){socket.setSoTimeout(5000);java.io.BufferedReader input=new java.io.BufferedReader(new java.io.InputStreamReader(socket.getInputStream(),java.nio.charset.StandardCharsets.US_ASCII));String line;while((line=input.readLine())!=null && !line.isEmpty()){}socket.getOutputStream().write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\nok".getBytes(java.nio.charset.StandardCharsets.US_ASCII));}catch(Exception error){throw new RuntimeException(error);}});responder.start();
            Class<?> builder=Class.forName("okhttp3.Request$Builder",true,loader),requestType=Class.forName("okhttp3.Request",true,loader);Object request=builder.getConstructor().newInstance();builder.getMethod("url",String.class).invoke(request,"http://127.0.0.1:"+server.getLocalPort()+"/local-transport-check");request=builder.getMethod("build").invoke(request);Object call=clientType.getMethod("newCall",requestType).invoke(client,request),response=Class.forName("okhttp3.Call",true,loader).getMethod("execute").invoke(call);Class<?> responseType=Class.forName("okhttp3.Response",true,loader);try{Object body=responseType.getMethod("body").invoke(response);String text=(String)Class.forName("okhttp3.ResponseBody",true,loader).getMethod("string").invoke(body);check(text.equals("ok") && responseType.getMethod("protocol").invoke(response).equals(http1),"Real native call completes against an isolated local HTTP/1.1 server with fallback enabled");}finally{responseType.getMethod("close").invoke(response);}responder.join(5000);
        }
    }
    static void positionChecks(ClassLoader loader,android.content.Context base)throws Exception {
        String[] saved={"{}"};
        android.content.SharedPreferences.Editor editor=(android.content.SharedPreferences.Editor)java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{android.content.SharedPreferences.Editor.class},(proxy,method,args)->{if(method.getName().equals("putString"))saved[0]=(String)args[1];if(method.getName().equals("apply"))return null;if(method.getName().equals("commit"))return true;return proxy;});
        android.content.SharedPreferences preferences=(android.content.SharedPreferences)java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{android.content.SharedPreferences.class},(proxy,method,args)->{if(method.getName().equals("getString"))return saved[0];if(method.getName().equals("edit"))return editor;return null;});
        android.content.Context context=new android.content.ContextWrapper(base){@Override public android.content.SharedPreferences getSharedPreferences(String name,int mode){return preferences;}};
        Class<?> feature=Class.forName("app.morphe.extension.boost.ThreadPositionTweaks",true,loader);
        Object first=StyleChecks.allocate(Class.forName("com.rubenmayayo.reddit.models.reddit.CommentViewModel",true,loader)),second=StyleChecks.allocate(first.getClass());
        DownloadControlsChecks.set(first,"b","t1_first");DownloadControlsChecks.set(first,"S",true);DownloadControlsChecks.set(second,"b","t1_second");DownloadControlsChecks.set(second,"S",true);
        PositionFragment original=new PositionFragment();original.mRecyclerView=new PositionList(context);original.mRecyclerView.layout(0,0,400,800);original.B.add(first);original.B.add(second);
        View child=new View(context);child.setTag(1);original.mRecyclerView.addView(child);child.layout(0,-24,400,180);
        feature.getMethod("pause",Object.class).invoke(null,original);check(saved[0].contains("t1_second"),"Thread position persists the visible native comment ID");
        PositionFragment reopened=new PositionFragment();reopened.mRecyclerView=new PositionList(context);reopened.B.add(second);reopened.B.add(first);
        feature.getMethod("resume",Object.class).invoke(null,reopened);reopened.mRecyclerView.getViewTreeObserver().dispatchOnPreDraw();
        check(reopened.D.position==0 && reopened.D.offset==-24,"Reordered thread restores by comment ID with the exact offset");
        reopened.D.position=-1;reopened.mRecyclerView.getViewTreeObserver().dispatchOnPreDraw();check(reopened.D.position==-1,"Restoration runs once and stops observing frames");
        PositionFragment linked=new PositionFragment();linked.mRecyclerView=new PositionList(context);linked.v0=second;linked.B.add(second);feature.getMethod("resume",Object.class).invoke(null,linked);linked.mRecyclerView.getViewTreeObserver().dispatchOnPreDraw();check(linked.D.position==-1,"Direct comment links retain their native destination");
    }
    public static void main(String[] args) {
        try { run(args); } catch(Throwable error) { error.printStackTrace(System.out);System.exit(1); }
    }
    static void run(String[] args) throws Exception {
        ClassLoader loader=RuntimeUiChecks.initialize(args);
        android.content.Context context=RuntimeUiChecks.context;
        positionChecks(loader,context);
        transportChecks(loader);
        float density=context.getResources().getDisplayMetrics().density;
        RelativeLayout parent=new RelativeLayout(context);
        Holder holder=new Holder();holder.a=parent;
        holder.authorTv=new TextView(context);holder.authorTv.setId(View.generateViewId());
        holder.authorTv.setTextSize(14);holder.authorTv.setTextColor(0xFF123456);holder.authorTv.setTypeface(Typeface.DEFAULT);
        RelativeLayout.LayoutParams author=new RelativeLayout.LayoutParams(-2,-2);author.topMargin=6;parent.addView(holder.authorTv,author);
        holder.commentTv=new View(context);parent.addView(holder.commentTv,new RelativeLayout.LayoutParams(-1,20));
        holder.scoreTv=new TextView(context);holder.timeTv=new TextView(context);
        holder.scoreTv.setTextSize(20);holder.timeTv.setTextSize(12);
        parent.addView(holder.scoreTv,new RelativeLayout.LayoutParams(-2,-2));
        RelativeLayout.LayoutParams time=new RelativeLayout.LayoutParams(-2,-2);time.setMarginEnd(40);parent.addView(holder.timeTv,time);
        Class<?> runtime=Class.forName("app.morphe.extension.boost.CommentLayoutTweaks",true,loader);
        runtime.getMethod("bind",Object.class).invoke(null,holder);
        Field rows=runtime.getDeclaredField("ROWS");rows.setAccessible(true);
        Object layout=((java.util.Map<?,?>)rows.get(null)).get(parent);
        ViewTreeObserver.OnPreDrawListener listener=(ViewTreeObserver.OnPreDrawListener)layout;
        check(listener.onPreDraw(),"Initial comment styling never vetoes the draw frame");
        check(holder.authorTv.getParent()==holder.scoreTv.getParent() && holder.timeTv.getParent()==holder.authorTv.getParent(),"Author, points and time share the compact header");
        check(holder.authorTv.getTypeface().getWeight()>=500,"Username uses medium or stronger native font weight");
        check(holder.authorTv.getCurrentTextColor()==0xFF123456,"Username colour is preserved");
        check(holder.authorTv.getTextSize()==holder.scoreTv.getTextSize() && holder.timeTv.getTextSize()==holder.authorTv.getTextSize(),"Score and timestamp match author text size");
        check(listener.onPreDraw(),"Stable layout draws without repeated invalidation");
        int children=parent.getChildCount();
        runtime.getMethod("bind",Object.class).invoke(null,holder);
        check(((java.util.Map<?,?>)rows.get(null)).size()==1 && parent.getChildCount()==children,"Rebinding does not add duplicate layout controllers or headers");
        ((View.OnAttachStateChangeListener)layout).onViewDetachedFromWindow(parent);
        ((View.OnAttachStateChangeListener)layout).onViewAttachedToWindow(parent);
        check(listener.onPreDraw(),"Detached and reattached row keeps stable layout");
        Fragment fragment=new Fragment();
        Class.forName("app.morphe.extension.boost.ViewerPolishTweaks",true,loader).getMethod("onResume",Object.class).invoke(null,fragment);
        check(fragment.scaleImageView.duration==300 && fragment.photoView.duration==300,"Both native image paths use consistent 300ms zoom transitions");
        check(fragment.swipeBackLayout.sensitivity==0.25f,"Native drag sensitivity is tuned without replacing listeners");
        Class.forName("com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView",false,loader).getMethod("setDoubleTapZoomDuration",int.class);
        Class.forName("com.rubenmayayo.reddit.ui.customviews.CustomPhotoView",false,loader).getMethod("setZoomTransitionDuration",int.class);
        Class.forName("com.liuguangqiang.swipeback.SwipeBackLayout",false,loader).getMethod("setSensitivity",float.class);
        check(true,"Viewer setters resolve against actual Boost classes");
        Fragment unrelated=new Fragment();
        Class.forName("app.morphe.extension.boost.ViewerPolishTweaks",true,loader).getMethod("onActivityResume",Object.class).invoke(null,unrelated);
        check(unrelated.photoView.duration==0 && unrelated.swipeBackLayout.sensitivity==0,"Activity tuning leaves unrelated screens alone");
        Class<?> unsafeClass=Class.forName("sun.misc.Unsafe"); Object unsafe=null;
        for (Field field:unsafeClass.getDeclaredFields()) if (field.getType()==unsafeClass) { field.setAccessible(true);unsafe=field.get(null);break; }
        Class<?> activityClass=Class.forName("com.rubenmayayo.reddit.ui.activities.MediaImageActivity",true,loader);
        Object singleImage=unsafeClass.getMethod("allocateInstance",Class.class).invoke(unsafe,activityClass);
        Class<?> swipeClass=Class.forName("com.liuguangqiang.swipeback.SwipeBackLayout",true,loader);
        Object actualSwipe=swipeClass.getConstructor(android.content.Context.class,android.util.AttributeSet.class).newInstance(context,null);
        swipeClass.getMethod("setSensitivity",float.class).invoke(actualSwipe,0.12f);
        swipeClass.getMethod("setOnFinishListener",Class.forName("com.liuguangqiang.swipeback.SwipeBackLayout$c",false,loader)).invoke(actualSwipe,new Object[]{null});
        Field helperField=swipeClass.getDeclaredField("y");helperField.setAccessible(true);
        Object actualHelper=helperField.get(actualSwipe);
        Field slopField=actualHelper.getClass().getDeclaredField("b");slopField.setAccessible(true);
        int originalSlop=slopField.getInt(actualHelper);
        Field swipeField=Class.forName("com.rubenmayayo.reddit.ui.activities.MediaActivity",false,loader).getDeclaredField("swipeBackLayout");
        swipeField.setAccessible(true);swipeField.set(singleImage,actualSwipe);
        Class.forName("app.morphe.extension.boost.ViewerPolishTweaks",true,loader).getMethod("onActivityResume",Object.class).invoke(null,singleImage);
        Field sensitivity=swipeClass.getDeclaredField("I");sensitivity.setAccessible(true);
        check(sensitivity.getFloat(actualSwipe)==0.25f,"Scoped single-image route updates the actual native swipe widget");
        int expectedSlop=android.view.ViewConfiguration.get(context).getScaledTouchSlop()*4;
        check(slopField.getInt(actualHelper)==expectedSlop && expectedSlop<originalSlop,"Existing native drag helper receives the smaller effective capture threshold");
        Class.forName("app.morphe.extension.boost.ViewerPolishTweaks",true,loader).getMethod("onActivityResume",Object.class).invoke(null,singleImage);
        check(slopField.getInt(actualHelper)==expectedSlop,"Repeated resumes do not compound the capture threshold");
        System.out.println("POLISH CHECKS PASSED: "+count);System.exit(0);
    }
}
