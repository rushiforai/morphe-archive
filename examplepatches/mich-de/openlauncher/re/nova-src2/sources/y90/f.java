package y90;

import android.app.ActivityOptions;
import android.app.UiModeManager;
import android.content.AttributionSource;
import android.os.Bundle;
import android.view.View;
import b.c0;
import com.amplitude.core.Configuration;
import com.bytedance.sdk.component.zb.ycx.sya;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.component.zb.ycx.zb;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.lang.reflect.Method;
import java.util.ServiceLoader;
import java.util.logging.Level;
import kotlin.KotlinNothingValueException;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;
import p6.p0;
import t70.g2;
import t70.l0;
import t70.m0;

/* loaded from: classes5.dex */
public final class f implements sya, zk.i {

    /* renamed from: b, reason: collision with root package name */
    public static f f97027b;

    /* renamed from: a, reason: collision with root package name */
    public Object f97028a;

    public /* synthetic */ f(Object obj) {
        this.f97028a = obj;
    }

    @Override // zk.i
    public void a(Closeable closeable, Throwable th2, Throwable th3) {
        if (th2 == th3) {
            return;
        }
        try {
            ((Method) this.f97028a).invoke(th2, th3);
        } catch (Throwable unused) {
            zk.g.f98554a.log(Level.WARNING, "Suppressing exception thrown when closing " + closeable, th3);
        }
    }

    public JSONObject b(View view) {
        int currentModeType;
        JSONObject jSONObjectA = ao.b.a(0, 0, 0, 0);
        UiModeManager uiModeManager = u90.b.f90710a;
        try {
            jSONObjectA.put("noOutputDevice", ao.a.f15357a[c0.F((uiModeManager == null || (currentModeType = uiModeManager.getCurrentModeType()) == 1 || currentModeType != 4) ? 2 : ul.b.f91313a)] == 1);
            return jSONObjectA;
        } catch (JSONException e3) {
            p10.c0.n("Error with setting output device status", e3);
            return jSONObjectA;
        }
    }

    public AttributionSource c() {
        return (AttributionSource) this.f97028a;
    }

    public StringBuilder d() {
        da0.a aVar = (da0.a) this.f97028a;
        if (!(aVar instanceof p)) {
            return null;
        }
        StringBuilder sb2 = ((p) aVar).f97091b.f97074b;
        if (sb2.length() == 0) {
            return null;
        }
        return sb2;
    }

    public void e() {
        g2 g2Var;
        z0.f fVar = (z0.f) this.f97028a;
        if (fVar == null || (g2Var = fVar.f97887e) == null) {
            return;
        }
        g2Var.c(null);
        fVar.f97887e = null;
    }

    public void f() {
        a1.l lVar;
        z0.f fVar = (z0.f) this.f97028a;
        if (fVar == null) {
            j0.b.d("ToolbarRequester is not initialized.");
            throw new KotlinNothingValueException();
        }
        if (fVar.getIsAttached()) {
            g2 g2Var = fVar.f97887e;
            if ((g2Var == null || !g2Var.b()) && (lVar = (a1.l) b3.g.c(fVar, a1.n.f104b)) != null) {
                fVar.f97887e = m0.t(fVar.getCoroutineScope(), null, l0.f88816d, new pu.h(fVar, lVar, (Continuation) null, 27), 1);
            }
        }
    }

