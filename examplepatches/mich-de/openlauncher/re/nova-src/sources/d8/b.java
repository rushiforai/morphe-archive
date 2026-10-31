package d8;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class b extends Drawable.ConstantState {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f49008h = 0;

    /* renamed from: a, reason: collision with root package name */
    public int f49009a;

    /* renamed from: b, reason: collision with root package name */
    public final int f49010b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable.ConstantState f49011c;

    /* renamed from: d, reason: collision with root package name */
    public c f49012d;

    /* renamed from: e, reason: collision with root package name */
    public c f49013e;

    /* renamed from: f, reason: collision with root package name */
    public c f49014f;

    /* renamed from: g, reason: collision with root package name */
    public c f49015g;

    public b(b bVar, Resources resources) {
        this.f49010b = 160;
        if (bVar != null) {
            this.f49009a = bVar.f49009a;
            this.f49011c = bVar.f49011c;
        }
        int i5 = resources != null ? resources.getDisplayMetrics().densityDpi : bVar != null ? bVar.f49010b : 0;
        int i11 = i5 != 0 ? i5 : 160;
        this.f49010b = i11;
        if (bVar == null) {
            this.f49012d = new c();
            this.f49013e = new c();
            this.f49014f = new c();
            this.f49015g = new c();
            return;
        }
        c cVar = bVar.f49012d;
        c cVar2 = new c(cVar.f49016a, cVar.f49017b);
        this.f49012d = cVar2;
        c cVar3 = bVar.f49013e;
        this.f49013e = new c(cVar3.f49016a, cVar3.f49017b);
        c cVar4 = bVar.f49014f;
        this.f49014f = new c(cVar4.f49016a, cVar4.f49017b);
        c cVar5 = bVar.f49015g;
        this.f49015g = new c(cVar5.f49016a, cVar5.f49017b);
        int i12 = bVar.f49010b;
        if (i12 != i11) {
            cVar2.c(i12, i11);
            this.f49013e.c(i12, i11);
            this.f49014f.c(i12, i11);
            this.f49015g.c(i12, i11);
        }
    }

    public final boolean a() {
        return this.f49011c != null;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final boolean canApplyTheme() {
        Drawable.ConstantState constantState = this.f49011c;
        return (constantState != null && constantState.canApplyTheme()) || super.canApplyTheme();
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        int i5 = this.f49009a;
        Drawable.ConstantState constantState = this.f49011c;
        return i5 | (constantState != null ? constantState.getChangingConfigurations() : 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0016  */
    @Override // android.graphics.drawable.Drawable.ConstantState
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Drawable newDrawable(Resources resources) {
        b bVar;
        if (resources == null) {
            bVar = this;
        } else {
            int i5 = resources.getDisplayMetrics().densityDpi;
            if (i5 == 0) {
                i5 = 160;
            }
            if (i5 != this.f49010b) {
                bVar = new b(this, resources);
            }
        }
        return new d(bVar, resources);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return newDrawable(null);
    }
}
