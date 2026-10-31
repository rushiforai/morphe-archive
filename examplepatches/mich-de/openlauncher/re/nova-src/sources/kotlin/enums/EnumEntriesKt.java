package kotlin.enums;

import i70.a;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class EnumEntriesKt {
    public static final a a(Enum[] entries) {
        Intrinsics.g(entries, "entries");
        return new a(entries);
    }
}
