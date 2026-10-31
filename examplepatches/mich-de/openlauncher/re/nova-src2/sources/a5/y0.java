package a5;

import android.view.ContentInfo;
import android.view.View;
import java.util.Objects;

/* loaded from: classes2.dex */
public abstract class y0 {
    public static String[] a(View view) {
        return view.getReceiveContentMimeTypes();
    }

    public static h b(View view, h hVar) {
        ContentInfo contentInfoM = hVar.f290a.m();
        Objects.requireNonNull(contentInfoM);
        ContentInfo contentInfoPerformReceiveContent = view.performReceiveContent(contentInfoM);
        if (contentInfoPerformReceiveContent == null) {
            return null;
        }
        return contentInfoPerformReceiveContent == contentInfoM ? hVar : new h(new d(contentInfoPerformReceiveContent));
    }
}
