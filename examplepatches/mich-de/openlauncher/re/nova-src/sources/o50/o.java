package o50;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o extends s50.m implements m {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(Map values) {
        super(values);
        Intrinsics.g(values, "values");
    }

    public final String toString() {
        return "Headers " + a();
    }
}
