package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.preference.MultiSelectListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.os.SystemClock;
import android.text.TextUtils;
import android.graphics.Typeface;
import android.view.DragEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;

/** Lightweight vertical tab management without a second tab model. */
public final class Dev132 {
    public static final String BUTTONS_KEY = "nicoid_tab_bar_buttons";
    private static final String LIST_KEY = "nicoid_tab_list_button";
    private static final String ADD_KEY = "nicoid_tab_add_button";
    private static final String LIST_VALUE = "list";
    private static final String ADD_VALUE = "add";
    private static WeakReference<AlertDialog> opened = new WeakReference<>(null);
    private Dev132() {}

    private static int dp(Context c, float value) {
        return Math.round(value * c.getResources().getDisplayMetrics().density);
    }
    private static SharedPreferences prefs(Context c) {
        return PreferenceManager.getDefaultSharedPreferences(c);
    }
    private static String tr(Context c, String ja, String en, String zh) {
        return Dev112.tr(c, ja, en, zh);
    }
    public static String actionName(Context c) {
        return tr(c, "タブ一覧を表示", "Show tab list", "顯示分頁清單");
    }
    private static Field field(Class<?> owner, String key) throws Exception {
        for (Class<?> cls = owner; cls != null; cls = cls.getSuperclass()) {
            try { Field value = cls.getDeclaredField(key); value.setAccessible(true); return value; }
            catch (NoSuchFieldException ignored) {}
        }
        throw new NoSuchFieldException(key);
    }
    private static Object get(Object receiver, String name) throws Exception {
        return field(receiver.getClass(), name).get(receiver);
    }
    private static Object call(Object object, String name, Class<?>[] signature, Object... args) throws Exception {
        Method method = object.getClass().getDeclaredMethod(name, signature);
        method.setAccessible(true);
        return method.invoke(object, args);
    }
    private static Class<?> multi() throws Exception { return Class.forName("e.e.a.MultiTabs227"); }
    private static Class<?> tabType() throws Exception { return Class.forName("e.e.a.SavedTabs227$Tab"); }
    private static Object model() throws Exception {
        Method method = multi().getDeclaredMethod("data");
        method.setAccessible(true);
        return method.invoke(null);
    }
    @SuppressWarnings("unchecked")
    private static ArrayList<Object> tabs(Object model) throws Exception {
        return (ArrayList<Object>) get(model, "tabs");
    }
    private static Object selectedHost(Activity a) throws Exception {
        Map<?, ?> hosts = (Map<?, ?>)field(multi(), "HOSTS").get(null);
        return hosts.get(a);
    }
    private static void save() throws Exception {
        Method save = multi().getDeclaredMethod("save"); save.setAccessible(true); save.invoke(null);
    }
    private static String text(Object tab, String name) throws Exception {
        Object value = get(tab, name);
        return value == null ? "" : String.valueOf(value);
    }
    private static int integer(Object tab, String name) throws Exception {
        Object value = get(tab, name); return value instanceof Number ? ((Number)value).intValue() : 0;
    }
    private static Object find(Object model, String id) throws Exception {
        return call(model, "find", new Class<?>[]{String.class}, id);
    }
    private static boolean canRestore(Object model) {
        try {
            Class<?> gesture = Class.forName("e.e.a.GestureControls110");
            Object tab = field(gesture,"closed").get(null);
            return tab != null && tabs(model).size() < 64
                    && find(model, text(tab,"id")) == null;
        } catch (Exception ignored) { return false; }
    }
    private static void restore(Activity activity, Object host, TabAdapter adapter) {
        try {
            Object model = model();
            Class<?> gesture = Class.forName("e.e.a.GestureControls110");
            Object tab = field(gesture,"closed").get(null);
            if (!canRestore(model) || tab == null) return;
            int previous = field(gesture,"closedAt").getInt(null);
            boolean wasEmpty=tabs(model).isEmpty();
            tabs(model).add(Math.max(0,Math.min(previous,tabs(model).size())),tab);
            save();
            // Restoring a tab must not navigate away and dismiss the dialog.
            // Only the previously empty tab set needs an active page.
            if(wasEmpty)call(host,"select",new Class<?>[]{String.class},text(tab,"id"));
            call(host,"bar",new Class<?>[0]);
            adapter.reload();
        } catch (Exception err) {
            android.util.Log.w("nicoid-tab-list","Tab restore failed",err);
        }
    }
    /** Every tab-bar close shares the same one-step restore slot. */
    public static void rememberClosed(Object host,Object tab) {
        if(tab==null)return;
        try{
            Object model=model();
            int index=tabs(model).indexOf(tab);
            if(index<0)return;
            Class<?> gesture=Class.forName("e.e.a.GestureControls110");
            field(gesture,"closed").set(null,tab);
            field(gesture,"closedAt").setInt(null,index);
        }catch(Exception err){android.util.Log.w("nicoid-tab-list","Unable to remember tab",err);}
    }
    private static void close(Activity activity, Object host, Object tab) {
        try {
            call(host,"close",new Class<?>[]{tabType()},tab);
        } catch(Exception err) { android.util.Log.w("nicoid-tab-list","Tab close failed",err); }
    }
    private static void move(Activity activity, Object host, String id, int to) {
        try {
            Object model=model();
            ArrayList<Object> list=tabs(model);
            int from=-1;
            for(int i=0;i<list.size();i++) if(id.equals(text(list.get(i),"id"))) {from=i;break;}
            if(from<0 || to<0 || to>=list.size() || from==to) return;
            Object moving=list.remove(from);
            list.add(Math.min(to,list.size()),moving);
            save();
            call(host,"bar",new Class<?>[0]);
        } catch(Exception err) {android.util.Log.w("nicoid-tab-list","Reorder failed",err);}
    }
    private static int foreground(Context c) { return (c.getResources().getConfiguration().uiMode & 0x30)==0x20 ? 0xffe8ecef : 0xff24292e; }
    private static int secondary(Context c) { return (c.getResources().getConfiguration().uiMode & 0x30)==0x20 ? 0xffa7adb5 : 0xff626a72; }
    private static int background(Context c) { return (c.getResources().getConfiguration().uiMode & 0x30)==0x20 ? 0xff30353a : 0xffecf2f3; }
    private static int accent(Context c) {
        try {return ((Number)Dev112.staticCall("e.e.a.UiDialogs","accent",new Class<?>[]{Context.class},c)).intValue();}
        catch(Exception err){return 0xff168d99;}
    }

