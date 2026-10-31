package com.google.firebase.analytics.connector.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Bundle;
import androidx.annotation.Keep;
import bm.b;
import bm.c;
import bm.k;
import bm.l;
import com.google.android.gms.internal.measurement.i8;
import com.google.firebase.components.ComponentRegistrar;
import fi.s;
import java.util.Arrays;
import java.util.List;
import o7.a;
import sg.w;
import ul.g;
import yl.d;
import yl.e;

@Keep
/* loaded from: classes.dex */
public class AnalyticsConnectorRegistrar implements ComponentRegistrar {
    /* JADX INFO: Access modifiers changed from: private */
    public static d lambda$getComponents$0(c cVar) {
        g gVar = (g) cVar.a(g.class);
        Context context = (Context) cVar.a(Context.class);
        km.c cVar2 = (km.c) cVar.a(km.c.class);
        w.h(gVar);
        w.h(context);
        w.h(cVar2);
        w.h(context.getApplicationContext());
        if (e.f97387c == null) {
            synchronized (e.class) {
                try {
                    if (e.f97387c == null) {
                        Bundle bundle = new Bundle(1);
                        gVar.a();
                        if ("[DEFAULT]".equals(gVar.f91321b)) {
                            ((l) cVar2).a(s.f55157b, a.f79617c);
                            bundle.putBoolean("dataCollectionDefaultEnabled", gVar.h());
                        }
                        e.f97387c = new e(i8.q(context, bundle).r());
                    }
                } finally {
                }
            }
        }
        return e.f97387c;
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    @Keep
    @SuppressLint({"MissingPermission"})
    public List<b> getComponents() {
        bm.a aVarB = b.b(d.class);
        aVarB.a(k.b(g.class));
        aVarB.a(k.b(Context.class));
        aVarB.a(k.b(km.c.class));
        aVarB.f18062g = a.f79618d;
        aVarB.c(2);
        return Arrays.asList(aVarB.b(), vm.d.c("fire-analytics", "23.2.0"));
    }
}
