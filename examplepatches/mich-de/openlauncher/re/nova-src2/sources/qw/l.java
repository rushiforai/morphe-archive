package qw;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {
    public static Object b(BitmapFactory.Options options, URL url, ContinuationImpl continuationImpl) {
        Object objA;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuationImpl));
        mVar.t();
        try {
            int i5 = Result.f71687b;
            URLConnection uRLConnectionOpenConnection = url.openConnection();
            Intrinsics.f(uRLConnectionOpenConnection, "openConnection(...)");
            uRLConnectionOpenConnection.setConnectTimeout(10000);
            uRLConnectionOpenConnection.setReadTimeout(10000);
            InputStream inputStream = uRLConnectionOpenConnection.getInputStream();
            Intrinsics.f(inputStream, "getInputStream(...)");
            mVar.v(new cs.h(options, inputStream));
            objA = null;
            try {
                Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(inputStream, null, options);
                inputStream.close();
                if (bitmapDecodeStream != null) {
                    String outMimeType = options.outMimeType;
                    Intrinsics.f(outMimeType, "outMimeType");
                    objA = new j(outMimeType, bitmapDecodeStream);
                }
            } finally {
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA == null) {
            mVar.resumeWith((j) objA);
        } else {
            mVar.resumeWith(ResultKt.a(thA));
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x008a, code lost:
    
        if (r11 == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(URL url, int i5, int i11, ContinuationImpl continuationImpl) {
        k kVar;
        l lVar;
        URL url2;
        BitmapFactory.Options options;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i12 = kVar.A;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                kVar.A = i12 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object objB = kVar.f84357y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = kVar.A;
        int i14 = 1;
        if (i13 == 0) {
            ResultKt.b(objB);
            BitmapFactory.Options options2 = new BitmapFactory.Options();
            options2.inJustDecodeBounds = true;
            kVar.f84352t = this;
            kVar.f84353u = url;
            kVar.f84354v = options2;
            kVar.f84355w = i5;
            kVar.f84356x = i11;
            kVar.A = 1;
            if (b(options2, url, kVar) != coroutineSingletons) {
                lVar = this;
                url2 = url;
                options = options2;
            }
            return coroutineSingletons;
        }
        if (i13 != 1) {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return (j) objB;
        }
        i11 = kVar.f84356x;
        i5 = kVar.f84355w;
        options = kVar.f84354v;
        url2 = kVar.f84353u;
        lVar = kVar.f84352t;
        ResultKt.b(objB);
        lVar.getClass();
        int i15 = options.outHeight;
        int i16 = options.outWidth;
        if (i15 > i11 || i16 > i5) {
            int i17 = i15 / 2;
            int i18 = i16 / 2;
            while (i17 / i14 >= i11 && i18 / i14 >= i5) {
                i14 *= 2;
            }
        }
        options.inSampleSize = i14;
        options.inJustDecodeBounds = false;
        kVar.f84352t = null;
        kVar.f84353u = null;
        kVar.f84354v = null;
        kVar.A = 2;
        objB = b(options, url2, kVar);
    }
}
