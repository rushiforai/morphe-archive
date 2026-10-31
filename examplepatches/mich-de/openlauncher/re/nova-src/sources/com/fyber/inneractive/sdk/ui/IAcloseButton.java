package com.fyber.inneractive.sdk.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import com.fyber.inneractive.sdk.util.o;

/* loaded from: classes3.dex */
public class IAcloseButton extends View {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f31133a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f31134b;

    public IAcloseButton(Context context, int i5) {
        super(context);
        int iB = o.b(10);
        int i11 = ((i5 - (iB * 2)) / 4) + iB;
        Point point = new Point(i11, i11);
        int i12 = i5 - i11;
        Point point2 = new Point(i11, i12);
        Point point3 = new Point(i12, i12);
        Point point4 = new Point(i12, i11);
        Path path = new Path();
        this.f31134b = path;
        path.setFillType(Path.FillType.EVEN_ODD);
        path.moveTo(point.x, point.y);
        path.lineTo(point3.x, point3.y);
        path.moveTo(point2.x, point2.y);
        path.lineTo(point4.x, point4.y);
        path.close();
        Paint paint = new Paint(1);
        this.f31133a = paint;
        paint.setStrokeWidth(o.b(2));
        paint.setColor(-1);
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        paint.setAntiAlias(true);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(-1436657061);
        gradientDrawable.setStroke(o.b(2), -1);
        o.a(this, gradientDrawable);
        setPadding(iB, iB, iB, iB);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawPath(this.f31134b, this.f31133a);
    }
}
