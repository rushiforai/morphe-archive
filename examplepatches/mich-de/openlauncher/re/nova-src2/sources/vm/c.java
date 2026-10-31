package vm;

import ae.m;
import ai.x0;
import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.UserHandle;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.node.LayoutNode;
import androidx.work.impl.WorkDatabase;
import b.c0;
import b.i8;
import b0.j1;
import b0.u1;
import c0.d0;
import c0.t;
import c9.g;
import coil.memory.MemoryCache$Key;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.folder.FolderPagedView;
import com.bytedance.sdk.openadsdk.api.init.PAGBidCallback;
import com.bytedance.sdk.openadsdk.api.init.PAGBidError;
import com.google.android.gms.internal.consent_sdk.h0;
import com.google.android.gms.internal.consent_sdk.i0;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.consent_sdk.p;
import com.google.android.gms.internal.measurement.v6;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import e20.s;
import fa.p0;
import h6.c1;
import i2.e0;
import i2.n0;
import im.e;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import k2.h;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.StringFormat;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import nova.branch.engage.sesame_lite.internal.data.UserCacheEntity;
import nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import o9.b3;
import o9.n1;
import o9.p2;
import s8.k;
import x8.n;
import x8.o;
import x8.r;
import x9.i;
import y8.f;
import ya.g0;
import ya.m0;
import za.j;

/* loaded from: classes.dex */
public class c implements vd.b, t, l7, fi.c, UserHandleDataSource, gm.a, PAGBidCallback, h, mb0.b, p2 {

    /* renamed from: c, reason: collision with root package name */
    public static volatile c f92855c;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92856a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f92857b;

    public /* synthetic */ c(int i5, Object obj, Object obj2) {
        this.f92856a = i5;
        this.f92857b = obj;
    }

    public static r q(k kVar, x8.k kVar2, MemoryCache$Key memoryCache$Key, v8.a aVar) {
        BitmapDrawable bitmapDrawable = new BitmapDrawable(kVar2.f95326a.getResources(), aVar.a());
        Object obj = aVar.b().get("coil#disk_cache_key");
        String str = obj instanceof String ? (String) obj : null;
        Object obj2 = aVar.b().get("coil#is_sampled");
        Boolean bool = obj2 instanceof Boolean ? (Boolean) obj2 : null;
        boolean z11 = false;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Bitmap.Config[] configArr = g.f19862a;
        if (kVar != null && kVar.f86764g) {
            z11 = true;
        }
        return new r(bitmapDrawable, kVar2, 1, memoryCache$Key, str, zBooleanValue, z11);
    }

