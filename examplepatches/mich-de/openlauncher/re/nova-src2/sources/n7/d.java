package n7;

import android.net.Uri;
import android.webkit.WebView;
import androidx.webkit.WebViewFeature;
import androidx.webkit.WebViewStartUpConfig;
import com.amplitude.y4;
import java.lang.reflect.InvocationHandler;
import java.net.URLConnection;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.chromium.support_lib_boundary.JsReplyProxyBoundaryInterface;
import org.chromium.support_lib_boundary.ProfileBoundaryInterface;
import org.chromium.support_lib_boundary.ProfileStoreBoundaryInterface;
import org.chromium.support_lib_boundary.ScriptHandlerBoundaryInterface;
import org.chromium.support_lib_boundary.WebMessageBoundaryInterface;
import org.chromium.support_lib_boundary.WebMessageCallbackBoundaryInterface;
import org.chromium.support_lib_boundary.WebMessageListenerBoundaryInterface;
import org.chromium.support_lib_boundary.WebViewStartUpConfigBoundaryInterface;

/* loaded from: classes2.dex */
public final class d implements m7.g, WebMessageCallbackBoundaryInterface, WebMessageListenerBoundaryInterface, WebViewStartUpConfigBoundaryInterface {

    /* renamed from: c, reason: collision with root package name */
    public static d f77912c;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77913a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f77914b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f77913a = i5;
        this.f77914b = obj;
    }

    public static d a() {
        if (!w.f77954q.b()) {
            throw w.a();
        }
        if (f77912c == null) {
            f77912c = new d(y.f77965a.getProfileStore(), 1);
        }
        return f77912c;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x02ca  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String c(String str) {
        String strGuessContentTypeFromName = URLConnection.guessContentTypeFromName(str);
        if (strGuessContentTypeFromName == null) {
            char c11 = '.';
            int iLastIndexOf = str.lastIndexOf(46);
            if (iLastIndexOf != -1) {
                String lowerCase = str.substring(iLastIndexOf + 1).toLowerCase();
                lowerCase.getClass();
                switch (lowerCase.hashCode()) {
                    case 3315:
                        if (!lowerCase.equals("gz")) {
                            c11 = 65535;
                            break;
                        } else {
                            c11 = 0;
                            break;
                        }
                    case 3401:
                        if (lowerCase.equals("js")) {
                            c11 = 1;
                            break;
                        }
                        break;
                    case 97669:
                        if (lowerCase.equals("bmp")) {
                            c11 = 2;
                            break;
                        }
                        break;
                    case 98819:
                        if (lowerCase.equals("css")) {
                            c11 = 3;
                            break;
                        }
                        break;
                    case 102340:
                        if (lowerCase.equals("gif")) {
                            c11 = 4;
                            break;
                        }
                        break;
                    case 103649:
                        if (lowerCase.equals("htm")) {
                            c11 = 5;
                            break;
                        }
                        break;
                    case 104085:
                        if (lowerCase.equals("ico")) {
                            c11 = 6;
                            break;
                        }
                        break;
                    case 105441:
                        if (lowerCase.equals("jpg")) {
                            c11 = 7;
                            break;
                        }
                        break;
                    case 106458:
                        if (lowerCase.equals("m4a")) {
                            c11 = '\b';
                            break;
                        }
                        break;
                    case 106479:
                        if (lowerCase.equals("m4v")) {
                            c11 = '\t';
                            break;
                        }
                        break;
                    case 108089:
                        if (lowerCase.equals("mht")) {
                            c11 = '\n';
                            break;
                        }
                        break;
                    case 108150:
                        if (lowerCase.equals("mjs")) {
                            c11 = 11;
                            break;
                        }
                        break;
                    case 108272:
                        if (lowerCase.equals("mp3")) {
                            c11 = '\f';
                            break;
                        }
                        break;
                    case 108273:
                        if (lowerCase.equals("mp4")) {
                            c11 = '\r';
                            break;
                        }
                        break;
                    case 108324:
                        if (lowerCase.equals("mpg")) {
                            c11 = 14;
                            break;
                        }
                        break;
                    case 109961:
                        if (lowerCase.equals("oga")) {
                            c11 = 15;
                            break;
                        }
                        break;
                    case 109967:
                        if (lowerCase.equals("ogg")) {
                            c11 = 16;
                            break;
                        }
                        break;
                    case 109973:
                        if (lowerCase.equals("ogm")) {
                            c11 = 17;
                            break;
                        }
                        break;
                    case 109982:
                        if (lowerCase.equals("ogv")) {
                            c11 = 18;
                            break;
                        }
                        break;
                    case 110834:
                        if (lowerCase.equals("pdf")) {
                            c11 = 19;
                            break;
                        }
                        break;
                    case 111030:
                        if (lowerCase.equals("pjp")) {
                            c11 = 20;
                            break;
                        }
                        break;
                    case 111145:
                        if (lowerCase.equals("png")) {
                            c11 = 21;
                            break;
                        }
                        break;
                    case 114276:
                        if (lowerCase.equals("svg")) {
                            c11 = 22;
                            break;
                        }
                        break;
                    case 114791:
                        if (lowerCase.equals("tgz")) {
                            c11 = 23;
                            break;
                        }
                        break;
                    case 114833:
                        if (lowerCase.equals("tif")) {
                            c11 = 24;
                            break;
                        }
                        break;
                    case 117484:
                        if (lowerCase.equals("wav")) {
                            c11 = 25;
                            break;
                        }
                        break;
                    case 118660:
                        if (lowerCase.equals("xht")) {
                            c11 = 26;
                            break;
                        }
                        break;
                    case 118807:
                        if (lowerCase.equals("xml")) {
                            c11 = 27;
                            break;
                        }
                        break;
                    case 120609:
                        if (lowerCase.equals("zip")) {
                            c11 = 28;
                            break;
                        }
                        break;
                    case 3000872:
                        if (lowerCase.equals("apng")) {
                            c11 = 29;
                            break;
                        }
                        break;
                    case 3145576:
                        if (lowerCase.equals("flac")) {
                            c11 = 30;
                            break;
                        }
                        break;
                    case 3213227:
                        if (lowerCase.equals("html")) {
                            c11 = 31;
                            break;
                        }
                        break;
                    case 3259225:
                        if (lowerCase.equals("jfif")) {
                            c11 = ' ';
                            break;
                        }
                        break;
                    case 3268712:
                        if (lowerCase.equals("jpeg")) {
                            c11 = '!';
                            break;
                        }
                        break;
                    case 3271912:
                        if (lowerCase.equals("json")) {
                            c11 = AbstractJsonLexerKt.STRING;
                            break;
                        }
                        break;
                    case 3358085:
                        if (lowerCase.equals("mpeg")) {
                            c11 = '#';
                            break;
                        }
                        break;
                    case 3418175:
                        if (lowerCase.equals("opus")) {
                            c11 = '$';
                            break;
                        }
                        break;
                    case 3529614:
                        if (lowerCase.equals("shtm")) {
                            c11 = '%';
                            break;
                        }
                        break;
                    case 3542678:
                        if (lowerCase.equals("svgz")) {
                            c11 = '&';
                            break;
                        }
                        break;
                    case 3559925:
                        if (lowerCase.equals("tiff")) {
                            c11 = '\'';
                            break;
                        }
                        break;
                    case 3642020:
                        if (lowerCase.equals("wasm")) {
                            c11 = '(';
                            break;
                        }
                        break;
                    case 3645337:
                        if (lowerCase.equals("webm")) {
                            c11 = ')';
                            break;
                        }
                        break;
                    case 3645340:
                        if (lowerCase.equals("webp")) {
                            c11 = '*';
                            break;
                        }
                        break;
                    case 3655064:
                        if (lowerCase.equals("woff")) {
                            c11 = '+';
                            break;
                        }
                        break;
                    case 3678569:
                        if (lowerCase.equals("xhtm")) {
                            c11 = AbstractJsonLexerKt.COMMA;
                            break;
                        }
                        break;
                    case 96488848:
                        if (lowerCase.equals("ehtml")) {
                            c11 = '-';
                            break;
                        }
                        break;
                    case 103877016:
                        if (!lowerCase.equals("mhtml")) {
                        }
                        break;
                    case 106703064:
                        if (lowerCase.equals("pjpeg")) {
                            c11 = '/';
                            break;
                        }
                        break;
                    case 109418142:
                        if (lowerCase.equals("shtml")) {
                            c11 = '0';
                            break;
                        }
                        break;
                    case 114035747:
                        if (lowerCase.equals("xhtml")) {
                            c11 = '1';
                            break;
                        }
                        break;
                }
                switch (c11) {
                    case 0:
                    case 23:
                        strGuessContentTypeFromName = "application/gzip";
                        break;
                    case 1:
                    case 11:
                        strGuessContentTypeFromName = "text/javascript";
                        break;
                    case 2:
                        strGuessContentTypeFromName = "image/bmp";
                        break;
                    case 3:
                        strGuessContentTypeFromName = "text/css";
                        break;
                    case 4:
                        strGuessContentTypeFromName = "image/gif";
                        break;
                    case 5:
                    case 31:
                    case '%':
                    case '-':
                    case '0':
                        strGuessContentTypeFromName = "text/html";
                        break;
                    case 6:
                        strGuessContentTypeFromName = "image/x-icon";
                        break;
                    case 7:
                    case 20:
                    case ' ':
                    case '!':
                    case '/':
                        strGuessContentTypeFromName = "image/jpeg";
                        break;
                    case '\b':
                        strGuessContentTypeFromName = "audio/x-m4a";
                        break;
                    case '\t':
                    case '\r':
                        strGuessContentTypeFromName = "video/mp4";
                        break;
                    case '\n':
                    case '.':
                        strGuessContentTypeFromName = "multipart/related";
                        break;
                    case '\f':
                        strGuessContentTypeFromName = "audio/mpeg";
                        break;
                    case 14:
                    case '#':
                        strGuessContentTypeFromName = "video/mpeg";
                        break;
                    case 15:
                    case 16:
                    case '$':
                        strGuessContentTypeFromName = "audio/ogg";
                        break;
                    case 17:
                    case 18:
                        strGuessContentTypeFromName = "video/ogg";
                        break;
                    case 19:
                        strGuessContentTypeFromName = "application/pdf";
                        break;
                    case 21:
                        strGuessContentTypeFromName = "image/png";
                        break;
                    case 22:
                    case '&':
                        strGuessContentTypeFromName = "image/svg+xml";
                        break;
                    case 24:
                    case '\'':
                        strGuessContentTypeFromName = "image/tiff";
                        break;
                    case 25:
                        strGuessContentTypeFromName = "audio/wav";
                        break;
                    case 26:
                    case ',':
                    case '1':
                        strGuessContentTypeFromName = "application/xhtml+xml";
                        break;
                    case 27:
                        strGuessContentTypeFromName = "text/xml";
                        break;
                    case 28:
                        strGuessContentTypeFromName = "application/zip";
                        break;
                    case 29:
                        strGuessContentTypeFromName = "image/apng";
                        break;
                    case 30:
                        strGuessContentTypeFromName = "audio/flac";
                        break;
                    case '\"':
                        strGuessContentTypeFromName = "application/json";
                        break;
                    case '(':
                        strGuessContentTypeFromName = "application/wasm";
                        break;
                    case ')':
                        strGuessContentTypeFromName = "video/webm";
                        break;
                    case '*':
                        strGuessContentTypeFromName = "image/webp";
                        break;
                    case '+':
                        strGuessContentTypeFromName = "application/font-woff";
                        break;
                }
            } else {
                strGuessContentTypeFromName = null;
            }
        }
        return strGuessContentTypeFromName == null ? "text/plain" : strGuessContentTypeFromName;
    }

    public static d d(InvocationHandler invocationHandler) {
        return new d((ScriptHandlerBoundaryInterface) u90.b.i(ScriptHandlerBoundaryInterface.class, invocationHandler), 2);
    }

    public l b(String str) {
        if (w.f77954q.b()) {
            return new l((ProfileBoundaryInterface) u90.b.i(ProfileBoundaryInterface.class, ((ProfileStoreBoundaryInterface) this.f77914b).getOrCreateProfile(str)));
        }
        throw w.a();
    }

    @Override // org.chromium.support_lib_boundary.WebViewStartUpConfigBoundaryInterface
    public Executor getBackgroundExecutor() {
        return ((WebViewStartUpConfig) this.f77914b).getBackgroundExecutor();
    }

    @Override // org.chromium.support_lib_boundary.WebViewStartUpConfigBoundaryInterface
    public Set getProfileNamesToLoad() {
        return ((WebViewStartUpConfig) this.f77914b).getProfilesToLoadDuringStartup();
    }

    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public String[] getSupportedFeatures() {
        switch (this.f77913a) {
            case 3:
                return new String[]{WebViewFeature.WEB_MESSAGE_CALLBACK_ON_MESSAGE};
            default:
                return new String[]{WebViewFeature.WEB_MESSAGE_LISTENER, WebViewFeature.WEB_MESSAGE_ARRAY_BUFFER};
        }
    }

    @Override // org.chromium.support_lib_boundary.WebMessageCallbackBoundaryInterface
    public void onMessage(InvocationHandler invocationHandler, InvocationHandler invocationHandler2) {
        m7.j jVarB = o.b((WebMessageBoundaryInterface) u90.b.i(WebMessageBoundaryInterface.class, invocationHandler2));
        if (jVarB != null) {
            ((y4) this.f77914b).onMessage(new r(invocationHandler), jVarB);
        }
    }

    @Override // org.chromium.support_lib_boundary.WebMessageListenerBoundaryInterface
    public void onPostMessage(WebView webView, InvocationHandler invocationHandler, Uri uri, boolean z11, InvocationHandler invocationHandler2) {
        m7.j jVarB = o.b((WebMessageBoundaryInterface) u90.b.i(WebMessageBoundaryInterface.class, invocationHandler));
        if (jVarB != null) {
            JsReplyProxyBoundaryInterface jsReplyProxyBoundaryInterface = (JsReplyProxyBoundaryInterface) u90.b.i(JsReplyProxyBoundaryInterface.class, invocationHandler2);
            ((m7.s) this.f77914b).onPostMessage(webView, jVarB, uri, z11, (g) jsReplyProxyBoundaryInterface.getOrCreatePeer(new ab.e(jsReplyProxyBoundaryInterface, 12)));
        }
    }

    @Override // org.chromium.support_lib_boundary.WebViewStartUpConfigBoundaryInterface
    public boolean shouldRunUiThreadStartUpTasks() {
        return ((WebViewStartUpConfig) this.f77914b).shouldRunUiThreadStartUpTasks();
    }
}
