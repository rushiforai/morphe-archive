package p50;

import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f82094a;

    public final int a(int i5) {
        return ((int[]) this.f82094a.get(i5 / 768))[i5 % 768];
    }

    public final void b(int i5, int i11) {
        ((int[]) this.f82094a.get(i5 / 768))[i5 % 768] = i11;
    }
}
