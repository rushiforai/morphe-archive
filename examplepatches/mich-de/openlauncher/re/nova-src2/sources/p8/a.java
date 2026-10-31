package p8;

import ai.y0;
import java.io.IOException;
import java.util.ArrayList;
import m90.z;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f82420a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f82421b = new long[2];

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f82422c = new ArrayList(2);

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f82423d = new ArrayList(2);

    /* renamed from: e, reason: collision with root package name */
    public boolean f82424e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f82425f;

    /* renamed from: g, reason: collision with root package name */
    public y0 f82426g;

    /* renamed from: h, reason: collision with root package name */
    public int f82427h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ d f82428i;

    public a(d dVar, String str) {
        this.f82428i = dVar;
        this.f82420a = str;
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append('.');
        int length = sb2.length();
        for (int i5 = 0; i5 < 2; i5++) {
            sb2.append(i5);
            this.f82422c.add(this.f82428i.f82434a.g(sb2.toString()));
            sb2.append(".tmp");
            this.f82423d.add(this.f82428i.f82434a.g(sb2.toString()));
            sb2.setLength(length);
        }
    }

    public final b a() {
        if (!this.f82424e || this.f82426g != null || this.f82425f) {
            return null;
        }
        ArrayList arrayList = this.f82422c;
        int size = arrayList.size();
        int i5 = 0;
        while (true) {
            d dVar = this.f82428i;
            if (i5 >= size) {
                this.f82427h++;
                return new b(dVar, this);
            }
            if (!dVar.f82447p.g((z) arrayList.get(i5))) {
                try {
                    dVar.s(this);
                } catch (IOException unused) {
                }
                return null;
            }
            i5++;
        }
    }
}
