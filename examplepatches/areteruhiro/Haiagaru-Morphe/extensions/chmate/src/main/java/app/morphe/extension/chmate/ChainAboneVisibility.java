package app.morphe.extension.chmate;

import android.util.SparseIntArray;
import android.util.Log;
import java.lang.reflect.*;
import java.util.*;

/** Projects native chain-only reasons into the rebuilt transparent map, never into saved NGs. */
public final class ChainAboneVisibility {
    static final String KEY="hideChainedAbone";
    // The three native renderers use this mask to choose ordinary aboon over chain aboon.
    static final int DIRECT_REASONS=0x54a38;
    static boolean chainOnly(int flags){return (flags&0x1000)!=0&&(flags&DIRECT_REASONS)==0;}
    private ChainAboneVisibility(){}
    public static void apply(Object owner){
        if(owner==null||!Haiagaru.hideChainedAbone())return;
        try{
            String rowsName,mapName,cacheName,methodName,numberName;
            boolean modern=false;
            switch(owner.getClass().getName()){
                case "o.m9ExternalSyntheticLambda1":rowsName="K";mapName="N";cacheName="am";methodName="SE_";numberName="o";break;
                case "o.listener":rowsName="J";mapName="K";cacheName="z";methodName="d";numberName="l";break;
                case "o.zzaW":rowsName="a";mapName="j";cacheName="f";methodName="c";numberName="o";modern=true;break;
                default:return;
            }
            Object raw=ResponseArchiveEntry.field(owner,rowsName);
            if(!(raw instanceof List))return;
            try{Object base=ResponseArchiveEntry.field(raw,"mBase");if(base instanceof List)raw=base;}
            catch(NoSuchFieldException ignored){}
            List<?> rows=(List<?>)raw;if(rows.isEmpty())return;
            Class<?> type=rows.get(0).getClass();
            Object cache=ResponseArchiveEntry.field(owner,cacheName);
            Method nativeFlags=modern?owner.getClass().getDeclaredMethod(methodName,type,boolean.class):
                owner.getClass().getDeclaredMethod(methodName,type,boolean.class,cache.getClass());
            nativeFlags.setAccessible(true);
            Field number=type.getDeclaredField(numberName);number.setAccessible(true);
            List<Integer> hidden=new ArrayList<>();
            for(Object row:rows){
                if(!type.isInstance(row))continue;
                int n=number.getInt(row);if(n<=0)continue;
                int flags=((Number)(modern?nativeFlags.invoke(owner,row,true):nativeFlags.invoke(owner,row,true,cache))).intValue();
                if(chainOnly(flags))hidden.add(n);
            }
            // Native code owns and clears this map on every rebuild. Its normal
            // "show hidden NG" path still decides whether to filter these rows.
            Object target=ResponseArchiveEntry.field(owner,mapName);
            if(target instanceof SparseIntArray){SparseIntArray map=(SparseIntArray)target;
                for(int n:hidden)map.put(n,map.get(n,0)|0x1000);
            }else if(target instanceof Map){
                @SuppressWarnings("unchecked") Map<Integer,Integer> map=(Map<Integer,Integer>)target;
                for(int n:hidden)map.put(n,map.getOrDefault(n,0)|0x1000);
            }
        }catch(ReflectiveOperationException|RuntimeException error){
            Log.w("Haiagaru","Chain aboon visibility: "+error.getClass().getSimpleName());
        }
    }
}
