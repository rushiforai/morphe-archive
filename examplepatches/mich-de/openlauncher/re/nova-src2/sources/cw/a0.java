package cw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements r3.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48056a;

    @Override // r3.i0
    public final r3.f0 a(m3.g text) {
        switch (this.f48056a) {
            case 0:
                Intrinsics.g(text, "text");
                StringBuilder sb2 = new StringBuilder();
                String str = text.f75880b;
                int i5 = 0;
                int i11 = 0;
                while (i5 < str.length()) {
                    int i12 = i11 + 1;
                    sb2.append(str.charAt(i5));
                    if (i11 == 2) {
                        sb2.append(" - ");
                    }
                    i5++;
                    i11 = i12;
                }
                String string = sb2.toString();
                Intrinsics.f(string, "toString(...)");
                return new r3.f0(new m3.g(string), new w(1));
            case 1:
                Intrinsics.g(text, "text");
                StringBuilder sb3 = new StringBuilder();
                String str2 = text.f75880b;
                int i13 = 0;
                int i14 = 0;
                while (i13 < str2.length()) {
                    int i15 = i14 + 1;
                    sb3.append(str2.charAt(i13));
                    if (i14 % 4 == 3 && i14 < 33) {
                        sb3.append(" ");
                    }
                    i13++;
                    i14 = i15;
                }
                String string2 = sb3.toString();
                Intrinsics.f(string2, "toString(...)");
                return new r3.f0(new m3.g(string2), new w(5));
            default:
                Intrinsics.g(text, "text");
                return new r3.f0(new m3.g(b.c0.k("+", text.f75880b)), new kw.o0(2));
        }
    }
}
