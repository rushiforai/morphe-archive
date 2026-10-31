package com.google.android.libraries.places.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;

/* loaded from: classes3.dex */
final class zzbti extends zzbtl {
    private final Method zzb;
    private final Method zzc;

    public /* synthetic */ zzbti(Provider provider, Method method, Method method2, zzbth zzbthVar) {
        super(provider);
        this.zzb = method;
        this.zzc = method2;
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final String zza(SSLSocket sSLSocket) {
        try {
            return (String) this.zzc.invoke(sSLSocket, null);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException(e3);
        } catch (InvocationTargetException e11) {
            throw new RuntimeException(e11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final void zzb(SSLSocket sSLSocket, String str, List list) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        SSLParameters sSLParameters = sSLSocket.getSSLParameters();
        ArrayList arrayList = new ArrayList(list.size());
        Iterator it = list.iterator();
        while (it.hasNext()) {
            zzbtm zzbtmVar = (zzbtm) it.next();
            if (zzbtmVar != zzbtm.HTTP_1_0) {
                arrayList.add(zzbtmVar.toString());
            }
        }
        try {
            this.zzb.invoke(sSLParameters, arrayList.toArray(new String[arrayList.size()]));
            sSLSocket.setSSLParameters(sSLParameters);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException(e3);
        } catch (InvocationTargetException e11) {
            throw new RuntimeException(e11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final int zzc() {
        return 1;
    }
}
