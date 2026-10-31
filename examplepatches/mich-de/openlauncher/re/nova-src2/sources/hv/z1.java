package hv;

import android.bluetooth.BluetoothProfile;
import android.content.Context;
import android.content.pm.ResolveInfo;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.instabridge.ai.proactive.AiInsightAction;
import com.instabridge.ai.proactive.AiInsightData;
import com.instabridge.ai.protocol.PendingToolCall;
import com.instabridge.ai.tools.AiTool;
import com.stripe.android.model.ConsentUi;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class z1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60707a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f60708b;

    public /* synthetic */ z1(Object obj, int i5) {
        this.f60707a = i5;
        this.f60708b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x0233  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x024d  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x031c  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        boolean zH;
        boolean z11;
        int i5;
        Object next;
        Pair pair;
        Object next2;
        View viewH0;
        z = false;
        boolean z12 = false;
        switch (this.f60707a) {
            case 0:
                ((Integer) obj2).getClass();
                g90.k.l((com.stripe.android.paymentsheet.k) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                g90.k.m((com.stripe.android.paymentsheet.b1) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 2:
                ((x7.u) this.f60708b).j().getAdapter().closeProfileProxy(((Integer) obj).intValue(), (BluetoothProfile) obj2);
                break;
            case 3:
                kw.o1 o1Var = (kw.o1) this.f60708b;
                String value = (String) obj;
                Integer num = (Integer) obj2;
                Intrinsics.g(value, "value");
                break;
            case 4:
                kw.p1 p1Var = (kw.p1) this.f60708b;
                pw.a phoneEntry = (pw.a) obj;
                kw.z1 formatter = (kw.z1) obj2;
                Intrinsics.g(phoneEntry, "phoneEntry");
                Intrinsics.g(formatter, "formatter");
                Pair pair2 = new Pair(p1Var.f72550b, phoneEntry);
                IdentifierSpec.Companion.getClass();
                break;
            case 5:
                ge.d dVar = (ge.d) this.f60708b;
                h2.c cVarO0 = g90.k.o0((RectF) obj);
                h2.c cVarO02 = g90.k.o0((RectF) obj2);
                switch (dVar.f57389a) {
                    case 25:
                        zH = cVarO0.h(cVarO02);
                        break;
                    default:
                        zH = cVarO02.a(cVarO0.b());
                        break;
                }
                break;
            case 6:
                ((Integer) obj2).getClass();
                p10.c0.f((np.d) this.f60708b, (p1.o) obj, p1.a0.l(9));
                break;
            case 7:
                ((Integer) obj2).getClass();
                p7.u.e((com.stripe.android.customersheet.d) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 8:
                y9.i iVar = (y9.i) this.f60708b;
                Pair pair3 = (Pair) obj;
                Pair pair4 = (Pair) obj2;
                Object obj3 = pair3.f71683a;
                Object obj4 = pair3.f71684b;
                Object obj5 = pair4.f71683a;
                Object obj6 = pair4.f71684b;
                int iB = iVar.b((String) obj3, (String) obj5);
                if (iB == 0) {
                    iB = ((ResolveInfo) obj4).activityInfo.packageName.compareTo(((ResolveInfo) obj6).activityInfo.packageName);
                }
                if (iB == 0) {
                    iB = ((ResolveInfo) obj4).activityInfo.name.compareTo(((ResolveInfo) obj6).activityInfo.name);
                }
                break;
            case 9:
                ou.g2 g2Var = (ou.g2) this.f60708b;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                List items = (List) obj2;
                Intrinsics.g(items, "items");
                if (zBooleanValue) {
                    z12 = true;
                } else {
                    ArrayList arrayList = new ArrayList();
                    for (Object obj7 : items) {
                        if (obj7 instanceof ou.f0) {
                            arrayList.add(obj7);
                        }
                    }
                    if (!arrayList.isEmpty()) {
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            if (((ou.f0) it.next()).f80861a.d(((Boolean) g2Var.f80889i.f80809g.f91586b.invoke()).booleanValue())) {
                                z12 = true;
                            }
                        }
                    }
                }
                break;
            case 10:
                p00.i iVar2 = (p00.i) this.f60708b;
                ((Boolean) obj).booleanValue();
                ((Boolean) obj2).booleanValue();
                iVar2.f88425b.invoke();
                break;
            case 11:
                ((Integer) obj2).getClass();
                mk.v.i((mx.f) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                wh.f.f((p10.l0) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                com.stripe.android.paymentsheet.addresselement.h0.a((w60.a) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 14:
                char[] cArr = (char[]) this.f60708b;
                CharSequence DelimitedRangesSequence = (CharSequence) obj;
                int iIntValue = ((Integer) obj2).intValue();
                Intrinsics.g(DelimitedRangesSequence, "$this$DelimitedRangesSequence");
                int iT0 = r70.k.T0(DelimitedRangesSequence, cArr, iIntValue, false);
                if (iT0 >= 0) {
                    break;
                }
                break;
            case 15:
                List list = (List) this.f60708b;
                CharSequence DelimitedRangesSequence2 = (CharSequence) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                Intrinsics.g(DelimitedRangesSequence2, "$this$DelimitedRangesSequence");
                List list2 = list;
                if (list2.size() == 1) {
                    String str = (String) b70.g.x1(list2);
                    int iS0 = r70.k.S0(DelimitedRangesSequence2, str, iIntValue2, false, 4);
                    pair = iS0 < 0 ? null : new Pair(Integer.valueOf(iS0), str);
                } else {
                    int i11 = iIntValue2 >= 0 ? iIntValue2 : 0;
                    IntRange intRange = new IntRange(i11, DelimitedRangesSequence2.length(), 1);
                    int i12 = intRange.f71908c;
                    int i13 = intRange.f71907b;
                    boolean z13 = false;
                    if (DelimitedRangesSequence2 instanceof String) {
                        if ((i12 > 0 && i11 <= i13) || (i12 < 0 && i13 <= i11)) {
                            int i14 = i11;
                            while (true) {
                                Iterator it2 = list2.iterator();
                                while (true) {
                                    if (it2.hasNext()) {
                                        next2 = it2.next();
                                        String str2 = (String) next2;
                                        if (r70.j.C0(false, 0, str2, i14, (String) DelimitedRangesSequence2, str2.length())) {
                                        }
                                    } else {
                                        next2 = null;
                                    }
                                }
                                String str3 = (String) next2;
                                if (str3 != null) {
                                    pair = new Pair(Integer.valueOf(i14), str3);
                                } else if (i14 != i13) {
                                    i14 += i12;
                                }
                            }
                        }
                    } else if ((i12 > 0 && i11 <= i13) || (i12 < 0 && i13 <= i11)) {
                        while (true) {
                            Iterator it3 = list2.iterator();
                            while (true) {
                                if (it3.hasNext()) {
                                    next = it3.next();
                                    String str4 = (String) next;
                                    z11 = z13;
                                    i5 = i11;
                                    if (!r70.k.Z0(str4, 0, DelimitedRangesSequence2, i5, str4.length(), z11)) {
                                        i11 = i5;
                                        z13 = z11;
                                    }
                                } else {
                                    z11 = z13;
                                    i5 = i11;
                                    next = null;
                                }
                            }
                            String str5 = (String) next;
                            if (str5 != null) {
                                pair = new Pair(Integer.valueOf(i5), str5);
                            } else if (i5 != i13) {
                                i11 = i5 + i12;
                                z13 = z11;
                            }
                        }
                    }
                }
                if (pair != null) {
                    break;
                }
                break;
            case 16:
                TextView textView = (TextView) this.f60708b;
                ((Boolean) obj).getClass();
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                int i15 = DesktopLockBottomSheet.f45718z;
                textView.setText(zBooleanValue2 ? 2132019258 : 2132019256);
                break;
            case 17:
                ((Integer) obj2).getClass();
                s00.f.a((h10.f) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 18:
                ((Integer) obj2).getClass();
                t0.t0.l((e1.a1) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 19:
                ((t0.g1) this.f60708b).d(((h2.b) obj2).f59016a);
                break;
            case 20:
                ((Integer) obj2).getClass();
                ((t0.y1) this.f60708b).a((p1.o) obj, p1.a0.l(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                ts.f.k((ConsentUi.ConsentPane.ScopesSection) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 22:
                tx.n nVar = (tx.n) this.f60708b;
                AiInsightAction aiInsightAction = (AiInsightAction) obj;
                AiInsightData aiInsightData = (AiInsightData) obj2;
                r70.l.G1(30, aiInsightAction.getLabel());
                aiInsightAction.getToolName();
                zy.c cVar = zy.c.f98823a;
                zy.c.i("ai_insight_feedback", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair(TTConst.TRACK_TYPE, "positive"), new Pair("trigger", "action_tap")));
                Context context = nVar.f89886a;
                String toolName = aiInsightAction.getToolName();
                vx.t tVar = fo.d.o;
                if (toolName == null || tVar == null) {
                    tx.b2.a(context, aiInsightData, "insight_left_swipe");
                    zy.c cVar2 = zy.c.f98823a;
                    zy.c.i("ai_insight_action_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("label", r70.l.G1(50, aiInsightAction.getLabel())), new Pair("tool_fallback", toolName != null ? "none" : toolName)));
                    if (toolName == null) {
                        toolName = "fallback";
                    }
                    p6.f.I(toolName, false);
                } else {
                    try {
                        List listJ = vx.t.f93370a.j(context);
                        if (!listJ.isEmpty()) {
                            Iterator it4 = listJ.iterator();
                            while (it4.hasNext()) {
                                if (Intrinsics.b(((AiTool) it4.next()).getName(), toolName)) {
                                    try {
                                        vx.t tVar2 = vx.t.f93370a;
                                        vx.t.f93385r = true;
                                        String string = UUID.randomUUID().toString();
                                        fo.d.h().interceptCallback(string, new e00.x2(toolName, 12, false ? (byte) 1 : (byte) 0));
                                        tVar.g(context, ul.b.P(new PendingToolCall(string, toolName, aiInsightAction.getToolArgs(), true)), new sx.d(7));
                                        zy.c cVar3 = zy.c.f98823a;
                                        zy.c.i("ai_insight_action_executed", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("tool", toolName), new Pair("label", r70.l.G1(50, aiInsightAction.getLabel()))));
                                        p6.f.I(toolName, true);
                                    } catch (Exception e3) {
                                        mc0.b bVar = mc0.d.f76206a;
                                        bVar.r("NOVA_AI");
                                        bVar.f(e3, "Tool execution crashed: ".concat(toolName), new Object[0]);
                                        tx.b2.a(context, aiInsightData, "insight_left_swipe");
                                    }
                                }
                            }
                        }
                    } catch (Exception unused) {
                    }
                    tx.b2.a(context, aiInsightData, "insight_left_swipe");
                    zy.c cVar22 = zy.c.f98823a;
                    zy.c.i("ai_insight_action_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("label", r70.l.G1(50, aiInsightAction.getLabel())), new Pair("tool_fallback", toolName != null ? "none" : toolName)));
                    if (toolName == null) {
                    }
                    p6.f.I(toolName, false);
                }
                break;
            case 23:
                NovaAiChatActivity novaAiChatActivity = (NovaAiChatActivity) this.f60708b;
                String str6 = (String) obj;
                boolean zBooleanValue3 = ((Boolean) obj2).booleanValue();
                int i16 = NovaAiChatActivity.C;
                ViewGroup viewGroup = (ViewGroup) novaAiChatActivity.getWindow().getDecorView().findViewById(16908290);
                if (viewGroup != null && (viewH0 = NovaAiChatActivity.h0(viewGroup)) != null) {
                    Object tag = viewH0.getTag();
                    tx.x xVar = tag instanceof tx.x ? (tx.x) tag : null;
                    if (xVar != null) {
                        ImageView imageView = xVar.f90055c;
                        ImageView imageView2 = xVar.f90054b;
                        LinearLayout linearLayout = xVar.f90056d;
                        TextView textView2 = xVar.f90053a;
                        textView2.setText(str6);
                        if (zBooleanValue3) {
                            linearLayout.setBackground(novaAiChatActivity.getDrawable(2131231098));
                            int color = novaAiChatActivity.getColor(2131099711);
                            textView2.setTextColor(color);
                            imageView2.setColorFilter(novaAiChatActivity.getColor(2131099699));
                            imageView.setColorFilter(color);
                        } else {
                            linearLayout.setBackground(novaAiChatActivity.getDrawable(2131231097));
                            int color2 = novaAiChatActivity.getColor(2131099730);
                            textView2.setTextColor(color2);
                            imageView2.setColorFilter(color2);
                            imageView.setColorFilter(color2);
                        }
                    }
                }
                break;
            case 24:
                ((Integer) obj2).getClass();
                ps.v.d((tx.q4) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                ps.c.h((us.e) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                ux.o.f((ux.i) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                ux.o.c((ux.a) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                ux.q.c((ux.j) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
            default:
                ((Integer) obj2).getClass();
                ux.t.f((ux.k) this.f60708b, (p1.o) obj, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ z1(Object obj, int i5, int i11) {
        this.f60707a = i11;
        this.f60708b = obj;
    }
}
