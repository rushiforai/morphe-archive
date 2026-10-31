package r8;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import java.io.File;
import java.nio.ByteBuffer;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85613a;

    public /* synthetic */ a(int i5) {
        this.f85613a = i5;
    }

    @Override // r8.g
    public final h a(Object obj, x8.n nVar) {
        switch (this.f85613a) {
            case 0:
                Uri uri = (Uri) obj;
                if (c9.g.d(uri)) {
                    return new b(uri, nVar, 0);
                }
                return null;
            case 1:
                return new c((Bitmap) obj, nVar, 0);
            case 2:
                return new d(0, (ByteBuffer) obj, nVar);
            case 3:
                Uri uri2 = (Uri) obj;
                if (Intrinsics.b(uri2.getScheme(), "content")) {
                    return new b(uri2, nVar, 1);
                }
                return null;
            case 4:
                return new d(1, (Drawable) obj, nVar);
            case 5:
                return new i((File) obj, 0);
            case 6:
                Uri uri3 = (Uri) obj;
                if (Intrinsics.b(uri3.getScheme(), "android.resource")) {
                    return new b(uri3, nVar, 2);
                }
                return null;
            case 7:
                Uri uri4 = (Uri) obj;
                if (Intrinsics.b(uri4.getScheme(), "color")) {
                    return new i(uri4, 1);
                }
                return null;
            case 8:
                Uri uri5 = (Uri) obj;
                if (!Intrinsics.b(uri5.getScheme(), "letterTileDrawable")) {
                    return null;
                }
                return new d(2, nVar.f95352a.getResources(), uri5);
            default:
                Uri uri6 = (Uri) obj;
                if (Intrinsics.b(uri6.getScheme(), "android.resource")) {
                    return new c(uri6, nVar, 1);
                }
                return null;
        }
    }
}
