package defpackage;

import android.content.res.Resources;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.obv.post.MarkupType;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class pi7 extends MetricAffectingSpan implements ni7 {
    public static final Map e;
    public static final Map f;
    public static final Map g;
    public final ParagraphType a;
    public final MarkupModel b;
    public final cxd c;
    public final mya d;

    static {
        nq7 nq7Var = nq7.MONO;
        nq7 nq7Var2 = nq7.MONO_BOLD;
        f09 f09Var = new f09(nq7Var, nq7Var2);
        nq7 nq7Var3 = nq7.MONO_ITALIC;
        nq7 nq7Var4 = nq7.MONO_BOLD_ITALIC;
        f09 f09Var2 = new f09(nq7Var3, nq7Var4);
        nq7 nq7Var5 = nq7.SOURCE_SERIF_PRO;
        nq7 nq7Var6 = nq7.SOURCE_SERIF_PRO_BOLD;
        f09 f09Var3 = new f09(nq7Var5, nq7Var6);
        nq7 nq7Var7 = nq7.SOURCE_SERIF_PRO_ITALIC;
        nq7 nq7Var8 = nq7.SOURCE_SERIF_PRO_BOLD_ITALIC;
        f09 f09Var4 = new f09(nq7Var7, nq7Var8);
        nq7 nq7Var9 = nq7.SOHNE_REGULAR;
        nq7 nq7Var10 = nq7.SOHNE_MEDIUM;
        f09 f09Var5 = new f09(nq7Var9, nq7Var10);
        nq7 nq7Var11 = nq7.SOHNE_REGULAR_ITALIC;
        nq7 nq7Var12 = nq7.SOHNE_MEDIUM_ITALIC;
        e = ei7.Q(f09Var, f09Var2, f09Var3, f09Var4, f09Var5, new f09(nq7Var11, nq7Var12));
        f = ei7.Q(new f09(nq7Var, nq7Var3), new f09(nq7Var2, nq7Var4), new f09(nq7Var5, nq7Var7), new f09(nq7Var6, nq7Var8), new f09(nq7Var9, nq7Var11), new f09(nq7Var10, nq7Var12));
        g = ei7.Q(new f09(nq7Var5, nq7Var), new f09(nq7Var6, nq7Var2), new f09(nq7Var7, nq7Var3), new f09(nq7Var8, nq7Var4));
    }

    public pi7(ParagraphType paragraphType, MarkupModel markupModel, cxd cxdVar, mya myaVar) {
        paragraphType.getClass();
        cxdVar.getClass();
        this.a = paragraphType;
        this.b = markupModel;
        this.c = cxdVar;
        this.d = myaVar;
        if (bu1.p0(d46.R(MarkupType.STRONG, MarkupType.EM, MarkupType.CODE), markupModel.type)) {
            return;
        }
        ay0.e("Invalid markup type");
        throw null;
    }

    @Override // defpackage.ni7
    public final MarkupModel b() {
        return this.b;
    }

    public final void e(TextPaint textPaint) {
        Map map;
        List list;
        Typeface typefaceA;
        MarkupType markupType = this.b.type;
        int i = markupType == null ? -1 : oi7.a[markupType.ordinal()];
        if (i == 1) {
            x2b x2bVar = l28.a;
            boolean zP0 = bu1.p0(l28.f, this.a);
            Map map2 = f;
            if (zP0) {
                Set<Map.Entry> setEntrySet = map2.entrySet();
                int iP = ei7.P(cu1.k0(setEntrySet, 10));
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                for (Map.Entry entry : setEntrySet) {
                    linkedHashMap.put((nq7) entry.getValue(), (nq7) entry.getKey());
                }
                map = linkedHashMap;
            } else {
                map = map2;
            }
        } else if (i != 2) {
            map = e;
        } else {
            textPaint.setTextSize(((Resources) this.d.b).getDimension(R.dimen.common_text_size_pre));
            map = g;
        }
        Typeface typeface = textPaint.getTypeface();
        List list2 = ey3.a;
        cxd cxdVar = this.c;
        if (typeface != null) {
            cxdVar.getClass();
            list = (List) cxdVar.b.get(typeface);
            if (list == null) {
                list = list2;
            }
        } else {
            list = null;
        }
        if (list != null) {
            list2 = list;
        }
        Iterator it2 = list2.iterator();
        while (it2.hasNext()) {
            nq7 nq7Var = (nq7) map.get((nq7) it2.next());
            if (nq7Var != null && (typefaceA = cxdVar.a(nq7Var)) != null) {
                textPaint.setTypeface(typefaceA);
                return;
            }
        }
    }

    public final String toString() {
        return "MarkupStyleSpan{markup=" + this.b + "}";
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.getClass();
        e(textPaint);
    }

    @Override // android.text.style.MetricAffectingSpan
    public final void updateMeasureState(TextPaint textPaint) {
        textPaint.getClass();
        e(textPaint);
    }
}
