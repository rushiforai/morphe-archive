package com.google.android.libraries.places.internal;

import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* loaded from: classes3.dex */
public final class zzkx {
    public static int zza(int i5, int i11, int i12) {
        return zzc(i5, i11, i12) ? i12 : i11;
    }

    public static void zzb(ImageView imageView, int i5) {
        Drawable drawable = imageView.getDrawable();
        int iRgb = Color.rgb(Color.red(i5), Color.green(i5), Color.blue(i5));
        Drawable drawableMutate = drawable.mutate();
        drawableMutate.setColorFilter(iRgb, PorterDuff.Mode.SRC_ATOP);
        drawableMutate.setAlpha(Color.alpha(i5));
    }

    public static boolean zzc(int i5, int i11, int i12) {
        double dZzf = zzf(i5);
        double dZze = zze(zzf(i11), dZzf);
        return dZze <= 3.0d && dZze <= zze(zzf(i12), dZzf);
    }

    private static double zzd(double d5) {
        return d5 <= 0.03928d ? d5 / 12.92d : Math.pow((d5 + 0.055d) / 1.055d, 2.4d);
    }

    private static double zze(double d5, double d11) {
        return Math.round(((Math.max(d5, d11) + 0.05d) / (Math.min(d5, d11) + 0.05d)) * 100.0d) / 100.0d;
    }

    private static double zzf(int i5) {
        return (zzd(Color.red(i5) / 255.0d) * 0.2126d) + (zzd(Color.green(i5) / 255.0d) * 0.7152d) + (zzd(Color.blue(i5) / 255.0d) * 0.0722d);
    }
}
