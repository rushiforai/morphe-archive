package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.View;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import com.medium.android.core.navigation.s;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.postpublishing.ui.PublicationFlowFragment;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class g98 extends x55 implements x45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g98(ParagraphEditText paragraphEditText, int i) {
        super(1, 0, ParagraphEditText.class, paragraphEditText, "setShouldWindowFocusWait", "setShouldWindowFocusWait(Z)V");
        this.a = i;
        switch (i) {
            case 3:
                super(1, 0, ParagraphEditText.class, paragraphEditText, "onTextContextMenuItem", "onTextContextMenuItem(I)Z");
                break;
            case 4:
            case 7:
            default:
                break;
            case 5:
                super(1, 0, ParagraphEditText.class, paragraphEditText, "setShouldWindowFocusWait", "setShouldWindowFocusWait(Z)V");
                break;
            case 6:
                super(1, 0, ParagraphEditText.class, paragraphEditText, "onTextContextMenuItem", "onTextContextMenuItem(I)Z");
                break;
            case 8:
                super(1, 0, ParagraphEditText.class, paragraphEditText, "setShouldWindowFocusWait", "setShouldWindowFocusWait(Z)V");
                break;
            case 9:
                super(1, 0, ParagraphEditText.class, paragraphEditText, "onTextContextMenuItem", "onTextContextMenuItem(I)Z");
                break;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0, types: [n92] */
    /* JADX WARN: Type inference failed for: r4v15 */
    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = 1;
        int i3 = 0;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                String str = (String) obj;
                str.getClass();
                i98 i98Var = (i98) ((b98) this.receiver);
                i98Var.getClass();
                i98Var.a.k(str);
                return c1eVar;
            case 1:
                yw1 yw1Var = (yw1) obj;
                yw1Var.getClass();
                ((ParagraphEditIframeLayout) this.receiver).g(yw1Var);
                return c1eVar;
            case 2:
                ((ParagraphEditText) this.receiver).setShouldWindowFocusWait(((Boolean) obj).booleanValue());
                return c1eVar;
            case 3:
                return Boolean.valueOf(((ParagraphEditText) this.receiver).onTextContextMenuItem(((Number) obj).intValue()));
            case 4:
                yw1 yw1Var2 = (yw1) obj;
                yw1Var2.getClass();
                ((ParagraphEditImageLayout) this.receiver).g(yw1Var2);
                return c1eVar;
            case 5:
                ((ParagraphEditText) this.receiver).setShouldWindowFocusWait(((Boolean) obj).booleanValue());
                return c1eVar;
            case 6:
                return Boolean.valueOf(((ParagraphEditText) this.receiver).onTextContextMenuItem(((Number) obj).intValue()));
            case 7:
                yw1 yw1Var3 = (yw1) obj;
                yw1Var3.getClass();
                ((ParagraphEditTextLayout) this.receiver).g(yw1Var3);
                return c1eVar;
            case 8:
                ((ParagraphEditText) this.receiver).setShouldWindowFocusWait(((Boolean) obj).booleanValue());
                return c1eVar;
            case 9:
                return Boolean.valueOf(((ParagraphEditText) this.receiver).onTextContextMenuItem(((Number) obj).intValue()));
            case 10:
                View view = (View) obj;
                view.getClass();
                ((l19) this.receiver).getClass();
                return Boolean.valueOf(g76.L(view.getTag(), "divider"));
            case 11:
                Highlight highlight = (Highlight) obj;
                highlight.getClass();
                ((z19) this.receiver).c(highlight);
                return c1eVar;
            case 12:
                Highlight highlight2 = (Highlight) obj;
                highlight2.getClass();
                ((z19) this.receiver).c(highlight2);
                return c1eVar;
            case 13:
                Highlight highlight3 = (Highlight) obj;
                highlight3.getClass();
                ((z19) this.receiver).d(highlight3);
                return c1eVar;
            case 14:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                q1a q1aVar = ((i1a) this.receiver).b;
                Object value = q1aVar.i.a.getValue();
                k1aVar = value instanceof k1a ? (k1a) value : 0;
                if (k1aVar != 0 && k1aVar.a != zBooleanValue) {
                    q1aVar.e(k1a.a(k1aVar, zBooleanValue, false, false, 30));
                }
                return c1eVar;
            case 15:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                q1a q1aVar2 = ((i1a) this.receiver).b;
                Object value2 = q1aVar2.i.a.getValue();
                k1a k1aVar = value2 instanceof k1a ? (k1a) value2 : null;
                if (k1aVar != null && k1aVar.b != zBooleanValue2) {
                    q1aVar2.e(k1a.a(k1aVar, false, zBooleanValue2, false, 29));
                }
                return c1eVar;
            case 16:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                q1a q1aVar3 = ((i1a) this.receiver).b;
                Object value3 = q1aVar3.i.a.getValue();
                k1a k1aVar2 = value3 instanceof k1a ? (k1a) value3 : null;
                if (k1aVar2 != null && k1aVar2.c != zBooleanValue3) {
                    q1aVar3.e(k1a.a(k1aVar2, false, false, zBooleanValue3, 27));
                }
                return c1eVar;
            case 17:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                q1a q1aVar4 = ((i1a) this.receiver).b;
                Object value4 = q1aVar4.i.a.getValue();
                k1a k1aVar3 = value4 instanceof k1a ? (k1a) value4 : null;
                if (k1aVar3 != null && k1aVar3.d != zBooleanValue4) {
                    vx0.c0(f76.F(q1aVar4), null, null, new o1a(q1aVar4, zBooleanValue4, k1aVar, i3), 3);
                }
                return c1eVar;
            case 18:
                Calendar calendar = (Calendar) obj;
                calendar.getClass();
                e9a e9aVar = (e9a) this.receiver;
                e9aVar.getClass();
                w9a w9aVar = e9aVar.b;
                vx0.c0(f76.F(w9aVar), null, null, new nx9(w9aVar, calendar, k1aVar, 5), 3);
                return c1eVar;
            case 19:
                xqc xqcVar = (xqc) obj;
                xqcVar.getClass();
                e9a e9aVar2 = (e9a) this.receiver;
                e9aVar2.getClass();
                xpc xpcVar = e9aVar2.b.m;
                xpcVar.getClass();
                xpcVar.m(null, xqcVar);
                return c1eVar;
            case 20:
                String str2 = (String) obj;
                str2.getClass();
                fha fhaVar = ((sda) this.receiver).a;
                fhaVar.getClass();
                vx0.c0(f76.F(fhaVar), null, null, new bha(fhaVar, str2, k1aVar, i2), 3);
                return c1eVar;
            case 21:
                String str3 = (String) obj;
                str3.getClass();
                fha fhaVar2 = ((sda) this.receiver).a;
                fhaVar2.getClass();
                vx0.c0(f76.F(fhaVar2), null, null, new bha(fhaVar2, str3, k1aVar, i3), 3);
                return c1eVar;
            case 22:
                boolean zBooleanValue5 = ((Boolean) obj).booleanValue();
                fha fhaVar3 = ((sda) this.receiver).a;
                fhaVar3.getClass();
                vx0.c0(f76.F(fhaVar3), null, null, new yga(fhaVar3, zBooleanValue5, k1aVar, i3), 3);
                return c1eVar;
            case 23:
                eea eeaVar = (eea) obj;
                eeaVar.getClass();
                fha fhaVar4 = ((sda) this.receiver).a;
                fhaVar4.getClass();
                vx0.c0(f76.F(fhaVar4), null, null, new aha(fhaVar4, eeaVar, null), 3);
                return c1eVar;
            case 24:
                boolean zBooleanValue6 = ((Boolean) obj).booleanValue();
                fha fhaVar5 = ((sda) this.receiver).a;
                fhaVar5.getClass();
                vx0.c0(f76.F(fhaVar5), null, null, new yga(fhaVar5, zBooleanValue6, k1aVar, i2), 3);
                return c1eVar;
            case 25:
                boolean zBooleanValue7 = ((Boolean) obj).booleanValue();
                lma lmaVar = (lma) this.receiver;
                lmaVar.getClass();
                vx0.c0(f76.F(lmaVar), null, null, new lj1(lmaVar, zBooleanValue7, k1aVar, 8), 3);
                return c1eVar;
            case 26:
                String str4 = (String) obj;
                str4.getClass();
                mda mdaVar = (mda) this.receiver;
                mdaVar.getClass();
                PublicationFlowFragment publicationFlowFragment = mdaVar.a;
                s sVarZ = publicationFlowFragment.Z();
                Context contextS = publicationFlowFragment.S();
                if (publicationFlowFragment.u0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                ((p13) sVarZ).f(contextS, Uri.parse(i03.q + "/hc/en-us/articles/29278995392407-Verification-FAQ-and-Troubleshooting"), str4);
                return c1eVar;
            case 27:
                pj8 pj8Var = (pj8) obj;
                pj8Var.getClass();
                nqa nqaVar = ((cqa) this.receiver).c;
                vx0.c0(f76.F(nqaVar), null, null, new nx9(nqaVar, pj8Var, k1aVar, 18), 3);
                return c1eVar;
            case 28:
                Boolean bool = (Boolean) obj;
                boolean zBooleanValue8 = bool.booleanValue();
                nqa nqaVar2 = (nqa) this.receiver;
                vob vobVar = nqaVar2.c;
                vobVar.d("notification_permission_granted", bool);
                vobVar.d("can_request_permission", Boolean.FALSE);
                if (!zBooleanValue8) {
                    vx0.c0(f76.F(nqaVar2), null, null, new lqa(nqaVar2, k1aVar, i3), 3);
                }
                return c1eVar;
            default:
                uid uidVarB = (uid) obj;
                uidVarB.getClass();
                i9b i9bVar = (i9b) this.receiver;
                i9bVar.getClass();
                z9b z9bVar = i9bVar.b;
                long j = uidVarB.b;
                mx mxVar = uidVarB.a;
                if (mxVar.b.length() > 280) {
                    String strX0 = muc.x0(280, mxVar.b);
                    int length = strX0.length();
                    int i4 = bkd.c;
                    uidVarB = uid.b(uidVarB, strX0, lk7.q(iq7.v((int) (j >> 32), 0, length), iq7.v((int) (j & 4294967295L), 0, length)), 4);
                }
                z9bVar.l.setValue(uidVarB);
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g98(ParagraphEditIframeLayout paragraphEditIframeLayout) {
        super(1, 0, ParagraphEditIframeLayout.class, paragraphEditIframeLayout, "execCommand", "execCommand(Lcom/medium/android/common/post/editor/Command;)V");
        this.a = 1;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g98(ParagraphEditImageLayout paragraphEditImageLayout) {
        super(1, 0, ParagraphEditImageLayout.class, paragraphEditImageLayout, "execCommand", "execCommand(Lcom/medium/android/common/post/editor/Command;)V");
        this.a = 4;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g98(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g98(ParagraphEditTextLayout paragraphEditTextLayout) {
        super(1, 0, ParagraphEditTextLayout.class, paragraphEditTextLayout, "execCommand", "execCommand(Lcom/medium/android/common/post/editor/Command;)V");
        this.a = 7;
    }
}
