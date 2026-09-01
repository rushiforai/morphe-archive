package defpackage;

import android.app.Notification;
import android.app.job.JobParameters;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.NinePatch;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.fonts.Font;
import android.net.NetworkRequest;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.LongSparseArray;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.RoundedCorner;
import android.view.View;
import android.view.WindowManager;
import android.view.translation.TranslationRequestValue;
import android.view.translation.TranslationResponseValue;
import android.view.translation.ViewTranslationRequest;
import android.view.translation.ViewTranslationResponse;
import android.widget.EdgeEffect;
import androidx.work.impl.background.systemjob.SystemJobService;
import java.util.List;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class io {
    public static int[] a(NetworkRequest networkRequest) {
        networkRequest.getClass();
        int[] capabilities = networkRequest.getCapabilities();
        capabilities.getClass();
        return capabilities;
    }

    public static EdgeEffect b(Context context) {
        try {
            return new EdgeEffect(context, null);
        } catch (Throwable unused) {
            return new EdgeEffect(context);
        }
    }

    public static RenderEffect c(float f, float f2, int i) {
        return (f == 0.0f && f2 == 0.0f) ? RenderEffect.createOffsetEffect(0.0f, 0.0f) : RenderEffect.createBlurEffect(f, f2, yi2.R(i));
    }

    public static void d(mo moVar, LongSparseArray longSparseArray) {
        TranslationResponseValue value;
        CharSequence text;
        byb bybVar;
        zxb zxbVar;
        x45 x45Var;
        int size = longSparseArray.size();
        for (int i = 0; i < size; i++) {
            long jKeyAt = longSparseArray.keyAt(i);
            ViewTranslationResponse viewTranslationResponse = (ViewTranslationResponse) longSparseArray.get(jKeyAt);
            if (viewTranslationResponse != null && (value = viewTranslationResponse.getValue("android:text")) != null && (text = value.getText()) != null && (bybVar = (byb) moVar.d().b((int) jKeyAt)) != null && (zxbVar = bybVar.a) != null) {
                Object objG = zxbVar.d.a.g(sxb.l);
                if (objG == null) {
                    objG = null;
                }
                i4 i4Var = (i4) objG;
                if (i4Var != null && (x45Var = (x45) i4Var.b) != null) {
                }
            }
        }
    }

    public static void e(Canvas canvas, int[] iArr, int i, float[] fArr, int i2, int i3, Font font, Paint paint) {
        canvas.drawGlyphs(iArr, i, fArr, i2, i3, font, paint);
    }

    public static void f(Canvas canvas, NinePatch ninePatch, Rect rect, Paint paint) {
        canvas.drawPatch(ninePatch, rect, paint);
    }

    public static void g(Canvas canvas, NinePatch ninePatch, RectF rectF, Paint paint) {
        canvas.drawPatch(ninePatch, rectF, paint);
    }

    public static Path h(DisplayCutout displayCutout) {
        return displayCutout.getCutoutPath();
    }

    public static float i(EdgeEffect edgeEffect) {
        try {
            return edgeEffect.getDistance();
        } catch (Throwable unused) {
            return 0.0f;
        }
    }

    public static Shader.TileMode j() {
        return Shader.TileMode.DECAL;
    }

    public static zlb k(Display display, int i) {
        RoundedCorner roundedCorner;
        int i2;
        if (Build.VERSION.SDK_INT < 31 || (roundedCorner = display.getRoundedCorner(i)) == null) {
            return null;
        }
        int position = roundedCorner.getPosition();
        if (position != 0) {
            i2 = 1;
            if (position != 1) {
                i2 = 2;
                if (position != 2) {
                    i2 = 3;
                    if (position != 3) {
                        ay0.e(b09.w(position, "Invalid position: "));
                        return null;
                    }
                }
            }
        } else {
            i2 = 0;
        }
        return new zlb(i2, roundedCorner.getRadius(), roundedCorner.getCenter());
    }

    public static final int l(Context context) {
        WindowManager windowManager;
        Display defaultDisplay;
        context.getClass();
        if (Build.VERSION.SDK_INT < 31) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            Object systemService = context.getSystemService("window");
            windowManager = systemService instanceof WindowManager ? (WindowManager) systemService : null;
            if (windowManager != null && (defaultDisplay = windowManager.getDefaultDisplay()) != null) {
                defaultDisplay.getMetrics(displayMetrics);
            }
            return displayMetrics.widthPixels;
        }
        Display display = context.getDisplay();
        display.getClass();
        Context contextCreateWindowContext = context.createWindowContext(display, 2, null);
        contextCreateWindowContext.getClass();
        Object systemService2 = contextCreateWindowContext.getSystemService("window");
        windowManager = systemService2 instanceof WindowManager ? (WindowManager) systemService2 : null;
        if (windowManager == null) {
            return 0;
        }
        return windowManager.getCurrentWindowMetrics().getBounds().width();
    }

    public static int m(JobParameters jobParameters) {
        int stopReason = jobParameters.getStopReason();
        String str = SystemJobService.e;
        switch (stopReason) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                return stopReason;
            default:
                return -512;
        }
    }

    public static void n(mo moVar, long[] jArr, Consumer consumer) {
        zxb zxbVar;
        for (long j : jArr) {
            byb bybVar = (byb) moVar.d().b((int) j);
            if (bybVar != null && (zxbVar = bybVar.a) != null) {
                ViewTranslationRequest.Builder builder = new ViewTranslationRequest.Builder(moVar.a.getAutofillId(), zxbVar.f);
                Object objG = zxbVar.d.a.g(eyb.C);
                if (objG == null) {
                    objG = null;
                }
                List list = (List) objG;
                if (list != null) {
                    builder.setValue("android:text", TranslationRequestValue.forText(new mx(z27.b(list, "\n", null, 62))));
                    consumer.accept(builder.build());
                }
            }
        }
    }

    public static float o(EdgeEffect edgeEffect, float f, float f2) {
        try {
            return edgeEffect.onPullDistance(f, f2);
        } catch (Throwable unused) {
            edgeEffect.onPull(f, f2);
            return 0.0f;
        }
    }

    public static void p(Notification.Action.Builder builder) {
        builder.setAuthenticationRequired(false);
    }

    public static void q(RenderNode renderNode, ts0 ts0Var) {
        renderNode.setRenderEffect(ts0Var != null ? ts0Var.a() : null);
    }

    public static void r(View view, ts0 ts0Var) {
        view.setRenderEffect(ts0Var != null ? ts0Var.a() : null);
    }

    public static final String s(c05 c05Var, Context context) {
        List list = c05Var.a;
        q73 q73VarG = k40.g(context);
        int i = (Build.VERSION.SDK_INT < 31 || context.getResources().getConfiguration().fontWeightAdjustment == Integer.MAX_VALUE) ? 0 : context.getResources().getConfiguration().fontWeightAdjustment;
        if (i == 0) {
            return z27.b(list, null, new hb8(q73VarG), 31);
        }
        if (list.size() > 0) {
            list.get(0).getClass();
            rd6.m();
            return null;
        }
        return (list.isEmpty() ? "" : "".concat(",")) + "'wght' " + iq7.u(i + 400.0f, 1.0f, 1000.0f);
    }

    public static int[] t(NetworkRequest networkRequest) {
        networkRequest.getClass();
        int[] transportTypes = networkRequest.getTransportTypes();
        transportTypes.getClass();
        return transportTypes;
    }
}
