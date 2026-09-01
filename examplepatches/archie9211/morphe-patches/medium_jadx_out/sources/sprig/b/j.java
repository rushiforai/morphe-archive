package sprig.b;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Build;
import android.view.View;
import android.view.Window;
import defpackage.b36;
import defpackage.nte;
import defpackage.ute;
import defpackage.z4f;
import java.util.WeakHashMap;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010\n\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010\u000e\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000bJ\u000e\u0010\u000f\u001a\u00020\r2\u0006\u0010\f\u001a\u00020\u000bR\u0014\u0010\u0011\u001a\u00020\u00108\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\b8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\b8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0015\u0010\u0014R\u0014\u0010\u0016\u001a\u00020\b8\u0006X\u0086T¢\u0006\u0006\n\u0004\b\u0016\u0010\u0014¨\u0006\u0019"}, d2 = {"Lsprig/b/j;", "", "Landroid/content/res/Configuration;", "config", "", "isPhoneLandscape", "Landroid/content/Context;", "context", "", "effectiveMaxHeightRatio", "effectiveConversationalMaxHeightRatio", "Landroid/app/Activity;", "activity", "", "getNavigationBarHeight", "getAvailableScreenHeight", "", "CONVERSATIONAL", "Ljava/lang/String;", "SURVEY_MAX_HEIGHT_RATIO", "F", "CONVERSATIONAL_MAX_HEIGHT_RATIO", "LANDSCAPE_MAX_HEIGHT_RATIO", "<init>", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class j {
    public static final String CONVERSATIONAL = "conversational";
    public static final float CONVERSATIONAL_MAX_HEIGHT_RATIO = 0.95f;
    public static final j INSTANCE = new j();
    public static final float LANDSCAPE_MAX_HEIGHT_RATIO = 1.0f;
    public static final float SURVEY_MAX_HEIGHT_RATIO = 0.85f;

    private j() {
    }

    public final float effectiveConversationalMaxHeightRatio(Context context) {
        context.getClass();
        return isPhoneLandscape(context) ? 1.0f : 0.95f;
    }

    public final float effectiveMaxHeightRatio(Context context) {
        context.getClass();
        return isPhoneLandscape(context) ? 1.0f : 0.85f;
    }

    public final int getAvailableScreenHeight(Activity activity) {
        View decorView;
        int iHeight;
        activity.getClass();
        Window window = activity.getWindow();
        if (window == null || (decorView = window.getDecorView()) == null) {
            return activity.getResources().getDisplayMetrics().heightPixels;
        }
        WeakHashMap weakHashMap = ute.a;
        z4f z4fVarA = nte.a(decorView);
        if (z4fVarA == null) {
            return activity.getResources().getDisplayMetrics().heightPixels;
        }
        b36 b36VarI = z4fVarA.a.i(519);
        b36VarI.getClass();
        if (Build.VERSION.SDK_INT >= 30) {
            iHeight = activity.getWindowManager().getCurrentWindowMetrics().getBounds().height();
        } else {
            Point point = new Point();
            activity.getWindowManager().getDefaultDisplay().getRealSize(point);
            iHeight = point.y;
        }
        return (iHeight - b36VarI.b) - b36VarI.d;
    }

    public final int getNavigationBarHeight(Activity activity) {
        View decorView;
        activity.getClass();
        Window window = activity.getWindow();
        if (window != null && (decorView = window.getDecorView()) != null) {
            WeakHashMap weakHashMap = ute.a;
            z4f z4fVarA = nte.a(decorView);
            if (z4fVarA != null) {
                return z4fVarA.a.i(2).d;
            }
            Resources resources = activity.getResources();
            int identifier = resources.getIdentifier("navigation_bar_height", "dimen", "android");
            if (identifier > 0) {
                return resources.getDimensionPixelSize(identifier);
            }
        }
        return 0;
    }

    public final boolean isPhoneLandscape(Context context) {
        context.getClass();
        Configuration configuration = context.getResources().getConfiguration();
        configuration.getClass();
        return isPhoneLandscape(configuration);
    }

    public final boolean isPhoneLandscape(Configuration config) {
        config.getClass();
        return config.orientation == 2 && config.smallestScreenWidthDp < 600;
    }
}
