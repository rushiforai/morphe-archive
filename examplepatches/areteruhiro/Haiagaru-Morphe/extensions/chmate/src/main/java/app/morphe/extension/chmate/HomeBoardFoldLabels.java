package app.morphe.extension.chmate;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/** Makes board labels toggle their sections when HOME heading taps are enabled. */
final class HomeBoardFoldLabels {
    private static final int TAG=0x48690141;
    static final String TITLE_CONTROL="homeBoardFoldToggleInTitle";
    private HomeBoardFoldLabels(){}
    static void menu(Object fragment,android.view.Menu menu){
        if(menu==null||HomeThreadOrder.mode(fragment)!=102)return;
        android.content.Context context=Haiagaru.applicationContextForExtension();if(context==null)return;
        android.view.MenuItem item=menu.findItem(TAG);
        if(item==null)item=menu.add(0,TAG,0,"板名タップで開閉");
        boolean top=SettingsProfiles.prefs(context).getBoolean(TITLE_CONTROL,true);
        item.setVisible(!top).setCheckable(true)
                .setChecked(SettingsProfiles.prefs(context).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true))
                .setOnMenuItemClickListener(v->{toggle(fragment,context);return true;});
    }
    private static void toggle(Object fragment,android.content.Context context){
        boolean enabled=SettingsProfiles.prefs(context).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true);
        SettingsProfiles.prefs(context).edit().putBoolean(HomeThreadOrder.FOLD_ON_TAP,!enabled).apply();
        refresh(fragment);
        android.app.Activity activity=Haiagaru.toolbarActivity(fragment);
        if(activity!=null){BrowsingHistory.refreshVisible(activity);activity.invalidateOptionsMenu();}
    }

    private static final Map<Object,HomeViewWatch> homeViews=new java.util.WeakHashMap<>();

    static void attach(Object fragment) {
        android.app.Activity activity=Haiagaru.toolbarActivity(fragment);
        if(fragment==null||activity==null||activity.getWindow()==null)return;
        View decor=activity.getWindow().getDecorView();
        HomeViewWatch watch=homeViews.get(fragment);
        if(watch==null||watch.decor.get()!=decor){
            if(watch!=null)watch.close();
            try{
                watch=new HomeViewWatch(fragment,decor);
                homeViews.put(fragment,watch);
                watch.install(decor);
            }catch(ReflectiveOperationException unavailable){return;}
        }
        watch.onGlobalLayout();
        attach(fragment, true);
    }

    /** The native HOME view can be populated or replaced after onResume. */
    private static final class HomeViewWatch implements ViewTreeObserver.OnGlobalLayoutListener,
            View.OnAttachStateChangeListener {
        final WeakReference<Object> fragment;
        final WeakReference<View> decor;
        final Method getView;
        WeakReference<View> list=new WeakReference<>(null);
        HomeViewWatch(Object owner,View window) throws ReflectiveOperationException {
            fragment=new WeakReference<>(owner);
            decor=new WeakReference<>(window);
            getView=owner.getClass().getMethod("getView");
        }
        void install(View window){
            window.addOnAttachStateChangeListener(this);
            window.getViewTreeObserver().addOnGlobalLayoutListener(this);
        }
        @Override public void onGlobalLayout(){
            Object owner=fragment.get();
            if(owner==null){close();return;}
            View current=list.get();
            if(current!=null&&current.isAttachedToWindow()&&current.isShown()
                    &&current.getTag(TAG) instanceof Binding)return;
            try{
                View root=(View)getView.invoke(owner);
                if(root==null||!root.isShown())return;
                View next=FilterPosition.findList(root);
                if(next==null||!next.isShown())return;
                list=new WeakReference<>(next);
                ensureAttached(owner);
            }catch(ReflectiveOperationException ignored){}
        }
        @Override public void onViewAttachedToWindow(View v){}
        @Override public void onViewDetachedFromWindow(View v){close();}
        void close(){
            Object owner=fragment.get();
            if(owner!=null&&homeViews.get(owner)==this)homeViews.remove(owner);
            View window=decor.get();
            if(window==null)return;
            ViewTreeObserver observer=window.getViewTreeObserver();
            if(observer.isAlive())observer.removeOnGlobalLayoutListener(this);
            window.removeOnAttachStateChangeListener(this);
        }
    }

    static void ensureAttached(Object fragment) { attach(fragment, false); }

    private static void attach(Object fragment, boolean refreshExisting) {
        if(fragment==null)return;
        try{
            View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            View list=FilterPosition.findList(root);
            if(root==null||list==null)return;
            Object existing=list.getTag(TAG);
            if(existing instanceof Binding){if(refreshExisting)((Binding)existing).bind();return;}
            Binding binding=new Binding(fragment,root,list);list.setTag(TAG,binding);
            binding.install();binding.bind();
        }catch(Exception error){android.util.Log.w("Haiagaru","Board fold controls unavailable",error);}
    }
    static void refresh(Object fragment){
        if(fragment==null)return;
        try{
            View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            View list=FilterPosition.findList(root);if(list==null)return;
            Object value=list.getTag(TAG);if(value instanceof Binding)((Binding)value).bind();
        }catch(Exception ignored){}
    }

    private static final class Binding implements ViewTreeObserver.OnGlobalLayoutListener,
            View.OnAttachStateChangeListener {
        final WeakReference<Object> fragment;
        final WeakReference<View> root,list;
        final Map<TextView,Bound> bound=new IdentityHashMap<>();
        Button titleToggle;
        View title;
        LinearLayout.LayoutParams titleParams;
        boolean observing;
        Binding(Object f,View r,View l){fragment=new WeakReference<>(f);root=new WeakReference<>(r);list=new WeakReference<>(l);}
        void install(){
            View value=list.get();if(value==null)return;
            value.addOnAttachStateChangeListener(this);
            registerObservers(value);
        }
        private void registerObservers(View value){
            if(observing)return;observing=true;
            ViewTreeObserver observer=value.getViewTreeObserver();if(observer.isAlive())observer.addOnGlobalLayoutListener(this);
        }
        @Override public void onGlobalLayout(){bind();}
        void bind(){
            View value=list.get();Object owner=fragment.get();
            if(value==null||owner==null)return;
            if(HomeThreadOrder.mode(owner)!=102){showTitleToggle(false);clearRows();return;}
            List<?> rows=HomeThreadOrder.presented(value,102);if(rows==null)return;
            boolean hasBoards=false;for(Object row:rows)if(HomeThreadOrder.boardSection(row)){hasBoards=true;break;}
            bindTitleToggle(owner,hasBoards);
            if(!SettingsProfiles.prefs(value.getContext()).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true)){
                clearRows();return;
            }
            java.util.Set<TextView> visible=java.util.Collections.newSetFromMap(new IdentityHashMap<>());
            if(value instanceof ListView){
                ListView lv=(ListView)value;int first=lv.getFirstVisiblePosition();
                for(int i=0;i<lv.getChildCount();i++){
                    int position=first+i;if(position>=0&&position<lv.getCount())
                        bindRow(owner,lv.getChildAt(i),lv.getItemAtPosition(position),visible);
                }
            }else if(value instanceof ViewGroup){
                ViewGroup group=(ViewGroup)value;
                try{
                    Method positionMethod=value.getClass().getMethod("getChildAdapterPosition",View.class);
                    for(int i=0;i<group.getChildCount();i++){
                        View child=group.getChildAt(i);int position=((Number)positionMethod.invoke(value,child)).intValue();
                        if(position>=0&&position<rows.size())bindRow(owner,child,rows.get(position),visible);
                    }
                }catch(ReflectiveOperationException ignored){}
            }
            java.util.Iterator<Map.Entry<TextView,Bound>> it=bound.entrySet().iterator();
            while(it.hasNext()){
                Map.Entry<TextView,Bound> item=it.next();
                if(!visible.contains(item.getKey())){item.getValue().restore(item.getKey());it.remove();}
            }
        }
        private void clearRows(){
            for(Map.Entry<TextView,Bound> entry:bound.entrySet())entry.getValue().restore(entry.getKey());bound.clear();
        }
        private void bindTitleToggle(Object owner,boolean boards){
            View container=root.get();if(container==null)return;
            boolean visible=boards&&SettingsProfiles.prefs(container.getContext()).getBoolean(TITLE_CONTROL,true);
            if(titleToggle==null&&visible){
                title=findTopTitle(container,list.get(),container);
                if(title==null||!(title.getParent() instanceof LinearLayout)
                        ||!(title.getLayoutParams() instanceof LinearLayout.LayoutParams))return;
                LinearLayout parent=(LinearLayout)title.getParent();
                titleParams=new LinearLayout.LayoutParams((LinearLayout.LayoutParams)title.getLayoutParams());
                titleToggle=new Button(container.getContext());
                titleToggle.setTag("haiagaru.home.board-fold-toggle");
                titleToggle.setTextSize(12);titleToggle.setAllCaps(false);
                int width=Math.round(88*container.getResources().getDisplayMetrics().density);
                parent.addView(titleToggle,new LinearLayout.LayoutParams(width,-1));
                titleToggle.setOnClickListener(v->toggle(owner,v.getContext()));
            }
            showTitleToggle(visible);
            if(titleToggle!=null){
                boolean enabled=SettingsProfiles.prefs(container.getContext()).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true);
                titleToggle.setText(enabled?"開閉 OFF":"開閉 ON");
                titleToggle.setContentDescription(enabled?"板名タップで開閉を無効にする":"板名タップで開閉を有効にする");
            }
        }
        private void showTitleToggle(boolean visible){
            if(titleToggle==null||titleParams==null)return;
            int next=visible?View.VISIBLE:View.GONE;
            if(titleToggle.getVisibility()==next&&title.getLayoutParams().width==(visible?0:titleParams.width))return;
            titleToggle.setVisibility(next);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(titleParams);
            if(visible){params.width=0;params.weight=1;}
            title.setLayoutParams(params);
        }
        private void bindRow(Object owner,View view,Object row,java.util.Set<TextView> visible){
            android.content.Context context=Haiagaru.applicationContextForExtension();
            if(context==null||!SettingsProfiles.prefs(context).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true)
                    ||!HomeThreadOrder.boardSection(row))return;
            TextView title=firstText(view);if(title==null)return;
            visible.add(title);Bound state=bound.get(title);
            if(state!=null&&state.row==row)return;
            if(state!=null)state.restore(title);
            state=new Bound(owner,row);bound.put(title,state);state.install(title);
        }
        @Override public void onViewAttachedToWindow(View v){registerObservers(v);bind();}
        @Override public void onViewDetachedFromWindow(View v){
            View value=list.get();if(value!=null){ViewTreeObserver observer=value.getViewTreeObserver();if(observer.isAlive())observer.removeOnGlobalLayoutListener(this);
                }observing=false;
            for(Map.Entry<TextView,Bound> entry:bound.entrySet())entry.getValue().restore(entry.getKey());bound.clear();
        }
    }

    private static final class Bound {
        final Object row;
        final WeakReference<Object> fragment;
        final Touch touch=new Touch(this);
        boolean wasClickable;
        boolean installedClick;
        Bound(Object owner,Object item) {
            row=item;
            fragment=new WeakReference<>(owner);
        }
        void install(TextView title) {
            wasClickable=title.isClickable();
            if(!title.hasOnClickListeners()){
                title.setOnClickListener(view->toggle());
                installedClick=true;
            }else{
                title.setClickable(true);
                title.setOnTouchListener(touch);
            }
        }
        void restore(TextView title) {
            if(installedClick)title.setOnClickListener(null);
            else title.setOnTouchListener(null);
            title.setClickable(wasClickable);
        }
        void toggle(){
            android.content.Context context=Haiagaru.applicationContextForExtension();
            Object owner=fragment.get();
            if(owner!=null&&context!=null&&SettingsProfiles.prefs(context).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true))
                HomeThreadOrder.setBoardSectionFolded(owner,row,102,!HomeThreadOrder.boardSectionFolded(row,102));
        }
    }
    private static final class Touch implements View.OnTouchListener {
        float downX,downY;boolean tracking,cancelled;
        final Bound bound;Touch(Bound b){bound=b;}
        @Override public boolean onTouch(View view,MotionEvent event){
            android.content.Context context=Haiagaru.applicationContextForExtension();
            if(!(view instanceof TextView)||context==null
                    ||!SettingsProfiles.prefs(context).getBoolean(HomeThreadOrder.FOLD_ON_TAP,true))return false;
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                tracking=true;
                cancelled=false;downX=event.getX();downY=event.getY();
                view.getParent().requestDisallowInterceptTouchEvent(true);
            }
            if(!tracking)return false;
            int slop=android.view.ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
            if(Math.abs(event.getX()-downX)>slop||Math.abs(event.getY()-downY)>slop){
                cancelled=true;tracking=false;view.getParent().requestDisallowInterceptTouchEvent(false);return false;
            }
            if(event.getActionMasked()==MotionEvent.ACTION_UP){
                tracking=false;Object owner=bound.fragment.get();if(owner!=null&&!cancelled){
                    bound.toggle();
                    view.performClick();
                }
            }
            if(event.getActionMasked()==MotionEvent.ACTION_CANCEL){tracking=false;return true;}
            return event.getActionMasked()==MotionEvent.ACTION_DOWN||event.getActionMasked()==MotionEvent.ACTION_MOVE
                ||event.getActionMasked()==MotionEvent.ACTION_UP;
        }
    }
    private static TextView firstText(View view){
        if(view instanceof TextView){TextView text=(TextView)view;return text.length()>0?text:null;}
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){TextView found=firstText(group.getChildAt(i));if(found!=null)return found;}}
        return null;
    }
    private static View findTopTitle(View node,View list,View root){
        if(node==list)return null;
        if(node instanceof LinearLayout){
            LinearLayout group=(LinearLayout)node;int[] location=new int[2],origin=new int[2];
            node.getLocationOnScreen(location);root.getLocationOnScreen(origin);
            float density=node.getResources().getDisplayMetrics().density;
            if(group.getOrientation()==LinearLayout.HORIZONTAL&&Math.abs(location[1]-origin[1])<2*density
                    &&node.getHeight()>=28*density&&node.getHeight()<=72*density){
                for(int i=0;i<group.getChildCount();i++){
                    View child=group.getChildAt(i);
                    if(child.getWidth()>root.getWidth()/2&&!(child instanceof ViewGroup)&&!(child instanceof TextView))return child;
                }
            }
        }
        if(node instanceof ViewGroup){
            ViewGroup group=(ViewGroup)node;
            for(int i=0;i<group.getChildCount();i++){
                View found=findTopTitle(group.getChildAt(i),list,root);if(found!=null)return found;
            }
        }
        return null;
    }
}
