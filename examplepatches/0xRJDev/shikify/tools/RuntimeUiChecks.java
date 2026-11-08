import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import dalvik.system.DexClassLoader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/** Isolated framework-view tests. Fake buttons only increment counters; no Reddit actions are sent. */
public final class RuntimeUiChecks {
    static Method touch, bind, choose;
    static int checks;
    static Context context;

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks++;
        System.out.println("PASS: " + message);
    }
    public static class FakeActivity extends Activity {
        Window window;
        int cancels;
        FakeActivity(Context base) throws Exception {
            attachBaseContext(base);
            window = new FakeWindow(this);
        }
        @Override public Window getWindow() { return window; }
        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            if (event.getActionMasked() == MotionEvent.ACTION_CANCEL) cancels++;
            return true;
        }
    }
    public static class FakeWindow extends Window {
        final FrameLayout decor;
        FakeWindow(Context context) { super(context); decor = new FrameLayout(context); }
        @Override public void addContentView(android.view.View arg0, android.view.ViewGroup.LayoutParams arg1) { decor.addView(arg0, arg1); }
        @Override public void closeAllPanels() {  }
        @Override public void closePanel(int arg0) {  }
        @Override public android.view.View getCurrentFocus() { return null; }
        @Override public android.view.View getDecorView() { return decor; }
        @Override public android.view.LayoutInflater getLayoutInflater() { return android.view.LayoutInflater.from(((android.content.ContextWrapper)getContext()).getBaseContext()); }
        @Override public int getNavigationBarColor() { return 0; }
        @Override public int getStatusBarColor() { return 0; }
        @Override public int getVolumeControlStream() { return 0; }
        @Override public void invalidatePanelMenu(int arg0) {  }
        @Override public boolean isFloating() { return false; }
        @Override public boolean isShortcutKey(int arg0, android.view.KeyEvent arg1) { return false; }
        @Override protected void onActive() {  }
        @Override public void onConfigurationChanged(android.content.res.Configuration arg0) {  }
        @Override public void openPanel(int arg0, android.view.KeyEvent arg1) {  }
        @Override public android.view.View peekDecorView() { return decor; }
        @Override public boolean performContextMenuIdentifierAction(int arg0, int arg1) { return false; }
        @Override public boolean performPanelIdentifierAction(int arg0, int arg1, int arg2) { return false; }
        @Override public boolean performPanelShortcut(int arg0, int arg1, android.view.KeyEvent arg2, int arg3) { return false; }
        @Override public void restoreHierarchyState(android.os.Bundle arg0) {  }
        @Override public android.os.Bundle saveHierarchyState() { return null; }
        @Override public void setBackgroundDrawable(android.graphics.drawable.Drawable arg0) {  }
        @Override public void setChildDrawable(int arg0, android.graphics.drawable.Drawable arg1) {  }
        @Override public void setChildInt(int arg0, int arg1) {  }
        @Override public void setContentView(android.view.View arg0) { decor.removeAllViews(); decor.addView(arg0); }
        @Override public void setContentView(android.view.View arg0, android.view.ViewGroup.LayoutParams arg1) { decor.removeAllViews(); decor.addView(arg0); }
        @Override public void setContentView(int arg0) {  }
        @Override public void setDecorCaptionShade(int arg0) {  }
        @Override public void setFeatureDrawable(int arg0, android.graphics.drawable.Drawable arg1) {  }
        @Override public void setFeatureDrawableAlpha(int arg0, int arg1) {  }
        @Override public void setFeatureDrawableResource(int arg0, int arg1) {  }
        @Override public void setFeatureDrawableUri(int arg0, android.net.Uri arg1) {  }
        @Override public void setFeatureInt(int arg0, int arg1) {  }
        @Override public void setNavigationBarColor(int arg0) {  }
        @Override public void setResizingCaptionDrawable(android.graphics.drawable.Drawable arg0) {  }
        @Override public void setStatusBarColor(int arg0) {  }
        @Override public void setTitle(java.lang.CharSequence arg0) {  }
        @Override public void setTitleColor(int arg0) {  }
        @Override public void setVolumeControlStream(int arg0) {  }
        @Override public boolean superDispatchGenericMotionEvent(android.view.MotionEvent arg0) { return false; }
        @Override public boolean superDispatchKeyEvent(android.view.KeyEvent arg0) { return false; }
        @Override public boolean superDispatchKeyShortcutEvent(android.view.KeyEvent arg0) { return false; }
        @Override public boolean superDispatchTouchEvent(android.view.MotionEvent arg0) { return false; }
        @Override public boolean superDispatchTrackballEvent(android.view.MotionEvent arg0) { return false; }
        @Override public void takeInputQueue(android.view.InputQueue.Callback arg0) {  }
        @Override public void takeKeyEvents(boolean arg0) {  }
        @Override public void takeSurface(android.view.SurfaceHolder.Callback2 arg0) {  }
        @Override public void togglePanel(int arg0, android.view.KeyEvent arg1) {  }
    }
    public static final class FakeRow extends FrameLayout {
        final float density;
        FakeRow(Context context) { super(context); density = getResources().getDisplayMetrics().density; }
        @Override public boolean isAttachedToWindow() { return true; }
        @Override public boolean isShown() { return true; }
        @Override public boolean getGlobalVisibleRect(Rect rect, Point offset) {
            rect.set(0, Math.round(80 * density), getWidth(), Math.round(280 * density));
            if (offset != null) offset.set(0, Math.round(80 * density));
            return true;
        }
    }
    public static final class ProtectedImage extends ImageView {
        ProtectedImage(Context context) { super(context); }
        @Override public boolean getGlobalVisibleRect(Rect rect, Point offset) {
            float density = getResources().getDisplayMetrics().density;
            rect.set(0, Math.round(80*density), Math.round(400*density), Math.round(280*density));
            return true;
        }
    }
    public static final class FakeFragment {
        public View mRecyclerView;
        FakeFragment(View view) { mRecyclerView = view; }
    }
    public static final class FakeHolder {
        public View a;
        public Object c0 = new Object();
        public View voteUpButton, voteDownButton, commentReplyButton, saveButton, hideButton;
        public Object b0 = new Object();
    }
    public static final class Manager {
        public View C(int position) { return null; }
        public int Z0() { return 0; }
    }
    static final class Fixture {
        final FakeActivity activity;
        final FakeRow row;
        final FakeHolder holder = new FakeHolder();
        final float density;
        final float startX;
        int ups, downs, replies;
        long time = android.os.SystemClock.uptimeMillis();
        Fixture() throws Exception {this(200);}
        Fixture(float startX) throws Exception {
            this.startX=startX;
            activity = new FakeActivity(context);
            density = context.getResources().getDisplayMetrics().density;
            row = new FakeRow(activity);
            FrameLayout parent = new FrameLayout(activity);
            parent.addView(row, new FrameLayout.LayoutParams(Math.round(400*density), Math.round(200*density)));
            activity.window.setContentView(parent);
            View decor = activity.window.getDecorView();
            decor.measure(View.MeasureSpec.makeMeasureSpec(Math.round(400*density), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(Math.round(800*density), View.MeasureSpec.EXACTLY));
            decor.layout(0, 0, Math.round(400*density), Math.round(800*density));
            row.layout(0, 0, Math.round(400*density), Math.round(200*density));
            holder.a = row;
            holder.voteUpButton = new View(activity);
            holder.voteDownButton = new View(activity);
            holder.commentReplyButton = new View(activity);
            holder.voteUpButton.setOnClickListener(v -> ups++);
            holder.voteDownButton.setOnClickListener(v -> downs++);
            holder.commentReplyButton.setOnClickListener(v -> replies++);
            bind.invoke(null, holder);
        }
        boolean event(int action, float x, float y, long elapsed) throws Exception {
            MotionEvent event = MotionEvent.obtain(time, time + elapsed, action, x*density, y*density, 0);
            try { return (Boolean) touch.invoke(null, activity, event); }
            finally { event.recycle(); }
        }
        void down() throws Exception { event(MotionEvent.ACTION_DOWN, startX, 120, 0); }
        void move(float dx) throws Exception { event(MotionEvent.ACTION_MOVE, startX+dx, 120, 40); }
        boolean up(float dx) throws Exception { return event(MotionEvent.ACTION_UP, startX+dx, 120, 80); }
        int clicks() { return ups + downs + replies; }
    }

    static void inspectHint(Class<?> gestures, Fixture fixture, int action, String output) throws Exception {
        java.lang.reflect.Field sessions = gestures.getDeclaredField("SESSIONS"); sessions.setAccessible(true);
        Object session = ((java.util.Map<?, ?>)sessions.get(null)).get(fixture.activity);
        java.lang.reflect.Field hintField = session.getClass().getDeclaredField("hint"); hintField.setAccessible(true);
        android.graphics.drawable.Drawable hint = (android.graphics.drawable.Drawable)hintField.get(session);
        java.lang.reflect.Field selected = hint.getClass().getDeclaredField("action"); selected.setAccessible(true);
        check(selected.getInt(hint) == action, "Preview icon selects action " + action);
        int width = Math.round(Math.abs(fixture.row.getTranslationX()) + 8*fixture.density), height = fixture.row.getHeight();
        android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(width, height, android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas = new android.graphics.Canvas(bitmap);
        canvas.translate(-hint.getBounds().right+width, -hint.getBounds().top);
        hint.draw(canvas);
        java.lang.reflect.Method foreground=hint.getClass().getDeclaredMethod("foreground",int.class);foreground.setAccessible(true);
        int ink=(Integer)foreground.invoke(hint,action);
        int white = 0, whiteTop = height, whiteBottom = -1;
        for (int y=0; y<height; y++) for (int x=0; x<width; x++) {
            int color = bitmap.getPixel(x,y);
            if (color==ink) {
                white++; whiteTop=Math.min(whiteTop,y); whiteBottom=Math.max(whiteBottom,y);
            }
        }
        check(white > 0, "Selected action " + action + " renders a visible glyph in its theme foreground");
        if (action == 1 || action == 2)
            check(Math.abs((whiteTop+whiteBottom+1)/2f-height/2f)<=fixture.density,
                "Vote icon is centred vertically in the row, independently of finger position");
        if (output != null) {
            java.io.File file = new java.io.File(output); file.getParentFile().mkdirs();
            try (java.io.OutputStream stream = new java.io.FileOutputStream(file)) {
                bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream);
            }
        }
        bitmap.recycle();
    }

    public static void main(String[] args) {
        try { run(args); }
        catch (Throwable error) { error.printStackTrace(System.out); System.exit(1); }
    }
    static ClassLoader initialize(String[] args) throws Exception {
        if (Looper.myLooper() == null) Looper.prepareMainLooper();
        try {
            Class<?> shared = Class.forName("com.android.internal.os.ApplicationSharedMemory");
            // A shell app_process does not inherit Zygote's per-process shared-memory setup.
            // Create private test memory; no system/global shared memory is modified.
            Object memory = shared.getMethod("create").invoke(null);
            shared.getMethod("setInstance", shared).invoke(null, memory);
        } catch (ClassNotFoundException ignored) { }
        // Match the normal Zygote font preload in this temporary shell process.
        for (Method method : android.graphics.Typeface.class.getDeclaredMethods()) {
            if (method.getName().equals("loadPreinstalledSystemFontMap") && method.getParameterCount() == 0) {
                method.setAccessible(true);
                method.invoke(null);
            }
        }
        Class<?> threadClass = Class.forName("android.app.ActivityThread");
        Object thread = threadClass.getMethod("systemMain").invoke(null);
        Context system = (Context) threadClass.getMethod("getSystemContext").invoke(thread);
        Context resources = system.createPackageContext("com.rubenmayayo.reddit", Context.CONTEXT_IGNORE_SECURITY);
        context = new android.view.ContextThemeWrapper(resources, resources.getApplicationInfo().theme);
        // The isolated loader also needs the candidate's own ABI libraries: cached
        // Glide images can pass through its AVIF header decoder even for PNG data.
        java.io.File libraries=new java.io.File(args[1],new java.io.File(args[0]).getName()+"-native");libraries.mkdirs();
        String prefix="lib/"+android.os.Build.SUPPORTED_ABIS[0]+"/";
        try(java.util.zip.ZipFile apk=new java.util.zip.ZipFile(args[0])){
            java.util.Enumeration<? extends java.util.zip.ZipEntry> entries=apk.entries();
            while(entries.hasMoreElements()){java.util.zip.ZipEntry entry=entries.nextElement();String name=entry.getName();if(!name.startsWith(prefix) || !name.endsWith(".so"))continue;
                String filename=name.substring(prefix.length());if(filename.contains("/") || filename.contains(".."))continue;
                java.io.File library=new java.io.File(libraries,filename);if(!library.isFile() || library.length()!=entry.getSize())try(java.io.InputStream in=apk.getInputStream(entry)){java.nio.file.Files.copy(in,library.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);}
            }
        }
        ClassLoader loader = new DexClassLoader(args[0], args[1], libraries.getAbsolutePath(), ClassLoader.getSystemClassLoader());
        return loader;
    }
    static void viewportZones(Class<?> gestures)throws Exception {
        java.lang.reflect.Field sessions=gestures.getDeclaredField("SESSIONS");sessions.setAccessible(true);
        for(int width:new int[]{400,800}){
            Fixture fixture=new Fixture();fixture.activity.window.getDecorView().layout(0,0,Math.round(width*fixture.density),Math.round(800*fixture.density));fixture.row.layout(0,0,Math.round(240*fixture.density),Math.round(200*fixture.density));fixture.down();Object session=((java.util.Map<?,?>)sessions.get(null)).get(fixture.activity);
            java.lang.reflect.Field first=session.getClass().getDeclaredField("shortDistance"),second=session.getClass().getDeclaredField("mediumDistance"),third=session.getClass().getDeclaredField("longDistance");first.setAccessible(true);second.setAccessible(true);third.setAccessible(true);float a=first.getFloat(session),b=second.getFloat(session),c=third.getFloat(session),limit=width*fixture.density*.9f;
            check(Math.abs((b-a)-(c-b))<.1f && Math.abs((c-b)-(limit-c))<.1f,"Three comment zones evenly divide remaining travel to 90% of a "+width+"dp viewport");
            check(Math.abs(b/fixture.density-(48+(width*.9f-48)/3))<.1f,"Nested comment width does not shrink the "+width+"dp viewport thresholds");
            java.lang.reflect.Method choose=session.getClass().getDeclaredMethod("choose",float.class);choose.setAccessible(true);check((Integer)choose.invoke(session,-a+1)==0 && (Integer)choose.invoke(session,-a)==1 && (Integer)choose.invoke(session,-b)==2 && (Integer)choose.invoke(session,-c)==3 && (Integer)choose.invoke(session,-limit-20)==3,"Comment zone boundaries and overshoot select exactly the intended action");fixture.event(MotionEvent.ACTION_CANCEL,200,120,80);
        }
    }
    static void run(String[] args) throws Exception {
        ClassLoader loader = initialize(args);
        Class<?> gestures = Class.forName("app.morphe.extension.boost.CommentSwipeActions", true, loader);
        touch = gestures.getMethod("onTouch", Object.class, MotionEvent.class);
        Class<?> chrome = Class.forName("app.morphe.extension.boost.CommentsChromeTweaks", true, loader);
        bind = chrome.getMethod("onCommentBind", Object.class);
        check((Boolean)chrome.getMethod("swipeActionsEnabled").invoke(null), "Shared comment hook enables swipe actions");
        check((Boolean)chrome.getMethod("hideDividersEnabled").invoke(null), "Shared comment hook enables divider hiding");
        choose = gestures.getMethod("chooseAction", float.class, float.class, float.class, float.class);
        float[] distances = {0, 72, -47, -48, -95, -96, -159, -160, -300};
        int[] expected = {0, 0, 0, 1, 1, 2, 2, 3, 3};
        for (int i=0; i<distances.length; i++)
            check((Integer)choose.invoke(null, distances[i], 48f, 96f, 160f) == expected[i],
                "Distance " + distances[i] + " selects action " + expected[i]);
        viewportZones(gestures);
        Fixture up = new Fixture(); up.down(); up.move(-72);
        check(up.row.getTranslationX() < 0 && Math.abs(up.row.getTranslationX()+72*up.density)<0.01f,
            "Touched comment follows the finger exactly");
        inspectHint(gestures, up, 1, args.length > 2 ? args[2]+"/upvote.png" : null);
        boolean consumed = up.up(-72);
        check(consumed && up.ups == 1 && up.clicks() == 1, "Short left swipe invokes exactly one upvote callback");
        check(up.activity.cancels == 1 && up.row.getTranslationX() == 0, "Captured drag cancels child once and restores row position");
        check(!up.up(-72) && up.ups == 1, "Repeated UP cannot trigger a second action");
        Fixture diagonal = new Fixture(); diagonal.down();
        boolean diagonalCaptured = diagonal.event(MotionEvent.ACTION_MOVE, 128, 140, 40);
        diagonal.event(MotionEvent.ACTION_UP, 128, 140, 80);
        check(diagonalCaptured && diagonal.ups == 1 && diagonal.clicks() == 1,
            "Horizontal swipe tolerates natural vertical finger drift");
        Fixture down = new Fixture(360); down.down(); down.move(-200);
        inspectHint(gestures, down, 2, args.length > 2 ? args[2]+"/downvote.png" : null);
        down.up(-200);
        check(down.downs == 1 && down.clicks() == 1, "Medium left swipe invokes only downvote, without first upvoting");
        Fixture reply = new Fixture(360); reply.down(); reply.move(-300);
        inspectHint(gestures, reply, 3, args.length > 2 ? args[2]+"/reply.png" : null);
        check(Math.abs(reply.row.getTranslationX()+300*reply.density)<0.01f, "Long drag follows the finger across the larger reply distance");
        reply.up(-300);
        check(reply.replies == 1 && reply.clicks() == 1, "Long left swipe invokes exactly one reply callback");
        Fixture backtrack = new Fixture(360); backtrack.down(); backtrack.move(-300); backtrack.move(-200); backtrack.up(-200);
        check(backtrack.downs == 1 && backtrack.clicks() == 1, "Dragging back from reply to medium distance selects only downvote");
        Fixture retract = new Fixture(360); retract.down(); retract.move(-300); retract.move(-30); retract.up(-30);
        check(retract.clicks() == 0, "Retracting below the short threshold cancels all actions");
        Fixture duration = new Fixture(); duration.down(); duration.move(-72);
        duration.event(MotionEvent.ACTION_MOVE, 128, 120, 2000);
        duration.event(MotionEvent.ACTION_UP, 128, 120, 2100);
        check(duration.ups == 1 && duration.clicks() == 1, "Holding a captured swipe never advances the distance-selected action");
        Fixture right = new Fixture(); right.down();
        check(!right.event(MotionEvent.ACTION_MOVE, 320, 120, 40) && !right.up(120) && right.clicks() == 0,
            "Right swipe remains with native dispatch");
        Fixture below = new Fixture(); below.down(); below.move(-30); below.up(-30);
        check(below.clicks() == 0, "Release below action threshold does nothing");
        Fixture cancel = new Fixture(); cancel.down(); cancel.move(-72);
        cancel.event(MotionEvent.ACTION_CANCEL, 128, 120, 80);
        check(cancel.clicks() == 0 && cancel.row.getTranslationX() == 0, "Cancelled drag does nothing and restores position");
        Fixture vertical = new Fixture(); vertical.down();
        check(!vertical.event(MotionEvent.ACTION_MOVE, 202, 160, 40), "Vertical scrolling stays with native dispatch");
        vertical.move(-72); vertical.up(-72);
        check(vertical.clicks() == 0 && vertical.activity.cancels == 0, "Vertical gesture cannot turn into a vote later");
        Fixture hold = new Fixture(); hold.down();
        hold.event(MotionEvent.ACTION_MOVE, 128, 120, ViewConfiguration.getLongPressTimeout()+1);
        hold.up(-72);
        check(hold.clicks() == 0 && hold.activity.cancels == 0, "Long press is preserved without a swipe action");
        Fixture multi = new Fixture(); multi.down(); multi.move(-72);
        multi.event(MotionEvent.ACTION_POINTER_DOWN, 128, 120, 60); multi.up(-72);
        check(multi.clicks() == 0, "Second pointer cancels the pending action");
        Fixture rebound = new Fixture(); rebound.down(); rebound.move(-72);
        bind.invoke(null, rebound.holder); rebound.holder.c0 = new Object(); rebound.up(-72);
        check(rebound.clicks() == 0 && rebound.row.getTranslationX() == 0, "Recycled/rebound row cannot act on the wrong comment");
        Fixture disabled = new Fixture(); disabled.holder.voteUpButton.setEnabled(false);
        disabled.down(); disabled.move(-72); disabled.up(-72);
        check(disabled.clicks() == 0, "Disabled native action is respected");
        Fixture hidden = new Fixture(); hidden.holder.voteUpButton.setVisibility(View.GONE);
        hidden.down(); hidden.move(-72); hidden.up(-72);
        check(hidden.clicks() == 0, "Hidden native action is respected");
        Fixture media = new Fixture(); media.row.addView(new ProtectedImage(media.activity));
        media.down(); media.move(-72); media.up(-72);
        check(media.clicks() == 0 && media.activity.cancels == 0, "Media/button touch target stays with native dispatch");
        Fixture paused = new Fixture(); paused.down(); paused.move(-72);
        gestures.getMethod("onPause", Object.class).invoke(null, new FakeFragment(paused.row));
        paused.up(-72);
        check(paused.clicks() == 0 && paused.row.getTranslationX() == 0, "Leaving comments cancels pending gesture and restores row");
        Fixture edge = new Fixture(); edge.event(MotionEvent.ACTION_DOWN, 392, 120, 0);
        edge.event(MotionEvent.ACTION_MOVE, 272, 120, 40); edge.event(MotionEvent.ACTION_UP, 272, 120, 80);
        check(edge.clicks() == 0 && edge.activity.cancels == 0, "Screen-edge gesture stays with native/system Back");
        Fixture tap = new Fixture(); tap.down();
        check(!tap.up(0) && tap.clicks() == 0, "Tap is not consumed by the swipe patch");

        Method postBind = gestures.getMethod("bindPost", Object.class);
        for (int stage=0; stage<4; stage++) {
            Fixture post = new Fixture(360); final int[] actions = new int[4];
            post.holder.saveButton = new View(post.activity); post.holder.hideButton = new View(post.activity);
            post.holder.voteUpButton.setOnClickListener(v -> actions[0]++);
            post.holder.voteDownButton.setOnClickListener(v -> actions[1]++);
            post.holder.saveButton.setOnClickListener(v -> actions[2]++);
            post.holder.hideButton.setOnClickListener(v -> actions[3]++);
            postBind.invoke(null, post.holder);
            float distance = new float[]{72,160,240,320}[stage];
            post.down(); post.move(-distance);
            check(Math.abs(post.row.getTranslationX()+distance*post.density)<0.01f, "Post stage "+stage+" follows finger exactly");
            inspectHint(gestures, post, new int[]{1,2,4,5}[stage], null);
            post.up(-distance);
            check(actions[stage]==1 && actions[0]+actions[1]+actions[2]+actions[3]==1,
                "Post stage "+stage+" invokes only its selected native callback");
            check(post.row.getTranslationX()==0, "Post translation restores after release");
        }
        Fixture recycledPost = new Fixture(); postBind.invoke(null, recycledPost.holder);
        recycledPost.down(); recycledPost.move(-72); recycledPost.holder.b0=new Object(); recycledPost.up(-72);
        check(recycledPost.clicks()==0, "Recycled post cannot vote on another submission");

        // Exercise the actual extension's formatting against the APK's real Toolbar class.
        Class<?> toolbarClass = Class.forName("androidx.appcompat.widget.Toolbar", true, loader);
        Object toolbar = toolbarClass.getConstructor(Context.class, android.util.AttributeSet.class).newInstance(context, null);
        toolbarClass.getMethod("setTitle", CharSequence.class).invoke(toolbar, "r/TestSubreddit");
        toolbarClass.getMethod("setSubtitle", CharSequence.class).invoke(toolbar, "Thread title");
        TextView title = null, subtitle = null;
        ViewGroup group = (ViewGroup) toolbar;
        for (int i=0; i<group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof TextView && ((TextView)child).getText().toString().equals("r/TestSubreddit")) title=(TextView)child;
            if (child instanceof TextView && ((TextView)child).getText().toString().equals("Thread title")) subtitle=(TextView)child;
        }
        check(title != null && subtitle != null, "Real Boost Toolbar exposes its two header lines");
        float original = title.getTextSize();
        Class<?> headerClass = Class.forName("app.morphe.extension.boost.CommentsChromeTweaks$Header", true, loader);
        Constructor<?> ctor = headerClass.getDeclaredConstructor(Object.class, ViewGroup.class, toolbarClass, Object.class);
        ctor.setAccessible(true);
        Object header = ctor.newInstance(new Object(), new FrameLayout(context), toolbar, new Manager());
        Method match = headerClass.getDeclaredMethod("matchTitleSize"); match.setAccessible(true); match.invoke(header);
        check(Math.abs(title.getTextSize()-subtitle.getTextSize()) < 0.01f, "Subreddit and thread title use identical measured text size");
        Method restore = headerClass.getDeclaredMethod("restoreTitleSize"); restore.setAccessible(true); restore.invoke(header);
        check(Math.abs(title.getTextSize()-original) < 0.01f, "Native header text size restores exactly");
        System.out.println("RUNTIME UI CHECKS PASSED: " + checks);
        System.exit(0);
    }
}
