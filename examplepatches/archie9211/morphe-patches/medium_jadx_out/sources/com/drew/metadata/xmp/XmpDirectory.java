package com.drew.metadata.xmp;

import com.adobe.internal.xmp.XMPException;
import com.drew.metadata.Directory;
import defpackage.q9f;
import defpackage.td;
import defpackage.u9f;
import defpackage.w9f;
import j$.util.DesugarCollections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class XmpDirectory extends Directory {
    public static final int TAG_XMP_VALUE_COUNT = 65535;
    private static final HashMap<Integer, String> _tagNameMap;
    private u9f _xmpMeta;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        map.put(65535, "XMP Value Count");
    }

    public XmpDirectory() {
        setDescriptor(new XmpDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "XMP";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public final u9f getXMPMeta() {
        u9f u9fVar = this._xmpMeta;
        if (u9fVar != null) {
            return u9fVar;
        }
        w9f w9fVar = new w9f();
        this._xmpMeta = w9fVar;
        return w9fVar;
    }

    public final Map<String, String> getXmpProperties() {
        HashMap map = new HashMap();
        if (this._xmpMeta != null) {
            try {
                td tdVar = new td(1, (byte) 0);
                tdVar.e(512, true);
                Iterator it2 = ((w9f) this._xmpMeta).a(null, tdVar).c;
                while (it2.hasNext()) {
                    q9f q9fVar = (q9f) it2.next();
                    String str = q9fVar.c;
                    String str2 = q9fVar.d;
                    if (str != null && str2 != null) {
                        map.put(str, str2);
                    }
                }
            } catch (XMPException unused) {
            }
        }
        return DesugarCollections.unmodifiableMap(map);
    }

    public final void setXMPMeta(u9f u9fVar) {
        this._xmpMeta = u9fVar;
        try {
            int i = 0;
            td tdVar = new td(1, (byte) 0);
            tdVar.e(512, true);
            Iterator it2 = ((w9f) this._xmpMeta).a(null, tdVar).c;
            while (it2.hasNext()) {
                if (((q9f) it2.next()).c != null) {
                    i++;
                }
            }
            setInt(65535, i);
        } catch (XMPException unused) {
        }
    }
}
