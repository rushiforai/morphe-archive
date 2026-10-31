package y90;

import java.io.Serializable;
import java.util.ArrayList;

/* loaded from: classes5.dex */
public final class i extends da0.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97047a;

    /* renamed from: b, reason: collision with root package name */
    public final ba0.a f97048b;

    /* renamed from: c, reason: collision with root package name */
    public final Serializable f97049c;

    public i() {
        this.f97047a = 1;
        this.f97048b = new ba0.m();
        this.f97049c = new ArrayList();
    }

    @Override // da0.a
    public void a(CharSequence charSequence) {
        switch (this.f97047a) {
            case 1:
                ((ArrayList) this.f97049c).add(charSequence);
                break;
        }
    }

    @Override // da0.a
    public void d() {
        int i5;
        switch (this.f97047a) {
            case 1:
                ArrayList arrayList = (ArrayList) this.f97049c;
                int size = arrayList.size() - 1;
                while (true) {
                    if (size >= 0) {
                        CharSequence charSequence = (CharSequence) arrayList.get(size);
                        int length = charSequence.length();
                        int i11 = 0;
                        while (true) {
                            if (i11 < length) {
                                char cCharAt = charSequence.charAt(i11);
                                if (cCharAt != ' ') {
                                    switch (cCharAt) {
                                    }
                                }
                                i11++;
                            } else {
                                i11 = -1;
                            }
                        }
                        if (i11 == -1) {
                            size--;
                        }
                    }
                }
                StringBuilder sb2 = new StringBuilder();
                for (i5 = 0; i5 < size + 1; i5++) {
                    sb2.append((CharSequence) arrayList.get(i5));
                    sb2.append('\n');
                }
                ((ba0.m) this.f97048b).f17774f = sb2.toString();
                break;
        }
    }

    @Override // da0.a
    public final ba0.a e() {
        switch (this.f97047a) {
            case 0:
                return (ba0.i) this.f97048b;
            default:
                return (ba0.m) this.f97048b;
        }
    }

    @Override // da0.a
    public void g(k kVar) {
        switch (this.f97047a) {
            case 0:
                kVar.f((String) this.f97049c, (ba0.i) this.f97048b);
                break;
        }
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        switch (this.f97047a) {
            case 0:
                return null;
            default:
                if (gVar.f97037g >= 4) {
                    return new cf.c(-1, gVar.f97033c + 4, false);
                }
                if (gVar.f97038h) {
                    return cf.c.a(gVar.f97035e);
                }
                return null;
        }
    }

    public i(int i5, String str) {
        this.f97047a = 0;
        ba0.i iVar = new ba0.i();
        this.f97048b = iVar;
        iVar.f17770f = i5;
        this.f97049c = str;
    }
}
