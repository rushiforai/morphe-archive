package tx;

import com.amplitude.android.TrackingOptions;
import java.util.Locale;
import java.util.UUID;

/* loaded from: classes4.dex */
public final class d4 implements x80.y {
    @Override // x80.y
    public final x80.m0 intercept(x80.x xVar) {
        c90.f fVar = (c90.f) xVar;
        x80.g0 g0VarB = fVar.f19892e.b();
        g0VarB.e("User-Agent", "Nova/89400 (8.9.4)");
        g0VarB.e("X-App-Package", "com.teslacoilsw.launcher");
        g0VarB.e("X-App-Version", "89400");
        g0VarB.e("X-Brand", "NOVA");
        g0VarB.e("locale", Locale.getDefault().toString());
        g0VarB.e(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
        g0VarB.e("version", "89400");
        g0VarB.e("package", "com.teslacoilsw.launcher");
        g0VarB.e("X-Correlation-ID", UUID.randomUUID().toString());
        return fVar.b(g0VarB.b());
    }
}
