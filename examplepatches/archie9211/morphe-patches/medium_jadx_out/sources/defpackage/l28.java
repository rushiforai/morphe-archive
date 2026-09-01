package defpackage;

import com.medium.proto.obv.post.ParagraphType;
import java.util.Set;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l28 {
    public static final x2b a = new x2b("^[ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞĀĂĄĆĈĊČĎĐĒĔĖĘĚĜĞĠĢĤĦĨĪĬĮİĲĴĶĹĻĽĿŁŃŅŇŊŌŎŐŒŔŖŘŚŜŞŠŢŤŦŨŪŬŮŰŲŴŶŸŹŻŽƏǺǼǾȘȚẀẂẄẞỲΩ∆][abcdefghijklmnopqrstuvwxyzµßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿāăąćĉċčďđēĕėęěĝğġģĥħĩīĭįıĳĵķĸĺļľŀłńņňŉŋōŏőœŕŗřśŝşšţťŧũūŭůűųŵŷźżžſǻǽǿșțȷəẁẃẅỳ,.](?= )|^[ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞĀĂĄĆĈĊČĎĐĒĔĖĘĚĜĞĠĢĤĦĨĪĬĮİĲĴĶĹĻĽĿŁŃŅŇŊŌŎŐŒŔŖŘŚŜŞŠŢŤŦŨŪŬŮŰŲŴŶŸŹŻŽƏǺǼǾȘȚẀẂẄẞỲΩ∆]’(?=[abcdefghijklmnopqrstuvwxyzµßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿāăąćĉċčďđēĕėęěĝğġģĥħĩīĭįıĳĵķĸĺļľŀłńņňŉŋōŏőœŕŗřśŝşšţťŧũūŭůűųŵŷźżžſǻǽǿșțȷəẁẃẅỳ])|^[‘“„”]?[ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞĀĂĄĆĈĊČĎĐĒĔĖĘĚĜĞĠĢĤĦĨĪĬĮİĲĴĶĹĻĽĿŁŃŅŇŊŌŎŐŒŔŖŘŚŜŞŠŢŤŦŨŪŬŮŰŲŴŶŸŹŻŽƏǺǼǾȘȚẀẂẄẞỲΩ∆]|^[0-9]{1,4}\\.?(?![0-9])");
    public static final Set b;
    public static final Set c;
    public static final Set d;
    public static final Set e;
    public static final Set f;
    public static final Set g;

    static {
        ParagraphType paragraphType = ParagraphType.BQ;
        ParagraphType paragraphType2 = ParagraphType.PQ;
        ParagraphType paragraphType3 = ParagraphType.OLI;
        ParagraphType paragraphType4 = ParagraphType.ULI;
        ParagraphType paragraphType5 = ParagraphType.H1;
        ParagraphType paragraphType6 = ParagraphType.H2;
        ParagraphType paragraphType7 = ParagraphType.H3;
        ParagraphType paragraphType8 = ParagraphType.H4;
        ParagraphType paragraphType9 = ParagraphType.SECTION_CAPTION;
        b = k80.S0(new ParagraphType[]{ParagraphType.P, paragraphType, paragraphType2, ParagraphType.PRE, paragraphType3, paragraphType4, paragraphType5, paragraphType6, paragraphType7, paragraphType8, paragraphType9});
        ParagraphType paragraphType10 = ParagraphType.HR;
        ParagraphType paragraphType11 = ParagraphType.IMG;
        ParagraphType paragraphType12 = ParagraphType.IFRAME;
        c = k80.S0(new ParagraphType[]{paragraphType10, paragraphType11, paragraphType12, ParagraphType.MIXTAPE_EMBED, paragraphType9});
        d = k80.S0(new ParagraphType[]{paragraphType10, paragraphType11, paragraphType12});
        e = k80.S0(new ParagraphType[]{paragraphType3, paragraphType4});
        k80.S0(new ParagraphType[]{paragraphType5, paragraphType6, paragraphType7, paragraphType8});
        f = k80.S0(new ParagraphType[]{paragraphType2, paragraphType});
        g = k80.S0(new ParagraphType[]{paragraphType11, paragraphType12});
    }

    public static String a(String str) {
        if (str == null) {
            str = "";
        }
        x2b x2bVar = a;
        x2bVar.getClass();
        Matcher matcher = x2bVar.a.matcher(str);
        matcher.getClass();
        ij7 ij7VarR = ep7.r(matcher, 0, str);
        if (ij7VarR == null) {
            return "";
        }
        String strGroup = ij7VarR.a.group();
        strGroup.getClass();
        return strGroup;
    }

    public static boolean b(ParagraphType paragraphType) {
        return bu1.p0(g, paragraphType);
    }

    public static boolean c(ParagraphType paragraphType) {
        return bu1.p0(b, paragraphType);
    }
}
