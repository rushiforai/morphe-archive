package io.branch.search.internal;

import io.branch.search.internal.Rb;
import java.util.List;
import kotlin.Pair;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface Xb {

    public static final class a {
        public static /* synthetic */ void a(Xb xb2, long j11, Wb wb2, Integer num, int i5) {
            if ((i5 & 4) != 0) {
                num = null;
            }
            xb2.a(j11, wb2, num, null);
        }
    }

    @NotNull
    Rb.a a(@NotNull String str);

    @NotNull
    List<Rb> a(@NotNull Wb... wbArr);

    void a();

    void a(long j11);

    void a(long j11, long j12);

    void a(long j11, @NotNull Wb wb2, @Nullable Integer num, @Nullable Integer num2);

    void a(@NotNull List<Sb> list);

    @Nullable
    Pair<Rb, Long> c();

    @NotNull
    List<Sb> d();
}
