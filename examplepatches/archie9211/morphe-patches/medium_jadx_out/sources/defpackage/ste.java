package defpackage;

import android.view.ContentInfo;
import android.view.View;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ste {
    public static String[] a(View view) {
        return view.getReceiveContentMimeTypes();
    }

    public static p82 b(View view, p82 p82Var) {
        ContentInfo contentInfoE = p82Var.a.e();
        Objects.requireNonNull(contentInfoE);
        ContentInfo contentInfoPerformReceiveContent = view.performReceiveContent(contentInfoE);
        if (contentInfoPerformReceiveContent == null) {
            return null;
        }
        return contentInfoPerformReceiveContent == contentInfoE ? p82Var : new p82(new l82(contentInfoPerformReceiveContent));
    }
}
