package com.bytedance.sdk.openadsdk.utils;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public class dj {

    public static class ycx implements View.OnLayoutChangeListener {
        private int sya;
        private final Drawable ycx;

        /* renamed from: zb, reason: collision with root package name */
        private int f27132zb;

        public ycx(Drawable drawable) {
            this.ycx = drawable;
        }

        @Override // android.view.View.OnLayoutChangeListener
        public void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
            int i18 = i12 - i5;
            int i19 = i13 - i11;
            if (i18 == this.f27132zb && i19 == this.sya) {
                return;
            }
            this.f27132zb = i18;
            this.sya = i19;
            this.ycx.setBounds(0, 0, i18, i19);
        }
    }

    public static void ycx(ViewGroup viewGroup, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (viewGroup == null || tnVar == null || TextUtils.isEmpty(tnVar.rmf())) {
            return;
        }
        try {
            int i5 = wie.doy;
            if (viewGroup.getTag(i5) != null) {
                return;
            }
            viewGroup.setTag(i5, Integer.valueOf(i5));
            Drawable drawableYcx = ycx(viewGroup.getResources(), tnVar);
            if (drawableYcx == null) {
                return;
            }
            viewGroup.setForeground(drawableYcx);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euogmgGTf8KSRtZEpBSsOF78", "T/w0tAe4RtGFWNtclQ==", 71);
            com.bytedance.sdk.component.utils.htf.sya("add overlay fail", th2.getMessage());
        }
    }

    public static void ycx(Activity activity, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (activity == null || tnVar == null || TextUtils.isEmpty(tnVar.rmf())) {
            return;
        }
        try {
            View decorView = activity.getWindow().getDecorView();
            int i5 = wie.doy;
            if (decorView.getTag(i5) != null) {
                return;
            }
            activity.getWindow().getDecorView().setTag(i5, Integer.valueOf(i5));
            Drawable drawableYcx = ycx(activity.getResources(), tnVar);
            if (drawableYcx == null) {
                return;
            }
            activity.getWindow().getDecorView().setForeground(drawableYcx);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euogmgGTf8KSRtZEpBSsOF78", "T/w0tAe4RtGFWNtclQ==", Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            com.bytedance.sdk.component.utils.htf.sya("add overlay fail", th2.getMessage());
        }
    }

    private static Drawable ycx(Resources resources, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        try {
            String strRmf = tnVar.rmf();
            if (TextUtils.isEmpty(strRmf)) {
                return null;
            }
            byte[] bArrDecode = Base64.decode(strRmf, 0);
            BitmapDrawable bitmapDrawable = new BitmapDrawable(resources, BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length));
            Shader.TileMode tileMode = Shader.TileMode.REPEAT;
            bitmapDrawable.setTileModeXY(tileMode, tileMode);
            bitmapDrawable.setTargetDensity(resources.getDisplayMetrics());
            return bitmapDrawable;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euogmgGTf8KSRtZEpBSsOF78", "XOs5uhW5e8uBU/NPjQahKlfr", Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE);
            return null;
        }
    }
}
