package io.branch.search.internal;

import android.database.Cursor;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.a, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final /* synthetic */ class C3053a {
    public static String a(String str, String str2, Cursor cursor, String str3, String str4) {
        Intrinsics.g(str, str2);
        String string = cursor.getString(R4.a(cursor, str3));
        Intrinsics.f(string, str4);
        return string;
    }
}
