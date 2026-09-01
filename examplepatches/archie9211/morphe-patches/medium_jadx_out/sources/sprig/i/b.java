package sprig.i;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Outline;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.FrameLayout;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.widget.NestedScrollView;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.reader.R;
import com.userleap.SprigLoggingLevel;
import com.userleap.SprigUserInterfaceMode;
import com.userleap.internal.ui.SprigNestedScrollView;
import defpackage.b09;
import defpackage.c1e;
import defpackage.chf;
import defpackage.co6;
import defpackage.cw0;
import defpackage.ev6;
import defpackage.f09;
import defpackage.fhf;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.ka1;
import defpackage.l92;
import defpackage.m45;
import defpackage.mte;
import defpackage.nuc;
import defpackage.ute;
import defpackage.y30;
import defpackage.ygf;
import defpackage.z4f;
import defpackage.zgf;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.UninitializedPropertyAccessException;
import sprig.b.g;
import sprig.b.h;
import sprig.b.j;
import sprig.i.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0006\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000f\b\u0000\u0018\u0000 m2\u00020\u0001:\u0001\fB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0011\u0010\u0006\u001a\u0004\u0018\u00010\u0002H\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u000e\u0010\rJ\u0019\u0010\u0011\u001a\u00020\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0002¢\u0006\u0004\b\u0011\u0010\u0012J1\u0010\f\u001a\u00020\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0013\u001a\u00020\b2\u0006\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0015\u001a\u00020\bH\u0002¢\u0006\u0004\b\f\u0010\u0016J\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u0017H\u0002¢\u0006\u0004\b\f\u0010\u0019JI\u0010\f\u001a\u00020\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0013\u001a\u00020\b2\u0006\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0015\u001a\u00020\bH\u0002¢\u0006\u0004\b\f\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u001f\u0010\rJ\u000f\u0010 \u001a\u00020\u000bH\u0002¢\u0006\u0004\b \u0010\rJ\u0019\u0010\f\u001a\u00020\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0002¢\u0006\u0004\b\f\u0010\u0012J\u000f\u0010\u0011\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\u0011\u0010\rJ\u0019\u0010\f\u001a\u00020\u000b2\b\u0010!\u001a\u0004\u0018\u00010\bH\u0002¢\u0006\u0004\b\f\u0010\"J)\u0010\f\u001a\u00020\u000b2\u0006\u0010#\u001a\u00020\b2\u0006\u0010$\u001a\u00020\b2\b\u0010&\u001a\u0004\u0018\u00010%H\u0002¢\u0006\u0004\b\f\u0010'J\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\f\u0010\u0005J\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010)\u001a\u00020(H\u0002¢\u0006\u0004\b\f\u0010*J\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010+\u001a\u00020\bH\u0002¢\u0006\u0004\b\f\u0010,J\u000f\u0010-\u001a\u00020\u000bH\u0002¢\u0006\u0004\b-\u0010\rJ\r\u0010.\u001a\u00020\u000b¢\u0006\u0004\b.\u0010\rJ\u0015\u00100\u001a\u00020\u000b2\u0006\u0010/\u001a\u00020\u001a¢\u0006\u0004\b0\u00101J\r\u00102\u001a\u00020\u000b¢\u0006\u0004\b2\u0010\rJ\u001f\u00105\u001a\u00020\u000b2\u0006\u00104\u001a\u0002032\b\u0010&\u001a\u0004\u0018\u00010%¢\u0006\u0004\b5\u00106J\r\u00107\u001a\u00020\u000b¢\u0006\u0004\b7\u0010\rJ\r\u00109\u001a\u000208¢\u0006\u0004\b9\u0010:R\"\u0010>\u001a\u0010\u0012\f\u0012\n <*\u0004\u0018\u00010\u00020\u00020;8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010=R\u0018\u0010A\u001a\u0004\u0018\u00010?8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0011\u0010@R\u0018\u0010D\u001a\u0004\u0018\u00010B8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b \u0010CR\u0018\u0010F\u001a\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b-\u0010ER\u0018\u0010H\u001a\u0004\u0018\u00010\u001c8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\t\u0010GR\u0018\u0010K\u001a\u0004\u0018\u00010I8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010JR\u0018\u0010L\u001a\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u000e\u0010ER\u0018\u0010N\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001f\u0010MR\u0016\u0010Q\u001a\u0002088\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bO\u0010PR\u0016\u0010T\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bR\u0010SR\u0016\u0010V\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bU\u0010SR\u0016\u0010X\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bW\u0010SR\u001e\u0010Z\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010;8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bY\u0010=R\u0018\u0010^\u001a\u0004\u0018\u00010[8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\\\u0010]R\u0014\u0010b\u001a\u00020_8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b`\u0010aR\u0016\u0010d\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bc\u0010SR\u0018\u0010f\u001a\u0004\u0018\u00010[8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\be\u0010]R\u0016\u0010h\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bg\u0010SR\u0016\u0010j\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bi\u0010SR\u0018\u0010l\u001a\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bk\u0010E¨\u0006n"}, d2 = {"Lsprig/i/b;", "", "Landroid/app/Activity;", "activity", "<init>", "(Landroid/app/Activity;)V", "f", "()Landroid/app/Activity;", "", "e", "()I", "Lc1e;", "a", "()V", "g", "Landroid/widget/FrameLayout;", "bottomSheet", "b", "(Landroid/widget/FrameLayout;)V", "keyboardTop", "screenHeight", "keyboardHeight", "(Landroid/widget/FrameLayout;III)V", "", "translationY", "(F)V", "Landroid/graphics/Rect;", "textRect", "Lcom/userleap/internal/ui/SprigNestedScrollView;", "sv", "(Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/userleap/internal/ui/SprigNestedScrollView;Landroid/app/Activity;III)V", "h", "c", "height", "(Ljava/lang/Integer;)V", "contentHeightDpPx", "contentHeightCssPx", "", "layout", "(IILjava/lang/String;)V", "Landroid/view/View;", "view", "(Landroid/view/View;)V", "scrollY", "(I)V", "d", "show", "rect", "onTextFieldFocused", "(Landroid/graphics/Rect;)V", "onTextFieldBlurred", "", "contentFrameHeight", "onSurveyHeightReceived", "(DLjava/lang/String;)V", "dismiss", "", "isShowing", "()Z", "Ljava/lang/ref/WeakReference;", "kotlin.jvm.PlatformType", "Ljava/lang/ref/WeakReference;", "activityRef", "Lcw0;", "Lcw0;", "dialog", "Landroid/view/ViewGroup;", "Landroid/view/ViewGroup;", "webViewContainer", "Landroid/view/View;", "rootView", "Lcom/userleap/internal/ui/SprigNestedScrollView;", "scrollView", "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;", "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;", "keyboardLayoutListener", "keyboardListenerView", "Landroid/graphics/Rect;", "textFieldRect", "i", "Z", "isKeyboardCurrentlyVisible", "j", "I", "currentKeyboardTop", "k", "currentScreenHeight", "l", "currentKeyboardHeight", "m", "bottomSheetRef", "Ljava/lang/Runnable;", "n", "Ljava/lang/Runnable;", "pendingKeyboardAdjustmentRunnable", "Landroid/os/Handler;", "o", "Landroid/os/Handler;", "handler", "p", "currentKeyboardOffsetCssPx", "q", "pendingHeightRunnable", "r", "lastConversationalMinHeightCssPx", "s", "materialNavBarPaddingPx", "t", "scrimView", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class b {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final WeakReference activityRef;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public cw0 dialog;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public ViewGroup webViewContainer;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public View rootView;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public SprigNestedScrollView scrollView;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public ViewTreeObserver.OnGlobalLayoutListener keyboardLayoutListener;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public View keyboardListenerView;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public Rect textFieldRect;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public boolean isKeyboardCurrentlyVisible;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public int currentKeyboardTop;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    public int currentScreenHeight;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    public int currentKeyboardHeight;

    /* JADX INFO: renamed from: m, reason: from kotlin metadata */
    public WeakReference bottomSheetRef;

    /* JADX INFO: renamed from: n, reason: from kotlin metadata */
    public Runnable pendingKeyboardAdjustmentRunnable;

    /* JADX INFO: renamed from: o, reason: from kotlin metadata */
    public final Handler handler;

    /* JADX INFO: renamed from: p, reason: from kotlin metadata */
    public int currentKeyboardOffsetCssPx;

    /* JADX INFO: renamed from: q, reason: from kotlin metadata */
    public Runnable pendingHeightRunnable;

    /* JADX INFO: renamed from: r, reason: from kotlin metadata */
    public int lastConversationalMinHeightCssPx;

    /* JADX INFO: renamed from: s, reason: from kotlin metadata */
    public int materialNavBarPaddingPx;

    /* JADX INFO: renamed from: t, reason: from kotlin metadata */
    public View scrimView;

    /* JADX INFO: renamed from: sprig.i.b$b, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class C0028b {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[SprigUserInterfaceMode.values().length];
            try {
                iArr[SprigUserInterfaceMode.LIGHT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[SprigUserInterfaceMode.DARK.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[SprigUserInterfaceMode.UNSPECIFIED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"sprig/i/b$d", "Landroid/view/ViewOutlineProvider;", "Landroid/view/View;", "view", "Landroid/graphics/Outline;", "outline", "Lc1e;", "getOutline", "(Landroid/view/View;Landroid/graphics/Outline;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class d extends ViewOutlineProvider {
        final /* synthetic */ float $cornerRadiusPx;

        public d(float f) {
            this.$cornerRadiusPx = f;
        }

        @Override // android.view.ViewOutlineProvider
        public void getOutline(View view, Outline outline) {
            view.getClass();
            outline.getClass();
            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), this.$cornerRadiusPx);
        }
    }

    public b(Activity activity) {
        activity.getClass();
        this.activityRef = new WeakReference(activity);
        this.handler = new Handler(Looper.getMainLooper());
    }

    public final void a(FrameLayout bottomSheet, Rect textRect, SprigNestedScrollView sv, Activity activity, int keyboardTop, int screenHeight, int keyboardHeight) {
        float f = activity.getResources().getDisplayMetrics().density;
        int height = bottomSheet != null ? bottomSheet.getHeight() : 0;
        int height2 = sv.getHeight();
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        StringBuilder sbB = ev6.B(height, height2, "Pre-adjustment state: sheetHeight=", ", scrollViewHeight=", ", textRect=");
        sbB.append(textRect);
        sbB.append(", screenHeight=");
        sbB.append(screenHeight);
        sbB.append(", keyboardTop=");
        sbB.append(keyboardTop);
        sbB.append(", keyboardHeight=");
        sbB.append(keyboardHeight);
        sbB.append(", density=");
        sbB.append(f);
        String string = sbB.toString();
        SprigLoggingLevel sprigLoggingLevel = SprigLoggingLevel.DEBUG;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, string, sprigLoggingLevel, 0, 4, null);
        if (height < 100) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar, ev6.w("Skipping adjustment - bottom sheet not yet laid out (sheetHeight=", height, " < 100)"), sprigLoggingLevel, 0, 4, null);
            return;
        }
        int i = textRect.bottom;
        if (i <= 0 || i > 10000) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar, b09.w(i, "Skipping adjustment - textRect.bottom out of bounds: "), SprigLoggingLevel.ERROR, 0, 4, null);
            return;
        }
        int i2 = (int) (i * f);
        int scrollY = sv.getScrollY();
        int i3 = i2 - scrollY;
        View view = sv;
        int top = 0;
        while (view != null && !view.equals(bottomSheet)) {
            top += view.getTop();
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        int i4 = top + i3;
        int iE = e();
        int i5 = (screenHeight - height) - iE;
        int i6 = i5 + i4;
        sprig.b.b bVar2 = sprig.b.b.INSTANCE;
        StringBuilder sbB2 = ev6.B(i2, scrollY, "Calculation values: textFieldBottomInWebViewPx=", ", scrollOffset=", ", textFieldBottomInScrollView=");
        sbB2.append(i3);
        sbB2.append(", scrollViewOffsetFromSheetTop=");
        sbB2.append(top);
        sbB2.append(", textFieldBottomFromSheetTop=");
        sbB2.append(i4);
        sbB2.append(", defaultTranslation=");
        sbB2.append(iE);
        sbB2.append(", sheetTopAtDefault=");
        sbB2.append(i5);
        sbB2.append(", textFieldBottomOnScreenAtDefault=");
        sbB2.append(i6);
        String string2 = sbB2.toString();
        SprigLoggingLevel sprigLoggingLevel2 = SprigLoggingLevel.DEBUG;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, string2, sprigLoggingLevel2, 0, 4, null);
        boolean z = i6 > keyboardTop;
        StringBuilder sbB3 = ev6.B(i6, keyboardTop, "Keyboard adjustment calculation: textFieldBottomOnScreenAtDefault=", ", keyboardTop=", ", sheetHeight=");
        sbB3.append(height);
        sbB3.append(", screenHeight=");
        sbB3.append(screenHeight);
        sbB3.append(", defaultTranslation=");
        sbB3.append(iE);
        sbB3.append(", needsAdjustment=");
        sbB3.append(z);
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, sbB3.toString(), sprigLoggingLevel2, 0, 4, null);
        if (i6 <= keyboardTop) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, "No adjustment needed - text field visible above keyboard", sprigLoggingLevel2, 0, 4, null);
            if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() != null) {
                a(0.0f);
            } else if (bottomSheet != null) {
                bottomSheet.setTranslationY(-iE);
            }
            this.currentKeyboardOffsetCssPx = 0;
            h();
            return;
        }
        int i7 = (int) (24.0f * f);
        int i8 = (i6 - keyboardTop) + i7;
        int statusBarHeight = a.getStatusBarHeight(activity);
        int i9 = (screenHeight - keyboardHeight) - statusBarHeight;
        int i10 = i8 > i9 ? i9 : i8;
        if (i10 < 0) {
            i10 = 0;
        }
        boolean z2 = i8 > i9;
        StringBuilder sbB4 = ev6.B(i7, i8, "Adjustment calculation: padding=", ", neededAdjustment=", ", statusBarHeight=");
        sbB4.append(statusBarHeight);
        sbB4.append(", maxAdjustment=");
        sbB4.append(i9);
        sbB4.append(", cappedAdjustment=");
        sbB4.append(i10);
        sbB4.append(", wasCapped=");
        sbB4.append(z2);
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, sbB4.toString(), sprigLoggingLevel2, 0, 4, null);
        if (i10 > screenHeight) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, ev6.s(i10, screenHeight, "cappedAdjustment (", ") > screenHeight (", "). Something is wrong with the calculation. Skipping adjustment."), SprigLoggingLevel.ERROR, 0, 4, null);
            return;
        }
        if (i10 > keyboardHeight) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, ev6.s(i10, keyboardHeight, "cappedAdjustment (", ") > keyboardHeight (", "). Clamping to keyboardHeight."), sprigLoggingLevel2, 0, 4, null);
            i10 = keyboardHeight;
        }
        float fEffectiveMaxHeightRatio = j.INSTANCE.effectiveMaxHeightRatio(activity);
        int i11 = (int) (screenHeight * fEffectiveMaxHeightRatio);
        if (i10 > i11) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, ho2.H(ev6.B(i10, (int) (fEffectiveMaxHeightRatio * 100.0f), "cappedAdjustment (", ") > ", "% of screen ("), i11, "). Clamping to maxReasonableAdjustment."), sprigLoggingLevel2, 0, 4, null);
            i10 = i11;
        }
        StringBuilder sbB5 = ev6.B(i8, i9, "Keyboard adjustment applied: neededAdjustment=", ", maxAdjustment=", ", finalAdjustment=");
        sbB5.append(i10);
        sbB5.append(", statusBarHeight=");
        sbB5.append(statusBarHeight);
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar2, sbB5.toString(), sprigLoggingLevel2, 0, 4, null);
        float f2 = i10;
        a(-f2);
        this.currentKeyboardOffsetCssPx = (int) (f2 / f);
        h();
    }

    public final void b() throws IOException {
        String str;
        String str2;
        g gVar = g.INSTANCE;
        SprigUserInterfaceMode userInterfaceStyle$userleap_release = gVar.getUserInterfaceStyle$userleap_release();
        if (userInterfaceStyle$userleap_release == null) {
            return;
        }
        gVar.applyUserInterfaceStyleToContext$userleap_release();
        if (userInterfaceStyle$userleap_release == SprigUserInterfaceMode.UNSPECIFIED) {
            gVar.getWebView$userleap_release().executeJavascript("(function(){\n    document.documentElement.style.removeProperty('color-scheme');\n    var tag = document.getElementById('sprig-dark-overrides');\n    if (tag) { tag.media = '(prefers-color-scheme: dark)'; }\n})();", null);
            return;
        }
        int[] iArr = C0028b.$EnumSwitchMapping$0;
        int i = iArr[userInterfaceStyle$userleap_release.ordinal()];
        if (i == 1) {
            str = "light";
        } else {
            if (i != 2) {
                if (i == 3) {
                    return;
                }
                ygf.a();
                return;
            }
            str = "dark";
        }
        int i2 = iArr[userInterfaceStyle$userleap_release.ordinal()];
        if (i2 == 1) {
            str2 = "not all";
        } else {
            if (i2 != 2) {
                if (i2 == 3) {
                    return;
                }
                ygf.a();
                return;
            }
            str2 = "all";
        }
        StringBuilder sbU = y30.u("\n        (function(){\n            document.documentElement.style.setProperty('color-scheme', '", str, "', 'important');\n            var tag = document.getElementById('sprig-dark-overrides');\n            if (tag) {\n                tag.media = '", str2, "';\n                return;\n            }\n            for (var i = 0; i < document.styleSheets.length; i++) {\n                try {\n                    var rules = document.styleSheets[i].cssRules;\n                    if (!rules) continue;\n                    for (var j = rules.length - 1; j >= 0; j--) {\n                        if (rules[j].type === 4 && rules[j].media &&\n                            rules[j].media.mediaText.indexOf('prefers-color-scheme') !== -1) {\n                            var css = '';\n                            var inner = rules[j].cssRules;\n                            for (var k = 0; k < inner.length; k++) { css += inner[k].cssText + '\\n'; }\n                            document.styleSheets[i].deleteRule(j);\n                            tag = document.createElement('style');\n                            tag.id = 'sprig-dark-overrides';\n                            tag.media = '");
        sbU.append(str2);
        sbU.append("';\n                            tag.textContent = css;\n                            document.head.appendChild(tag);\n                            return;\n                        }\n                    }\n                } catch(e) {}\n            }\n        })();\n        ");
        gVar.getWebView$userleap_release().executeJavascript(nuc.B(sbU.toString()), null);
    }

    public final void c() {
        Runnable runnable = this.pendingKeyboardAdjustmentRunnable;
        if (runnable != null) {
            this.handler.removeCallbacks(runnable);
            this.pendingKeyboardAdjustmentRunnable = null;
        }
    }

    public final void d() {
        View view;
        ViewTreeObserver viewTreeObserver;
        c();
        Runnable runnable = this.pendingHeightRunnable;
        if (runnable != null) {
            this.handler.removeCallbacks(runnable);
        }
        this.pendingHeightRunnable = null;
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (sprigNestedScrollView != null) {
            sprigNestedScrollView.cancelHeightAnimation();
        }
        ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener = this.keyboardLayoutListener;
        if (onGlobalLayoutListener != null && (view = this.keyboardListenerView) != null && (viewTreeObserver = view.getViewTreeObserver()) != null) {
            viewTreeObserver.removeOnGlobalLayoutListener(onGlobalLayoutListener);
        }
        this.keyboardLayoutListener = null;
        this.keyboardListenerView = null;
        this.isKeyboardCurrentlyVisible = false;
        this.lastConversationalMinHeightCssPx = 0;
        this.currentKeyboardTop = 0;
        this.currentScreenHeight = 0;
        this.currentKeyboardHeight = 0;
        this.currentKeyboardOffsetCssPx = 0;
        this.bottomSheetRef = null;
        this.textFieldRect = null;
        g();
        ViewGroup viewGroup = this.webViewContainer;
        if (viewGroup != null) {
            g.INSTANCE.onViewDestroyed(viewGroup);
        }
        this.webViewContainer = null;
        g.INSTANCE.detachActivityContext$userleap_release();
        this.scrollView = null;
        this.rootView = null;
        cw0 cw0Var = this.dialog;
        if (cw0Var != null) {
            cw0Var.setOnDismissListener(null);
            cw0Var.setOnShowListener(null);
            cw0Var.setOnCancelListener(null);
            try {
                if (cw0Var.isShowing()) {
                    cw0Var.dismiss();
                }
            } catch (Exception unused) {
            }
            try {
                Window window = cw0Var.getWindow();
                if (window != null) {
                    window.clearFlags(16);
                    window.setCallback(null);
                }
            } catch (Exception unused2) {
            }
        }
        this.dialog = null;
        g.INSTANCE.clearSurveySheetReference$userleap_release();
    }

    public final void dismiss() {
        cw0 cw0Var = this.dialog;
        if (cw0Var != null) {
            cw0Var.dismiss();
        }
    }

    public final int e() {
        Activity activityF = f();
        if (activityF == null) {
            return g.INSTANCE.getBottomSafeAreaForScreenDensity();
        }
        if (j.INSTANCE.isPhoneLandscape(activityF)) {
            return 0;
        }
        return Math.max(g.INSTANCE.getBottomSafeAreaForScreenDensity(), this.materialNavBarPaddingPx);
    }

    public final Activity f() {
        return (Activity) this.activityRef.get();
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void g() {
        /*
            r9 = this;
            c1e r0 = defpackage.c1e.a
            android.app.Activity r1 = r9.f()
            r2 = 0
            if (r1 == 0) goto L14
            android.view.Window r1 = r1.getWindow()
            if (r1 == 0) goto L14
            android.view.View r1 = r1.getDecorView()
            goto L15
        L14:
            r1 = r2
        L15:
            boolean r3 = r1 instanceof android.view.ViewGroup
            if (r3 == 0) goto L1c
            android.view.ViewGroup r1 = (android.view.ViewGroup) r1
            goto L1d
        L1c:
            r1 = r2
        L1d:
            android.view.View r3 = r9.scrimView
            if (r3 == 0) goto L2a
            if (r1 == 0) goto L27
            r1.removeView(r3)     // Catch: java.lang.Exception -> L28
            goto L28
        L27:
            r0 = r2
        L28:
            if (r0 != 0) goto L37
        L2a:
            if (r1 == 0) goto L37
            java.lang.String r0 = "sprig_manual_scrim"
            android.view.View r0 = r1.findViewWithTag(r0)
            if (r0 == 0) goto L37
            r1.removeView(r0)     // Catch: java.lang.Exception -> L37
        L37:
            r9.scrimView = r2
            sprig.b.b r3 = sprig.b.b.INSTANCE
            com.userleap.SprigLoggingLevel r5 = com.userleap.SprigLoggingLevel.DEBUG
            r7 = 4
            r8 = 0
            java.lang.String r4 = "Manual scrim removed from DecorView"
            r6 = 0
            sprig.b.b.sendEngineeringLoggingEvent$default(r3, r4, r5, r6, r7, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.i.b.g():void");
    }

    public final void h() {
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (sprigNestedScrollView != null) {
            a(sprigNestedScrollView.getScrollY());
        }
    }

    public final boolean isShowing() {
        cw0 cw0Var = this.dialog;
        return cw0Var != null && cw0Var.isShowing();
    }

    public final void onSurveyHeightReceived(double contentFrameHeight, String layout) {
        Activity activityF = f();
        if (activityF == null) {
            return;
        }
        a((int) Math.ceil(((double) activityF.getResources().getDisplayMetrics().density) * contentFrameHeight), (int) Math.ceil(contentFrameHeight), layout);
    }

    public final void onTextFieldBlurred() {
        FrameLayout frameLayout;
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Text field blurred", null, 0, 6, null);
        this.textFieldRect = null;
        if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() == null) {
            return;
        }
        sprig.b.b.sendLoggingEvent$default(bVar, "Text field blurred - resetting keyboard adjustment (override mode)", SprigLoggingLevel.INFO, 0, 4, null);
        this.isKeyboardCurrentlyVisible = false;
        this.currentKeyboardOffsetCssPx = 0;
        WeakReference weakReference = this.bottomSheetRef;
        if (weakReference == null || (frameLayout = (FrameLayout) weakReference.get()) == null) {
            return;
        }
        ViewParent parent = frameLayout.getParent();
        CoordinatorLayout coordinatorLayout = parent instanceof CoordinatorLayout ? (CoordinatorLayout) parent : null;
        if (coordinatorLayout != null) {
            coordinatorLayout.setTranslationY(0.0f);
        }
        frameLayout.setTranslationY(-e());
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (sprigNestedScrollView != null) {
            a(sprigNestedScrollView.getScrollY());
        }
    }

    public final void onTextFieldFocused(Rect rect) {
        FrameLayout frameLayout;
        Window window;
        FrameLayout frameLayout2;
        rect.getClass();
        if (!g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            this.handler.post(new fhf(this, 0, rect));
            return;
        }
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "onTextFieldFocused called with rect=" + rect + " (on main thread)", SprigLoggingLevel.DEBUG, 0, 4, null);
        this.textFieldRect = rect;
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Text field focused: " + rect, null, 0, 6, null);
        Integer keyboardHeightForSurveyPlacement$userleap_release = g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release();
        if (keyboardHeightForSurveyPlacement$userleap_release == null) {
            if (this.isKeyboardCurrentlyVisible) {
                WeakReference weakReference = this.bottomSheetRef;
                frameLayout = weakReference != null ? (FrameLayout) weakReference.get() : null;
                SprigNestedScrollView sprigNestedScrollView = this.scrollView;
                Activity activityF = f();
                if (frameLayout == null || sprigNestedScrollView == null || activityF == null) {
                    return;
                }
                c();
                sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Re-triggering keyboard adjustment with new textFieldRect", null, 0, 6, null);
                a(frameLayout, rect, sprigNestedScrollView, activityF, this.currentKeyboardTop, this.currentScreenHeight, this.currentKeyboardHeight);
                return;
            }
            return;
        }
        Activity activityF2 = f();
        if (activityF2 == null) {
            return;
        }
        WeakReference weakReference2 = this.bottomSheetRef;
        if (weakReference2 == null || (frameLayout2 = (FrameLayout) weakReference2.get()) == null) {
            cw0 cw0Var = this.dialog;
            View viewFindViewById = (cw0Var == null || (window = cw0Var.getWindow()) == null) ? null : window.findViewById(R.id.design_bottom_sheet);
            frameLayout = viewFindViewById instanceof FrameLayout ? (FrameLayout) viewFindViewById : null;
            if (frameLayout == null) {
                return;
            }
        } else {
            frameLayout = frameLayout2;
        }
        SprigNestedScrollView sprigNestedScrollView2 = this.scrollView;
        if (sprigNestedScrollView2 == null) {
            return;
        }
        float f = activityF2.getResources().getDisplayMetrics().density;
        int i = activityF2.getResources().getDisplayMetrics().heightPixels;
        int iIntValue = (int) (keyboardHeightForSurveyPlacement$userleap_release.intValue() * f);
        int i2 = i - iIntValue;
        this.isKeyboardCurrentlyVisible = true;
        this.currentKeyboardTop = i2;
        this.currentScreenHeight = i;
        this.currentKeyboardHeight = iIntValue;
        sprig.b.b.sendLoggingEvent$default(bVar, "Using keyboard height override: " + keyboardHeightForSurveyPlacement$userleap_release + " (" + iIntValue + "px)", SprigLoggingLevel.INFO, 0, 4, null);
        a(frameLayout, rect, sprigNestedScrollView2, activityF2, i2, i, iIntValue);
    }

    public final void show() throws IOException {
        Window window;
        Activity activityF = f();
        if (activityF == null) {
            return;
        }
        cw0 cw0Var = this.dialog;
        if (cw0Var == null || !cw0Var.isShowing()) {
            g gVar = g.INSTANCE;
            gVar.attachActivityContext$userleap_release(activityF);
            b();
            a((Integer) null);
            try {
                DisplayMetrics displayMetrics = activityF.getResources().getDisplayMetrics();
                int i = displayMetrics.heightPixels;
                float f = displayMetrics.density;
                j jVar = j.INSTANCE;
                int availableScreenHeight = (int) (((int) ((jVar.isPhoneLandscape(activityF) ? jVar.getAvailableScreenHeight(activityF) : (i - a.getStatusBarHeight(activityF)) - e()) * (jVar.isPhoneLandscape(activityF) ? 1.0f : 0.95f))) / f);
                this.lastConversationalMinHeightCssPx = availableScreenHeight;
                gVar.getWebView$userleap_release().updateConversationalMinHeight(availableScreenHeight);
            } catch (UninitializedPropertyAccessException unused) {
            }
            try {
                g gVar2 = g.INSTANCE;
                if (gVar2.getWebView$userleap_release() != null) {
                    h webView$userleap_release = gVar2.getWebView$userleap_release();
                    sprig.b.b bVar = sprig.b.b.INSTANCE;
                    int contentHeight = webView$userleap_release.getContentHeight();
                    int height = webView$userleap_release.getHeight();
                    ViewParent parent = webView$userleap_release.getParent();
                    String simpleName = parent != null ? parent.getClass().getSimpleName() : null;
                    sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "Showing survey sheet - webView.contentHeight=" + contentHeight + ", webView.height=" + height + ", webView.parent=" + simpleName + ", activeSurveyId=" + gVar2.getActiveSurveyId$userleap_release(), null, 0, 6, null);
                } else {
                    sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Showing survey sheet but webView not initialized!", SprigLoggingLevel.ERROR, 0, 4, null);
                }
            } catch (Exception e2) {
                sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error checking webView state: ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            }
            l92 l92Var = new l92(activityF, com.userleap.R.style.userleap_theme);
            View viewInflate = LayoutInflater.from(l92Var).inflate(com.userleap.R.layout.userleap_fragment_webview, (ViewGroup) null, false);
            this.rootView = viewInflate;
            this.scrollView = viewInflate instanceof SprigNestedScrollView ? (SprigNestedScrollView) viewInflate : null;
            this.webViewContainer = (ViewGroup) viewInflate.findViewById(com.userleap.R.id.survey_web_view);
            a(viewInflate);
            final cw0 cw0Var2 = new cw0(l92Var, com.userleap.R.style.userleap_bottom_sheet_dialog_theme);
            cw0Var2.setContentView(viewInflate);
            if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() != null && (window = cw0Var2.getWindow()) != null) {
                window.setSoftInputMode(48);
            }
            cw0Var2.setOnShowListener(new DialogInterface.OnShowListener() { // from class: dhf
                @Override // android.content.DialogInterface.OnShowListener
                public final void onShow(DialogInterface dialogInterface) {
                    b.a(cw0Var2, this, dialogInterface);
                }
            });
            cw0Var2.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: ehf
                @Override // android.content.DialogInterface.OnDismissListener
                public final void onDismiss(DialogInterface dialogInterface) {
                    b.a(this.a, dialogInterface);
                }
            });
            cw0Var2.show();
            this.dialog = cw0Var2;
            a();
            if (this.lastConversationalMinHeightCssPx > 0) {
                a(activityF);
            }
        }
    }

    /* JADX INFO: renamed from: sprig.i.b$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0007\u0010\bR\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\n\u0010\u000bR\u0014\u0010\r\u001a\u00020\f8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00068\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u000f\u0010\b¨\u0006\u0012"}, d2 = {"Lsprig/i/b$a;", "", "Landroid/app/Activity;", "activity", "Lsprig/i/b;", "show", "", "HEIGHT_DEBOUNCE_MS", "J", "", "MIN_VALID_SHEET_HEIGHT", "I", "", "SCRIM_VIEW_TAG", "Ljava/lang/String;", "TEXT_FIELD_RECT_WAIT_MS", "<init>", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final b show(Activity activity) throws IOException {
            activity.getClass();
            b bVar = new b(activity);
            bVar.show();
            return bVar;
        }

        private Companion() {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class e extends co6 implements m45 {
        public e() {
            super(0);
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m176invoke();
            return c1e.a;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m176invoke() {
            b.this.dismiss();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class c extends co6 implements m45 {
        final /* synthetic */ int $contentHeightCssPx;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(int i) {
            super(0);
            this.$contentHeightCssPx = i;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m175invoke() {
            b.this.a(Integer.valueOf(this.$contentHeightCssPx));
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m175invoke();
            return c1e.a;
        }
    }

    public final void b(final FrameLayout bottomSheet) {
        Window window;
        View decorView;
        final View viewFindViewById;
        if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() != null) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ivbZv.Yab, SprigLoggingLevel.INFO, 0, 4, null);
            this.bottomSheetRef = bottomSheet != null ? new WeakReference(bottomSheet) : null;
            return;
        }
        cw0 cw0Var = this.dialog;
        if (cw0Var == null || (window = cw0Var.getWindow()) == null || (decorView = window.getDecorView()) == null || (viewFindViewById = decorView.findViewById(android.R.id.content)) == null) {
            return;
        }
        this.keyboardListenerView = viewFindViewById;
        this.bottomSheetRef = bottomSheet != null ? new WeakReference(bottomSheet) : null;
        final int height = viewFindViewById.getRootView().getHeight();
        this.keyboardLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: bhf
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public final void onGlobalLayout() {
                b.a(viewFindViewById, height, this, bottomSheet);
            }
        };
        viewFindViewById.getViewTreeObserver().addOnGlobalLayoutListener(this.keyboardLayoutListener);
    }

    public static final void b(b bVar) {
        bVar.getClass();
        SprigNestedScrollView sprigNestedScrollView = bVar.scrollView;
        if (sprigNestedScrollView != null) {
            bVar.a(sprigNestedScrollView.getScrollY());
        }
    }

    public static final void a(cw0 cw0Var, b bVar, DialogInterface dialogInterface) {
        cw0Var.getClass();
        bVar.getClass();
        Window window = cw0Var.getWindow();
        View viewFindViewById = window != null ? window.findViewById(R.id.design_bottom_sheet) : null;
        FrameLayout frameLayout = viewFindViewById instanceof FrameLayout ? (FrameLayout) viewFindViewById : null;
        if (frameLayout != null) {
            BottomSheetBehavior bottomSheetBehaviorB = BottomSheetBehavior.B(frameLayout);
            bottomSheetBehaviorB.L(3);
            bottomSheetBehaviorB.K = true;
            bottomSheetBehaviorB.L = false;
            chf chfVar = new chf(bVar);
            WeakHashMap weakHashMap = ute.a;
            mte.c(frameLayout, chfVar);
            frameLayout.setTranslationY(-bVar.e());
        }
        bVar.b(frameLayout);
    }

    public static final void a(b bVar, DialogInterface dialogInterface) {
        bVar.getClass();
        bVar.d();
        g gVar = g.INSTANCE;
        if (gVar.isHandlingConfigChange$userleap_release()) {
            return;
        }
        gVar.dismissSurveyOnExternalTap$userleap_release();
    }

    public static final void a(View view, int i, b bVar, FrameLayout frameLayout) {
        view.getClass();
        bVar.getClass();
        Rect rect = new Rect();
        view.getWindowVisibleDisplayFrame(rect);
        int i2 = i - rect.bottom;
        double d2 = i;
        if (i2 > 0.15d * d2) {
            if (!bVar.isKeyboardCurrentlyVisible || Math.abs(i2 - bVar.currentKeyboardHeight) >= d2 * 0.05d) {
                bVar.isKeyboardCurrentlyVisible = true;
                int i3 = rect.bottom;
                bVar.currentKeyboardTop = i3;
                bVar.currentScreenHeight = i;
                bVar.currentKeyboardHeight = i2;
                bVar.a(frameLayout, i3, i, i2);
                return;
            }
            return;
        }
        bVar.isKeyboardCurrentlyVisible = false;
        bVar.a(frameLayout);
    }

    public final void a(FrameLayout bottomSheet, int keyboardTop, final int screenHeight, int keyboardHeight) {
        f09 f09Var;
        Resources resources;
        DisplayMetrics displayMetrics;
        Activity activityF = f();
        float f = (activityF == null || (resources = activityF.getResources()) == null || (displayMetrics = resources.getDisplayMetrics()) == null) ? 1.0f : displayMetrics.density;
        c();
        Integer keyboardHeightForSurveyPlacement$userleap_release = g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release();
        if (keyboardHeightForSurveyPlacement$userleap_release != null) {
            int iIntValue = keyboardHeightForSurveyPlacement$userleap_release.intValue();
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.w(iIntValue, "Using keyboard height override: "), SprigLoggingLevel.INFO, 0, 4, null);
            int i = (int) (iIntValue * f);
            f09Var = new f09(Integer.valueOf(i), Integer.valueOf(screenHeight - i));
        } else {
            f09Var = new f09(Integer.valueOf(keyboardHeight), Integer.valueOf(keyboardTop));
        }
        final int iIntValue2 = ((Number) f09Var.a).intValue();
        final int iIntValue3 = ((Number) f09Var.b).intValue();
        Rect rect = this.textFieldRect;
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (rect != null && sprigNestedScrollView != null && activityF != null) {
            a(bottomSheet, rect, sprigNestedScrollView, activityF, iIntValue3, screenHeight, iIntValue2);
            return;
        }
        if (sprigNestedScrollView != null && activityF != null) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Keyboard visible but textFieldRect not yet available, waiting 150ms", null, 0, 6, null);
            Runnable runnable = new Runnable() { // from class: ahf
                @Override // java.lang.Runnable
                public final void run() {
                    b.a(this.a, iIntValue3, screenHeight, iIntValue2);
                }
            };
            this.pendingKeyboardAdjustmentRunnable = runnable;
            this.handler.postDelayed(runnable, 150L);
            return;
        }
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Keyboard visible but missing scrollView or activity - keeping default position", SprigLoggingLevel.DEBUG, 0, 4, null);
    }

    public static final void a(b bVar, int i, int i2, int i3) {
        bVar.getClass();
        Rect rect = bVar.textFieldRect;
        SprigNestedScrollView sprigNestedScrollView = bVar.scrollView;
        Activity activityF = bVar.f();
        WeakReference weakReference = bVar.bottomSheetRef;
        FrameLayout frameLayout = weakReference != null ? (FrameLayout) weakReference.get() : null;
        if (rect != null && sprigNestedScrollView != null && activityF != null && frameLayout != null) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "textFieldRect now available, applying precise adjustment", null, 0, 6, null);
            bVar.a(frameLayout, rect, sprigNestedScrollView, activityF, i, i2, i3);
        } else {
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Keyboard visible but textFieldRect still unavailable after 150ms - keeping default position to avoid over-adjustment", SprigLoggingLevel.DEBUG, 0, 4, null);
        }
        bVar.pendingKeyboardAdjustmentRunnable = null;
    }

    public final void a(float translationY) {
        WeakReference weakReference = this.bottomSheetRef;
        FrameLayout frameLayout = weakReference != null ? (FrameLayout) weakReference.get() : null;
        if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() == null) {
            if (frameLayout == null) {
                return;
            }
            frameLayout.setTranslationY(translationY);
            return;
        }
        ViewParent parent = frameLayout != null ? frameLayout.getParent() : null;
        CoordinatorLayout coordinatorLayout = parent instanceof CoordinatorLayout ? (CoordinatorLayout) parent : null;
        if (coordinatorLayout != null) {
            coordinatorLayout.setTranslationY(translationY);
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Applied translation to CoordinatorLayout: " + translationY, SprigLoggingLevel.DEBUG, 0, 4, null);
            return;
        }
        if (frameLayout != null) {
            frameLayout.setTranslationY(translationY);
        }
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Applied translation to BottomSheet (no CoordinatorLayout): " + translationY, SprigLoggingLevel.DEBUG, 0, 4, null);
    }

    public final void a() {
        Activity activityF = f();
        if (activityF == null) {
            return;
        }
        View decorView = activityF.getWindow().getDecorView();
        ViewGroup viewGroup = decorView instanceof ViewGroup ? (ViewGroup) decorView : null;
        if (viewGroup == null) {
            return;
        }
        g();
        View view = new View(activityF);
        view.setTag("sprig_manual_scrim");
        view.setBackgroundColor(1711276032);
        view.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        view.setClickable(false);
        view.setFocusable(false);
        viewGroup.addView(view);
        this.scrimView = view;
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, ev6.w("Manual scrim added to DecorView (API ", Build.VERSION.SDK_INT, ")"), SprigLoggingLevel.DEBUG, 0, 4, null);
    }

    public final void a(FrameLayout bottomSheet) {
        c();
        this.currentKeyboardOffsetCssPx = 0;
        float fE = e();
        if (g.INSTANCE.getKeyboardHeightForSurveyPlacement$userleap_release() != null) {
            ViewParent parent = bottomSheet != null ? bottomSheet.getParent() : null;
            CoordinatorLayout coordinatorLayout = parent instanceof CoordinatorLayout ? (CoordinatorLayout) parent : null;
            if (coordinatorLayout != null) {
                coordinatorLayout.setTranslationY(0.0f);
            }
            if (bottomSheet != null) {
                bottomSheet.setTranslationY(-fE);
            }
        } else if (bottomSheet != null) {
            bottomSheet.setTranslationY(-fE);
        }
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (sprigNestedScrollView != null) {
            a(sprigNestedScrollView.getScrollY());
        }
    }

    public static final void a(b bVar, Rect rect) {
        bVar.getClass();
        rect.getClass();
        bVar.onTextFieldFocused(rect);
    }

    public final void a(Integer height) {
        String strW;
        if (height != null) {
            strW = ev6.w("document.body.style.setProperty('min-height','", height.intValue() + 1, "px','important');(function(){\n    var bg = 'white';\n    var el = document.querySelector('.ul-card__container--mobile');\n    if(el){\n        var computed = getComputedStyle(el).background;\n        if(computed && computed !== 'none'){\n            bg = computed;\n        }\n    }\n    document.body.style.setProperty('background', bg, 'important');\n})();");
        } else {
            strW = "document.body.style.removeProperty('min-height');(function(){\n    var bg = 'white';\n    var el = document.querySelector('.ul-card__container--mobile');\n    if(el){\n        var computed = getComputedStyle(el).background;\n        if(computed && computed !== 'none'){\n            bg = computed;\n        }\n    }\n    document.body.style.setProperty('background', bg, 'important');\n})();";
        }
        g.INSTANCE.getWebView$userleap_release().executeJavascript(strW, null);
    }

    public final void a(int contentHeightDpPx, int contentHeightCssPx, String layout) {
        cw0 cw0Var;
        Window window;
        View viewFindViewById;
        int iE;
        Object obj;
        SprigNestedScrollView sprigNestedScrollView;
        Activity activityF = f();
        if (activityF == null || (cw0Var = this.dialog) == null || (window = cw0Var.getWindow()) == null || (viewFindViewById = window.findViewById(R.id.design_bottom_sheet)) == null) {
            return;
        }
        int i = activityF.getResources().getDisplayMetrics().heightPixels;
        j jVar = j.INSTANCE;
        if (jVar.isPhoneLandscape(activityF)) {
            iE = jVar.getAvailableScreenHeight(activityF);
        } else {
            iE = i - e();
        }
        int i2 = (int) (iE * (jVar.isPhoneLandscape(activityF) ? 1.0f : 0.95f));
        SprigNestedScrollView sprigNestedScrollView2 = this.scrollView;
        ViewGroup.LayoutParams layoutParams = null;
        if (sprigNestedScrollView2 == null) {
            obj = j.CONVERSATIONAL;
        } else {
            int i3 = contentHeightDpPx;
            if (i3 > i2) {
                i3 = i2;
            }
            if (g76.L(layout, j.CONVERSATIONAL)) {
                sprigNestedScrollView2.setMaxHeight(i2);
                sprigNestedScrollView2.setFixedHeight(null);
                g gVar = g.INSTANCE;
                SprigUserInterfaceMode userInterfaceStyle$userleap_release = gVar.getUserInterfaceStyle$userleap_release();
                int i4 = -1;
                int i5 = userInterfaceStyle$userleap_release == null ? -1 : C0028b.$EnumSwitchMapping$0[userInterfaceStyle$userleap_release.ordinal()];
                if (i5 != 1 && (i5 == 2 || (activityF.getResources().getConfiguration().uiMode & 48) == 32)) {
                    i4 = -16777216;
                }
                sprigNestedScrollView2.setBackgroundColor(i4);
                sprigNestedScrollView2.requestLayout();
                int iCeil = (int) Math.ceil(i2 / r5.density);
                int i6 = this.lastConversationalMinHeightCssPx;
                if (i6 > 0) {
                    int i7 = contentHeightCssPx - i6;
                    if (i7 < 0) {
                        i7 = 0;
                    }
                    int i8 = iCeil - i7;
                    if (i8 < 0) {
                        i8 = 0;
                    }
                    this.lastConversationalMinHeightCssPx = i8;
                    a(Integer.valueOf(iCeil));
                    gVar.getWebView$userleap_release().updateConversationalMinHeight(i8);
                } else {
                    a(Integer.valueOf(contentHeightCssPx));
                }
                obj = j.CONVERSATIONAL;
            } else {
                c cVar = new c(contentHeightCssPx);
                obj = j.CONVERSATIONAL;
                SprigNestedScrollView.animateToHeight$default(sprigNestedScrollView2, i3, 0L, cVar, 2, null);
            }
        }
        ViewGroup.LayoutParams layoutParams2 = viewFindViewById.getLayoutParams();
        if (layoutParams2 != null) {
            layoutParams2.height = -2;
            layoutParams = layoutParams2;
        }
        viewFindViewById.setLayoutParams(layoutParams);
        viewFindViewById.requestLayout();
        View view = this.rootView;
        if (view != null) {
            view.requestLayout();
        }
        if (!g76.L(layout, obj) || (sprigNestedScrollView = this.scrollView) == null) {
            return;
        }
        sprigNestedScrollView.postDelayed(new zgf(this, 0), 1000L);
    }

    public static final void a(b bVar) {
        bVar.getClass();
        SprigNestedScrollView sprigNestedScrollView = bVar.scrollView;
        if (sprigNestedScrollView != null) {
            sprigNestedScrollView.fullScroll(NikonType2MakernoteDirectory.TAG_ADAPTER);
        }
        SprigNestedScrollView sprigNestedScrollView2 = bVar.scrollView;
        if (sprigNestedScrollView2 != null) {
            sprigNestedScrollView2.postDelayed(new zgf(bVar, 1), 100L);
        }
    }

    public final void a(Activity activity) {
        SprigNestedScrollView sprigNestedScrollView = this.scrollView;
        if (sprigNestedScrollView != null) {
            sprigNestedScrollView.postDelayed(new fhf(activity, this, 1), 500L);
        }
    }

    public static final void a(Activity activity, b bVar) {
        int maxHeight;
        int i;
        activity.getClass();
        bVar.getClass();
        try {
            g gVar = g.INSTANCE;
            int contentHeight = gVar.getWebView$userleap_release().getContentHeight();
            if (contentHeight <= 0) {
                return;
            }
            float f = activity.getResources().getDisplayMetrics().density;
            if (bVar.scrollView == null || contentHeight <= (maxHeight = (int) (r2.getMaxHeight() / f)) || (i = bVar.lastConversationalMinHeightCssPx) <= 0) {
                return;
            }
            int i2 = contentHeight - i;
            int i3 = 0;
            if (i2 < 0) {
                i2 = 0;
            }
            int i4 = maxHeight - i2;
            if (i4 >= 0) {
                i3 = i4;
            }
            bVar.lastConversationalMinHeightCssPx = i3;
            bVar.a(Integer.valueOf(maxHeight));
            gVar.getWebView$userleap_release().updateConversationalMinHeight(i3);
        } catch (Exception unused) {
        }
    }

    public final void a(View view) {
        Activity activityF = f();
        if (activityF == null) {
            return;
        }
        int i = (int) (20.0f * activityF.getResources().getDisplayMetrics().density);
        j jVar = j.INSTANCE;
        int availableScreenHeight = jVar.getAvailableScreenHeight(activityF) - i;
        if (!jVar.isPhoneLandscape(activityF)) {
            availableScreenHeight -= g.INSTANCE.getBottomSafeAreaForScreenDensity();
        }
        SprigNestedScrollView sprigNestedScrollView = view instanceof SprigNestedScrollView ? (SprigNestedScrollView) view : null;
        if (sprigNestedScrollView != null) {
            sprigNestedScrollView.setMaxHeight(availableScreenHeight);
        }
        float f = activityF.getResources().getDisplayMetrics().density * 6.0f;
        view.setClipToOutline(true);
        view.setOutlineProvider(new d(f));
        SprigNestedScrollView sprigNestedScrollView2 = view instanceof SprigNestedScrollView ? (SprigNestedScrollView) view : null;
        if (sprigNestedScrollView2 != null) {
            sprigNestedScrollView2.setOnScrollChangeListener(new chf(this));
        }
        ViewGroup viewGroup = this.webViewContainer;
        if (viewGroup != null) {
            g.INSTANCE.onViewCreated(viewGroup, new e());
            viewGroup.post(new fhf(view, this, 2));
        }
    }

    public static final void a(b bVar, NestedScrollView nestedScrollView, int i, int i2, int i3, int i4) {
        bVar.getClass();
        nestedScrollView.getClass();
        bVar.a(i2);
    }

    public static final void a(View view, b bVar) {
        view.getClass();
        bVar.getClass();
        SprigNestedScrollView sprigNestedScrollView = view instanceof SprigNestedScrollView ? (SprigNestedScrollView) view : null;
        if (sprigNestedScrollView != null) {
            sprigNestedScrollView.scrollTo(0, 0);
        }
        bVar.a(0);
        view.requestLayout();
    }

    public final void a(int scrollY) {
        Activity activityF = f();
        if (activityF == null) {
            return;
        }
        g.INSTANCE.getWebView$userleap_release().executeJavascript(ev6.s((int) (scrollY / activityF.getResources().getDisplayMetrics().density), this.currentKeyboardOffsetCssPx, "if(window.updateCloseButtonPosition){window.updateCloseButtonPosition(", ",", ");}"), null);
    }

    public static final z4f a(b bVar, View view, z4f z4fVar) {
        bVar.getClass();
        view.getClass();
        z4fVar.getClass();
        int i = z4fVar.a.i(2).d;
        if (i > bVar.materialNavBarPaddingPx) {
            bVar.materialNavBarPaddingPx = i;
            if (!bVar.isKeyboardCurrentlyVisible) {
                view.setTranslationY(-bVar.e());
            }
        }
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), 0);
        return z4fVar;
    }
}
