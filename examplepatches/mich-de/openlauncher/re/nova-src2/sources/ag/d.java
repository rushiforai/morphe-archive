package ag;

import com.google.android.flexbox.FlexboxLayoutManager;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public int f12784a;

    /* renamed from: b, reason: collision with root package name */
    public int f12785b;

    /* renamed from: c, reason: collision with root package name */
    public int f12786c;

    /* renamed from: d, reason: collision with root package name */
    public int f12787d = 0;

    /* renamed from: e, reason: collision with root package name */
    public boolean f12788e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f12789f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f12790g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ FlexboxLayoutManager f12791h;

    public d(FlexboxLayoutManager flexboxLayoutManager) {
        this.f12791h = flexboxLayoutManager;
    }

    public static void a(d dVar) {
        FlexboxLayoutManager flexboxLayoutManager = dVar.f12791h;
        if (flexboxLayoutManager.k() || !flexboxLayoutManager.f31632e) {
            dVar.f12786c = dVar.f12788e ? flexboxLayoutManager.f31640m.g() : flexboxLayoutManager.f31640m.k();
        } else {
            dVar.f12786c = dVar.f12788e ? flexboxLayoutManager.f31640m.g() : flexboxLayoutManager.getWidth() - flexboxLayoutManager.f31640m.k();
        }
    }

    public static void b(d dVar) {
        dVar.f12784a = -1;
        dVar.f12785b = -1;
        dVar.f12786c = Integer.MIN_VALUE;
        dVar.f12789f = false;
        dVar.f12790g = false;
        FlexboxLayoutManager flexboxLayoutManager = dVar.f12791h;
        if (flexboxLayoutManager.k()) {
            int i5 = flexboxLayoutManager.f31629b;
            if (i5 == 0) {
                dVar.f12788e = flexboxLayoutManager.f31628a == 1;
                return;
            } else {
                dVar.f12788e = i5 == 2;
                return;
            }
        }
        int i11 = flexboxLayoutManager.f31629b;
        if (i11 == 0) {
            dVar.f12788e = flexboxLayoutManager.f31628a == 3;
        } else {
            dVar.f12788e = i11 == 2;
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AnchorInfo{mPosition=");
        sb2.append(this.f12784a);
        sb2.append(", mFlexLinePosition=");
        sb2.append(this.f12785b);
        sb2.append(", mCoordinate=");
        sb2.append(this.f12786c);
        sb2.append(", mPerpendicularCoordinate=");
        sb2.append(this.f12787d);
        sb2.append(", mLayoutFromEnd=");
        sb2.append(this.f12788e);
        sb2.append(", mValid=");
        sb2.append(this.f12789f);
        sb2.append(", mAssignedFromSavedState=");
        return a2.c.p(sb2, this.f12790g, AbstractJsonLexerKt.END_OBJ);
    }
}