    /** Stable 20 dp column for every tab, independent of its name. */
    private static class Glyph extends View {
        private final int kind;
        private final boolean accentGlyph;
        private final Paint paint = new Paint(3);
        Glyph(Context c,int kind){this(c,kind,false);}
        Glyph(Context c,int kind,boolean accentGlyph){
            super(c);
            this.kind=kind;
            this.accentGlyph=accentGlyph;
            setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float factor=Math.min(getWidth(),getHeight())/24f;
            int save=canvas.save();
            canvas.translate((getWidth()-24*factor)/2f,(getHeight()-24*factor)/2f);
            canvas.scale(factor,factor);
            paint.setColor(accentGlyph?accent(getContext()):secondary(getContext()));paint.setStrokeWidth(1.9f);
            paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStyle(Paint.Style.STROKE);
            switch(kind){
                case 1: // search
                    canvas.drawCircle(10,10,5.6f,paint);canvas.drawLine(14,14,20,20,paint);break;
                case 2: // ranking
                    canvas.drawLine(3,20,21,20,paint);
                    canvas.drawRect(5,12,8,19,paint);canvas.drawRect(11,7,14,19,paint);canvas.drawRect(17,4,20,19,paint);break;
                case 3: // local history
                    canvas.drawCircle(12,12,8,paint);canvas.drawLine(12,12,12,7,paint);canvas.drawLine(12,12,16,14,paint);break;
                case 4: // account history
                    canvas.drawArc(3,8,21,21,205,245,false,paint);
                    canvas.drawLine(9,15,12,15,paint);canvas.drawLine(12,15,12,11,paint);break;
                case 5: // playlist / mylists
                    canvas.drawRect(4,5,20,19,paint);
                    for(int y=9;y<=16;y+=4){canvas.drawCircle(8,y,0.5f,paint);canvas.drawLine(11,y,17,y,paint);}break;
                case 6: // mypage
                    canvas.drawCircle(12,8,3,paint);canvas.drawArc(5,11,19,21,185,170,false,paint);break;
                case 7: // following
                    canvas.drawCircle(9,8,2.5f,paint);canvas.drawCircle(16,9,2,paint);
                    canvas.drawArc(3,11,15,21,185,170,false,paint);canvas.drawArc(13,13,22,21,195,150,false,paint);break;
                case 8: // cache
                    canvas.drawLine(12,4,12,16,paint);canvas.drawLine(8,12,12,16,paint);canvas.drawLine(12,16,16,12,paint);canvas.drawLine(5,19,19,19,paint);break;
                case 9: // watch later
                    canvas.drawLine(6,4,18,4,paint);canvas.drawLine(6,4,6,20,paint);canvas.drawLine(18,4,18,20,paint);
                    canvas.drawLine(6,20,12,16,paint);canvas.drawLine(12,16,18,20,paint);break;
                case 10: // nicorepo
                    canvas.drawRect(4,4,20,20,paint);canvas.drawRect(7,7,11,11,paint);
                    canvas.drawLine(13,8,17,8,paint);canvas.drawLine(13,11,17,11,paint);
                    canvas.drawLine(7,14,17,14,paint);canvas.drawLine(7,17,17,17,paint);break;
                default: canvas.drawRoundRect(4,5,20,19,2,2,paint);canvas.drawLine(8,9,16,9,paint);break;
            }
            canvas.restoreToCount(save);
        }
    }
    private static int glyph(Object tab) {
        try {
            String screen=text(tab,"screen"),url=text(tab,"url");
            int kind=integer(tab,"kind"),type=integer(tab,"type");
            if("playlist".equals(screen)||"mylist".equals(screen)) return 5;
            if("mypage".equals(screen)) return 6;
            if("following".equals(screen)) return 7;
            if("cache".equals(screen)) return 8;
            if("nicorepo".equals(screen)) return 10;
            if(type==9 || "deflist".equals(url)) return 9;
            if(type==4) return 4;
            if(type==8) return 3;
            if(kind==0) return 1;
            if(type==6 && url.contains("/ranking/")) return 2;
        }catch(Exception ignored){}
        return 0;
    }
    private static final class TabAdapter extends BaseAdapter {
        final Activity activity; final Object host; final AlertDialog dialog; final TextView undo; final ListView list;
        final ArrayList<Object> items=new ArrayList<>();
        TabAdapter(Activity activity,Object host,AlertDialog dialog,TextView undo,ListView list){
            this.activity=activity;this.host=host;this.dialog=dialog;this.undo=undo;this.list=list;reload();
        }
        void reload() {
            items.clear();
            try{ items.addAll(tabs(model())); }catch(Exception ignored){}
            if(undo!=null){undo.setEnabled(canRestoreSafe());undo.setAlpha(undo.isEnabled()?1f:0.4f);}
            fitList(activity,list,items.size());
            notifyDataSetChanged();
        }
        @Override public int getCount(){return items.size();}
        @Override public Object getItem(int index){return items.get(index);}
        @Override public long getItemId(int index){return index;}
        @Override public View getView(int index,View unused,ViewGroup parent) {
            Context c=activity; Object tab=items.get(index);
            String id="",label="";
            try{id=text(tab,"id");label=text(tab,"label");}catch(Exception ignored){}
            boolean active=false;
            try{active=id.equals(text(model(),"selected"));}catch(Exception ignored){}
            final String selectedId=id;
            LinearLayout row=new LinearLayout(c);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(dp(c,52));
            if(active) row.setBackgroundColor(background(c));
            View stripe=new View(c);
            stripe.setBackgroundColor(active?accent(c):0x00000000);
            row.addView(stripe,new LinearLayout.LayoutParams(dp(c,3),dp(c,30)));
            Glyph icon=new Glyph(c,glyph(tab));
            LinearLayout.LayoutParams iconSize=new LinearLayout.LayoutParams(dp(c,22),dp(c,22));
            iconSize.leftMargin=dp(c,12);iconSize.rightMargin=dp(c,11);
            row.addView(icon,iconSize);
            TextView title=new TextView(c);
            title.setText(label);title.setTextColor(foreground(c));
            title.setTextSize(14);
            title.setSingleLine(true);title.setEllipsize(TextUtils.TruncateAt.END);
            title.setTypeface(Typeface.DEFAULT,active?Typeface.BOLD:Typeface.NORMAL);
            row.addView(title,new LinearLayout.LayoutParams(0,dp(c,48),1));
            title.setGravity(Gravity.CENTER_VERTICAL);
            TextView close=new TextView(c);
            close.setText("×");close.setTextSize(23);close.setTextColor(secondary(c));close.setGravity(Gravity.CENTER);
            close.setContentDescription(tr(c,"タブを閉じる","Close tab","關閉分頁"));
            close.setFocusable(false); close.setClickable(true);
            close.setOnClickListener(v->{
                close(activity,host,tab);
                reload();
            });
            row.addView(close,new LinearLayout.LayoutParams(dp(c,45),dp(c,48)));
            row.setTag(selectedId);
            row.setContentDescription(label);
            return row;
        }
    }

