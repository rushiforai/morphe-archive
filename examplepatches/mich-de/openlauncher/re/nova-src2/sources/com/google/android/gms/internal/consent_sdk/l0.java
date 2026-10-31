package com.google.android.gms.internal.consent_sdk;

import androidx.compose.ui.node.LayoutNode;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class l0 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public String f32128a;

    /* renamed from: c, reason: collision with root package name */
    public final String f32130c;

    /* renamed from: b, reason: collision with root package name */
    public int f32129b = 2;

    /* renamed from: d, reason: collision with root package name */
    public int f32131d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f32132e = LayoutNode.NotPlacedPlaceOrder;

    public l0(String str) {
        this.f32130c = str;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i5;
        int i11 = this.f32129b;
        if (i11 == 4) {
            throw new IllegalStateException();
        }
        int i12 = i11 - 1;
        String string = null;
        if (i11 == 0) {
            throw null;
        }
        if (i12 == 0) {
            return true;
        }
        if (i12 != 2) {
            this.f32129b = 4;
            int i13 = this.f32131d;
            while (true) {
                int length = this.f32131d;
                if (length == -1) {
                    this.f32129b = 3;
                    break;
                }
                String str = this.f32130c;
                int length2 = str.length();
                io.sentry.config.a.d0(length, length2);
                while (true) {
                    if (length >= length2) {
                        length = -1;
                        break;
                    }
                    if (str.charAt(length) == ',') {
                        break;
                    }
                    length++;
                }
                if (length == -1) {
                    length = str.length();
                    this.f32131d = -1;
                    i5 = -1;
                } else {
                    i5 = length + 1;
                    this.f32131d = i5;
                }
                if (i5 == i13) {
                    int i14 = i5 + 1;
                    this.f32131d = i14;
                    if (i14 > str.length()) {
                        this.f32131d = -1;
                    }
                } else {
                    int i15 = this.f32132e;
                    if (i15 == 1) {
                        length = str.length();
                        this.f32131d = -1;
                    } else {
                        this.f32132e = i15 - 1;
                    }
                    string = str.subSequence(i13, length).toString();
                }
            }
            this.f32128a = string;
            if (this.f32129b != 3) {
                this.f32129b = 1;
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f32129b = 2;
        String str = this.f32128a;
        this.f32128a = null;
        return str;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
