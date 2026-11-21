package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONObject;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.Consumer;

/**
 * Experimental multi-video registration bridge for nicoid's native video rows.
 * No playback state is changed; only the visible list's native selection flags
 * are inspected. The approved v2.1.5-dev.10 runtime remains the base.
 */
public final class BulkVideoActions215 {
    private BulkVideoActions215() {}
    private static final String TAG = "nicoid-bulk-add";
    // The native NicoidVideoListActivity dispatches menu item ID 1 to Fragment.Y().
    // Keep the listener as a fast path, but the native ID is the reliable fallback.
    private static final int MENU_ENTER = 1, MENU_ADD = 0x4e430712;
    private static final String BUTTON_TAG = "nicoid_multi_select_sort";
    private static final String REGISTER_TAG = "nicoid_multi_register_action";
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<Activity> BUSY = Collections.newSetFromMap(new WeakHashMap<Activity,Boolean>());

    static int dp(Context c, int v) { return Math.round(v*c.getResources().getDisplayMetrics().density); }
    static int accent(Context c) {
        TypedValue value=new TypedValue();
        if(c.getTheme().resolveAttribute(android.R.attr.colorAccent,value,true)) {
            if(value.resourceId!=0)return c.getResources().getColor(value.resourceId);
            return value.data;
        }
        return Color.rgb(0,181,160);
    }
    static String tr(Context c,String ja,String en,String zh) {
        return LocalePatch215.label(c,ja,en,zh);
    }
    static Object field(Object target,String name) throws Exception {
        Field f=target.getClass().getField(name);return f.get(target);
    }
    static Object declared(Object target,String name) throws Exception {
        Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(target);
    }
    static Object fragment(Activity a) {
        try{return field(a,"F");}catch(Exception ignored){return null;}
    }
    static int kind(Object f) {
        try{return ((Number)field(f,"g0")).intValue();}catch(Exception ignored){return -1;}
    }
    static int type(Object f) {
        try{return ((Number)field(f,"h0")).intValue();}catch(Exception ignored){return -1;}
    }
    /** Existing saved lists/history retain their delete and move actions. */
    public static boolean discovery(int kind,int type) {
        return kind>=0 && kind!=5 && kind!=8 && kind!=9
                && type!=4 && type!=8 && type!=9;
    }
    /** Same predicate as the existing BulkSelection Move command. */
    static boolean hasMoveAction(Object f) {return kind(f)==5 && type(f)!=4;}
    /** Only local/account watch histories need both Delete and Register. */
    static boolean history(Object f) {return kind(f)==8 || type(f)==4;}
    static boolean selecting(Object f) {
        try{return Boolean.TRUE.equals(field(f,"k0"));}catch(Exception ignored){return false;}
    }
    static void toast(Activity a,String ja,String en,String zh) {
        if(a.isFinishing()||a.isDestroyed())return;
        Toast.makeText(a,tr(a,ja,en,zh),Toast.LENGTH_LONG).show();
    }
    static AlertDialog.Builder dialog(Activity a) {
        try{
            Method builder=Class.forName("e.e.a.UiDialogs").getMethod("builder",Context.class);
            return (AlertDialog.Builder)builder.invoke(null,a);
        }catch(Exception e){return new AlertDialog.Builder(a);}
    }
    static void log(Throwable e){Log.w(TAG,"Bulk action failed",e);}

