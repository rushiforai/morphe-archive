package com.vungle.ads.internal.network.converters;

import com.vungle.ads.internal.network.j;
import java.io.IOException;
import kotlin.Unit;
import kotlin.io.CloseableKt;

/* loaded from: classes4.dex */
public final class b implements a {
    @Override // com.vungle.ads.internal.network.converters.a
    public final Object a(j jVar) throws IOException {
        try {
            jVar.close();
            Unit unit = Unit.f71706a;
            jVar.close();
            return null;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(jVar, th2);
                throw th3;
            }
        }
    }
}
