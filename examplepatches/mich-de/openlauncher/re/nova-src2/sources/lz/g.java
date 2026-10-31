package lz;

import java.util.List;
import o9.g3;

/* loaded from: classes.dex */
public final /* synthetic */ class g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f75173a;

    public final void a(List list) {
        i iVar = this.f75173a;
        iVar.f75180c = list;
        boolean z11 = !list.isEmpty();
        if (z11 != iVar.f75185h) {
            iVar.f75185h = z11;
            g3.j(iVar.f75178a).edit().putBoolean("last_prediction_enabled_state", true).apply();
        }
        iVar.d(true);
    }
}
