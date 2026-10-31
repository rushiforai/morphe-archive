package l60;

import android.graphics.Paint;

/* loaded from: classes4.dex */
public class j {

    /* renamed from: a, reason: collision with root package name */
    public final int f74774a;

    /* renamed from: b, reason: collision with root package name */
    public final int f74775b;

    /* renamed from: c, reason: collision with root package name */
    public final int f74776c;

    /* renamed from: d, reason: collision with root package name */
    public final int f74777d;

    /* renamed from: e, reason: collision with root package name */
    public final int f74778e;

    /* renamed from: f, reason: collision with root package name */
    public final int f74779f;

    public j(i iVar) {
        this.f74774a = iVar.f74768a;
        this.f74775b = iVar.f74769b;
        this.f74776c = iVar.f74770c;
        this.f74777d = iVar.f74771d;
        this.f74778e = iVar.f74772e;
        this.f74779f = iVar.f74773f;
    }

    public int a(Paint paint) {
        int i5 = this.f74776c;
        return i5 == -1 ? (int) (paint.getStrokeWidth() + 0.5f) : i5;
    }

    public int b() {
        return this.f74774a;
    }
}
