package r8;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.VectorDrawable;
import android.net.Uri;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import j7.o;
import java.io.File;
import java.nio.ByteBuffer;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final class d implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85620a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f85621b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f85622c;

    public /* synthetic */ d(int i5, Object obj, Object obj2) {
        this.f85620a = i5;
        this.f85622c = obj;
        this.f85621b = obj2;
    }

    @Override // r8.h
    public final Object a(Continuation continuation) {
        int i5 = this.f85620a;
        Object obj = this.f85622c;
        Object obj2 = this.f85621b;
        switch (i5) {
            case 0:
                ByteBuffer byteBuffer = (ByteBuffer) obj;
                try {
                    m90.g gVar = new m90.g();
                    gVar.write(byteBuffer);
                    byteBuffer.position(0);
                    Context context = ((x8.n) obj2).f95352a;
                    Bitmap.Config[] configArr = c9.g.f19862a;
                    File cacheDir = context.getCacheDir();
                    cacheDir.mkdirs();
                    return new n(new o8.m(gVar, cacheDir, null), null, 2);
                } catch (Throwable th2) {
                    byteBuffer.position(0);
                    throw th2;
                }
            case 1:
                x8.n nVar = (x8.n) obj2;
                Drawable bitmapDrawable = (Drawable) obj;
                Bitmap.Config[] configArr2 = c9.g.f19862a;
                boolean z11 = (bitmapDrawable instanceof VectorDrawable) || (bitmapDrawable instanceof o);
                if (z11) {
                    bitmapDrawable = new BitmapDrawable(nVar.f95352a.getResources(), android.support.v4.media.session.b.G(bitmapDrawable, nVar.f95353b, nVar.f95354c, nVar.f95355d, nVar.f95356e));
                }
                return new e(2, bitmapDrawable, z11);
            default:
                Uri uri = (Uri) obj2;
                String queryParameter = uri.getQueryParameter(PendingUpgradeStore.KEY_NAME);
                if (queryParameter == null) {
                    queryParameter = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                return new e(2, p6.j.b((Resources) obj, queryParameter, uri.getQueryParameter("lookupKey")), false);
        }
    }
}
