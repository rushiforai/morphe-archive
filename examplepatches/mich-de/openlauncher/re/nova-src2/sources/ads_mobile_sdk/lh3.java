package ads_mobile_sdk;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.InputEvent;
import android.view.View;
import androidx.recyclerview.widget.u1;
import b.lb;
import b.x3;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import vk.b0;

/* loaded from: classes2.dex */
public final class lh3 extends t93 {

    /* renamed from: f, reason: collision with root package name */
    public final Object f6237f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f6238g;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f6239l = 0;

    public lh3(x3 x3Var, rp1 rp1Var, Map map, Context context, vi3 vi3Var) {
        super("vpmI11Nm9X1EmP5JvZKsAr2FaEWFXL6PMO1qU/K8O4XSD+FXy6xvefnQfwxIctFt", "RENHEwAsoA+ES41UT7TKxJylIRCcEJNxtvTLkTylLDs=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_INPUT_EVENT_INFO_SIGNALS_TASK));
        this.f6237f = map;
        this.f6238g = context;
    }

    @Override // ads_mobile_sdk.t93
    public final void a(Method method, x3 x3Var) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        switch (this.f6239l) {
            case 0:
                Long[] lArr = new Long[9];
                Arrays.fill((Object[]) lArr, (Object) (-1L));
                lArr[0] = (Long) b0.n((Long) ((Map) this.f6237f).get("tcq"), -1L);
                lArr[1] = (Long) b0.n((Long) ((Map) this.f6237f).get("tpq"), -1L);
                lArr[2] = (Long) b0.n((Long) ((Map) this.f6237f).get("tcv"), -1L);
                lArr[3] = (Long) b0.n((Long) ((Map) this.f6237f).get("tpv"), -1L);
                lArr[4] = (Long) b0.n((Long) ((Map) this.f6237f).get("tchv"), -1L);
                lArr[5] = (Long) b0.n((Long) ((Map) this.f6237f).get("tphv"), -1L);
                lArr[6] = (Long) b0.n((Long) ((Map) this.f6237f).get("tcc"), -1L);
                lArr[7] = (Long) b0.n((Long) ((Map) this.f6237f).get("tpc"), -1L);
                lArr[8] = (Long) b0.n((Long) ((Map) this.f6237f).get("tst"), -1L);
                for (int i5 = 0; i5 < 9; i5++) {
                    if (lArr[i5] == null) {
                        lArr[i5] = -1L;
                    }
                }
                Long[] lArr2 = (Long[]) method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, lArr, Integer.valueOf(((sb3) this.f6238g).ordinal()));
                lArr2.getClass();
                synchronized (x3Var) {
                    long jLongValue = lArr2[0].longValue();
                    x3Var.b();
                    pd pdVar = (pd) x3Var.f1095b;
                    pdVar.bitField3_ |= 32;
                    pdVar.evtTime_ = jLongValue;
                    long jLongValue2 = lArr2[1].longValue();
                    x3Var.b();
                    pd pdVar2 = (pd) x3Var.f1095b;
                    pdVar2.bitField0_ |= 134217728;
                    pdVar2.utzSignal_ = jLongValue2;
                    long jLongValue3 = lArr2[2].longValue();
                    x3Var.b();
                    pd pdVar3 = (pd) x3Var.f1095b;
                    pdVar3.bitField0_ |= 2097152;
                    pdVar3.usgSignal_ = jLongValue3;
                    long jLongValue4 = lArr2[3].longValue();
                    x3Var.b();
                    pd pdVar4 = (pd) x3Var.f1095b;
                    pdVar4.bitField0_ |= SQLiteDatabase.OPEN_FULLMUTEX;
                    pdVar4.uptSignal_ = jLongValue4;
                    long jLongValue5 = lArr2[4].longValue();
                    x3Var.b();
                    pd pdVar5 = (pd) x3Var.f1095b;
                    pdVar5.bitField2_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    pdVar5.impressionDurationMs_ = jLongValue5;
                    long jLongValue6 = lArr2[5].longValue();
                    x3Var.b();
                    pd pdVar6 = (pd) x3Var.f1095b;
                    pdVar6.bitField2_ |= ReaderJsonLexerKt.BATCH_SIZE;
                    pdVar6.impressionDurationHighAttentionMs_ = jLongValue6;
                    long jLongValue7 = lArr2[6].longValue();
                    x3Var.b();
                    pd pdVar7 = (pd) x3Var.f1095b;
                    pdVar7.bitField1_ |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                    pdVar7.deviceElapsedRealTimeSignal_ = jLongValue7;
                    long jLongValue8 = lArr2[7].longValue();
                    x3Var.b();
                    pd pdVar8 = (pd) x3Var.f1095b;
                    pdVar8.bitField1_ |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    pdVar8.deviceUptimeSignal_ = jLongValue8;
                }
                return;
            case 1:
                Object objInvoke = method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (InputEvent) ((Map) this.f6237f).get("evt"), (Context) this.f6238g);
                objInvoke.getClass();
                Object[] objArr = (Object[]) objInvoke;
                lb lbVarO = vc.o();
                long jLongValue9 = ((Long) objArr[0]).longValue();
                lbVarO.b();
                vc vcVar = (vc) lbVarO.f1095b;
                vcVar.bitField0_ |= 1;
                vcVar.source_ = jLongValue9;
                int i_a$1 = a80.m._a$1(((Long) objArr[1]).intValue());
                if (i_a$1 == 0) {
                    throw null;
                }
                lbVarO.b();
                vc vcVar2 = (vc) lbVarO.f1095b;
                vcVar2.getClass();
                vcVar2.isPhysicalInput_ = a80.m.c(i_a$1);
                vcVar2.bitField0_ |= 2;
                int i_a$12 = a80.m._a$1(((Long) objArr[2]).intValue());
                if (i_a$12 == 0) {
                    throw null;
                }
                lbVarO.b();
                vc vcVar3 = (vc) lbVarO.f1095b;
                vcVar3.getClass();
                vcVar3.verified_ = a80.m.c(i_a$12);
                vcVar3.bitField0_ |= 4;
                synchronized (x3Var) {
                    vc vcVar4 = (vc) lbVarO.a();
                    x3Var.b();
                    ((pd) x3Var.f1095b).a(vcVar4);
                }
                return;
            default:
                View view = (View) this.f6238g;
                if (view == null) {
                    return;
                }
                Object objInvoke2 = method.invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (DisplayMetrics) this.f6237f, view);
                objInvoke2.getClass();
                Long[] lArr3 = (Long[]) objInvoke2;
                b.v6 v6VarO = od.o();
                long jLongValue10 = lArr3[2].longValue();
                v6VarO.b();
                od odVar = (od) v6VarO.f1095b;
                odVar.bitField0_ |= 4;
                odVar.minAlphaSignal_ = jLongValue10;
                long jLongValue11 = lArr3[1].longValue();
                v6VarO.b();
                od odVar2 = (od) v6VarO.f1095b;
                odVar2.bitField0_ |= 8;
                odVar2.viewHeight_ = jLongValue11;
                long jLongValue12 = lArr3[0].longValue();
                v6VarO.b();
                od odVar3 = (od) v6VarO.f1095b;
                odVar3.bitField0_ |= 16;
                odVar3.viewWidth_ = jLongValue12;
                long jLongValue13 = lArr3[3].longValue();
                v6VarO.b();
                od odVar4 = (od) v6VarO.f1095b;
                odVar4.bitField0_ = 1 | odVar4.bitField0_;
                odVar4.percentAdOnScreen_ = jLongValue13;
                long jLongValue14 = lArr3[4].longValue();
                v6VarO.b();
                od odVar5 = (od) v6VarO.f1095b;
                odVar5.bitField0_ |= 32;
                odVar5.displayDensity_ = jLongValue14;
                synchronized (x3Var) {
                    od odVar6 = (od) v6VarO.a();
                    x3Var.b();
                    ((pd) x3Var.f1095b).a(odVar6);
                }
                return;
        }
    }

    public lh3(x3 x3Var, rp1 rp1Var, DisplayMetrics displayMetrics, View view, vi3 vi3Var) {
        super("ktF+VSqkyodZ4tIducgfLzYxzdB5ofNGaymoDbvueLMrjNjMtHTNPm366Piu8CC0", "rXm9R0gBTUHduh38r/rV98JLnl4TdPu3aUnjFtquoyc=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_VIEW_SIGNALS_TASK));
        this.f6237f = displayMetrics;
        this.f6238g = view;
    }

    public lh3(x3 x3Var, rp1 rp1Var, sb3 sb3Var, Map map, vi3 vi3Var) {
        super("UGEehKvlkU4SDW4B4NE5sq9Y1SUhBYeK8lA7WvxibEr5oNTwuJn6DZSm7y2VXAMQ", "y8kGBnxfl+gCJUlPjWurqThF+Nx8iRaiEfVAIjzOakY=", x3Var, rp1Var, vi3Var.a(yk0.EVENT_ID_TIME_SIGNALS_TASK));
        this.f6237f = map;
        this.f6238g = sb3Var;
    }
}
