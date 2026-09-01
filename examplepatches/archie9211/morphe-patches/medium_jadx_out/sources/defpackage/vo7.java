package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewTreeObserver;
import com.adobe.internal.xmp.XMPException;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.reader.R;
import j$.util.DesugarCollections;
import j$.util.DesugarTimeZone;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class vo7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;

    public static final ArrayList A(String str, Bundle bundle) {
        ArrayList arrayListJ = Build.VERSION.SDK_INT >= 34 ? v4.j(bundle, str, vx0.T(n1b.a.b(Bundle.class))) : bundle.getParcelableArrayList(str);
        if (arrayListJ != null) {
            return arrayListJ;
        }
        wo7.q(str);
        throw null;
    }

    public static final boolean B(String str, Bundle bundle) {
        str.getClass();
        return bundle.containsKey(str) && bundle.get(str) == null;
    }

    public static boolean C(Node node) {
        if (node.getNodeType() != 3) {
            return false;
        }
        String nodeValue = node.getNodeValue();
        for (int i = 0; i < nodeValue.length(); i++) {
            if (!Character.isWhitespace(nodeValue.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static final String D(int i, int i2, Object[] objArr, x12 x12Var) {
        return ((Resources) ((p65) x12Var).j(eo.c)).getQuantityString(i, i2, Arrays.copyOf(objArr, objArr.length));
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void E(defpackage.w9f r16, defpackage.y9f r17, org.w3c.dom.Node r18, boolean r19) throws com.adobe.internal.xmp.XMPException {
        /*
            Method dump skipped, instruction units count: 341
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vo7.E(w9f, y9f, org.w3c.dom.Node, boolean):void");
    }

    public static void F(w9f w9fVar, y9f y9fVar, Node node, boolean z) throws XMPException {
        y9f y9fVarN = n(w9fVar, y9fVar, node, null, z);
        for (int i = 0; i < node.getAttributes().getLength(); i++) {
            Node nodeItem = node.getAttributes().item(i);
            if (!"xmlns".equals(nodeItem.getPrefix()) && (nodeItem.getPrefix() != null || !"xmlns".equals(nodeItem.getNodeName()))) {
                String namespaceURI = nodeItem.getNamespaceURI();
                String localName = nodeItem.getLocalName();
                if ("xml:lang".equals(nodeItem.getNodeName())) {
                    o(y9fVarN, "xml:lang", nodeItem.getNodeValue());
                } else if (!"http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI) || (!"ID".equals(localName) && !"datatype".equals(localName))) {
                    ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid attribute for literal property element");
                    return;
                }
            }
        }
        String str = "";
        for (int i2 = 0; i2 < node.getChildNodes().getLength(); i2++) {
            Node nodeItem2 = node.getChildNodes().item(i2);
            if (nodeItem2.getNodeType() != 3) {
                ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid child of literal property element");
                return;
            }
            str = str + nodeItem2.getNodeValue();
        }
        y9fVarN.b = str;
    }

    public static void G(w9f w9fVar, y9f y9fVar, Node node, boolean z, p49 p49Var) throws XMPException {
        int iZ = z(node);
        if (iZ != 8 && iZ != 0) {
            ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Node element must be rdf:Description or typed node");
            return;
        }
        if (z && iZ == 0) {
            ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Top level typed node not allowed");
            return;
        }
        int i = 0;
        for (int i2 = 0; i2 < node.getAttributes().getLength(); i2++) {
            Node nodeItem = node.getAttributes().item(i2);
            if (!"xmlns".equals(nodeItem.getPrefix()) && (nodeItem.getPrefix() != null || !"xmlns".equals(nodeItem.getNodeName()))) {
                int iZ2 = z(nodeItem);
                if (iZ2 == 0) {
                    n(w9fVar, y9fVar, nodeItem, nodeItem.getNodeValue(), z);
                } else {
                    if (iZ2 != 6 && iZ2 != 2 && iZ2 != 3) {
                        ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid nodeElement attribute");
                        return;
                    }
                    if (i > 0) {
                        ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Mutally exclusive about, ID, nodeID attributes");
                        return;
                    }
                    i++;
                    if (z && iZ2 == 3) {
                        String str = y9fVar.a;
                        if (str == null || str.length() <= 0) {
                            y9fVar.a = nodeItem.getNodeValue();
                        } else if (!y9fVar.a.equals(nodeItem.getNodeValue())) {
                            ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Mismatched top level rdf:about values");
                            return;
                        }
                    }
                }
            }
        }
        H(w9fVar, y9fVar, node, z, p49Var);
    }

    public static void H(w9f w9fVar, y9f y9fVar, Node node, boolean z, p49 p49Var) throws XMPException {
        int i;
        boolean z2;
        boolean z3;
        Integer num;
        int i2 = 0;
        while (i2 < node.getChildNodes().getLength()) {
            Node nodeItem = node.getChildNodes().item(i2);
            if (C(nodeItem)) {
                i = i2;
            } else {
                if (nodeItem.getNodeType() != 1) {
                    ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Expected property element node not found");
                    return;
                }
                if (y9fVar.j().b != -1 && i2 > y9fVar.j().b) {
                    return;
                }
                int iZ = z(nodeItem);
                if (!((iZ == 8 || (10 <= iZ && iZ <= 12)) ? false : !(1 <= iZ && iZ <= 7))) {
                    ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid property element name");
                    return;
                }
                NamedNodeMap attributes = nodeItem.getAttributes();
                ArrayList arrayList = null;
                for (int i3 = 0; i3 < attributes.getLength(); i3++) {
                    Node nodeItem2 = attributes.item(i3);
                    if ("xmlns".equals(nodeItem2.getPrefix()) || (nodeItem2.getPrefix() == null && "xmlns".equals(nodeItem2.getNodeName()))) {
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        arrayList.add(nodeItem2.getNodeName());
                    }
                }
                if (arrayList != null) {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        attributes.removeNamedItem((String) it2.next());
                    }
                }
                if (attributes.getLength() > 3) {
                    E(w9fVar, y9fVar, nodeItem, z);
                    i = i2;
                } else {
                    int i4 = 0;
                    while (i4 < attributes.getLength()) {
                        Node nodeItem3 = attributes.item(i4);
                        String localName = nodeItem3.getLocalName();
                        String namespaceURI = nodeItem3.getNamespaceURI();
                        i = i2;
                        String nodeValue = nodeItem3.getNodeValue();
                        if ("xml:lang".equals(nodeItem3.getNodeName()) && !("ID".equals(localName) && "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI))) {
                            i4++;
                            i2 = i;
                        } else if ("datatype".equals(localName) && "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI)) {
                            F(w9fVar, y9fVar, nodeItem, z);
                        } else if ("parseType".equals(localName) && "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI)) {
                            if ("Literal".equals(nodeValue)) {
                                ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "ParseTypeLiteral property element not allowed");
                                return;
                            }
                            if (!"Resource".equals(nodeValue)) {
                                if ("Collection".equals(nodeValue)) {
                                    ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "ParseTypeCollection property element not allowed");
                                    return;
                                } else {
                                    ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "ParseTypeOther property element not allowed");
                                    return;
                                }
                            }
                            y9f y9fVarN = n(w9fVar, y9fVar, nodeItem, "", z);
                            y9fVarN.j().g(true);
                            for (int i5 = 0; i5 < nodeItem.getAttributes().getLength(); i5++) {
                                Node nodeItem4 = nodeItem.getAttributes().item(i5);
                                if (!"xmlns".equals(nodeItem4.getPrefix()) && (nodeItem4.getPrefix() != null || !"xmlns".equals(nodeItem4.getNodeName()))) {
                                    String localName2 = nodeItem4.getLocalName();
                                    String namespaceURI2 = nodeItem4.getNamespaceURI();
                                    if ("xml:lang".equals(nodeItem4.getNodeName())) {
                                        o(y9fVarN, "xml:lang", nodeItem4.getNodeValue());
                                    } else if (!"http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI2) || (!"ID".equals(localName2) && !"parseType".equals(localName2))) {
                                        ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid attribute for ParseTypeResource property element");
                                        return;
                                    }
                                }
                            }
                            H(w9fVar, y9fVarN, nodeItem, false, p49Var);
                            if (y9fVarN.j) {
                                t(y9fVarN);
                            }
                            z2 = false;
                        } else {
                            E(w9fVar, y9fVar, nodeItem, z);
                        }
                    }
                    i = i2;
                    if (nodeItem.hasChildNodes()) {
                        for (int i6 = 0; i6 < nodeItem.getChildNodes().getLength(); i6++) {
                            if (nodeItem.getChildNodes().item(i6).getNodeType() != 3) {
                                if (z && "iX:changes".equals(nodeItem.getNodeName())) {
                                    z2 = false;
                                } else {
                                    y9f y9fVarN2 = n(w9fVar, y9fVar, nodeItem, "", z);
                                    for (int i7 = 0; i7 < nodeItem.getAttributes().getLength(); i7++) {
                                        Node nodeItem5 = nodeItem.getAttributes().item(i7);
                                        if (!"xmlns".equals(nodeItem5.getPrefix()) && (nodeItem5.getPrefix() != null || !"xmlns".equals(nodeItem5.getNodeName()))) {
                                            String localName3 = nodeItem5.getLocalName();
                                            String namespaceURI3 = nodeItem5.getNamespaceURI();
                                            if ("xml:lang".equals(nodeItem5.getNodeName())) {
                                                o(y9fVarN2, "xml:lang", nodeItem5.getNodeValue());
                                            } else if (!"ID".equals(localName3) || !"http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI3)) {
                                                ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid attribute for resource property element");
                                                return;
                                            }
                                        }
                                    }
                                    boolean z4 = false;
                                    for (int i8 = 0; i8 < nodeItem.getChildNodes().getLength(); i8++) {
                                        Node nodeItem6 = nodeItem.getChildNodes().item(i8);
                                        if (!C(nodeItem6)) {
                                            if (nodeItem6.getNodeType() != 1 || z4) {
                                                if (z4) {
                                                    ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Invalid child of resource property element");
                                                    return;
                                                } else {
                                                    ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Children of resource property element must be XML elements");
                                                    return;
                                                }
                                            }
                                            boolean zEquals = "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(nodeItem6.getNamespaceURI());
                                            String localName4 = nodeItem6.getLocalName();
                                            if (zEquals && "Bag".equals(localName4)) {
                                                y9fVarN2.j().e(512, true);
                                            } else if (zEquals && "Seq".equals(localName4)) {
                                                t4a t4aVarJ = y9fVarN2.j();
                                                t4aVarJ.e(512, true);
                                                t4aVarJ.e(1024, true);
                                            } else if (zEquals && "Alt".equals(localName4)) {
                                                t4a t4aVarJ2 = y9fVarN2.j();
                                                t4aVarJ2.e(512, true);
                                                t4aVarJ2.e(1024, true);
                                                t4aVarJ2.e(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, true);
                                            } else {
                                                y9fVarN2.j().g(true);
                                                if (!zEquals && !"Description".equals(localName4)) {
                                                    String namespaceURI4 = nodeItem6.getNamespaceURI();
                                                    if (namespaceURI4 == null) {
                                                        ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "All XML elements must be in a namespace");
                                                        return;
                                                    }
                                                    o(y9fVarN2, "rdf:type", namespaceURI4 + ':' + localName4);
                                                }
                                            }
                                            if (y9fVarN2.j().c(512) && (num = (Integer) DesugarCollections.unmodifiableMap(p49Var.b).get(y9fVarN2.a)) != null) {
                                                y9fVarN2.j().b = num.intValue();
                                            }
                                            G(w9fVar, y9fVarN2, nodeItem6, false, p49Var);
                                            if (y9fVarN2.j) {
                                                t(y9fVarN2);
                                            } else if (y9fVarN2.j().c(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) && y9fVarN2.j().c(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) && y9fVarN2.n()) {
                                                Iterator itP = y9fVarN2.p();
                                                while (itP.hasNext()) {
                                                    if (((y9f) itP.next()).j().c(64)) {
                                                        z3 = true;
                                                        y9fVarN2.j().e(4096, true);
                                                        mo7.S(y9fVarN2);
                                                        break;
                                                    }
                                                }
                                            }
                                            z3 = true;
                                            z4 = z3;
                                        }
                                    }
                                    z2 = false;
                                    if (!z4) {
                                        ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Missing child of resource property element");
                                        return;
                                    }
                                }
                            }
                        }
                        F(w9fVar, y9fVar, nodeItem, z);
                    } else {
                        E(w9fVar, y9fVar, nodeItem, z);
                    }
                }
            }
            i2 = i + 1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0031 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void I(android.content.res.Resources.Theme r6) {
        /*
            int r0 = android.os.Build.VERSION.SDK_INT
            r1 = 29
            if (r0 < r1) goto La
            defpackage.nm.y(r6)
            return
        La:
            java.lang.Object r0 = defpackage.guc.n
            monitor-enter(r0)
            boolean r1 = defpackage.guc.p     // Catch: java.lang.Throwable -> L21
            r2 = 0
            if (r1 != 0) goto L2d
            r1 = 1
            java.lang.Class<android.content.res.Resources$Theme> r3 = android.content.res.Resources.Theme.class
            java.lang.String r4 = "rebase"
            java.lang.reflect.Method r3 = r3.getDeclaredMethod(r4, r2)     // Catch: java.lang.Throwable -> L21 java.lang.NoSuchMethodException -> L23
            defpackage.guc.o = r3     // Catch: java.lang.Throwable -> L21 java.lang.NoSuchMethodException -> L23
            r3.setAccessible(r1)     // Catch: java.lang.Throwable -> L21 java.lang.NoSuchMethodException -> L23
            goto L2b
        L21:
            r6 = move-exception
            goto L43
        L23:
            r3 = move-exception
            java.lang.String r4 = "ResourcesCompat"
            java.lang.String r5 = "Failed to retrieve rebase() method"
            android.util.Log.i(r4, r5, r3)     // Catch: java.lang.Throwable -> L21
        L2b:
            defpackage.guc.p = r1     // Catch: java.lang.Throwable -> L21
        L2d:
            java.lang.reflect.Method r1 = defpackage.guc.o     // Catch: java.lang.Throwable -> L21
            if (r1 == 0) goto L41
            r1.invoke(r6, r2)     // Catch: java.lang.Throwable -> L21 java.lang.reflect.InvocationTargetException -> L35 java.lang.IllegalAccessException -> L37
            goto L41
        L35:
            r6 = move-exception
            goto L38
        L37:
            r6 = move-exception
        L38:
            java.lang.String r1 = "ResourcesCompat"
            java.lang.String r3 = "Failed to invoke rebase() method via reflection"
            android.util.Log.i(r1, r3, r6)     // Catch: java.lang.Throwable -> L21
            defpackage.guc.o = r2     // Catch: java.lang.Throwable -> L21
        L41:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L21
            return
        L43:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L21
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vo7.I(android.content.res.Resources$Theme):void");
    }

    public static final npa J(x12 x12Var) {
        Object[] objArr = new Object[0];
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new lg9(9);
            p65Var.j0(objM);
        }
        return (npa) hp7.F(objArr, npa.b, (m45) objM, p65Var, 384);
    }

    public static void K(StringBuilder sb, wg6 wg6Var, z05 z05Var, List list, boolean z) throws IOException {
        if (wg6Var.getTypeParameters().size() >= list.size() || vx0.T(wg6Var).getDeclaringClass() == null) {
            sb.append(aq7.B(z05.f(z05Var)));
        } else {
            Class<?> declaringClass = vx0.T(wg6Var).getDeclaringClass();
            declaringClass.getClass();
            K(sb, n1b.a.b(declaringClass), z05Var.e(), bu1.s0(list, wg6Var.getTypeParameters().size()), false);
            sb.append(".");
            sb.append(aq7.z(z05Var.g()));
        }
        M(sb, bu1.g1(list, wg6Var.getTypeParameters().size()), z);
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0221  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x020e  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x021a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String L(defpackage.qj6 r15) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 555
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vo7.L(qj6):java.lang.String");
    }

    public static void M(StringBuilder sb, List list, boolean z) throws IOException {
        StringBuilder sb2;
        if (list.isEmpty()) {
            sb2 = sb;
        } else {
            sb2 = sb;
            bu1.E0(list, sb2, null, "<", ">", null, 114);
        }
        if (z) {
            sb2.append("?");
        }
    }

    public static final y26 N(InputStream inputStream) {
        inputStream.getClass();
        return new y26(inputStream, new fmd());
    }

    public static void O(Activity activity) {
        View viewE;
        int iHashCode = activity.hashCode();
        HashMap map = xue.d;
        HashMap map2 = null;
        if (!ec2.a.contains(xue.class)) {
            try {
                map2 = xue.d;
            } catch (Throwable th) {
                ec2.a(xue.class, th);
            }
        }
        Integer numValueOf = Integer.valueOf(iHashCode);
        Object xueVar = map2.get(numValueOf);
        if (xueVar == null) {
            xueVar = new xue(activity);
            map2.put(numValueOf, xueVar);
        }
        xue xueVar2 = (xue) xueVar;
        Set set = ec2.a;
        if (set.contains(xue.class)) {
            return;
        }
        try {
        } catch (Throwable th2) {
            ec2.a(xue.class, th2);
        }
        if (set.contains(xueVar2)) {
            return;
        }
        try {
            if (!xueVar2.c.getAndSet(true) && (viewE = r40.E((Activity) xueVar2.a.get())) != null) {
                ViewTreeObserver viewTreeObserver = viewE.getViewTreeObserver();
                if (viewTreeObserver.isAlive()) {
                    viewTreeObserver.addOnGlobalLayoutListener(xueVar2);
                    xueVar2.a();
                    return;
                }
                return;
                ec2.a(xue.class, th2);
            }
        } catch (Throwable th3) {
            ec2.a(xueVar2, th3);
        }
    }

    public static void P(Activity activity) {
        View viewE;
        int iHashCode = activity.hashCode();
        HashMap map = xue.d;
        HashMap map2 = null;
        if (!ec2.a.contains(xue.class)) {
            try {
                map2 = xue.d;
            } catch (Throwable th) {
                ec2.a(xue.class, th);
            }
        }
        xue xueVar = (xue) map2.remove(Integer.valueOf(iHashCode));
        if (xueVar != null) {
            Set set = ec2.a;
            if (set.contains(xue.class)) {
                return;
            }
            try {
                if (!set.contains(xueVar)) {
                    try {
                        if (xueVar.c.getAndSet(false) && (viewE = r40.E((Activity) xueVar.a.get())) != null) {
                            ViewTreeObserver viewTreeObserver = viewE.getViewTreeObserver();
                            if (viewTreeObserver.isAlive()) {
                                viewTreeObserver.removeOnGlobalLayoutListener(xueVar);
                            }
                        }
                    } catch (Throwable th2) {
                        ec2.a(xueVar, th2);
                    }
                }
            } catch (Throwable th3) {
                ec2.a(xue.class, th3);
            }
        }
    }

    public static final String Q(int i, Object[] objArr, x12 x12Var) {
        return ((Resources) ((p65) x12Var).j(eo.c)).getString(i, Arrays.copyOf(objArr, objArr.length));
    }

    public static final String R(x12 x12Var, int i) {
        return ((Resources) ((p65) x12Var).j(eo.c)).getString(i);
    }

    public static String S(Context context, long j) {
        context.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis() - j;
        if (jCurrentTimeMillis < 0) {
            jCurrentTimeMillis = 0;
        }
        if (jCurrentTimeMillis < 60000) {
            String string = context.getString(R.string.common_just_now);
            string.getClass();
            return string;
        }
        if (jCurrentTimeMillis < 3600000) {
            int i = in3.d;
            String string2 = context.getString(R.string.common_abbreviated_minutes_ago, String.valueOf(in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.MINUTES)));
            string2.getClass();
            return string2;
        }
        if (jCurrentTimeMillis < 86400000) {
            int i2 = in3.d;
            String string3 = context.getString(R.string.common_abbreviated_hours_ago, String.valueOf(in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.HOURS)));
            string3.getClass();
            return string3;
        }
        if (jCurrentTimeMillis < 604800000) {
            int i3 = in3.d;
            String string4 = context.getString(R.string.common_abbreviated_days_ago, String.valueOf(in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.DAYS)));
            string4.getClass();
            return string4;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(j);
        if (calendar.get(1) == Calendar.getInstance().get(1)) {
            String string5 = context.getString(R.string.short_month_day_date_format);
            string5.getClass();
            String str = new SimpleDateFormat(string5, Locale.US).format(Long.valueOf(j));
            str.getClass();
            return str;
        }
        String string6 = context.getString(R.string.short_month_day_year_date_format);
        string6.getClass();
        String str2 = new SimpleDateFormat(string6, Locale.US).format(Long.valueOf(j));
        str2.getClass();
        return str2;
    }

    public static String T(Context context, long j) {
        context.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis() - j;
        if (jCurrentTimeMillis < 0) {
            jCurrentTimeMillis = 0;
        }
        if (jCurrentTimeMillis < 60000) {
            String string = context.getString(R.string.common_just_now);
            string.getClass();
            return string;
        }
        if (jCurrentTimeMillis < 3600000) {
            int i = in3.d;
            long j2 = in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.MINUTES);
            String quantityString = context.getResources().getQuantityString(R.plurals.n_minutes_ago, (int) j2, String.valueOf(j2));
            quantityString.getClass();
            return quantityString;
        }
        if (jCurrentTimeMillis < 86400000) {
            int i2 = in3.d;
            long j3 = in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.HOURS);
            String quantityString2 = context.getResources().getQuantityString(R.plurals.n_hours_ago, (int) j3, String.valueOf(j3));
            quantityString2.getClass();
            return quantityString2;
        }
        if (jCurrentTimeMillis < 604800000) {
            int i3 = in3.d;
            long j4 = in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.DAYS);
            String quantityString3 = context.getResources().getQuantityString(R.plurals.n_days_ago, (int) j4, String.valueOf(j4));
            quantityString3.getClass();
            return quantityString3;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(j);
        if (calendar.get(1) == Calendar.getInstance().get(1)) {
            String string2 = context.getString(R.string.short_month_day_date_format);
            string2.getClass();
            String str = new SimpleDateFormat(string2, Locale.US).format(Long.valueOf(j));
            str.getClass();
            return str;
        }
        String string3 = context.getString(R.string.short_month_day_year_date_format);
        string3.getClass();
        String str2 = new SimpleDateFormat(string3, Locale.US).format(Long.valueOf(j));
        str2.getClass();
        return str2;
    }

    public static int U(int i, byte[] bArr, int i2, int i3, yuf yufVar, hmf hmfVar) throws zzale {
        if ((i >>> 3) == 0) {
            throw zzale.b();
        }
        int i4 = i & 7;
        if (i4 == 0) {
            int iD0 = d0(bArr, i2, hmfVar);
            yufVar.c(i, Long.valueOf(hmfVar.b));
            return iD0;
        }
        if (i4 == 1) {
            yufVar.c(i, Long.valueOf(e0(i2, bArr)));
            return i2 + 8;
        }
        if (i4 == 2) {
            int iC0 = c0(bArr, i2, hmfVar);
            int i5 = hmfVar.a;
            if (i5 < 0) {
                throw zzale.e();
            }
            if (i5 > bArr.length - iC0) {
                throw zzale.g();
            }
            if (i5 == 0) {
                yufVar.c(i, hsf.b);
            } else {
                yufVar.c(i, hsf.p(bArr, iC0, i5));
            }
            return iC0 + i5;
        }
        if (i4 != 3) {
            if (i4 != 5) {
                throw zzale.b();
            }
            yufVar.c(i, Integer.valueOf(b0(i2, bArr)));
            return i2 + 4;
        }
        yuf yufVarE = yuf.e();
        int i6 = (i & (-8)) | 4;
        int i7 = hmfVar.d + 1;
        hmfVar.d = i7;
        if (i7 >= 100) {
            throw new zzale("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i8 = 0;
        while (true) {
            if (i2 >= i3) {
                break;
            }
            int iC02 = c0(bArr, i2, hmfVar);
            i8 = hmfVar.a;
            if (i8 == i6) {
                i2 = iC02;
                break;
            }
            i2 = U(i8, bArr, iC02, i3, yufVarE, hmfVar);
        }
        hmfVar.d--;
        if (i2 > i3 || i8 != i6) {
            throw zzale.f();
        }
        yufVar.c(i, yufVarE);
        return i2;
    }

    public static int V(int i, byte[] bArr, int i2, hmf hmfVar) {
        int i3 = i & 127;
        int i4 = i2 + 1;
        byte b2 = bArr[i2];
        if (b2 >= 0) {
            hmfVar.a = i3 | (b2 << 7);
            return i4;
        }
        int i5 = i3 | ((b2 & 127) << 7);
        int i6 = i2 + 2;
        byte b3 = bArr[i4];
        if (b3 >= 0) {
            hmfVar.a = i5 | (b3 << 14);
            return i6;
        }
        int i7 = i5 | ((b3 & 127) << 14);
        int i8 = i2 + 3;
        byte b4 = bArr[i6];
        if (b4 >= 0) {
            hmfVar.a = i7 | (b4 << 21);
            return i8;
        }
        int i9 = i7 | ((b4 & 127) << 21);
        int i10 = i2 + 4;
        byte b5 = bArr[i8];
        if (b5 >= 0) {
            hmfVar.a = i9 | (b5 << 28);
            return i10;
        }
        int i11 = i9 | ((b5 & 127) << 28);
        while (true) {
            int i12 = i10 + 1;
            if (bArr[i10] >= 0) {
                hmfVar.a = i11;
                return i12;
            }
            i10 = i12;
        }
    }

    public static int W(Object obj, suf sufVar, byte[] bArr, int i, int i2, int i3, hmf hmfVar) throws zzale {
        kuf kufVar = (kuf) sufVar;
        int i4 = hmfVar.d + 1;
        hmfVar.d = i4;
        if (i4 >= 100) {
            throw new zzale("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iK = kufVar.k(obj, bArr, i, i2, i3, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return iK;
    }

    public static int X(Object obj, suf sufVar, byte[] bArr, int i, int i2, hmf hmfVar) throws zzale {
        int iV = i + 1;
        int i3 = bArr[i];
        if (i3 < 0) {
            iV = V(i3, bArr, iV, hmfVar);
            i3 = hmfVar.a;
        }
        int i4 = iV;
        if (i3 < 0 || i3 > i2 - i4) {
            throw zzale.g();
        }
        int i5 = hmfVar.d + 1;
        hmfVar.d = i5;
        if (i5 >= 100) {
            throw new zzale("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i6 = i4 + i3;
        sufVar.e(obj, bArr, i4, i6, hmfVar);
        hmfVar.d--;
        hmfVar.c = obj;
        return i6;
    }

    public static int Y(byte[] bArr, int i, hmf hmfVar) throws zzale {
        int iC0 = c0(bArr, i, hmfVar);
        int i2 = hmfVar.a;
        if (i2 < 0) {
            throw zzale.e();
        }
        if (i2 > bArr.length - iC0) {
            throw zzale.g();
        }
        if (i2 == 0) {
            hmfVar.c = hsf.b;
            return iC0;
        }
        hmfVar.c = hsf.p(bArr, iC0, i2);
        return iC0 + i2;
    }

    public static final vx1 Z(jrg jrgVar) {
        vx1 vx1Var = new vx1();
        jrgVar.b(bf3.d, new hha(vx1Var));
        return vx1Var;
    }

    public static final void a(mn4 mn4Var, long j, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1353562852);
        int i2 = i | (p65Var2.f(mn4Var) ? 4 : 2) | (p65Var2.e(j) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            Object obj = objM;
            if (objM == uobVar) {
                br brVarA = er.a();
                brVarA.g(1);
                p65Var2.j0(brVarA);
                obj = brVarA;
            }
            br brVar = (br) obj;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = bjc.b(new yj8(23, mn4Var));
                p65Var2.j0(objM2);
            }
            upc upcVarB = zu.b(((Number) ((upc) objM2).getValue()).floatValue(), ek7.N(i48.DefaultEffects, p65Var2), null, p65Var2, 0, 28);
            p65 p65Var3 = p65Var2;
            int i3 = i2 & 14;
            boolean z = i3 == 4;
            Object objM3 = p65Var3.M();
            if (z || objM3 == uobVar) {
                objM3 = new eb8(12, mn4Var);
                p65Var3.j0(objM3);
            }
            r28 r28VarL = jfc.l(new go1((x45) objM3), 16.0f);
            boolean zF = (i3 == 4) | p65Var3.f(upcVarB) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var3.h(brVar);
            Object objM4 = p65Var3.M();
            if (zF || objM4 == uobVar) {
                r28Var = r28VarL;
                zt0 zt0Var = new zt0(mn4Var, upcVarB, j, brVar, 3);
                p65Var3.j0(zt0Var);
                objM4 = zt0Var;
            } else {
                r28Var = r28VarL;
            }
            pxf.a(r28Var, (x45) objM4, p65Var3, 0);
            p65Var = p65Var3;
        } else {
            p65 p65Var4 = p65Var2;
            p65Var4.S();
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v61(mn4Var, j, i, 3);
        }
    }

    public static int a0(suf sufVar, int i, byte[] bArr, int i2, int i3, duf dufVar, hmf hmfVar) throws zzale {
        ytf ytfVarZza = sufVar.zza();
        suf sufVar2 = sufVar;
        byte[] bArr2 = bArr;
        int i4 = i3;
        hmf hmfVar2 = hmfVar;
        int iX = X(ytfVarZza, sufVar2, bArr2, i2, i4, hmfVar2);
        sufVar2.d(ytfVarZza);
        hmfVar2.c = ytfVarZza;
        puf pufVar = (puf) dufVar;
        pufVar.add(ytfVarZza);
        while (iX < i4) {
            hmf hmfVar3 = hmfVar2;
            int i5 = i4;
            int iC0 = c0(bArr2, iX, hmfVar3);
            if (i != hmfVar3.a) {
                break;
            }
            byte[] bArr3 = bArr2;
            suf sufVar3 = sufVar2;
            ytf ytfVarZza2 = sufVar3.zza();
            iX = X(ytfVarZza2, sufVar3, bArr3, iC0, i5, hmfVar3);
            sufVar2 = sufVar3;
            bArr2 = bArr3;
            i4 = i5;
            hmfVar2 = hmfVar3;
            sufVar2.d(ytfVarZza2);
            hmfVar2.c = ytfVarZza2;
            pufVar.add(ytfVarZza2);
        }
        return iX;
    }

    /* JADX WARN: Removed duplicated region for block: B:212:0x0420  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x042e  */
    /* JADX WARN: Removed duplicated region for block: B:217:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(boolean r81, defpackage.x45 r82, defpackage.r28 r83, boolean r84, defpackage.cl1 r85, defpackage.x12 r86, int r87, int r88) {
        /*
            Method dump skipped, instruction units count: 1085
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vo7.b(boolean, x45, r28, boolean, cl1, x12, int, int):void");
    }

    public static int b0(int i, byte[] bArr) {
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    public static final void c(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-287813606);
        if (p65Var.P(i & 1, i != 0)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new be7(8);
                p65Var.j0(objM);
            }
            b(false, (x45) objM, null, false, null, p65Var, 54, 28);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new be7(9);
                p65Var.j0(objM2);
            }
            b(true, (x45) objM2, null, false, null, p65Var, 54, 28);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new be7(10);
                p65Var.j0(objM3);
            }
            b(false, (x45) objM3, null, false, null, p65Var, 3126, 20);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new be7(11);
                p65Var.j0(objM4);
            }
            b(true, (x45) objM4, null, false, null, p65Var, 3126, 20);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 5);
        }
    }

    public static int c0(byte[] bArr, int i, hmf hmfVar) {
        int i2 = i + 1;
        byte b2 = bArr[i];
        if (b2 < 0) {
            return V(b2, bArr, i2, hmfVar);
        }
        hmfVar.a = b2;
        return i2;
    }

    public static final void d(final gx7 gx7Var, final ek8 ek8Var, x12 x12Var, int i) {
        String str = gx7Var.g;
        String str2 = gx7Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(993761628);
        int i2 = (p65Var.f(gx7Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str3 = gx7Var.e;
            boolean z = gx7Var.a;
            kx kxVarW = ho2.w(p65Var, 1522196097);
            String strQ = Q(R.string.notification_type_mention_in_post, new Object[]{str2, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str2.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = gx7Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_mention);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: hx7
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            gx7 gx7Var2 = gx7Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.j(gx7Var2.f, gx7Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(gx7Var2.c, gx7Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i5 != 0 || objM2 == uobVar) {
                    final int i6 = 1;
                    objM2 = new m45() { // from class: hx7
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            gx7 gx7Var2 = gx7Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.j(gx7Var2.f, gx7Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(gx7Var2.c, gx7Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str3, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(gx7Var, ek8Var, i, 26);
        }
    }

    public static int d0(byte[] bArr, int i, hmf hmfVar) {
        int i2 = i + 1;
        long j = bArr[i];
        if (j >= 0) {
            hmfVar.b = j;
            return i2;
        }
        int i3 = i + 2;
        byte b2 = bArr[i2];
        long j2 = (j & 127) | (((long) (b2 & 127)) << 7);
        int i4 = 7;
        while (b2 < 0) {
            int i5 = i3 + 1;
            byte b3 = bArr[i3];
            i4 += 7;
            j2 |= ((long) (b3 & 127)) << i4;
            b2 = b3;
            i3 = i5;
        }
        hmfVar.b = j2;
        return i3;
    }

    public static final void e(vaf vafVar, laf lafVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        int i2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-684844869);
        int i4 = i | (p65Var.f(vafVar) ? 4 : 2) | (p65Var.f(lafVar) ? 32 : 16) | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8);
            r28Var2 = o28Var;
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i6 = haf.a[vafVar.a.ordinal()];
            if (i6 == 1) {
                i2 = -1316755004;
                i3 = R.string.you_posts_public_posts;
            } else if (i6 == 2) {
                i2 = -1316752698;
                i3 = R.string.you_posts_unlisted_posts;
            } else if (i6 == 3) {
                i2 = -1316750429;
                i3 = R.string.you_posts_draft_posts;
            } else {
                if (i6 != 4) {
                    throw ho2.L(p65Var, -1316756576, false);
                }
                i2 = -1316748061;
                i3 = R.string.you_posts_submissions;
            }
            String strW = km4.w(p65Var, i2, i3, p65Var, false);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            nwb nwbVar = new nwb(strW);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, 22);
                p65Var.j0(objM2);
            }
            tr7.a(nwbVar, (m45) objM2, bgf.N(r28Var2, "you_posts_post_type_selector"), 0L, 0, 0, 0, p65Var, 432, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new z7b(l78Var, 23);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(1817169882, new gab(vafVar, lafVar, l78Var, 11), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2f(i, 1, r28Var2, vafVar, lafVar);
        }
    }

    public static long e0(int i, byte[] bArr) {
        return ((((long) bArr[i + 7]) & 255) << 56) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48);
    }

    public static final void f(naa naaVar, iaa iaaVar, a1a a1aVar, r28 r28Var, x12 x12Var, int i) {
        iaa iaaVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(868788294);
        int i2 = (p65Var.f(r28Var) ? 2048 : 1024) | i | (p65Var.f(naaVar) ? 4 : 2) | (p65Var.f(iaaVar) ? 32 : 16) | (p65Var.f(a1aVar) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 56.0f, 7);
            boolean z = ((i2 & 14) == 4) | ((i2 & 7168) == 2048);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = z | (i3 == 32) | ((i2 & 896) == 256);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                iu iuVar = new iu(naaVar, iaaVar, r28Var, a1aVar, 19);
                p65Var.j0(iuVar);
                objM = iuVar;
            }
            iaaVar2 = iaaVar;
            k40.t(r28Var, null, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, ((i2 >> 9) & 14) | 384, 506);
            boolean z3 = i3 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new lo5(iaaVar2, null, 20);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            iaaVar2 = iaaVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 22, r28Var, (Object) naaVar, (Object) iaaVar2, (Object) a1aVar);
        }
    }

    public static final void g(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1082503281);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.b(null, null, null, null, null, null, null, p65Var, 0, 127);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 5);
        }
    }

    public static final void h(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1418357757);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).l;
            sn3 sn3Var = z22.h;
            float fZ = ((m73) p65Var.j(sn3Var)).z(mkdVar.a.b);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(mkdVar.b.c) - fZ;
            long j4 = ((zo7) p65Var.j(kt7.b)).c;
            r28 r28VarE = jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 32.0f, 24.0f, 0.0f, 8), 0.8f), fZ);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarE, j4, nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, fZ2, p65Var);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0.9f), fZ), j4, nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, fZ2, p65Var);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0.7f), fZ), j4, nr5Var), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 4);
        }
    }

    public static final void i(qaa qaaVar, nhc nhcVar, iaa iaaVar, a1a a1aVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1419342934);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(qaaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(iaaVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(a1aVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new mr9(17);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(wxb.a(r28Var, false, (x45) objM), null, null, pxf.E(1292156388, new w87(nhcVar, 8), p65Var2), null, 0, 0L, 0L, qb8.p, pxf.E(1347904123, new gx4(qaaVar, iaaVar, a1aVar, 15), p65Var2), p65Var, 805309440, 246);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(qaaVar, nhcVar, iaaVar, a1aVar, r28Var, i, 12);
        }
    }

    public static final void j(String str, String str2, pkf pkfVar, r28 r28Var, vaa vaaVar, x12 x12Var, int i) {
        r28 r28Var2;
        vaa vaaVar2;
        vaa vaaVar3;
        r28 r28Var3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1283654973);
        int i2 = 2;
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(pkfVar) ? 256 : 128) | 11264;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 8);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    vaaVar3 = (vaa) to7.z(n1b.a.b(vaa.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                vaaVar3 = vaaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(vaaVar3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            iaa iaaVar = new iaa(pkfVar, vaaVar3, str);
            a1a a1aVar = new a1a(vaaVar3, i2, pkfVar);
            i((qaa) l78VarZ.getValue(), nhcVarF, iaaVar, a1aVar, r28Var3, p65Var, 24576);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH = p65Var.h(vaaVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(a1aVar);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                uk8 uk8Var = new uk8(vaaVar3, nhcVarF, sb2Var, resources, a1aVar, (n92) null, 8);
                p65Var.j0(uk8Var);
                objM3 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            vaaVar2 = vaaVar3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            vaaVar2 = vaaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) pkfVar, r28Var2, (que) vaaVar2, i, 11);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void k(int i, x12 x12Var, md3 md3Var, kv6 kv6Var, r28 r28Var, laf lafVar, vaf vafVar) {
        laf lafVar2;
        Object iuVar;
        int i2;
        n92 n92Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-689143644);
        int i3 = i | (p65Var.f(vafVar) ? 4 : 2) | (p65Var.f(lafVar) ? 32 : 16) | (p65Var.f(md3Var) ? 256 : 128) | (p65Var.f(kv6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 88.0f, 7);
            r28 r28VarJ = rv8.J(r28Var, jq7.t(p65Var), null);
            int i4 = i3 & 14;
            boolean z = i4 == 4;
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zD = ((i3 & 896) == 256) | z | (i5 == 32) | p65Var.d(stcVar.ordinal());
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                i2 = i4;
                iuVar = new iu(vafVar, lafVar, stcVar, md3Var, 27);
                p65Var.j0(iuVar);
            } else {
                iuVar = objM;
                i2 = i4;
            }
            int i6 = i2;
            k40.t(r28VarJ, kv6Var, jy8VarH, null, null, null, false, null, (x45) iuVar, p65Var, (i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 504);
            boolean z2 = ((i3 & 7168) == 2048) | (i5 == 32);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                lafVar2 = lafVar;
                n92Var = null;
                objM2 = new cfd(kv6Var, lafVar2, n92Var, 29);
                p65Var.j0(objM2);
            } else {
                lafVar2 = lafVar;
                n92Var = null;
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
            uaf uafVar = vafVar.b;
            taf tafVar = uafVar instanceof taf ? (taf) uafVar : n92Var;
            Object objValueOf = tafVar != 0 ? Boolean.valueOf(tafVar.d) : n92Var;
            boolean z3 = (i6 == 4) | (i5 == 32);
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new iie(vafVar, lafVar2, n92Var, 4);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, objValueOf);
        } else {
            lafVar2 = lafVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(vafVar, lafVar2, md3Var, kv6Var, r28Var, i, 17);
        }
    }

    public static final void l(int i, x12 x12Var, md3 md3Var, kv6 kv6Var, r28 r28Var, laf lafVar, vaf vafVar) {
        int i2;
        laf lafVar2;
        kv6 kv6Var2;
        p65 p65Var;
        vafVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1095533485);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(vafVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            lafVar2 = lafVar;
            i2 |= p65Var2.f(lafVar2) ? 32 : 16;
        } else {
            lafVar2 = lafVar;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(md3Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            kv6Var2 = kv6Var;
            i2 |= p65Var2.f(kv6Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            kv6Var2 = kv6Var;
        }
        int i3 = i2;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new f8f(3);
                p65Var2.j0(objM);
            }
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "you_posts"), null, null, null, null, 0, 0L, 0L, qb8.p, pxf.E(305137316, new gaf(vafVar, lafVar2, md3Var, kv6Var2, 0), p65Var2), p65Var2, 805306368, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            uaf uafVar = vafVar.b;
            taf tafVar = uafVar instanceof taf ? (taf) uafVar : null;
            q53 q53Var = tafVar != null ? tafVar.c : null;
            if (q53Var == null) {
                p65Var2.Y(419243986);
                p65Var2.p(false);
                p65Var = p65Var2;
            } else {
                p65Var2.Y(419243987);
                boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM2 = p65Var2.M();
                if (z || objM2 == uobVar) {
                    iaf iafVar = new iaf(0, lafVar, laf.class, "onDialogClosed", "onDialogClosed()V", 0, 2);
                    p65Var2.j0(iafVar);
                    objM2 = iafVar;
                }
                m45 m45Var = (m45) ((qh6) objM2);
                boolean z2 = (i3 & 896) == 256;
                Object objM3 = p65Var2.M();
                if (z2 || objM3 == uobVar) {
                    objM3 = new zzb(19, md3Var);
                    p65Var2.j0(objM3);
                }
                x45 x45Var = (x45) objM3;
                p65Var = p65Var2;
                bgf.k(q53Var, m45Var, x45Var, null, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob((Object) vafVar, (Object) lafVar, (Object) md3Var, r28Var, (Object) kv6Var, i, 23);
        }
    }

    public static final void m(String str, paf pafVar, d2f d2fVar, bo4 bo4Var, r28 r28Var, kbf kbfVar, x12 x12Var, int i) {
        kbf kbfVar2;
        kbf kbfVar3;
        kbf kbfVar4;
        pafVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1378157020);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(d2fVar) ? 256 : 128) | (p65Var.h(bo4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        int i3 = 0;
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = (i2 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new vrd(str, 24, pafVar);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                kbfVar3 = (kbf) to7.z(n1b.a.b(kbf.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
                kbfVar3 = kbfVar;
            }
            p65Var.q();
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            kv6 kv6VarA = pv6.a(p65Var);
            l78 l78VarZ = guc.z(kbfVar3.r, p65Var, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            md3 md3Var = new md3(d2fVar, 9, kbfVar3);
            l(3072, p65Var, md3Var, kv6VarA, r28Var, new laf(kbfVar3, d2fVar), (vaf) l78VarZ.getValue());
            boolean zH = p65Var.h(kbfVar3) | p65Var.h(resources) | p65Var.f(md3Var) | p65Var.f(kv6VarA);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                kbfVar4 = kbfVar3;
                kyc kycVar = new kyc(kbfVar4, nhcVar, resources, md3Var, kv6VarA, (n92) null, 11);
                p65Var.j0(kycVar);
                objM3 = kycVar;
            } else {
                kbfVar4 = kbfVar3;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(kbfVar4);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new kaf(bo4Var, kbfVar4, null, i3);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            kbfVar2 = kbfVar4;
        } else {
            p65Var.S();
            kbfVar2 = kbfVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(i, 4, r28Var, (que) kbfVar2, (Object) pafVar, (Object) d2fVar, (Object) bo4Var, str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x005a A[PHI: r9
      0x005a: PHI (r9v1 y9f) = (r9v0 y9f), (r9v4 y9f) binds: [B:15:0x0046, B:17:0x0052] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.y9f n(defpackage.w9f r8, defpackage.y9f r9, org.w3c.dom.Node r10, java.lang.String r11, boolean r12) throws com.adobe.internal.xmp.XMPException {
        /*
            Method dump skipped, instruction units count: 233
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vo7.n(w9f, y9f, org.w3c.dom.Node, java.lang.String, boolean):y9f");
    }

    public static void o(y9f y9fVar, String str, String str2) {
        if ("xml:lang".equals(str)) {
            str2 = kpe.e(str2);
        }
        y9fVar.c(new y9f(str, str2, null));
    }

    public static void p(StringBuilder sb, rg6 rg6Var) {
        List parameters = rg6Var.getParameters();
        ArrayList arrayList = new ArrayList();
        for (Object obj : parameters) {
            if (((ri6) obj).c == oi6.CONTEXT) {
                arrayList.add(obj);
            }
        }
        if (arrayList.isEmpty()) {
            return;
        }
        bu1.E0(arrayList, sb, null, "context(", ") ", p79.k, 50);
    }

    public static void q(StringBuilder sb, rg6 rg6Var) {
        Object objInvoke = ((vg6) rg6Var).b.invoke();
        objInvoke.getClass();
        ArrayList arrayList = new ArrayList();
        for (Object obj : (List) objInvoke) {
            oi6 oi6Var = ((ri6) obj).c;
            if (oi6Var == oi6.INSTANCE || oi6Var == oi6.EXTENSION_RECEIVER) {
                arrayList.add(obj);
            }
        }
        ri6 ri6Var = (ri6) bu1.A0(0, arrayList);
        if (ri6Var != null) {
            sb.append(L(ri6Var.e()));
            sb.append(".");
        }
        ri6 ri6Var2 = (ri6) bu1.A0(1, arrayList);
        if (ri6Var2 != null) {
            sb.append("(");
            sb.append(L(ri6Var2.e()));
            sb.append(".");
            sb.append(")");
        }
    }

    public static final void r(zl3 zl3Var, br brVar, zwa zwaVar, long j, float f, l80 l80Var) {
        brVar.f();
        brVar.d(0.0f, 0.0f);
        float fZ = zl3Var.Z(10.0f);
        float f2 = l80Var.b;
        brVar.c((fZ * f2) / 2.0f, zl3Var.Z(5.0f) * f2);
        brVar.c(zl3Var.Z(10.0f) * f2, 0.0f);
        float fMin = Math.min(zwaVar.c - zwaVar.a, zwaVar.d - zwaVar.b) / 2.0f;
        float fIntBitsToFloat = (Float.intBitsToFloat((int) (zwaVar.b() >> 32)) + fMin) - ((zl3Var.Z(10.0f) * f2) / 2.0f);
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zwaVar.b() & 4294967295L)) - zl3Var.Z(2.5f);
        brVar.h((((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L));
        float fZ2 = l80Var.a - zl3Var.Z(2.5f);
        long jK0 = zl3Var.k0();
        m50 m50VarB0 = zl3Var.b0();
        long jB = m50VarB0.B();
        m50VarB0.x().h();
        try {
            ((md5) m50VarB0.b).y(fZ2, jK0);
            ho2.p(zl3Var, brVar, j, f, new uuc(zl3Var.Z(2.5f), 0.0f, 0, 0, 30), 48);
        } finally {
            y30.x(m50VarB0, jB);
        }
    }

    public static void s(hjc hjcVar, Canvas canvas, Paint paint, Rect rect, int i) {
        int color = paint.getColor();
        Paint.Style style = paint.getStyle();
        paint.setColor(hjcVar.a());
        paint.setStyle(Paint.Style.FILL);
        Paint.FontMetricsInt fontMetricsInt = paint.getFontMetricsInt();
        canvas.drawRect(rect.left, (fontMetricsInt.ascent + i) - hjcVar.c(), rect.right, hjcVar.c() + i + fontMetricsInt.bottom, paint);
        paint.setStyle(style);
        paint.setColor(color);
    }

    public static void t(y9f y9fVar) throws XMPException {
        y9f y9fVarG = y9fVar.g(1);
        if (y9fVarG.j().c(64)) {
            if (y9fVar.j().c(64)) {
                ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Redundant xml:lang for rdf:value element");
                return;
            } else {
                y9f y9fVarK = y9fVarG.k(1);
                y9fVarG.r(y9fVarK);
                y9fVar.c(y9fVarK);
            }
        }
        for (int i = 1; i <= y9fVarG.m(); i++) {
            y9fVar.c(y9fVarG.k(i));
        }
        for (int i2 = 2; i2 <= y9fVar.i(); i2++) {
            y9fVar.c(y9fVar.g(i2));
        }
        y9fVar.j = false;
        y9fVar.j().g(false);
        t4a t4aVarJ = y9fVar.j();
        t4a t4aVarJ2 = y9fVarG.j();
        if (t4aVarJ2 != null) {
            int i3 = t4aVarJ2.a | t4aVarJ.a;
            t4aVarJ.b(i3);
            t4aVarJ.a = i3;
        } else {
            t4aVarJ.getClass();
        }
        y9fVar.b = y9fVarG.b;
        y9fVar.d = null;
        Iterator itP = y9fVarG.p();
        while (itP.hasNext()) {
            y9fVar.a((y9f) itP.next());
        }
    }

    public static String u(long j, x12 x12Var) {
        Locale locale = Locale.US;
        locale.getClass();
        Context context = (Context) ((p65) x12Var).j(eo.b);
        context.getClass();
        String string = context.getString(R.string.full_month_year_date_format);
        string.getClass();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(string, locale);
        simpleDateFormat.setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        String str = simpleDateFormat.format(Long.valueOf(j));
        str.getClass();
        return str;
    }

    public static String w(mp mpVar, int i) {
        mpVar.getClass();
        if (i <= 16777215) {
            return String.valueOf(i);
        }
        try {
            Context context = mpVar.a;
            context.getClass();
            String resourceName = context.getResources().getResourceName(i);
            resourceName.getClass();
            return resourceName;
        } catch (Resources.NotFoundException unused) {
            return String.valueOf(i);
        }
    }

    public static mzb x(va8 va8Var) {
        va8Var.getClass();
        return szb.K0(va8Var, new ss7(26));
    }

    public static final int y(String str, Bundle bundle) {
        int i = bundle.getInt(str, Integer.MIN_VALUE);
        if (i != Integer.MIN_VALUE || bundle.getInt(str, Integer.MAX_VALUE) != Integer.MAX_VALUE) {
            return i;
        }
        wo7.q(str);
        throw null;
    }

    public static String v(long j, x12 x12Var) {
        Locale locale = Locale.US;
        locale.getClass();
        Context context = (Context) ((p65) x12Var).j(eo.b);
        context.getClass();
        String string = context.getString(R.string.short_month_day_year_date_format);
        string.getClass();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(string, locale);
        simpleDateFormat.setTimeZone(DesugarTimeZone.getTimeZone(AXoTRPEGKEve.VTtmufSrn));
        String str = simpleDateFormat.format(Long.valueOf(j));
        str.getClass();
        return str;
    }

    public static int z(Node node) {
        String localName = node.getLocalName();
        String namespaceURI = node.getNamespaceURI();
        if (namespaceURI == null && (("about".equals(localName) || "ID".equals(localName)) && (node instanceof Attr) && "http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(((Attr) node).getOwnerElement().getNamespaceURI()))) {
            namespaceURI = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";
        }
        if ("http://www.w3.org/1999/02/22-rdf-syntax-ns#".equals(namespaceURI)) {
            if ("li".equals(localName)) {
                return 9;
            }
            if ("parseType".equals(localName)) {
                return 4;
            }
            if ("Description".equals(localName)) {
                return 8;
            }
            if ("about".equals(localName)) {
                return 3;
            }
            if ("resource".equals(localName)) {
                return 5;
            }
            if ("RDF".equals(localName)) {
                return 1;
            }
            if ("ID".equals(localName)) {
                return 2;
            }
            if (HrUBqHumRuLe.Ijwd.equals(localName)) {
                return 6;
            }
            if ("datatype".equals(localName)) {
                return 7;
            }
            if ("aboutEach".equals(localName)) {
                return 10;
            }
            if ("aboutEachPrefix".equals(localName)) {
                return 11;
            }
            if ("bagID".equals(localName)) {
                return 12;
            }
            return 0;
        }
        return 0;
    }
}
