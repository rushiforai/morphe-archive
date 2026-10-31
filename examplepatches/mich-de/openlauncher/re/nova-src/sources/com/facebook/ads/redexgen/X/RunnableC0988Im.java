package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Im, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0988Im implements Runnable {
    public static String[] A02 = {"Gvz2hK", "1rIojERfVK3rt53vZqI6", "BSpmlkgSaKXi9tmDb5zA", "YLnhrolGJ7vL3tA5kypQ", "ZY45dIc9ttY4FGIEwOGgEqv3zJcz7KeS", "IxbXWG", "ISinlABUmmYsKY6wSWlYJYcMbtfoCqOH", "69JPO7cGcBaWHahQ25jfpFzKqOsmdCxZ"};
    public final /* synthetic */ Bundle A00;
    public final /* synthetic */ BinderC0989In A01;

    public RunnableC0988Im(BinderC0989In binderC0989In, Bundle bundle) {
        this.A01 = binderC0989In;
        this.A00 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.A01.A04(this.A00);
        } catch (Throwable th2) {
            String[] strArr = A02;
            if (strArr[0].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[7] = "ugGsrJziNPgAdY8YeUEdN5HBiaOGbg7z";
            strArr2[6] = "5JjX5z15lljrW4oydWnreK41PNq9lUZE";
            AbstractC2311oi.A00(th2, this);
        }
    }
}
