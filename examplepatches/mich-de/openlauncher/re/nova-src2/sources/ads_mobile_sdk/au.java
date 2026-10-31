package ads_mobile_sdk;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewStartUpResult;
import b.d2;
import b.e4;
import b.k9;
import b.x2;
import b.y6;
import cl.t0;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class au implements x2, b.b2, d2, WebViewCompat.WebViewStartUpCallback, m7.s, t0 {

    /* renamed from: a, reason: collision with root package name */
    public Object f1092a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f1093b;

    public /* synthetic */ au(Object obj, int i5) {
        this.f1093b = i5;
        this.f1092a = obj;
    }

    @Override // b.x2
    public cw0 a() {
        switch (this.f1093b) {
            case 1:
                return cw0.DISPLAY_COUNT;
            default:
                return cw0.DEVICE_TIER;
        }
    }

    public oj0 b() {
        switch (this.f1093b) {
            case 3:
                return new oj0(((b.td) this.f1092a).d());
            default:
                List listUnmodifiableList = Collections.unmodifiableList(((dq) ((y6) this.f1092a).f1095b).thirdPartySdk_);
                Intrinsics.f(listUnmodifiableList, "getThirdPartySdkList(...)");
                return new oj0(listUnmodifiableList);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0073  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object d(Continuation continuation) {
        rh0 rh0Var;
        switch (this.f1093b) {
            case 1:
                DisplayManager displayManager = (DisplayManager) ((Context) this.f1092a).getSystemService(DisplayManager.class);
                return displayManager != null ? new xu0(new zi0(displayManager.getDisplays().length)) : new tu0("Unable to get display service", wd1.f11213a);
            default:
                fi0 fi0Var = (fi0) this.f1092a;
                Integer num = new Integer(((ph0) fi0Var.f3358b.get()).getNumber());
                Integer num2 = new Integer(fi0Var.a().getNumber());
                jr0 jr0Var = fi0Var.f3357a;
                AtomicReference atomicReference = fi0Var.f3359c;
                jr0Var.getClass();
                Boolean bool = Boolean.TRUE;
                jn jnVar = jn.a$10;
                if (((Boolean) jr0Var.a("gads:device_tier_manager:enabled", bool, jnVar)).booleanValue()) {
                    jr0Var.getClass();
                    if (((Boolean) jr0Var.a("gads:available_processors_tier:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                        atomicReference.set(fi0Var.a(Runtime.getRuntime().availableProcessors()));
                        Object obj = atomicReference.get();
                        Intrinsics.f(obj, "get(...)");
                        rh0Var = (rh0) obj;
                    } else {
                        rh0Var = rh0.PROCESSOR_TIER_UNKNOWN;
                    }
                }
                return new xu0(new hi0(num, num2, new Integer(rh0Var.getNumber())));
        }
    }

    @Override // cl.t0
    public void onFailure(Throwable th2) {
        sh3 sh3Var = (sh3) this.f1092a;
        sh3Var.a(th2);
        sh3Var.a();
    }

    @Override // m7.s
    public void onPostMessage(WebView webView, m7.j jVar, Uri uri, boolean z11, m7.b bVar) throws JSONException {
        c10.a aVar = (c10.a) this.f1092a;
        try {
            JSONObject jSONObject = new JSONObject(jVar.b());
            ((b.ca) aVar.f19149c).a(jSONObject.getString("method"), jSONObject.getJSONObject("data"));
        } catch (JSONException e3) {
            Log.e("OMIDLIB", "Error parsing JS message", e3);
        }
    }

    @Override // androidx.webkit.WebViewCompat.WebViewStartUpCallback
    public void onSuccess(WebViewStartUpResult result) {
        Intrinsics.g(result, "result");
        gq3 gq3Var = (gq3) this.f1092a;
        if (gq3Var != null) {
            AtomicBoolean atomicBoolean = lp3.f6929a;
            kp3 kp3Var = new kp3(result);
            t70.m mVar = gq3Var.f4033a;
            int i5 = Result.f71687b;
            mVar.resumeWith(new xu0(kp3Var));
        }
    }

    @Override // b.b2
    public long size() {
        return ((ByteBuffer) this.f1092a).capacity();
    }

    public au(Context context) {
        this.f1093b = 1;
        Intrinsics.g(context, "context");
        this.f1092a = context;
    }

    public JSONObject a(View view) {
        int[] iArr = (int[]) this.f1092a;
        if (view == null) {
            return c72.a(0, 0, 0, 0);
        }
        int width = view.getWidth();
        int height = view.getHeight();
        view.getLocationOnScreen(iArr);
        return c72.a(iArr[0], iArr[1], width, height);
    }

    public au(Context context, fi0 deviceTierManager) {
        this.f1093b = 8;
        Intrinsics.g(context, "context");
        Intrinsics.g(deviceTierManager, "deviceTierManager");
        this.f1092a = deviceTierManager;
    }

    @Override // cl.t0
    public void onSuccess(Object obj) {
        ((sh3) this.f1092a).a();
    }

    public /* synthetic */ au(ByteArrayOutputStream byteArrayOutputStream, int i5) {
        this.f1093b = 17;
        this.f1092a = byteArrayOutputStream;
    }

    public au(int i5) {
        this.f1093b = i5;
        switch (i5) {
            case 10:
                int[] iArr = {114723506, 151129280, 1368781114, 134385090, 816173334, -1981646764, 34563124, 1737518944, 282828202};
                int i11 = iArr[7] % iArr[8];
                this.f1092a = new ArrayDeque();
                break;
            case 12:
                this.f1092a = new int[2];
                break;
        }
    }

    public void a(long j11, long j12, long j13) throws hu3 {
        int[] iArr = {1857962504, 67802545, 822753858, 1178641841, 1658857550, -1514359837, 393474692, 1520223205, 452867621};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int i14 = iArr[4];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | i14, iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        gu3 gu3Var = new gu3(j11, j12, j13);
        ArrayDeque arrayDeque = (ArrayDeque) this.f1092a;
        if (arrayDeque.size() >= iC) {
            throw new hu3();
        }
        arrayDeque.push(gu3Var);
    }

    public void a(ImageView.ScaleType scaleType) {
        Intrinsics.g(scaleType, "scaleType");
        ew1 ew1Var = ((ui.p) this.f1092a).f78297a;
        ew1Var.getClass();
        synchronized (ew1Var) {
            if (ew1Var.f3070d.get()) {
                return;
            }
            ew1Var.f3072f = scaleType;
            Unit unit = Unit.f71706a;
        }
    }

    public au(ByteBuffer byteBuffer) {
        this.f1093b = 4;
        this.f1092a = byteBuffer.slice();
    }

    @Override // b.d2
    public gu3 a() {
        return (gu3) Optional.ofNullable((gu3) ((ArrayDeque) this.f1092a).peek()).orElseThrow(fu3.f3525b);
    }

    @Override // b.d2
    public Object a() {
        return (rm2) this.f1092a;
    }

    @Override // b.d2
    public Object a(FileInputStream fileInputStream) throws yi1, ClassNotFoundException {
        try {
            b.f5 f5VarI = ((rm2) this.f1092a).i();
            nl0 nl0VarA = nl0.a();
            bu0 bu0Var = (bu0) f5VarI;
            bu0Var.getClass();
            com.google.crypto.tink.shaded.protobuf.k kVarA = com.google.crypto.tink.shaded.protobuf.k.a(fileInputStream);
            cu0 cu0VarA = cu0.a(bu0Var.f1559a, kVarA, nl0VarA);
            kVarA.a(0);
            if (cu0.m1a(cu0VarA)) {
                return cu0VarA;
            }
            throw new yi1(new zl3().getMessage());
        } catch (yi1 e3) {
            throw new cm0("Cannot read proto.", e3);
        }
    }

    @Override // b.d2
    public void a(Object obj, FileOutputStream fileOutputStream) {
        ((g) obj).a(fileOutputStream);
    }

    @Override // b.d2
    public /* synthetic */ iz a() {
        return (iz) ((e4) this.f1092a).a();
    }

    @Override // b.d2
    public /* synthetic */ pb2 a() {
        return (pb2) ((b.m7) this.f1092a).a();
    }

    @Override // b.d2
    public /* synthetic */ uh2 a() {
        return (uh2) ((b.za) this.f1092a).a();
    }

    public void a(oj0 oj0Var, yw value) {
        Intrinsics.g(value, "value");
        b.td tdVar = (b.td) this.f1092a;
        tdVar.b();
        ((ax) tdVar.f1095b).a(value);
    }

    public void a(oj0 oj0Var, cq cqVar) {
        y6 y6Var = (y6) this.f1092a;
        y6Var.b();
        ((dq) y6Var.f1095b).a(cqVar);
    }

    @Override // b.b2
    public void a(MessageDigest[] messageDigestArr, long j11, int i5) {
        ByteBuffer byteBufferSlice;
        synchronized (((ByteBuffer) this.f1092a)) {
            int i11 = (int) j11;
            ((ByteBuffer) this.f1092a).position(i11);
            ((ByteBuffer) this.f1092a).limit(i11 + i5);
            byteBufferSlice = ((ByteBuffer) this.f1092a).slice();
        }
        for (MessageDigest messageDigest : messageDigestArr) {
            byteBufferSlice.position(0);
            messageDigest.update(byteBufferSlice);
        }
    }

    @Override // b.d2
    public /* synthetic */ v30 a() {
        return (v30) ((b.ib) this.f1092a).a();
    }

    public void a(String value) {
        Intrinsics.g(value, "value");
        b.ib ibVar = (b.ib) this.f1092a;
        ibVar.b();
        ((v30) ibVar.f1095b).b(value);
    }
}
