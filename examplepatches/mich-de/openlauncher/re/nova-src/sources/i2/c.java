package i2;

import android.graphics.Canvas;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final Canvas f61100a = new Canvas();

    public static final Canvas a(androidx.compose.ui.graphics.Canvas canvas) {
        Intrinsics.e(canvas, "null cannot be cast to non-null type androidx.compose.ui.graphics.AndroidCanvas");
        return ((b) canvas).f61095a;
    }
}
