package m;

import android.view.ViewGroup;

/* loaded from: classes2.dex */
public class a extends ViewGroup.MarginLayoutParams {

    /* renamed from: a, reason: collision with root package name */
    public int f75187a;

    public a(int i5, int i11) {
        super(i5, i11);
        this.f75187a = 8388627;
    }

    public a(a aVar) {
        super((ViewGroup.MarginLayoutParams) aVar);
        this.f75187a = 0;
        this.f75187a = aVar.f75187a;
    }

    public a(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.f75187a = 0;
    }
}