    /**
     * Called by the existing BulkSelection.menu hook (native list and cache).
     * This deliberately does not add a new menu entry to saved lists.
     */
    public static void menu(Activity a,Menu menu) {
        if(a==null||menu==null)return;
        final String cls=a.getClass().getName();
        if(cls.endsWith("NicoidCacheManagerActivity")) {
            MAIN.post(()->installSort(a,()->toggleCache(a)));
            return;
        }
        if(!cls.endsWith("NicoidVideoListActivity"))return;
        Object f=fragment(a);
        if(f==null) {
            // First options menu may precede fragment attachment.
            MAIN.post(()->{
                Object attached=fragment(a);
                if(attached!=null&&!discovery(kind(attached),type(attached)))
                    installSort(a,()->toggleNative(a));
            });
            return;
        }
        final boolean saved=!discovery(kind(f),type(f));
        if(saved)MAIN.post(()->installSort(a,()->toggleNative(a)));
        if(!selecting(f)) {
            if(saved)return;
            // Native queue action is added before this hook; settings and refresh
            // are appended afterwards. Zero order preserves that insertion order.
            MenuItem start=menu.add(0,MENU_ENTER,0,
                tr(a,"複数選択","Select multiple","選取多個"));
            start.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            start.setOnMenuItemClickListener(item->{
                Log.i(TAG,"Native list selection requested from options menu");
                toggleNative(a);return true;
            });
        } else {
            // Mylist/Watch Later already have the native Move action.
            // Do not add a duplicate registration command to those screens.
            if(history(f)||discovery(kind(f),type(f))) {
                menu.add(0,MENU_ADD,100,tr(a,"一括登録","Add selected videos","批次加入"))
                    .setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
                menu.findItem(MENU_ADD).setOnMenuItemClickListener(item->{
                    chooseAction(a,f);return true;
                });
            }
            onSelectionChanged(f);
        }
    }

    /** Called from LocalPlaylists.menuOrFeed; no changes to catalog menus. */
    public static void localMenu(Activity a,Menu menu) {
        if(a==null||!a.getIntent().getBooleanExtra("nicoid_local_playlists",false))return;
        MAIN.post(()->installSort(a,()->toggleLocal(a)));
    }

    static void toggleNative(Activity a) {
        Object f=fragment(a);
        if(f==null)return;
        try {f.getClass().getMethod("Y").invoke(f);a.invalidateOptionsMenu();}
        catch(Exception e){log(e);}
    }
    static void toggleCache(Activity a) {
        try{a.getClass().getMethod("s").invoke(a);a.invalidateOptionsMenu();}
        catch(Exception e){log(e);}
    }
    static void toggleLocal(Activity a) {
        try{
            Class<?> owner=Class.forName("e.e.a.LocalPlaylists");
            Field pages=owner.getDeclaredField("PAGES");pages.setAccessible(true);
            Object page=((Map<?,?>)pages.get(null)).get(a);
            if(page==null||declared(page,"folder")==null)return;
            Field mode=page.getClass().getDeclaredField("selecting");mode.setAccessible(true);
            if(mode.getBoolean(page)){
                owner.getMethod("back",Activity.class).invoke(null,a);
            }else{
                mode.setBoolean(page,true);
                Method changed=page.getClass().getDeclaredMethod("selectionChanged");
                changed.setAccessible(true);changed.invoke(page);
            }
            a.invalidateOptionsMenu();
            MAIN.post(()->syncIcon(a));
        }catch(Exception e){log(e);}
    }

