package com.android.launcher3.icons;

import aa.d;
import aa.g;
import aa.j0;
import aa.n;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class BitmapInfo implements Parcelable {
    public static final Parcelable.Creator<BitmapInfo> CREATOR;

    /* renamed from: c, reason: collision with root package name */
    public static final Bitmap f21149c;

    /* renamed from: d, reason: collision with root package name */
    public static final BitmapInfo f21150d;

    /* renamed from: a, reason: collision with root package name */
    public final Bitmap f21151a;

    /* renamed from: b, reason: collision with root package name */
    public final int f21152b;

    static {
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ALPHA_8);
        f21149c = bitmapCreateBitmap;
        f21150d = a(bitmapCreateBitmap);
        CREATOR = new d(0);
    }

    public BitmapInfo(Bitmap bitmap, int i5) {
        this.f21151a = bitmap;
        this.f21152b = i5;
    }

    public static BitmapInfo a(Bitmap bitmap) {
        return new BitmapInfo(bitmap, 0);
    }

    public static BitmapInfo b(Bitmap bitmap, g gVar) {
        return new BitmapInfo(bitmap, gVar != null ? gVar.a(bitmap, gVar.f587e) : 0);
    }

    public int d() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean e() {
        Bitmap bitmap = this.f21151a;
        return bitmap == null || bitmap == f21149c;
    }

    public n f(Context context) {
        Bitmap bitmap = f21149c;
        Bitmap bitmap2 = this.f21151a;
        n j0Var = bitmap == bitmap2 ? new j0(this, context) : new n(bitmap2, this.f21152b, false);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{2130969100});
        float f11 = typedArrayObtainStyledAttributes.getFloat(0, 1.0f);
        typedArrayObtainStyledAttributes.recycle();
        j0Var.f632g = f11;
        return j0Var;
    }

    public n i(Context context) {
        return f(context);
    }

    public byte[] l() throws IOException {
        if (e()) {
            return null;
        }
        Bitmap bitmap = this.f21151a;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream((bitmap.getHeight() * bitmap.getWidth() * 4) + 1);
        try {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException unused) {
            Log.w("BitmapInfo", "Could not write bitmap");
            return null;
        }
    }

    public String toString() {
        Bitmap bitmap = f21149c;
        int i5 = this.f21152b;
        Bitmap bitmap2 = this.f21151a;
        if (bitmap2 == bitmap) {
            return "BitmapInfo(LOW_RES, " + Integer.toHexString(i5) + ")";
        }
        return "BitmapInfo(" + bitmap2.getWidth() + "x" + bitmap2.getHeight() + ", " + Integer.toHexString(i5) + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(this.f21151a, i5);
        parcel.writeInt(this.f21152b);
    }

    public BitmapInfo(Parcel parcel) {
        this.f21151a = (Bitmap) parcel.readParcelable(Bitmap.class.getClassLoader());
        this.f21152b = parcel.readInt();
    }
}
