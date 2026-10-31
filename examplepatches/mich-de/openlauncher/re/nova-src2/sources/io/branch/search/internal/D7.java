package io.branch.search.internal;

import java.io.BufferedOutputStream;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class D7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public static volatile D7 f62344a;

    public static final class a {
        @JvmStatic
        @NotNull
        public final D7 a(@NotNull F4 context, @NotNull C3366s8 networkInterfaceImpl) {
            D7 j92;
            Intrinsics.g(context, "context");
            Intrinsics.g(networkInterfaceImpl, "networkInterfaceImpl");
            D7 d72 = D7.f62344a;
            if (d72 != null) {
                return d72;
            }
            synchronized (this) {
                j92 = D7.f62344a;
                if (j92 == null) {
                    D7.Companion.getClass();
                    j92 = new J9(context.f62438a, networkInterfaceImpl);
                    D7.f62344a = j92;
                }
            }
            return j92;
        }
    }

    @Nullable
    public abstract F7 a(@NotNull String str);

    public abstract void a();

    public abstract void a(@NotNull C3074b3 c3074b3);

    public abstract void a(@NotNull C3074b3 c3074b3, @NotNull BufferedOutputStream bufferedOutputStream);
}
