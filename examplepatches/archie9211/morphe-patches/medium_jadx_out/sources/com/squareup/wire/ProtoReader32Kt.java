package com.squareup.wire;

import defpackage.h21;
import defpackage.x45;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0012\n\u0002\b\u0002\u001a+\u0010\b\u001a\u00020\u0005*\u00020\u00002\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001H\u0087\bø\u0001\u0000¢\u0006\u0004\b\u0006\u0010\u0007\u001a)\u0010\f\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\b\b\u0002\u0010\n\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u0002¢\u0006\u0004\b\f\u0010\r\u001a)\u0010\f\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000e2\b\b\u0002\u0010\n\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u0002¢\u0006\u0004\b\f\u0010\u000f\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0010"}, d2 = {"Lcom/squareup/wire/ProtoReader32;", "Lkotlin/Function1;", "", "", "tagHandler", "Lh21;", "-forEachTag", "(Lcom/squareup/wire/ProtoReader32;Lx45;)Lh21;", "forEachTag", "source", "pos", "limit", "ProtoReader32", "(Lh21;II)Lcom/squareup/wire/ProtoReader32;", "", "([BII)Lcom/squareup/wire/ProtoReader32;", "wire-runtime"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class ProtoReader32Kt {
    /* JADX INFO: renamed from: -forEachTag, reason: not valid java name */
    public static final h21 m96forEachTag(ProtoReader32 protoReader32, x45 x45Var) {
        protoReader32.getClass();
        x45Var.getClass();
        int iBeginMessage = protoReader32.beginMessage();
        while (true) {
            int iNextTag = protoReader32.nextTag();
            if (iNextTag == -1) {
                return protoReader32.endMessageAndGetUnknownFields(iBeginMessage);
            }
            x45Var.invoke(Integer.valueOf(iNextTag));
        }
    }

    public static final ProtoReader32 ProtoReader32(h21 h21Var, int i, int i2) {
        h21Var.getClass();
        return new ByteArrayProtoReader32(h21Var.s(), i, i2);
    }

    public static ProtoReader32 ProtoReader32$default(h21 h21Var, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = h21Var.e();
        }
        return ProtoReader32(h21Var, i, i2);
    }

    public static final ProtoReader32 ProtoReader32(byte[] bArr, int i, int i2) {
        bArr.getClass();
        return new ByteArrayProtoReader32(bArr, i, i2);
    }

    public static /* synthetic */ ProtoReader32 ProtoReader32$default(byte[] bArr, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = bArr.length;
        }
        return ProtoReader32(bArr, i, i2);
    }
}
