package gen.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.a09;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.zz8;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001b¨\u0006\u001f"}, d2 = {"Lgen/model/Paging;", "Lcom/squareup/wire/AndroidMessage;", "Lzz8;", "", "path", "Lgen/model/PageParams;", "previous", "next", "method", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/PageParams;Lgen/model/PageParams;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lzz8;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/PageParams;Lgen/model/PageParams;Ljava/lang/String;Lh21;)Lgen/model/Paging;", "Ljava/lang/String;", "Lgen/model/PageParams;", "Companion", "a09", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Paging extends AndroidMessage<Paging, zz8> {
    public static final ProtoAdapter<Paging> ADAPTER;
    public static final Parcelable.Creator<Paging> CREATOR;
    public static final a09 Companion = new a09();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String method;

    @WireField(adapter = "gen.model.PageParams#ADAPTER", schemaIndex = 2, tag = 3)
    public final PageParams next;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String path;

    @WireField(adapter = "gen.model.PageParams#ADAPTER", schemaIndex = 1, tag = 2)
    public final PageParams previous;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Paging.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Paging> protoAdapter = new ProtoAdapter<Paging>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Paging$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Paging decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                PageParams pageParamsDecode = null;
                PageParams pageParamsDecode2 = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Paging(strDecode, pageParamsDecode, pageParamsDecode2, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        pageParamsDecode = PageParams.ADAPTER.decode(reader);
                    } else if (iNextTag == 3) {
                        pageParamsDecode2 = PageParams.ADAPTER.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Paging value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.path);
                ProtoAdapter<PageParams> protoAdapter3 = PageParams.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 2, value.previous);
                protoAdapter3.encodeWithTag(writer, 3, value.next);
                protoAdapter2.encodeWithTag(writer, 4, value.method);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Paging value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.path) + iE;
                ProtoAdapter<PageParams> protoAdapter3 = PageParams.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(4, value.method) + protoAdapter3.encodedSizeWithTag(3, value.next) + protoAdapter3.encodedSizeWithTag(2, value.previous) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Paging redact(Paging value) {
                value.getClass();
                PageParams pageParams = value.previous;
                PageParams pageParamsRedact = pageParams != null ? PageParams.ADAPTER.redact(pageParams) : null;
                PageParams pageParams2 = value.next;
                return Paging.copy$default(value, null, pageParamsRedact, pageParams2 != null ? PageParams.ADAPTER.redact(pageParams2) : null, null, h21.d, 9, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Paging value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.method);
                ProtoAdapter<PageParams> protoAdapter3 = PageParams.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 3, value.next);
                protoAdapter3.encodeWithTag(writer, 2, value.previous);
                protoAdapter2.encodeWithTag(writer, 1, value.path);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Paging(String str, PageParams pageParams, PageParams pageParams2, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : pageParams, (i & 4) != 0 ? null : pageParams2, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Paging copy$default(Paging paging, String str, PageParams pageParams, PageParams pageParams2, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = paging.path;
        }
        if ((i & 2) != 0) {
            pageParams = paging.previous;
        }
        if ((i & 4) != 0) {
            pageParams2 = paging.next;
        }
        if ((i & 8) != 0) {
            str2 = paging.method;
        }
        if ((i & 16) != 0) {
            h21Var = paging.unknownFields();
        }
        h21 h21Var2 = h21Var;
        PageParams pageParams3 = pageParams2;
        return paging.copy(str, pageParams, pageParams3, str2, h21Var2);
    }

    public final Paging copy(String path, PageParams previous, PageParams next, String method, h21 unknownFields) {
        unknownFields.getClass();
        return new Paging(path, previous, next, method, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Paging)) {
            return false;
        }
        Paging paging = (Paging) other;
        return g76.L(unknownFields(), paging.unknownFields()) && g76.L(this.path, paging.path) && g76.L(this.previous, paging.previous) && g76.L(this.next, paging.next) && g76.L(this.method, paging.method);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.path;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        PageParams pageParams = this.previous;
        int iHashCode3 = (iHashCode2 + (pageParams != null ? pageParams.hashCode() : 0)) * 37;
        PageParams pageParams2 = this.next;
        int iHashCode4 = (iHashCode3 + (pageParams2 != null ? pageParams2.hashCode() : 0)) * 37;
        String str2 = this.method;
        int iHashCode5 = iHashCode4 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final zz8 newBuilder() {
        zz8 zz8Var = new zz8();
        zz8Var.a = this.path;
        zz8Var.b = this.previous;
        zz8Var.c = this.next;
        zz8Var.d = this.method;
        zz8Var.addUnknownFields(unknownFields());
        return zz8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.path;
        if (str != null) {
            lv8.D(str, "path=", arrayList);
        }
        PageParams pageParams = this.previous;
        if (pageParams != null) {
            arrayList.add("previous=" + pageParams);
        }
        PageParams pageParams2 = this.next;
        if (pageParams2 != null) {
            arrayList.add("next=" + pageParams2);
        }
        String str2 = this.method;
        if (str2 != null) {
            lv8.D(str2, "method=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "Paging{", "}", null, 56);
    }

    public Paging() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Paging(String str, PageParams pageParams, PageParams pageParams2, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.path = str;
        this.previous = pageParams;
        this.next = pageParams2;
        this.method = str2;
    }
}
