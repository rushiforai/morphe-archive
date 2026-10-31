package ads_mobile_sdk;

import android.util.DisplayMetrics;
import android.view.MotionEvent;
import androidx.recyclerview.widget.u1;
import b.x3;
import b.y5;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.Method;
import java.util.Map;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class qh3 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Map f8668f;

    /* renamed from: g, reason: collision with root package name */
    public final rp1 f8669g;

    /* renamed from: h, reason: collision with root package name */
    public final DisplayMetrics f8670h;

    public qh3(x3 x3Var, rp1 rp1Var, Map map, DisplayMetrics displayMetrics, vi3 vi3Var) {
        super("uOrK1kTnXRTTSJW/YCZX3lyn8uXdJpJys2ygb8g3n+oFt80nTScn8URsSHrAIKla", "bIvSx3Gq9c4v1xFy65vEuq3pJRpdZ5Ra5bUyn86wRYE=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_TOUCH_SIGNALS_TASK));
        this.f8669g = rp1Var;
        this.f8668f = map;
        this.f8670h = displayMetrics;
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) {
        MotionEvent motionEvent = (MotionEvent) this.f8668f.get("nv");
        try {
            Object[] objArr = (Object[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, motionEvent, this.f8670h);
            objArr.getClass();
            y5 y5VarO = md.o();
            Object obj = objArr[0];
            if (obj != null && objArr[1] != null) {
                long jLongValue = ((Long) obj).longValue();
                y5VarO.b();
                md mdVar = (md) y5VarO.f1095b;
                mdVar.bitField0_ |= 1;
                mdVar.tcxSignal_ = jLongValue;
                long jLongValue2 = ((Long) objArr[1]).longValue();
                y5VarO.b();
                md mdVar2 = (md) y5VarO.f1095b;
                mdVar2.bitField0_ |= 2;
                mdVar2.tcySignal_ = jLongValue2;
            }
            Object obj2 = objArr[2];
            if (obj2 != null) {
                long jLongValue3 = ((Long) obj2).longValue();
                y5VarO.b();
                md mdVar3 = (md) y5VarO.f1095b;
                mdVar3.bitField0_ |= 128;
                mdVar3.tctMs_ = jLongValue3;
            }
            Object obj3 = objArr[3];
            if (obj3 != null) {
                long jLongValue4 = ((Long) obj3).longValue();
                y5VarO.b();
                md mdVar4 = (md) y5VarO.f1095b;
                mdVar4.bitField0_ |= 16;
                mdVar4.tcp_ = jLongValue4;
            }
            Object obj4 = objArr[4];
            if (obj4 != null) {
                long jLongValue5 = ((Long) obj4).longValue();
                y5VarO.b();
                md mdVar5 = (md) y5VarO.f1095b;
                mdVar5.bitField0_ |= 4;
                mdVar5.tcd_ = jLongValue5;
            }
            Object obj5 = objArr[5];
            if (obj5 != null) {
                int i5 = ((Long) obj5).longValue() != 0 ? 2 : 1;
                y5VarO.b();
                md mdVar6 = (md) y5VarO.f1095b;
                mdVar6.getClass();
                mdVar6.obscured_ = a80.m.c(i5);
                mdVar6.bitField0_ |= 64;
            }
            Object obj6 = objArr[6];
            if (obj6 != null) {
                long jLongValue6 = ((Long) obj6).longValue();
                y5VarO.b();
                md mdVar7 = (md) y5VarO.f1095b;
                mdVar7.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
                mdVar7.source_ = jLongValue6;
            }
            Object obj7 = objArr[7];
            if (obj7 != null) {
                long jLongValue7 = ((Long) obj7).longValue();
                y5VarO.b();
                md mdVar8 = (md) y5VarO.f1095b;
                mdVar8.bitField0_ |= 256;
                mdVar8.toolType_ = jLongValue7;
            }
            Object obj8 = objArr[8];
            if (obj8 != null) {
                int i11 = ((Long) obj8).longValue() != 0 ? 2 : 1;
                y5VarO.b();
                md mdVar9 = (md) y5VarO.f1095b;
                mdVar9.getClass();
                mdVar9.isPhysicalTouch_ = a80.m.c(i11);
                mdVar9.bitField0_ |= 1024;
            }
            synchronized (x3Var) {
                a(x3Var);
                o61 o61Var = (o61) this.f8668f.get("oe");
                if (o61Var != null) {
                    long j11 = o61Var.f7784a;
                    if (j11 > 0) {
                        x3Var.b();
                        pd pdVar = (pd) x3Var.f1095b;
                        pdVar.bitField1_ = 8 | pdVar.bitField1_;
                        pdVar.tcdnSignal_ = j11;
                    }
                    long j12 = o61Var.f7785b;
                    if (j12 > 0) {
                        x3Var.b();
                        pd pdVar2 = (pd) x3Var.f1095b;
                        pdVar2.bitField1_ = 4 | pdVar2.bitField1_;
                        pdVar2.tcmSignal_ = j12;
                    }
                    long j13 = o61Var.f7786c;
                    if (j13 > 0) {
                        x3Var.b();
                        pd pdVar3 = (pd) x3Var.f1095b;
                        pdVar3.bitField1_ = 2 | pdVar3.bitField1_;
                        pdVar3.tcuSignal_ = j13;
                    }
                    long j14 = o61Var.f7787d;
                    if (j14 > 0) {
                        x3Var.b();
                        pd pdVar4 = (pd) x3Var.f1095b;
                        pdVar4.bitField1_ |= 16;
                        pdVar4.tccSignal_ = j14;
                    }
                }
                a(y5VarO);
                x3Var.b();
                ((pd) x3Var.f1095b).b((md) y5VarO.a());
                b(x3Var);
            }
            if (motionEvent != null) {
                motionEvent.recycle();
            }
        } catch (Throwable th2) {
            if (motionEvent != null) {
                motionEvent.recycle();
            }
            throw th2;
        }
    }

    public final void b(x3 x3Var) {
        DisplayMetrics displayMetrics;
        p61[] p61VarArr = (p61[]) this.f8668f.get("ro");
        if (p61VarArr == null || (displayMetrics = this.f8670h) == null || displayMetrics.density == 0.0f) {
            return;
        }
        for (int i5 = 0; i5 <= p61VarArr.length - 2; i5++) {
            p61 p61Var = p61VarArr[i5];
            y5 y5VarO = md.o();
            long jRound = Math.round(p61Var.f8111a / displayMetrics.density);
            y5VarO.b();
            md mdVar = (md) y5VarO.f1095b;
            mdVar.bitField0_ |= 1;
            mdVar.tcxSignal_ = jRound;
            long jRound2 = Math.round(p61Var.f8112b / displayMetrics.density);
            y5VarO.b();
            md mdVar2 = (md) y5VarO.f1095b;
            mdVar2.bitField0_ |= 2;
            mdVar2.tcySignal_ = jRound2;
            md mdVar3 = (md) y5VarO.a();
            x3Var.b();
            ((pd) x3Var.f1095b).a(mdVar3);
        }
    }

    public final void a(x3 x3Var) {
        Method methodA = this.f8669g.a("PWiojthJG8/WRgA+PUOqmqhrQ0WIHzDD01sltzf5IH2YkZjzf011wvIYbN8mOwRT", "aDgsekf14FKBle3V7IHtjDdBgqTx76akhtQx4u35MSk=");
        methodA.getClass();
        Object[] objArr = (Object[]) methodA.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (MotionEvent) this.f8668f.get("nv"), this.f8670h);
        objArr.getClass();
        Object obj = objArr[0];
        if (obj != null) {
            long jLongValue = ((Long) obj).longValue();
            x3Var.b();
            pd pdVar = (pd) x3Var.f1095b;
            pdVar.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            pdVar.tcxSignal_ = jLongValue;
        }
        Object obj2 = objArr[1];
        if (obj2 != null) {
            long jLongValue2 = ((Long) obj2).longValue();
            x3Var.b();
            pd pdVar2 = (pd) x3Var.f1095b;
            pdVar2.bitField0_ |= ReaderJsonLexerKt.BATCH_SIZE;
            pdVar2.tcySignal_ = jLongValue2;
        }
        Object obj3 = objArr[2];
        if (obj3 != null) {
            long jLongValue3 = ((Long) obj3).longValue();
            x3Var.b();
            pd pdVar3 = (pd) x3Var.f1095b;
            pdVar3.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
            pdVar3.tctSignal_ = jLongValue3;
        }
        Object obj4 = objArr[3];
        if (obj4 != null) {
            long jLongValue4 = ((Long) obj4).longValue();
            x3Var.b();
            pd pdVar4 = (pd) x3Var.f1095b;
            pdVar4.bitField0_ |= 1073741824;
            pdVar4.tcpSignal_ = jLongValue4;
        }
        Object obj5 = objArr[4];
        if (obj5 != null) {
            long jLongValue5 = ((Long) obj5).longValue();
            x3Var.b();
            pd pdVar5 = (pd) x3Var.f1095b;
            pdVar5.bitField0_ |= Integer.MIN_VALUE;
            pdVar5.tcdSignal_ = jLongValue5;
        }
    }

    public final void a(y5 y5Var) {
        DisplayMetrics displayMetrics;
        Map map = this.f8668f;
        o61 o61Var = (o61) map.get("oe");
        if (o61Var == null || o61Var.f7784a == 0 || (displayMetrics = this.f8670h) == null) {
            return;
        }
        float f11 = displayMetrics.density;
        if (f11 != 0.0f) {
            long jRound = Math.round(o61Var.f7790g / f11);
            y5Var.b();
            md mdVar = (md) y5Var.f1095b;
            mdVar.bitField0_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            mdVar.pathDistanceSignal_ = jRound;
            long jRound2 = Math.round((o61Var.f7793j - o61Var.f7791h) / displayMetrics.density);
            y5Var.b();
            md mdVar2 = (md) y5Var.f1095b;
            mdVar2.bitField0_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            mdVar2.viewXSignal_ = jRound2;
            long jRound3 = Math.round((o61Var.f7794k - o61Var.f7792i) / displayMetrics.density);
            y5Var.b();
            md mdVar3 = (md) y5Var.f1095b;
            mdVar3.bitField0_ |= ReaderJsonLexerKt.BATCH_SIZE;
            mdVar3.viewYSignal_ = jRound3;
            long jRound4 = Math.round(o61Var.f7791h / displayMetrics.density);
            y5Var.b();
            md mdVar4 = (md) y5Var.f1095b;
            mdVar4.bitField0_ |= SQLiteDatabase.OPEN_SHAREDCACHE;
            mdVar4.tcxDownSignal_ = jRound4;
            long jRound5 = Math.round(o61Var.f7792i / displayMetrics.density);
            y5Var.b();
            md mdVar5 = (md) y5Var.f1095b;
            mdVar5.bitField0_ |= SQLiteDatabase.OPEN_PRIVATECACHE;
            mdVar5.tcyDownSignal_ = jRound5;
            if (((MotionEvent) map.get("nv")) == null) {
                return;
            }
            long jRound6 = Math.round(((r1.getRawX() + (o61Var.f7791h - o61Var.f7793j)) - r1.getX()) / displayMetrics.density);
            if (jRound6 != 0) {
                y5Var.b();
                md mdVar6 = (md) y5Var.f1095b;
                mdVar6.bitField0_ |= SQLiteDatabase.OPEN_NOMUTEX;
                mdVar6.viewDxSignal_ = jRound6;
            }
            long jRound7 = Math.round(((r1.getRawY() + (o61Var.f7792i - o61Var.f7794k)) - r1.getY()) / displayMetrics.density);
            if (jRound7 != 0) {
                y5Var.b();
                md mdVar7 = (md) y5Var.f1095b;
                mdVar7.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
                mdVar7.viewDySignal_ = jRound7;
            }
        }
    }
}
