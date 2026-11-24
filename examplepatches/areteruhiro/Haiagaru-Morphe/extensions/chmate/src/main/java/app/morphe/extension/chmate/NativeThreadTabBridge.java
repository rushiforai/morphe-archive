package app.morphe.extension.chmate;

import android.app.Activity;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;

/** Read/select the thread pane using the same APIs as native tab navigation. */
final class NativeThreadTabBridge {
    static final class Tab {
        final String key,title;
        final int index;
        final Object page;
        final Object fragment;
        Tab(String key,String title,int index,Object page,Object fragment){this.key=key;this.title=title;this.index=index;this.page=page;this.fragment=fragment;}
    }
    final Object owner;
    final String select;
    final boolean relative;
    final int current;
    android.view.View body;
    final List<Tab> tabs=new ArrayList<>();
    final List<android.view.View> paneViews=new ArrayList<>();
    private NativeThreadTabBridge(Object owner,String select,boolean relative,int current){
        this.owner=owner;this.select=select;this.relative=relative;this.current=current;
    }
    static NativeThreadTabBridge read(Activity activity)throws Exception{
        String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
        boolean old=version.equals("0.8.10.191 dev"),middle=version.equals("0.8.10.226 dev");
        if(!old&&!middle&&!version.equals("0.8.10.242 dev"))throw new IllegalArgumentException("Unsupported version");
        Object owner;Object pane;Object state;List<?> pages;int selected;
        if(old){
            owner=field(activity,"I");pane=owner;
            pages=(List<?>)field(field(owner,"d"),"a");
            selected=((Number)field(field(owner,"e"),"a")).intValue();
        }else{
            pane=Array.get(field(activity,middle?"r":"w"),1);
            owner=field(pane,middle?"a":"e");
            Object flow=field(owner,middle?"d":"e");
            state=call(flow,middle?"c":"d");
            pages=(List<?>)field(state,middle?"b":"a");
            selected=((Number)field(state,middle?"a":"b")).intValue();
        }
        NativeThreadTabBridge result=new NativeThreadTabBridge(owner,old?"d":middle?"c":"e",old,selected);
        for(Field f:fields(pane.getClass()))if(android.view.View.class.isAssignableFrom(f.getType())){
            f.setAccessible(true);Object view=f.get(pane);if(view!=null){result.paneViews.add((android.view.View)view);if((old&&f.getName().equals("e"))||view.getClass().getName().equals("jp.syoboi.a2chMate.view.EfficientTabContainer"))result.body=(android.view.View)view;}
        }
        // 226 uses an obfuscated content container, rather than EfficientTabContainer.
        // Resolve it by excluding the tab strip's adapter contract.
        if(result.body==null)for(android.view.View view:result.paneViews){
            try{view.getClass().getMethod("setAdapter",android.widget.ListAdapter.class);}
            catch(NoSuchMethodException content){result.body=view;break;}
        }
        for(int i=0;i<pages.size();i++){
            Object page=pages.get(i);
            if(((Number)field(page,old?"i":middle?"o":"f")).intValue()!=2)continue;
            Bundle args=(Bundle)field(page,old?"d":middle?"f":"i");
            if(args==null)continue;
            String key=args.getString("_data");
            if(key==null||key.isEmpty())continue;
            String title=args.getString(android.content.Intent.EXTRA_TITLE);
            result.tabs.add(new Tab(key,title==null||title.isEmpty()?key:title,i,page,pageFragment(page)));
        }
        return result;
    }
    String keyForFragment(Object target){
        if(target==null)return null;
        for(Tab tab:tabs){
            if(tab.fragment==target)return tab.key;
            for(Object parent=parentFragment(target);parent!=null;parent=parentFragment(parent))if(tab.fragment==parent)return tab.key;
        }
        // Some ChMate builds pass a wrapper fragment to the tab menu. Its arguments
        // still carry the native tab's stable _data key.
        for(Object candidate=target;candidate!=null;candidate=parentFragment(candidate)){
            Bundle arguments=arguments(candidate);
            String key=arguments==null?null:arguments.getString("_data");
            if(key!=null)for(Tab tab:tabs)if(tab.key.equals(key))return key;
        }
        return null;
    }
    private static Object pageFragment(Object page){
        for(Class<?> type=page.getClass();type!=null&&type!=Object.class;type=type.getSuperclass())
            for(Field field:type.getDeclaredFields())if(!Modifier.isStatic(field.getModifiers())&&!field.getType().isPrimitive())try{
                field.setAccessible(true);Object value=field.get(page);
                if(value!=null&&arguments(value)!=null&&hasMethod(value,"getParentFragment"))return value;
            }catch(ReflectiveOperationException ignored){}
        return null;
    }
    private static boolean hasMethod(Object target,String name){try{target.getClass().getMethod(name);return true;}catch(NoSuchMethodException ignored){return false;}}
    private static Object parentFragment(Object target){try{return target.getClass().getMethod("getParentFragment").invoke(target);}catch(Exception ignored){return null;}}
    private static Bundle arguments(Object target){try{Object value=target.getClass().getMethod("getArguments").invoke(target);return value instanceof Bundle?(Bundle)value:null;}catch(Exception ignored){return null;}}
    void select(Tab tab)throws Exception{
        // Re-read immediately before using this bridge; indices are snapshot-local.
        Method method=owner.getClass().getMethod(select,int.class);method.setAccessible(true);
        method.invoke(owner,relative?tab.index-current:tab.index);
    }
    private static Object field(Object owner,String name)throws Exception{
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{
            Field found=type.getDeclaredField(name);found.setAccessible(true);return found.get(owner);
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(name);
    }
    private static List<Field> fields(Class<?> type){
        List<Field> values=new ArrayList<>();
        for(;type!=null&&type!=Object.class;type=type.getSuperclass())Collections.addAll(values,type.getDeclaredFields());
        return values;
    }
    private static Object call(Object owner,String name)throws Exception{
        Method method=owner.getClass().getMethod(name);method.setAccessible(true);return method.invoke(owner);
    }
}
