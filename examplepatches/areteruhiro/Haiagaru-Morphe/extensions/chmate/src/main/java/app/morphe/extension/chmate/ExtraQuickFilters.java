package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;

/** Per-adapter display filters. Native DAT, read counts, NG flags and navigation stay untouched. */
public final class ExtraQuickFilters {
    private static final String[] LABELS = {"人気レス", "リンク", "画像", "動画", "AA", "自分", "返信"};
    private static final String[] KINDS = {"POPULAR", "LINK", "IMAGE", "MOVIE"};
    private static final ThreadLocal<Boolean> RESETTING=new ThreadLocal<>();
    static boolean resetting(){return Boolean.TRUE.equals(RESETTING.get());}
    private static final Map<Object, State> STATES = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, WeakReference<Bar>> BARS = new WeakHashMap<>();
    private static final Map<View, WeakReference<PinnedPanel>> PINNED = new WeakHashMap<>();
    private static final Map<Object, WeakReference<Object>> FRAGMENTS = new WeakHashMap<>();
    private static final ArrayList<WeakReference<Object>> OWNERS = new ArrayList<>();
    private static final ArrayList<Threshold> THRESHOLDS = new ArrayList<>();
    /** Called by the native toolbar dispatcher. Its anchor View is reused: never attach listeners to it. */
    public static boolean longClick(Object fragment,View button){
        if(button==null||button.getId()!=QuickFilterToolbar.ID)return false;
        boolean done=reset(fragment);
        Toast.makeText(button.getContext(),done?"フィルターを解除しました":"フィルターを解除できませんでした",Toast.LENGTH_SHORT).show();
        return true;
    }
    static void updateOptions(Activity activity){
        {
            List<Object> reset=new ArrayList<>();
            int allowed=0;for(int i=4;i<7;i++)if(QuickFilterOptions.visible(i))allowed|=1<<(i-4);
            synchronized(STATES){for(Map.Entry<Object,State> entry:STATES.entrySet())if((entry.getValue().extra&~allowed)!=0){entry.getValue().extra&=allowed;reset.add(entry.getKey());}}
            for(Object adapter:reset)try{rebuild(adapter);}catch(Exception error){Log.w("Haiagaru","Disable extra filters",error);}
        }
        for(WeakReference<Bar> ref:new ArrayList<>(BARS.values())){Bar bar=ref.get();if(bar!=null)bar.post(bar::update);}
        for(WeakReference<Object> ref:new ArrayList<>(OWNERS))if(ref.get()!=null){FloatingFilterButton.update(ref.get());updatePinned(ref.get());}
    }
    private static void styleButton(ToggleButton button){
        float density=button.getResources().getDisplayMetrics().density;
        int accent=themeColor(button.getContext(),android.R.attr.colorAccent,button.getCurrentTextColor());
        int text=button.getCurrentTextColor();
        android.graphics.drawable.StateListDrawable states=new android.graphics.drawable.StateListDrawable();
        for(boolean checked:new boolean[]{true,false}){
            android.graphics.drawable.GradientDrawable shape=new android.graphics.drawable.GradientDrawable();shape.setCornerRadius(8*density);
            shape.setColor(checked?(accent&0x00ffffff)|0x18000000:android.graphics.Color.TRANSPARENT);
            shape.setStroke(Math.max(1,(int)density),checked?accent:(text&0x00ffffff)|0x30000000);
            states.addState(checked?new int[]{android.R.attr.state_checked}:new int[0],shape);
        }
        button.setBackground(states);button.setMinWidth((int)(80*density));
    }
    private static int themeColor(Context context,int attr,int fallback){
        android.content.res.TypedArray colors=context.obtainStyledAttributes(new int[]{attr});
        try{return colors.getColor(0,fallback);}finally{colors.recycle();}
    }
    private static int bottomInset(Activity activity){
        android.graphics.Rect visible=new android.graphics.Rect();View decor=activity.getWindow().getDecorView();decor.getWindowVisibleDisplayFrame(visible);
        return Math.max(0,decor.getHeight()-visible.bottom);
    }
    /** Same controls for the transient popup and the non-modal, persistent panel. */
    private static final class BottomControls extends LinearLayout {
        final Object adapter;final ToggleButton[] buttons=new ToggleButton[7];
        final Activity activity;final TextView handle;final ScrollView scroll;Runnable resized=()->{};
        int liveHeight;float startY;int startHeight;boolean dragging;
        BottomControls(Activity activity,Object adapter,Runnable beforeImage){
            super(activity);this.activity=activity;this.adapter=adapter;setOrientation(VERTICAL);
            GridLayout grid=new GridLayout(activity);grid.setColumnCount(4);
            int pad=Math.round(8*getResources().getDisplayMetrics().density);grid.setPadding(pad,pad,pad,pad);
            handle=new TextView(activity);handle.setText("━━");handle.setGravity(android.view.Gravity.CENTER);handle.setTextSize(16);
            handle.setContentDescription("フィルターパネルの高さを調整");handle.setTag("haiagaru.bottomFilterResizeHandle");
            addView(handle,new LinearLayout.LayoutParams(-1,dp(28)));
            scroll=new ScrollView(activity);scroll.setFillViewport(false);scroll.addView(grid,new ScrollView.LayoutParams(-1,-2));
            addView(scroll,new LinearLayout.LayoutParams(-1,-2,1));
            handle.setOnTouchListener((v,event)->{
                switch(event.getActionMasked()){
                    case android.view.MotionEvent.ACTION_DOWN:
                        startY=event.getRawY();startHeight=getHeight();dragging=true;v.getParent().requestDisallowInterceptTouchEvent(true);return true;
                    case android.view.MotionEvent.ACTION_MOVE:
                        if(!dragging)return false;liveHeight=clamp(startHeight+Math.round(startY-event.getRawY()));requestLayout();resized.run();return true;
                    case android.view.MotionEvent.ACTION_UP:
                        if(!dragging)return false;dragging=false;
                        if(liveHeight>0)activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).edit().putInt(QuickFilterOptions.HEIGHT,Math.max(1,Math.round(liveHeight/getResources().getDisplayMetrics().density))).apply();
                        liveHeight=0;v.getParent().requestDisallowInterceptTouchEvent(false);v.performClick();requestLayout();resized.run();return true;
                    case android.view.MotionEvent.ACTION_CANCEL:
                        dragging=false;liveHeight=0;v.getParent().requestDisallowInterceptTouchEvent(false);requestLayout();resized.run();return true;
                    default:return false;
                }
            });
            setBackgroundColor(themeColor(activity,android.R.attr.colorBackground,android.graphics.Color.DKGRAY));
            for(int i=0;i<buttons.length;i++){
                final int index=i;ToggleButton button=new ToggleButton(activity);buttons[i]=button;button.setAllCaps(false);button.setTextSize(13);styleButton(button);
                button.setMinimumHeight(pad*8);GridLayout.LayoutParams params=new GridLayout.LayoutParams(GridLayout.spec(i/4),GridLayout.spec(i%4,1f));params.width=0;params.height=-2;params.setMargins(pad/2,pad/2,pad/2,pad/2);grid.addView(button,params);
                button.setOnClickListener(v->{try{
                    boolean requested=button.isChecked();toggle(adapter,index,false,true);
                    if(index<4&&!(index==0&&PopularReplies.enabledFor(activity))){State state=state(adapter);state.pendingFilters[index]=requested;state.pendingFilterMask|=1<<index;}
                    redraw();
                }catch(Exception error){Toast.makeText(activity,"フィルターを変更できませんでした",Toast.LENGTH_SHORT).show();redraw();}});
                if(i==2)button.setOnLongClickListener(v->{
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
                        beforeImage.run();
                        if(!activity.isFinishing()&&!activity.isDestroyed()&&!imageList(adapter))Toast.makeText(activity,"画像一覧を開けませんでした",Toast.LENGTH_SHORT).show();
                    });return true;
                });
            }
            redraw();
        }
        int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}
        int clamp(int value){
            android.graphics.Rect visible=new android.graphics.Rect();activity.getWindow().getDecorView().getWindowVisibleDisplayFrame(visible);
            int available=visible.height();if(available<=0)available=getResources().getDisplayMetrics().heightPixels;
            return Math.max(Math.min(dp(88),available),Math.min(value,Math.max(dp(88),available*3/5)));
        }
        @Override protected void onMeasure(int width,int height){
            int saved=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getInt(QuickFilterOptions.HEIGHT,0);
            int requested=liveHeight>0?liveHeight:saved>0?dp(saved):0;
            // Bound both modes to the available pane. The ScrollView keeps every filter reachable.
            super.onMeasure(width,View.MeasureSpec.makeMeasureSpec(clamp(requested>0?requested:Integer.MAX_VALUE),requested>0?View.MeasureSpec.EXACTLY:View.MeasureSpec.AT_MOST));
        }
        void redraw(){try{
            int handleVisibility=QuickFilterOptions.resizeHandle()?View.VISIBLE:View.GONE;if(handle.getVisibility()!=handleVisibility)handle.setVisibility(handleVisibility);
            boolean[] on=selected(adapter);String[] names=labels(adapter);
            for(int i=0;i<buttons.length;i++){
                ToggleButton button=buttons[i];
                if(!names[i].contentEquals(button.getText())){button.setTextOn(names[i]);button.setTextOff(names[i]);button.setText(names[i]);}
                if(button.isChecked()!=on[i])button.setChecked(on[i]);
                int visibility=QuickFilterOptions.visible(i)?View.VISIBLE:View.GONE;if(button.getVisibility()!=visibility)button.setVisibility(visibility);
            }
        }catch(Exception error){Log.w("Haiagaru","Bottom filter state",error);}}
    }
    private static boolean showBottomPanel(Activity activity,Object a)throws Exception{
        collect(a,PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o")));
        int pad=Math.round(8*activity.getResources().getDisplayMetrics().density);
        PopupWindow popup=new PopupWindow();BottomControls grid=new BottomControls(activity,a,popup::dismiss);
        popup.setContentView(grid);popup.setWidth(-1);popup.setHeight(-2);popup.setFocusable(true);popup.setOutsideTouchable(true);
        grid.resized=()->{if(!popup.isShowing())return;grid.measure(View.MeasureSpec.makeMeasureSpec(activity.getWindow().getDecorView().getWidth(),View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));popup.update(0,bottomInset(activity)+pad,-1,grid.getMeasuredHeight());};
        popup.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(themeColor(activity,android.R.attr.colorBackground,android.graphics.Color.DKGRAY)));popup.setElevation(pad*2);
        android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
        Runnable sync=new Runnable(){public void run(){if(!popup.isShowing())return;grid.redraw();handler.postDelayed(this,150);}};
        popup.setOnDismissListener(()->{handler.removeCallbacks(sync);state(a).pendingFilterMask=0;});
        popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
        popup.showAtLocation(activity.getWindow().getDecorView(),android.view.Gravity.BOTTOM,0,bottomInset(activity)+pad);handler.postDelayed(sync,150);return true;
    }
    private static void updatePinned(Object fragment){
        try{
            View root=(View)call(fragment,"getView",new Class<?>[0]);if(root==null)return;
            PinnedPanel binding=PINNED.containsKey(root)?PINNED.get(root).get():null;
            if(!QuickFilterOptions.pinned()){if(binding!=null)binding.close();return;}
            Activity activity=(Activity)call(fragment,"getActivity",new Class<?>[0]);if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
            if(binding==null){binding=new PinnedPanel(activity,fragment,root);PINNED.put(root,new WeakReference<>(binding));}
            binding.schedule();
        }catch(Exception error){Log.w("Haiagaru","Persistent filter setup",error);}
    }
    private static final class PinnedPanel implements View.OnAttachStateChangeListener,android.view.ViewTreeObserver.OnGlobalLayoutListener,android.view.ViewTreeObserver.OnPreDrawListener{
        final Activity activity;final View root;final FrameLayout host;final WeakReference<Object> fragment;
        final android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable render=this::layout;BottomControls panel;View list;int originalPadding,appliedPadding=-1;
        int originalMargin,appliedMargin=-1;boolean closed,queued,reservationChanged;
        final Map<View,int[]> popupPaddings=new WeakHashMap<>();
        PinnedPanel(Activity activity,Object fragment,View root){
            this.activity=activity;this.fragment=new WeakReference<>(fragment);this.root=root;host=activity.findViewById(android.R.id.content);
            root.addOnAttachStateChangeListener(this);root.getViewTreeObserver().addOnGlobalLayoutListener(this);
            root.getViewTreeObserver().addOnPreDrawListener(this);
            prime();
        }
        // Cached DAT restoration can run in the native list's very first measure,
        // before any global-layout callback. Reserve space before that measure,
        // including when a retained thread view is attached again.
        void prime(){
            if(closed||panel!=null)return;
            try{
                View current=findBeforeLayout(root);if(current==null)return;
                Object owner=fragment.get();if(owner==null)return;
                Object a=call(current,"getAdapter",new Class<?>[0]);
                if(a instanceof HeaderViewListAdapter)a=((HeaderViewListAdapter)a).getWrappedAdapter();
                if(a==null||!(legacy(a)||middle(a)||a.getClass().getName().equals("o.zzacr")))return;
                FRAGMENTS.put(a,new WeakReference<>(owner));
                list=current;originalPadding=list.getPaddingBottom();
                if(list.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)
                    originalMargin=((ViewGroup.MarginLayoutParams)list.getLayoutParams()).bottomMargin;
                collect(a,PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o")));
                panel=new BottomControls(activity,a,()->{});panel.resized=this::schedule;panel.setTag("haiagaru.persistentBottomFilters");
                panel.setElevation(8*root.getResources().getDisplayMetrics().density);panel.setVisibility(View.GONE);
                host.addView(panel,new FrameLayout.LayoutParams(-1,-2));
                int width=list.getWidth();if(width<=0)width=root.getWidth();
                if(width<=0)width=root.getResources().getDisplayMetrics().widthPixels;
                panel.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                reserve(panel.getMeasuredHeight());
            }catch(Exception error){Log.w("Haiagaru","Persistent filter initial reservation",error);detachPanel();}
        }
        View findBeforeLayout(View view){
            if(view instanceof ListView)return view;
            for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())
                if(type.getName().equals("androidx.recyclerview.widget.RecyclerView"))return view;
            if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);if(child.getVisibility()==View.GONE)continue;
                View found=findBeforeLayout(child);if(found!=null)return found;
            }}
            return null;
        }
        void reserve(int height){
            if(list.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                ViewGroup.MarginLayoutParams spacing=(ViewGroup.MarginLayoutParams)list.getLayoutParams();
                if(appliedMargin>=0&&spacing.bottomMargin!=appliedMargin)originalMargin=spacing.bottomMargin;
                appliedMargin=originalMargin+height;
                if(spacing.bottomMargin!=appliedMargin){spacing.bottomMargin=appliedMargin;list.setLayoutParams(spacing);reservationChanged=true;}
            }else{
                if(appliedPadding>=0&&list.getPaddingBottom()!=appliedPadding)originalPadding=list.getPaddingBottom();
                appliedPadding=originalPadding+height;
                if(list.getPaddingBottom()!=appliedPadding){list.setPadding(list.getPaddingLeft(),list.getPaddingTop(),list.getPaddingRight(),appliedPadding);reservationChanged=true;}
            }
        }
        void schedule(){if(closed||queued)return;queued=true;handler.post(render);}
        void layout(){queued=false;if(closed||!root.isAttachedToWindow())return;
            try{
                android.graphics.Rect bounds=new android.graphics.Rect(),visible=new android.graphics.Rect();
                View current=FilterPosition.findList(root);
                boolean shown=current!=null&&root.isShown()&&current.getGlobalVisibleRect(bounds);
                // Reserve real viewport space, not just padding: native unread-position
                // calculations use getHeight(), including in 242's RecyclerView path.
                // Recover the unreserved pane edge before placing the overlay; otherwise
                // each layout would shrink the pane by another panel height.
                if(current==list&&appliedMargin>=0)bounds.bottom+=Math.max(0,appliedMargin-originalMargin);
                root.getWindowVisibleDisplayFrame(visible);shown=shown&&bounds.intersect(visible);
                if(!shown){if(panel!=null)panel.setVisibility(View.GONE);return;}
                Object owner=fragment.get();if(owner==null){close();return;}Object a=adapter(owner);
                if(panel==null||panel.adapter!=a||list!=current){
                    detachPanel();prime();if(panel==null)return;
                }
                panel.redraw();panel.setVisibility(View.VISIBLE);
                panel.measure(View.MeasureSpec.makeMeasureSpec(bounds.width(),View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
                int height=panel.getMeasuredHeight(),width=bounds.width();FrameLayout.LayoutParams params=(FrameLayout.LayoutParams)panel.getLayoutParams();
                if(params.width!=width||params.height!=height){params.width=width;params.height=height;panel.setLayoutParams(params);}
                int[] origin=new int[2];host.getLocationOnScreen(origin);panel.setX(bounds.left-origin[0]);panel.setY(bounds.bottom-origin[1]-height);
                reserve(height);
                android.graphics.Rect filterBounds=new android.graphics.Rect();
                if(panel.getGlobalVisibleRect(filterBounds))updatePopupPadding(root,filterBounds);
            }catch(Exception error){Log.w("Haiagaru","Persistent filter layout",error);detachPanel();}
        }
        void updatePopupPadding(View view,android.graphics.Rect filterBounds){
            if(view!=list&&(view instanceof ListView||list.getClass().isInstance(view))){
                try{
                    Object candidate=call(view,"getAdapter",new Class<?>[0]);
                    if(candidate instanceof HeaderViewListAdapter)candidate=((HeaderViewListAdapter)candidate).getWrappedAdapter();
                    if(candidate!=null&&candidate.getClass()==panel.adapter.getClass()){
                        android.graphics.Rect bounds=new android.graphics.Rect();
                        int extra=view.isShown()&&view.getGlobalVisibleRect(bounds)&&bounds.left<filterBounds.right&&bounds.right>filterBounds.left
                                ?Math.max(0,Math.min(filterBounds.height(),bounds.bottom-filterBounds.top)):0;
                        int[] padding=popupPaddings.get(view);
                        if(extra>0){
                            if(padding==null){padding=new int[]{view.getPaddingBottom(),-1};popupPaddings.put(view,padding);}
                            if(padding[1]>=0&&view.getPaddingBottom()!=padding[1])padding[0]=view.getPaddingBottom();
                            padding[1]=padding[0]+extra;
                            if(view.getPaddingBottom()!=padding[1])view.setPadding(view.getPaddingLeft(),view.getPaddingTop(),view.getPaddingRight(),padding[1]);
                        }else if(padding!=null){restorePopupPadding(view,padding);popupPaddings.remove(view);}
                        return;
                    }
                }catch(Exception ignored){ /* Not a native response list. */ }
            }
            if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)updatePopupPadding(group.getChildAt(i),filterBounds);}
        }
        void restorePopupPadding(View view,int[] padding){if(view.getPaddingBottom()==padding[1])view.setPadding(view.getPaddingLeft(),view.getPaddingTop(),view.getPaddingRight(),padding[0]);}
        void detachPanel(){
            for(Map.Entry<View,int[]> item:new ArrayList<>(popupPaddings.entrySet()))restorePopupPadding(item.getKey(),item.getValue());
            popupPaddings.clear();if(panel!=null){host.removeView(panel);panel=null;}
            if(list!=null){
                if(appliedMargin>=0&&list.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                    ViewGroup.MarginLayoutParams spacing=(ViewGroup.MarginLayoutParams)list.getLayoutParams();
                    if(spacing.bottomMargin==appliedMargin){spacing.bottomMargin=originalMargin;list.setLayoutParams(spacing);}
                }
                if(list.getPaddingBottom()==appliedPadding)list.setPadding(list.getPaddingLeft(),list.getPaddingTop(),list.getPaddingRight(),originalPadding);
                list=null;
            }
            appliedPadding=-1;appliedMargin=-1;
        }
        public void onGlobalLayout(){schedule();}
        public boolean onPreDraw(){
            if(closed)return true;
            if(queued){handler.removeCallbacks(render);layout();}
            boolean changed=reservationChanged;reservationChanged=false;
            return !changed; // Never expose a frame whose native viewport is still full height.
        }
        public void onViewAttachedToWindow(View view){root.getViewTreeObserver().removeOnGlobalLayoutListener(this);root.getViewTreeObserver().addOnGlobalLayoutListener(this);root.getViewTreeObserver().removeOnPreDrawListener(this);root.getViewTreeObserver().addOnPreDrawListener(this);prime();schedule();}
        public void onViewDetachedFromWindow(View view){handler.removeCallbacks(render);queued=false;if(root.getViewTreeObserver().isAlive()){root.getViewTreeObserver().removeOnGlobalLayoutListener(this);root.getViewTreeObserver().removeOnPreDrawListener(this);}detachPanel();}
        void close(){if(closed)return;closed=true;handler.removeCallbacksAndMessages(null);root.removeOnAttachStateChangeListener(this);if(root.getViewTreeObserver().isAlive()){root.getViewTreeObserver().removeOnGlobalLayoutListener(this);root.getViewTreeObserver().removeOnPreDrawListener(this);}detachPanel();PINNED.remove(root);}
    }
    private static final class Threshold {
        final WeakReference<Object> list;final int value;
        Threshold(Object list,int value){this.list=new WeakReference<>(list);this.value=value;}
    }
    public static void observeConfig(Object list,Object unused,int ignored,Object config) {
        PopularNativeRows.config(config);
        try {
            Object base=PopularReplies.fullList(list);int value=((Number)field(config,"b")).intValue();
            synchronized(THRESHOLDS){THRESHOLDS.removeIf(t->t.list.get()==null||t.list.get()==base);THRESHOLDS.add(new Threshold(base,value));}
        }catch(Exception e){Log.w("Haiagaru","Native filter configuration",e);}
    }
    public static void observeConfigWithMode(Object mode,Object list,Object unused,int ignored,Object config) {
        observeConfig(list,unused,ignored,config);PopularNativeRows.mode(mode);
    }
    public static void register(Object fragment) {
        OWNERS.removeIf(ref -> ref.get()==null||ref.get()==fragment);
        OWNERS.add(new WeakReference<>(fragment));
        try { Activity activity=(Activity)call(fragment,"getActivity",new Class<?>[0]);if(activity!=null)updateOptions(activity); }
        catch(Exception ignored){}
    }
    private static final class State {
        Object rawSnapshot, appliedSnapshot;
        WeakReference<HaiagaruDialog> dialog=new WeakReference<>(null);
        String[] dialogLabels;
        int[] dialogIndices;
        int extra;
        int pendingFilterMask;
        boolean[] pendingFilters = new boolean[4];
        int[] counts = new int[7];
        Set<Integer> aa = new HashSet<>(), mine = new HashSet<>(), replies = new HashSet<>();
        Exception failure;
        PopularNativeRows.Snapshot popularSnapshot;
    }
    private static State state(Object adapter) { synchronized(STATES) { return STATES.computeIfAbsent(adapter, k -> new State()); } }
    static void refreshPopularity(){
        for(WeakReference<Object> ref:new ArrayList<>(OWNERS)){
            Object f=ref.get();if(f==null)continue;
            try{View root=(View)call(f,"getView",new Class<?>[0]);if(root!=null&&root.isShown()){
                Object a=adapter(f);rebuild(a);
                collect(a,PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o")));
                refresh(a);
            }}
            catch(Exception error){Log.w("Haiagaru","Refresh popularity settings",error);}
        }
    }
    static void nativeRowsReady(){
        new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
            for(WeakReference<Object> ref:new ArrayList<>(OWNERS)){
                Object f=ref.get();if(f==null)continue;
                try{
                    View root=(View)call(f,"getView",new Class<?>[0]);if(root==null||!root.isShown())continue;
                    Object a=adapter(f);State s=state(a);
                    boolean retry=s.failure!=null&&"Direct popularity layout unavailable".equals(s.failure.getMessage());
                    List<?> source=PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o"));
                    PopularNativeRows.Snapshot snapshot=PopularNativeRows.find(source);
                    if(snapshot==null||(s.counts[0]>=0&&!retry&&s.popularSnapshot==snapshot))continue;
                    collect(a,source);
                    if(retry||(!PopularReplies.enabledFor(context(a))&&PopularReplies.directFor(context(a))&&selected(a)[0]))rebuild(a);
                    else refresh(a);
                }catch(Exception error){Log.w("Haiagaru","Finish native popular count",error);}
            }
        });
    }
    private static Object field(Object o, String n) throws Exception { return ResponseArchiveEntry.field(o,n); }
    private static Object call(Object o, String n, Class<?>[] types, Object... args) throws Exception {
        Method m=o.getClass().getMethod(n,types); m.setAccessible(true); return m.invoke(o,args);
    }
    private static boolean legacy(Object a) { return a.getClass().getName().equals("o.m9ExternalSyntheticLambda1"); }
    private static boolean middle(Object a) { return a.getClass().getName().equals("o.listener"); }
    private static Object model(Object a) throws Exception { return field(a,legacy(a)?"Y":middle(a)?"L":"k"); }
    static Object visibleFragment(Activity activity) throws Exception {
        for(WeakReference<Object> ref:new ArrayList<>(OWNERS)){
            Object fragment=ref.get();if(fragment==null)continue;
            View view=(View)call(fragment,"getView",new Class<?>[0]);
            if(view!=null&&view.isShown()&&call(fragment,"getActivity",new Class<?>[0])==activity)return fragment;
        }
        return null;
    }
    private static Object adapter(Object fragment) throws Exception {
        View root=(View)call(fragment,"getView",new Class<?>[0]);
        View list=FilterPosition.findList(root);
        if(list==null)throw new IllegalStateException("Response list missing");
        Object a=call(list,"getAdapter",new Class<?>[0]);
        if(a instanceof HeaderViewListAdapter)a=((HeaderViewListAdapter)a).getWrappedAdapter();
        if(a==null || !(legacy(a)||middle(a)||a.getClass().getName().equals("o.zzacr")))
            throw new IllegalStateException("Response adapter unavailable");
        FRAGMENTS.put(a,new WeakReference<>(fragment)); return a;
    }
    private static boolean[] selected(Object a) throws Exception {
        boolean[] result=new boolean[7]; Object m=model(a);
        if(legacy(a)) {
            String[] keys={"c","a","e","b"};
            for(int i=0;i<4;i++)result[i]=(Boolean)field(field(m,keys[i]),"mValue");
        } else {
            Object flow=field(m,middle(a)?"k":"w");
            Object value=call(flow,middle(a)?"c":"d",new Class<?>[0]);
            Matcher matches=Pattern.compile("FilterBarState\\(selected=(true|false),").matcher(value.toString());
            int i=0; while(matches.find()&&i<4)result[i++]=Boolean.parseBoolean(matches.group(1));
            if(i!=4)throw new IllegalStateException("Filter states changed");
        }
        State selection=state(a);
        for(int i=0;i<4;i++)if((selection.pendingFilterMask&(1<<i))!=0) {
            if(result[i]==selection.pendingFilters[i])selection.pendingFilterMask&=~(1<<i);
            else result[i]=selection.pendingFilters[i];
        }
        int mask=selection.extra;
        for(int i=4;i<7;i++)result[i]=(mask&(1<<(i-4)))!=0;
        return result;
    }
    private static void toggle(Object a,int which) throws Exception {toggle(a,which,false);}
    private static void toggle(Object a,int which,boolean reset) throws Exception {
        toggle(a,which,reset,false);
    }
    private static void toggle(Object a,int which,boolean reset,boolean preservePosition) throws Exception {
        Object fragment=FRAGMENTS.containsKey(a)?FRAGMENTS.get(a).get():null;
        if(fragment==null)for(WeakReference<Object> ref:new ArrayList<>(OWNERS)) {
            Object owner=ref.get();if(owner==null)continue;
            try {if(adapter(owner)==a){fragment=owner;break;}}catch(Exception ignored){}
        }
        if(fragment!=null&&!reset)FilterPosition.beforeFragment(fragment,preservePosition);
        if(which>=4) {
            State s=state(a);s.extra^=1<<(which-4);
            try { rebuild(a);if(s.failure!=null)throw s.failure; } catch(Exception e) { s.extra^=1<<(which-4);refresh(a);throw e; }
        } else if(legacy(a)) {
            if(!reset&&which==0 && fragment!=null && PopularReplies.enabledFor(context(a))) { PopularReplies.show(fragment);refresh(a);return; }
            Object value=field(model(a),new String[]{"c","a","e","b"}[which]);
            Field f=value.getClass().getDeclaredField("mValue");f.setAccessible(true);f.setBoolean(value,!f.getBoolean(value));
            call(value,"c",new Class<?>[0]);
        } else {
            Object m=model(a);ClassLoader loader=a.getClass().getClassLoader();
            Class<?> kind=loader.loadClass(middle(a)?"o.setLastGoodStreamIdokhttp":"o.isAtLeastLollipop");
            Object value=Enum.valueOf((Class)kind,KINDS[which]);
            if(middle(a)) {
                Class<?> callback=loader.loadClass("o.listener$setContentView$ComponentActivity");
                Constructor<?> ctor=callback.getDeclaredConstructor(Object.class);ctor.setAccessible(true);
                call(ctor.newInstance(m),"invoke",new Class<?>[]{Object.class},value);
            } else call(m,"b",new Class<?>[]{kind},value);
        }
        refresh(a);
    }
    private static void rebuild(Object a) throws Exception {
        if(legacy(a)||middle(a))call(a,legacy(a)?"c":"b",new Class<?>[]{boolean.class},false);
        else {
            Object snapshot=state(a).rawSnapshot; if(snapshot==null)return;
            ClassLoader loader=a.getClass().getClassLoader();Class<?> callback=loader.loadClass("o.zzcbx");
            Object unit=loader.loadClass("o.zzbwq").getField("INSTANCE").get(null);
            Object action=Proxy.newProxyInstance(loader,new Class<?>[]{callback},(proxy,m,args)-> {
                if(m.getName().equals("invoke"))return unit;
                if(m.getName().equals("hashCode"))return System.identityHashCode(proxy);
                if(m.getName().equals("equals"))return proxy==args[0];return "HaiagaruFilterRefresh";
            });
            call(a,"b",new Class<?>[]{snapshot.getClass(),callback},snapshot,action);
        }
    }
    private static Context context(Object a) throws Exception {
        if(!legacy(a)&&!middle(a))return (Context)field(a,"e");
        return ((android.view.LayoutInflater)field(a,legacy(a)?"q":"s")).getContext();
    }
    static int number(Object r) throws Exception { return ((Number)field(r,r.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"l":"o")).intValue(); }
    private static int[] anchors(Object r) throws Exception { return (int[])field(r,legacyResponse(r)?"d":middleResponse(r)?"a":"b"); }
    private static boolean legacyResponse(Object r){return r.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError");}
    private static boolean middleResponse(Object r){return r.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion");}
    private static boolean response(Object r){return r!=null&&(legacyResponse(r)||middleResponse(r)||r.getClass().getName().equals("o.KeJ11"));}
    static Object rowResponse(Object row) throws Exception {
        if(row==null)return null;
        if(response(row))return row;
        String key=row.getClass().getName().equals("o.r8lambdakfayx3RllpZib32UTPpeXfQjw")?"j":
                row.getClass().getName().equals("o.setSocketokhttp")?"j":
                row.getClass().getName().equals("o.zzadi$_init_lambda2")?"o":null;
        if(key!=null){Object r=field(row,key);return response(r)?r:null;}
        return null;
    }
    private static Object index(Object a) throws Exception {
        if(legacy(a))return call(field(a,"M"),"b",new Class<?>[0]);
        if(!middle(a))return call(a,"a",new Class<?>[0]);
        Object m=model(a);
        Method get=m.getClass().getMethod("e",m.getClass());
        return get.invoke(null,m);
    }
    private static void collect(Object a,List<?> source) throws Exception {
        State s=state(a);
        // A reset changes selection only, not the full response list or its counts.
        // No extra predicate is active now; retain the counts until the next normal
        // update/dialog opening instead of reparsing every post during native callbacks.
        if(resetting()&&s.extra==0)return;
        int[] counts=new int[7];Set<Integer> aa=new HashSet<>(),mine=new HashSet<>(),replies=new HashSet<>();
        if(source.isEmpty()){s.counts=counts;s.aa=aa;s.mine=mine;s.replies=replies;s.failure=null;s.popularSnapshot=null;return;}
        Object idx=index(a);
        String indexMethod=legacy(a)?"d":middle(a)?"a":"b";
        for(Object r:source)if(response(r)) {
            int no=number(r);
            // ChMate marks an own post with bit 0; bit 3 is not the own-post flag.
            if(( ((Number)call(idx,indexMethod,new Class<?>[]{int.class},no)).intValue()&1)!=0)mine.add(no);
            if(Boolean.TRUE.equals(call(r,legacy(a)?"e":middle(a)?"i":"g",new Class<?>[0])))aa.add(no);
        }
        for(Object r:source)if(response(r)) {
            int no=number(r);
            for(int anchor:anchors(r))if(anchor<no&&mine.contains(anchor)){replies.add(no);break;}
        }
        Context c=context(a);int threshold=popularThreshold(a,c,source);
        Map<Integer,Integer> direct=Collections.emptyMap();
        if(PopularReplies.directFor(c)) {
            Map<Integer,String> posts=new LinkedHashMap<>();
            for(Object r:source)if(response(r))posts.put(number(r),android.text.Html.fromHtml((String)field(r,legacy(a)?"c":middle(a)?"d":"h")).toString());
            direct=PopularReplyRules.count(posts);
        }
        // Counts are per response, even when a response contains several links or anchors.
        for(Object r:source)if(response(r)) {
            if(PopularReplies.directFor(c)&&direct.getOrDefault(number(r),0)>=threshold)counts[0]++;
            String[] urls;
            if(legacy(a)||middle(a))urls=(String[])call(r,"d",new Class<?>[0]);
            else urls=(String[])r.getClass().getClassLoader().loadClass("o.KeJ11$RemoteActionCompatParcelizer")
                    .getMethod("a",String.class).invoke(null,field(r,"h"));
            if(legacy(a))urls=videoFilterUrls(r,urls);
            boolean[] kinds=new boolean[3];
            for(String url:urls) {
                ClassLoader loader=r.getClass().getClassLoader();Object movie;
                Class<?> movieType=loader.loadClass(legacy(a)?"o.r0ExternalSyntheticLambda3":middle(a)?"o.MK":"o.zzbuc");
                movie=movieType.getMethod(legacy(a)?"b":middle(a)?"d":"d",String.class).invoke(null,url);
                if(videoFilterMatch(url,movie))kinds[2]=true;
                else if(legacy(a))kinds[(Boolean)loader.loadClass("o.r8lambdaeAQm29xfY6v7mMntOfLRXKh8x10").getMethod("c",CharSequence.class).invoke(null,url)?1:0]=true;
                else if(!middle(a)) {
                    Object helper=loader.loadClass("o.ApiApiOptionsNotRequiredOptions").getField("IconCompatParcelizer").get(null);
                    kinds[(Boolean)call(helper,"e",new Class<?>[]{CharSequence.class},url)?1:0]=true;
                } else kinds[isImage226(loader,url)?1:0]=true;
            }
            for(int i=0;i<3;i++)if(kinds[i])counts[i+1]++;
        }
        counts[4]=aa.size();counts[5]=mine.size();counts[6]=replies.size();
        if(!PopularReplies.directFor(c)) {
            PopularNativeRows.Snapshot nativeRows=PopularNativeRows.find(source);
            counts[0]=nativeRows==null?-1:nativeRows.selected(threshold).size();
        }
        s.aa=aa;s.mine=mine;s.replies=replies;s.counts=counts;s.failure=null;
        s.popularSnapshot=PopularNativeRows.find(source);
    }
    /** Native 191 URL extraction can omit direct videos when automatic fetch is off. */
    public static String[] videoFilterUrls(Object response,String[] original) {
        if(!legacyResponse(response))return original;
        try {
            String body=(String)field(response,"c");
            LinkedHashSet<String> urls=new LinkedHashSet<>();
            if(original!=null)Collections.addAll(urls,original);
            int initial=urls.size();
            for(String url:ThreadMediaUrls.collect(body,null))if(DirectVideoUrls.supported(url))urls.add(url);
            return urls.size()==initial?original:urls.toArray(new String[0]);
        }catch(Exception unsupported){return original;}
    }
    public static boolean videoFilterMatch(String url,Object nativeVideo) {
        return nativeVideo!=null || DirectVideoUrls.supported(url);
    }
    private static boolean isImage226(ClassLoader loader,String url) throws Exception {
        return (Boolean)loader.loadClass("o.getColorFilter").getMethod("d",CharSequence.class).invoke(null,url);
    }
    private static int popularThreshold(Object a,Context c,List<?> source) throws Exception {
        if(PopularReplies.directFor(c))return PopularReplies.thresholdValue(c,3);
        PopularNativeRows.Snapshot snapshot=PopularNativeRows.find(source);
        if(snapshot!=null)return PopularReplies.thresholdValue(c,snapshot.threshold);
        if(legacy(a)||middle(a)) {
            Class<?> prefs=a.getClass().getClassLoader().loadClass("jp.syoboi.a2chMate.Prefs");
            Field f=prefs.getDeclaredField(legacy(a)?"M":"n");f.setAccessible(true);Object option=f.get(null);
            Method get=prefs.getDeclaredMethod(legacy(a)?"c":"d",f.getType());get.setAccessible(true);
            return PopularReplies.thresholdValue(c,((Number)get.invoke(null,option)).intValue());
        }
        synchronized(THRESHOLDS){for(Threshold t:THRESHOLDS)if(t.list.get()==source)return PopularReplies.thresholdValue(c,t.value);}
        throw new IllegalStateException("Native popularity threshold unavailable");
    }
    public static Object modernSnapshot(Object a,Object snapshot) {
        try {
            State s=state(a);
            if(snapshot==s.appliedSnapshot)snapshot=s.rawSnapshot;
            s.rawSnapshot=snapshot;
            collect(a,PopularReplies.fullList(field(snapshot,"j")));
            List<?> rows=(List<?>)field(snapshot,"b");
            List<?> filtered=filterCollected(a,rows);
            if(filtered==rows){s.appliedSnapshot=snapshot;return snapshot;}
            Method copy=snapshot.getClass().getMethod("d",snapshot.getClass(),List.class);
            Object result=copy.invoke(null,snapshot,filtered);s.appliedSnapshot=result;return result;
        }catch(Exception e){state(a).failure=e;Log.e("Haiagaru","Modern extra filters",e);return snapshot;}
    }
    private static List<?> filterCollected(Object a,List<?> rows) throws Exception {
            // Standard mode must retain the native renderer's current result. Replacing
            // it with cached templates can resurrect an earlier empty/partial layout.
            if(!PopularReplies.enabledFor(context(a))&&PopularReplies.directFor(context(a))&&selected(a)[0]) {
                List<?> source=PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o"));
                PopularNativeRows.Snapshot raw=PopularNativeRows.find(source);
                if(raw==null)throw new IllegalStateException("Direct popularity layout unavailable");
                int threshold=popularThreshold(a,context(a),source);
                Set<Integer> matches;
                if(PopularReplies.directFor(context(a))){
                    Map<Integer,String> posts=new LinkedHashMap<>();
                    for(Object r:source)if(response(r))posts.put(number(r),android.text.Html.fromHtml((String)field(r,legacy(a)?"c":middle(a)?"d":"h")).toString());
                    Map<Integer,Integer> counts=PopularReplyRules.count(posts);matches=new HashSet<>();
                    for(Map.Entry<Integer,Integer> entry:counts.entrySet())if(entry.getValue()>=threshold)matches.add(entry.getKey());
                }else matches=raw.selected(threshold);
                ArrayList<Object> directRows=new ArrayList<>();
                Set<Integer> allowed=new HashSet<>();boolean[] selection=selected(a);
                // Other native filters remain an intersection with the native output.
                if(selection[1]||selection[2]||selection[3])for(Object row:rows){Object r=rowResponse(row);if(r!=null)allowed.add(number(r));}
                directRows.addAll(popularRows(raw.rows,matches,allowed,
                        selection[1]||selection[2]||selection[3]));
                rows=directRows;
            }
            State s=state(a);if(s.extra==0){refresh(a);return rows;}
            ArrayList<Object> kept=new ArrayList<>();Set<Integer> seen=new HashSet<>();
            for(Object row:rows) {
                Object r=rowResponse(row);
                if(r==null){kept.add(row);continue;}
                int no=number(r);
                if(((s.extra&1)!=0&&s.aa.contains(no))||((s.extra&2)!=0&&s.mine.contains(no))||((s.extra&4)!=0&&s.replies.contains(no)))
                    if(seen.add(no))kept.add(row);
            }
            refresh(a);return kept;
    }
    /** Preserve structural rows such as the top filter controls during popular extraction. */
    static List<Object> popularRows(List<?> rows,Set<Integer> matches,Set<Integer> allowed,
                                    boolean intersectAllowed) throws Exception {
        ArrayList<Object> result=new ArrayList<>();Set<Integer> seen=new HashSet<>();
        for(Object row:rows){
            Object response=rowResponse(row);
            if(response==null){result.add(row);continue;}
            int number=number(response);
            if(matches.contains(number)&&(!intersectAllowed||allowed.contains(number))&&seen.add(number))
                result.add(row);
        }
        return result;
    }
    public static ArrayList<?> filterRows(Object a,List<?> rows) {
        if(!QuickFilterOptions.counts()&&!QuickFilterOptions.extras())try{
            if(PopularReplies.enabledFor(context(a))||!PopularReplies.directFor(context(a))||!selected(a)[0])
                return rows instanceof ArrayList?(ArrayList<?>)rows:new ArrayList<>(rows);
        }catch(Exception e){Log.w("Haiagaru","Popular filter selection unavailable",e);}
        try {
            Object source=field(a,legacy(a)?"K":middle(a)?"J":"o");
            List<?> full=PopularReplies.fullList(source);collect(a,full);
            List<?> kept=filterCollected(a,rows);return kept instanceof ArrayList?(ArrayList<?>)kept:new ArrayList<>(kept);
        }catch(Exception e){state(a).failure=e;Log.e("Haiagaru","Extra quick filters unavailable",e);return rows instanceof ArrayList?(ArrayList<?>)rows:new ArrayList<>(rows);}
    }
    public static void legacyRows(Object a) {
        try {String key=legacy(a)?"z":"g";Field f=a.getClass().getDeclaredField(key);f.setAccessible(true);
            Object rows=f.get(a);if(rows instanceof List) {
                // 191/226 can rebuild their visible rows before the earlier native-layout
                // observer has produced a usable snapshot. Capture the adapter's finished
                // row layout here as a second opportunity, before Haiagaru counts filters.
                // save() keeps a larger full-layout snapshot when native filtering supplied
                // only a subset, so this cannot regress an already complete capture.
                try {
                    List<?> source=PopularReplies.fullList(field(a,legacy(a)?"K":"J"));
                    if(PopularNativeRows.find(source)==null)PopularNativeRows.captureLegacy(a,(List<?>)rows);
                }catch(Exception captureError){Log.w("Haiagaru","Fallback popular layout capture",captureError);}
                f.set(a,filterRows(a,(List<?>)rows));
            }
        }catch(Exception e){Log.e("Haiagaru","Extra legacy filters",e);}
    }
    private static String[] labels(Object a) {
        int[] counts=state(a).counts;String[] result=new String[7];
        for(int i=0;i<7;i++)result[i]=QuickFilterOptions.counts()?(counts[i]<0?"—":Integer.toString(counts[i]))+"\n"+LABELS[i]:LABELS[i];return result;
    }
    public static boolean reset(Object fragment){
        RESETTING.set(true);
        try{Object a=adapter(fragment);FilterPosition.beforeFragment(fragment,true);State selection=state(a);selection.extra=0;
            if(legacy(a)){
                Object changed=null,m=model(a);
                for(String key:new String[]{"c","a","e","b"}){
                    Object value=field(m,key);Field bit=value.getClass().getDeclaredField("mValue");bit.setAccessible(true);
                    if(bit.getBoolean(value)){bit.setBoolean(value,false);changed=value;}
                }
                selection.pendingFilterMask=0;
                // All flags are final before notifying the native adapter: avoid rebuilding
                // a long thread once for each flag plus once for the extra filters.
                if(changed!=null)call(changed,"c",new Class<?>[0]);else rebuild(a);
            }else{
                boolean[] on=selected(a);for(int i=0;i<4;i++)if(on[i]){toggle(a,i,true);selection.pendingFilters[i]=false;selection.pendingFilterMask|=1<<i;}
                rebuild(a);
            }
            refresh(a);return true;
        }catch(Exception error){Log.w("Haiagaru","Reset filters",error);return false;}finally{RESETTING.remove();}
    }
    private static int[] visibleIndices(){int n=0;for(int i=0;i<7;i++)if(QuickFilterOptions.visible(i))n++;int[] result=new int[n];for(int i=0,j=0;i<7;i++)if(QuickFilterOptions.visible(i))result[j++]=i;return result;}
    public static boolean open(Object fragment) {
        try {
            Object a=adapter(fragment);Activity activity=(Activity)call(fragment,"getActivity",new Class<?>[0]);
            if(activity==null||activity.isFinishing())return false;
            if(QuickFilterOptions.pinned()){updatePinned(fragment);return true;}
            if(QuickFilterOptions.bottom())return showBottomPanel(activity,a);
            collect(a,PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o")));
            int[] indices=visibleIndices();boolean[] all=selected(a);String[] fullNames=labels(a);
            boolean[] checked=new boolean[indices.length];String[] names=new String[indices.length];
            for(int i=0;i<indices.length;i++){checked[i]=all[indices[i]];names[i]=fullNames[indices[i]];}
            HaiagaruDialog d=new HaiagaruDialog.Builder(activity).setTitle("レスのフィルター")
                    .setMultiChoiceItems(names,checked,(dialog,which,on)->{
                        int index=indices[which];try {toggle(a,index);
                            if(index<4 && !(index==0 && PopularReplies.enabledFor(activity))) {
                                State selection=state(a);selection.pendingFilters[index]=on;
                                selection.pendingFilterMask|=1<<index;
                            }
                            boolean[] next=selected(a);for(int i=0;i<names.length;i++)((HaiagaruDialog)dialog).getListView().setItemChecked(i,next[indices[i]]);}
                        catch(Exception e){Log.e("Haiagaru","Extra filter toggle",e);((HaiagaruDialog)dialog).getListView().setItemChecked(which,!on);Toast.makeText(activity,"フィルターを変更できませんでした",Toast.LENGTH_SHORT).show();}
                    }).setNeutralButton("設定",(dialog,which)->QuickFilterOptions.showToolbarSettings(activity)).setNegativeButton("閉じる",null).show();
            state(a).dialog=new WeakReference<>(d);state(a).dialogLabels=names;state(a).dialogIndices=indices;
            // Native filter actions finish asynchronously. Reading their StateFlow
            // directly after invoke() can still return the previous check state.
            // Watch only while this dialog is visible, and redraw only changes.
            android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
            boolean[] observed=checked.clone();
            Runnable sync=new Runnable() {
                @Override public void run() {
                    if(!d.isShowing())return;
                    try {
                        boolean[] next=selected(a);
                        for(int i=0;i<observed.length;i++)if(observed[i]!=next[indices[i]]) {
                            observed[i]=next[indices[i]];d.getListView().setItemChecked(i,next[indices[i]]);
                        }
                    }catch(Exception e){Log.w("Haiagaru","Filter selection update",e);}
                    handler.postDelayed(this,100);
                }
            };
            d.setOnDismissListener(dialog->{handler.removeCallbacks(sync);state(a).pendingFilterMask=0;});
            handler.postDelayed(sync,100);
            d.getListView().setOnItemLongClickListener((parent,v,pos,id)->{
                if(indices[pos]!=2)return false;
                d.dismissForNavigation(()->{if(!imageList(a))Toast.makeText(activity,"画像一覧を開けませんでした",Toast.LENGTH_SHORT).show();});
                return true;
            });
            return true;
        }catch(Exception e){Log.w("Haiagaru","Extended filter dialog",e);return false;}
    }
    private static boolean imageList(Object a) {return QuickFilterToolbar.openImageList(a);}
    /** Read the visible thread only, at media launch time; no scrolling-time scans or URL cache. */
    static ArrayList<String> threadMedia(Context context,String selected) {
        while(context instanceof android.content.ContextWrapper&&!(context instanceof Activity))
            context=((android.content.ContextWrapper)context).getBaseContext();
        Context source=context;
        ArrayList<String> found=null;
        for(WeakReference<Object> reference:new ArrayList<>(OWNERS))try{
            Object fragment=reference.get();if(fragment==null)continue;
            Object owner=call(fragment,"getActivity",new Class<?>[0]);
            if(!(owner instanceof Activity)||((Activity)owner).isFinishing())continue;
            if(source instanceof Activity?owner!=source:((Activity)owner).getApplicationContext()!=source.getApplicationContext())continue;
            View root=(View)call(fragment,"getView",new Class<?>[0]);
            android.graphics.Rect visible=new android.graphics.Rect();
            if(root==null||!root.isShown()||(!(source instanceof Activity)&&!root.hasWindowFocus())||!root.getGlobalVisibleRect(visible)||visible.isEmpty())continue;
            Object a=adapter(fragment),idx=index(a);
            Method flags=idx.getClass().getMethod(legacy(a)?"d":middle(a)?"a":"b",int.class);flags.setAccessible(true);
            List<?> rows=PopularReplies.fullList(field(a,legacy(a)?"K":middle(a)?"J":"o"));
            LinkedHashSet<String> urls=new LinkedHashSet<>();int characters=0;
            int inspected=0;
            for(Object response:rows){
                if(++inspected>10000)break;
                if(!response(response))continue;
                if((((Number)flags.invoke(idx,number(response))).intValue()&0x1010)!=0)continue;
                String[] values=null;
                try{
                    Method attachments=response.getClass().getDeclaredMethod(legacy(a)||middle(a)?"d":"haiagaruPatrolAttachments");
                    attachments.setAccessible(true);values=(String[])attachments.invoke(response);
                }catch(ReflectiveOperationException unavailable){/* Original body remains usable. */}
                String text=(String)field(response,legacy(a)?"c":middle(a)?"d":"h");
                for(String value:ThreadMediaUrls.collect(text,values)){
                    String sourceVideo=XMediaAttachments.sourceVideo(value);
                    String url=PreviewUrls.normalize(sourceVideo==null?value:sourceVideo);
                    if(MediaGallery.supported(url)&&!urls.contains(url)){if(characters+url.length()>96000)break;urls.add(url);characters+=url.length();}
                    if(urls.size()>=4096)break;}
                if(urls.size()>=4096||characters>=96000)break;
            }
            if(!urls.contains(PreviewUrls.normalize(selected)))continue;
            // Two visible threads with the same URL are ambiguous: preserve the native scope.
            if(found!=null)return null;
            found=new ArrayList<>(urls);
        }catch(ReflectiveOperationException|RuntimeException ignored){}catch(Exception ignored){}
        return found;
    }
    public static View unwrap(View view) {return view instanceof Bar?((Bar)view).original:view;}
    public static View legacyRowOwner(Object owner,View row) {return legacyRow(row,owner);}
    public static void bindHolder(Object owner,Object holder,View row) {bind(row,owner);}
    public static View wrap(View original) {
        if(original==null||original instanceof Bar)return original;
        WeakReference<Bar> ref=BARS.get(original);Bar old=ref==null?null:ref.get();if(old!=null)return old;
        Bar bar=new Bar(original);BARS.put(original,new WeakReference<>(bar));return bar;
    }
    public static View legacyRow(View original,Object a) {
        if(original==null)return null;
        try {if(a.getClass().getName().equals("o.listener$setContentView"))a=field(a,"c");}
        catch(Exception e){Log.w("Haiagaru","Filter row owner",e);return original;}
        View raw=unwrap(original);Object binding=raw.getTag(0x7f0a0106);
        if(legacy(a)&&(binding==null||!binding.getClass().getName().equals("o.j4")))return original;
        Bar bar=(Bar)wrap(raw);bar.bind(a);bar.setTag(raw.getTag());return bar;
    }
    public static void bind(View original,Object owner) {
        try {Object a=owner.getClass().getName().equals("o.listener$setContentView")?field(owner,"c"):owner;
            Bar bar=(Bar)wrap(original);bar.bind(a);
        }catch(Exception e){Log.w("Haiagaru","Extended filter row",e);}
    }
    private static void refresh(Object a) {
        for(WeakReference<PinnedPanel> ref:new ArrayList<>(PINNED.values())){PinnedPanel panel=ref.get();if(panel!=null&&panel.panel!=null&&panel.panel.adapter==a){panel.schedule();panel.handler.postDelayed(panel.render,150);}}
        for(WeakReference<Bar> ref:new ArrayList<>(BARS.values())) {Bar bar=ref.get();if(bar!=null&&bar.adapter.get()==a)bar.post(bar::update);}
        State s=state(a);HaiagaruDialog d=s.dialog.get();
        if(d!=null&&d.isShowing())new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
            if(!d.isShowing())return;
            try {String[] full=labels(a);String[] names=new String[s.dialogIndices.length];for(int i=0;i<names.length;i++)names[i]=full[s.dialogIndices[i]];System.arraycopy(names,0,s.dialogLabels,0,names.length);
                ArrayAdapter<String> adapter=(ArrayAdapter<String>)d.getListView().getAdapter();
                adapter.setNotifyOnChange(false);adapter.clear();adapter.addAll(names);adapter.notifyDataSetChanged();
                boolean[] checked=selected(a);for(int i=0;i<names.length;i++)d.getListView().setItemChecked(i,checked[s.dialogIndices[i]]);
                d.refresh();
            }catch(Exception e){Log.w("Haiagaru","Filter counts update",e);}
        });
    }
    private static final class Bar extends LinearLayout {
        final View original;final HorizontalScrollView scroll;final ToggleButton[] buttons=new ToggleButton[7];
        WeakReference<Object> adapter=new WeakReference<>(null);
        Bar(View original) {
            super(original.getContext());this.original=original;setOrientation(VERTICAL);
            setLayoutParams(new android.widget.AbsListView.LayoutParams(-1,-2));
            original.setVisibility(GONE);addView(original,new LinearLayout.LayoutParams(-1,0));
            scroll=new HorizontalScrollView(getContext()){
                float downX,downY;
                @Override public boolean dispatchTouchEvent(android.view.MotionEvent event){
                    int action=event.getActionMasked();
                    if(action==android.view.MotionEvent.ACTION_DOWN){downX=event.getX();downY=event.getY();getParent().requestDisallowInterceptTouchEvent(true);}
                    else if(action==android.view.MotionEvent.ACTION_MOVE)getParent().requestDisallowInterceptTouchEvent(Math.abs(event.getX()-downX)>=Math.abs(event.getY()-downY));
                    // Dispatch here (not OnTouchListener): filter buttons consume DOWN themselves.
                    boolean handled=super.dispatchTouchEvent(event);
                    if(action==android.view.MotionEvent.ACTION_UP||action==android.view.MotionEvent.ACTION_CANCEL)getParent().requestDisallowInterceptTouchEvent(false);
                    return handled;
                }
            };scroll.setHorizontalScrollBarEnabled(false);
            LinearLayout choices=new LinearLayout(getContext());
            for(int i=0;i<7;i++){final int index=i;ToggleButton b=new ToggleButton(getContext());buttons[i]=b;b.setAllCaps(false);styleButton(b);
                int buttonHeight=(int)(52*getResources().getDisplayMetrics().density);
                b.setGravity(android.view.Gravity.CENTER);b.setMinHeight(buttonHeight);b.setHeight(buttonHeight);
                b.setOnClickListener(v->{Object a=adapter.get();if(a!=null)try{boolean requested=b.isChecked();toggle(a,index);if(index<4&&!(index==0&&PopularReplies.enabledFor(getContext()))){State state=state(a);state.pendingFilters[index]=requested;state.pendingFilterMask|=1<<index;}update();}catch(Exception e){Log.e("Haiagaru","Filter row toggle",e);update();}});
                if(i==2)b.setOnLongClickListener(v->{Object a=adapter.get();return a!=null&&imageList(a);});
                b.setTextSize(14);b.setPadding((int)(14*getResources().getDisplayMetrics().density),0,(int)(14*getResources().getDisplayMetrics().density),0);
                LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-2,buttonHeight);int verticalMargin=(int)(1*getResources().getDisplayMetrics().density);params.setMargins(2,verticalMargin,2,verticalMargin);choices.addView(b,params);}
            scroll.addView(choices);addView(scroll,new LinearLayout.LayoutParams(-1,-2));
        }
        void bind(Object a){adapter=new WeakReference<>(a);update();}
        void update(){Object a=adapter.get();if(a==null)return;try{boolean[] on=selected(a);String[] names=labels(a);
            for(int i=0;i<7;i++){buttons[i].setTextOn(names[i]);buttons[i].setTextOff(names[i]);buttons[i].setChecked(on[i]);buttons[i].setText(names[i]);}
            for(int i=4;i<7;i++)buttons[i].setVisibility(QuickFilterOptions.visible(i)?VISIBLE:GONE);
            boolean stock=!QuickFilterOptions.counts()&&!QuickFilterOptions.extras();
            // Top and bottom filters are independent: the bottom panel adds an
            // alternate control surface and must not implicitly collapse the top row.
            boolean hidden=Haiagaru.compactQuickFilters();
            original.setVisibility(stock&&!hidden?VISIBLE:GONE);
            original.setLayoutParams(new LinearLayout.LayoutParams(-1,stock&&!hidden?-2:0));
            scroll.setVisibility(hidden||stock?GONE:VISIBLE);
        }catch(Exception e){Log.w("Haiagaru","Filter row state",e);}}
    }
    private ExtraQuickFilters(){}
}