    static Spinner findSpinner(View root) {
        if(root==null||root.getVisibility()!=View.VISIBLE)return null;
        if(root instanceof Spinner) return root.isShown()?(Spinner)root:null;
        if(root instanceof ViewGroup){
            ViewGroup group=(ViewGroup)root;
            for(int i=0;i<group.getChildCount();i++){
                Spinner child=findSpinner(group.getChildAt(i));
                if(child!=null)return child;
            }
        }
        return null;
    }
    static View cacheSortRoot(Activity a) {
        if(!a.getClass().getName().endsWith("NicoidCacheManagerActivity"))
            return a.getWindow().getDecorView();
        // The cache screen contains hidden/auxiliary spinners outside the
        // visible cache sort bar. Prefer its actual attached R layout.
        for(String name:new String[]{"R","y"})try {
            Object candidate=field(a,name);
            if(candidate instanceof View && ((View)candidate).isShown()
                    && findSpinner((View)candidate)!=null)return (View)candidate;
        }catch(Exception ignored){}
        return a.getWindow().getDecorView();
    }
    /**
     * Keep the original sort Spinner and its adapter/listeners intact. Only
     * wrap it in a horizontal row with a 48dp direct-selection action.
     */
    static void installSort(Activity a,Runnable activate) {
        if(a.isFinishing()||a.isDestroyed())return;
        View root=cacheSortRoot(a);
        Spinner spinner=findSpinner(root);
        if(spinner==null||!(spinner.getParent() instanceof ViewGroup))return;
        ViewGroup parent=(ViewGroup)spinner.getParent();
        if(parent.findViewWithTag(BUTTON_TAG)!=null){syncIcon(a);return;}
        int index=parent.indexOfChild(spinner);
        ViewGroup.LayoutParams previous=spinner.getLayoutParams();
        LinearLayout row=new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setTag(BUTTON_TAG+"_row");
        parent.removeView(spinner);
        parent.addView(row,index,previous);
        row.addView(spinner,new LinearLayout.LayoutParams(0,-1,1));
        ImageButton button=new ImageButton(a);
        button.setTag(BUTTON_TAG);
        button.setPadding(dp(a,9),dp(a,9),dp(a,9),dp(a,9));
        button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
        button.setImageDrawable(new SelectionIcon(false,accent(a),dp(a,30)));
        TypedValue color=new TypedValue();
        if(a.getTheme().resolveAttribute(android.R.attr.colorAccent,color,true)){
            int tint=color.resourceId!=0?a.getResources().getColor(color.resourceId):color.data;
            button.setImageTintList(ColorStateList.valueOf(tint));
        }
        TypedValue bg=new TypedValue();
        if(a.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless,bg,true)
                && bg.resourceId!=0)button.setBackgroundResource(bg.resourceId);
        else button.setBackgroundColor(Color.TRANSPARENT);
        button.setContentDescription(tr(a,"複数選択","Select multiple","選取多個"));
        button.setOnClickListener(v->{activate.run();MAIN.post(()->syncIcon(a));});
        row.addView(button,new LinearLayout.LayoutParams(dp(a,48),dp(a,48)));
        syncIcon(a);
    }

    /** State is shared by the toolbar button, menu, long press and Back action. */
    static void syncIcon(Activity a) {
        if(a.isFinishing()||a.isDestroyed())return;
        View found=a.getWindow().getDecorView().findViewWithTag(BUTTON_TAG);
        if(!(found instanceof ImageButton))return;
        boolean active=false;
        try {
            if(a.getIntent().getBooleanExtra("nicoid_local_playlists",false)){
                Class<?> cls=Class.forName("e.e.a.LocalPlaylists");
                Field pages=cls.getDeclaredField("PAGES");pages.setAccessible(true);
                Object page=((Map<?,?>)pages.get(null)).get(a);
                if(page!=null){
                    Field f=page.getClass().getDeclaredField("selecting");
                    f.setAccessible(true);active=f.getBoolean(page);
                }
            }else if(a.getClass().getName().endsWith("NicoidCacheManagerActivity")) {
                active=Boolean.TRUE.equals(field(a,"G"));
            }else{
                Object f=fragment(a);
                active=f!=null&&selecting(f);
            }
        }catch(Exception e){log(e);}
        ImageButton button=(ImageButton)found;
        button.setImageDrawable(new SelectionIcon(active,accent(a),dp(a,30)));
        button.setSelected(active);
        button.setContentDescription(active?
            tr(a,"複数選択を終了","Exit multiple selection","結束多重選取"):
            tr(a,"複数選択","Select multiple","選取多個"));
    }

    /** Two checked rows in normal mode; a close mark while selecting. */
    /** Preserve native labels and avoid describing the cache tab as Ranking. */
    public static CharSequence cacheTabAccessibility(Object tab,CharSequence nativeText) {
        try {
            if("cache".equals(String.valueOf(declared(tab,"screen"))))
                return String.valueOf(declared(tab,"label"));
        }catch(Exception e){log(e);}
        return nativeText;
    }

    /** Draw an outlined cache/storage glyph at the existing 14dp tab-badge size. */
    public static void drawCacheTabBadge(Canvas canvas,Paint paint,Rect bounds) {
        if(bounds==null||bounds.isEmpty())return;
        int saved=canvas.save();
        Paint.Style previous=paint.getStyle();
        float width=paint.getStrokeWidth();
        try {
            canvas.translate(bounds.left,bounds.top);
            canvas.scale(bounds.width()/16f,bounds.height()/16f);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.5f);
            canvas.drawRoundRect(1.8f,2.3f,14.2f,13.7f,2f,2f,paint);
            canvas.drawLine(4.8f,5.5f,11.2f,5.5f,paint);
        }finally {
            paint.setStyle(previous);
            paint.setStrokeWidth(width);
            canvas.restoreToCount(saved);
        }
    }

    static final class SelectionIcon extends Drawable {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean active;
        private final int color,intrinsic;
        SelectionIcon(boolean active,int color,int size){this.active=active;this.color=color;intrinsic=size;}
        @Override public void draw(Canvas c) {
            Rect b=getBounds();
            float size=Math.min(b.width(),b.height());
            float scale=size/28f;
            c.save();
            c.translate(b.centerX()-12*scale,b.centerY()-12*scale);
            c.scale(scale,scale);
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2f);paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            if(active){
                c.drawRoundRect(2,2,22,22,3,3,paint);
                c.drawLine(7,7,17,17,paint);
                c.drawLine(17,7,7,17,paint);
            }else{
                for(int n=0;n<2;n++){
                    float y=3+n*11;
                    c.drawRoundRect(1,y,9,y+8,1,1,paint);
                    c.drawLine(3,y+4,5,y+6,paint);
                    c.drawLine(5,y+6,8,y+2,paint);
                    c.drawLine(13,y+4,24,y+4,paint);
                }
            }
            c.restore();
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
        @Override public int getIntrinsicWidth(){return intrinsic;}
        @Override public int getIntrinsicHeight(){return intrinsic;}
    }


    /**
     * Native BulkSelection re-creates its footer on entering selection mode.
     * Attach after its updates so long press, menu entry and the sort shortcut
     * produce exactly the same actions, without replacing delete or move.
     */
    public static void onSelectionChanged(Object owner) {
        MAIN.post(()->{
            try {
                if(owner==null||!owner.getClass().getName().endsWith("NicoidVideoListFragment"))return;
                Activity a=(Activity)field(owner,"o0");
                if(a==null||a.isFinishing()||a.isDestroyed())return;
                syncIcon(a);
                if(!selecting(owner))return;
                View root=(View)field(owner,"Z");
                if(root==null)return;
                View area=root.findViewById(0x7f0801bd);
                if(!(area instanceof ViewGroup))return;
                ViewGroup container=(ViewGroup)area;
                if(container.getChildCount()==0||!(container.getChildAt(0) instanceof LinearLayout))return;
                LinearLayout footer=(LinearLayout)container.getChildAt(0);
                // Discovery lists have no delete semantics. The native Delete
                // placeholder is the first selection button; repurpose it to
                // Register, matching the pre-dev.14 UI without an extra action.
                if(discovery(kind(owner),type(owner))) {
                    View duplicate=footer.findViewWithTag(REGISTER_TAG);
                    if(duplicate!=null)footer.removeView(duplicate);
                    if(footer.getChildCount()>0&&footer.getChildAt(0) instanceof Button) {
                        Button primary=(Button)footer.getChildAt(0);
                        primary.setText(tr(a,"登録","Add","加入"));
                        primary.setContentDescription(tr(a,"選択した動画を登録",
                                "Add selected videos","加入已選影片"));
                        primary.setOnClickListener(v->chooseAction(a,owner));
                        primary.setEnabled(!snapshot(owner).isEmpty());
                    }
                    return;
                }
                // Mylist and Watch Later already provide Move. Other saved
                // lists keep their original actions unchanged.
                if(!history(owner)) {
                    View duplicate=footer.findViewWithTag(REGISTER_TAG);
                    if(duplicate!=null)footer.removeView(duplicate);
                    return;
                }
                android.widget.TextView register=(android.widget.TextView)
                        footer.findViewWithTag(REGISTER_TAG);
                if(register==null){
                    register=new android.widget.TextView(a);
                    register.setTag(REGISTER_TAG);
                    register.setGravity(android.view.Gravity.CENTER);
                    register.setSingleLine(true);
                    register.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP,14f);
                    register.setTextColor(accent(a));
                    register.setPadding(dp(a,12),0,dp(a,12),0);
                    register.setMinWidth(dp(a,48));
                    TypedValue ripple=new TypedValue();
                    if(a.getTheme().resolveAttribute(
                            android.R.attr.selectableItemBackground,ripple,true)
                            && ripple.resourceId!=0)
                        register.setBackgroundResource(ripple.resourceId);
                    register.setText(tr(a,"登録","Add","加入"));
                    register.setContentDescription(tr(a,"選択した動画を登録",
                            "Add selected videos","加入已選影片"));
                    register.setOnClickListener(v->chooseAction(a,owner));
                    // [Delete] [Add] [flex spacer] [Done] matches Move placement.
                    LinearLayout.LayoutParams params=
                            new LinearLayout.LayoutParams(-2,dp(a,48));
                    params.leftMargin=dp(a,20);
                    footer.addView(register,Math.min(1,footer.getChildCount()),params);
                }
                register.setEnabled(!snapshot(owner).isEmpty());
                register.setAlpha(register.isEnabled()?1f:0.38f);
            }catch(Exception e){log(e);}
        });
    }

    /**
     * Preserve the native delete confirmation callback. Only replace the
     * numeric-only message in the local playlist dialog.
     */
    public static String playlistDeleteMessage(Object page,int count) {
        try {
            Activity a=(Activity)declared(page,"a");
            @SuppressWarnings("unchecked")
            Set<String> selected=(Set<String>)declared(page,"selected");
            @SuppressWarnings("unchecked")
            List<JSONObject> visible=(List<JSONObject>)declared(page,"visible");
            ArrayList<String> titles=new ArrayList<>();
            for(JSONObject video:visible) {
                if(selected.contains(video.optString("id"))) {
                    String title=video.optString("title").trim();
                    if(!title.isEmpty())titles.add(title);
                }
            }
            String message=tr(a,
                "選択した"+count+"件の動画をプレイリストから削除します。",
                "Remove "+count+" selected videos from this playlist?",
                "確定要從播放清單移除所選 "+count+" 部影片嗎？");
            for(int n=0;n<Math.min(3,titles.size());n++)message+="\n・"+titles.get(n);
            if(titles.size()>3)message+="\n"+tr(a,"ほか"+(titles.size()-3)+"件",
                "and "+(titles.size()-3)+" more",
                "以及其他 "+(titles.size()-3)+" 部");
            return message;
        }catch(Exception e){log(e);return count+"件の動画を削除しますか？";}
    }

    static String value(Object row,String key) {
        try {
            Object v=row.getClass().getMethod("a",String.class).invoke(row,key);
            return v==null?"":v.toString();
        }catch(Exception ignored){return "";}
    }
    static String id(String url){
        if(url==null)return "";
        int end=url.indexOf('?',0);
        String clean=end<0?url:url.substring(0,end);
        int slash=clean.lastIndexOf('/');
        String v=slash<0?clean:clean.substring(slash+1);
        return v.matches("(?:sm|nm|so|ss)?[0-9]+")?v:"";
    }
    static final class Video {
        final String id,url,title,owner,thumbnail;
        Video(String i,String u,String t,String o,String image) {
            id=i;url=u;title=t;owner=o;thumbnail=image;
        }
    }
    static ArrayList<Video> snapshot(Object f) {
        LinkedHashMap<String,Video> videos=new LinkedHashMap<>();
        try{
            ArrayList<?> rows=(ArrayList<?>)field(f,"a0");
            for(Object row:rows){
                Object on=row.getClass().getMethod("a",String.class).invoke(row,"isselect");
                if(!Boolean.TRUE.equals(on))continue;
                String url=value(row,"videourl"),videoId=id(url);
                if(videoId.isEmpty())continue;
                String owner="";
                try{Object v=row.getClass().getField("y").get(row);if(v!=null)owner=v.toString();}
                catch(Exception ignored){}
                videos.putIfAbsent(videoId,new Video(videoId,url,value(row,"title"),owner,value(row,"thumbnail")));
            }
        }catch(Exception e){log(e);}
        return new ArrayList<>(videos.values());
    }
    static void chooseAction(Activity a,Object f) {
        ArrayList<Video> videos=snapshot(f);
        if(videos.isEmpty()){toast(a,"動画を選択してください","Select videos first","請先選取影片");return;}
        String[] choices={
            tr(a,"プレイリストに追加","Add to playlist","加入播放清單"),
            tr(a,"マイリストに追加","Add to Mylist","加入我的清單"),
            tr(a,"とりあえずマイリストに追加","Add to Watch Later","加入稍後觀看")
        };
        dialog(a).setTitle(tr(a, videos.size()+"件を登録","Add "+videos.size()+" videos","加入 "+videos.size()+" 部影片"))
            .setItems(choices,(d,which)->{
                if(which==0)local(a,videos);
                else if(which==1)accountChooser(a,videos);
                else accountAdd(a,"deflist",videos);
            }).setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null).show();
    }

    @SuppressWarnings("unchecked")
    static void local(Activity a,ArrayList<Video> videos) {
        try {
            Class<?> cls=Class.forName("e.e.a.LocalPlaylists");
            Method choose=cls.getDeclaredMethod("choose",Context.class,String.class,Consumer.class);
            choose.setAccessible(true);
            choose.invoke(null,a,null,(Consumer<String>) folder->localAdd(a,folder,videos));
        }catch(Exception e){log(e);toast(a,"プレイリストを開けませんでした","Unable to open playlists","無法開啟播放清單");}
    }

    static void localAdd(Activity a,String folder,ArrayList<Video> videos) {
        if(!begin(a))return;
        try{
            Class<?> cls=Class.forName("e.e.a.LocalPlaylists");
            Class<?> edit=Class.forName("e.e.a.LocalPlaylists$Edit");
            int[] result={0,0};
            Object operation=Proxy.newProxyInstance(edit.getClassLoader(),new Class[]{edit},(proxy,method,args)->{
                if(!"apply".equals(method.getName()))return null;
                Object data=args[0];
                JSONArray list=(JSONArray)data.getClass().getField("videos").get(data);
                Method add=data.getClass().getMethod("add",String.class,String.class,String.class,String.class,String.class);
                for(Video video:videos) {
                    int prior=list.length();
                    add.invoke(data,folder,video.url,video.title,video.owner,video.thumbnail);
                    if(list.length()>prior)result[0]++;
                    else result[1]++;
                }
                return null;
            });
            Method change=cls.getDeclaredMethod("change",Context.class,edit,Consumer.class);
            change.setAccessible(true);
            change.invoke(null,a,operation,(Consumer<Boolean>)ok->{
                finish(a);
                if(ok)toastResult(a,result[0],result[1],0);
            });
        }catch(Exception e){finish(a);log(e);toast(a,"登録できませんでした","Unable to add videos","無法新增影片");}
    }

    static boolean begin(Activity a) {
        synchronized(BUSY){if(BUSY.contains(a))return false;BUSY.add(a);return true;}
    }
    static void finish(Activity a){synchronized(BUSY){BUSY.remove(a);}}
    static void toastResult(Activity a,int added,int skipped,int failed) {
        toast(a,"登録 "+added+"件・スキップ "+skipped+"件・失敗 "+failed+"件",
             "Added "+added+" / skipped "+skipped+" / failed "+failed,
             "已新增 "+added+" / 跳過 "+skipped+" / 失敗 "+failed);
    }

    static Object newTask() throws Exception {
        Constructor<?> ctor=Class.forName("e.e.a.NetworkTask").getDeclaredConstructor();
        ctor.setAccessible(true);return ctor.newInstance();
    }
    static JSONObject request(String url,String method) throws Exception {
        Class<?> owner=Class.forName("e.e.a.VideoDetails");
        Class<?> task=Class.forName("e.e.a.NetworkTask");
        Method call=owner.getDeclaredMethod("request",String.class,String.class,boolean.class,task);
        call.setAccessible(true);
        return (JSONObject)call.invoke(null,url,method,true,newTask());
    }
    static void initialize(Activity a) throws Exception {
        Method m=Class.forName("e.e.a.VideoDetails").getDeclaredMethod("initializeCookies",Context.class);
        m.setAccessible(true);m.invoke(null,a);
    }
    static void accountChooser(Activity a,ArrayList<Video> videos) {
        if(!begin(a))return;
        WORK.execute(()->{
            ArrayList<String> ids=new ArrayList<>(),names=new ArrayList<>();
            boolean ok=false;
            try {
                initialize(a);
                JSONArray lists=request("https://nvapi.nicovideo.jp/v1/users/me/mylists?sampleItemCount=3","GET")
                    .getJSONObject("data").getJSONArray("mylists");
                for(int n=0;n<lists.length();n++){
                    JSONObject list=lists.getJSONObject(n);
                    String ident=list.optString("id");
                    if(ident.matches("[0-9]+")){ids.add(ident);names.add(list.optString("name"));}
                }
                ok=true;
            }catch(Exception e){log(e);}
            boolean success=ok;
            MAIN.post(()->{
                finish(a);
                if(a.isFinishing())return;
                if(!success){toast(a,"マイリストを取得できませんでした","Unable to load Mylists","無法取得我的清單");return;}
                names.add(tr(a,"新しいマイリストを作成","Create a Mylist","建立新清單"));
                dialog(a).setTitle(tr(a,"登録先のマイリスト","Choose Mylist","選擇我的清單"))
                    .setItems(names.toArray(new String[0]),(d,n)->{
                        if(n<ids.size())accountAdd(a,ids.get(n),videos);
                        else accountCreate(a,videos);
                    }).setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null).show();
            });
        });
    }
    static void accountCreate(Activity a,ArrayList<Video> videos) {
        try{
            Class<?> owner=Class.forName("e.e.a.AccountLists");
            Class<?> cb=Class.forName("e.e.a.AccountLists$Created");
            Object handler=Proxy.newProxyInstance(cb.getClassLoader(),new Class[]{cb},(proxy,method,args)->{
                if("done".equals(method.getName()))accountAdd(a,String.valueOf(args[0]),videos);
                return null;
            });
            Method create=owner.getDeclaredMethod("create",Activity.class,cb);
            create.setAccessible(true);create.invoke(null,a,handler);
        }catch(Exception e){log(e);toast(a,"マイリストを作成できませんでした","Unable to create Mylist","無法建立清單");}
    }
    static void accountAdd(Activity a,String target,ArrayList<Video> videos) {
        if(!target.matches("(?:[0-9]+|deflist)")||!begin(a))return;
        WORK.execute(()->{
            int added=0,failed=0;
            try{initialize(a);}catch(Exception e){log(e);}
            for(Video video:videos) {
                try{
                    String path="https://nvapi.nicovideo.jp/v1/users/me/mylists/"
                        +Uri.encode(target)+"/items?itemId="+Uri.encode(video.id)+"&description=";
                    request(path,"POST");added++;
                }catch(Exception e){failed++;log(e);}
                if(Thread.currentThread().isInterrupted())break;
            }
            final int yes=added,no=failed;
            MAIN.post(()->{finish(a);if(!a.isFinishing())toastResult(a,yes,0,no);});
        });
    }
}
