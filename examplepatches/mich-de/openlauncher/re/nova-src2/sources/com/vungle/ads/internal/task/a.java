package com.vungle.ads.internal.task;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {
    public static e a(String str, List staleAdDirs, int i5) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        if ((i5 & 2) != 0) {
            staleAdDirs = EmptyList.f71733a;
        }
        Intrinsics.g(staleAdDirs, "staleAdDirs");
        e eVarH = new e("CleanupJob").h();
        Bundle bundle = new Bundle();
        if (str != null) {
            bundle.putString("AD_ID_KEY", str);
        }
        if (str == null) {
            bundle.putStringArrayList("STALE_DIRS_KEY", new ArrayList<>(staleAdDirs));
        }
        return eVarH.a(bundle).a(str == null);
    }
}
