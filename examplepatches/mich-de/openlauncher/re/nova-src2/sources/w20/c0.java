package w20;

import android.os.Handler;
import android.os.Looper;
import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function0;
import p1.m0;
import p1.z2;

/* loaded from: classes.dex */
public final /* synthetic */ class c0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93667a;

    public /* synthetic */ c0(int i5) {
        this.f93667a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f93667a) {
            case 0:
                return new Handler(Looper.getMainLooper());
            case 1:
                return new y1.d(new LinkedHashMap());
            case 2:
                z2 z2Var = y1.g.f96570a;
                return null;
            default:
                m0 m0Var = z10.d.f98007a;
                return 0;
        }
    }
}
