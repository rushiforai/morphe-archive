package app.morphe.extension.chmate;

import android.content.Intent;
import android.view.View;
import java.lang.reflect.*;
import java.util.*;

/** Extend the existing ChMate toolbar model; native drawing, sizes and touch handling stay in charge. */
final class NativeHistoryTabs {
    static final int TARGET=0x7e000e12;
    final View bar;
    final Object model;
    final List<Object> stock;
    final int[] ids=new int[5];
    final Method setter,selection;
    final boolean modern;
    boolean targets;

    @SuppressWarnings("unchecked")
    NativeHistoryTabs(View bar,java.util.function.IntConsumer click)throws Exception{
        this.bar=bar;
        Method legacy=null;
        for(Method m:bar.getClass().getMethods())if(m.getName().equals("setButtons")&&m.getParameterTypes().length==1)legacy=m;
        modern=legacy==null;
        if(modern){
            Method stateSetter=null;for(Method m:bar.getClass().getMethods())if(m.getName().equals("setToolbarState"))stateSetter=m;
            if(stateSetter==null)throw new NoSuchMethodException("Native toolbar state");setter=stateSetter;
            Object found=null;
            for(Field f:bar.getClass().getDeclaredFields())if(f.getType()==setter.getParameterTypes()[0]){f.setAccessible(true);found=f.get(bar);break;}
            model=found;
        }else{
            setter=legacy;Object found=null;
            for(Field f:bar.getClass().getDeclaredFields())if(f.getType()==setter.getParameterTypes()[0]){f.setAccessible(true);found=f.get(bar);break;}
            model=found;
        }
        List<?> values=model instanceof List?(List<?>)model:listField(model);
        if(values==null||values.size()!=4)throw new IllegalStateException("Native history toolbar not ready");
        stock=new ArrayList<>((List<Object>)values);
        int[] nativeIds=new int[4];
        for(int i=0;i<4;i++)nativeIds[i]=resourceId(stock.get(i));
        ids[0]=nativeIds[0];ids[1]=TARGET;for(int i=1;i<4;i++)ids[i+1]=nativeIds[i];
        Method select=null;
        for(Method m:bar.getClass().getMethods()){
            Class<?>[] p=m.getParameterTypes();
            if(p.length==2&&p[1]==int.class&&(modern?p[0]==List.class:p[0]==int[].class)&&m.getReturnType()==void.class){select=m;break;}
        }
        if(select==null)throw new NoSuchMethodException("Native history selection");selection=select;
        bar.setOnClickListener(v->{for(int i=0;i<ids.length;i++)if(v.getId()==ids[i]){click.accept(i);return;}});
    }
    static List<?> listField(Object model)throws Exception{
        if(model==null)return null;
        for(Field f:model.getClass().getDeclaredFields())if(f.getType()==List.class){f.setAccessible(true);return (List<?>)f.get(model);}return null;
    }
    int resourceId(Object button)throws Exception{
        for(Field f:button.getClass().getDeclaredFields())if(f.getType()==int.class&&!Modifier.isStatic(f.getModifiers())){
            f.setAccessible(true);int id=f.getInt(button);
            try{if("id".equals(bar.getResources().getResourceTypeName(id)))return id;}catch(android.content.res.Resources.NotFoundException ignored){}
        }
        throw new IllegalStateException("Native history button ID");
    }
    @SuppressWarnings("unchecked")
    void configure(boolean enabled)throws Exception{
        List<Object> values=new ArrayList<>(stock);
        if(enabled){
            Class<?> type=stock.get(0).getClass();Object target;
            if(modern){
                Constructor<?> ctor=type.getDeclaredConstructor(int.class,int.class,int.class,int.class,boolean.class,Intent.class,boolean.class);ctor.setAccessible(true);
                target=ctor.newInstance(TARGET,0,android.R.string.untitled,0,true,null,true);
            }else target=type.getConstructor(int.class,int.class,int.class,int.class,boolean.class).newInstance(TARGET,0,android.R.string.untitled,0,true);
            values.add(1,target);
        }
        if(modern){
            boolean middle=model.getClass().getName().equals("o.PAGBannerAdWrapperListener");
            Field first=NativeFields.find(model.getClass(),middle?"c":"e"),second=NativeFields.find(model.getClass(),middle?"e":"c");
            Object next=model.getClass().getConstructor(first.getType(),second.getType(),List.class).newInstance(first.get(model),second.get(model),values);
            setter.invoke(bar,next);
        }else{
            List<Object> buttons=(List<Object>)model;buttons.clear();buttons.addAll(values);setter.invoke(bar,model);
        }
        targets=enabled;
        if(enabled)bar.getClass().getMethod("setButtonText",int.class,String.class).invoke(bar,TARGET,"更新対象");
    }
    void select(int tab)throws Exception{
        if(modern){List<Integer> keys=new ArrayList<>();for(int id:ids)if(id!=TARGET||targets)keys.add(id);selection.invoke(bar,keys,ids[tab]);}
        else selection.invoke(bar,ids,ids[tab]);
    }
}
