package defpackage;

import com.adobe.internal.xmp.XMPException;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class x9f {
    public static final Object a = new Object();
    public static final DocumentBuilderFactory b;

    static {
        DocumentBuilderFactory documentBuilderFactoryNewInstance = DocumentBuilderFactory.newInstance();
        documentBuilderFactoryNewInstance.setNamespaceAware(true);
        documentBuilderFactoryNewInstance.setIgnoringComments(true);
        documentBuilderFactoryNewInstance.setExpandEntityReferences(false);
        try {
            documentBuilderFactoryNewInstance.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
            documentBuilderFactoryNewInstance.setFeature("http://xml.org/sax/features/external-general-entities", false);
            documentBuilderFactoryNewInstance.setFeature("http://xerces.apache.org/xerces2-j/features.html#disallow-doctype-decl", false);
            documentBuilderFactoryNewInstance.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
            documentBuilderFactoryNewInstance.setFeature("http://xerces.apache.org/xerces2-j/features.html#external-parameter-entities", false);
            documentBuilderFactoryNewInstance.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
            documentBuilderFactoryNewInstance.setXIncludeAware(false);
            documentBuilderFactoryNewInstance.setExpandEntityReferences(false);
        } catch (Throwable unused) {
        }
        b = documentBuilderFactoryNewInstance;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object[] a(org.w3c.dom.Node r7, boolean r8, java.lang.Object[] r9) {
        /*
            org.w3c.dom.NodeList r7 = r7.getChildNodes()
            r0 = 0
            r1 = r0
        L6:
            int r2 = r7.getLength()
            if (r1 >= r2) goto L84
            org.w3c.dom.Node r2 = r7.item(r1)
            short r3 = r2.getNodeType()
            r4 = 7
            if (r4 != r3) goto L2e
            r3 = r2
            org.w3c.dom.ProcessingInstruction r3 = (org.w3c.dom.ProcessingInstruction) r3
            java.lang.String r5 = r3.getTarget()
            java.lang.String r6 = "xpacket"
            boolean r5 = r6.equals(r5)
            if (r5 == 0) goto L2e
            r2 = 2
            java.lang.String r3 = r3.getData()
            r9[r2] = r3
            goto L81
        L2e:
            r3 = 3
            short r5 = r2.getNodeType()
            if (r3 == r5) goto L81
            short r3 = r2.getNodeType()
            if (r4 == r3) goto L81
            java.lang.String r3 = r2.getNamespaceURI()
            java.lang.String r4 = r2.getLocalName()
            java.lang.String r5 = "xmpmeta"
            boolean r5 = r5.equals(r4)
            if (r5 != 0) goto L53
            java.lang.String r5 = "xapmeta"
            boolean r5 = r5.equals(r4)
            if (r5 == 0) goto L60
        L53:
            java.lang.String r5 = "adobe:ns:meta/"
            boolean r5 = r5.equals(r3)
            if (r5 == 0) goto L60
            java.lang.Object[] r7 = a(r2, r0, r9)
            return r7
        L60:
            if (r8 != 0) goto L7a
            java.lang.String r5 = "RDF"
            boolean r4 = r5.equals(r4)
            if (r4 == 0) goto L7a
            java.lang.String r4 = "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            boolean r3 = r4.equals(r3)
            if (r3 == 0) goto L7a
            r9[r0] = r2
            java.lang.Object r7 = defpackage.x9f.a
            r8 = 1
            r9[r8] = r7
            return r9
        L7a:
            java.lang.Object[] r2 = a(r2, r8, r9)
            if (r2 == 0) goto L81
            return r2
        L81:
            int r1 = r1 + 1
            goto L6
        L84:
            r7 = 0
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x9f.a(org.w3c.dom.Node, boolean, java.lang.Object[]):java.lang.Object[]");
    }

    public static Document c(InputSource inputSource) throws XMPException {
        try {
            DocumentBuilder documentBuilderNewDocumentBuilder = b.newDocumentBuilder();
            documentBuilderNewDocumentBuilder.setErrorHandler(null);
            return documentBuilderNewDocumentBuilder.parse(inputSource);
        } catch (IOException e) {
            throw new XMPException("Error reading the XML-file", Mp4VideoDirectory.TAG_WIDTH, e);
        } catch (ParserConfigurationException e2) {
            throw new XMPException("XML Parser not correctly configured", 0, e2);
        } catch (SAXException e3) {
            throw new XMPException("XML parsing failure", Mp4VideoDirectory.TAG_VENDOR, e3);
        }
    }

    public static Document d(xp xpVar, p49 p49Var) throws XMPException {
        try {
            InputSource inputSource = new InputSource(new ByteArrayInputStream((byte[]) xpVar.c, 0, xpVar.b));
            try {
                if (p49Var.c(64)) {
                    try {
                        b.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
                    } catch (Throwable unused) {
                    }
                }
                return c(inputSource);
            } catch (XMPException e) {
                if ("DOCTYPE is disallowed".equals(e.getCause().getMessage())) {
                    throw new XMPException(e.getCause().getMessage(), Mp4VideoDirectory.TAG_VENDOR);
                }
                int i = e.a;
                if (i != 201 && i != 204) {
                    throw e;
                }
                if (p49Var.c(16)) {
                    xpVar = o7f.q(xpVar);
                }
                if (!p49Var.c(8)) {
                    return c(new InputSource(new ByteArrayInputStream((byte[]) xpVar.c, 0, xpVar.b)));
                }
                return c(new InputSource(new fl4(new InputStreamReader(new ByteArrayInputStream((byte[]) xpVar.c, 0, xpVar.b), xpVar.q()))));
            }
        } catch (UnsupportedEncodingException e2) {
            throw new XMPException("Unsupported Encoding", 9, e2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x02d4  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01f3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.w9f b(java.lang.Object r17, defpackage.p49 r18) throws com.adobe.internal.xmp.XMPException {
        /*
            Method dump skipped, instruction units count: 1368
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x9f.b(java.lang.Object, p49):w9f");
    }
}
