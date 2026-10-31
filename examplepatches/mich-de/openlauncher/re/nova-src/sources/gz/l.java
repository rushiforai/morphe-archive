package gz;

import android.content.res.Resources;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final n[] f58658a = new n[31];

    public final boolean a(Resources resources, String str) {
        for (n nVar : this.f58658a) {
            Intrinsics.d(nVar);
            if (nVar.a(resources, str) == 0) {
                return false;
            }
        }
        return true;
    }
}
