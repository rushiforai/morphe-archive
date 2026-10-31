package com.fyber.inneractive.sdk.config.cellular;

import android.content.Context;
import android.net.ConnectivityManager;
import android.telephony.TelephonyManager;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.a1;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public abstract class d implements h {

    /* renamed from: a, reason: collision with root package name */
    public final TelephonyManager f27783a;

    /* renamed from: b, reason: collision with root package name */
    public final ConnectivityManager f27784b;

    /* renamed from: c, reason: collision with root package name */
    public CopyOnWriteArrayList f27785c = new CopyOnWriteArrayList();

    public d(Context context) {
        this.f27783a = (TelephonyManager) context.getSystemService("phone");
        this.f27784b = (ConnectivityManager) context.getSystemService("connectivity");
    }

    public abstract void a();

    public abstract void a(a aVar);

    public abstract void a(h hVar);

    @Override // com.fyber.inneractive.sdk.config.cellular.h
    public final void a(a1 a1Var) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f27785c;
        if (copyOnWriteArrayList == null) {
            IAlog.a("NetworkDetector: onNetworkUpdated: no update listeners", new Object[0]);
            return;
        }
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            h hVar = (h) it.next();
            if (hVar != null) {
                hVar.a(a1Var);
            }
        }
    }
}
