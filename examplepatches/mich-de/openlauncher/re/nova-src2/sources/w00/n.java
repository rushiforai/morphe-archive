package w00;

import android.text.format.DateFormat;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.vungle.ads.internal.protos.Sdk;
import gy.n0;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import kotlin.enums.EnumEntriesKt;
import l1.d1;
import l1.g1;
import l1.g9;
import p1.z2;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class n implements n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final LocalDate f93588a;

    /* renamed from: b, reason: collision with root package name */
    public static final n f93589b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ n[] f93590c;

    static {
        n nVar = new n(NativeAdContent.ViewTag.AD_ICON, 0);
        f93589b = nVar;
        n[] nVarArr = {nVar, new n("MMMMd", 1), new n("MMMd", 2), new n("Md", 3)};
        f93590c = nVarArr;
        EnumEntriesKt.a(nVarArr);
        f93588a = LocalDate.of(2022, 1, 31);
    }

    public static n valueOf(String str) {
        return (n) Enum.valueOf(n.class, str);
    }

    public static n[] values() {
        return (n[]) f93590c.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        boolean z11;
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1767162343);
        n nVar = f93589b;
        LocalDate localDate = f93588a;
        if (this == nVar) {
            tVar.b0(-255546452);
            z2 z2Var = g1.f73330a;
            bh.g.i(g90.k.H(localDate.getDayOfMonth(), ((d1) tVar.j(z2Var)).f73148a, ((d1) tVar.j(z2Var)).f73149b), x7.f.Y(tVar, 2132018013), null, null, tVar, 0, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
            tVar.p(false);
            z11 = false;
        } else {
            tVar.b0(-255216922);
            g9.b(DateTimeFormatter.ofPattern(DateFormat.getBestDateTimePattern(Locale.getDefault(), name())).format(localDate), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
            tVar = tVar;
            z11 = false;
            tVar.p(false);
        }
        tVar.p(z11);
    }
}
