package zl;

import ai.b2;
import android.os.Bundle;
import com.amplitude.android.migration.DatabaseConstants;
import java.util.HashSet;
import m.w;
import xk.d1;

/* loaded from: classes3.dex */
public final class b implements zh.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w f98568a;

    public b(w wVar) {
        this.f98568a = wVar;
    }

    @Override // ai.d2
    public final void a(String str, String str2, Bundle bundle, long j11) {
        w wVar = this.f98568a;
        if (((HashSet) wVar.f75378b).contains(str2)) {
            Bundle bundle2 = new Bundle();
            d1 d1Var = a.f98562a;
            String strI = b2.i(str2, b2.f12859f, b2.f12854a);
            if (strI != null) {
                str2 = strI;
            }
            bundle2.putString(DatabaseConstants.EVENT_TABLE_NAME, str2);
            ((yl.b) wVar.f75379c).onMessageTriggered(2, bundle2);
        }
    }
}
