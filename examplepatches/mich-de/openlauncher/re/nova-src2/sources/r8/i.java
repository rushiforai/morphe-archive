package r8;

import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.webkit.MimeTypeMap;
import java.io.File;
import kotlin.coroutines.Continuation;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.UStringsKt;
import m90.z;

/* loaded from: classes2.dex */
public final class i implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85626a;

    /* renamed from: b, reason: collision with root package name */
    public final Comparable f85627b;

    public /* synthetic */ i(Comparable comparable, int i5) {
        this.f85626a = i5;
        this.f85627b = comparable;
    }

    @Override // r8.h
    public final Object a(Continuation continuation) {
        int i5 = this.f85626a;
        Comparable comparable = this.f85627b;
        switch (i5) {
            case 0:
                String str = z.f76176b;
                File file = (File) comparable;
                return new n(new o8.j(br.a.v(file), m90.m.f76144a, null, null), MimeTypeMap.getSingleton().getMimeTypeFromExtension(FilesKt.p0(file)), 3);
            default:
                String path = ((Uri) comparable).getPath();
                Intrinsics.d(path);
                int iA = UStringsKt.a(r70.k.a1(path, "/"));
                GradientDrawable gradientDrawable = new GradientDrawable();
                gradientDrawable.setColor(iA);
                gradientDrawable.setShape(1);
                return new e(2, gradientDrawable, false);
        }
    }
}
