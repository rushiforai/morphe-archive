package com.google.android.gms.internal.measurement;

import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public abstract class kf {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f32740a = Pattern.compile("(\\w+).*");

    public static String a(xk.r2 r2Var) {
        if (r2Var.isEmpty()) {
            return null;
        }
        ex.a aVar = new ex.a("+", 9, false);
        xk.l0 l0VarListIterator = r2Var.listIterator(0);
        StringBuilder sb2 = new StringBuilder();
        aVar.a(sb2, l0VarListIterator);
        return "transform=".concat(String.valueOf(sb2.toString()));
    }
}
