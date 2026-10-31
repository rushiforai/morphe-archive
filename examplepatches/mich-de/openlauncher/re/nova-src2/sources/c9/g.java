package c9;

import android.graphics.Bitmap;
import android.net.Uri;
import android.view.View;
import android.webkit.MimeTypeMap;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import x80.u;

/* loaded from: classes.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final Bitmap.Config[] f19862a = {Bitmap.Config.ARGB_8888, Bitmap.Config.RGBA_F16};

    /* renamed from: b, reason: collision with root package name */
    public static final Bitmap.Config f19863b = Bitmap.Config.HARDWARE;

    /* renamed from: c, reason: collision with root package name */
    public static final u f19864c = new u((String[]) new ArrayList(20).toArray(new String[0]));

    public static final void a(Closeable closeable) throws IOException {
        try {
            closeable.close();
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception unused) {
        }
    }

    public static final String b(MimeTypeMap mimeTypeMap, String str) {
        if (str == null || r70.k.U0(str)) {
            return null;
        }
        String strS1 = r70.k.s1(r70.k.s1(str, '#'), '?');
        return mimeTypeMap.getMimeTypeFromExtension(r70.k.n1('.', r70.k.n1('/', strS1, strS1), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
    }

    public static final x8.u c(View view) {
        x8.u uVar;
        Object tag = view.getTag(2131427694);
        x8.u uVar2 = tag instanceof x8.u ? (x8.u) tag : null;
        if (uVar2 != null) {
            return uVar2;
        }
        synchronized (view) {
            try {
                Object tag2 = view.getTag(2131427694);
                uVar = tag2 instanceof x8.u ? (x8.u) tag2 : null;
                if (uVar == null) {
                    uVar = new x8.u(view);
                    view.addOnAttachStateChangeListener(uVar);
                    view.setTag(2131427694, uVar);
                }
            } finally {
            }
        }
        return uVar;
    }

    public static final boolean d(Uri uri) {
        return Intrinsics.b(uri.getScheme(), "file") && Intrinsics.b((String) b70.g.Y0(uri.getPathSegments()), "android_asset");
    }

    public static final int e(v4.a aVar, int i5) {
        if (aVar instanceof y8.a) {
            return ((y8.a) aVar).f96839d;
        }
        int iF = c0.F(i5);
        if (iF == 0) {
            return Integer.MIN_VALUE;
        }
        if (iF == 1) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        throw new NoWhenBranchMatchedException();
    }
}
