package org.ocpsoft.prettytime.i18n;

import b.c0;
import java.util.Map;
import java.util.function.Function;
import org.ocpsoft.prettytime.i18n.Resources_de;

/* loaded from: classes5.dex */
public final /* synthetic */ class a implements Function {
    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        Map map = Resources_de.DeTimeFormat.n;
        return c0.E((String) obj, "n");
    }
}
