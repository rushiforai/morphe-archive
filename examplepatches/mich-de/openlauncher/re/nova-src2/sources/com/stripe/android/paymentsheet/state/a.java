package com.stripe.android.paymentsheet.state;

import com.stripe.android.lpmfoundations.paymentmethod.AnalyticsMetadata;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {
    public static final boolean a(Collection collection) {
        boolean zB;
        Iterator it = collection.iterator();
        do {
            zB = false;
            if (!it.hasNext()) {
                return false;
            }
            AnalyticsMetadata.Value value = (AnalyticsMetadata.Value) it.next();
            AnalyticsMetadata.Value.SimpleBoolean simpleBoolean = value instanceof AnalyticsMetadata.Value.SimpleBoolean ? (AnalyticsMetadata.Value.SimpleBoolean) value : null;
            if (simpleBoolean != null) {
                zB = Intrinsics.b(simpleBoolean.f43069a, Boolean.TRUE);
            }
        } while (!zB);
        return true;
    }

    public static final void b(MapBuilder mapBuilder, String str, List list) {
        List list2 = list;
        if (list2 == null || list2.isEmpty()) {
            return;
        }
        mapBuilder.put(str, new AnalyticsMetadata.Value.SimpleString(b70.g.f1(list, ",", null, null, 0, null, 62)));
    }
}
