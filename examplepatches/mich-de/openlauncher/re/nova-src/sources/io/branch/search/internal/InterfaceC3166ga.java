package io.branch.search.internal;

import android.content.pm.LauncherActivityInfo;
import android.content.pm.ShortcutInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ga, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3166ga {
    @NotNull
    C3460y0 a(@NotNull ShortcutInfo shortcutInfo);

    @NotNull
    ArrayList a(@NotNull List list);

    @NotNull
    ArrayList b(@NotNull List list);

    /* renamed from: io.branch.search.internal.ga$a */
    public static final class a {
        @NotNull
        public static C3443x0 a(@NotNull LauncherActivityInfo info) {
            Intrinsics.g(info, "info");
            CharSequence label = info.getLabel();
            Intrinsics.f(label, "info.label");
            return new C3443x0(info, label);
        }

        @NotNull
        public static ArrayList a(@NotNull InterfaceC3166ga interfaceC3166ga, @NotNull List info) {
            Intrinsics.g(info, "info");
            ArrayList arrayList = new ArrayList(b70.c.u0(info, 10));
            Iterator it = info.iterator();
            while (it.hasNext()) {
                arrayList.add(interfaceC3166ga.a((ShortcutInfo) it.next()));
            }
            return arrayList;
        }
    }
}
