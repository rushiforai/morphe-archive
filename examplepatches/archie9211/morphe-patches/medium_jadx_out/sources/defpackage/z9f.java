package defpackage;

import com.adobe.internal.xmp.XMPException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class z9f {
    public static final HashMap a = new HashMap();

    static {
        t4a t4aVar = new t4a();
        t4aVar.e(512, true);
        a.put("dc:contributor", t4aVar);
        a.put("dc:language", t4aVar);
        a.put("dc:publisher", t4aVar);
        a.put("dc:relation", t4aVar);
        a.put("dc:subject", t4aVar);
        a.put("dc:type", t4aVar);
        t4a t4aVar2 = new t4a();
        t4aVar2.e(512, true);
        t4aVar2.e(1024, true);
        a.put("dc:creator", t4aVar2);
        a.put("dc:date", t4aVar2);
        t4a t4aVar3 = new t4a();
        t4aVar3.e(512, true);
        t4aVar3.e(1024, true);
        t4aVar3.e(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, true);
        t4aVar3.e(4096, true);
        a.put("dc:description", t4aVar3);
        a.put("dc:rights", t4aVar3);
        a.put("dc:title", t4aVar3);
    }

    public static void a(y9f y9fVar, y9f y9fVar2, boolean z) throws XMPException {
        if (!y9fVar.b.equals(y9fVar2.b) || y9fVar.i() != y9fVar2.i()) {
            ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Mismatch between alias and base nodes");
            return;
        }
        if (!z && (!y9fVar.a.equals(y9fVar2.a) || !y9fVar.j().equals(y9fVar2.j()) || y9fVar.m() != y9fVar2.m())) {
            ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Mismatch between alias and base nodes");
            return;
        }
        Iterator itP = y9fVar.p();
        Iterator itP2 = y9fVar2.p();
        while (itP.hasNext() && itP2.hasNext()) {
            a((y9f) itP.next(), (y9f) itP2.next(), false);
        }
        Iterator itQ = y9fVar.q();
        Iterator itQ2 = y9fVar2.q();
        while (itQ.hasNext() && itQ2.hasNext()) {
            a((y9f) itQ.next(), (y9f) itQ2.next(), false);
        }
    }

    public static void b(y9f y9fVar) {
        if (y9fVar.j().c(512)) {
            t4a t4aVarJ = y9fVar.j();
            t4aVarJ.e(1024, true);
            t4aVarJ.e(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, true);
            t4aVarJ.e(4096, true);
            Iterator itP = y9fVar.p();
            while (itP.hasNext()) {
                y9f y9fVar2 = (y9f) itP.next();
                if (y9fVar2.j().f()) {
                    itP.remove();
                } else if (!y9fVar2.j().c(64)) {
                    String str = y9fVar2.b;
                    if (str == null || str.length() == 0) {
                        itP.remove();
                    } else {
                        y9fVar2.c(new y9f("xml:lang", "x-repair", null));
                    }
                }
            }
        }
    }

    public static void c(Iterator it2, y9f y9fVar, y9f y9fVar2) throws XMPException {
        if (y9fVar2.j().c(4096)) {
            if (y9fVar.j().c(64)) {
                ywb.e(Mp4VideoDirectory.TAG_SPATIAL_QUALITY, "Alias to x-default already has a language qualifier");
                return;
            }
            y9fVar.c(new y9f("xml:lang", "x-default", null));
        }
        it2.remove();
        y9fVar.a = "[]";
        y9fVar2.a(y9fVar);
    }
}
