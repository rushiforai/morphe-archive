package app.morphe.extension.chmate;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import java.lang.reflect.Field;

/** Extends the native title dialog before its view is attached; native actions stay intact. */
public final class ThreadTitleActions {
    static final String SHOW_REFRESH="titleMenuShowRefresh",SHOW_WATCH="titleMenuShowWatch",SHOW_AUTH="titleMenuShowAuth";
    private static java.lang.ref.WeakReference<Object> pending=new java.lang.ref.WeakReference<>(null);
    public static View wrap(Object fragment,View original){
        if(original==null)return null;
        try{
            Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return original;
            String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
            if(!"0.8.10.191 dev".equals(version)){
                // Material's ModalBottomSheet creates a separate Dialog window.
                // Decorating this Fragment's ComposeView would put controls behind it.
                pending=new java.lang.ref.WeakReference<>(fragment);return original;
            }
            return content(fragment,a,original);
        }catch(Exception error){android.util.Log.w("Haiagaru","Thread title actions unavailable",error);return original;}
    }
    private static final class MenuThread {
        final Object info;
        final ThreadWatchRules.Target target;
        MenuThread(Object info,ThreadWatchRules.Target target){this.info=info;this.target=target;}
    }
    private static MenuThread thread(Object fragment,Activity a)throws Exception{
        String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
        boolean old=version.contains("191"), middle=version.contains("226");
        Bundle args=(Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);
        if(args==null)return null;
        Object info=args.get("threadUrl");
        if(info==null){Object packed=args.get("args");if(packed!=null)for(Field f:packed.getClass().getDeclaredFields())if(f.getType().getName().equals("jp.syoboi.a2chMate.client.BBSUrlInfo")){f.setAccessible(true);info=f.get(packed);break;}}
        if(info==null)return null;
        String server=(String)NativeFields.find(info.getClass(),old?"i":middle?"g":"f").get(info);
        String board=(String)NativeFields.find(info.getClass(),old?"b":middle?"f":"g").get(info);
        Object id=NativeFields.find(info.getClass(),middle?"c":"e").get(info);
        ReporterArchiveLookup.request(a,server,board,id,args.getString("threadTitle"));
        return new MenuThread(info,ThreadWatchRules.fromParts(server,board,id));
    }
    // Use ChMate's own Compose runtime. The extension's isolated Compose state
    // cannot invalidate a native composition. Each menu row has its own token.
    private static final java.util.List<java.lang.ref.WeakReference<RefreshLabel>> refreshLabels=new java.util.ArrayList<>();

    private static final class RefreshLabel implements Runnable {
        final Activity activity;
        final Object info, state;
        final String token;
        final java.lang.reflect.Method read, write;

        RefreshLabel(Activity activity,Object info,String initial,boolean middle)throws Exception{
            this.activity=activity;this.info=info;
            token=new String(initial);
            ClassLoader loader=activity.getClassLoader();
            Class<?> factory=loader.loadClass(middle?"o.gc":"o.b8");
            Class<?> policy=loader.loadClass(middle?"o.b1":"o.b7d");
            java.lang.reflect.Method create=factory.getDeclaredMethod(middle?"c":"a",Object.class,policy,int.class);
            create.setAccessible(true);
            state=create.invoke(null,initial,null,2);
            Class<?> implementation=loader.loadClass(middle?"o.i":"o.b7c");
            read=implementation.getMethod("c");
            write=implementation.getMethod(middle?"a":"c",Object.class);
            read.setAccessible(true);write.setAccessible(true);
            refreshLabels.removeIf(ref->ref.get()==null);
            refreshLabels.add(new java.lang.ref.WeakReference<>(this));
        }

        @Override public void run(){
            RefreshTargets.toggleFromMenu(activity,info);
            try{String label=RefreshTargets.menuLabel(activity,info);if(label!=null)write.invoke(state,label);}
            catch(Exception error){android.util.Log.w("Haiagaru","Refresh title menu label unavailable",error);}
        }
    }

    public static String liveLabel(String label){
        for(int i=refreshLabels.size()-1;i>=0;i--){
            RefreshLabel entry=refreshLabels.get(i).get();
            if(entry==null){refreshLabels.remove(i);continue;}
            if(entry.token==label)try{return (String)entry.read.invoke(entry.state);}
            catch(Exception error){android.util.Log.w("Haiagaru","Refresh title menu state unavailable",error);break;}
        }
        return label;
    }