    public Bundle g() {
        return ((ActivityOptions) this.f97028a).toBundle();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.sya
    public void ycx(zb zbVar, IOException iOException) {
        yb.b.c((yb.b) this.f97028a, Configuration.FLUSH_INTERVAL_MILLIS, iOException.getMessage());
    }

    public f(int i5) {
        switch (i5) {
            case 5:
                break;
            default:
                ServiceLoader serviceLoaderLoad = ServiceLoader.load(yv.a.class);
                Intrinsics.f(serviceLoaderLoad, "load(...)");
                this.f97028a = serviceLoaderLoad;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:122:0x01db A[Catch: all -> 0x01d7, TryCatch #9 {all -> 0x01d7, blocks: (B:118:0x01d3, B:122:0x01db, B:123:0x01de, B:125:0x01e9, B:127:0x01fd), top: B:166:0x01d3 }] */
    /* JADX WARN: Removed duplicated region for block: B:125:0x01e9 A[Catch: all -> 0x01d7, TryCatch #9 {all -> 0x01d7, blocks: (B:118:0x01d3, B:122:0x01db, B:123:0x01de, B:125:0x01e9, B:127:0x01fd), top: B:166:0x01d3 }] */
    /* JADX WARN: Removed duplicated region for block: B:158:0x00dd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:166:0x01d3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:187:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0152  */
    @Override // com.bytedance.sdk.component.zb.ycx.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(zb zbVar, xkz xkzVar) {
        syc sycVar;
        syc sycVar2;
        InputStream inputStream;
        int i5;
        Object obj;
        if (xkzVar == null) {
            yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.AD_INTERNAL_INTEGRATION_ERROR_VALUE, "response is empty");
            return;
        }
        InputStream inputStreamSya = null;
        try {
            ((yb.b) this.f97028a).f97235i = xkzVar.dj();
            if (((yb.b) this.f97028a).f97235i) {
                syc sycVarLt = xkzVar.lt();
                try {
                    if (((yb.b) this.f97028a).f97235i && sycVarLt != null) {
                        ((yb.b) this.f97028a).f97228b = sycVarLt.ycx() + ((yb.b) this.f97028a).f97232f;
                        inputStreamSya = sycVarLt.sya();
                    }
                    if (inputStreamSya == null) {
                        yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.CONFIG_NOT_FOUND_ERROR_VALUE, "input_stream is empty");
                        if (inputStreamSya != null) {
                            try {
                                inputStreamSya.close();
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
                                return;
                            }
                        }
                        if (sycVarLt != null) {
                            sycVarLt.close();
                        }
                        xkzVar.close();
                        if (((yb.b) this.f97028a).f97235i && ((yb.b) this.f97028a).f97230d.length() == ((yb.b) this.f97028a).f97228b) {
                            yb.b.a((yb.b) this.f97028a);
                            return;
                        }
                        return;
                    }
                    try {
                        int i11 = p0.f82236h;
                        byte[] bArr = new byte[i11];
                        try {
                            long j11 = ((yb.b) this.f97028a).f97232f;
                            ((yb.b) this.f97028a).f97237k.dy();
                            int i12 = 0;
                            int i13 = 0;
                            long j12 = 0;
                            while (true) {
                                int i14 = inputStreamSya.read(bArr, i13, i11 - i13);
                                if (i14 == -1) {
                                    break;
                                }
                                int i15 = i13 + i14;
                                j12 += i14;
                                if (((yb.b) this.f97028a).f97234h) {
                                    break;
                                }
                                if (j12 % i11 != 0) {
                                    sycVar = sycVarLt;
                                    try {
                                        if (j12 != ((yb.b) this.f97028a).f97228b - ((yb.b) this.f97028a).f97232f) {
                                            i5 = i12;
                                        }
                                        if (i5 == 0) {
                                            try {
                                                try {
                                                    Object obj2 = ((yb.b) this.f97028a).f97229c;
                                                    synchronized (obj2) {
                                                        try {
                                                            RandomAccessFile randomAccessFile = ((yb.b) this.f97028a).f97236j;
                                                            int iIntValue = Long.valueOf(j11).intValue();
                                                            ((yb.b) this.f97028a).f97237k.wie();
                                                            try {
                                                                randomAccessFile.seek(iIntValue);
                                                                randomAccessFile.write(bArr, i12, i15);
                                                            } catch (Throwable th3) {
                                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrU8UuI=", "becpkAyaYMuFWeJJhR2z", "Wv49kA24", 69);
                                                            }
                                                            yb.b bVar = (yb.b) this.f97028a;
                                                            if (!bVar.f97227a || bVar.f97238l <= -1) {
                                                                inputStream = inputStreamSya;
                                                                obj = obj2;
                                                            } else {
                                                                yb.b bVar2 = (yb.b) this.f97028a;
                                                                inputStream = inputStreamSya;
                                                                obj = obj2;
                                                                try {
                                                                    if (bVar2.f97232f + j12 >= bVar2.f97238l) {
                                                                        ((yb.b) this.f97028a).f97229c.notify();
                                                                    }
                                                                } catch (Throwable th4) {
                                                                    th = th4;
                                                                    try {
                                                                        throw th;
                                                                    } catch (Throwable th5) {
                                                                        th = th5;
                                                                        inputStreamSya = inputStream;
                                                                        try {
                                                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", 184);
                                                                            yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.AD_PUBLISHER_MISMATCH_VALUE, th.getMessage());
                                                                            if (inputStreamSya != null) {
                                                                                try {
                                                                                    inputStreamSya.close();
                                                                                } catch (Throwable th6) {
                                                                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
                                                                                    return;
                                                                                }
                                                                            }
                                                                            if (sycVar != null) {
                                                                                sycVar.close();
                                                                            }
                                                                            xkzVar.close();
                                                                            if (((yb.b) this.f97028a).f97235i || ((yb.b) this.f97028a).f97230d.length() != ((yb.b) this.f97028a).f97228b) {
                                                                                return;
                                                                            }
                                                                            yb.b.a((yb.b) this.f97028a);
                                                                            return;
                                                                        } finally {
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            j11 += i15;
                                                            i13 = 0;
                                                        } catch (Throwable th7) {
                                                            th = th7;
                                                            inputStream = inputStreamSya;
                                                            obj = obj2;
                                                            throw th;
                                                        }
                                                    }
                                                } catch (Throwable th8) {
                                                    th = th8;
                                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", 184);
                                                    yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.AD_PUBLISHER_MISMATCH_VALUE, th.getMessage());
                                                    if (inputStreamSya != null) {
                                                    }
                                                    if (sycVar != null) {
                                                    }
                                                    xkzVar.close();
                                                    if (((yb.b) this.f97028a).f97235i) {
                                                        return;
                                                    } else {
                                                        return;
                                                    }
                                                }
                                            } catch (Throwable th9) {
                                                th = th9;
                                                inputStream = inputStreamSya;
                                                inputStreamSya = inputStream;
                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", 184);
                                                yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.AD_PUBLISHER_MISMATCH_VALUE, th.getMessage());
                                                if (inputStreamSya != null) {
                                                }
                                                if (sycVar != null) {
                                                }
                                                xkzVar.close();
                                                if (((yb.b) this.f97028a).f97235i) {
                                                }
                                            }
                                        } else {
                                            inputStream = inputStreamSya;
                                            i13 = i15;
                                        }
                                        inputStreamSya = inputStream;
                                        sycVarLt = sycVar;
                                        i12 = 0;
                                    } catch (Throwable th10) {
                                        th = th10;
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", 184);
                                        yb.b.c((yb.b) this.f97028a, Sdk.SDKError.Reason.AD_PUBLISHER_MISMATCH_VALUE, th.getMessage());
                                        if (inputStreamSya != null) {
                                        }
                                        if (sycVar != null) {
                                        }
                                        xkzVar.close();
                                        if (((yb.b) this.f97028a).f97235i) {
                                        }
                                    }
                                } else {
                                    sycVar = sycVarLt;
                                }
                                i5 = 1;
                                if (i5 == 0) {
                                }
                                inputStreamSya = inputStream;
                                sycVarLt = sycVar;
                                i12 = 0;
                            }
                            sycVar2 = sycVarLt;
                            inputStreamSya = inputStreamSya;
                        } catch (Throwable th11) {
                            th = th11;
                            sycVar = sycVarLt;
                        }
                    } catch (Throwable th12) {
                        th = th12;
                        sycVar = sycVarLt;
                    }
                } catch (Throwable th13) {
                    th = th13;
                    sycVar = sycVarLt;
                }
            } else {
                yb.b.c((yb.b) this.f97028a, xkzVar.sya(), xkzVar.lud());
                sycVar2 = null;
            }
            if (inputStreamSya != null) {
                try {
                    inputStreamSya.close();
                } catch (Throwable th14) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th14, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEaTDA==", "VOAfkBCsZsmTTw==", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
                    return;
                }
            }
            if (sycVar2 != null) {
                sycVar2.close();
            }
            xkzVar.close();
            if (((yb.b) this.f97028a).f97235i && ((yb.b) this.f97028a).f97230d.length() == ((yb.b) this.f97028a).f97228b) {
                yb.b.a((yb.b) this.f97028a);
            }
        } catch (Throwable th15) {
            th = th15;
            sycVar = null;
        }
    }
}
