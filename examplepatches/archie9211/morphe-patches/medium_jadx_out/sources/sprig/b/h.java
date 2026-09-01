package sprig.b;

import android.app.Activity;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.JsonReader;
import android.util.JsonToken;
import android.webkit.JavascriptInterface;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.LinearLayout;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.data.notification.YMl.DtuT;
import com.userleap.R;
import com.userleap.SprigLoggingLevel;
import com.userleap.SurveyState;
import defpackage.b09;
import defpackage.ei7;
import defpackage.ev6;
import defpackage.f09;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i67;
import defpackage.ka1;
import defpackage.muc;
import defpackage.nuc;
import defpackage.qk7;
import defpackage.tuc;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.wk1;
import defpackage.x45;
import defpackage.y1f;
import defpackage.y30;
import defpackage.z1f;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import org.chromium.support_lib_boundary.WebSettingsBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;
import org.json.JSONObject;
import sprig.b.VPIE.dpBiLjNeNsiASg;
import sprig.b.h;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000Y\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\b\u0006*\u0001;\b\u0007\u0018\u0000 ?2\u00020\u0001:\u0004!#&+BK\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0016\b\u0002\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0013\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0011\u0010\u0012J-\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0014\u001a\u00020\u00042\u0016\b\u0002\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u0015¢\u0006\u0004\b\u0018\u0010\u0019J\r\u0010\u001a\u001a\u00020\u0017¢\u0006\u0004\b\u001a\u0010\u001bJ\u0015\u0010\u001d\u001a\u00020\u00172\u0006\u0010\u001c\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0017H\u0014¢\u0006\u0004\b\u001f\u0010\u001bJ\r\u0010 \u001a\u00020\u0017¢\u0006\u0004\b \u0010\u001bJ\u000f\u0010!\u001a\u00020\u0017H\u0002¢\u0006\u0004\b!\u0010\u001bR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b!\u0010\"R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b#\u0010$\u001a\u0004\b%\u0010\u0012R%\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b&\u0010'\u001a\u0004\b(\u0010)R*\u00102\u001a\u0004\u0018\u00010*8\u0000@\u0000X\u0081\u000e¢\u0006\u0018\n\u0004\b+\u0010,\u0012\u0004\b1\u0010\u001b\u001a\u0004\b-\u0010.\"\u0004\b/\u00100R$\u0010:\u001a\u0004\u0018\u0001038\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b4\u00105\u001a\u0004\b6\u00107\"\u0004\b8\u00109R\u0014\u0010>\u001a\u00020;8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b<\u0010=¨\u0006@"}, d2 = {"Lsprig/b/h;", "Landroid/webkit/WebView;", "Landroid/content/Context;", "context", "", "environment", "", "", "configuration", "Lsprig/b/h$d;", "callback", "Lsprig/j/e;", "logger", "", "backgroundColor", "<init>", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lsprig/b/h$d;Lsprig/j/e;I)V", "mobileHeaders$userleap_release", "()Ljava/lang/String;", "mobileHeaders", "javascript", "Lkotlin/Function1;", "Ljava/lang/Void;", "Lc1e;", "executeJavascript", "(Ljava/lang/String;Lx45;)V", "applyAlgorithmicDarkening", "()V", "minHeightCssPx", "updateConversationalMinHeight", "(I)V", "onDetachedFromWindow", "stopAnyCurrentActivity", "a", "Lsprig/j/e;", "b", "Ljava/lang/String;", "getEnvironment", "c", "Ljava/util/Map;", "getConfiguration", "()Ljava/util/Map;", "Lsprig/b/h$c;", "d", "Lsprig/b/h$c;", "getLastJSMessage$userleap_release", "()Lsprig/b/h$c;", "setLastJSMessage$userleap_release", "(Lsprig/b/h$c;)V", "getLastJSMessage$userleap_release$annotations", "lastJSMessage", "Lsprig/b/h$b;", "e", "Lsprig/b/h$b;", "getDismissOnPageChangeListener", "()Lsprig/b/h$b;", "setDismissOnPageChangeListener", "(Lsprig/b/h$b;)V", "dismissOnPageChangeListener", "sprig/b/h$e", "f", "Lsprig/b/h$e;", "javascriptInterface", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class h extends WebView {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final sprig.j.e logger;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final String environment;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final Map configuration;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public c lastJSMessage;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public b dismissOnPageChangeListener;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public final e javascriptInterface;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lsprig/b/h$b;", "", "", "dismiss", "Lc1e;", "shouldDismissOnPageChange", "(Z)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public interface b {
        void shouldDismissOnPageChange(boolean dismiss);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\f\b\u0080\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u0012\u0006\u0010\b\u001a\u00020\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0004\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0002HÆ\u0003J'\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u0002HÆ\u0001J\t\u0010\n\u001a\u00020\u0002HÖ\u0001J\t\u0010\f\u001a\u00020\u000bHÖ\u0001J\u0013\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0011\u001a\u0004\b\u0015\u0010\u0013R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010\u0011\u001a\u0004\b\u0017\u0010\u0013¨\u0006\u001a"}, d2 = {"Lsprig/b/h$c;", "", "", "component1", "component2", "component3", "type", "level", "message", "copy", "toString", "", "hashCode", "other", "", "equals", "a", "Ljava/lang/String;", "getType", "()Ljava/lang/String;", "b", "getLevel", "c", "getMessage", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class c {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final String type;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final String level;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final String message;

        public c(String str, String str2, String str3) {
            b09.I(str, str2, str3);
            this.type = str;
            this.level = str2;
            this.message = str3;
        }

        public static /* synthetic */ c copy$default(c cVar, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = cVar.type;
            }
            if ((i & 2) != 0) {
                str2 = cVar.level;
            }
            if ((i & 4) != 0) {
                str3 = cVar.message;
            }
            return cVar.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getLevel() {
            return this.level;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final c copy(String type, String level, String message) {
            type.getClass();
            level.getClass();
            message.getClass();
            return new c(type, level, message);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof c)) {
                return false;
            }
            c cVar = (c) other;
            return g76.L(this.type, cVar.type) && g76.L(this.level, cVar.level) && g76.L(this.message, cVar.message);
        }

        public final String getLevel() {
            return this.level;
        }

        public final String getMessage() {
            return this.message;
        }

        public final String getType() {
            return this.type;
        }

        public int hashCode() {
            return this.message.hashCode() + wgd.o(this.type.hashCode() * 31, 31, this.level);
        }

        public String toString() {
            String str = this.type;
            String str2 = this.level;
            return ka1.v(y30.u("JSConsoleMessage(type=", str, ", level=", str2, ", message="), this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0011\bf\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0005\u0010\u0006J\u001f\u0010\b\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\b\u0010\tJ\u0017\u0010\n\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\n\u0010\u0006J\u0017\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u000b\u0010\u0006J'\u0010\u000f\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u000f\u0010\u0010J\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0011\u0010\u0006J\u0017\u0010\u0012\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0012\u0010\u0006J\u0017\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0013\u0010\u0006J\u0017\u0010\u0014\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0014\u0010\u0006J\u001f\u0010\u0017\u001a\u00020\u00042\u0006\u0010\u0015\u001a\u00020\u00022\u0006\u0010\u0016\u001a\u00020\u0002H&¢\u0006\u0004\b\u0017\u0010\tJ\u0017\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0018\u0010\u0006J\u0017\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0019\u0010\u0006J\u0017\u0010\u001a\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u001a\u0010\u0006J\u0017\u0010\u001b\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u001b\u0010\u0006J\u000f\u0010\u001c\u001a\u00020\u0004H&¢\u0006\u0004\b\u001c\u0010\u001d¨\u0006\u001e"}, d2 = {"Lsprig/b/h$d;", "", "", "data", "Lc1e;", "onSdkReady", "(Ljava/lang/String;)V", "id", "onVisitorIdUpdated", "(Ljava/lang/String;Ljava/lang/String;)V", "onSurveyWillPresent", "onSurveyPresented", "callbackId", "Lcom/userleap/SurveyState;", "state", "onSurveyCallback", "(Ljava/lang/String;Lcom/userleap/SurveyState;Ljava/lang/String;)V", "onSurveyWillClose", "onSurveyClosed", "onDismissSurvey", "onAppearSurvey", "name", "event", "onEvent", "onScheduleOrCaptureReplay", "onSurveyHeight", "onSurveyWidth", "onTextFieldFocused", "onTextFieldBlurred", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public interface d {
        void onAppearSurvey(String data);

        void onDismissSurvey(String data);

        void onEvent(String name, String event);

        void onScheduleOrCaptureReplay(String data);

        void onSdkReady(String data);

        void onSurveyCallback(String callbackId, SurveyState state, String data);

        void onSurveyClosed(String data);

        void onSurveyHeight(String data);

        void onSurveyPresented(String data);

        void onSurveyWidth(String data);

        void onSurveyWillClose(String data);

        void onSurveyWillPresent(String data);

        void onTextFieldBlurred();

        void onTextFieldFocused(String data);

        void onVisitorIdUpdated(String id, String data);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(Context context, String str, Map<String, ? extends Object> map, d dVar, sprig.j.e eVar, int i) {
        super(context);
        context.getClass();
        str.getClass();
        dVar.getClass();
        eVar.getClass();
        this.logger = eVar;
        this.configuration = map;
        e eVar2 = new e(dVar, str, this);
        this.javascriptInterface = eVar2;
        setVerticalScrollBarEnabled(false);
        setHorizontalScrollBarEnabled(false);
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendLoggingEvent$default(bVar, "Initializing SprigWebView for environment ".concat(str), null, 0, 6, null);
        if (context instanceof MutableContextWrapper) {
            MutableContextWrapper mutableContextWrapper = (MutableContextWrapper) context;
            sprig.b.b.sendLoggingEvent$default(bVar, "Using mutable context " + context + " (" + mutableContextWrapper.getBaseContext() + ")", null, 1, 2, null);
            boolean z = mutableContextWrapper.getBaseContext() instanceof Activity;
            StringBuilder sb = new StringBuilder("Is activity: ");
            sb.append(z);
            sprig.b.b.sendVerboseLoggingEvent$default(bVar, sb.toString(), null, 2, 2, null);
        } else {
            SprigLoggingLevel sprigLoggingLevel = SprigLoggingLevel.WARNING;
            bVar.sendLoggingEvent("Using context " + context, sprigLoggingLevel, 1);
            bVar.sendVerboseLoggingEvent("Is activity: " + (context instanceof Activity), sprigLoggingLevel, 2);
        }
        setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        this.environment = str;
        clearCache(true);
        WebView.setWebContentsDebuggingEnabled(false);
        getSettings().setSupportZoom(true);
        getSettings().setBuiltInZoomControls(false);
        getSettings().setDisplayZoomControls(false);
        setScrollbarFadingEnabled(true);
        getSettings().setJavaScriptEnabled(true);
        getSettings().setDomStorageEnabled(true);
        measure(100, 100);
        getSettings().setUseWideViewPort(true);
        getSettings().setLoadWithOverviewMode(true);
        addJavascriptInterface(eVar2, "android_hook");
        setWebViewClient(f.INSTANCE);
        a();
        setBackgroundColor(i);
    }

    public static /* synthetic */ void executeJavascript$default(h hVar, String str, x45 x45Var, int i, Object obj) {
        if ((i & 2) != 0) {
            x45Var = null;
        }
        hVar.executeJavascript(str, x45Var);
    }

    public static /* synthetic */ void getLastJSMessage$userleap_release$annotations() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2, types: [android.webkit.WebView] */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4 */
    public final void a() {
        ?? r1 = "\n</body>";
        try {
            InputStream inputStreamOpen = getContext().getAssets().open("snippet.html");
            inputStreamOpen.getClass();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpen, wk1.a), 8192);
            try {
                try {
                    String strY = qk7.y(bufferedReader);
                    bufferedReader.close();
                    DisplayMetrics displayMetrics = getContext().getResources().getDisplayMetrics();
                    int i = displayMetrics.heightPixels;
                    float f = displayMetrics.density;
                    int bottomSafeAreaForScreenDensity = i - g.INSTANCE.getBottomSafeAreaForScreenDensity();
                    Context context = getContext();
                    context.getClass();
                    int statusBarHeight = bottomSafeAreaForScreenDensity - sprig.i.a.getStatusBarHeight(context);
                    getContext().getClass();
                    String str = "<style>\n" + (".ul-conversational-ui {min-height: " + ((int) (((int) ((statusBarHeight - (sprig.i.a.getNavigationBarHeight(r7) * 2)) * 0.95f)) / f)) + "px !important;}") + "\n</style>";
                    loadDataWithBaseURL("file:///android_asset/", muc.Q(strY, "</body>", true) ? tuc.L(strY, "</body>", str.concat("\n</body>")) : strY.concat(str), "text/html", "utf-8", null);
                } finally {
                }
            } catch (Exception e2) {
                e = e2;
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Failed to inject custom CSS into snippet.html: ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
                r1.loadUrl("file:///android_asset/snippet.html");
            }
        } catch (Exception e3) {
            e = e3;
            r1 = this;
        }
    }

    public final void applyAlgorithmicDarkening() {
        try {
            if (y1f.a()) {
                WebSettings settings = getSettings();
                if (!y1f.a.b()) {
                    throw new UnsupportedOperationException("This method is not supported by the current version of the framework and the current WebView APK");
                }
                ((WebSettingsBoundaryInterface) vx0.H(WebSettingsBoundaryInterface.class, ((WebkitToCompatConverterBoundaryInterface) z1f.a.b).convertSettings(settings))).setAlgorithmicDarkeningAllowed(true);
            }
        } catch (Throwable th) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Algorithmic darkening not supported: ", th.getMessage()), SprigLoggingLevel.WARNING, 0, 4, null);
        }
    }

    public final void executeJavascript(final String javascript, final x45 callback) {
        javascript.getClass();
        final sprig.j.e eVar = this.logger;
        final c cVar = this.lastJSMessage;
        evaluateJavascript(javascript, new ValueCallback() { // from class: eif
            @Override // android.webkit.ValueCallback
            public final void onReceiveValue(Object obj) {
                h.a(callback, eVar, javascript, cVar, (String) obj);
            }
        });
    }

    public final Map<String, Object> getConfiguration() {
        return this.configuration;
    }

    public final b getDismissOnPageChangeListener() {
        return this.dismissOnPageChangeListener;
    }

    public final String getEnvironment() {
        return this.environment;
    }

    /* JADX INFO: renamed from: getLastJSMessage$userleap_release, reason: from getter */
    public final c getLastJSMessage() {
        return this.lastJSMessage;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (g.INSTANCE.isHandlingConfigChange$userleap_release()) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Skipping WebView cleanup - config change in progress", null, 0, 6, null);
        } else {
            stopAnyCurrentActivity();
        }
    }

    public final void setDismissOnPageChangeListener(b bVar) {
        this.dismissOnPageChangeListener = bVar;
    }

    public final void setLastJSMessage$userleap_release(c cVar) {
        this.lastJSMessage = cVar;
    }

    public final void stopAnyCurrentActivity() {
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Stopping any current h activity", null, 0, 6, null);
        stopLoading();
    }

    public final void updateConversationalMinHeight(int minHeightCssPx) {
        executeJavascript(nuc.B("\n            (function(){\n                var el = document.querySelector('.ul-conversational-ui');\n                if(el){ el.style.setProperty('min-height','" + minHeightCssPx + "px','important'); }\n            })();\n        "), null);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001f\n\u0000\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u000e*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0005\u0010\u0006J\u001f\u0010\b\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\b\u0010\tJ\u0017\u0010\n\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\n\u0010\u0006J\u0017\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u000b\u0010\u0006J'\u0010\u000e\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0010\u0010\u0006J\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0011\u0010\u0006J\u0017\u0010\u0012\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0012\u0010\u0006J\u0017\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0013\u0010\u0006J\u000f\u0010\u0014\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0017\u001a\u00020\u0016H\u0007¢\u0006\u0004\b\u0018\u0010\u0019J\u001f\u0010\u001c\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u001c\u0010\tJ\u0017\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u001d\u0010\u0006J\u0017\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u001e\u0010\u0006J\u0017\u0010\u001f\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b\u001f\u0010\u0006J\u0017\u0010 \u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b \u0010\u0006J\u0017\u0010!\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0007¢\u0006\u0004\b!\u0010\u0006J\u000f\u0010\"\u001a\u00020\u0004H\u0007¢\u0006\u0004\b\"\u0010#¨\u0006$"}, d2 = {"sprig/b/h$e", "", "", "data", "Lc1e;", "sdkReady", "(Ljava/lang/String;)V", "vid", "visitorIdUpdated", "(Ljava/lang/String;Ljava/lang/String;)V", "surveyWillPresent", "surveyPresented", "callbackId", "callbackValue", "surveyCallback", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "surveyWillDismiss", "surveyWillAppear", "surveyWillClose", "surveyClosed", "environment", "()Ljava/lang/String;", "", "dismiss", "getDismissOnPageChange", "(Z)V", "name", "event", "onSdkEvent", "scheduleOrCaptureReplay", "surveyHeight", "surveyWidth", "postJSConsoleMessage", "textFieldFocused", "textFieldBlurred", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class e {
        final /* synthetic */ d $callback;
        final /* synthetic */ String $environment;
        final /* synthetic */ h this$0;

        public e(d dVar, String str, h hVar) {
            this.$callback = dVar;
            this.$environment = str;
            this.this$0 = hVar;
        }

        @JavascriptInterface
        /* JADX INFO: renamed from: environment, reason: from getter */
        public final String get$environment() {
            return this.$environment;
        }

        @JavascriptInterface
        public final void getDismissOnPageChange(boolean dismiss) {
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, String.valueOf(dismiss), "getDismissOnPageChange", null, false, 12, null);
            b dismissOnPageChangeListener = this.this$0.getDismissOnPageChangeListener();
            if (dismissOnPageChangeListener != null) {
                dismissOnPageChangeListener.shouldDismissOnPageChange(dismiss);
            }
        }

        @JavascriptInterface
        public final void onSdkEvent(String name, String event) {
            name.getClass();
            event.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, ev6.x(name, ": ", event), "onSdkEvent", null, false, 12, null);
            this.$callback.onEvent(name, event);
        }

        @JavascriptInterface
        public final void scheduleOrCaptureReplay(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "scheduleOrCaptureReplay", null, false, 12, null);
            this.$callback.onScheduleOrCaptureReplay(data);
        }

        @JavascriptInterface
        public final void sdkReady(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "sdkReady", null, false, 12, null);
            this.$callback.onSdkReady(data);
        }

        @JavascriptInterface
        public final void surveyCallback(String callbackId, String callbackValue, String data) {
            b09.I(callbackId, callbackValue, data);
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, ev6.y(callbackId, ":", callbackValue, ": data: ", data), "surveyCallback", null, false, 12, null);
            this.$callback.onSurveyCallback(callbackId, sprig.a.b.a(callbackValue), data);
        }

        @JavascriptInterface
        public final void surveyClosed(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyClosed", null, false, 12, null);
            this.$callback.onSurveyClosed(data);
        }

        @JavascriptInterface
        public final void surveyHeight(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyHeight", null, false, 12, null);
            this.$callback.onSurveyHeight(data);
        }

        @JavascriptInterface
        public final void surveyPresented(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyPresented", null, false, 12, null);
            this.$callback.onSurveyPresented(data);
        }

        @JavascriptInterface
        public final void surveyWidth(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyWidth", null, false, 12, null);
            this.$callback.onSurveyWidth(data);
        }

        @JavascriptInterface
        public final void surveyWillAppear(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyWillAppear", null, false, 12, null);
            this.$callback.onAppearSurvey(data);
        }

        @JavascriptInterface
        public final void surveyWillClose(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyWillClose", null, false, 12, null);
            this.$callback.onSurveyWillClose(data);
        }

        @JavascriptInterface
        public final void surveyWillDismiss(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyWillDismiss", null, false, 12, null);
            this.$callback.onDismissSurvey(data);
        }

        @JavascriptInterface
        public final void surveyWillPresent(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "surveyWillPresent", null, false, 12, null);
            this.$callback.onSurveyWillPresent(data);
        }

        @JavascriptInterface
        public final void textFieldBlurred() {
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, null, "textFieldBlurred", null, false, 12, null);
            this.$callback.onTextFieldBlurred();
        }

        @JavascriptInterface
        public final void textFieldFocused(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "textFieldFocused", null, false, 12, null);
            this.$callback.onTextFieldFocused(data);
        }

        @JavascriptInterface
        public final void visitorIdUpdated(String vid, String data) {
            vid.getClass();
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "visitorIdUpdated", null, false, 12, null);
            this.$callback.onVisitorIdUpdated(vid, data);
        }

        @JavascriptInterface
        public final void postJSConsoleMessage(String data) {
            data.getClass();
            sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "postJSConsoleMessage", null, false, 12, null);
            JSONObject jSONObject = new JSONObject(data);
            h hVar = this.this$0;
            try {
                String string = jSONObject.getString("type");
                string.getClass();
                String string2 = jSONObject.getString("level");
                string2.getClass();
                String string3 = jSONObject.getString(DtuT.fCGVaoVOCLhXVGU);
                string3.getClass();
                hVar.setLastJSMessage$userleap_release(new c(string, string2, string3));
            } catch (Throwable unused) {
            }
        }
    }

    public final String mobileHeaders$userleap_release() {
        Object obj;
        Object obj2;
        String str = getContext().getPackageManager().getPackageInfo(getContext().getPackageName(), 0).versionName;
        String str2 = "Unknown";
        if (str == null) {
            str = "Unknown";
        }
        String str3 = Build.VERSION.RELEASE;
        if (str3 != null) {
            str2 = str3;
        }
        String strValueOf = String.valueOf(Build.VERSION.SDK_INT);
        LinkedHashMap linkedHashMapR = ei7.R(new f09("userleap-platform", "android"), new f09("x-ul-mobile-user-agent", ka1.v(y30.u("UserLeap/android;Version=2.25.0;OSVersion=", str2, ";OSAPILevel=", strValueOf, "AppVersion="), str, ";")), new f09("x-ul-mobile-sdk-version", "2.25.0"), new f09(dpBiLjNeNsiASg.xQQDF, str), new f09("x-ul-os-version", str2), new f09("x-ul-os-api-level", strValueOf), new f09("x-ul-environment", this.environment), new f09("accept-language", i67.c().a.a()));
        Map map = this.configuration;
        if (map != null && (obj2 = map.get("x-ul-installation-method")) != null) {
        }
        Map map2 = this.configuration;
        if (map2 != null && (obj = map2.get("x-ul-package-version")) != null) {
        }
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Gathered mobile headers for server: " + linkedHashMapR, null, 0, 6, null);
        String string = new JSONObject(linkedHashMapR).toString();
        string.getClass();
        return string;
    }

    public static final void a(x45 x45Var, sprig.j.e eVar, String str, c cVar, String str2) {
        eVar.getClass();
        str.getClass();
        JsonReader jsonReader = new JsonReader(new StringReader(str2));
        jsonReader.setLenient(true);
        try {
            try {
                try {
                    JsonToken jsonTokenPeek = jsonReader.peek();
                    if (jsonTokenPeek != JsonToken.NULL && jsonTokenPeek == JsonToken.STRING) {
                        String strNextString = jsonReader.nextString();
                        strNextString.getClass();
                        if (x45Var != null) {
                        }
                    }
                    jsonReader.close();
                } catch (Throwable th) {
                    try {
                        jsonReader.close();
                    } catch (IOException unused) {
                    }
                    throw th;
                }
            } catch (IOException e2) {
                sprig.j.e.logError$default(eVar, "Error evaluating javascript", null, nuc.B("\n                        Javascript was: " + str + ".\n                        Error message: " + e2.getMessage() + ".\n                        Last console message: " + (cVar != null ? cVar.getMessage() : null) + PdtluglzAX.ZGoRWtVp + (cVar != null ? cVar.getLevel() : null) + ".\n                    "), null, null, null, 58, null);
                sprig.b.b bVar = sprig.b.b.INSTANCE;
                String message = e2.getMessage();
                StringBuilder sb = new StringBuilder("Error evaluating javascript: ");
                sb.append(message);
                sprig.b.b.sendVerboseLoggingEvent$default(bVar, sb.toString(), SprigLoggingLevel.ERROR, 0, 4, null);
                jsonReader.close();
            }
        } catch (IOException unused2) {
        }
    }

    public h(Context context, String str, Map map, d dVar, sprig.j.e eVar, int i, int i2, gy2 gy2Var) {
        this(context, str, (i2 & 4) != 0 ? null : map, dVar, (i2 & 16) != 0 ? new sprig.j.e() : eVar, (i2 & 32) != 0 ? context.getColor(R.color.userleap_transparent) : i);
    }
}
