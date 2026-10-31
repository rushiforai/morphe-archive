package io.branch.search.internal;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.d2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3107d2 {
    ON_BUNDLE_UPDATED,
    ON_INIT_COMPLETED,
    ON_SHORTCUTS_UPDATED,
    ON_APP_USAGE_UPDATED,
    /* JADX INFO: Fake field, exist only in values array */
    ON_PACKAGE_INSTALLED,
    /* JADX INFO: Fake field, exist only in values array */
    ON_PACKAGE_UNINSTALLED,
    /* JADX INFO: Fake field, exist only in values array */
    ON_PACKAGE_CHANGED,
    /* JADX INFO: Fake field, exist only in values array */
    ON_LANGUAGE_CHANGED,
    /* JADX INFO: Fake field, exist only in values array */
    ON_CLIENT_API_CALL;


    @NotNull
    public static final a Companion = new a();

    /* renamed from: io.branch.search.internal.d2$a */
    public static final class a {
        @NotNull
        public static HashMap a() {
            return MapsKt.h0(new Pair("ON_BUNDLE_UPDATED", new HashMap()), new Pair("ON_INIT_COMPLETED", new HashMap()), new Pair("ON_APP_USAGE_UPDATED", new HashMap()), new Pair("ON_PACKAGE_CHANGED", new HashMap()), new Pair("ON_PACKAGE_INSTALLED", new HashMap()), new Pair("ON_PACKAGE_UNINSTALLED", new HashMap()), new Pair("ON_LANGUAGE_CHANGED", new HashMap()));
        }
    }

    public final void a() {
        C3124e2 c3124e2 = C3124e2.f64361a;
        c3124e2.getClass();
        List list = (List) c3124e2.get(this);
        if (list != null) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                ((InterfaceC3298o7) it.next()).a();
            }
        }
    }
}
