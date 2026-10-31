package o2;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f79226a;

    /* renamed from: b, reason: collision with root package name */
    public final float f79227b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79228c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79229d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79230e;

    /* renamed from: f, reason: collision with root package name */
    public final float f79231f;

    /* renamed from: g, reason: collision with root package name */
    public final float f79232g;

    /* renamed from: h, reason: collision with root package name */
    public final float f79233h;

    /* renamed from: i, reason: collision with root package name */
    public final List f79234i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f79235j;

    public d(String str, float f11, float f12, float f13, float f14, float f15, float f16, float f17, List list, int i5) {
        str = (i5 & 1) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
        f11 = (i5 & 2) != 0 ? 0.0f : f11;
        f12 = (i5 & 4) != 0 ? 0.0f : f12;
        f13 = (i5 & 8) != 0 ? 0.0f : f13;
        f14 = (i5 & 16) != 0 ? 1.0f : f14;
        f15 = (i5 & 32) != 0 ? 1.0f : f15;
        f16 = (i5 & 64) != 0 ? 0.0f : f16;
        f17 = (i5 & 128) != 0 ? 0.0f : f17;
        list = (i5 & 256) != 0 ? k0.f79316a : list;
        ArrayList arrayList = new ArrayList();
        this.f79226a = str;
        this.f79227b = f11;
        this.f79228c = f12;
        this.f79229d = f13;
        this.f79230e = f14;
        this.f79231f = f15;
        this.f79232g = f16;
        this.f79233h = f17;
        this.f79234i = list;
        this.f79235j = arrayList;
    }
}
