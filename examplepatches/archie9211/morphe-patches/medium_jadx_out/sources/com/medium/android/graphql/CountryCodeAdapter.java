package com.medium.android.graphql;

import defpackage.ae6;
import defpackage.ay0;
import defpackage.c8;
import defpackage.fd6;
import defpackage.yl2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\f\u0012\b\u0012\u00060\u0002j\u0002`\u00030\u0001B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005J#\u0010\n\u001a\u00060\u0002j\u0002`\u00032\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b\n\u0010\u000bJ+\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\n\u0010\u000e\u001a\u00060\u0002j\u0002`\u0003H\u0016¢\u0006\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/CountryCodeAdapter;", "Lc8;", "", "Lcom/medium/android/graphql/CountryCode;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Ljava/lang/String;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Ljava/lang/String;)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CountryCodeAdapter implements c8 {
    public static final CountryCodeAdapter INSTANCE = new CountryCodeAdapter();

    private CountryCodeAdapter() {
    }

    @Override // defpackage.c8
    public final String fromJson(fd6 reader, yl2 customScalarAdapters) {
        reader.getClass();
        customScalarAdapters.getClass();
        String strQ = reader.q();
        if (strQ != null) {
            return strQ;
        }
        ay0.e("CountryCode cannot be null");
        return null;
    }

    @Override // defpackage.c8
    public final void toJson(ae6 writer, yl2 customScalarAdapters, String value) {
        writer.getClass();
        customScalarAdapters.getClass();
        value.getClass();
        writer.E(value);
    }
}
