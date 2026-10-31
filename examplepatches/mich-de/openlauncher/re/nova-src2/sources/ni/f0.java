package ni;

import ads_mobile_sdk.rw0;
import android.content.Context;
import b.i8;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final b0 f78270a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f78271b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f78272c;

    public f0(b0 b0Var, ArrayList arrayList, c0 c0Var) {
        d0 d0Var = d0.f78259a;
        e0 e0Var = e0.f78267a;
        this.f78270a = b0Var;
        this.f78271b = arrayList;
        this.f78272c = c0Var;
    }

    public final boolean a(Context context) throws NoSuchAlgorithmException {
        Intrinsics.g(context, "context");
        i8 i8Var = rw0.f9327f;
        return b70.g.O0(this.f78271b, i8.o(context));
    }
}
