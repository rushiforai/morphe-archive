package p6;

import android.appwidget.AppWidgetHostView;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Rect;
import android.net.Uri;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.google.android.gms.common.Feature;
import com.google.android.gms.internal.measurement.ke;
import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.core.strings.StaticResolvableString;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class p0 {

    /* renamed from: a, reason: collision with root package name */
    public static int f82229a = 50;

    /* renamed from: b, reason: collision with root package name */
    public static int f82230b = 10;

    /* renamed from: c, reason: collision with root package name */
    public static int f82231c = 10;

    /* renamed from: d, reason: collision with root package name */
    public static int f82232d = 10;

    /* renamed from: e, reason: collision with root package name */
    public static sb.b f82233e = null;

    /* renamed from: f, reason: collision with root package name */
    public static boolean f82234f = false;

    /* renamed from: g, reason: collision with root package name */
    public static int f82235g = 1;

    /* renamed from: h, reason: collision with root package name */
    public static int f82236h = 8192;

    /* renamed from: i, reason: collision with root package name */
    public static boolean f82237i = false;

    /* renamed from: j, reason: collision with root package name */
    public static boolean f82238j = true;

    public static final String a(Uri uri, String str) {
        String queryParameter = uri.getQueryParameter(str);
        if (queryParameter != null) {
            return URLDecoder.decode(queryParameter, StandardCharsets.UTF_8.name());
        }
        return null;
    }

    public static final void b(m3.d dVar, String str, String str2) {
        if (str2.length() <= 0) {
            j0.b.a("alternateText can't be an empty string.");
        }
        m3.c cVar = new m3.c(new m3.i0(str), dVar.f75847a.length(), 0, 4);
        ArrayList arrayList = dVar.f75848b;
        arrayList.add(cVar);
        dVar.f75849c.add(cVar);
        arrayList.size();
        dVar.b(str2);
        dVar.e();
    }

    public static int c(int i5, int i11) {
        return (i5 & 16777215) | (i11 << 24);
    }

    public static final CommonConfiguration d(PaymentSheet$Configuration paymentSheet$Configuration) {
        Intrinsics.g(paymentSheet$Configuration, "<this>");
        String str = paymentSheet$Configuration.f44544a;
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = paymentSheet$Configuration.f44545b;
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = paymentSheet$Configuration.f44546c;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = paymentSheet$Configuration.f44547d;
        AddressDetails addressDetails = paymentSheet$Configuration.f44548e;
        boolean z11 = paymentSheet$Configuration.f44549f;
        boolean z12 = paymentSheet$Configuration.f44550g;
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = paymentSheet$Configuration.f44553j;
        List list = paymentSheet$Configuration.f44554k;
        boolean z13 = paymentSheet$Configuration.f44555l;
        List list2 = paymentSheet$Configuration.f44556m;
        List list3 = paymentSheet$Configuration.n;
        PaymentSheet$CardBrandAcceptance paymentSheet$CardBrandAcceptance = paymentSheet$Configuration.f44557p;
        List list4 = paymentSheet$Configuration.f44559r;
        return new CommonConfiguration(str, paymentSheet$CustomerConfiguration, paymentSheet$GooglePayConfiguration, paymentSheet$Configuration.f44560s, paymentSheet$BillingDetails, addressDetails, z11, z12, paymentSheet$BillingDetailsCollectionConfiguration, list, z13, list2, list3, paymentSheet$CardBrandAcceptance, paymentSheet$Configuration.f44558q, list4, paymentSheet$Configuration.f44562u, paymentSheet$Configuration.f44563v, null, paymentSheet$Configuration.f44564w, paymentSheet$Configuration.f44561t, paymentSheet$Configuration.f44565x, paymentSheet$Configuration.f44566y, paymentSheet$Configuration.f44551h);
    }

    public static boolean e(Object[] objArr, Feature feature) {
        int length = objArr.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            if (!sg.w.k(objArr[i5], feature)) {
                i5++;
            } else if (i5 >= 0) {
                return true;
            }
        }
        return false;
    }

    public static u60.a f(u60.g gVar) {
        u60.a aVarA = f.A(f.L(gVar, "clike"), "kotlin", new br.a(29), u60.g.g("keyword", u60.g.f(Pattern.compile("(^|[^.])\\b(?:abstract|actual|annotation|as|break|by|catch|class|companion|const|constructor|continue|crossinline|data|do|dynamic|else|enum|expect|external|final|finally|for|fun|get|if|import|in|infix|init|inline|inner|interface|internal|is|lateinit|noinline|null|object|open|operator|out|override|package|private|protected|public|reified|return|sealed|set|super|suspend|tailrec|this|throw|to|try|typealias|val|var|vararg|when|where|while)\\b"))), u60.g.g("function", u60.g.c(Pattern.compile("\\w+(?=\\s*\\()")), u60.g.f(Pattern.compile("(\\.)\\w+(?=\\s*\\{)"))), u60.g.g("number", u60.g.c(Pattern.compile("\\b(?:0[xX][\\da-fA-F]+(?:_[\\da-fA-F]+)*|0[bB][01]+(?:_[01]+)*|\\d+(?:_\\d+)*(?:\\.\\d+(?:_\\d+)*)?(?:[eE][+-]?\\d+(?:_\\d+)*)?[fFL]?)\\b"))), u60.g.g("operator", u60.g.c(Pattern.compile("\\+[+=]?|-[-=>]?|==?=?|!(?:!|==?)?|[\\/*%<>]=?|[?:]:?|\\.\\.|&&|\\|\\||\\b(?:and|inv|or|shl|shr|ushr|xor)\\b"))));
        f.G(aVarA, "string", u60.g.g("raw-string", u60.g.e(Pattern.compile("(\"\"\"|''')[\\s\\S]*?\\1"), false, false, "string")));
        f.G(aVarA, "keyword", u60.g.g("annotation", u60.g.e(Pattern.compile("\\B@(?:\\w+:)?(?:[A-Z]\\w*|\\[[^\\]]+\\])"), false, false, "builtin")));
        f.G(aVarA, "function", u60.g.g("label", u60.g.e(Pattern.compile("\\w+@|@\\w+"), false, false, "symbol")));
        List list = aVarA.f90645b;
        ArrayList arrayList = new ArrayList(list.size() + 1);
        arrayList.add(u60.g.g("delimiter", u60.g.e(Pattern.compile("^\\$\\{|\\}$"), false, false, "variable")));
        arrayList.addAll(list);
        u60.a aVarA2 = u60.g.a("inside", u60.g.g("interpolation", new u60.d(Pattern.compile("\\$\\{[^}]+\\}"), false, false, null, new u60.a("inside", arrayList)), u60.g.e(Pattern.compile("\\$\\w+"), false, false, "variable")));
        u60.j jVarD = f.D(aVarA, "string".split("/"), 0);
        u60.j jVarD2 = f.D(aVarA, "raw-string".split("/"), 0);
        if (jVarD != null) {
            ArrayList arrayList2 = jVarD.f90660b;
            if (jVarD2 != null) {
                ArrayList arrayList3 = jVarD2.f90660b;
                u60.d dVar = (u60.d) arrayList2.get(0);
                u60.d dVar2 = (u60.d) arrayList3.get(0);
                arrayList2.add(new u60.d(dVar.f90646a, dVar.f90647b, dVar.f90648c, dVar.f90649d, aVarA2));
                arrayList3.add(new u60.d(dVar2.f90646a, dVar2.f90647b, dVar2.f90648c, dVar2.f90649d, aVarA2));
                arrayList2.remove(0);
                arrayList3.remove(0);
                return aVarA;
            }
        }
        throw new RuntimeException("Unexpected state, cannot find `string` and/or `raw-string` tokens inside kotlin grammar");
    }

    public static final boolean g(int i5, int i11) {
        return i5 == i11;
    }

    public static Rect h(Context context, ComponentName componentName, Rect rect) {
        if (rect == null) {
            rect = new Rect();
        }
        if (!k(componentName) && componentName != null) {
            return AppWidgetHostView.getDefaultPaddingForWidget(context, componentName, rect);
        }
        rect.set(0, 0, 0, 0);
        return rect;
    }

    public static final ResolvableString i(Throwable th2) {
        if (th2 instanceof APIConnectionException) {
            return zg.a.U(2132019781, new Object[0], EmptyList.f71733a);
        }
        String localizedMessage = th2.getLocalizedMessage();
        return localizedMessage != null ? new StaticResolvableString(localizedMessage, kotlin.collections.c.b1(new Object[0])) : zg.a.U(2132019808, new Object[0], EmptyList.f71733a);
    }

    public static final b3.z0 j(b3.z0 z0Var) {
        LayoutNode parent$ui_release = z0Var.o.o;
        while (true) {
            LayoutNode parent$ui_release2 = parent$ui_release.getParent$ui_release();
            if ((parent$ui_release2 != null ? parent$ui_release2.getLookaheadRoot() : null) == null) {
                b3.z0 z0VarU0 = parent$ui_release.getOuterCoordinator$ui_release().u0();
                Intrinsics.d(z0VarU0);
                return z0VarU0;
            }
            LayoutNode parent$ui_release3 = parent$ui_release.getParent$ui_release();
            LayoutNode lookaheadRoot = parent$ui_release3 != null ? parent$ui_release3.getLookaheadRoot() : null;
            Intrinsics.d(lookaheadRoot);
            if (lookaheadRoot.getIsVirtualLookaheadRoot()) {
                parent$ui_release = parent$ui_release.getParent$ui_release();
                Intrinsics.d(parent$ui_release);
            } else {
                LayoutNode parent$ui_release4 = parent$ui_release.getParent$ui_release();
                Intrinsics.d(parent$ui_release4);
                parent$ui_release = parent$ui_release4.getLookaheadRoot();
                Intrinsics.d(parent$ui_release);
            }
        }
    }

    public static final boolean k(ComponentName componentName) {
        if (componentName == null) {
            return false;
        }
        String packageName = componentName.getPackageName();
        String className = componentName.getClassName();
        if (TextUtils.isEmpty(packageName)) {
            return false;
        }
        if ("com.motorola.blur.weather".equals(packageName) || "com.sec.android".equals(packageName) || "com.samsung.music".equals(packageName) || "com.sec.widgetapp.dialerwidget".equals(packageName) || "com.sec.android.fotaclient".equals(packageName) || "com.sec.android.app.music".equals(packageName) || "com.sec.android.app.shealth".equals(packageName) || packageName.startsWith("com.sec.android.widgetapp")) {
            return true;
        }
        return "com.android.settings".equals(packageName) && (className.startsWith("com.android.settings.accessibilitywidget.AccessibilityWidgetProvider") || "com.android.settings.widget.SmartSwitchWidgetProvider".equals(className) || "com.android.settings.accessibilitywidget.AccessibilityEasyWidgetProviderAssistiveLight".equals(className));
    }

    public static final n0 l(Function1 function1) {
        o0 o0Var = new o0();
        function1.invoke(o0Var);
        boolean z11 = o0Var.f82220b;
        boolean z12 = o0Var.f82221c;
        int i5 = o0Var.f82222d;
        boolean z13 = o0Var.f82223e;
        boolean z14 = o0Var.f82224f;
        ke keVar = o0Var.f82219a;
        return new n0(z11, z12, i5, z13, z14, keVar.f32738b, keVar.f32739c);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object m(CoroutineContext coroutineContext, bu.m mVar, gv.s sVar, ContinuationImpl continuationImpl) throws Throwable {
        qq.a aVar;
        if (continuationImpl instanceof qq.a) {
            aVar = (qq.a) continuationImpl;
            int i5 = aVar.f84313u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f84313u = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new qq.a(continuationImpl);
            }
        }
        Object objY = aVar.f84312t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f84313u;
        if (i11 == 0) {
            ResultKt.b(objY);
            pu.h hVar = new pu.h(sVar, mVar, (Continuation) null, 5);
            aVar.f84313u = 1;
            objY = t70.m0.y(coroutineContext, hVar, aVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    public static String n(File file) throws NoSuchAlgorithmException, IOException {
        int i5;
        if (file.isFile()) {
            byte[] bArr = new byte[1024];
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
                while (true) {
                    int i11 = bufferedInputStream.read(bArr, 0, 1024);
                    if (i11 == -1) {
                        break;
                    }
                    messageDigest.update(bArr, 0, i11);
                }
                if (!TextUtils.isEmpty(null)) {
                    throw null;
                }
                bufferedInputStream.close();
                byte[] bArrDigest = messageDigest.digest();
                if (bArrDigest != null && bArrDigest.length > 0) {
                    char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
                    char[] cArr2 = new char[bArrDigest.length * 2];
                    int i12 = 0;
                    for (byte b11 : bArrDigest) {
                        int i13 = i12 + 1;
                        cArr2[i12] = cArr[(b11 >>> 4) & 15];
                        i12 += 2;
                        cArr2[i13] = cArr[b11 & 15];
                    }
                    return new String(cArr2);
                }
            } catch (Exception e3) {
                sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "fechkCu5ZdeFWA==", "XOs5swqwbOqkH+BUmBmTKVf6", 858);
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
