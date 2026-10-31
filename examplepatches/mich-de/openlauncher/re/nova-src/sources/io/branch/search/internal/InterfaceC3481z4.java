package io.branch.search.internal;

import android.net.Uri;
import java.util.Arrays;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.z4, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public interface InterfaceC3481z4 {

    /* renamed from: io.branch.search.internal.z4$a */
    /* loaded from: classes4.dex */
    public static final class a {
        @NotNull
        public static Uri a(@NotNull InterfaceC3481z4 interfaceC3481z4, @NotNull F4 delegate, @NotNull Pair<String, String>... params) {
            Intrinsics.g(delegate, "delegate");
            Intrinsics.g(params, "params");
            String path = interfaceC3481z4.getPath();
            Pair[] params2 = (Pair[]) Arrays.copyOf(params, params.length);
            Intrinsics.g(path, "path");
            Intrinsics.g(params2, "params");
            return F4.a(delegate.a(), path, (Pair[]) Arrays.copyOf(params2, params2.length));
        }
    }

    @NotNull
    String getPath();
}
