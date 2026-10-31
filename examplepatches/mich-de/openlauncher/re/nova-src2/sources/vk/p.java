package vk;

import t5.d0;

/* loaded from: classes3.dex */
public final class p extends s {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ d0 f92823h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(d0 d0Var, cz.b bVar, CharSequence charSequence) {
        super(bVar, charSequence);
        this.f92823h = d0Var;
    }

    @Override // vk.s
    public final int a(int i5) {
        return i5 + 1;
    }

    @Override // vk.s
    public final int b(int i5) {
        c cVar = (c) this.f92823h.f88562b;
        CharSequence charSequence = this.f92828c;
        int length = charSequence.length();
        b0.h(i5, length);
        while (i5 < length) {
            if (cVar.a(charSequence.charAt(i5))) {
                return i5;
            }
            i5++;
        }
        return -1;
    }
}
