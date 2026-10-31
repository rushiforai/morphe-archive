package com.facebook.shimmer;

import ai.u1;
import android.content.res.TypedArray;

/* loaded from: classes2.dex */
public final class b extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f27532b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(int i5) {
        super(1);
        this.f27532b = i5;
        switch (i5) {
            case 1:
                super(1);
                break;
            default:
                ((c) this.f13368a).f27546p = true;
                break;
        }
    }

    @Override // ai.u1
    public u1 i(TypedArray typedArray) {
        switch (this.f27532b) {
            case 1:
                c cVar = (c) this.f13368a;
                super.i(typedArray);
                if (typedArray.hasValue(2)) {
                    cVar.f27537e = (typedArray.getColor(2, cVar.f27537e) & 16777215) | (cVar.f27537e & (-16777216));
                }
                if (typedArray.hasValue(12)) {
                    cVar.f27536d = typedArray.getColor(12, cVar.f27536d);
                }
                return this;
            default:
                return super.i(typedArray);
        }
    }

    @Override // ai.u1
    public final u1 r() {
        int i5 = this.f27532b;
        return this;
    }
}
