package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;

/** Connects group headers to the native tab strip's existing listener contract. */
public final class NativeTabGroups implements InvocationHandler {
    static final String KEY="threadTabGroupsEnabled", BUTTON_KEY="threadTabGroupButtonEnabled", DATA="threadTabGroupsState";
    public static Object nativeSelection(Object strip,Object page){
        java.lang.ref.WeakReference<NativeTabGroups> ref=HOSTS.get(strip);
        NativeTabGroups host=ref==null?null:ref.get();
        if(host==null||strip==host.memberStrip)return page;
        String key=host.adapter.pageKey(page);
        if(key!=null&&host.state.order().contains(key)){
            host.state.select(key);
            if(host.memberStrip!=null&&host.memberStrip.isShown())try{
                host.memberStrip.getClass().getMethod("setSelection",Object.class).invoke(host.memberStrip,page);
            }catch(Exception error){android.util.Log.w("Haiagaru","Member tab selection unavailable",error);}
        }
        return host.adapter.representative(page);
    }
    private static final java.util.Map<Object,java.lang.ref.WeakReference<NativeTabGroups>> HOSTS=new java.util.WeakHashMap<>();
    public static int gestureTarget(Object owner,int requested){
        for(java.lang.ref.WeakReference<NativeTabGroups> ref:HOSTS.values()){
            NativeTabGroups host=ref.get();
            if(host==null)continue;
            try{
                NativeThreadTabBridge bridge=NativeThreadTabBridge.read(host.activity);
                int offset=bridge.relative?requested:requested-bridge.current;
                if(bridge.owner!=owner||Math.abs(offset)!=1)continue;
                int first=bridge.current+offset;
                for(int next=first;;next+=offset){
                    NativeThreadTabBridge.Tab target=null;
                    for(NativeThreadTabBridge.Tab tab:bridge.tabs)if(tab.index==next){target=tab;break;}
                    if(target==null)return next==first?requested:bridge.relative?0:bridge.current;
                    ThreadTabGroups.Group group=host.state.owner(target.key);
                    if(group==null||group.id.equals(host.adapter.expanded()))return bridge.relative?next-bridge.current:next;
                }
            }catch(Exception error){return requested;}
        }
        return requested;
    }

