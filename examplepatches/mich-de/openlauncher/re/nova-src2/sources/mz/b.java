package mz;

import aa.l0;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import h6.c1;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import tz.v;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final int f77296a;

    /* renamed from: b, reason: collision with root package name */
    public Bitmap f77297b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f77298c = new Paint(3);

    /* renamed from: d, reason: collision with root package name */
    public final Paint f77299d;

    /* renamed from: e, reason: collision with root package name */
    public final Rect f77300e;

    /* renamed from: f, reason: collision with root package name */
    public final Rect f77301f;

    /* renamed from: g, reason: collision with root package name */
    public v f77302g;

    /* renamed from: h, reason: collision with root package name */
    public final int f77303h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f77304i;

    public b(int i5, o oVar) {
        this.f77296a = i5;
        Paint paint = new Paint(1);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTextSize((i5 * 2) / 3.0f);
        paint.setColor(-16777216);
        this.f77299d = paint;
        this.f77300e = new Rect();
        this.f77301f = new Rect();
        UInt.Companion companion = UInt.f71696b;
        v vVar = new v(-1, -16777216, -1, -1, -1);
        this.f77302g = vVar;
        this.f77303h = oVar.f77363e;
        this.f77304i = oVar.f77359a != 0;
        a(vVar);
    }

    public final synchronized void a(v vVar) {
        try {
            this.f77302g = vVar;
            int i5 = this.f77304i ? vVar.f90180c : vVar.f90178a;
            int i11 = vVar.f90178a;
            int iB = MathKt.b(this.f77296a / 12.0f);
            int iB2 = MathKt.b(this.f77296a / 24.0f);
            this.f77298c.setColor(i5);
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setFilterBitmap(true);
            paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
            int i12 = this.f77296a;
            float f11 = i12;
            float f12 = ((this.f77303h / 8.0f) * f11) / 2;
            RectF rectF = new RectF();
            int i13 = (iB2 * 2) + i12;
            Bitmap.Config config = Bitmap.Config.ARGB_8888;
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i13, i13, config);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            float f13 = iB2;
            rectF.set(f13, f13, bitmapCreateBitmap.getWidth() - f13, bitmapCreateBitmap.getHeight() - f13);
            canvas.drawRoundRect(rectF, f12, f12, this.f77298c);
            if (i5 != i11) {
                int iSave = canvas.save();
                float f14 = c1.f(iB, 2.0f, f11, f11);
                canvas.scale(f14, f14, bitmapCreateBitmap.getWidth() / 2.0f, bitmapCreateBitmap.getHeight() / 2.0f);
                if (((i11 >> 24) & 255) < 255) {
                    RectF rectF2 = new RectF(rectF);
                    rectF2.left += 0.5f;
                    rectF2.right -= 0.5f;
                    rectF2.top += 0.5f;
                    rectF2.bottom -= 0.5f;
                    canvas.drawRoundRect(rectF2, f12, f12, paint);
                }
                this.f77298c.setColor(i11);
                canvas.drawRoundRect(rectF, f12, f12, this.f77298c);
                canvas.restoreToCount(iSave);
            }
            l0 l0Var = new l0();
            l0Var.f608b = 88;
            l0Var.d(this.f77296a);
            int i14 = this.f77296a;
            Bitmap bitmapA = l0Var.a(i14, i14, ((i14 / 2.0f) * this.f77303h) / 8.0f, 0, null);
            this.f77297b = Bitmap.createBitmap(bitmapA.getWidth(), bitmapA.getHeight(), config);
            canvas.setBitmap(c());
            this.f77298c.setColor(-16777216);
            canvas.drawBitmap(bitmapA, 0.0f, 0.0f, this.f77298c);
            canvas.drawBitmap(bitmapCreateBitmap, (bitmapA.getWidth() - bitmapCreateBitmap.getWidth()) / 2.0f, (bitmapA.getHeight() - bitmapCreateBitmap.getHeight()) / 2.0f, this.f77298c);
            this.f77299d.setColor(vVar.f90179b);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void b(Canvas canvas, String str, v vVar) {
        if (!Intrinsics.b(this.f77302g, vVar)) {
            a(vVar);
        }
        Rect rect = this.f77300e;
        int iD = d(str, rect);
        float fHeight = rect.height() / 2.0f;
        int i5 = (-iD) / 2;
        int i11 = (-c().getHeight()) / 2;
        int width = c().getWidth() + i5;
        int height = c().getHeight() + i11;
        rect.set(0, 0, c().getWidth(), c().getHeight());
        Rect rect2 = this.f77301f;
        rect2.set(i5, i11, width, height);
        int width2 = c().getWidth();
        Paint paint = this.f77298c;
        if (iD <= width2) {
            canvas.drawBitmap(c(), rect, rect2, paint);
        } else {
            rect.set(0, 0, c().getWidth() / 2, c().getHeight());
            rect2.set(i5, i11, (c().getWidth() / 2) + i5, height);
            canvas.drawBitmap(c(), rect, rect2, paint);
            rect.set(c().getWidth() / 2, 0, c().getWidth(), c().getHeight());
            rect2.set(width - (c().getWidth() / 2), i11, width, height);
            rect2.offset(iD - c().getWidth(), 0);
            canvas.drawBitmap(c(), rect, rect2, paint);
            rect.set(c().getWidth() / 2, 0, (c().getWidth() / 2) + 1, c().getHeight());
            rect2.set(((c().getWidth() / 2) + i5) - 1, i11, ((i5 + iD) - (c().getWidth() / 2)) + 1, height);
            canvas.drawBitmap(c(), rect, rect2, paint);
        }
        canvas.drawText(str, 0.0f, fHeight, this.f77299d);
    }

    public final Bitmap c() {
        Bitmap bitmap = this.f77297b;
        if (bitmap != null) {
            return bitmap;
        }
        Intrinsics.m("bmp");
        throw null;
    }

    public final int d(String str, Rect rect) {
        this.f77299d.getTextBounds(str, 0, str.length(), rect);
        return Math.max(c().getWidth(), ((c().getWidth() * 2) / 3) + rect.width());
    }
}
