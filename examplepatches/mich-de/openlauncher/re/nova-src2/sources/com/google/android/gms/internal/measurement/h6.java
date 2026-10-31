package com.google.android.gms.internal.measurement;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class h6 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32604a;

    /* renamed from: b, reason: collision with root package name */
    public int f32605b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i6 f32606c;

    public /* synthetic */ h6(i6 i6Var, int i5) {
        this.f32604a = i5;
        this.f32606c = i6Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f32604a) {
            case 0:
                if (this.f32605b < this.f32606c.f32640a.length()) {
                }
                break;
            default:
                if (this.f32605b < this.f32606c.f32640a.length()) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final /* synthetic */ Object next() {
        switch (this.f32604a) {
            case 0:
                String str = this.f32606c.f32640a;
                int i5 = this.f32605b;
                if (i5 >= str.length()) {
                    throw new NoSuchElementException();
                }
                this.f32605b = i5 + 1;
                return new i6(String.valueOf(i5));
            default:
                i6 i6Var = this.f32606c;
                String str2 = i6Var.f32640a;
                int i11 = this.f32605b;
                if (i11 >= str2.length()) {
                    throw new NoSuchElementException();
                }
                this.f32605b = i11 + 1;
                return new i6(String.valueOf(i6Var.f32640a.charAt(i11)));
        }
    }
}