    static boolean movePastCollapsed(Activity activity,int offset)throws Exception{
        NativeTabGroups host=null;
        for(java.lang.ref.WeakReference<NativeTabGroups> ref:HOSTS.values()){
            NativeTabGroups candidate=ref.get();
            if(candidate!=null&&candidate.activity==activity){host=candidate;break;}
        }
        if(host==null)return false;
        NativeThreadTabBridge bridge=NativeThreadTabBridge.read(activity);
        int next=bridge.current+offset;
        boolean skipped=false;
        for(;;next+=offset){
            NativeThreadTabBridge.Tab target=null;
            for(NativeThreadTabBridge.Tab tab:bridge.tabs)if(tab.index==next){target=tab;break;}
            if(target==null)return skipped;
            ThreadTabGroups.Group group=host.state.owner(target.key);
            if(group==null||group.id.equals(host.adapter.expanded())){
                if(skipped)bridge.select(target);
                return skipped;
            }
            skipped=true;
        }
    }
    static ListAdapter tabAdapter(View view)throws Exception{
        view.getClass().getMethod("setAdapter",ListAdapter.class);
        try{return (ListAdapter)view.getClass().getMethod("getMAdapter").invoke(view);}catch(NoSuchMethodException old){return (ListAdapter)typedField(view,ListAdapter.class);}
    }
    static Object tabListener(View view)throws Exception{
        try{return view.getClass().getMethod("getMListener").invoke(view);}catch(NoSuchMethodException old){
            for(Method method:view.getClass().getMethods())if(method.getName().equals("setListener"))return typedField(view,method.getParameterTypes()[0]);
            throw old;
        }
    }
    private static Object typedField(Object owner,Class<?> type)throws Exception{
        for(Class<?> cls=owner.getClass();cls!=null;cls=cls.getSuperclass())for(Field field:cls.getDeclaredFields())if(field.getType()==type){field.setAccessible(true);return field.get(owner);}
        throw new NoSuchFieldException(type.getName());
    }
    private static final int MENU_GROUP_THREAD=0x7e001a02;
    private static final java.util.Map<Activity,String> PENDING_THREAD_GROUP_ACTIONS=new java.util.WeakHashMap<>();
    static void openSelector(Activity activity){
        openSelector(activity,null);
    }
    private static void openSelector(Activity activity,String selectedKey){
        try{
            for(View view:NativeThreadTabBridge.read(activity).paneViews){
                try{view.getClass().getMethod("setAdapter",ListAdapter.class);}catch(NoSuchMethodException absent){continue;}
                java.lang.ref.WeakReference<NativeTabGroups> ref=HOSTS.get(view);
                NativeTabGroups host=ref==null?null:ref.get();
                if(host==null){
                    ListAdapter original=tabAdapter(view);
                    Object listener=tabListener(view);
                    host=new NativeTabGroups(activity,view,original,listener);host.attach();
                }
                host.selectThreads(selectedKey);return;
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not open group selector",error);}
        Toast.makeText(activity,"タブレット表示でスレを開いてください",Toast.LENGTH_SHORT).show();
    }
    /** Adds the action to ChMate's native tab long-press menu (the Close / Board menu). */
    public static void addThreadGroupAction(Menu menu,Object fragment){
        if(menu==null||fragment==null)return;
        Activity activity;
        try{Object owner=fragment.getClass().getMethod("getActivity").invoke(fragment);activity=owner instanceof Activity?(Activity)owner:null;}
        catch(Exception error){return;}
        if(activity==null||!activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.TabletHomeActivity"))return;
        try{
            SharedPreferences preferences=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
            if(!preferences.getBoolean(KEY,false)||!preferences.getBoolean(BUTTON_KEY,true))return;
            String key=NativeThreadTabBridge.read(activity).keyForFragment(fragment);
            if(key==null)return;
            synchronized(PENDING_THREAD_GROUP_ACTIONS){PENDING_THREAD_GROUP_ACTIONS.put(activity,key);}
            MenuItem item=menu.findItem(MENU_GROUP_THREAD);
            if(item==null)item=menu.add(Menu.NONE,MENU_GROUP_THREAD,menu.size(),"グループ化");
            int icon=activity.getResources().getIdentifier("haiagaru_thread_tab_groups","drawable",activity.getPackageName());
            if(icon!=0)item.setIcon(icon);
            item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            item.setOnMenuItemClickListener(clicked->{
                if(!activity.isFinishing()&&!activity.isDestroyed())openSelector(activity,key);
                return true;
            });
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not add tab grouping action",error);}
    }
    /** ChMate's tablet popup dispatches selected items through Activity.onOptionsItemSelected
     * without running the MenuItem click listener. Consume only this tab-specific action. */
    public static boolean dispatchThreadGroupAction(Object owner,Object selected){
        if(!(owner instanceof Activity)||!(selected instanceof MenuItem))return false;
        MenuItem item=(MenuItem)selected;
        if(item.getItemId()!=MENU_GROUP_THREAD)return false;
        Activity activity=(Activity)owner;String key;
        synchronized(PENDING_THREAD_GROUP_ACTIONS){key=PENDING_THREAD_GROUP_ACTIONS.remove(activity);}
        if(key==null){Toast.makeText(activity,"グループ化するスレを取得できませんでした",Toast.LENGTH_SHORT).show();return true;}
        if(!activity.isFinishing()&&!activity.isDestroyed())openSelector(activity,key);
        return true;
    }
    private void selectThreads(String selectedKey)throws Exception{
        java.util.List<NativeThreadTabBridge.Tab> tabs=NativeThreadTabBridge.read(activity).tabs;
        if(tabs.isEmpty()){Toast.makeText(activity,"開いているスレがありません",Toast.LENGTH_SHORT).show();return;}
        chooser=ThreadGroupSelectionDialog.show(activity,tabs,selectedKey,this::chooseDestination);
    }

    private void chooseDestination(java.util.List<String> keys){
        java.util.List<ThreadTabGroups.Group> groups=state.groups();String[] names=new String[groups.size()+1];names[0]="新しいグループ";
        for(int i=0;i<groups.size();i++)names[i+1]=groups.get(i).name;
        chooser=new HaiagaruDialog.Builder(activity).setTitle("追加先のグループ").setItems(names,(d,index)->{
            if(index==0){EditText name=new EditText(activity);name.setSingleLine();name.setHint("グループ名（省略可）");
                chooser=new HaiagaruDialog.Builder(activity).setTitle("新しいグループ").setView(name).setPositiveButton("作成",(dialog,which)->commitSelection(keys,null,name.getText().toString())).setNegativeButton("キャンセル",null).show();
            }else commitSelection(keys,groups.get(index-1).id,null);
        }).setNegativeButton("キャンセル",null).show();
    }
    private void commitSelection(java.util.List<String> keys,String destination,String name){
        try{
            java.util.List<String> live=new java.util.ArrayList<>();
            for(NativeThreadTabBridge.Tab tab:NativeThreadTabBridge.read(activity).tabs)live.add(tab.key);
            state.reconcile(live);java.util.List<String> selected=new java.util.ArrayList<>(keys);selected.retainAll(live);
            if(selected.isEmpty()){Toast.makeText(activity,"選択したスレは閉じられています",Toast.LENGTH_SHORT).show();return;}
            ThreadTabGroups.Group group=null;
            if(destination==null)group=state.create(selected,name);
            else{
                for(ThreadTabGroups.Group candidate:state.groups())if(candidate.id.equals(destination))group=candidate;
                if(group==null){Toast.makeText(activity,"追加先のグループがありません",Toast.LENGTH_SHORT).show();return;}
                for(String key:selected)state.move(key,group.id,group.tabs.size());
            }
            expand(null);save();
        }catch(Exception error){android.util.Log.w("Haiagaru","Could not add selected tabs",error);Toast.makeText(activity,"グループへの追加に失敗しました",Toast.LENGTH_SHORT).show();}
    }
    static void resume(Activity activity){
        if(!activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.TabletHomeActivity"))return;
        boolean enabled=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(KEY,false);
        activity.getWindow().getDecorView().post(()->{
            if(activity.isFinishing()||activity.isDestroyed())return;
            try{for(View view:NativeThreadTabBridge.read(activity).paneViews){
                java.lang.ref.WeakReference<NativeTabGroups> existingRef=HOSTS.get(view);
                NativeTabGroups existing=existingRef==null?null:existingRef.get();
                if(!enabled){if(existing!=null)existing.detach();continue;}
                if(existing!=null){existing.adapter.activate();continue;}
                try{view.getClass().getMethod("setAdapter",ListAdapter.class);}catch(NoSuchMethodException absent){continue;}
                ListAdapter nativeAdapter=tabAdapter(view);
                if(nativeAdapter==null||nativeAdapter instanceof NativeThreadTabAdapter)continue;
                Object listener=tabListener(view);
                if(listener!=null)new NativeTabGroups(activity,view,nativeAdapter,listener).attach();
            }}catch(Exception error){android.util.Log.w("Haiagaru","Native tab grouping unavailable",error);}
        });
    }
    private final Activity activity;
    private final boolean middle;
    private final View strip;
    private final Object original;
    private final ThreadTabGroups state;
    private final NativeThreadTabAdapter adapter;
    private final SharedPreferences preferences;
    private final ListAdapter nativeAdapter;
    private NativeThreadTabAdapter memberAdapter;
    private View memberStrip;
    private Object proxyListener;
    private int reservedHeight;
    private View body;
    private HaiagaruDialog chooser;
    private View.OnAttachStateChangeListener lifecycle;
    NativeTabGroups(Activity activity,View strip,ListAdapter nativeAdapter,Object listener)throws Exception{
        this.activity=activity;this.strip=strip;original=listener;this.nativeAdapter=nativeAdapter;
        middle=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName.equals("0.8.10.226 dev");
        preferences=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        state=ThreadTabGroupStore.decode(preferences.getString(DATA,""));
        adapter=new NativeThreadTabAdapter(nativeAdapter,state,activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName);
    }
    void attach()throws Exception{
        Method setter=null;
        for(Method method:strip.getClass().getMethods())if(method.getName().equals("setListener")&&method.getParameterTypes().length==1)setter=method;
        if(setter==null)throw new NoSuchMethodException("Native tab listener");
        Class<?> contract=setter.getParameterTypes()[0];
        Object listener=Proxy.newProxyInstance(contract.getClassLoader(),new Class<?>[]{contract},this);proxyListener=listener;
        setter.invoke(strip,listener);HOSTS.put(strip,new java.lang.ref.WeakReference<>(this));
        strip.getClass().getMethod("setAdapter",ListAdapter.class).invoke(strip,adapter);
        lifecycle=new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){adapter.activate();if(memberAdapter!=null)memberAdapter.activate();HOSTS.put(strip,new java.lang.ref.WeakReference<>(NativeTabGroups.this));}
            public void onViewDetachedFromWindow(View view){adapter.dispose();if(memberAdapter!=null)memberAdapter.dispose();HOSTS.remove(strip);if(memberStrip!=null)HOSTS.remove(memberStrip);}
        };
        strip.addOnAttachStateChangeListener(lifecycle);
        if(state.expanded!=null)strip.post(()->expand(state.expanded));
    }
    private void detach()throws Exception{
        save();if(chooser!=null&&chooser.isShowing())chooser.dismiss();resizeMembers(0);
        if(memberStrip!=null){((ViewGroup)memberStrip.getParent()).removeView(memberStrip);HOSTS.remove(memberStrip);memberAdapter.dispose();}
        strip.removeOnAttachStateChangeListener(lifecycle);
        strip.getClass().getMethod("setAdapter",ListAdapter.class).invoke(strip,nativeAdapter);
        for(Method method:strip.getClass().getMethods())if(method.getName().equals("setListener"))method.invoke(strip,original);
        adapter.dispose();HOSTS.remove(strip);
    }
    public Object invoke(Object proxy,Method method,Object[] args)throws Throwable{
        if(method.getDeclaringClass()==Object.class){
            if(method.getName().equals("equals"))return proxy==args[0];
            if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
            return "Haiagaru native tab groups";
        }
        // Native upper strips can dispatch the original page behind a group
        // header. Member-strip callbacks must keep their real thread payload.
        if(args!=null&&args.length==3&&args[0]==strip&&args[1] instanceof View
                &&method.getParameterTypes()[1]==View.class){
            Object represented=adapter.representative(args[2]);
            if(represented instanceof ThreadTabGroups.Group){args=args.clone();args[2]=represented;}
        }
        if(args!=null&&args.length==2&&args[0]==strip&&args[1] instanceof ThreadTabGroups.Group){
            ThreadTabGroups.Group group=(ThreadTabGroups.Group)args[1];
            if(method.getName().equals("d")){
                expand(group.id.equals(adapter.expanded())?null:group.id);
                save();
                return true;
            }
            // 191 invokes b(strip, item) before dispatching the gesture.
            return false;
        }
        if(args!=null&&args.length==1&&args[0] instanceof ThreadTabGroups.Group&&method.getName().equals("e")){
            menu((ThreadTabGroups.Group)args[0]);
            return true;
        }
        if(args!=null&&args.length==3&&args[0]==strip&&args[1] instanceof View&&args[2] instanceof ThreadTabGroups.Group){
            ThreadTabGroups.Group group=(ThreadTabGroups.Group)args[2];
            String callback=method.getName();
            if(callback.equals(middle?"d":"b")){
                expand(group.id.equals(adapter.expanded())?null:group.id);
                save();
                return true;
            }
            if(callback.equals("c")){
                menu(group);
                return true;
            }
            return false;
        }
        if(args!=null&&args.length==3&&method.getParameterTypes()[1]==Object.class&&method.getParameterTypes()[2]==Object.class){
            Object source=args[1],target=args[2];
            String from=adapter.pageKey(source),to=adapter.pageKey(target);
            if(from!=null&&to!=null&&state.reorderMember(from,to)){
                adapter.rebuild();if(memberAdapter!=null)memberAdapter.rebuild();save();return true;
            }
            Object left=source instanceof ThreadTabGroups.Group?source:from;
            Object right=target instanceof ThreadTabGroups.Group?target:to;
            if(from!=null&&state.owner(from)!=null)left=null;
            if(to!=null&&state.owner(to)!=null)right=null;
            if(left!=null&&right!=null){
                if(state.reorderTop(left,right)){adapter.rebuild();save();}
                return true;
            }
            if(source instanceof ThreadTabGroups.Group||target instanceof ThreadTabGroups.Group){adapter.rebuild();return true;}
        }
        if(args!=null&&args.length==2&&containsHeader(args[1],2))return false;
        // Never hand a synthetic header to the native code's concrete page cast.
        if(args!=null)for(Object value:args)if(value instanceof ThreadTabGroups.Group)return false;
        try{return method.invoke(original,args);}catch(InvocationTargetException error){throw error.getCause();}
    }
    private static boolean containsHeader(Object value,int depth){
        if(value instanceof ThreadTabGroups.Group)return true;
        if(value==null||depth==0||!value.getClass().getName().startsWith("o."))return false;
        for(Field field:value.getClass().getDeclaredFields())if(!java.lang.reflect.Modifier.isStatic(field.getModifiers())&&!field.getType().isPrimitive())try{
            field.setAccessible(true);if(containsHeader(field.get(value),depth-1))return true;
        }catch(ReflectiveOperationException ignored){}
        return false;
    }
    private void expand(String id){
        adapter.expand(id);
        try{
            if(state.display==ThreadTabGroups.Display.TWO_ROWS&&id!=null){
                if(memberStrip==null){
                    if(!(strip.getParent() instanceof FrameLayout))throw new IllegalStateException("Native tab header is not a frame");
                    memberStrip=(View)strip.getClass().getConstructor(android.content.Context.class,android.util.AttributeSet.class).newInstance(activity,null);
                    memberAdapter=new NativeThreadTabAdapter(nativeAdapter,state,activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName,true);
                    memberStrip.getClass().getMethod("setAdapter",ListAdapter.class).invoke(memberStrip,memberAdapter);
                    for(Method method:memberStrip.getClass().getMethods())if(method.getName().equals("setListener"))method.invoke(memberStrip,proxyListener);
                    memberStrip.getClass().getMethod("setTabMode",boolean.class).invoke(memberStrip,true);
                    memberStrip.getClass().getMethod("setDndSort",boolean.class).invoke(memberStrip,true);
                    HOSTS.put(memberStrip,new java.lang.ref.WeakReference<>(this));
                    ((FrameLayout)strip.getParent()).addView(memberStrip,new FrameLayout.LayoutParams(strip.getWidth(),strip.getHeight()));
                    body=NativeThreadTabBridge.read(activity).body;
                    // 226 nests its content in AbsoluteLayout/FrameLayout. Resize
                    // the sibling of the header, not the inner content surface.
                    View header=(View)strip.getParent();
                    if(body!=null){
                        View candidate=body;
                        while(candidate.getParent() instanceof View&&candidate.getParent()!=header.getParent())
                            candidate=(View)candidate.getParent();
                        if(candidate.getParent()==header.getParent()&&candidate!=header)body=candidate;
                    }
                }
                memberAdapter.expand(id);memberStrip.setVisibility(View.VISIBLE);resizeMembers(strip.getHeight());
            }else{
                if(memberStrip!=null){memberStrip.setVisibility(View.GONE);memberAdapter.expand(null);}
                resizeMembers(0);
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Native member tab row unavailable",error);}
    }
    private void resizeMembers(int height){
        if(memberStrip==null||body==null)return;
        FrameLayout.LayoutParams member=(FrameLayout.LayoutParams)memberStrip.getLayoutParams();
        member.width=strip.getWidth();member.height=strip.getHeight();member.topMargin=strip.getHeight();memberStrip.setLayoutParams(member);
        int delta=height-reservedHeight;if(delta==0)return;
        View header=(View)strip.getParent();ViewGroup.LayoutParams headerParams=header.getLayoutParams();
        if(!(body.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return;
        ViewGroup.MarginLayoutParams bodyParams=(ViewGroup.MarginLayoutParams)body.getLayoutParams();
        if(headerParams.height<=0||(bodyParams.height>0&&bodyParams.height<=delta))return;
        headerParams.height+=delta;bodyParams.topMargin+=delta;if(bodyParams.height>0)bodyParams.height-=delta;reservedHeight=height;
        header.setLayoutParams(headerParams);body.setLayoutParams(bodyParams);
    }
    private void menu(ThreadTabGroups.Group group){
        chooser=new HaiagaruDialog.Builder(activity).setTitle("グループ編集："+group.name).setItems(new String[]{"名前を変更","グループを解除","1段／2段表示を切り替える","別のグループと統合","所属スレをグループから外す","色を変更","左へ移動","右へ移動"},(dialog,which)->{
            if(which==6||which==7){
                java.util.List<Object> blocks=new java.util.ArrayList<>();
                for(String key:state.order()){
                    ThreadTabGroups.Group owner=state.owner(key);
                    Object block=owner==null?key:owner;
                    if(!blocks.contains(block))blocks.add(block);
                }
                int index=blocks.indexOf(group),target=index+(which==6?-1:1);
                if(index<0||target<0||target>=blocks.size())return;
                state.reorderTop(group,blocks.get(target));
                adapter.rebuild();save();
            }else if(which==3){
                java.util.List<ThreadTabGroups.Group> others=new java.util.ArrayList<>();for(ThreadTabGroups.Group candidate:state.groups())if(candidate!=group)others.add(candidate);
                if(others.isEmpty()){Toast.makeText(activity,"統合できる別のグループがありません",Toast.LENGTH_SHORT).show();return;}
                String[] names=new String[others.size()];for(int i=0;i<names.length;i++)names[i]=others.get(i).name;
                chooser=new HaiagaruDialog.Builder(activity).setTitle("統合するグループ").setItems(names,(d,i)->{ThreadTabGroups.Group merged=state.mergeGroups(others.get(i).id,group.id);expand(null);save();}).setNegativeButton("キャンセル",null).show();
            }else if(which==4){
                java.util.List<String> keys=new java.util.ArrayList<>(group.tabs);String[] titles=new String[keys.size()];boolean[] selected=new boolean[keys.size()];
                try{java.util.List<NativeThreadTabBridge.Tab> tabs=NativeThreadTabBridge.read(activity).tabs;
                    for(int i=0;i<titles.length;i++){titles[i]=keys.get(i);for(NativeThreadTabBridge.Tab tab:tabs)if(tab.key.equals(keys.get(i)))titles[i]=tab.title;}
                }catch(Exception error){android.util.Log.w("Haiagaru","Could not read member titles",error);}
                chooser=new HaiagaruDialog.Builder(activity).setTitle("グループから外すスレ").setMultiChoiceItems(titles,selected,(d,i,value)->selected[i]=value).setPositiveButton("外す",(d,whichButton)->{
                    for(int i=0;i<keys.size();i++)if(selected[i]&&state.order().contains(keys.get(i)))state.detach(keys.get(i));
                    expand(state.groups().contains(group)?group.id:null);save();
                }).setNegativeButton("キャンセル",null).show();
            }else if(which==5){
                chooser=new HaiagaruDialog.Builder(activity).setTitle("グループの色").setItems(new String[]{"青","緑","赤","紫"},(d,i)->{group.color=new int[]{0xff1976d2,0xff388e3c,0xffd32f2f,0xff7b1fa2}[i];adapter.rebuild();save();}).show();
            }else if(which==2){state.display=state.display==ThreadTabGroups.Display.ONE_ROW?ThreadTabGroups.Display.TWO_ROWS:ThreadTabGroups.Display.ONE_ROW;expand(adapter.expanded());save();}
            else if(which==1){state.ungroup(group.id);expand(null);save();}
            else{EditText text=new EditText(activity);text.setText(group.name);
                chooser=new HaiagaruDialog.Builder(activity).setTitle("グループ名").setView(text).setPositiveButton("保存",(d,i)->{
                    String name=text.getText().toString().trim();if(!name.isEmpty()){group.name=name;adapter.rebuild();save();}
                }).setNegativeButton("キャンセル",null).show();}
        }).show();
    }
    private void save(){try{preferences.edit().putString(DATA,ThreadTabGroupStore.encode(state)).apply();}
        catch(Exception error){android.util.Log.w("Haiagaru","Could not save native tab groups",error);}}
}
