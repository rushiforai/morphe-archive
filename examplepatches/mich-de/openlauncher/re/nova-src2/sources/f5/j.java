package f5;

import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public class j extends c3.b {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(String str, Bundle data) {
        super(str, data);
        Intrinsics.g(data, "data");
        if (str.length() <= 0) {
            throw new IllegalArgumentException("type should not be empty");
        }
    }
}
