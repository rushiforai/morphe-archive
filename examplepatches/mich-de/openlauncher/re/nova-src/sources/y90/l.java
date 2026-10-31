package y90;

import java.util.ArrayList;

/* loaded from: classes5.dex */
public final class l {

    /* renamed from: d, reason: collision with root package name */
    public StringBuilder f97076d;

    /* renamed from: e, reason: collision with root package name */
    public String f97077e;

    /* renamed from: f, reason: collision with root package name */
    public String f97078f;

    /* renamed from: g, reason: collision with root package name */
    public char f97079g;

    /* renamed from: h, reason: collision with root package name */
    public StringBuilder f97080h;

    /* renamed from: a, reason: collision with root package name */
    public int f97073a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final StringBuilder f97074b = new StringBuilder();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f97075c = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public boolean f97081i = false;

    public final void a() {
        if (this.f97081i) {
            String strA = aa0.a.a(this.f97078f);
            StringBuilder sb2 = this.f97080h;
            String strA2 = sb2 != null ? aa0.a.a(sb2.toString()) : null;
            String str = this.f97077e;
            ba0.o oVar = new ba0.o();
            oVar.f17777f = str;
            oVar.f17778g = strA;
            oVar.f17779h = strA2;
            this.f97075c.add(oVar);
            this.f97076d = null;
            this.f97081i = false;
            this.f97077e = null;
            this.f97078f = null;
            this.f97080h = null;
        }
    }
}
