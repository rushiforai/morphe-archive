package og;

import a5.g0;
import a80.m;
import ai.k4;
import android.R;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.media.MediaCodec;
import android.os.Bundle;
import android.os.HandlerThread;
import android.os.ParcelFileDescriptor;
import android.system.Os;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.KeyEvent;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.android.launcher3.folder.Folder;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.tasks.Task;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.teslacoilsw.tesladirect.ChangeLogDialog;
import fe.j0;
import fe.k0;
import java.io.ByteArrayOutputStream;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m.r;
import mk.w;
import o9.l0;
import o9.p2;
import p10.a0;
import p10.b0;
import p10.q0;
import p10.r0;
import p10.s0;
import p10.t0;
import pu.u;
import pu.y;
import pu.z;
import sd.d0;
import sd.q;
import sd.v;
import t70.m0;
import t70.y0;
import tk.k;
import tk.l;
import tk.s;
import u00.p;
import vf.o;
import x80.j;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements fi.c, l, y, fi.e, s60.c, we.i, p2, j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80411a;

    /* renamed from: b, reason: collision with root package name */
    public Object f80412b;

    /* renamed from: c, reason: collision with root package name */
    public Object f80413c;

    public /* synthetic */ i(char c11, int i5) {
        this.f80411a = i5;
    }

    public static i f(Context context, SparseIntArray sparseIntArray) {
        FileDescriptor fileDescriptorMemfd_create;
        try {
            byte[] bArrH = h(context, sparseIntArray);
            if (bArrH == null) {
                return null;
            }
            try {
                fileDescriptorMemfd_create = Os.memfd_create("material_you_color_resources.arsc", 0);
                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(fileDescriptorMemfd_create);
                    try {
                        fileOutputStream.write(bArrH);
                        ParcelFileDescriptor parcelFileDescriptorDup = ParcelFileDescriptor.dup(fileDescriptorMemfd_create);
                        try {
                            bc.a.p();
                            ResourcesLoader resourcesLoaderD = g0.d();
                            resourcesLoaderD.addProvider(ResourcesProvider.loadFromTable(parcelFileDescriptorDup, null));
                            i iVar = new i(13, resourcesLoaderD, sparseIntArray.clone());
                            if (parcelFileDescriptorDup != null) {
                                parcelFileDescriptorDup.close();
                            }
                            fileOutputStream.close();
                            if (fileDescriptorMemfd_create == null) {
                                return iVar;
                            }
                            Os.close(fileDescriptorMemfd_create);
                            return iVar;
                        } finally {
                        }
                    } finally {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (fileDescriptorMemfd_create != null) {
                        Os.close(fileDescriptorMemfd_create);
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                fileDescriptorMemfd_create = null;
            }
        } catch (Exception e3) {
            Log.e("ColorResources", "Failed to setup the context for theme colors", e3);
            return null;
        }
    }

    public static byte[] h(Context context, SparseIntArray sparseIntArray) throws Resources.NotFoundException, IOException {
        InputStream inputStreamOpenRawResource = context.getResources().openRawResource(2131951632);
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(2048);
            byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            while (inputStreamOpenRawResource.available() > 0) {
                byteArrayOutputStream.write(bArr, 0, inputStreamOpenRawResource.read(bArr));
            }
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            inputStreamOpenRawResource.close();
            int length = byteArray.length - 1492;
            if (length < 0) {
                Log.e("ColorResources", "ARSC file for theme colors is invalid.");
                return null;
            }
            for (int i5 = R.color.system_accent1_0; i5 <= R.color.system_neutral2_1000; i5++) {
                int i11 = ((65535 & i5) * 16) + length;
                int i12 = sparseIntArray.get(i5, context.getColor(i5));
                for (int i13 = 0; i13 < 4; i13++) {
                    byteArray[i11 + i13] = (byte) (i12 & 255);
                    i12 >>= 8;
                }
            }
            return byteArray;
        } catch (Throwable th2) {
            if (inputStreamOpenRawResource != null) {
                try {
                    inputStreamOpenRawResource.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
            }
            throw th2;
        }
    }

    @Override // tk.m
    public Object a() {
        return new ok.h(((k4) this.f80412b).f13083a, (s) ((k) this.f80413c).a(), new br.a(19));
    }

    @Override // s60.c
    public CharSequence b(String str, String str2) {
        if (!str2.isEmpty() && str != null) {
            u60.g gVar = (u60.g) this.f80412b;
            u60.e eVarGrammar = gVar.f90651a.grammar(gVar, str);
            if (eVarGrammar == null && !TextUtils.isEmpty(null)) {
                eVarGrammar = gVar.f90651a.grammar(gVar, null);
            }
            if (eVarGrammar != null) {
                SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
                ag agVar = (ag) this.f80413c;
                nx.l lVar = new nx.l();
                lVar.f78644a = agVar;
                lVar.f78645b = spannableStringBuilder;
                lVar.q(u60.g.h(str2, eVarGrammar));
                return spannableStringBuilder;
            }
        }
        return str2;
    }

    public void c(Object obj, String str) {
        int length = str.length();
        String strValueOf = String.valueOf(obj);
        ((ArrayList) this.f80412b).add(c0.r(new StringBuilder(length + 1 + strValueOf.length()), str, "=", strValueOf));
    }

    @Override // pu.y
    public z create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        vu.i iVar = (vu.i) ((w60.a) this.f80412b).get();
        Application applicationT = jk.b.T(extras);
        u uVar = (u) this.f80413c;
        iVar.getClass();
        vu.h hVar = iVar.f93188a;
        return new z((dw.e) hVar.f93187l.get(), uVar, (qu.c) hVar.f93186k.get(), applicationT);
    }

    public bg.g d() {
        boolean z11 = true;
        if (!ic.b.a0() && !((ArrayList) this.f80412b).contains(e0.m0((Context) this.f80413c))) {
            z11 = false;
        }
        bg.g gVar = new bg.g();
        gVar.f17888a = z11;
        return gVar;
    }

    public q e() {
        return new q((v) this.f80412b, (d0) this.f80413c);
    }

    @Override // we.i
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public o a(we.h hVar) throws Exception {
        MediaCodec mediaCodecCreateByCodecName;
        String str = hVar.f94245a.f94250a;
        o oVar = null;
        try {
            wf.a.b("createCodec:" + str);
            mediaCodecCreateByCodecName = MediaCodec.createByCodecName(str);
            try {
                o oVar2 = new o(mediaCodecCreateByCodecName, (HandlerThread) ((we.b) this.f80412b).get(), (HandlerThread) ((we.b) this.f80413c).get());
                try {
                    wf.a.q();
                    o.n(oVar2, hVar.f94246b, hVar.f94248d, hVar.f94249e);
                    return oVar2;
                } catch (Exception e3) {
                    e = e3;
                    oVar = oVar2;
                    if (oVar != null) {
                        oVar.release();
                    } else if (mediaCodecCreateByCodecName != null) {
                        mediaCodecCreateByCodecName.release();
                    }
                    throw e;
                }
            } catch (Exception e11) {
                e = e11;
            }
        } catch (Exception e12) {
            e = e12;
            mediaCodecCreateByCodecName = null;
        }
    }

    public void i(ke.l lVar, ue.d0 d0Var) {
        ke.v[] vVarArr = (ke.v[]) this.f80413c;
        for (int i5 = 0; i5 < vVarArr.length; i5++) {
            d0Var.a();
            d0Var.b();
            ke.v vVarS = lVar.s(d0Var.f90858d, 3);
            k0 k0Var = (k0) ((List) this.f80412b).get(i5);
            String str = k0Var.f54883l;
            wf.a.d("Invalid closed caption mime type provided: " + str, "application/cea-608".equals(str) || "application/cea-708".equals(str));
            String str2 = k0Var.f54872a;
            if (str2 == null) {
                d0Var.b();
                str2 = d0Var.f90859e;
            }
            j0 j0Var = new j0();
            j0Var.f54846a = str2;
            j0Var.f54856k = str;
            j0Var.f54849d = k0Var.f54875d;
            j0Var.f54848c = k0Var.f54874c;
            j0Var.C = k0Var.D;
            j0Var.f54858m = k0Var.n;
            vVarS.a(new k0(j0Var));
            vVarArr[i5] = vVarS;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:55:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object j(String str, ContinuationImpl continuationImpl) {
        zv.y yVar;
        i iVar;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof zv.y) {
            yVar = (zv.y) continuationImpl;
            int i5 = yVar.f98768x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yVar.f98768x = i5 - Integer.MIN_VALUE;
            } else {
                yVar = new zv.y(this, continuationImpl);
            }
        }
        Object objY = yVar.f98766v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yVar.f98768x;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objY);
            try {
                int i12 = Result.f71687b;
                tv.d dVar = (tv.d) this.f80412b;
                CoroutineContext coroutineContext = (CoroutineContext) this.f80413c;
                vk.j jVar = new vk.j(str, dVar, coroutineContext);
                yVar.f98764t = this;
                yVar.f98765u = str;
                yVar.f98768x = 1;
                objY = m0.y(coroutineContext, new p(jVar, continuation, 6), yVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
                iVar = this;
            } catch (Throwable th2) {
                th = th2;
                iVar = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                if (objA instanceof Result.Failure) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = yVar.f98765u;
            iVar = yVar.f98764t;
            try {
                ResultKt.b(objY);
            } catch (Throwable th3) {
                th = th3;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                if (objA instanceof Result.Failure) {
                }
            }
        }
        InputStream inputStream = (InputStream) objY;
        if (inputStream != null) {
            try {
                objA = BitmapFactory.decodeStream(inputStream);
                inputStream.close();
            } finally {
            }
        } else {
            objA = null;
        }
        int i14 = Result.f71687b;
        thA = Result.a(objA);
        if (thA != null) {
            ((tv.c) ((tv.d) iVar.f80412b)).c(new RuntimeException(c0.l("Could not get bitmap from url: ", str, "."), thA));
        }
        if (objA instanceof Result.Failure) {
            return null;
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object k(FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration, ContinuationImpl continuationImpl) {
        vr.b bVar;
        if (continuationImpl instanceof vr.b) {
            bVar = (vr.b) continuationImpl;
            int i5 = bVar.f92925v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f92925v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new vr.b(this, continuationImpl);
            }
        }
        Object obj = bVar.f92923t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f92925v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        fl.l lVar = (fl.l) this.f80413c;
        Intrinsics.g(financialConnectionsSheetConfiguration, "<this>");
        fr.i iVarH = fl.l.h(lVar, "https://api.stripe.com/v1/link_account_sessions/session_receipt", new ApiRequest$Options(new vr.a(financialConnectionsSheetConfiguration, 0), new vr.a(financialConnectionsSheetConfiguration, 1)), m.n("client_secret", financialConnectionsSheetConfiguration.f42658a), 8);
        mh.c cVar = (mh.c) this.f80412b;
        KSerializer<FinancialConnectionsSession> kSerializerSerializer = FinancialConnectionsSession.Companion.serializer();
        bVar.f92925v = 1;
        Object objA = cVar.A(iVarH, kSerializerSerializer, bVar);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }

    public List l() {
        return (List) this.f80412b;
    }

    public void m(x4.f fVar) {
        androidx.recyclerview.widget.e eVar = (androidx.recyclerview.widget.e) this.f80413c;
        q.c cVar = (q.c) this.f80412b;
        int i5 = fVar.f95080b;
        if (i5 != 0) {
            eVar.execute(new com.google.android.material.datepicker.g(cVar, i5, 7));
        } else {
            eVar.execute(new w(29, cVar, fVar.f95079a));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0080, code lost:
    
        if (r13 == r1) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object n(Context context, t0 t0Var, ContinuationImpl continuationImpl) throws Throwable {
        s0 s0Var;
        i iVar;
        if (continuationImpl instanceof s0) {
            s0Var = (s0) continuationImpl;
            int i5 = s0Var.f81903y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s0Var.f81903y = i5 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(this, continuationImpl);
            }
        }
        Object objA = s0Var.f81901w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s0Var.f81903y;
        if (i11 == 0) {
            ResultKt.b(objA);
            p10.s sVar = (p10.s) this.f80412b;
            long j11 = t0Var.f81916c;
            String strConcat = "redeem_".concat(t0Var.f81914a);
            s0Var.f81898t = this;
            s0Var.f81899u = context;
            s0Var.f81900v = t0Var;
            s0Var.f81903y = 1;
            objA = sVar.a(-j11, strConcat, s0Var);
            if (objA != coroutineSingletons) {
                iVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return (r0) objA;
        }
        t0Var = s0Var.f81900v;
        context = s0Var.f81899u;
        i iVar2 = s0Var.f81898t;
        ResultKt.b(objA);
        iVar = iVar2;
        Context context2 = context;
        t0 t0Var2 = t0Var;
        b0 b0Var = (b0) objA;
        if (!(b0Var instanceof a0)) {
            if (!(b0Var instanceof p10.z)) {
                throw new NoWhenBranchMatchedException();
            }
            p10.z zVar = (p10.z) b0Var;
            return new q0(zVar.f81978a, zVar.f81979b);
        }
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        b10.k kVar = new b10.k(context2, t0Var2, iVar, (Continuation) null, 29);
        s0Var.f81898t = null;
        s0Var.f81899u = null;
        s0Var.f81900v = null;
        s0Var.f81903y = 2;
        objA = m0.y(dVar, kVar, s0Var);
    }

    public void o() {
        this.f80413c = null;
    }

    @Override // o9.p2
    public void onAlarm() {
        ((Folder) this.f80413c).z((l0) this.f80412b);
    }

    @Override // fi.e
    public void onComplete(Task task) {
        rk.g gVar = (rk.g) this.f80412b;
        fi.j jVar = (fi.j) this.f80413c;
        synchronized (gVar.f86026f) {
            gVar.f86025e.remove(jVar);
        }
    }

    @Override // x80.j
    public void onFailure(x80.i iVar, IOException iOException) {
        ((ChangeLogDialog) this.f80413c).o.post(new o7.g0(this, 29));
    }

    @Override // x80.j
    public void onResponse(x80.i iVar, x80.m0 m0Var) throws IOException {
        String strString = m0Var.f95559g.string();
        ChangeLogDialog changeLogDialog = (ChangeLogDialog) this.f80413c;
        changeLogDialog.o.removeCallbacks(changeLogDialog.f46519v);
        changeLogDialog.o.post(new x4.j(this, strString, false, 5));
    }

    public void p(v vVar) {
        this.f80412b = vVar;
    }

    public void q() {
        this.f80413c = d0.f87139a;
    }

    public void r(int i5, int i11, int i12, int i13) {
        CardView cardView = (CardView) this.f80413c;
        cardView.f13855d.set(i5, i11, i12, i13);
        Rect rect = cardView.f13854c;
        super/*android.view.View*/.setPadding(i5 + rect.left, i11 + rect.top, i12 + rect.right, i13 + rect.bottom);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object s(FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration, String str, ContinuationImpl continuationImpl) {
        vr.c cVar;
        if (continuationImpl instanceof vr.c) {
            cVar = (vr.c) continuationImpl;
            int i5 = cVar.f92928v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f92928v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new vr.c(this, continuationImpl);
            }
        }
        Object obj = cVar.f92926t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f92928v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        mh.c cVar2 = (mh.c) this.f80412b;
        fl.l lVar = (fl.l) this.f80413c;
        Intrinsics.g(financialConnectionsSheetConfiguration, "<this>");
        fr.i iVarI = fl.l.i(lVar, "https://api.stripe.com/v1/financial_connections/sessions/synchronize", new ApiRequest$Options(new vr.a(financialConnectionsSheetConfiguration, 0), new vr.a(financialConnectionsSheetConfiguration, 1)), MapsKt.j0(new Pair("locale", Locale.getDefault().toLanguageTag()), new Pair("mobile", MapsKt.j0(new Pair("fullscreen", Boolean.TRUE), new Pair("hide_close_button", Boolean.FALSE), new Pair("application_id", str), new Pair("mobile_sdk_type", "fc_lite"))), new Pair("client_secret", financialConnectionsSheetConfiguration.f42658a)), 8);
        KSerializer<wr.f> kSerializerSerializer = wr.f.Companion.serializer();
        cVar.f92928v = 1;
        Object objA = cVar2.A(iVarI, kSerializerSerializer, cVar);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }

    public void t(fi.j jVar, boolean z11) {
        ((Map) this.f80413c).put(jVar, Boolean.valueOf(z11));
        jVar.f55135a.b(new m.w(12, this, jVar));
    }

    @Override // fi.c
    public Object then(Task task) {
        Bundle bundle;
        a aVar = (a) this.f80412b;
        Bundle bundle2 = (Bundle) this.f80413c;
        aVar.getClass();
        return (task.q() && (bundle = (Bundle) task.m()) != null && bundle.containsKey("google.messenger")) ? aVar.b(bundle2).s(r.f75330b, b6.b.f17563a) : task;
    }

    public String toString() {
        switch (this.f80411a) {
            case 11:
                StringBuilder sb2 = new StringBuilder(100);
                sb2.append(this.f80413c.getClass().getSimpleName());
                sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
                ArrayList arrayList = (ArrayList) this.f80412b;
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    sb2.append((String) arrayList.get(i5));
                    if (i5 < size - 1) {
                        sb2.append(", ");
                    }
                }
                sb2.append(AbstractJsonLexerKt.END_OBJ);
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public boolean u() {
        return (((Map) this.f80412b).isEmpty() && ((Map) this.f80413c).isEmpty()) ? false : true;
    }

    public void v() {
        x(rg.e.f85870p, false);
    }

    public void w(int i5, String str) {
        StringBuilder sb2 = new StringBuilder("The connection to Google Play services was lost");
        if (i5 == 1) {
            sb2.append(" due to service disconnection.");
        } else if (i5 == 3) {
            sb2.append(" due to dead object exception.");
        }
        if (str != null) {
            sb2.append(" Last reason for disconnect: ");
            sb2.append(str);
        }
        x(new Status(20, sb2.toString(), null, null), true);
    }

    public void x(Status status, boolean z11) {
        HashMap map;
        HashMap map2;
        Map map3 = (Map) this.f80412b;
        synchronized (map3) {
            map = new HashMap(map3);
        }
        Map map4 = (Map) this.f80413c;
        synchronized (map4) {
            map2 = new HashMap(map4);
        }
        for (Map.Entry entry : map.entrySet()) {
            if (z11 || ((Boolean) entry.getValue()).booleanValue()) {
                ((BasePendingResult) entry.getKey()).A(status);
            }
        }
        for (Map.Entry entry2 : map2.entrySet()) {
            if (z11 || ((Boolean) entry2.getValue()).booleanValue()) {
                ((fi.j) entry2.getKey()).b(new ApiException(status));
            }
        }
    }

    public /* synthetic */ i(int i5, Object obj, Object obj2) {
        this.f80411a = i5;
        this.f80412b = obj;
        this.f80413c = obj2;
    }

    public i(k4 k4Var, k kVar, b50.d dVar) {
        this.f80411a = 2;
        this.f80412b = k4Var;
        this.f80413c = kVar;
    }

    public /* synthetic */ i(KeyEvent.Callback callback, Object obj, int i5) {
        this.f80411a = i5;
        this.f80413c = callback;
        this.f80412b = obj;
    }

    public i(int i5, byte b11) {
        this.f80411a = i5;
        switch (i5) {
            case 22:
                k9.f fVar = new k9.f(1);
                this.f80412b = fVar;
                this.f80413c = new y90.f(fVar);
                break;
            default:
                this.f80412b = Collections.synchronizedMap(new WeakHashMap());
                this.f80413c = Collections.synchronizedMap(new WeakHashMap());
                break;
        }
    }

    public i(Context context) {
        this.f80411a = 15;
        this.f80412b = new ArrayList();
        this.f80413c = context.getApplicationContext();
    }

    public /* synthetic */ i(Object obj) {
        this.f80411a = 11;
        sg.w.h(obj);
        this.f80413c = obj;
        this.f80412b = new ArrayList();
    }

    public i(mh.c cVar, fl.l apiRequestFactory) {
        this.f80411a = 17;
        Intrinsics.g(apiRequestFactory, "apiRequestFactory");
        this.f80412b = cVar;
        this.f80413c = apiRequestFactory;
    }

    public i(p10.s sVar) {
        this.f80411a = 3;
        bu.q qVar = new bu.q(0, px.c.f83110a, px.c.class, "onEntitlementChanged", "onEntitlementChanged()V", 0, 22);
        this.f80412b = sVar;
        this.f80413c = qVar;
    }

    public i(List list) {
        this.f80411a = 14;
        this.f80412b = list;
        this.f80413c = new ke.v[list.size()];
    }

    public i(tv.d errorReporter, CoroutineContext workContext) {
        this.f80411a = 24;
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        this.f80412b = errorReporter;
        this.f80413c = workContext;
    }

    public i(int i5) {
        this.f80411a = 18;
        we.b bVar = new we.b(i5, 0);
        we.b bVar2 = new we.b(i5, 1);
        this.f80412b = bVar;
        this.f80413c = bVar2;
    }

    public i(w60.a autoCompleteViewModelSubcomponentFactoryProvider, u uVar) {
        this.f80411a = 6;
        Intrinsics.g(autoCompleteViewModelSubcomponentFactoryProvider, "autoCompleteViewModelSubcomponentFactoryProvider");
        this.f80412b = autoCompleteViewModelSubcomponentFactoryProvider;
        this.f80413c = uVar;
    }

    public i(CardView cardView) {
        this.f80411a = 20;
        this.f80413c = cardView;
    }
}
