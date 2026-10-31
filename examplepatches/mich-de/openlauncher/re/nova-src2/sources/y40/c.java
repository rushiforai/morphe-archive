package y40;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f96656a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f96657b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f96658c;

    public c(String str, boolean z11, Function2 function2) {
        this.f96656a = str;
        this.f96657b = z11;
        this.f96658c = function2;
    }

    public final /* synthetic */ Object a(s10.u uVar) {
        Function2 function2 = this.f96658c;
        Intrinsics.d(function2);
        return function2.invoke(this, uVar);
    }
}
