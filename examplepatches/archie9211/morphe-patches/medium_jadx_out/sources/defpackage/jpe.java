package defpackage;

import android.text.TextUtils;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jpe {
    public static final Pattern a = Pattern.compile("\\AA[\\w-]{38}\\z");
    public static jpe b;

    public jpe(fa4 fa4Var) {
    }

    public final boolean a(zj0 zj0Var) {
        return TextUtils.isEmpty(zj0Var.c) || zj0Var.f + zj0Var.e < (System.currentTimeMillis() / 1000) + 3600;
    }
}