    /** A native platform drag shadow follows the long-pressed row. */
    private static void dragReorder(ListView list, TabAdapter adapter, Activity activity, Object host) {
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            try {
                String tabId=text(adapter.getItem(position),"id");
                return view.startDragAndDrop(ClipData.newPlainText("nicoid-tab",tabId),
                        new View.DragShadowBuilder(view),tabId,0);
            } catch(Exception err) {return false;}
        });
        final long[] lastScroll={0L};
        list.setOnDragListener((target,event)->{
            int action=event.getAction();
            if(action==DragEvent.ACTION_DRAG_STARTED) return event.getLocalState() instanceof String;
            if(action==DragEvent.ACTION_DRAG_LOCATION) {
                long now=SystemClock.uptimeMillis();
                if(now-lastScroll[0]>90) {
                    float y=event.getY();
                    if(y<dp(activity,44)) {list.smoothScrollBy(-dp(activity,45),110);lastScroll[0]=now;}
                    else if(y>list.getHeight()-dp(activity,44)) {list.smoothScrollBy(dp(activity,45),110);lastScroll[0]=now;}
                }
                return true;
            }
            if(action==DragEvent.ACTION_DROP) {
                String source=(String)event.getLocalState();
                int destination=list.pointToPosition(Math.round(event.getX()),Math.round(event.getY()));
                if(destination==ListView.INVALID_POSITION){
                    destination=event.getY()<0?0:adapter.getCount()-1;
                }
                if(source!=null && destination>=0) {
                    move(activity,host,source,destination);
                    adapter.reload();
                }
                return true;
            }
            return true;
        });
    }
    public static void show(Activity activity) {
        if(activity==null || activity.isFinishing() || activity.isDestroyed())return;
        try {
            Object host=selectedHost(activity);
            if(host==null) return;
            AlertDialog previous=opened.get();
            if(previous!=null && previous.isShowing())previous.dismiss();
            Context c=activity;
            LinearLayout wrapper=new LinearLayout(c);wrapper.setOrientation(LinearLayout.VERTICAL);
            wrapper.setPadding(dp(c,14),dp(c,12),dp(c,14),dp(c,10));
            LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);
            TextView title=new TextView(c);title.setText(tr(c,"タブ一覧","Tabs","分頁清單"));
            title.setTextColor(foreground(c));title.setTextSize(18);title.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
            header.addView(title,new LinearLayout.LayoutParams(0,dp(c,43),1));
            TextView dismiss=new TextView(c);dismiss.setText("×");dismiss.setTextSize(26);
            dismiss.setTextColor(secondary(c));dismiss.setGravity(Gravity.CENTER);
            header.addView(dismiss,new LinearLayout.LayoutParams(dp(c,42),dp(c,43)));
            wrapper.addView(header);
            TextView undo=new TextView(c);undo.setText("↶  "+tr(c,"直前に閉じたタブを復元","Restore most recently closed tab","復原最近關閉的分頁"));
            undo.setTextColor(accent(c));undo.setTextSize(13);
            undo.setGravity(Gravity.CENTER_VERTICAL);
            undo.setPadding(dp(c,8),0,dp(c,8),0);
            wrapper.addView(undo,new LinearLayout.LayoutParams(-1,dp(c,40)));
            ListView list=new ListView(c);list.setDivider(null);list.setVerticalScrollBarEnabled(true);
            list.setChoiceMode(ListView.CHOICE_MODE_NONE);list.setBackgroundColor(0x00000000);
            wrapper.addView(list,new LinearLayout.LayoutParams(-1,-2));
            AlertDialog dialog=Dev112.builder(activity).setView(wrapper).create();
            TabAdapter adapter=new TabAdapter(activity,host,dialog,undo,list);
            list.setAdapter(adapter);
            list.setOnItemClickListener((parent,view,index,id)->{
                try {
                    Object tab=adapter.getItem(index);
                    String tabId=text(tab,"id");
                    dialog.dismiss();
                    call(host,"select",new Class<?>[]{String.class},tabId);
                }catch(Exception err){android.util.Log.w("nicoid-tab-list","Tab switch failed",err);}
            });
            dragReorder(list,adapter,activity,host);
            dismiss.setOnClickListener(v->dialog.dismiss());
            undo.setEnabled(canRestore(model()));
            if(!undo.isEnabled())undo.setAlpha(0.4f);
            undo.setOnClickListener(v->{if(canRestoreSafe())restore(activity,host,adapter);});
            dialog.setOnDismissListener(v->{if(opened.get()==dialog) opened.clear();});
            Dev112.show(dialog);
            opened=new WeakReference<>(dialog);
            Window window=dialog.getWindow();
            if(window!=null) window.setLayout(Math.min(dp(c,430),
                c.getResources().getDisplayMetrics().widthPixels-dp(c,32)),-2);
            // Height is capped; ListView itself remains scrollable at 64 tabs.
            fitList(activity,list,adapter.getCount());
            String selected=text(model(),"selected");
            int index=0;for(Object t:adapter.items){if(selected.equals(text(t,"id")))break;index++;}
            if(index<adapter.getCount())list.setSelection(Math.max(0,index-2));
        }catch(Exception err){android.util.Log.w("nicoid-tab-list","Unable to display tabs",err);}
    }
    private static void fitList(Activity activity,ListView list,int count) {
        if(list==null||list.getLayoutParams()==null)return;
        int height=Math.min(dp(activity,52)*Math.max(1,count)+dp(activity,118),
             Math.round(activity.getResources().getDisplayMetrics().heightPixels*0.77f));
        int target=Math.max(dp(activity,52),height-dp(activity,118));
        if(list.getLayoutParams().height!=target){
            list.getLayoutParams().height=target;
            list.requestLayout();
        }
    }
    private static boolean canRestoreSafe() {
        try {return canRestore(model());}catch(Exception ignored){return false;}
    }
    /** Classify ranking tabs without merging different periods or genres. */
    public static boolean sameRanking(Object first, Object second) {
        if(first==null||second==null)return false;
        try{
            return RankingTabIdentity133.same(
                integer(first,"type"),text(first,"screen"),text(first,"url"),
                integer(second,"type"),text(second,"screen"),text(second,"url"));
        }catch(Exception ignored){return false;}
    }
    private static void refreshBars() {
        try {
            Map<?,?> map=(Map<?,?>)field(multi(),"HOSTS").get(null);
            for(Object host:new ArrayList<Object>(map.values())){
                View view=(View)get(host,"bar");
                if(view instanceof LinearLayout) decorateBar(host,(LinearLayout)view);
            }
        }catch(Exception ignored){}
    }
    private static PreferenceGroup parent(PreferenceGroup root,Preference target) {
        for(int i=0;i<root.getPreferenceCount();i++){
            Preference p=root.getPreference(i);
            if(p==target)return root;
            if(p instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)p,target);if(found!=null)return found;}
        }
        return null;
    }
    private static Set<String> buttons(Context c) {
        SharedPreferences shared=prefs(c);
        Set<String> all=new HashSet<>(Arrays.asList(LIST_VALUE,ADD_VALUE));
        if(shared.contains(BUTTONS_KEY)){
            try {return new HashSet<>(shared.getStringSet(BUTTONS_KEY,all));}
            catch(ClassCastException bad){return all;}
        }
        // Preserve individual dev.4 visibility choices on upgrade.
        Set<String> selected=new HashSet<>();
        if(shared.getBoolean(LIST_KEY,true))selected.add(LIST_VALUE);
        if(shared.getBoolean(ADD_KEY,true))selected.add(ADD_VALUE);
        return selected;
    }
    private static String buttonsSummary(Context c) {
        return tr(c,
            "左端の一覧ボタンでタブの切替・管理、右端の＋ボタンでタブを追加します。表示するボタンを選択できます",
            "The left button opens tab management, and + on the right adds a tab. Choose which buttons to display.",
            "左側按鈕開啟分頁管理，右側＋按鈕新增分頁，可選擇顯示的按鈕");
    }
    public static void installSettings(PreferenceActivity activity) {
        if(activity==null)return;
        Preference tabs=activity.findPreference("multiple_video_tabs");
        if(tabs==null)return;
        PreferenceGroup group=parent(activity.getPreferenceScreen(),tabs);
        if(group==null)return;
        if(activity.findPreference(BUTTONS_KEY)!=null)return;
        SharedPreferences shared=prefs(activity);
        Set<String> previous=buttons(activity);
        if(!shared.contains(BUTTONS_KEY))
            shared.edit().putStringSet(BUTTONS_KEY,new HashSet<>(previous)).apply();
        for(String legacy:new String[]{LIST_KEY,ADD_KEY}){
            Preference obsolete=activity.findPreference(legacy);
            if(obsolete!=null){
                PreferenceGroup owner=parent(activity.getPreferenceScreen(),obsolete);
                if(owner!=null)owner.removePreference(obsolete);
            }
        }
        MultiSelectListPreference option=new MultiSelectListPreference(activity);
        option.setKey(BUTTONS_KEY);
        option.setTitle(tr(activity,"タブバーのボタン表示","Tab bar buttons","分頁列按鈕顯示"));
        option.setEntries(new CharSequence[]{
            tr(activity,"タブ一覧ボタンを表示","Show tab list button","顯示分頁清單按鈕"),
            tr(activity,"タブ追加ボタンを表示","Show add tab button","顯示新增分頁按鈕")});
        option.setEntryValues(new CharSequence[]{LIST_VALUE,ADD_VALUE});
        option.setDefaultValue(new HashSet<>(Arrays.asList(LIST_VALUE,ADD_VALUE)));
        option.setSummary(buttonsSummary(activity));
        option.setOnPreferenceChangeListener((preference,value)->{
            if(!(value instanceof Set))return false;
            preference.setSummary(buttonsSummary(activity));
            new android.os.Handler(android.os.Looper.getMainLooper()).post(Dev132::refreshBars);
            return true;
        });
        group.addPreference(option);
    }
    public static void decorateBar(Object host, LinearLayout bar) {
        if(host==null || bar==null)return;
        try {
            Activity activity=(Activity)get(host,"a");
            if(activity==null)return;
            Set<String> shown=buttons(activity);
            View plus=bar.getChildAt(bar.getChildCount()-1);
            if(plus!=null && !"nicoid-tab-list-trigger".equals(plus.getTag()))
                plus.setVisibility(shown.contains(ADD_VALUE)?View.VISIBLE:View.GONE);
            View holder=bar.findViewWithTag("nicoid-tab-list-trigger");
            if(holder==null){
                FrameLayout button=new FrameLayout(activity);
                button.setTag("nicoid-tab-list-trigger");
                button.setContentDescription(actionName(activity));
                Glyph icon=new Glyph(activity,0,true);
                FrameLayout.LayoutParams iconSize=new FrameLayout.LayoutParams(dp(activity,21),dp(activity,21),Gravity.CENTER);
                button.addView(icon,iconSize);
                button.setOnClickListener(v->show(activity));
                bar.addView(button,0,new LinearLayout.LayoutParams(dp(activity,40),-1));
                holder=button;
            }
            holder.setVisibility(shown.contains(LIST_VALUE)?View.VISIBLE:View.GONE);
        }catch(Exception err){android.util.Log.w("nicoid-tab-list","Tab bar controls failed",err);}
    }
}
