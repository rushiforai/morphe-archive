package com.stripe.android.link;

import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f42962a;

    public a(ArrayList arrayList) {
        this.f42962a = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && this.f42962a.equals(((a) obj).f42962a);
    }

    public final int hashCode() {
        return this.f42962a.hashCode();
    }

    public final String toString() {
        return "ConsumerState(paymentDetails=" + this.f42962a + ")";
    }
}
