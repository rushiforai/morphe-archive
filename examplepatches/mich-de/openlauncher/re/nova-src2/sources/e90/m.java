package e90;

import java.io.IOException;
import java.util.List;

/* loaded from: classes5.dex */
public final class m extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f52332e = 1;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ q f52333f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f52334g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ List f52335h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(String str, q qVar, int i5, List list) {
        super(str, true);
        this.f52333f = qVar;
        this.f52334g = i5;
        this.f52335h = list;
    }

    @Override // a90.a
    public final long a() {
        switch (this.f52332e) {
            case 0:
                this.f52333f.f52356k.getClass();
                try {
                    this.f52333f.f52366w.h(this.f52334g, 9);
                    synchronized (this.f52333f) {
                        this.f52333f.f52368y.remove(Integer.valueOf(this.f52334g));
                    }
                    return -1L;
                } catch (IOException unused) {
                    return -1L;
                }
            default:
                this.f52333f.f52356k.getClass();
                try {
                    this.f52333f.f52366w.h(this.f52334g, 9);
                    synchronized (this.f52333f) {
                        this.f52333f.f52368y.remove(Integer.valueOf(this.f52334g));
                    }
                    return -1L;
                } catch (IOException unused2) {
                    return -1L;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(String str, q qVar, int i5, List list, boolean z11) {
        super(str, true);
        this.f52333f = qVar;
        this.f52334g = i5;
        this.f52335h = list;
    }
}