    public void a(int i5, b5.g gVar, String str, Bundle bundle) {
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0042 A[Catch: all -> 0x003e, TryCatch #5 {all -> 0x003e, blocks: (B:18:0x0026, B:19:0x002a, B:21:0x0030, B:23:0x0036, B:28:0x0042, B:29:0x0048), top: B:68:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0049 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // mb0.b
    /* renamed from: b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void mo5b(Object obj) throws Throwable {
        wb0.c cVar = (wb0.c) obj;
        Object obj2 = ((wb0.d) this.f92857b).f94180a;
        synchronized (cVar) {
            if (cVar.f94176b && !cVar.f94177c) {
                cVar.f94176b = false;
                boolean z11 = true;
                cVar.f94177c = obj2 != null;
                if (obj2 != null) {
                    boolean z12 = true;
                    ArrayList arrayList = null;
                    while (true) {
                        if (arrayList == null) {
                            if (z12) {
                            }
                            synchronized (cVar) {
                            }
                            throw th;
                        }
                        try {
                            for (Object obj3 : arrayList) {
                                if (obj3 != null) {
                                    nb0.d.a(cVar.f94175a, obj3);
                                }
                            }
                            if (z12) {
                                nb0.d.a(cVar.f94175a, obj2);
                                z12 = false;
                            }
                            try {
                                synchronized (cVar) {
                                    try {
                                        arrayList = cVar.f94178d;
                                        cVar.f94178d = null;
                                        if (arrayList == null) {
                                            cVar.f94177c = false;
                                            return;
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        z11 = false;
                                    }
                                }
                            } catch (Throwable th3) {
                                th = th3;
                            }
                            try {
                                throw th;
                            } catch (Throwable th4) {
                                th = th4;
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            z11 = false;
                        }
                        if (!z11) {
                            synchronized (cVar) {
                                cVar.f94177c = false;
                            }
                        }
                        throw th;
                    }
                }
            }
        }
    }

    public void c(View view, Folder folder, i iVar) {
        ((n1) this.f92857b).O.B0(view, folder, iVar);
    }

    @Override // k2.h
    /* renamed from: clipPath-mtrdD-E */
    public void mo135clipPathmtrdDE(n0 n0Var, int i5) {
        ((i50.c) this.f92857b).getCanvas().mo12clipPathmtrdDE(n0Var, i5);
    }

    @Override // k2.h
    /* renamed from: clipRect-N_I0leg */
    public void mo136clipRectN_I0leg(float f11, float f12, float f13, float f14, int i5) {
        ((i50.c) this.f92857b).getCanvas().mo13clipRectN_I0leg(f11, f12, f13, f14, i5);
    }

    public o7.g d() throws Throwable {
        o7.g gVar = new o7.g((HashMap) this.f92857b);
        o7.g.c(gVar);
        return gVar;
    }

    public b5.g e(int i5) {
        return null;
    }

    public String f(Object obj) {
        StringWriter stringWriter = new StringWriter();
        try {
            im.d dVar = (im.d) this.f92857b;
            e eVar = new e(stringWriter, dVar.f61645a, dVar.f61646b, dVar.f61647c, dVar.f61648d);
            eVar.h(obj);
            eVar.j();
            eVar.f61650b.flush();
        } catch (IOException unused) {
        }
        return stringWriter.toString();
    }

    public b5.g g(int i5) {
        return null;
    }

    @Override // w60.a
    public Object get() {
        switch (this.f92856a) {
            case 4:
                String packageName = ((Context) ((w60.a) this.f92857b).get()).getPackageName();
                if (packageName != null) {
                    return packageName;
                }
                throw new NullPointerException("Cannot return null from a non-@Nullable @Provides method");
            default:
                return new i50.c(13, (Context) ((v6) this.f92857b).f33136b, new i8(19), new lm.e(18));
        }
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public UserCacheEntity getCacheEntity(UserHandle userHandle) {
        return new UserCacheEntity(userHandle, ((ja.h) this.f92857b).d(userHandle), false);
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public long getCurrentUserId() {
        return -1L;
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public UserHandle getUserHandle(long j11) {
        return ((ja.h) this.f92857b).e(j11);
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public Long getUserHandleId(UserHandle userHandle) {
        return Long.valueOf(((ja.h) this.f92857b).d(userHandle));
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public List getUserHandles() {
        return ((ja.h) this.f92857b).f();
    }

    public void h(y9.c cVar) {
        ((n1) this.f92857b).O.s(cVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0159 A[PHI: r5 r17 r18
      0x0159: PHI (r5v18 ??) = (r5v28 ??), (r5v27 ?? I:??[boolean, int, float, short, byte, char]), (r5v20 ??) binds: [B:90:0x0156, B:85:0x014a, B:79:0x0136] A[DONT_GENERATE, DONT_INLINE]
      0x0159: PHI (r17v1 v8.a) = (r17v0 v8.a), (r17v0 v8.a), (r17v2 v8.a) binds: [B:90:0x0156, B:85:0x014a, B:79:0x0136] A[DONT_GENERATE, DONT_INLINE]
      0x0159: PHI (r18v1 boolean) = (r18v0 boolean), (r18v0 boolean), (r18v2 boolean) binds: [B:90:0x0156, B:85:0x014a, B:79:0x0136] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r5v15 */
    /* JADX WARN: Type inference failed for: r5v16 */
    /* JADX WARN: Type inference failed for: r5v17 */
    /* JADX WARN: Type inference failed for: r5v18 */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v21 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v27 */
    /* JADX WARN: Type inference failed for: r5v28 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public v8.a i(x8.k kVar, MemoryCache$Key memoryCache$Key, f fVar, int i5) {
        v8.a aVarF;
        boolean z11;
        v8.a aVar;
        ?? r52;
        v8.a aVar2;
        if (c1.d(kVar.B)) {
            v8.b bVar = (v8.b) ((m8.k) this.f92857b).f76077c.getValue();
            if (bVar != null) {
                aVarF = bVar.f92205a.f(memoryCache$Key);
                if (aVarF == null) {
                    fa.t tVar = bVar.f92206b;
                    synchronized (tVar) {
                        try {
                            ArrayList arrayList = (ArrayList) ((LinkedHashMap) tVar.f54486b).get(memoryCache$Key);
                            aVar2 = null;
                            if (arrayList != null) {
                                int size = arrayList.size();
                                int i11 = 0;
                                while (true) {
                                    if (i11 >= size) {
                                        break;
                                    }
                                    v8.e eVar = (v8.e) arrayList.get(i11);
                                    Bitmap bitmap = (Bitmap) eVar.a().get();
                                    v8.a aVar3 = bitmap != null ? new v8.a(bitmap, eVar.b()) : null;
                                    if (aVar3 != null) {
                                        aVar2 = aVar3;
                                        break;
                                    }
                                    i11++;
                                }
                                int i12 = tVar.f54485a;
                                tVar.f54485a = i12 + 1;
                                if (i12 >= 10) {
                                    tVar.b();
                                }
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    aVarF = aVar2;
                }
            } else {
                aVarF = null;
            }
            if (aVarF != null) {
                Bitmap.Config config = aVarF.a().getConfig();
                if (config == null) {
                    config = Bitmap.Config.ARGB_8888;
                }
                boolean zEquals = false;
                if (i50.c.s(kVar, config)) {
                    Object obj = aVarF.b().get("coil#is_sampled");
                    Boolean bool = obj instanceof Boolean ? (Boolean) obj : null;
                    boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
                    if (Intrinsics.b(fVar, f.f96844c)) {
                        if (!zBooleanValue) {
                            r52 = 1;
                            aVar = null;
                        }
                        aVar = null;
                    } else {
                        String str = (String) memoryCache$Key.f20153b.get("coil#transformation_size");
                        if (str != null) {
                            zEquals = str.equals(fVar.toString());
                            aVar = null;
                        } else {
                            int width = aVarF.a().getWidth();
                            int height = aVarF.a().getHeight();
                            v4.a aVar4 = fVar.f96845a;
                            int i13 = aVar4 instanceof y8.a ? ((y8.a) aVar4).f96839d : Integer.MAX_VALUE;
                            v4.a aVar5 = fVar.f96846b;
                            int i14 = aVar5 instanceof y8.a ? ((y8.a) aVar5).f96839d : Integer.MAX_VALUE;
                            double dT = jk.b.t(width, height, i13, i14, i5);
                            boolean zA = c9.e.a(kVar);
                            if (zA) {
                                double d5 = dT > 1.0d ? 1.0d : dT;
                                z11 = zBooleanValue;
                                aVar = null;
                                if (Math.abs(i13 - (width * d5)) <= 1.0d || Math.abs(i14 - (d5 * height)) <= 1.0d) {
                                    r52 = 1;
                                } else {
                                    r52 = 1;
                                    if ((dT != 1.0d || zA) && (dT <= 1.0d || !z11)) {
                                    }
                                }
                            } else {
                                z11 = zBooleanValue;
                                aVar = null;
                                if (i13 == Integer.MIN_VALUE || i13 == Integer.MAX_VALUE) {
                                    r52 = 1;
                                } else {
                                    r52 = 1;
                                    r52 = 1;
                                    if (Math.abs(i13 - width) > 1) {
                                        zEquals = dT != 1.0d ? r52 : r52;
                                    }
                                }
                                if (i14 != Integer.MIN_VALUE && i14 != Integer.MAX_VALUE) {
                                    r52 = r52;
                                    if (Math.abs(i14 - height) <= r52) {
                                    }
                                }
                            }
                        }
                    }
                } else {
                    aVar = null;
                }
                return zEquals ? aVarF : aVar;
            }
        }
        return null;
    }

    @Override // k2.h
    public void inset(float f11, float f12, float f13, float f14) {
        i50.c cVar = (i50.c) this.f92857b;
        Canvas canvas = cVar.getCanvas();
        float fIntBitsToFloat = Float.intBitsToFloat((int) (cVar.mo111getSizeNHjbRc() >> 32)) - (f13 + f11);
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (cVar.mo111getSizeNHjbRc() & 4294967295L)) - (f14 + f12);
        long jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        if (Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) < 0.0f || Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) < 0.0f) {
            e0.a("Width and height must be greater than or equal to zero");
        }
        cVar.mo112setSizeuvyYCjk(jFloatToRawIntBits);
        canvas.translate(f11, f12);
    }

    public n1 j() {
        return (n1) this.f92857b;
    }

    public p0 k() {
        return ((n1) this.f92857b).f80002c0;
    }

    public ga.h l(g0 g0Var) {
        z.e eVar = (z.e) this.f92857b;
        ga.h hVar = (ga.h) eVar.get(g0Var);
        if (hVar != null) {
            return hVar;
        }
        ga.h hVar2 = new ga.h(g0Var.f97139b, g0Var.f97140c, g0Var.f97138a);
        hVar2.o = g0Var.f97140c;
        eVar.put(g0Var, hVar2);
        return hVar2;
    }

    public View m(int i5, Context context, ViewGroup viewGroup) {
        SparseArray sparseArray = (SparseArray) this.f92857b;
        m0 m0Var = (m0) sparseArray.get(i5);
        if (m0Var == null) {
            m0Var = new m0(1);
            sparseArray.put(i5, m0Var);
        }
        int i11 = m0Var.f97171c;
        if (i11 <= 0) {
            return LayoutInflater.from(context).inflate(i5, viewGroup, false);
        }
        int i12 = i11 - 1;
        m0Var.f97171c = i12;
        View[] viewArr = m0Var.f97170b;
        View view = viewArr[i12];
        viewArr[i12] = null;
        return view;
    }

    public void n(Folder folder, FolderIcon folderIcon) {
        n1 n1Var = (n1) this.f92857b;
        folder.f21114l = n1Var.Q;
        folderIcon.setOnFocusChangeListener(n1Var.f80012m0);
    }

    public boolean o(MotionEvent motionEvent, j jVar, Folder folder) {
        n1 n1Var = (n1) this.f92857b;
        if (n1Var.f80004e0.f82474c != null) {
            return !jVar.m(n1Var.U, motionEvent);
        }
        folder.K(true);
        return true;
    }

    @Override // o9.p2
    public void onAlarm() {
        ((Folder) this.f92857b).Y();
    }

    @Override // com.bytedance.sdk.openadsdk.api.init.PAGBidCallback
    public void onBiddingTokenCollected(String str) {
        ((x0) ((gg.b) this.f92857b)).onSuccess(str);
    }

    @Override // com.bytedance.sdk.openadsdk.api.init.PAGBidCallback
    public void onBiddingTokenFailed(PAGBidError pAGBidError) {
        ((x0) ((gg.b) this.f92857b)).onFailure(new bg.a(pAGBidError.getCode(), pAGBidError.getMessage(), "com.pangle.ads"));
    }

    @Override // nova.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public void onUsersChanged() {
    }

    public MemoryCache$Key p(x8.k kVar, Object obj, n nVar, m8.c cVar) {
        String string;
        Map linkedHashMap;
        kVar.getClass();
        List list = kVar.f95331f;
        List list2 = ((m8.k) this.f92857b).f76080f.f76049c;
        int size = list2.size();
        int i5 = 0;
        while (true) {
            if (i5 < size) {
                Pair pair = (Pair) list2.get(i5);
                t8.a aVar = (t8.a) pair.f71683a;
                if (((Class) pair.f71684b).isAssignableFrom(obj.getClass())) {
                    Intrinsics.e(aVar, "null cannot be cast to non-null type coil.key.Keyer<kotlin.Any>");
                    switch (aVar.f88889a) {
                        case 0:
                            File file = (File) obj;
                            string = file.getPath() + AbstractJsonLexerKt.COLON + file.lastModified();
                            break;
                        default:
                            Uri uri = (Uri) obj;
                            if (Intrinsics.b(uri.getScheme(), "android.resource")) {
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append(uri);
                                sb2.append('-');
                                Configuration configuration = nVar.f95352a.getResources().getConfiguration();
                                Bitmap.Config[] configArr = g.f19862a;
                                sb2.append(configuration.uiMode & 48);
                                string = sb2.toString();
                                break;
                            } else {
                                string = uri.toString();
                                break;
                            }
                    }
                    if (string != null) {
                    }
                }
                i5++;
            } else {
                string = null;
            }
        }
        if (string == null) {
            return null;
        }
        Map map = kVar.f95343t.f95366a;
        boolean zIsEmpty = map.isEmpty();
        b70.h hVar = b70.h.f17594a;
        if (zIsEmpty) {
            linkedHashMap = hVar;
        } else {
            linkedHashMap = new LinkedHashMap();
            for (Map.Entry entry : map.entrySet()) {
                ((o) entry.getValue()).getClass();
                linkedHashMap.put(entry.getKey(), "SELF");
            }
        }
        if (list.isEmpty() && linkedHashMap.isEmpty()) {
            return new MemoryCache$Key(string, hVar);
        }
        LinkedHashMap linkedHashMapU0 = MapsKt.u0(linkedHashMap);
        if (!list.isEmpty()) {
            int size2 = list.size();
            for (int i11 = 0; i11 < size2; i11++) {
                linkedHashMapU0.put(c0.h(i11, "coil#transformation_"), ((a9.b) list.get(i11)).b());
            }
            linkedHashMapU0.put("coil#transformation_size", nVar.f95354c.toString());
        }
        return new MemoryCache$Key(string, linkedHashMapU0);
    }

    public boolean r(int i5, int i11, Bundle bundle) {
        return false;
    }

    @Override // k2.h
    /* renamed from: rotate-Uv8p0NA */
    public void mo139rotateUv8p0NA(float f11, long j11) {
        Canvas canvas = ((i50.c) this.f92857b).getCanvas();
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        canvas.translate(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11));
        canvas.rotate(f11);
        canvas.translate(-Float.intBitsToFloat(i5), -Float.intBitsToFloat(i11));
    }

    public void s(Object obj, String str) {
        HashMap map = (HashMap) this.f92857b;
        if (obj == null) {
            map.put(str, null);
            return;
        }
        Class<?> cls = obj.getClass();
        if (cls == Boolean.class || cls == Byte.class || cls == Integer.class || cls == Long.class || cls == Float.class || cls == Double.class || cls == String.class || cls == Boolean[].class || cls == Byte[].class || cls == Integer[].class || cls == Long[].class || cls == Float[].class || cls == Double[].class || cls == String[].class) {
            map.put(str, obj);
            return;
        }
        int i5 = 0;
        if (cls == boolean[].class) {
            boolean[] zArr = (boolean[]) obj;
            String str2 = o7.g.f79664b;
            Boolean[] boolArr = new Boolean[zArr.length];
            while (i5 < zArr.length) {
                boolArr[i5] = Boolean.valueOf(zArr[i5]);
                i5++;
            }
            map.put(str, boolArr);
            return;
        }
        if (cls == byte[].class) {
            byte[] bArr = (byte[]) obj;
            String str3 = o7.g.f79664b;
            Byte[] bArr2 = new Byte[bArr.length];
            while (i5 < bArr.length) {
                bArr2[i5] = Byte.valueOf(bArr[i5]);
                i5++;
            }
            map.put(str, bArr2);
            return;
        }
        if (cls == int[].class) {
            int[] iArr = (int[]) obj;
            String str4 = o7.g.f79664b;
            Integer[] numArr = new Integer[iArr.length];
            while (i5 < iArr.length) {
                numArr[i5] = Integer.valueOf(iArr[i5]);
                i5++;
            }
            map.put(str, numArr);
            return;
        }
        if (cls == long[].class) {
            long[] jArr = (long[]) obj;
            String str5 = o7.g.f79664b;
            Long[] lArr = new Long[jArr.length];
            while (i5 < jArr.length) {
                lArr[i5] = Long.valueOf(jArr[i5]);
                i5++;
            }
            map.put(str, lArr);
            return;
        }
        if (cls == float[].class) {
            float[] fArr = (float[]) obj;
            String str6 = o7.g.f79664b;
            Float[] fArr2 = new Float[fArr.length];
            while (i5 < fArr.length) {
                fArr2[i5] = Float.valueOf(fArr[i5]);
                i5++;
            }
            map.put(str, fArr2);
            return;
        }
        if (cls != double[].class) {
            throw new IllegalArgumentException("Key " + str + " has invalid type " + cls);
        }
        double[] dArr = (double[]) obj;
        String str7 = o7.g.f79664b;
        Double[] dArr2 = new Double[dArr.length];
        while (i5 < dArr.length) {
            dArr2[i5] = Double.valueOf(dArr[i5]);
            i5++;
        }
        map.put(str, dArr2);
    }

    @Override // k2.h
    /* renamed from: scale-0AR0LA0 */
    public void mo140scale0AR0LA0(float f11, float f12, long j11) {
        Canvas canvas = ((i50.c) this.f92857b).getCanvas();
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        canvas.translate(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11));
        canvas.scale(f11, f12);
        canvas.translate(-Float.intBitsToFloat(i5), -Float.intBitsToFloat(i11));
    }

    public void t(HashMap map) {
        for (Map.Entry entry : map.entrySet()) {
            s(entry.getValue(), (String) entry.getKey());
        }
    }

    @Override // fi.c
    public /* bridge */ /* synthetic */ Object then(Task task) {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll((List) this.f92857b);
        return Tasks.d(arrayList);
    }

    @Override // k2.h
    /* renamed from: transform-58bKbWc */
    public void mo141transform58bKbWc(float[] fArr) {
        ((i50.c) this.f92857b).getCanvas().mo15concat58bKbWc(fArr);
    }

    @Override // k2.h
    public void translate(float f11, float f12) {
        ((i50.c) this.f92857b).getCanvas().translate(f11, f12);
    }

    public void u(int i5, View view) {
        m0 m0Var = (m0) ((SparseArray) this.f92857b).get(i5);
        if (m0Var != null) {
            View[] viewArr = m0Var.f97170b;
            if (m0Var.f97171c < m0Var.f97169a) {
                if (kotlin.collections.c.o0(view, viewArr)) {
                    throw new IllegalStateException("Recycling view that already exists in cache");
                }
                int i11 = m0Var.f97171c;
                viewArr[i11] = view;
                m0Var.f97171c = i11 + 1;
            }
        }
    }

    public boolean v(Folder folder) {
        View viewA;
        x4.j jVar = new x4.j(this, folder, false, 4);
        FolderPagedView folderPagedView = folder.f21117q;
        ca.g gVar = new ca.g(2);
        CellLayout cellLayoutA0 = folderPagedView.A0();
        if (cellLayoutA0 == null) {
            viewA = null;
        } else {
            b3 b3Var = cellLayoutA0.P;
            int iApplyAsInt = gVar.applyAsInt(b3Var);
            int i5 = folderPagedView.f21138c0;
            viewA = i5 > 0 ? b3Var.a(iApplyAsInt % i5, iApplyAsInt / i5) : b3Var.getChildAt(iApplyAsInt);
        }
        if (viewA != null) {
            folder.f21116p.O.d(true, jVar).c();
            return true;
        }
        jVar.run();
        return true;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        switch (this.f92856a) {
            case 6:
                return new com.google.android.gms.internal.consent_sdk.f((Application) ((c) this.f92857b).f92857b);
            case 7:
                h0 h0Var = i0.f32099b;
                com.google.android.gms.internal.consent_sdk.c.a(h0Var);
                return new p((v6) this.f92857b, h0Var);
            default:
                return this.f92857b;
        }
    }

    public /* synthetic */ c(Object obj, int i5) {
        this.f92856a = i5;
        this.f92857b = obj;
    }

    public c(List list) {
        this.f92856a = 11;
        this.f92857b = list;
    }

    public c(StringFormat format) {
        this.f92856a = 22;
        Intrinsics.g(format, "format");
        this.f92857b = format;
    }

    public c(y3.c cVar) {
        this.f92856a = 2;
        this.f92857b = new j1(u1.f16251a, cVar);
    }

    public c(WorkDatabase workDatabase) {
        this.f92856a = 26;
        Intrinsics.g(workDatabase, "workDatabase");
        this.f92857b = workDatabase;
    }

    public c(int i5) {
        Object eVar;
        this.f92856a = i5;
        switch (i5) {
            case 3:
                this.f92857b = new b5.h(this);
                break;
            case 10:
                this.f92857b = new z.e(0);
                break;
            case 19:
                this.f92857b = new HashMap();
                break;
            case 20:
                this.f92857b = w20.e.g(Looper.getMainLooper());
                break;
            case 21:
                if (Build.VERSION.SDK_INT >= 28) {
                    eVar = new o7.a(3);
                } else {
                    eVar = new q3.e();
                }
                this.f92857b = eVar;
                break;
            case 29:
                this.f92857b = new SparseArray();
                break;
            default:
                this.f92857b = new HashSet();
                break;
        }
    }

    @Override // c0.t
    public d0 get(int i5) {
        return (d0) this.f92857b;
    }

    public c(Context context) {
        this.f92856a = 9;
        this.f92857b = (t5.g) s.f52085b.getValue(context, s.f52084a[0]);
    }

    public c(y80.b bVar) {
        this.f92856a = 1;
        this.f92857b = new ThreadPoolExecutor(0, LayoutNode.NotPlacedPlaceOrder, 60L, TimeUnit.SECONDS, new SynchronousQueue(), bVar);
    }

    public c(ja.h hVar) {
        this.f92856a = 13;
        this.f92857b = hVar;
        hVar.a(new m(this, 7));
    }
}
