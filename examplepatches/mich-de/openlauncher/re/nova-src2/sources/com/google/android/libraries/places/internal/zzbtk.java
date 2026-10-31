package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbtk implements InvocationHandler {
    private final List zza;
    private boolean zzb;
    private String zzc;

    public zzbtk(List list) {
        this.zza = list;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) throws Throwable {
        String name = method.getName();
        Class<?> returnType = method.getReturnType();
        if (objArr == null) {
            objArr = zzbto.zza;
        }
        if (name.equals("supports") && Boolean.TYPE == returnType) {
            return Boolean.TRUE;
        }
        if (name.equals("unsupported") && Void.TYPE == returnType) {
            this.zzb = true;
            return null;
        }
        if (name.equals("protocols") && objArr.length == 0) {
            return this.zza;
        }
        if ((name.equals("selectProtocol") || name.equals("select")) && returnType == String.class && objArr.length == 1) {
            Object obj2 = objArr[0];
            if (obj2 instanceof List) {
                List list = (List) obj2;
                int size = list.size();
                for (int i5 = 0; i5 < size; i5++) {
                    if (this.zza.contains(list.get(i5))) {
                        String str = (String) list.get(i5);
                        this.zzc = str;
                        return str;
                    }
                }
                String str2 = (String) this.zza.get(0);
                this.zzc = str2;
                return str2;
            }
        }
        if ((!name.equals("protocolSelected") && !name.equals("selected")) || objArr.length != 1) {
            return method.invoke(this, objArr);
        }
        this.zzc = (String) objArr[0];
        return null;
    }
}
