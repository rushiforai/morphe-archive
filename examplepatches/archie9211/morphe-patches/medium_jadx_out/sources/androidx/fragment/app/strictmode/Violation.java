package androidx.fragment.app.strictmode;

import defpackage.j15;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b&\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/fragment/app/strictmode/Violation;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "fragment_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public abstract class Violation extends RuntimeException {
    public final j15 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Violation(j15 j15Var, String str) {
        super(str);
        j15Var.getClass();
        this.a = j15Var;
    }
}
