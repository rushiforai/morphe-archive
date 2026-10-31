package androidx.fragment.app.strictmode;

import androidx.fragment.app.h0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b&\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/fragment/app/strictmode/Violation;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "fragment_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class Violation extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f14687a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Violation(h0 fragment, String str) {
        super(str);
        Intrinsics.g(fragment, "fragment");
        this.f14687a = fragment;
    }
}
