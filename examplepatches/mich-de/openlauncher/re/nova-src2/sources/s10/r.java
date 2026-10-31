package s10;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.MessageQueue;
import android.os.UserHandle;
import com.teslacoilsw.launcher.medialite.LocalMediaView;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import t0.y0;
import z.p0;

/* loaded from: classes.dex */
public final /* synthetic */ class r implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86628a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f86629b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f86628a = i5;
        this.f86629b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0073  */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        Object[] objArr;
        int i5;
        switch (this.f86628a) {
            case 0:
                d0 d0Var = (d0) this.f86629b;
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.android.launcher3"));
                Context context = d0Var.f86578a;
                ja.h hVar = d0Var.f86580c;
                ResolveInfo resolveInfoResolveActivity = context.getPackageManager().resolveActivity(intent, SQLiteDatabase.OPEN_FULLMUTEX);
                if ((resolveInfoResolveActivity != null ? resolveInfoResolveActivity.activityInfo : null) == null) {
                    return Uri.EMPTY;
                }
                ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
                return new Uri.Builder().scheme("appIcon").authority(new ComponentName(activityInfo.packageName, activityInfo.name).flattenToShortString()).fragment(String.valueOf(hVar.d((UserHandle) b70.g.W0(hVar.f())))).build();
            case 1:
                return ((y0) this.f86629b).d();
            case 2:
                return (g.o) this.f86629b;
            case 3:
                w20.e0.a((MessageQueue) this.f86629b);
                return Unit.f71706a;
            case 4:
                return Float.valueOf(((x3.b) ((x3.o) this.f86629b)).f95003b);
            case 5:
                LocalMediaView localMediaView = (LocalMediaView) this.f86629b;
                localMediaView.i(localMediaView.f45875e);
                return Unit.f71706a;
            case 6:
                y1.b bVar = (y1.b) this.f86629b;
                y1.i iVar = bVar.f96555a;
                Object obj = bVar.f96558d;
                if (obj != null) {
                    return iVar.a(bVar, obj);
                }
                throw new IllegalArgumentException("Value should be initialized");
            default:
                z1.v vVar = (z1.v) this.f86629b;
                do {
                    synchronized (vVar.f97981g) {
                        try {
                            if (!vVar.f97977c) {
                                vVar.f97977c = true;
                                try {
                                    r1.e eVar = vVar.f97980f;
                                    Object[] objArr2 = eVar.f85077a;
                                    int i11 = eVar.f85079c;
                                    int i12 = 0;
                                    while (i12 < i11) {
                                        z1.u uVar = (z1.u) objArr2[i12];
                                        p0 p0Var = uVar.f97969g;
                                        Function1 function1 = uVar.f97963a;
                                        Object[] objArr3 = p0Var.f97741b;
                                        long[] jArr = p0Var.f97740a;
                                        int length = jArr.length - 2;
                                        if (length >= 0) {
                                            int i13 = 0;
                                            while (true) {
                                                long j11 = jArr[i13];
                                                objArr = objArr2;
                                                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                                    int i14 = 8;
                                                    int i15 = 8 - ((~(i13 - length)) >>> 31);
                                                    int i16 = 0;
                                                    while (i16 < i15) {
                                                        if ((j11 & 255) < 128) {
                                                            i5 = i14;
                                                            function1.invoke(objArr3[(i13 << 3) + i16]);
                                                        } else {
                                                            i5 = i14;
                                                        }
                                                        j11 >>= i5;
                                                        i16++;
                                                        i14 = i5;
                                                    }
                                                    if (i15 == i14) {
                                                        if (i13 != length) {
                                                            i13++;
                                                            objArr2 = objArr;
                                                        }
                                                    }
                                                }
                                            }
                                        } else {
                                            objArr = objArr2;
                                        }
                                        p0Var.e();
                                        i12++;
                                        objArr2 = objArr;
                                    }
                                    vVar.f97977c = false;
                                } catch (Throwable th2) {
                                    vVar.f97977c = false;
                                    throw th2;
                                }
                            }
                            Unit unit = Unit.f71706a;
                        } catch (Throwable th3) {
                            throw th3;
                        }
                    }
                } while (vVar.c());
                return Unit.f71706a;
        }
    }
}
