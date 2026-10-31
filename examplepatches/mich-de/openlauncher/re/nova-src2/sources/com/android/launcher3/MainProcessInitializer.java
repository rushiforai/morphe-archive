package com.android.launcher3;

import android.content.Context;
import fz.r;
import java.util.ArrayList;
import java.util.Iterator;
import u9.a;
import u9.b;
import ya.h0;

/* loaded from: classes.dex */
public class MainProcessInitializer implements h0 {
    public void a(Context context) {
        ArrayList arrayList = b.f90688a;
        synchronized (arrayList) {
            try {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    a aVar = (a) it.next();
                    aVar.f90687d = aVar.f87443c;
                }
                b.f90688a.sort(new b3.h0(12));
            } catch (Throwable th2) {
                throw th2;
            }
        }
        r.f();
    }
}
