package com.fyber.inneractive.sdk.config.cellular;

import android.content.Context;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public final class g extends d {

    /* renamed from: d, reason: collision with root package name */
    public final f f27788d;

    public g(Context context) {
        super(context);
        this.f27788d = new f(this.f27784b, this);
    }

    @Override // com.fyber.inneractive.sdk.config.cellular.d
    public final void a(a aVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f27785c;
        if (copyOnWriteArrayList != null) {
            try {
                copyOnWriteArrayList.add(aVar);
            } catch (Throwable th2) {
                IAlog.a("failed to add networkUpdateListener", th2, new Object[0]);
            }
        }
        this.f27788d.b();
    }

    @Override // com.fyber.inneractive.sdk.config.cellular.d
    public final void a(h hVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f27785c;
        if (copyOnWriteArrayList != null) {
            try {
                copyOnWriteArrayList.remove(hVar);
            } catch (Throwable th2) {
                IAlog.a("failed to remove networkUpdateListener", th2, new Object[0]);
            }
        }
        this.f27788d.c();
    }

    @Override // com.fyber.inneractive.sdk.config.cellular.d
    public final void a() {
        this.f27788d.a();
        CopyOnWriteArrayList copyOnWriteArrayList = this.f27785c;
        if (copyOnWriteArrayList != null) {
            copyOnWriteArrayList.clear();
            this.f27785c = null;
        }
    }
}
