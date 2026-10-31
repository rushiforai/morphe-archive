package c3;

import android.view.View;
import android.view.translation.ViewTranslationCallback;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p0 implements ViewTranslationCallback {

    /* renamed from: a, reason: collision with root package name */
    public static final p0 f19397a = new p0();

    public final boolean onClearTranslation(View view) {
        Function0 function0;
        Intrinsics.e(view, "null cannot be cast to non-null type androidx.compose.ui.platform.AndroidComposeView");
        d2.d contentCaptureManager = ((AndroidComposeView) view).getContentCaptureManager();
        contentCaptureManager.getClass();
        contentCaptureManager.f48859f = d2.a.f48847a;
        z.m mVarE = contentCaptureManager.e();
        Object[] objArr = mVarE.f97796c;
        long[] jArr = mVarE.f97794a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        z.o0 o0Var = ((j3.r) objArr[(i5 << 3) + i12]).b().f68823d.f68812a;
                        Object objD = o0Var.d(j3.w.C);
                        if (objD == null) {
                            objD = null;
                        }
                        if (objD != null) {
                            Object objD2 = o0Var.d(j3.j.f68800m);
                            j3.a aVar = (j3.a) (objD2 != null ? objD2 : null);
                            if (aVar != null && (function0 = (Function0) aVar.f68765b) != null) {
                            }
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return true;
                }
            }
            if (i5 == length) {
                return true;
            }
            i5++;
        }
    }

    public final boolean onHideTranslation(View view) {
        Function1 function1;
        Intrinsics.e(view, "null cannot be cast to non-null type androidx.compose.ui.platform.AndroidComposeView");
        d2.d contentCaptureManager = ((AndroidComposeView) view).getContentCaptureManager();
        contentCaptureManager.getClass();
        contentCaptureManager.f48859f = d2.a.f48847a;
        z.m mVarE = contentCaptureManager.e();
        Object[] objArr = mVarE.f97796c;
        long[] jArr = mVarE.f97794a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        z.o0 o0Var = ((j3.r) objArr[(i5 << 3) + i12]).b().f68823d.f68812a;
                        Object objD = o0Var.d(j3.w.C);
                        if (objD == null) {
                            objD = null;
                        }
                        if (Intrinsics.b(objD, Boolean.TRUE)) {
                            Object objD2 = o0Var.d(j3.j.f68799l);
                            j3.a aVar = (j3.a) (objD2 != null ? objD2 : null);
                            if (aVar != null && (function1 = (Function1) aVar.f68765b) != null) {
                            }
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return true;
                }
            }
            if (i5 == length) {
                return true;
            }
            i5++;
        }
    }

    public final boolean onShowTranslation(View view) {
        Function1 function1;
        Intrinsics.e(view, "null cannot be cast to non-null type androidx.compose.ui.platform.AndroidComposeView");
        d2.d contentCaptureManager = ((AndroidComposeView) view).getContentCaptureManager();
        contentCaptureManager.getClass();
        contentCaptureManager.f48859f = d2.a.f48848b;
        z.m mVarE = contentCaptureManager.e();
        Object[] objArr = mVarE.f97796c;
        long[] jArr = mVarE.f97794a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128) {
                        z.o0 o0Var = ((j3.r) objArr[(i5 << 3) + i12]).b().f68823d.f68812a;
                        Object objD = o0Var.d(j3.w.C);
                        if (objD == null) {
                            objD = null;
                        }
                        if (Intrinsics.b(objD, Boolean.FALSE)) {
                            Object objD2 = o0Var.d(j3.j.f68799l);
                            j3.a aVar = (j3.a) (objD2 != null ? objD2 : null);
                            if (aVar != null && (function1 = (Function1) aVar.f68765b) != null) {
                            }
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return true;
                }
            }
            if (i5 == length) {
                return true;
            }
            i5++;
        }
    }
}
