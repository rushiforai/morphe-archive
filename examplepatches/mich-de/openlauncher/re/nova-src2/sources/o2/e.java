package o2;

import com.amplitude.eventbridge.EventBridgeChannel;
import h6.c1;
import i2.x0;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f79238a;

    /* renamed from: b, reason: collision with root package name */
    public final float f79239b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79240c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79241d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79242e;

    /* renamed from: f, reason: collision with root package name */
    public final long f79243f;

    /* renamed from: g, reason: collision with root package name */
    public final int f79244g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f79245h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f79246i;

    /* renamed from: j, reason: collision with root package name */
    public final d f79247j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f79248k;

    public e(String str, float f11, float f12, float f13, float f14, long j11, int i5, boolean z11, int i11) {
        str = (i11 & 1) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
        long j12 = (i11 & 32) != 0 ? i2.s.f61147m : j11;
        int i12 = (i11 & 64) != 0 ? 5 : i5;
        boolean z12 = (i11 & 128) != 0 ? false : z11;
        this.f79238a = str;
        this.f79239b = f11;
        this.f79240c = f12;
        this.f79241d = f13;
        this.f79242e = f14;
        this.f79243f = j12;
        this.f79244g = i12;
        this.f79245h = z12;
        ArrayList arrayList = new ArrayList();
        this.f79246i = arrayList;
        d dVar = new d(null, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, null, 1023);
        this.f79247j = dVar;
        arrayList.add(dVar);
    }

    public static void b(e eVar, ArrayList arrayList, x0 x0Var, float f11, x0 x0Var2) {
        if (eVar.f79248k) {
            y2.a.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
        }
        ((d) c1.l(eVar.f79246i, 1)).f79235j.add(new n0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, arrayList, 0, x0Var, f11, x0Var2, 1.0f, 1.0f, 0, 2, 1.0f, 0.0f, 1.0f, 0.0f));
    }

    public final void a(String str, float f11, float f12, float f13, float f14, float f15, float f16, float f17, List list) {
        if (this.f79248k) {
            y2.a.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
        }
        this.f79246i.add(new d(str, f11, f12, f13, f14, f15, f16, f17, list, EventBridgeChannel.QUEUE_CAPACITY));
    }

    public final g c() {
        if (this.f79248k) {
            y2.a.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
        }
        while (this.f79246i.size() > 1) {
            d();
        }
        d dVar = this.f79247j;
        g gVar = new g(this.f79238a, this.f79239b, this.f79240c, this.f79241d, this.f79242e, new j0(dVar.f79226a, dVar.f79227b, dVar.f79228c, dVar.f79229d, dVar.f79230e, dVar.f79231f, dVar.f79232g, dVar.f79233h, dVar.f79234i, dVar.f79235j), this.f79243f, this.f79244g, this.f79245h);
        this.f79248k = true;
        return gVar;
    }

    public final void d() {
        if (this.f79248k) {
            y2.a.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
        }
        ArrayList arrayList = this.f79246i;
        d dVar = (d) arrayList.remove(arrayList.size() - 1);
        ((d) c1.l(arrayList, 1)).f79235j.add(new j0(dVar.f79226a, dVar.f79227b, dVar.f79228c, dVar.f79229d, dVar.f79230e, dVar.f79231f, dVar.f79232g, dVar.f79233h, dVar.f79234i, dVar.f79235j));
    }
}
