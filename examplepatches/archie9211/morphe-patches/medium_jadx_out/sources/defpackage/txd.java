package defpackage;

import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.text.PositionedGlyphs;
import android.graphics.text.TextRunShaper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class txd {
    public static final il7 a;
    public static final bd7 b;
    public static Paint c;

    /* JADX WARN: Removed duplicated region for block: B:21:0x0054  */
    static {
        /*
            java.lang.String r0 = "TypefaceCompat static init"
            java.lang.String r0 = defpackage.gq7.X(r0)
            android.os.Trace.beginSection(r0)
            int r0 = android.os.Build.VERSION.SDK_INT
            r1 = 31
            if (r0 < r1) goto L17
            ayd r0 = new ayd
            r0.<init>()
            defpackage.txd.a = r0
            goto L5b
        L17:
            r1 = 29
            if (r0 < r1) goto L23
            zxd r0 = new zxd
            r0.<init>()
            defpackage.txd.a = r0
            goto L5b
        L23:
            r1 = 28
            if (r0 < r1) goto L2f
            yxd r0 = new yxd
            r0.<init>()
            defpackage.txd.a = r0
            goto L5b
        L2f:
            r1 = 26
            if (r0 < r1) goto L3b
            xxd r0 = new xxd
            r0.<init>()
            defpackage.txd.a = r0
            goto L5b
        L3b:
            r1 = 24
            if (r0 < r1) goto L54
            java.lang.reflect.Method r0 = defpackage.vxd.k
            if (r0 != 0) goto L4a
            java.lang.String r1 = "TypefaceCompatApi24Impl"
            java.lang.String r2 = "Unable to collect necessary private methods.Fallback to legacy implementation."
            android.util.Log.w(r1, r2)
        L4a:
            if (r0 == 0) goto L54
            vxd r0 = new vxd
            r0.<init>()
            defpackage.txd.a = r0
            goto L5b
        L54:
            uxd r0 = new uxd
            r0.<init>()
            defpackage.txd.a = r0
        L5b:
            bd7 r0 = new bd7
            r1 = 16
            r0.<init>(r1)
            defpackage.txd.b = r0
            r0 = 0
            defpackage.txd.c = r0
            android.os.Trace.endSection()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.txd.<clinit>():void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00e8, code lost:
    
        r7 = r12.build();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Typeface a(android.content.Context r16, defpackage.sz4 r17, android.content.res.Resources r18, int r19, java.lang.String r20, int r21, int r22, defpackage.h30 r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 653
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.txd.a(android.content.Context, sz4, android.content.res.Resources, int, java.lang.String, int, int, h30, boolean):android.graphics.Typeface");
    }

    public static String b(Resources resources, int i, String str, int i2, int i3) {
        return resources.getResourcePackageName(i) + '-' + str + '-' + i2 + '-' + i + '-' + i3;
    }

    public static Typeface c(String str) {
        if (str != null && !str.isEmpty()) {
            Typeface typefaceCreate = Typeface.create(str, 0);
            Typeface typefaceCreate2 = Typeface.create(Typeface.DEFAULT, 0);
            if (typefaceCreate != null && !typefaceCreate.equals(typefaceCreate2)) {
                return typefaceCreate;
            }
        }
        return null;
    }

    public static Font d(Typeface typeface) {
        Paint paint = c;
        if (paint == null) {
            paint = new Paint();
            c = paint;
        }
        paint.setTextSize(10.0f);
        c.setTypeface(typeface);
        PositionedGlyphs positionedGlyphsShapeTextRun = TextRunShaper.shapeTextRun((CharSequence) " ", 0, 1, 0, 1, 0.0f, 0.0f, false, c);
        if (positionedGlyphsShapeTextRun.glyphCount() == 0) {
            return null;
        }
        return positionedGlyphsShapeTextRun.getFont(0);
    }
}
