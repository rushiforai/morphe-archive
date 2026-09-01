package com.squareup.wire;

import com.squareup.wire.Message;
import com.squareup.wire.ProtoAdapterKt;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.ReflectionKt;
import defpackage.ay0;
import defpackage.c1e;
import defpackage.ev6;
import defpackage.fmd;
import defpackage.gy2;
import defpackage.h21;
import defpackage.ik4;
import defpackage.kz0;
import defpackage.muc;
import defpackage.n1b;
import defpackage.uw8;
import defpackage.vo7;
import defpackage.vx0;
import defpackage.wg6;
import defpackage.xua;
import defpackage.xz0;
import defpackage.ygf;
import defpackage.yua;
import defpackage.zz0;
import j$.time.Duration;
import j$.time.Instant;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000¨\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0018\n\u0002\u0010\u000b\n\u0002\b\u0006\b&\u0018\u0000 n*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0002onBG\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00018\u0000\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\r\u0010\u000eB\u001d\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u000f¢\u0006\u0004\b\r\u0010\u0010B'\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u000f\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\r\u0010\u0011B/\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u000f\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\r\u0010\u0012B9\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u000f\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\u000b\u001a\u0004\u0018\u00018\u0000¢\u0006\u0004\b\r\u0010\u0013B\u001f\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005¢\u0006\u0004\b\r\u0010\u0014B)\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\r\u0010\u0015B1\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\r\u0010\u0016B;\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\u000b\u001a\u0004\u0018\u00018\u0000¢\u0006\u0004\b\r\u0010\u0017BC\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u000f\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\u000b\u001a\u0004\u0018\u00018\u0000\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\r\u0010\u0018J\u0017\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u0019\u001a\u00028\u0000H&¢\u0006\u0004\b\u001a\u0010\u001bJ\u0017\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0019\u001a\u00028\u0000H&¢\u0006\u0004\b\u001d\u0010\u001eJ!\u0010 \u001a\u00020\u001c2\u0006\u0010\u001f\u001a\u00020\u001c2\b\u0010\u0019\u001a\u0004\u0018\u00018\u0000H\u0016¢\u0006\u0004\b \u0010!J\u001f\u0010%\u001a\u00020$2\u0006\u0010#\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00028\u0000H&¢\u0006\u0004\b%\u0010&J\u001f\u0010%\u001a\u00020$2\u0006\u0010#\u001a\u00020'2\u0006\u0010\u0019\u001a\u00028\u0000H\u0016¢\u0006\u0004\b%\u0010(J)\u0010)\u001a\u00020$2\u0006\u0010#\u001a\u00020\"2\u0006\u0010\u001f\u001a\u00020\u001c2\b\u0010\u0019\u001a\u0004\u0018\u00018\u0000H\u0016¢\u0006\u0004\b)\u0010*J)\u0010)\u001a\u00020$2\u0006\u0010#\u001a\u00020'2\u0006\u0010\u001f\u001a\u00020\u001c2\b\u0010\u0019\u001a\u0004\u0018\u00018\u0000H\u0016¢\u0006\u0004\b)\u0010+J\u001d\u0010%\u001a\u00020$2\u0006\u0010-\u001a\u00020,2\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0004\b%\u0010.J\u0015\u0010%\u001a\u00020/2\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0004\b%\u00100J\u0015\u00102\u001a\u0002012\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0004\b2\u00103J\u001d\u0010%\u001a\u00020$2\u0006\u00105\u001a\u0002042\u0006\u0010\u0019\u001a\u00028\u0000¢\u0006\u0004\b%\u00106J\u0017\u00109\u001a\u00028\u00002\u0006\u00108\u001a\u000207H&¢\u0006\u0004\b9\u0010:J\u0017\u00109\u001a\u00028\u00002\u0006\u00108\u001a\u00020;H\u0016¢\u0006\u0004\b9\u0010<J\u0015\u00109\u001a\u00028\u00002\u0006\u0010=\u001a\u00020/¢\u0006\u0004\b9\u0010>J\u0015\u00109\u001a\u00028\u00002\u0006\u0010=\u001a\u000201¢\u0006\u0004\b9\u0010?J\u0015\u00109\u001a\u00028\u00002\u0006\u0010A\u001a\u00020@¢\u0006\u0004\b9\u0010BJ#\u0010E\u001a\u00020$2\u0006\u00108\u001a\u0002072\f\u0010D\u001a\b\u0012\u0004\u0012\u00028\u00000C¢\u0006\u0004\bE\u0010FJ#\u0010E\u001a\u00020$2\u0006\u00108\u001a\u00020;2\f\u0010D\u001a\b\u0012\u0004\u0012\u00028\u00000C¢\u0006\u0004\bE\u0010GJ\u0015\u00109\u001a\u00028\u00002\u0006\u00105\u001a\u00020H¢\u0006\u0004\b9\u0010IJ\u0017\u0010J\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00028\u0000H\u0016¢\u0006\u0004\bJ\u0010KJ\u001b\u0010P\u001a\u0006\u0012\u0002\b\u00030\u00002\u0006\u0010M\u001a\u00020LH\u0000¢\u0006\u0004\bN\u0010OJ\u0019\u0010R\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000Q0\u0000¢\u0006\u0004\bR\u0010SJ\u0019\u0010T\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000Q0\u0000¢\u0006\u0004\bT\u0010SR\u001a\u0010\u0004\u001a\u00020\u00038\u0000X\u0080\u0004¢\u0006\f\n\u0004\b\u0004\u0010U\u001a\u0004\bV\u0010WR\u001d\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010X\u001a\u0004\bY\u0010ZR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010[\u001a\u0004\b\\\u0010]R\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010^\u001a\u0004\b_\u0010`R\u0019\u0010\u000b\u001a\u0004\u0018\u00018\u00008\u0006¢\u0006\f\n\u0004\b\u000b\u0010a\u001a\u0004\bb\u0010cR\u0019\u0010\f\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\f\u0010[\u001a\u0004\bd\u0010]R(\u0010e\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000Q\u0018\u00010\u00008\u0000X\u0080\u0004¢\u0006\f\n\u0004\be\u0010f\u001a\u0004\bg\u0010SR(\u0010h\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000Q\u0018\u00010\u00008\u0000X\u0080\u0004¢\u0006\f\n\u0004\bh\u0010f\u001a\u0004\bi\u0010SR\u0014\u0010m\u001a\u00020j8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bk\u0010l¨\u0006p"}, d2 = {"Lcom/squareup/wire/ProtoAdapter;", "E", "", "Lcom/squareup/wire/FieldEncoding;", "fieldEncoding", "Lwg6;", "type", "", "typeUrl", "Lcom/squareup/wire/Syntax;", "syntax", "identity", "sourceFile", "<init>", "(Lcom/squareup/wire/FieldEncoding;Lwg6;Ljava/lang/String;Lcom/squareup/wire/Syntax;Ljava/lang/Object;Ljava/lang/String;)V", "Ljava/lang/Class;", "(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;)V", "(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;Ljava/lang/String;)V", "(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;Ljava/lang/String;Lcom/squareup/wire/Syntax;)V", "(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;Ljava/lang/String;Lcom/squareup/wire/Syntax;Ljava/lang/Object;)V", "(Lcom/squareup/wire/FieldEncoding;Lwg6;)V", "(Lcom/squareup/wire/FieldEncoding;Lwg6;Ljava/lang/String;)V", "(Lcom/squareup/wire/FieldEncoding;Lwg6;Ljava/lang/String;Lcom/squareup/wire/Syntax;)V", "(Lcom/squareup/wire/FieldEncoding;Lwg6;Ljava/lang/String;Lcom/squareup/wire/Syntax;Ljava/lang/Object;)V", "(Lcom/squareup/wire/FieldEncoding;Ljava/lang/Class;Ljava/lang/String;Lcom/squareup/wire/Syntax;Ljava/lang/Object;Ljava/lang/String;)V", "value", "redact", "(Ljava/lang/Object;)Ljava/lang/Object;", "", "encodedSize", "(Ljava/lang/Object;)I", "tag", "encodedSizeWithTag", "(ILjava/lang/Object;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Ljava/lang/Object;)V", "encodeWithTag", "(Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V", "(Lcom/squareup/wire/ReverseProtoWriter;ILjava/lang/Object;)V", "Lxz0;", "sink", "(Lxz0;Ljava/lang/Object;)V", "", "(Ljava/lang/Object;)[B", "Lh21;", "encodeByteString", "(Ljava/lang/Object;)Lh21;", "Ljava/io/OutputStream;", "stream", "(Ljava/io/OutputStream;Ljava/lang/Object;)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/ProtoReader32;)Ljava/lang/Object;", "bytes", "([B)Ljava/lang/Object;", "(Lh21;)Ljava/lang/Object;", "Lzz0;", "source", "(Lzz0;)Ljava/lang/Object;", "", "destination", "tryDecode", "(Lcom/squareup/wire/ProtoReader;Ljava/util/List;)V", "(Lcom/squareup/wire/ProtoReader32;Ljava/util/List;)V", "Ljava/io/InputStream;", "(Ljava/io/InputStream;)Ljava/lang/Object;", "toString", "(Ljava/lang/Object;)Ljava/lang/String;", "Lcom/squareup/wire/WireField$Label;", "label", "withLabel$wire_runtime", "(Lcom/squareup/wire/WireField$Label;)Lcom/squareup/wire/ProtoAdapter;", "withLabel", "", "asPacked", "()Lcom/squareup/wire/ProtoAdapter;", "asRepeated", "Lcom/squareup/wire/FieldEncoding;", "getFieldEncoding$wire_runtime", "()Lcom/squareup/wire/FieldEncoding;", "Lwg6;", "getType", "()Lwg6;", "Ljava/lang/String;", "getTypeUrl", "()Ljava/lang/String;", "Lcom/squareup/wire/Syntax;", "getSyntax", "()Lcom/squareup/wire/Syntax;", "Ljava/lang/Object;", "getIdentity", "()Ljava/lang/Object;", "getSourceFile", "packedAdapter", "Lcom/squareup/wire/ProtoAdapter;", "getPackedAdapter$wire_runtime", "repeatedAdapter", "getRepeatedAdapter$wire_runtime", "", "isStruct$wire_runtime", "()Z", "isStruct", "Companion", "EnumConstantNotFoundException", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public abstract class ProtoAdapter<E> {
    public static final ProtoAdapter<Boolean> BOOL;
    public static final ProtoAdapter<Boolean> BOOL_VALUE;
    public static final ProtoAdapter<h21> BYTES;
    public static final ProtoAdapter<h21> BYTES_VALUE;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final ProtoAdapter<Double> DOUBLE;
    public static final ProtoAdapter<double[]> DOUBLE_ARRAY;
    public static final ProtoAdapter<Double> DOUBLE_VALUE;
    public static final ProtoAdapter<Duration> DURATION;
    public static final ProtoAdapter<c1e> EMPTY;
    public static final ProtoAdapter<Integer> FIXED32;
    public static final ProtoAdapter<int[]> FIXED32_ARRAY;
    public static final ProtoAdapter<Long> FIXED64;
    public static final ProtoAdapter<long[]> FIXED64_ARRAY;
    public static final ProtoAdapter<Float> FLOAT;
    public static final ProtoAdapter<float[]> FLOAT_ARRAY;
    public static final ProtoAdapter<Float> FLOAT_VALUE;
    public static final ProtoAdapter<Instant> INSTANT;
    public static final ProtoAdapter<Integer> INT32;
    public static final ProtoAdapter<int[]> INT32_ARRAY;
    public static final ProtoAdapter<Integer> INT32_VALUE;
    public static final ProtoAdapter<Long> INT64;
    public static final ProtoAdapter<long[]> INT64_ARRAY;
    public static final ProtoAdapter<Long> INT64_VALUE;
    public static final ProtoAdapter<Integer> SFIXED32;
    public static final ProtoAdapter<int[]> SFIXED32_ARRAY;
    public static final ProtoAdapter<Long> SFIXED64;
    public static final ProtoAdapter<long[]> SFIXED64_ARRAY;
    public static final ProtoAdapter<Integer> SINT32;
    public static final ProtoAdapter<int[]> SINT32_ARRAY;
    public static final ProtoAdapter<Long> SINT64;
    public static final ProtoAdapter<long[]> SINT64_ARRAY;
    public static final ProtoAdapter<String> STRING;
    public static final ProtoAdapter<String> STRING_VALUE;
    public static final ProtoAdapter<List<?>> STRUCT_LIST;
    public static final ProtoAdapter<Map<String, ?>> STRUCT_MAP;
    public static final ProtoAdapter STRUCT_NULL;
    public static final ProtoAdapter<Object> STRUCT_VALUE;
    public static final ProtoAdapter<Integer> UINT32;
    public static final ProtoAdapter<int[]> UINT32_ARRAY;
    public static final ProtoAdapter<Integer> UINT32_VALUE;
    public static final ProtoAdapter<Long> UINT64;
    public static final ProtoAdapter<long[]> UINT64_ARRAY;
    public static final ProtoAdapter<Long> UINT64_VALUE;
    private final FieldEncoding fieldEncoding;
    private final E identity;
    private final ProtoAdapter<List<E>> packedAdapter;
    private final ProtoAdapter<List<E>> repeatedAdapter;
    private final String sourceFile;
    private final Syntax syntax;
    private final wg6 type;
    private final String typeUrl;

    static {
        ProtoAdapter<Duration> unsupportedTypeProtoAdapter;
        ProtoAdapter<Instant> unsupportedTypeProtoAdapter2;
        ProtoAdapter<Boolean> protoAdapterCommonBool = ProtoAdapterKt.commonBool();
        BOOL = protoAdapterCommonBool;
        ProtoAdapter<Integer> protoAdapterCommonInt32 = ProtoAdapterKt.commonInt32();
        INT32 = protoAdapterCommonInt32;
        INT32_ARRAY = new IntArrayProtoAdapter(protoAdapterCommonInt32);
        ProtoAdapter<Integer> protoAdapterCommonUint32 = ProtoAdapterKt.commonUint32();
        UINT32 = protoAdapterCommonUint32;
        UINT32_ARRAY = new IntArrayProtoAdapter(protoAdapterCommonUint32);
        ProtoAdapter<Integer> protoAdapterCommonSint32 = ProtoAdapterKt.commonSint32();
        SINT32 = protoAdapterCommonSint32;
        SINT32_ARRAY = new IntArrayProtoAdapter(protoAdapterCommonSint32);
        ProtoAdapter<Integer> protoAdapterCommonFixed32 = ProtoAdapterKt.commonFixed32();
        FIXED32 = protoAdapterCommonFixed32;
        FIXED32_ARRAY = new IntArrayProtoAdapter(protoAdapterCommonFixed32);
        ProtoAdapter<Integer> protoAdapterCommonFixed322 = ProtoAdapterKt.commonFixed32();
        SFIXED32 = protoAdapterCommonFixed322;
        SFIXED32_ARRAY = new IntArrayProtoAdapter(protoAdapterCommonFixed322);
        ProtoAdapter<Long> protoAdapterCommonInt64 = ProtoAdapterKt.commonInt64();
        INT64 = protoAdapterCommonInt64;
        INT64_ARRAY = new LongArrayProtoAdapter(protoAdapterCommonInt64);
        ProtoAdapter<Long> protoAdapterCommonUint64 = ProtoAdapterKt.commonUint64();
        UINT64 = protoAdapterCommonUint64;
        UINT64_ARRAY = new LongArrayProtoAdapter(protoAdapterCommonUint64);
        ProtoAdapter<Long> protoAdapterCommonSint64 = ProtoAdapterKt.commonSint64();
        SINT64 = protoAdapterCommonSint64;
        SINT64_ARRAY = new LongArrayProtoAdapter(protoAdapterCommonSint64);
        ProtoAdapter<Long> protoAdapterCommonFixed64 = ProtoAdapterKt.commonFixed64();
        FIXED64 = protoAdapterCommonFixed64;
        FIXED64_ARRAY = new LongArrayProtoAdapter(protoAdapterCommonFixed64);
        ProtoAdapter<Long> protoAdapterCommonFixed642 = ProtoAdapterKt.commonFixed64();
        SFIXED64 = protoAdapterCommonFixed642;
        SFIXED64_ARRAY = new LongArrayProtoAdapter(protoAdapterCommonFixed642);
        FloatProtoAdapter floatProtoAdapter = new FloatProtoAdapter();
        FLOAT = floatProtoAdapter;
        FLOAT_ARRAY = new FloatArrayProtoAdapter(floatProtoAdapter);
        DoubleProtoAdapter doubleProtoAdapter = new DoubleProtoAdapter();
        DOUBLE = doubleProtoAdapter;
        DOUBLE_ARRAY = new DoubleArrayProtoAdapter(doubleProtoAdapter);
        ProtoAdapter<h21> protoAdapterCommonBytes = ProtoAdapterKt.commonBytes();
        BYTES = protoAdapterCommonBytes;
        ProtoAdapter<String> protoAdapterCommonString = ProtoAdapterKt.commonString();
        STRING = protoAdapterCommonString;
        EMPTY = ProtoAdapterKt.commonEmpty();
        STRUCT_MAP = ProtoAdapterKt.commonStructMap();
        STRUCT_LIST = ProtoAdapterKt.commonStructList();
        STRUCT_NULL = ProtoAdapterKt.commonStructNull();
        STRUCT_VALUE = ProtoAdapterKt.commonStructValue();
        DOUBLE_VALUE = ProtoAdapterKt.commonWrapper(doubleProtoAdapter, "type.googleapis.com/google.protobuf.DoubleValue");
        FLOAT_VALUE = ProtoAdapterKt.commonWrapper(floatProtoAdapter, "type.googleapis.com/google.protobuf.FloatValue");
        INT64_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonInt64, "type.googleapis.com/google.protobuf.Int64Value");
        UINT64_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonUint64, "type.googleapis.com/google.protobuf.UInt64Value");
        INT32_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonInt32, "type.googleapis.com/google.protobuf.Int32Value");
        UINT32_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonUint32, "type.googleapis.com/google.protobuf.UInt32Value");
        BOOL_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonBool, "type.googleapis.com/google.protobuf.BoolValue");
        STRING_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonString, "type.googleapis.com/google.protobuf.StringValue");
        BYTES_VALUE = ProtoAdapterKt.commonWrapper(protoAdapterCommonBytes, "type.googleapis.com/google.protobuf.BytesValue");
        try {
            unsupportedTypeProtoAdapter = ProtoAdapterKt.commonDuration();
        } catch (NoClassDefFoundError unused) {
            unsupportedTypeProtoAdapter = new Companion.UnsupportedTypeProtoAdapter();
        }
        DURATION = unsupportedTypeProtoAdapter;
        try {
            unsupportedTypeProtoAdapter2 = ProtoAdapterKt.commonInstant();
        } catch (NoClassDefFoundError unused2) {
            unsupportedTypeProtoAdapter2 = new Companion.UnsupportedTypeProtoAdapter();
        }
        INSTANT = unsupportedTypeProtoAdapter2;
    }

    public ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var, String str, Syntax syntax, E e, String str2) {
        PackedProtoAdapter packedProtoAdapter;
        FieldEncoding fieldEncoding2;
        fieldEncoding.getClass();
        syntax.getClass();
        this.fieldEncoding = fieldEncoding;
        this.type = wg6Var;
        this.typeUrl = str;
        this.syntax = syntax;
        this.identity = e;
        this.sourceFile = str2;
        boolean z = this instanceof PackedProtoAdapter;
        RepeatedProtoAdapter repeatedProtoAdapter = null;
        if (z || (this instanceof RepeatedProtoAdapter) || fieldEncoding == (fieldEncoding2 = FieldEncoding.LENGTH_DELIMITED)) {
            packedProtoAdapter = null;
        } else {
            if (fieldEncoding == fieldEncoding2) {
                ay0.e("Unable to pack a length-delimited type.");
                throw null;
            }
            packedProtoAdapter = new PackedProtoAdapter(this);
        }
        this.packedAdapter = packedProtoAdapter;
        if (!(this instanceof RepeatedProtoAdapter) && !z) {
            repeatedProtoAdapter = new RepeatedProtoAdapter(this);
        }
        this.repeatedAdapter = repeatedProtoAdapter;
    }

    public static final <M extends Message<?, ?>> ProtoAdapter<M> get(M m) {
        return INSTANCE.get(m);
    }

    public static final <E extends WireEnum> EnumAdapter<E> newEnumAdapter(Class<E> cls) {
        return INSTANCE.newEnumAdapter(cls);
    }

    public static final <K, V> ProtoAdapter<Map<K, V>> newMapAdapter(ProtoAdapter<K> protoAdapter, ProtoAdapter<V> protoAdapter2) {
        return INSTANCE.newMapAdapter(protoAdapter, protoAdapter2);
    }

    public static final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> cls) {
        return INSTANCE.newMessageAdapter(cls);
    }

    public final ProtoAdapter<List<E>> asPacked() {
        if (this.fieldEncoding == FieldEncoding.LENGTH_DELIMITED) {
            ay0.e("Unable to pack a length-delimited type.");
            return null;
        }
        ProtoAdapter<List<E>> protoAdapter = this.packedAdapter;
        if (protoAdapter != null) {
            return protoAdapter;
        }
        ik4.k("Can't create a packed adapter from a packed or repeated adapter.");
        return null;
    }

    public final ProtoAdapter<List<E>> asRepeated() {
        ProtoAdapter<List<E>> protoAdapter = this.repeatedAdapter;
        if (protoAdapter != null) {
            return protoAdapter;
        }
        ik4.k("Can't create a repeated adapter from a repeated or packed adapter.");
        return null;
    }

    public abstract E decode(ProtoReader reader);

    public final E decode(InputStream stream) {
        stream.getClass();
        return decode(new yua(vo7.N(stream)));
    }

    public abstract void encode(ProtoWriter writer, E value);

    public final void encode(OutputStream stream, E value) {
        stream.getClass();
        uw8 uw8Var = new uw8(stream, new fmd());
        xua xuaVar = new xua(uw8Var);
        encode(xuaVar, value);
        if (xuaVar.c) {
            ygf.f("closed");
            return;
        }
        kz0 kz0Var = xuaVar.b;
        long j = kz0Var.b;
        if (j > 0) {
            uw8Var.c0(kz0Var, j);
        }
    }

    public final h21 encodeByteString(E value) {
        kz0 kz0Var = new kz0();
        encode(kz0Var, value);
        return kz0Var.r(kz0Var.b);
    }

    public void encodeWithTag(ReverseProtoWriter writer, int tag, E value) {
        writer.getClass();
        if (value != null) {
            if (this.fieldEncoding == FieldEncoding.LENGTH_DELIMITED) {
                int byteCount = writer.getByteCount();
                encode(writer, value);
                writer.writeVarint32(writer.getByteCount() - byteCount);
            } else {
                encode(writer, value);
            }
            writer.writeTag(tag, this.fieldEncoding);
        }
    }

    public abstract int encodedSize(E value);

    public int encodedSizeWithTag(int tag, E value) {
        if (value == null) {
            return 0;
        }
        int iEncodedSize = encodedSize(value);
        if (this.fieldEncoding == FieldEncoding.LENGTH_DELIMITED) {
            iEncodedSize += ProtoWriter.INSTANCE.varint32Size$wire_runtime(iEncodedSize);
        }
        return ProtoWriter.INSTANCE.tagSize$wire_runtime(tag) + iEncodedSize;
    }

    /* JADX INFO: renamed from: getFieldEncoding$wire_runtime, reason: from getter */
    public final FieldEncoding getFieldEncoding() {
        return this.fieldEncoding;
    }

    public final E getIdentity() {
        return this.identity;
    }

    public final ProtoAdapter<List<E>> getPackedAdapter$wire_runtime() {
        return this.packedAdapter;
    }

    public final ProtoAdapter<List<E>> getRepeatedAdapter$wire_runtime() {
        return this.repeatedAdapter;
    }

    public final String getSourceFile() {
        return this.sourceFile;
    }

    public final Syntax getSyntax() {
        return this.syntax;
    }

    public final wg6 getType() {
        return this.type;
    }

    public final String getTypeUrl() {
        return this.typeUrl;
    }

    public final boolean isStruct$wire_runtime() {
        return equals(STRUCT_MAP) || equals(STRUCT_LIST) || equals(STRUCT_VALUE) || equals(STRUCT_NULL);
    }

    public abstract E redact(E value);

    public String toString(E value) {
        return String.valueOf(value);
    }

    public final void tryDecode(ProtoReader reader, List<E> destination) {
        reader.getClass();
        destination.getClass();
        if (reader.beforePossiblyPackedScalar$wire_runtime()) {
            destination.add(decode(reader));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final ProtoAdapter<?> withLabel$wire_runtime(WireField.Label label) {
        label.getClass();
        return label.isRepeated() ? label.isPacked() ? asPacked() : asRepeated() : this;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000Â\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0015\n\u0002\b\t\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0002\b\t\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0013\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0001\n\u0002\b\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001:\u0001eB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003JI\u0010\n\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\t0\u0006\"\u0004\b\u0001\u0010\u0004\"\u0004\b\u0002\u0010\u00052\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00010\u00062\f\u0010\b\u001a\b\u0012\u0004\u0012\u00028\u00020\u0006H\u0007¢\u0006\u0004\b\n\u0010\u000bJO\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0014\b\u0001\u0010\r*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\f\"\u0014\b\u0002\u0010\u000f*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u000e2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u0010H\u0007¢\u0006\u0004\b\u0012\u0010\u0013JW\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0014\b\u0001\u0010\r*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\f\"\u0014\b\u0002\u0010\u000f*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u000e2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u00102\u0006\u0010\u0015\u001a\u00020\u0014H\u0007¢\u0006\u0004\b\u0012\u0010\u0016J_\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0014\b\u0001\u0010\r*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\f\"\u0014\b\u0002\u0010\u000f*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u000e2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u00102\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u0017H\u0007¢\u0006\u0004\b\u0012\u0010\u0019Ji\u0010\u0012\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0014\b\u0001\u0010\r*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\f\"\u0014\b\u0002\u0010\u000f*\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u000e2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u00102\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u00172\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aH\u0007¢\u0006\u0004\b\u0012\u0010\u001cJ-\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00010\u001f\"\b\b\u0001\u0010\u001e*\u00020\u001d2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u0010H\u0007¢\u0006\u0004\b \u0010!J/\u0010#\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0010\b\u0001\u0010\r*\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\f2\u0006\u0010\"\u001a\u00028\u0001H\u0007¢\u0006\u0004\b#\u0010$J)\u0010#\u001a\b\u0012\u0004\u0012\u00028\u00010\u0006\"\u0004\b\u0001\u0010\r2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u00010\u0010H\u0007¢\u0006\u0004\b#\u0010\u0013J\u001b\u0010#\u001a\u0006\u0012\u0002\b\u00030\u00062\u0006\u0010%\u001a\u00020\u0014H\u0007¢\u0006\u0004\b#\u0010&J%\u0010#\u001a\u0006\u0012\u0002\b\u00030\u00062\u0006\u0010%\u001a\u00020\u00142\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aH\u0007¢\u0006\u0004\b#\u0010'R\u001a\u0010)\u001a\b\u0012\u0004\u0012\u00020(0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010*R\u001a\u0010,\u001a\b\u0012\u0004\u0012\u00020+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b,\u0010*R\u001a\u0010.\u001a\b\u0012\u0004\u0012\u00020-0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b.\u0010*R\u001a\u0010/\u001a\b\u0012\u0004\u0012\u00020+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b/\u0010*R\u001a\u00100\u001a\b\u0012\u0004\u0012\u00020-0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b0\u0010*R\u001a\u00101\u001a\b\u0012\u0004\u0012\u00020+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b1\u0010*R\u001a\u00102\u001a\b\u0012\u0004\u0012\u00020-0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b2\u0010*R\u001a\u00103\u001a\b\u0012\u0004\u0012\u00020+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b3\u0010*R\u001a\u00104\u001a\b\u0012\u0004\u0012\u00020-0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b4\u0010*R\u001a\u00105\u001a\b\u0012\u0004\u0012\u00020+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b5\u0010*R\u001a\u00106\u001a\b\u0012\u0004\u0012\u00020-0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b6\u0010*R\u001a\u00108\u001a\b\u0012\u0004\u0012\u0002070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b8\u0010*R\u001a\u0010:\u001a\b\u0012\u0004\u0012\u0002090\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b:\u0010*R\u001a\u0010;\u001a\b\u0012\u0004\u0012\u0002070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b;\u0010*R\u001a\u0010<\u001a\b\u0012\u0004\u0012\u0002090\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b<\u0010*R\u001a\u0010=\u001a\b\u0012\u0004\u0012\u0002070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b=\u0010*R\u001a\u0010>\u001a\b\u0012\u0004\u0012\u0002090\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b>\u0010*R\u001a\u0010?\u001a\b\u0012\u0004\u0012\u0002070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b?\u0010*R\u001a\u0010@\u001a\b\u0012\u0004\u0012\u0002090\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b@\u0010*R\u001a\u0010A\u001a\b\u0012\u0004\u0012\u0002070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bA\u0010*R\u001a\u0010B\u001a\b\u0012\u0004\u0012\u0002090\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bB\u0010*R\u001a\u0010D\u001a\b\u0012\u0004\u0012\u00020C0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bD\u0010*R\u001a\u0010F\u001a\b\u0012\u0004\u0012\u00020E0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bF\u0010*R\u001a\u0010H\u001a\b\u0012\u0004\u0012\u00020G0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bH\u0010*R\u001a\u0010J\u001a\b\u0012\u0004\u0012\u00020I0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bJ\u0010*R\u001a\u0010L\u001a\b\u0012\u0004\u0012\u00020K0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bL\u0010*R\u001a\u0010M\u001a\b\u0012\u0004\u0012\u00020\u00140\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bM\u0010*R\u001a\u0010O\u001a\b\u0012\u0004\u0012\u00020N0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bO\u0010*R&\u0010P\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0002\b\u0003\u0018\u00010\t0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bP\u0010*R \u0010R\u001a\u000e\u0012\n\u0012\b\u0012\u0002\b\u0003\u0018\u00010Q0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bR\u0010*R\u001c\u0010T\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010S0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bT\u0010*R\u001c\u0010U\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bU\u0010*R\u001c\u0010V\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010G0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bV\u0010*R\u001c\u0010W\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010C0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bW\u0010*R\u001c\u0010X\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bX\u0010*R\u001c\u0010Y\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001070\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bY\u0010*R\u001c\u0010Z\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bZ\u0010*R\u001c\u0010[\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010+0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b[\u0010*R\u001c\u0010\\\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\\\u0010*R\u001c\u0010]\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00140\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b]\u0010*R\u001c\u0010^\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010K0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b^\u0010*R\u001e\u0010a\u001a\f\u0012\b\u0012\u00060_j\u0002``0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\ba\u0010*R\u001e\u0010d\u001a\f\u0012\b\u0012\u00060bj\u0002`c0\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bd\u0010*¨\u0006f"}, d2 = {"Lcom/squareup/wire/ProtoAdapter$Companion;", "", "<init>", "()V", "K", "V", "Lcom/squareup/wire/ProtoAdapter;", "keyAdapter", "valueAdapter", "", "newMapAdapter", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoAdapter;)Lcom/squareup/wire/ProtoAdapter;", "Lcom/squareup/wire/Message;", "M", "Lcom/squareup/wire/Message$Builder;", "B", "Ljava/lang/Class;", "type", "newMessageAdapter", "(Ljava/lang/Class;)Lcom/squareup/wire/ProtoAdapter;", "", "typeUrl", "(Ljava/lang/Class;Ljava/lang/String;)Lcom/squareup/wire/ProtoAdapter;", "Lcom/squareup/wire/Syntax;", "syntax", "(Ljava/lang/Class;Ljava/lang/String;Lcom/squareup/wire/Syntax;)Lcom/squareup/wire/ProtoAdapter;", "Ljava/lang/ClassLoader;", "classLoader", "(Ljava/lang/Class;Ljava/lang/String;Lcom/squareup/wire/Syntax;Ljava/lang/ClassLoader;)Lcom/squareup/wire/ProtoAdapter;", "Lcom/squareup/wire/WireEnum;", "E", "Lcom/squareup/wire/EnumAdapter;", "newEnumAdapter", "(Ljava/lang/Class;)Lcom/squareup/wire/EnumAdapter;", "message", "get", "(Lcom/squareup/wire/Message;)Lcom/squareup/wire/ProtoAdapter;", "adapterString", "(Ljava/lang/String;)Lcom/squareup/wire/ProtoAdapter;", "(Ljava/lang/String;Ljava/lang/ClassLoader;)Lcom/squareup/wire/ProtoAdapter;", "", "BOOL", "Lcom/squareup/wire/ProtoAdapter;", "", "INT32", "", "INT32_ARRAY", "UINT32", "UINT32_ARRAY", "SINT32", "SINT32_ARRAY", "FIXED32", "FIXED32_ARRAY", "SFIXED32", "SFIXED32_ARRAY", "", "INT64", "", "INT64_ARRAY", "UINT64", "UINT64_ARRAY", "SINT64", "SINT64_ARRAY", "FIXED64", "FIXED64_ARRAY", "SFIXED64", "SFIXED64_ARRAY", "", "FLOAT", "", "FLOAT_ARRAY", "", "DOUBLE", "", "DOUBLE_ARRAY", "Lh21;", "BYTES", "STRING", "Lc1e;", "EMPTY", "STRUCT_MAP", "", "STRUCT_LIST", "", "STRUCT_NULL", "STRUCT_VALUE", "DOUBLE_VALUE", "FLOAT_VALUE", "INT64_VALUE", "UINT64_VALUE", "INT32_VALUE", "UINT32_VALUE", "BOOL_VALUE", "STRING_VALUE", "BYTES_VALUE", "j$/time/Duration", "Lcom/squareup/wire/Duration;", "DURATION", "j$/time/Instant", "Lcom/squareup/wire/Instant;", "INSTANT", "UnsupportedTypeProtoAdapter", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final <M> ProtoAdapter<M> get(Class<M> type) {
            type.getClass();
            try {
                Object obj = type.getField("ADAPTER").get(null);
                obj.getClass();
                return (ProtoAdapter) obj;
            } catch (IllegalAccessException e) {
                throw new IllegalArgumentException("failed to access " + type.getName() + "#ADAPTER", e);
            } catch (NoSuchFieldException e2) {
                throw new IllegalArgumentException("failed to access " + type.getName() + "#ADAPTER", e2);
            }
        }

        public final <E extends WireEnum> EnumAdapter<E> newEnumAdapter(Class<E> type) {
            type.getClass();
            return new RuntimeEnumAdapter(type, Syntax.PROTO_2);
        }

        public final <K, V> ProtoAdapter<Map<K, V>> newMapAdapter(ProtoAdapter<K> keyAdapter, ProtoAdapter<V> valueAdapter) {
            keyAdapter.getClass();
            valueAdapter.getClass();
            return new MapProtoAdapter(keyAdapter, valueAdapter);
        }

        public final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> type, String typeUrl, Syntax syntax) {
            type.getClass();
            typeUrl.getClass();
            syntax.getClass();
            return ReflectionKt.createRuntimeMessageAdapter$default(type, typeUrl, syntax, null, false, 24, null);
        }

        public Companion(gy2 gy2Var) {
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0010\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0018\u0010\b\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0018\u0010\b\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0010\u0010\f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u000fH\u0016¨\u0006\u0010"}, d2 = {"Lcom/squareup/wire/ProtoAdapter$Companion$UnsupportedTypeProtoAdapter;", "Lcom/squareup/wire/ProtoAdapter;", "", "<init>", "()V", "redact", "value", "encodedSize", "encode", "writer", "Lcom/squareup/wire/ProtoWriter;", "Lcom/squareup/wire/ReverseProtoWriter;", "decode", "reader", "Lcom/squareup/wire/ProtoReader;", "Lcom/squareup/wire/ProtoReader32;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
        public static final class UnsupportedTypeProtoAdapter extends ProtoAdapter {
            public UnsupportedTypeProtoAdapter() {
                super(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Void.class));
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Void decode(ProtoReader reader) {
                reader.getClass();
                throw new IllegalStateException("Operation not supported.");
            }

            public final Void encode(ProtoWriter writer, Void value) {
                writer.getClass();
                value.getClass();
                throw new IllegalStateException("Operation not supported.");
            }

            public final Void encodedSize(Void value) {
                value.getClass();
                throw new IllegalStateException("Operation not supported.");
            }

            public final Void redact(Void value) {
                value.getClass();
                throw new IllegalStateException("Operation not supported.");
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object decode(ProtoReader protoReader) {
                decode(protoReader);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Object obj) {
                encodedSize((Void) obj);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object redact(Object obj) {
                redact((Void) obj);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object decode(ProtoReader32 protoReader32) {
                decode(protoReader32);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Void decode(ProtoReader32 reader) {
                reader.getClass();
                throw new IllegalStateException("Operation not supported.");
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Object obj) {
                encode(reverseProtoWriter, (Void) obj);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Object obj) {
                encode(protoWriter, (Void) obj);
                throw null;
            }

            public final Void encode(ReverseProtoWriter writer, Void value) {
                writer.getClass();
                value.getClass();
                throw new IllegalStateException("Operation not supported.");
            }
        }

        public final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> type, String typeUrl) {
            type.getClass();
            typeUrl.getClass();
            return ReflectionKt.createRuntimeMessageAdapter$default(type, typeUrl, Syntax.PROTO_2, null, false, 24, null);
        }

        public final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> type) {
            type.getClass();
            return ReflectionKt.createRuntimeMessageAdapter$default(type, null, Syntax.PROTO_2, null, false, 24, null);
        }

        public final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> type, String typeUrl, Syntax syntax, ClassLoader classLoader) {
            type.getClass();
            typeUrl.getClass();
            syntax.getClass();
            return ReflectionKt.createRuntimeMessageAdapter$default(type, typeUrl, syntax, classLoader, false, 16, null);
        }

        public final <M extends Message<?, ?>> ProtoAdapter<M> get(M message) {
            message.getClass();
            return get(message.getClass());
        }

        public final ProtoAdapter<?> get(String adapterString) {
            adapterString.getClass();
            return get(adapterString, ProtoAdapter.class.getClassLoader());
        }

        public final ProtoAdapter<?> get(String adapterString, ClassLoader classLoader) {
            adapterString.getClass();
            try {
                int iY = muc.Y(adapterString, '#', 0, 6);
                String strSubstring = adapterString.substring(0, iY);
                Object obj = Class.forName(strSubstring, true, classLoader).getField(adapterString.substring(iY + 1)).get(null);
                obj.getClass();
                return (ProtoAdapter) obj;
            } catch (ClassNotFoundException e) {
                throw new IllegalArgumentException("failed to access ".concat(adapterString), e);
            } catch (IllegalAccessException e2) {
                throw new IllegalArgumentException("failed to access ".concat(adapterString), e2);
            } catch (NoSuchFieldException e3) {
                throw new IllegalArgumentException("failed to access ".concat(adapterString), e3);
            }
        }
    }

    public static final <M> ProtoAdapter<M> get(Class<M> cls) {
        return INSTANCE.get(cls);
    }

    public static final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> cls, String str) {
        return INSTANCE.newMessageAdapter(cls, str);
    }

    public static final ProtoAdapter<?> get(String str) {
        return INSTANCE.get(str);
    }

    public static final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> cls, String str, Syntax syntax) {
        return INSTANCE.newMessageAdapter(cls, str, syntax);
    }

    public static final ProtoAdapter<?> get(String str, ClassLoader classLoader) {
        return INSTANCE.get(str, classLoader);
    }

    public static final <M extends Message<M, B>, B extends Message.Builder<M, B>> ProtoAdapter<M> newMessageAdapter(Class<M> cls, String str, Syntax syntax, ClassLoader classLoader) {
        return INSTANCE.newMessageAdapter(cls, str, syntax, classLoader);
    }

    public E decode(ProtoReader32 reader) {
        reader.getClass();
        return decode(reader.asProtoReader());
    }

    public final E decode(byte[] bytes) {
        bytes.getClass();
        return decode(ProtoReader32Kt.ProtoReader32$default(bytes, 0, 0, 6, (Object) null));
    }

    public final E decode(h21 bytes) {
        bytes.getClass();
        return decode(ProtoReader32Kt.ProtoReader32$default(bytes, 0, 0, 6, (Object) null));
    }

    public final E decode(zz0 source) {
        source.getClass();
        return decode(new ProtoReader(source));
    }

    public final void tryDecode(ProtoReader32 reader, List<E> destination) {
        reader.getClass();
        destination.getClass();
        if (reader.beforePossiblyPackedScalar()) {
            destination.add(decode(reader));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00060\u0001j\u0002`\u0002B\u001d\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bB\u001d\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\t¢\u0006\u0004\b\u0007\u0010\nR\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/squareup/wire/ProtoAdapter$EnumConstantNotFoundException;", "Ljava/lang/IllegalArgumentException;", "Lkotlin/IllegalArgumentException;", "", "value", "Lwg6;", "type", "<init>", "(ILwg6;)V", "Ljava/lang/Class;", "(ILjava/lang/Class;)V", "I", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class EnumConstantNotFoundException extends IllegalArgumentException {
        public final int value;

        /* JADX WARN: Illegal instructions before constructor call */
        public EnumConstantNotFoundException(int i, wg6 wg6Var) {
            StringBuilder sbC = ev6.C("Unknown enum tag ", i, " for ");
            sbC.append(wg6Var != null ? vx0.T(wg6Var).getName() : null);
            super(sbC.toString());
            this.value = i;
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public EnumConstantNotFoundException(int i, Class<?> cls) {
            this(i, n1b.a.b(cls));
            cls.getClass();
        }
    }

    public void encodeWithTag(ProtoWriter writer, int tag, E value) {
        writer.getClass();
        if (value != null) {
            writer.writeTag(tag, this.fieldEncoding);
            if (this.fieldEncoding == FieldEncoding.LENGTH_DELIMITED) {
                writer.writeVarint32(encodedSize(value));
            }
            encode(writer, value);
        }
    }

    public void encode(ReverseProtoWriter writer, E value) {
        writer.getClass();
        writer.writeForward$wire_runtime(new ProtoAdapterKt.C00481(this, value));
    }

    public final void encode(xz0 sink, E value) {
        sink.getClass();
        ReverseProtoWriter reverseProtoWriter = new ReverseProtoWriter();
        encode(reverseProtoWriter, value);
        reverseProtoWriter.writeTo(sink);
    }

    public final byte[] encode(E value) {
        kz0 kz0Var = new kz0();
        encode(kz0Var, value);
        return kz0Var.U(kz0Var.b);
    }

    public /* synthetic */ ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var, String str, Syntax syntax, Object obj, String str2, int i, gy2 gy2Var) {
        this(fieldEncoding, wg6Var, str, syntax, (i & 16) != 0 ? null : obj, (i & 32) != 0 ? null : str2);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, Class<?> cls) {
        this(fieldEncoding, n1b.a.b(cls));
        fieldEncoding.getClass();
        cls.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, Class<?> cls, String str) {
        this(fieldEncoding, n1b.a.b(cls), str, Syntax.PROTO_2);
        fieldEncoding.getClass();
        cls.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, Class<?> cls, String str, Syntax syntax) {
        this(fieldEncoding, n1b.a.b(cls), str, syntax, (Object) null, (String) null);
        fieldEncoding.getClass();
        cls.getClass();
        syntax.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, Class<?> cls, String str, Syntax syntax, E e) {
        this(fieldEncoding, n1b.a.b(cls), str, syntax, e, (String) null);
        fieldEncoding.getClass();
        cls.getClass();
        syntax.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, Class<?> cls, String str, Syntax syntax, E e, String str2) {
        this(fieldEncoding, n1b.a.b(cls), str, syntax, e, str2);
        fieldEncoding.getClass();
        cls.getClass();
        syntax.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var) {
        this(fieldEncoding, wg6Var, (String) null, Syntax.PROTO_2);
        fieldEncoding.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var, String str) {
        this(fieldEncoding, wg6Var, str, Syntax.PROTO_2);
        fieldEncoding.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var, String str, Syntax syntax) {
        this(fieldEncoding, wg6Var, str, syntax, (Object) null, (String) null);
        fieldEncoding.getClass();
        syntax.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ProtoAdapter(FieldEncoding fieldEncoding, wg6 wg6Var, String str, Syntax syntax, E e) {
        this(fieldEncoding, wg6Var, str, syntax, e, (String) null);
        fieldEncoding.getClass();
        syntax.getClass();
    }
}
