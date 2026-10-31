package ps;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.graphics.Path;
import android.util.Log;
import android.util.TypedValue;
import android.view.animation.AnimationUtils;
import android.view.animation.PathInterpolator;
import b.u4;
import com.amplitude.core.Configuration;
import com.google.firebase.encoders.EncodingException;
import com.instabridge.mobilesdk.internal.ui.screens.t0;
import com.stripe.android.link.ui.verification.VerificationViewState;
import com.teslacoilsw.launcher.NovaLauncher;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import k0.i2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KFunction;
import kotlin.text.Charsets;
import org.json.JSONObject;
import ou.i1;
import p1.e1;
import p1.g1;
import p1.t1;
import p1.w2;
import r10.w0;
import t70.y0;
import w70.g2;

/* loaded from: classes4.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static volatile boolean f82926a;

    public static final void a(b2.t tVar, b2.e eVar, x1.e eVar2, p1.o oVar, int i5, int i11) {
        b2.e eVar3;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-677727979);
        int i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        int i13 = i11 & 2;
        if (i13 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar2.f(eVar) ? 32 : 16;
        }
        if ((i12 & 147) == 146 && tVar2.E()) {
            tVar2.V();
            eVar3 = eVar;
        } else {
            b2.e eVar4 = i13 != 0 ? b2.d.n : eVar;
            i2.a(null, null, x1.f.d(416504063, new b10.f0(16, tVar, eVar4, eVar2), tVar2), tVar2, 3072, 7);
            eVar3 = eVar4;
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new t0(tVar, eVar3, eVar2, i5, i11, 13);
        }
    }

    public static final void b(Function0 onLogoutClicked, p1.o oVar, int i5) {
        Intrinsics.g(onLogoutClicked, "onLogoutClicked");
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1980050729);
        int i11 = (tVar.h(onLogoutClicked) ? 4 : 2) | i5;
        if ((i11 & 3) == 2 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(1513480211);
            Object objP = tVar.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = ul.b.P(l0.f82927a);
                tVar.m0(objP);
            }
            List list = (List) objP;
            tVar.p(false);
            tVar.b0(1513483109);
            boolean z11 = (i11 & 14) == 4;
            Object objP2 = tVar.P();
            if (z11 || objP2 == g1Var) {
                objP2 = new dv.z(onLogoutClicked, 10);
                tVar.m0(objP2);
            }
            tVar.p(false);
            p6.f.m(null, list, (Function1) objP2, tVar, 0, 1);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e00.i(onLogoutClicked, i5, 6);
        }
    }

    public static final void c(xs.o viewModel, p1.o oVar, int i5) {
        p1.t tVar;
        Intrinsics.g(viewModel, "viewModel");
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-662325773);
        if ((((tVar2.h(viewModel) ? 4 : 2) | i5) & 3) == 2 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            VerificationViewState verificationViewState = (VerificationViewState) g(viewModel.f96298m, tVar2, 0).getValue();
            kw.g1 g1Var = viewModel.n;
            tVar2.b0(1187132626);
            boolean zH = tVar2.h(viewModel);
            Object objP = tVar2.P();
            g1 g1Var2 = p1.n.f81514a;
            if (zH || objP == g1Var2) {
                pu.s sVar = new pu.s(0, viewModel, xs.o.class, "onBack", "onBack()V", 0, 18);
                tVar2.m0(sVar);
                objP = sVar;
            }
            KFunction kFunction = (KFunction) objP;
            tVar2.p(false);
            tVar2.b0(1187134182);
            boolean zH2 = tVar2.h(viewModel);
            Object objP2 = tVar2.P();
            if (zH2 || objP2 == g1Var2) {
                pu.s sVar2 = new pu.s(0, viewModel, xs.o.class, "onChangeEmailButtonClicked", "onChangeEmailButtonClicked()V", 0, 19);
                tVar2.m0(sVar2);
                objP2 = sVar2;
            }
            KFunction kFunction2 = (KFunction) objP2;
            tVar2.p(false);
            tVar2.b0(1187136310);
            boolean zH3 = tVar2.h(viewModel);
            Object objP3 = tVar2.P();
            if (zH3 || objP3 == g1Var2) {
                pu.s sVar3 = new pu.s(0, viewModel, xs.o.class, "resendCode", "resendCode()V", 0, 20);
                tVar2.m0(sVar3);
                objP3 = sVar3;
            }
            KFunction kFunction3 = (KFunction) objP3;
            tVar2.p(false);
            tVar2.b0(1187137916);
            boolean zH4 = tVar2.h(viewModel);
            Object objP4 = tVar2.P();
            if (zH4 || objP4 == g1Var2) {
                pu.s sVar4 = new pu.s(0, viewModel, xs.o.class, "onFocusRequested", "onFocusRequested()V", 0, 21);
                tVar2.m0(sVar4);
                objP4 = sVar4;
            }
            KFunction kFunction4 = (KFunction) objP4;
            tVar2.p(false);
            tVar2.b0(1187140071);
            boolean zH5 = tVar2.h(viewModel);
            Object objP5 = tVar2.P();
            if (zH5 || objP5 == g1Var2) {
                pu.s sVar5 = new pu.s(0, viewModel, xs.o.class, "didShowCodeSentNotification", "didShowCodeSentNotification()V", 0, 22);
                tVar2.m0(sVar5);
                objP5 = sVar5;
            }
            KFunction kFunction5 = (KFunction) objP5;
            tVar2.p(false);
            tVar2.b0(1187142138);
            boolean zH6 = tVar2.h(viewModel);
            Object objP6 = tVar2.P();
            if (zH6 || objP6 == g1Var2) {
                pu.s sVar6 = new pu.s(0, viewModel, xs.o.class, "onConsentShown", "onConsentShown()V", 0, 23);
                tVar2.m0(sVar6);
                objP6 = sVar6;
            }
            tVar2.p(false);
            tVar = tVar2;
            xs.g.f(verificationViewState, g1Var, (Function0) kFunction, (Function0) kFunction4, (Function0) kFunction5, (Function0) kFunction2, (Function0) kFunction3, (Function0) ((KFunction) objP6), tVar, 64);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new ux.s(viewModel, i5, 8);
        }
    }

    public static void d(s10.a aVar) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("BranchConsent");
        Context context = mx.g0.f77088a;
        bVar.b("Applying action: %s, branchManagerInitialized=%s", aVar, Boolean.valueOf(mx.g0.f77098k != null));
        if (mx.g0.f77098k != null) {
            s10.d0 d0VarD = mx.g0.d();
            int iOrdinal = aVar.ordinal();
            if (iOrdinal == 0) {
                d0VarD.h(mx.g0.e(), true);
                d0VarD.f86588k = false;
                d0VarD.g().optIntoTracking();
                f82926a = true;
                return;
            }
            if (iOrdinal != 1) {
                if (iOrdinal != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                f82926a = false;
                d0VarD.f86588k = true;
                return;
            }
            d0VarD.h(mx.g0.e(), false);
            d0VarD.f86588k = false;
            d0VarD.g().optOutOfTracking();
            f82926a = true;
        }
    }

    public static b6.e e(List from, Function1 function1, Function2 function2) {
        Object obj;
        Intrinsics.g(from, "from");
        List list = from;
        Iterator it = list.iterator();
        if (it.hasNext()) {
            Object next = it.next();
            if (it.hasNext()) {
                Comparable comparable = (Comparable) function1.invoke(next);
                do {
                    Object next2 = it.next();
                    Comparable comparable2 = (Comparable) function1.invoke(next2);
                    if (comparable.compareTo(comparable2) < 0) {
                        next = next2;
                        comparable = comparable2;
                    }
                } while (it.hasNext());
            }
            obj = next;
        } else {
            obj = null;
        }
        if (obj == null) {
            throw new NoSuchElementException("Unable to build char tree from an empty list");
        }
        ((Number) function1.invoke(obj)).intValue();
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                if (((Number) function1.invoke(it2.next())).intValue() == 0) {
                    throw new IllegalArgumentException("There should be no empty entries");
                }
            }
        }
        ArrayList arrayList = new ArrayList();
        f(arrayList, from, 0, function1, function2);
        arrayList.trimToSize();
        new q50.a((char) 0, EmptyList.f71733a, arrayList);
        return new b6.e(21);
    }

    public static void f(ArrayList arrayList, List list, int i5, Function1 function1, Function2 function2) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : list) {
            Character ch = (Character) function2.invoke(obj, Integer.valueOf(i5));
            ch.getClass();
            Object arrayList2 = linkedHashMap.get(ch);
            if (arrayList2 == null) {
                arrayList2 = new ArrayList();
                linkedHashMap.put(ch, arrayList2);
            }
            ((List) arrayList2).add(obj);
        }
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            char cCharValue = ((Character) entry.getKey()).charValue();
            List list2 = (List) entry.getValue();
            int i11 = i5 + 1;
            ArrayList arrayList3 = new ArrayList();
            List list3 = list2;
            ArrayList arrayList4 = new ArrayList();
            for (Object obj2 : list3) {
                if (((Number) function1.invoke(obj2)).intValue() > i11) {
                    arrayList4.add(obj2);
                }
            }
            f(arrayList3, arrayList4, i11, function1, function2);
            arrayList3.trimToSize();
            ArrayList arrayList5 = new ArrayList();
            for (Object obj3 : list3) {
                if (((Number) function1.invoke(obj3)).intValue() == i11) {
                    arrayList5.add(obj3);
                }
            }
            arrayList.add(new q50.a(cCharValue, arrayList5, arrayList3));
        }
    }

    public static final e1 g(g2 g2Var, p1.o oVar, int i5) {
        Object i1Var;
        g2 g2Var2;
        Intrinsics.g(g2Var, "<this>");
        p1.t tVar = (p1.t) oVar;
        tVar.b0(101925897);
        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
        tVar.b0(-2023557603);
        boolean zF = tVar.f(g2Var);
        Object objP = tVar.P();
        Continuation continuation = null;
        g1 g1Var = p1.n.f81514a;
        if (zF || objP == g1Var) {
            tVar.m0(null);
            objP = null;
        }
        AssertionError assertionError = (AssertionError) objP;
        tVar.p(false);
        tVar.b0(-2023540810);
        boolean zF2 = tVar.f(g2Var);
        Object objP2 = tVar.P();
        if (zF2 || objP2 == g1Var) {
            objP2 = new n0.w(g2Var, 23);
            tVar.m0(objP2);
        }
        Function0 function0 = (Function0) objP2;
        tVar.p(false);
        tVar.b0(-2023538643);
        boolean zH = tVar.h(emptyCoroutineContext) | tVar.h(g2Var) | tVar.h(assertionError);
        Object objP3 = tVar.P();
        if (zH || objP3 == g1Var) {
            g2Var2 = g2Var;
            i1Var = new i1(emptyCoroutineContext, g2Var2, assertionError, continuation, 11);
            tVar.m0(i1Var);
        } else {
            i1Var = objP3;
            g2Var2 = g2Var;
        }
        Function2 function2 = (Function2) i1Var;
        tVar.p(false);
        tVar.b0(2085798134);
        tVar.b0(-1742434739);
        boolean zF3 = tVar.f(g2Var2);
        Object objP4 = tVar.P();
        if (zF3 || objP4 == g1Var) {
            objP4 = androidx.compose.runtime.d.k(function0.invoke());
            tVar.m0(objP4);
        }
        e1 e1Var = (e1) objP4;
        tVar.p(false);
        tVar.b0(-1742432157);
        boolean zH2 = tVar.h(function2) | tVar.f(e1Var);
        Object objP5 = tVar.P();
        if (zH2 || objP5 == g1Var) {
            objP5 = new w2(function2, e1Var, continuation, 1);
            tVar.m0(objP5);
        }
        tVar.p(false);
        p1.o0.f(g2Var2, (Function2) objP5, tVar);
        tVar.p(false);
        tVar.p(false);
        return e1Var;
    }

    public static w0 h(String str) {
        if (str == null) {
            return null;
        }
        for (w0 w0Var : w0.f85299z) {
            Iterator it = w0Var.f85301b.iterator();
            while (it.hasNext()) {
                if (r70.j.B0((String) it.next(), str, true)) {
                    return w0Var;
                }
            }
        }
        return null;
    }

    public static float i(int i5, String[] strArr) throws NumberFormatException {
        float f11 = Float.parseFloat(strArr[i5]);
        if (f11 >= 0.0f && f11 <= 1.0f) {
            return f11;
        }
        throw new IllegalArgumentException("Motion easing control point value must be between 0 and 1; instead got: " + f11);
    }

    public static void j(NovaLauncher novaLauncher, h6.x xVar) {
        zy.c cVar = zy.c.f98823a;
        if (!zy.c.d("branch_search_enabled", false)) {
            f82926a = false;
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BranchConsent");
            bVar.b("Branch disabled by remote config", new Object[0]);
            return;
        }
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("BranchConsent");
        bVar2.b("initialize() called", new Object[0]);
        a80.e eVar = y0.f88884a;
        t70.m0.t(xVar, a80.d.f488c, null, new cy.t(novaLauncher, null, 7), 2);
    }

    public static boolean k() {
        return f82926a;
    }

    public static boolean l(String str, String str2) {
        return str.startsWith(str2.concat("(")) && str.endsWith(")");
    }

    public static ArrayList m(List list, List list2) {
        ArrayList arrayList = new ArrayList(list2.size() * list.size());
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            Iterator it2 = list2.iterator();
            while (it2.hasNext()) {
                arrayList.add(str + " " + ((String) it2.next()));
            }
        }
        return arrayList;
    }

    public static JSONObject n(String str) {
        List listH1 = r70.k.h1(str, new char[]{'.'}, 6);
        if (listH1.size() != 3 || ((CharSequence) listH1.get(1)).length() == 0) {
            return null;
        }
        try {
            return new JSONObject(new String(Base64.getUrlDecoder().decode(r70.k.x1((String) listH1.get(1), '=')), Charsets.f72000b));
        } catch (Exception unused) {
            return null;
        }
    }

    public static final void o(e80.k kVar, Function1 block) {
        Intrinsics.g(kVar, "<this>");
        Intrinsics.g(block, "block");
        e80.a aVarI = kVar.i();
        if (aVarI.N()) {
            throw new IllegalArgumentException("Buffer is empty");
        }
        e80.h hVar = aVarI.f52245a;
        Intrinsics.d(hVar);
        byte[] bArr = hVar.f52260a;
        int i5 = hVar.f52261b;
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr, i5, hVar.f52262c - i5);
        Intrinsics.d(byteBufferWrap);
        block.invoke(byteBufferWrap);
        int iPosition = byteBufferWrap.position() - i5;
        if (iPosition != 0) {
            if (iPosition < 0) {
                throw new IllegalStateException("Returned negative read bytes count");
            }
            if (iPosition > hVar.a()) {
                throw new IllegalStateException("Returned too many bytes");
            }
            aVarI.skip(iPosition);
        }
    }

    public static s10.a p(String str, boolean z11, boolean z12, ox.g gVar) {
        boolean zB = Intrinsics.b(str, "US");
        if ((z11 || zB) && !z12) {
            if (gVar.f81072a && !gVar.f81076e) {
                return gVar.f81074c ? s10.a.f86566b : s10.a.f86567c;
            }
            return s10.a.f86565a;
        }
        return s10.a.f86567c;
    }

    public static int q(Context context, int i5, int i11) {
        TypedValue typedValueU = e0.u(context, i5);
        return (typedValueU == null || typedValueU.type != 16) ? i11 : typedValueU.data;
    }

    public static TimeInterpolator r(Context context, int i5, TimeInterpolator timeInterpolator) {
        TypedValue typedValue = new TypedValue();
        if (!context.getTheme().resolveAttribute(i5, typedValue, true)) {
            return timeInterpolator;
        }
        if (typedValue.type != 3) {
            throw new IllegalArgumentException("Motion easing theme attribute must be an @interpolator resource for ?attr/motionEasing*Interpolator attributes or a string for ?attr/motionEasing* attributes.");
        }
        String strValueOf = String.valueOf(typedValue.string);
        if (!l(strValueOf, "cubic-bezier") && !l(strValueOf, "path")) {
            return AnimationUtils.loadInterpolator(context, typedValue.resourceId);
        }
        if (l(strValueOf, "cubic-bezier")) {
            String[] strArrSplit = strValueOf.substring(13, strValueOf.length() - 1).split(",");
            if (strArrSplit.length == 4) {
                return new PathInterpolator(i(0, strArrSplit), i(1, strArrSplit), i(2, strArrSplit), i(3, strArrSplit));
            }
            throw new IllegalArgumentException("Motion easing theme attribute must have 4 control points if using bezier curve format; instead got: " + strArrSplit.length);
        }
        if (!l(strValueOf, "path")) {
            throw new IllegalArgumentException("Invalid motion easing type: ".concat(strValueOf));
        }
        String strF = u4.f(1, 5, strValueOf);
        Path path = new Path();
        try {
            r4.b.b(p3.i.q(strF), path);
            return new PathInterpolator(path);
        } catch (RuntimeException e3) {
            throw new RuntimeException("Error in parsing ".concat(strF), e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01c3  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x01e0 A[EDGE_INSN: B:133:0x01e0->B:106:0x01e0 BREAK  A[LOOP:0: B:3:0x0005->B:135:?], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static gf.q0 s(mh.c cVar, k30.e eVar, o40.b bVar) throws Throwable {
        int i5;
        gf.q0 q0Var;
        gf.q0 q0Var2;
        int i11 = 5;
        mh.c cVar2 = cVar;
        do {
            int i12 = i11;
            rd.b bVar2 = (rd.b) eVar.f70933b;
            URL url = (URL) cVar2.f76324c;
            String strConcat = "TRuntime.".concat("CctTransportBackend");
            if (Log.isLoggable(strConcat, 4)) {
                Log.i(strConcat, String.format("Making request to: %s", url));
            }
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setConnectTimeout(Configuration.FLUSH_INTERVAL_MILLIS);
            httpURLConnection.setReadTimeout(bVar2.f85806g);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setInstanceFollowRedirects(false);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("User-Agent", "datatransport/3.3.0 android/");
            httpURLConnection.setRequestProperty("Content-Encoding", "gzip");
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setRequestProperty("Accept-Encoding", "gzip");
            String str = (String) cVar2.f76323b;
            if (str != null) {
                httpURLConnection.setRequestProperty("X-Goog-Api-Key", str);
            }
            try {
                OutputStream outputStream = httpURLConnection.getOutputStream();
                try {
                    GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(outputStream);
                    try {
                        vm.c cVar3 = bVar2.f85800a;
                        sd.o oVar = (sd.o) cVar2.f76325d;
                        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(gZIPOutputStream));
                        im.d dVar = (im.d) cVar3.f92857b;
                        i5 = i12;
                        try {
                            im.e eVar2 = new im.e(bufferedWriter, dVar.f61645a, dVar.f61646b, dVar.f61647c, dVar.f61648d);
                            eVar2.h(oVar);
                            eVar2.j();
                            eVar2.f61650b.flush();
                            try {
                                gZIPOutputStream.close();
                                if (outputStream != null) {
                                    try {
                                        outputStream.close();
                                    } catch (EncodingException e3) {
                                        e = e3;
                                        w.b.g("CctTransportBackend", "Couldn't encode request, returning with 400", e);
                                        q0Var = new gf.q0(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null, 0L);
                                        q0Var2 = q0Var;
                                        URL url2 = (URL) q0Var2.f57608c;
                                        if (url2 != null) {
                                        }
                                        if (cVar2 == null) {
                                        }
                                        return q0Var2;
                                    } catch (ConnectException e11) {
                                        e = e11;
                                        w.b.g("CctTransportBackend", "Couldn't open connection, returning with 500", e);
                                        q0Var = new gf.q0(500, null, 0L);
                                        q0Var2 = q0Var;
                                        URL url22 = (URL) q0Var2.f57608c;
                                        if (url22 != null) {
                                        }
                                        if (cVar2 == null) {
                                        }
                                        return q0Var2;
                                    } catch (UnknownHostException e12) {
                                        e = e12;
                                        w.b.g("CctTransportBackend", "Couldn't open connection, returning with 500", e);
                                        q0Var = new gf.q0(500, null, 0L);
                                        q0Var2 = q0Var;
                                        URL url222 = (URL) q0Var2.f57608c;
                                        if (url222 != null) {
                                        }
                                        if (cVar2 == null) {
                                        }
                                        return q0Var2;
                                    } catch (IOException e13) {
                                        e = e13;
                                        w.b.g("CctTransportBackend", "Couldn't encode request, returning with 400", e);
                                        q0Var = new gf.q0(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null, 0L);
                                        q0Var2 = q0Var;
                                        URL url2222 = (URL) q0Var2.f57608c;
                                        if (url2222 != null) {
                                        }
                                        if (cVar2 == null) {
                                        }
                                        return q0Var2;
                                    }
                                }
                                int responseCode = httpURLConnection.getResponseCode();
                                Integer numValueOf = Integer.valueOf(responseCode);
                                String strConcat2 = "TRuntime.".concat("CctTransportBackend");
                                if (Log.isLoggable(strConcat2, 4)) {
                                    Log.i(strConcat2, String.format("Status Code: %d", numValueOf));
                                }
                                httpURLConnection.getHeaderField("Content-Type");
                                httpURLConnection.getHeaderField("Content-Encoding");
                                if (responseCode == 302 || responseCode == 301 || responseCode == 307) {
                                    q0Var2 = new gf.q0(responseCode, new URL(httpURLConnection.getHeaderField("Location")), 0L);
                                } else if (responseCode != 200) {
                                    q0Var2 = new gf.q0(responseCode, null, 0L);
                                } else {
                                    InputStream inputStream = httpURLConnection.getInputStream();
                                    try {
                                        InputStream gZIPInputStream = "gzip".equals(httpURLConnection.getHeaderField("Content-Encoding")) ? new GZIPInputStream(inputStream) : inputStream;
                                        try {
                                            gf.q0 q0Var3 = new gf.q0(responseCode, null, sd.y.a(new BufferedReader(new InputStreamReader(gZIPInputStream))).f87233a);
                                            if (gZIPInputStream != null) {
                                                gZIPInputStream.close();
                                            }
                                            if (inputStream != null) {
                                                inputStream.close();
                                            }
                                            q0Var2 = q0Var3;
                                        } catch (Throwable th2) {
                                            if (gZIPInputStream == null) {
                                                throw th2;
                                            }
                                            try {
                                                gZIPInputStream.close();
                                                throw th2;
                                            } catch (Throwable th3) {
                                                th2.addSuppressed(th3);
                                                throw th2;
                                            }
                                        }
                                    } finally {
                                    }
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                Throwable th5 = th;
                                if (outputStream != null) {
                                    try {
                                        outputStream.close();
                                    } catch (Throwable th6) {
                                        th5.addSuppressed(th6);
                                    }
                                }
                                throw th5;
                            }
                        } catch (Throwable th7) {
                            th = th7;
                            Throwable th8 = th;
                            try {
                                gZIPOutputStream.close();
                            } catch (Throwable th9) {
                                th8.addSuppressed(th9);
                            }
                            throw th8;
                        }
                    } catch (Throwable th10) {
                        th = th10;
                        i5 = i12;
                    }
                } catch (Throwable th11) {
                    th = th11;
                    i5 = i12;
                }
            } catch (EncodingException e14) {
                e = e14;
                i5 = i12;
                w.b.g("CctTransportBackend", "Couldn't encode request, returning with 400", e);
                q0Var = new gf.q0(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null, 0L);
                q0Var2 = q0Var;
                URL url22222 = (URL) q0Var2.f57608c;
                if (url22222 != null) {
                }
                if (cVar2 == null) {
                }
                return q0Var2;
            } catch (ConnectException e15) {
                e = e15;
                i5 = i12;
                w.b.g("CctTransportBackend", "Couldn't open connection, returning with 500", e);
                q0Var = new gf.q0(500, null, 0L);
                q0Var2 = q0Var;
                URL url222222 = (URL) q0Var2.f57608c;
                if (url222222 != null) {
                }
                if (cVar2 == null) {
                }
                return q0Var2;
            } catch (UnknownHostException e16) {
                e = e16;
                i5 = i12;
                w.b.g("CctTransportBackend", "Couldn't open connection, returning with 500", e);
                q0Var = new gf.q0(500, null, 0L);
                q0Var2 = q0Var;
                URL url2222222 = (URL) q0Var2.f57608c;
                if (url2222222 != null) {
                }
                if (cVar2 == null) {
                }
                return q0Var2;
            } catch (IOException e17) {
                e = e17;
                i5 = i12;
                w.b.g("CctTransportBackend", "Couldn't encode request, returning with 400", e);
                q0Var = new gf.q0(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, null, 0L);
                q0Var2 = q0Var;
                URL url22222222 = (URL) q0Var2.f57608c;
                if (url22222222 != null) {
                }
                if (cVar2 == null) {
                }
                return q0Var2;
            }
            URL url222222222 = (URL) q0Var2.f57608c;
            cVar2 = url222222222 != null ? new mh.c(14, (Object) url222222222, cVar2.f76325d, cVar2.f76323b, false) : null;
            if (cVar2 == null) {
                break;
            }
            i11 = i5 - 1;
        } while (i11 >= 1);
        return q0Var2;
    }

    public static void t(qd.f fVar) {
        if (fVar instanceof td.p) {
            td.q.a().f89010d.a(((td.p) fVar).f89001a.b(qd.d.f83920c), 1);
        } else {
            String strConcat = "TRuntime.".concat("ForcedSender");
            if (Log.isLoggable(strConcat, 5)) {
                Log.w(strConcat, String.format("Expected instance of `TransportImpl`, got `%s`.", fVar));
            }
        }
    }

    public static String u(String str) {
        String strOptString;
        JSONObject jSONObjectN = n(str);
        if (jSONObjectN == null || (strOptString = jSONObjectN.optString("sub")) == null || r70.k.U0(strOptString)) {
            return null;
        }
        return strOptString;
    }
}
