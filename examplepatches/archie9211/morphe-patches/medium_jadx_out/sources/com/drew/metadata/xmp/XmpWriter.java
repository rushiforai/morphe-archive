package com.drew.metadata.xmp;

import com.adobe.internal.xmp.XMPException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.Metadata;
import defpackage.ac2;
import defpackage.caf;
import defpackage.d0c;
import defpackage.ik4;
import defpackage.o2b;
import defpackage.u9f;
import defpackage.v9f;
import defpackage.w9f;
import defpackage.ywb;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class XmpWriter {
    public static boolean write(OutputStream outputStream, Metadata metadata) throws XMPException {
        XmpDirectory xmpDirectory = (XmpDirectory) metadata.getFirstDirectoryOfType(XmpDirectory.class);
        if (xmpDirectory == null) {
            return false;
        }
        u9f xMPMeta = xmpDirectory.getXMPMeta();
        d0c d0cVar = new d0c();
        d0cVar.b = RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        d0cVar.c = "\n";
        d0cVar.d = "  ";
        d0cVar.e(16, true);
        o2b o2bVar = v9f.a;
        if (!(xMPMeta instanceof w9f)) {
            ik4.k("The serializing service works onlywith the XMPMeta implementation of this library");
            return false;
        }
        w9f w9fVar = (w9f) xMPMeta;
        if (d0cVar.c(8192)) {
            w9fVar.a.s();
        }
        caf cafVar = new caf();
        cafVar.e = 1;
        try {
            cafVar.b = new ac2(outputStream);
            ac2 ac2Var = cafVar.b;
            int i = d0cVar.a & 3;
            String str = "UTF-8";
            cafVar.c = new OutputStreamWriter(ac2Var, i == 2 ? "UTF-16BE" : i == 3 ? "UTF-16LE" : "UTF-8");
            cafVar.a = w9fVar;
            cafVar.d = d0cVar;
            cafVar.f = d0cVar.b;
            ac2 ac2Var2 = cafVar.b;
            int i2 = d0cVar.a & 3;
            if (i2 == 2) {
                str = "UTF-16BE";
            } else if (i2 == 3) {
                str = "UTF-16LE";
            }
            cafVar.c = new OutputStreamWriter(ac2Var2, str);
            cafVar.d();
            String strH = cafVar.h();
            cafVar.c.flush();
            cafVar.a(strH.length());
            cafVar.m(strH);
            cafVar.c.flush();
            cafVar.b.close();
            return true;
        } catch (IOException unused) {
            ywb.e(0, "Error writing to the OutputStream");
            return false;
        }
    }
}
