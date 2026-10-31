package hb;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public e f59592a;

    /* renamed from: b, reason: collision with root package name */
    public Bitmap f59593b;

    /* renamed from: c, reason: collision with root package name */
    public int f59594c;

    /* renamed from: d, reason: collision with root package name */
    public int f59595d = 1;

    public abstract e a();

    public final void b() {
        Integer numD;
        j9.c cVar = new j9.c();
        if (d(cVar) && (numD = cVar.d(j9.c.f69191l)) != null) {
            short sShortValue = numD.shortValue();
            this.f59594c = sShortValue != 3 ? sShortValue != 6 ? sShortValue != 8 ? 0 : 270 : 90 : 180;
        }
        e eVarA = a();
        this.f59592a = eVarA;
        if (eVarA == null) {
            this.f59595d = 3;
            return;
        }
        int width = eVarA.getWidth();
        int height = this.f59592a.getHeight();
        int iMin = Math.min(1024, 1024);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        int iHighestOneBit = 1;
        options.inPreferQualityOverSpeed = true;
        int iFloor = (int) Math.floor(1.0f / (iMin / Math.max(width, height)));
        if (iFloor > 1) {
            if (iFloor <= 8) {
                long[] jArr = i9.a.f61459a;
                if (iFloor <= 0) {
                    throw new IllegalArgumentException();
                }
                iHighestOneBit = Integer.highestOneBit(iFloor);
            } else {
                iHighestOneBit = (iFloor / 8) * 8;
            }
        }
        options.inSampleSize = iHighestOneBit;
        options.inJustDecodeBounds = false;
        this.f59593b = c(options);
        this.f59595d = 2;
    }

    public abstract Bitmap c(BitmapFactory.Options options);

    public abstract boolean d(j9.c cVar);
}
