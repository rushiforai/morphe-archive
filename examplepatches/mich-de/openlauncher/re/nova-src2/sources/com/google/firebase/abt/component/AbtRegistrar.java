package com.google.firebase.abt.component;

import android.content.Context;
import androidx.annotation.Keep;
import bm.b;
import bm.c;
import bm.k;
import com.google.firebase.components.ComponentRegistrar;
import java.util.Arrays;
import java.util.List;
import ll.i;
import wl.a;
import yl.d;

@Keep
/* loaded from: classes.dex */
public class AbtRegistrar implements ComponentRegistrar {
    private static final String LIBRARY_NAME = "fire-abt";

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ a lambda$getComponents$0(c cVar) {
        return new a((Context) cVar.a(Context.class), cVar.f(d.class));
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public List<b> getComponents() {
        bm.a aVarB = b.b(a.class);
        aVarB.f18058c = LIBRARY_NAME;
        aVarB.a(k.b(Context.class));
        aVarB.a(new k(0, 1, d.class));
        aVarB.f18062g = new i(26);
        return Arrays.asList(aVarB.b(), vm.d.c(LIBRARY_NAME, "21.1.1"));
    }
}
