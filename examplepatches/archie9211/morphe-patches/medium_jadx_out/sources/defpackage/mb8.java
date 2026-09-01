package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.util.AttributeSet;
import android.util.Xml;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mb8 {
    public static final ThreadLocal c = new ThreadLocal();
    public final Context a;
    public final tc8 b;

    public mb8(Context context, tc8 tc8Var) {
        context.getClass();
        tc8Var.getClass();
        this.a = context;
        this.b = tc8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0244  */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v27, types: [vb8] */
    /* JADX WARN: Type inference failed for: r0v28, types: [rb8] */
    /* JADX WARN: Type inference failed for: r0v29, types: [tb8] */
    /* JADX WARN: Type inference failed for: r0v33, types: [ub8] */
    /* JADX WARN: Type inference failed for: r0v37, types: [sb8] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v41, types: [nt0] */
    /* JADX WARN: Type inference failed for: r0v42 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v58 */
    /* JADX WARN: Type inference failed for: r0v6, types: [wb8] */
    /* JADX WARN: Type inference failed for: r0v69 */
    /* JADX WARN: Type inference failed for: r0v70 */
    /* JADX WARN: Type inference failed for: r0v71 */
    /* JADX WARN: Type inference failed for: r0v72 */
    /* JADX WARN: Type inference failed for: r0v73 */
    /* JADX WARN: Type inference failed for: r0v74 */
    /* JADX WARN: Type inference failed for: r0v75 */
    /* JADX WARN: Type inference failed for: r0v76 */
    /* JADX WARN: Type inference failed for: r0v77 */
    /* JADX WARN: Type inference failed for: r0v78 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.aa8 c(android.content.res.TypedArray r18, android.content.res.Resources r19, int r20) throws org.xmlpull.v1.XmlPullParserException {
        /*
            Method dump skipped, instruction units count: 645
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mb8.c(android.content.res.TypedArray, android.content.res.Resources, int):aa8");
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x00fc, code lost:
    
        throw new org.xmlpull.v1.XmlPullParserException("Every <deepLink> must include at least one of app:uri, app:action, or app:mimeType");
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0217, code lost:
    
        return r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.va8 a(android.content.res.Resources r28, android.content.res.XmlResourceParser r29, android.util.AttributeSet r30, int r31) throws org.xmlpull.v1.XmlPullParserException, java.io.IOException {
        /*
            Method dump skipped, instruction units count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mb8.a(android.content.res.Resources, android.content.res.XmlResourceParser, android.util.AttributeSet, int):va8");
    }

    public final ya8 b(int i) {
        int next;
        Resources resources = this.a.getResources();
        XmlResourceParser xml = resources.getXml(i);
        xml.getClass();
        AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xml);
        do {
            try {
                try {
                    next = xml.next();
                    if (next == 2) {
                        break;
                    }
                } catch (Exception e) {
                    throw new RuntimeException("Exception inflating " + resources.getResourceName(i) + " line " + xml.getLineNumber(), e);
                }
            } finally {
                xml.close();
            }
        } while (next != 1);
        if (next != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        String name = xml.getName();
        attributeSetAsAttributeSet.getClass();
        va8 va8VarA = a(resources, xml, attributeSetAsAttributeSet, i);
        if (va8VarA instanceof ya8) {
            return (ya8) va8VarA;
        }
        throw new IllegalArgumentException((MaAxRJinch.wDnwwAVwxHTbYb + name + "> did not inflate into a NavGraph").toString());
    }
}
