package sprig.view;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Looper;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.userleap.SprigLoggingLevel;
import com.userleap.internal.data.MobileReplaySettings;
import com.userleap.internal.data.SdkConfig;
import defpackage.ajb;
import defpackage.ev6;
import defpackage.g76;
import defpackage.ho2;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import sprig.b.b;

/* JADX INFO: renamed from: sprig.d.f, reason: from Kotlin metadata */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\u001a&\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003*\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0001H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0005\u0010\u0006\u001a\u001b\u0010\u0002\u001a\u00020\t*\u00020\u00002\u0006\u0010\b\u001a\u00020\u0007H\u0000¢\u0006\u0004\b\u0002\u0010\n\u001a\u0019\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b*\u00020\u0000H\u0000¢\u0006\u0004\b\r\u0010\u000e\u001a\u0013\u0010\u000f\u001a\u00020\u0001*\u00020\u0000H\u0002¢\u0006\u0004\b\u000f\u0010\u0010\"\u0018\u0010\u0011\u001a\u00020\u0001*\u00020\u00008@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0010\"\u0018\u0010\u0012\u001a\u00020\u0001*\u00020\u00008@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0010\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0013"}, d2 = {"Landroid/view/View;", "", "redactDetails", "Lbjb;", "Landroid/graphics/Bitmap;", "asBitmap", "(Landroid/view/View;Z)Ljava/lang/Object;", "Landroid/graphics/Canvas;", "canvas", "Lc1e;", "(Landroid/view/View;Landroid/graphics/Canvas;)V", "", "Lsprig/d/g;", "getRenderingDetails", "(Landroid/view/View;)Ljava/util/List;", "a", "(Landroid/view/View;)Z", "isRedacted", "isPasswordField", "userleap_release"}, k = 2, mv = {1, 8, 0})
public final class View {
    public static final void a(List list, int[] iArr, android.view.View view) {
        Rect rectA;
        boolean zIsRedacted;
        try {
            if (view.getVisibility() == 0 && (rectA = a(iArr, view)) != null) {
                try {
                    zIsRedacted = isRedacted(view);
                } catch (Exception unused) {
                    zIsRedacted = true;
                }
                list.add(new g(view.getClass().getSimpleName(), zIsRedacted, rectA));
                if (view instanceof ViewGroup) {
                    int childCount = ((ViewGroup) view).getChildCount();
                    for (int i = 0; i < childCount; i++) {
                        try {
                            android.view.View childAt = ((ViewGroup) view).getChildAt(i);
                            if (childAt != null) {
                                a(list, iArr, childAt);
                            }
                        } catch (Exception e) {
                            String str = "Unable to access child in hierarchy (hierarchy changed): " + view.getClass().getSimpleName();
                            String string = e.toString();
                            b.sendVerboseLoggingEvent$default(b.INSTANCE, str + ": " + string, SprigLoggingLevel.WARNING, 0, 4, null);
                        }
                    }
                }
            }
        } catch (Exception e2) {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x("Unexpected error traversing hierarchy for view: ".concat(view.getClass().getSimpleName()), ": ", e2.toString()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    public static final Object asBitmap(android.view.View view, boolean z) {
        view.getClass();
        if (!g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, "asBitmap() called off main thread", SprigLoggingLevel.ERROR, 0, 4, null);
            StringBuilder sbI = ho2.I(Thread.currentThread().getId(), "asBitmap() must be called on the main thread for Compose compatibility. Current thread: ", Thread.currentThread().getName(), " (id=");
            sbI.append(")");
            return new ajb(new IllegalStateException(sbI.toString()));
        }
        if (!view.isAttachedToWindow()) {
            return new ajb(new IllegalStateException(ev6.x("View ", view.getClass().getSimpleName(), " is not attached to window.")));
        }
        if (view.getWidth() == 0 || view.getHeight() == 0) {
            String simpleName = view.getClass().getSimpleName();
            int width = view.getWidth();
            int height = view.getHeight();
            StringBuilder sbT = y30.t(width, "View ", simpleName, " has invalid dimensions: width=", ", height=");
            sbT.append(height);
            return new ajb(new IllegalStateException(sbT.toString()));
        }
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
            bitmapCreateBitmap.getClass();
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            try {
                view.draw(canvas);
                if (z) {
                    try {
                        redactDetails(view, canvas);
                    } catch (Exception e) {
                        String strConcat = "Redaction failed for view: ".concat(view.getClass().getSimpleName());
                        b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x(strConcat, ": ", e.toString()), SprigLoggingLevel.ERROR, 0, 4, null);
                        return new ajb(new RuntimeException(strConcat, e));
                    }
                }
                return bitmapCreateBitmap;
            } catch (Exception e2) {
                try {
                    bitmapCreateBitmap.recycle();
                } catch (Exception unused) {
                    b.sendLoggingEvent$default(b.INSTANCE, "Unexpected error recycling bitmap", SprigLoggingLevel.ERROR, 0, 4, null);
                }
                String strConcat2 = "Failed to draw view on canvas: ".concat(view.getClass().getSimpleName());
                b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x(strConcat2, ": ", e2.toString()), SprigLoggingLevel.ERROR, 0, 4, null);
                return new ajb(new RuntimeException(strConcat2, e2));
            }
        } catch (Exception e3) {
            return new ajb(new RuntimeException("Failed to create bitmap: ".concat(view.getClass().getSimpleName()), e3));
        }
    }

    public static /* synthetic */ Object asBitmap$default(android.view.View view, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            z = false;
        }
        return asBitmap(view, z);
    }

    public static final List<g> getRenderingDetails(android.view.View view) {
        view.getClass();
        ArrayList arrayList = new ArrayList();
        int[] iArr = new int[2];
        try {
            view.getLocationInWindow(iArr);
            a(arrayList, iArr, view);
            return arrayList;
        } catch (Exception e) {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x("Unable to get location in window: ".concat(view.getClass().getSimpleName()), ": ", e.toString()), SprigLoggingLevel.WARNING, 0, 4, null);
            return arrayList;
        }
    }

    public static final boolean isPasswordField(android.view.View view) {
        view.getClass();
        if (!(view instanceof EditText)) {
            return false;
        }
        int inputType = ((EditText) view).getInputType() & 4080;
        return inputType == 128 || inputType == 224 || inputType == 16;
    }

    public static final boolean isRedacted(android.view.View view) {
        SdkConfig sdkConfig;
        MobileReplaySettings mobileReplaySettings;
        MobileReplaySettings mobileReplaySettings2;
        view.getClass();
        try {
            if (isPasswordField(view)) {
                return true;
            }
        } catch (Exception unused) {
        }
        Set<String> unmaskClasses = null;
        try {
            sdkConfig = SdkConfig.INSTANCE.get$userleap_release();
        } catch (Exception unused2) {
            sdkConfig = null;
        }
        Set<String> maskClasses = (sdkConfig == null || (mobileReplaySettings2 = sdkConfig.getMobileReplaySettings()) == null) ? null : mobileReplaySettings2.getMaskClasses();
        if (sdkConfig != null && (mobileReplaySettings = sdkConfig.getMobileReplaySettings()) != null) {
            unmaskClasses = mobileReplaySettings.getUnmaskClasses();
        }
        String simpleName = view.getClass().getSimpleName();
        if (unmaskClasses != null && unmaskClasses.contains(simpleName)) {
            return false;
        }
        if (maskClasses != null && maskClasses.contains(simpleName)) {
            return true;
        }
        if (view instanceof EditText) {
            if (unmaskClasses != null && unmaskClasses.contains("EditText")) {
                return false;
            }
            if (maskClasses != null && maskClasses.contains("EditText")) {
                return true;
            }
        }
        boolean z = view instanceof TextView;
        if (z && a(view)) {
            if (unmaskClasses != null && unmaskClasses.contains("TextView")) {
                return false;
            }
            if (maskClasses != null && maskClasses.contains("TextView")) {
                return true;
            }
        }
        if (z && !a(view) && maskClasses != null && maskClasses.contains("TextView")) {
            return false;
        }
        for (Class<?> superclass = view.getClass(); superclass != null; superclass = superclass.getSuperclass()) {
            if (unmaskClasses != null && unmaskClasses.contains(superclass.getSimpleName())) {
                return false;
            }
        }
        for (Class<?> superclass2 = view.getClass(); superclass2 != null; superclass2 = superclass2.getSuperclass()) {
            if (maskClasses != null && maskClasses.contains(superclass2.getSimpleName())) {
                return true;
            }
        }
        return view instanceof WebView;
    }

    public static final void redactDetails(android.view.View view, Canvas canvas) {
        view.getClass();
        canvas.getClass();
        Paint paint = new Paint();
        paint.setColor(-16777216);
        paint.setStyle(Paint.Style.FILL);
        for (g gVar : getRenderingDetails(view)) {
            if (gVar.getRedacted()) {
                try {
                    canvas.drawRect(gVar.getFrame(), paint);
                } catch (Exception e) {
                    b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x("Unexpected error redacting details for: ".concat(view.getClass().getSimpleName()), ": ", e.toString()), SprigLoggingLevel.ERROR, 0, 4, null);
                }
            }
        }
    }

    public static final Rect a(int[] iArr, android.view.View view) {
        try {
            int[] iArr2 = new int[2];
            view.getLocationInWindow(iArr2);
            int i = iArr2[0] - iArr[0];
            int i2 = iArr2[1] - iArr[1];
            return new Rect(i, i2, view.getWidth() + i, view.getHeight() + i2);
        } catch (Exception e) {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, ev6.x("Unable to get relative rect for: ".concat(view.getClass().getSimpleName()), ": ", e.toString()), SprigLoggingLevel.WARNING, 0, 4, null);
            return null;
        }
    }

    public static final boolean a(android.view.View view) {
        return (!(view instanceof TextView) || (view instanceof EditText) || (view instanceof Button)) ? false : true;
    }
}