    public static java.util.List<?> appendNativeGroups(java.util.List<?> original){
        Object fragment=pending.get();if(fragment==null||original==null)return original;
        try{
            if(!Boolean.TRUE.equals(fragment.getClass().getMethod("isAdded").invoke(fragment)))return original;
            Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return original;
            MenuThread menu=thread(fragment,a);if(menu==null)return original;
            java.util.ArrayList<String> labels=new java.util.ArrayList<>();
            java.util.ArrayList<Runnable> actions=new java.util.ArrayList<>();
            boolean middle=fragment.getClass().getName().equals("o.getDislikeManager");
            if(FeatureSwitches.enabled(SHOW_REFRESH,true)){
                String label=RefreshTargets.menuLabel(a,menu.info);
                if(label!=null){
                    try{RefreshLabel live=new RefreshLabel(a,menu.info,label,middle);labels.add(live.token);actions.add(live);}
                    catch(ReflectiveOperationException error){
                        android.util.Log.w("Haiagaru","Native refresh menu state unavailable",error);
                        labels.add(label);actions.add(()->RefreshTargets.toggleFromMenu(a,menu.info));
                    }
                }
            }
            ThreadWatchRules.Target target=menu.target;
            if(target!=null&&FeatureSwitches.enabled(SHOW_WATCH,true)){
                labels.add("このスレの新着通知");actions.add(()->ThreadWatch.show(a,target));
            }
            if(target!=null&&FeatureSwitches.enabled(SHOW_AUTH,true)&&ReadingAuth.eligible(target.url)){
                labels.add("エッヂの閲覧認証");actions.add(()->ReadingAuth.open(a,target.url));
            }
            if(labels.isEmpty())return middle?twoNativeColumns(original):original;
            ClassLoader loader=fragment.getClass().getClassLoader();
            Class<?> row=loader.loadClass(middle?"o.getTtAdContainer$IconCompatParcelizer":"o.zzbbs$RemoteActionCompatParcelizer");
            Class<?> fn=loader.loadClass(middle?"o.binderDied":"o.zzcbx");
            Object unit=NativeFields.find(loader.loadClass(middle?"o.Ff11":"o.zzbwq"),middle?"c":"INSTANCE").get(null);
            Object icon=null;
            if(!middle){
                Field field=NativeFields.find(row,"d");
                for(Object group:original)if(group instanceof java.util.List){
                    for(Object item:(java.util.List<?>)group)if(row.isInstance(item)){icon=field.get(item);if(icon!=null)break;}
                    if(icon!=null)break;
                }
                if(icon==null)return original;
            }
            java.lang.reflect.Constructor<?> ctor=middle?row.getDeclaredConstructor(String.class,fn):
                row.getDeclaredConstructor(String.class,NativeFields.find(row,"d").getType(),fn,boolean.class,boolean.class);
            ctor.setAccessible(true);
            java.util.ArrayList<Object> added=new java.util.ArrayList<>();
            for(int i=0;i<labels.size();i++){
                Runnable action=actions.get(i);
                Object callback=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{fn},(self,method,args)->{
                    switch(method.getName()){
                        case "invoke": if(!a.isFinishing()&&!a.isDestroyed())action.run();return unit;
                        case "hashCode": return System.identityHashCode(self);
                        case "equals": return self==args[0];
                        default: return "Haiagaru thread title action";
                    }
                });
                added.add(middle?ctor.newInstance(labels.get(i),callback):ctor.newInstance(labels.get(i),icon,callback,false,true));
            }
            java.util.ArrayList<Object> groups=new java.util.ArrayList<>(original);
            groups.add(added);
            return middle?twoNativeColumns(groups):groups;
        }catch(Exception error){android.util.Log.w("Haiagaru","Native thread title actions unavailable",error);return original;}
    }
    private static java.util.List<?> twoNativeColumns(java.util.List<?> groups){
        java.util.ArrayList<Object> rows=new java.util.ArrayList<>();
        for(Object group:groups){
            if(!(group instanceof java.util.List))return groups;
            rows.addAll((java.util.List<?>)group);
        }
        if(rows.size()<2)return groups;
        int split=(rows.size()+1)/2;
        return java.util.Arrays.asList(new java.util.ArrayList<>(rows.subList(0,split)),
                new java.util.ArrayList<>(rows.subList(split,rows.size())));
    }
    /** Compose versions use packed text units. Zero leaves the themed size in effect. */
    public static long compactLabelSize(String label){
        android.content.Context context=Haiagaru.applicationContextForExtension();
        if(context==null||label==null||label.length()<8)return 0;
        android.content.res.Resources res=context.getResources();
        android.util.DisplayMetrics dm=res.getDisplayMetrics();
        int screen=res.getConfiguration().screenWidthDp;
        if(screen<=0)return 0;
        android.text.TextPaint paint=new android.text.TextPaint();
        paint.setTextSize(android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,14,dm));
        float available=(screen-112)*dm.density; // Sheet padding, menu icon and text padding.
        if(available<=0)return 0;
        float measured=paint.measureText(label);
        if(measured<=available)return 0;
        float size=Math.max(11f,(float)Math.floor(28f*available/measured)/2f);
        return (1L<<32)|(Float.floatToRawIntBits(size)&0xffffffffL);
    }
    private static void fitLegacyLabels(View view){
        if(android.os.Build.VERSION.SDK_INT>=26&&view instanceof android.widget.Button){
            android.widget.TextView text=(android.widget.TextView)view;
            float scale=text.getResources().getDisplayMetrics().scaledDensity;
            int size=Math.round(text.getTextSize()/scale);
            if(text.getMaxLines()==1){
                text.setSingleLine(false);
                text.setMaxLines(2);
                text.setEllipsize(android.text.TextUtils.TruncateAt.END);
                if(size>11)text.setAutoSizeTextTypeUniformWithConfiguration(11,size,1,android.util.TypedValue.COMPLEX_UNIT_SP);
            }
        }
        if(view instanceof android.view.ViewGroup){
            android.view.ViewGroup parent=(android.view.ViewGroup)view;
            for(int i=0;i<parent.getChildCount();i++)fitLegacyLabels(parent.getChildAt(i));
        }
    }
    private static boolean nativeColumn(View view){
        if(!(view instanceof LinearLayout))return false;
        LinearLayout column=(LinearLayout)view;
        if(column.getOrientation()!=LinearLayout.VERTICAL)return false;
        for(int i=0;i<column.getChildCount();i++)
            if(column.getChildAt(i).getClass().getName().equals("o.r8lambdaFP1taOY2C0VNHH09jrpf0HpwLqQ"))return true;
        return false;
    }
    private static View content(Object fragment,Activity a,View original)throws Exception{
        MenuThread menu=thread(fragment,a);if(menu==null)return original;
        fitLegacyLabels(original);
        if(!(original instanceof android.widget.ScrollView))return original;
        View child=((android.widget.ScrollView)original).getChildAt(0);
        if(!(child instanceof LinearLayout))return original;
        LinearLayout root=(LinearLayout)child;
        LinearLayout left=null,right=null;
        for(int i=0;i<root.getChildCount();i++){
            if(!(root.getChildAt(i) instanceof LinearLayout))continue;
            LinearLayout grid=(LinearLayout)root.getChildAt(i);
            if(grid.getOrientation()==LinearLayout.HORIZONTAL&&grid.getChildCount()==2
                    &&nativeColumn(grid.getChildAt(0))&&nativeColumn(grid.getChildAt(1))){
                left=(LinearLayout)grid.getChildAt(0);right=(LinearLayout)grid.getChildAt(1);break;
            }
        }
        if(left==null||right==null)return original;
        Button template=(Button)left.getChildAt(0);
        java.util.ArrayList<Button> entries=new java.util.ArrayList<>();
        if(FeatureSwitches.enabled(SHOW_REFRESH,true)){
            String label=RefreshTargets.menuLabel(a,menu.info);
            if(label!=null){
                Button item=legacyItem(template,label,()->{});
                item.setOnClickListener(v->{
                    RefreshTargets.toggleFromMenu(a,menu.info);
                    try{item.setText(RefreshTargets.menuLabel(a,menu.info));}
                    catch(Exception error){android.util.Log.w("Haiagaru","Refresh title menu label unavailable",error);}
                });
                entries.add(item);
            }
        }
        ThreadWatchRules.Target t=menu.target;
        if(t!=null&&FeatureSwitches.enabled(SHOW_WATCH,true))
            entries.add(legacyItem(template,"このスレの新着通知",()->ThreadWatch.show(a,t)));
        if(t!=null&&FeatureSwitches.enabled(SHOW_AUTH,true)&&ReadingAuth.eligible(t.url))
            entries.add(legacyItem(template,"エッヂの閲覧認証",()->ReadingAuth.open(a,t.url)));
        int leftCount=visibleItems(left),rightCount=visibleItems(right);
        for(Button entry:entries){
            LinearLayout column=leftCount<=rightCount?left:right;
            column.addView(entry,new LinearLayout.LayoutParams(-1,-2));
            if(column==left)leftCount++;else rightCount++;
        }
        return original;
    }
    private static int visibleItems(LinearLayout column){
        int count=0;
        for(int i=0;i<column.getChildCount();i++)if(column.getChildAt(i).getVisibility()==View.VISIBLE)count++;
        return count;
    }
    private static Button legacyItem(Button template,String label,Runnable action)throws Exception{
        Button button=(Button)template.getClass().getConstructor(android.content.Context.class,android.util.AttributeSet.class)
                .newInstance(template.getContext(),null);
        button.setTypeface(template.getTypeface());
        button.setTextColor(template.getTextColors());
        button.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,template.getTextSize());
        button.setGravity(template.getGravity());
        button.setPadding(template.getPaddingLeft(),template.getPaddingTop(),template.getPaddingRight(),template.getPaddingBottom());
        button.setMinHeight(template.getMinHeight());button.setMinimumHeight(template.getMinimumHeight());
        button.setAllCaps(false);button.setSingleLine(false);button.setMaxLines(2);
        button.setEllipsize(android.text.TextUtils.TruncateAt.END);
        button.setText(label);button.setOnClickListener(v->action.run());
        return button;
    }
    private ThreadTitleActions(){}
}
