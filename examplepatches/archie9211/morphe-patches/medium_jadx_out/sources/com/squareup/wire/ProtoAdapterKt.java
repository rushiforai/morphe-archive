package com.squareup.wire;

import com.medium.android.data.notification.YMl.DtuT;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.WireField;
import defpackage.ay0;
import defpackage.b09;
import defpackage.c1e;
import defpackage.cu1;
import defpackage.ei7;
import defpackage.h21;
import defpackage.ik4;
import defpackage.jq7;
import defpackage.k80;
import defpackage.ka1;
import defpackage.kz0;
import defpackage.n1b;
import defpackage.x45;
import defpackage.xz0;
import defpackage.zz0;
import j$.time.Duration;
import j$.time.Instant;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000¶\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0007\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u000b\u001a2\u0010\u0005\u001a\u00020\u0002\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0003\u001a\u00020\u00022\b\u0010\u0004\u001a\u0004\u0018\u00018\u0000H\u0080\b¢\u0006\u0004\b\u0005\u0010\u0006\u001a0\u0010\n\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\n\u0010\u000b\u001a:\u0010\r\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\b\u001a\u00020\f2\u0006\u0010\u0003\u001a\u00020\u00022\b\u0010\u0004\u001a\u0004\u0018\u00018\u0000H\u0080\b¢\u0006\u0004\b\r\u0010\u000e\u001a:\u0010\r\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\b\u0010\u0004\u001a\u0004\u0018\u00018\u0000H\u0080\b¢\u0006\u0004\b\r\u0010\u000f\u001a0\u0010\u0012\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0004\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\u0012\u0010\u0013\u001a(\u0010\u0012\u001a\u00020\u0014\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0004\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\u0012\u0010\u0015\u001a(\u0010\u0017\u001a\u00020\u0016\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0004\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\u0017\u0010\u0018\u001a(\u0010\u001a\u001a\u00028\u0000\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0019\u001a\u00020\u0014H\u0080\b¢\u0006\u0004\b\u001a\u0010\u001b\u001a(\u0010\u001a\u001a\u00028\u0000\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u0019\u001a\u00020\u0016H\u0080\b¢\u0006\u0004\b\u001a\u0010\u001c\u001a(\u0010\u001a\u001a\u00028\u0000\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010\u001e\u001a\u00020\u001dH\u0080\b¢\u0006\u0004\b\u001a\u0010\u001f\u001a6\u0010$\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010!\u001a\u00020 2\f\u0010#\u001a\b\u0012\u0004\u0012\u00028\u00000\"H\u0080\b¢\u0006\u0004\b$\u0010%\u001a6\u0010$\u001a\u00020\t\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010!\u001a\u00020&2\f\u0010#\u001a\b\u0012\u0004\u0012\u00028\u00000\"H\u0080\b¢\u0006\u0004\b$\u0010'\u001a\u001e\u0010)\u001a\u00020(\"\u0004\b\u0000\u0010\u00002\u0006\u0010\u0004\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b)\u0010*\u001a,\u0010-\u001a\u0006\u0012\u0002\b\u00030\u0001\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010,\u001a\u00020+H\u0080\b¢\u0006\u0004\b-\u0010.\u001a,\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000/0\u0001\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u0001H\u0080\b¢\u0006\u0004\b0\u00101\u001a,\u00102\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000/0\u0001\"\u0004\b\u0000\u0010\u0000*\b\u0012\u0004\u0012\u00028\u00000\u0001H\u0080\b¢\u0006\u0004\b2\u00101\u001aJ\u00108\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001070\u0001\"\u0004\b\u0000\u00103\"\u0004\b\u0001\u001042\f\u00105\u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\f\u00106\u001a\b\u0012\u0004\u0012\u00028\u00010\u0001H\u0080\b¢\u0006\u0004\b8\u00109\u001a\u0015\u0010;\u001a\b\u0012\u0004\u0012\u00020:0\u0001H\u0000¢\u0006\u0004\b;\u0010<\u001a\u0015\u0010=\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001H\u0000¢\u0006\u0004\b=\u0010<\u001a\u0015\u0010>\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001H\u0000¢\u0006\u0004\b>\u0010<\u001a\u0015\u0010?\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001H\u0000¢\u0006\u0004\b?\u0010<\u001a\u0015\u0010@\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001H\u0000¢\u0006\u0004\b@\u0010<\u001a\u0015\u0010A\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001H\u0000¢\u0006\u0004\bA\u0010<\u001a\u0015\u0010C\u001a\b\u0012\u0004\u0012\u00020B0\u0001H\u0000¢\u0006\u0004\bC\u0010<\u001a\u0015\u0010D\u001a\b\u0012\u0004\u0012\u00020B0\u0001H\u0000¢\u0006\u0004\bD\u0010<\u001a\u0015\u0010E\u001a\b\u0012\u0004\u0012\u00020B0\u0001H\u0000¢\u0006\u0004\bE\u0010<\u001a\u0015\u0010F\u001a\b\u0012\u0004\u0012\u00020B0\u0001H\u0000¢\u0006\u0004\bF\u0010<\u001a\u0015\u0010G\u001a\b\u0012\u0004\u0012\u00020B0\u0001H\u0000¢\u0006\u0004\bG\u0010<\u001a\u000f\u0010I\u001a\u00020HH\u0000¢\u0006\u0004\bI\u0010J\u001a\u000f\u0010L\u001a\u00020KH\u0000¢\u0006\u0004\bL\u0010M\u001a\u0015\u0010N\u001a\b\u0012\u0004\u0012\u00020(0\u0001H\u0000¢\u0006\u0004\bN\u0010<\u001a\u0015\u0010O\u001a\b\u0012\u0004\u0012\u00020\u00160\u0001H\u0000¢\u0006\u0004\bO\u0010<\u001a\u0019\u0010R\u001a\f\u0012\b\u0012\u00060Pj\u0002`Q0\u0001H\u0000¢\u0006\u0004\bR\u0010<\u001a\u0019\u0010U\u001a\f\u0012\b\u0012\u00060Sj\u0002`T0\u0001H\u0000¢\u0006\u0004\bU\u0010<\u001a\u0015\u0010V\u001a\b\u0012\u0004\u0012\u00020\t0\u0001H\u0000¢\u0006\u0004\bV\u0010<\u001a!\u0010W\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020(\u0012\u0002\b\u0003\u0018\u0001070\u0001H\u0000¢\u0006\u0004\bW\u0010<\u001a\u001b\u0010X\u001a\u000e\u0012\n\u0012\b\u0012\u0002\b\u0003\u0018\u00010/0\u0001H\u0000¢\u0006\u0004\bX\u0010<\u001a\u0017\u0010Z\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010Y0\u0001H\u0000¢\u0006\u0004\bZ\u0010<\u001a\u0017\u0010\\\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010[0\u0001H\u0000¢\u0006\u0004\b\\\u0010<\u001a7\u0010`\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u0001\"\b\b\u0000\u0010]*\u00020[2\f\u0010^\u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\u0006\u0010_\u001a\u00020(H\u0000¢\u0006\u0004\b`\u0010a\"\u0014\u0010b\u001a\u00020\u00028\u0002X\u0082T¢\u0006\u0006\n\u0004\bb\u0010c\"\u0014\u0010d\u001a\u00020\u00028\u0002X\u0082T¢\u0006\u0006\n\u0004\bd\u0010c\"\u0014\u0010e\u001a\u00020\u00028\u0002X\u0082T¢\u0006\u0006\n\u0004\be\u0010c¨\u0006f"}, d2 = {"E", "Lcom/squareup/wire/ProtoAdapter;", "", "tag", "value", "commonEncodedSizeWithTag", "(Lcom/squareup/wire/ProtoAdapter;ILjava/lang/Object;)I", "Lcom/squareup/wire/ReverseProtoWriter;", "writer", "Lc1e;", "delegateEncode", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ReverseProtoWriter;Ljava/lang/Object;)V", "Lcom/squareup/wire/ProtoWriter;", "commonEncodeWithTag", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoWriter;ILjava/lang/Object;)V", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ReverseProtoWriter;ILjava/lang/Object;)V", "Lxz0;", "sink", "commonEncode", "(Lcom/squareup/wire/ProtoAdapter;Lxz0;Ljava/lang/Object;)V", "", "(Lcom/squareup/wire/ProtoAdapter;Ljava/lang/Object;)[B", "Lh21;", "commonEncodeByteString", "(Lcom/squareup/wire/ProtoAdapter;Ljava/lang/Object;)Lh21;", "bytes", "commonDecode", "(Lcom/squareup/wire/ProtoAdapter;[B)Ljava/lang/Object;", "(Lcom/squareup/wire/ProtoAdapter;Lh21;)Ljava/lang/Object;", "Lzz0;", "source", "(Lcom/squareup/wire/ProtoAdapter;Lzz0;)Ljava/lang/Object;", "Lcom/squareup/wire/ProtoReader;", "reader", "", "destination", "commonTryDecode", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoReader;Ljava/util/List;)V", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoReader32;Ljava/util/List;)V", "", "commonToString", "(Ljava/lang/Object;)Ljava/lang/String;", "Lcom/squareup/wire/WireField$Label;", "label", "commonWithLabel", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/WireField$Label;)Lcom/squareup/wire/ProtoAdapter;", "", "commonCreatePacked", "(Lcom/squareup/wire/ProtoAdapter;)Lcom/squareup/wire/ProtoAdapter;", "commonCreateRepeated", "K", "V", "keyAdapter", "valueAdapter", "", "commonNewMapAdapter", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoAdapter;)Lcom/squareup/wire/ProtoAdapter;", "", "commonBool", "()Lcom/squareup/wire/ProtoAdapter;", "commonInt32", "commonUint32", "commonSint32", "commonFixed32", "commonSfixed32", "", "commonInt64", "commonUint64", "commonSint64", "commonFixed64", "commonSfixed64", "Lcom/squareup/wire/FloatProtoAdapter;", "commonFloat", "()Lcom/squareup/wire/FloatProtoAdapter;", "Lcom/squareup/wire/DoubleProtoAdapter;", "commonDouble", "()Lcom/squareup/wire/DoubleProtoAdapter;", "commonString", "commonBytes", "j$/time/Duration", "Lcom/squareup/wire/Duration;", "commonDuration", "j$/time/Instant", "Lcom/squareup/wire/Instant;", "commonInstant", "commonEmpty", "commonStructMap", "commonStructList", "", "commonStructNull", "", "commonStructValue", "T", "delegate", "typeUrl", "commonWrapper", "(Lcom/squareup/wire/ProtoAdapter;Ljava/lang/String;)Lcom/squareup/wire/ProtoAdapter;", "FIXED_BOOL_SIZE", "I", "FIXED_32_SIZE", "FIXED_64_SIZE", "wire-runtime"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class ProtoAdapterKt {
    private static final int FIXED_32_SIZE = 4;
    private static final int FIXED_64_SIZE = 8;
    private static final int FIXED_BOOL_SIZE = 1;

    public static final ProtoAdapter<Boolean> commonBool() {
        return new ProtoAdapter<Boolean>(FieldEncoding.VARINT, n1b.a.b(Boolean.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonBool.1
            {
                Boolean bool = Boolean.FALSE;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Boolean decode(ProtoReader reader) {
                reader.getClass();
                return Boolean.valueOf(reader.readVarint32() != 0);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Boolean bool) {
                encode(protoWriter, bool.booleanValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Boolean bool) {
                bool.getClass();
                return 1;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Boolean redact(Boolean bool) {
                bool.booleanValue();
                throw new UnsupportedOperationException();
            }

            public final int encodedSize(boolean value) {
                return 1;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Boolean bool) {
                encode(reverseProtoWriter, bool.booleanValue());
            }

            public final void encode(ProtoWriter writer, boolean value) {
                writer.getClass();
                writer.writeVarint32(value ? 1 : 0);
            }

            public final Boolean redact(boolean value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, boolean value) {
                writer.getClass();
                writer.writeVarint32(value ? 1 : 0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Boolean decode(ProtoReader32 reader) {
                reader.getClass();
                return Boolean.valueOf(reader.readVarint32() != 0);
            }
        };
    }

    public static final ProtoAdapter<h21> commonBytes() {
        return new ProtoAdapter<h21>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(h21.class), Syntax.PROTO_2, h21.d) { // from class: com.squareup.wire.ProtoAdapterKt.commonBytes.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final h21 decode(ProtoReader reader) {
                reader.getClass();
                return reader.readBytes();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, h21 value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(h21 value) {
                value.getClass();
                return value.e();
            }

            /* JADX INFO: renamed from: redact, reason: avoid collision after fix types in other method */
            public final h21 redact2(h21 value) {
                value.getClass();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ h21 redact(h21 h21Var) {
                redact2(h21Var);
                throw null;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final h21 decode(ProtoReader32 reader) {
                reader.getClass();
                return reader.readBytes();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, h21 value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value);
            }
        };
    }

    public static final <E> ProtoAdapter<List<E>> commonCreatePacked(ProtoAdapter<E> protoAdapter) {
        protoAdapter.getClass();
        if (protoAdapter.getFieldEncoding() != FieldEncoding.LENGTH_DELIMITED) {
            return new PackedProtoAdapter(protoAdapter);
        }
        ay0.e("Unable to pack a length-delimited type.");
        return null;
    }

    public static final <E> ProtoAdapter<List<E>> commonCreateRepeated(ProtoAdapter<E> protoAdapter) {
        protoAdapter.getClass();
        return new RepeatedProtoAdapter(protoAdapter);
    }

    public static final <E> E commonDecode(ProtoAdapter<E> protoAdapter, byte[] bArr) {
        protoAdapter.getClass();
        bArr.getClass();
        return protoAdapter.decode(ProtoReader32Kt.ProtoReader32$default(bArr, 0, 0, 6, (Object) null));
    }

    public static final DoubleProtoAdapter commonDouble() {
        return new DoubleProtoAdapter();
    }

    public static final ProtoAdapter<Duration> commonDuration() {
        return new ProtoAdapter<Duration>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Duration.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonDuration.1
            private final int getSameSignNanos(Duration duration) {
                return (duration.getSeconds() >= 0 || duration.getNano() == 0) ? duration.getNano() : duration.getNano() - 1000000000;
            }

            private final long getSameSignSeconds(Duration duration) {
                return (duration.getSeconds() >= 0 || duration.getNano() == 0) ? duration.getSeconds() : duration.getSeconds() + 1;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Duration decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                long jLongValue = 0;
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        Duration durationOfSeconds = Duration.ofSeconds(jLongValue, iIntValue);
                        durationOfSeconds.getClass();
                        return durationOfSeconds;
                    }
                    if (iNextTag == 1) {
                        jLongValue = ProtoAdapter.INT64.decode(reader).longValue();
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Duration value) {
                writer.getClass();
                value.getClass();
                long sameSignSeconds = getSameSignSeconds(value);
                if (sameSignSeconds != 0) {
                    ProtoAdapter.INT64.encodeWithTag(writer, 1, Long.valueOf(sameSignSeconds));
                }
                int sameSignNanos = getSameSignNanos(value);
                if (sameSignNanos != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(sameSignNanos));
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Duration value) {
                value.getClass();
                long sameSignSeconds = getSameSignSeconds(value);
                int iEncodedSizeWithTag = sameSignSeconds != 0 ? ProtoAdapter.INT64.encodedSizeWithTag(1, Long.valueOf(sameSignSeconds)) : 0;
                int sameSignNanos = getSameSignNanos(value);
                return sameSignNanos != 0 ? ProtoAdapter.INT32.encodedSizeWithTag(2, Integer.valueOf(sameSignNanos)) + iEncodedSizeWithTag : iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Duration redact(Duration duration) {
                Duration duration2 = duration;
                duration2.getClass();
                return duration2;
            }

            /* JADX INFO: renamed from: redact, reason: avoid collision after fix types in other method */
            public final Duration redact2(Duration value) {
                value.getClass();
                return value;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Duration value) {
                writer.getClass();
                value.getClass();
                int sameSignNanos = getSameSignNanos(value);
                if (sameSignNanos != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(sameSignNanos));
                }
                long sameSignSeconds = getSameSignSeconds(value);
                if (sameSignSeconds != 0) {
                    ProtoAdapter.INT64.encodeWithTag(writer, 1, Long.valueOf(sameSignSeconds));
                }
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Duration decode(ProtoReader32 reader) {
                reader.getClass();
                int iBeginMessage = reader.beginMessage();
                long jLongValue = 0;
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        Duration durationOfSeconds = Duration.ofSeconds(jLongValue, iIntValue);
                        durationOfSeconds.getClass();
                        return durationOfSeconds;
                    }
                    if (iNextTag == 1) {
                        jLongValue = ProtoAdapter.INT64.decode(reader).longValue();
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    }
                }
            }
        };
    }

    public static final ProtoAdapter<c1e> commonEmpty() {
        return new ProtoAdapter<c1e>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(c1e.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonEmpty.1
            /* JADX INFO: renamed from: decode, reason: avoid collision after fix types in other method */
            public final void decode2(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return;
                    }
                    reader.readUnknownField(iNextTag);
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, c1e value) {
                writer.getClass();
                value.getClass();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(c1e c1eVar) {
                c1eVar.getClass();
                return 0;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final c1e redact(c1e c1eVar) {
                c1eVar.getClass();
                return c1e.a;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, c1e value) {
                writer.getClass();
                value.getClass();
            }

            /* JADX INFO: renamed from: encodedSize, reason: avoid collision after fix types in other method */
            public final int encodedSize2(c1e value) {
                value.getClass();
                return 0;
            }

            /* JADX INFO: renamed from: redact, reason: avoid collision after fix types in other method */
            public final void redact2(c1e value) {
                value.getClass();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ c1e decode(ProtoReader protoReader) {
                decode2(protoReader);
                return c1e.a;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ c1e decode(ProtoReader32 protoReader32) {
                decode2(protoReader32);
                return c1e.a;
            }

            /* JADX INFO: renamed from: decode, reason: avoid collision after fix types in other method */
            public final void decode2(ProtoReader32 reader) {
                reader.getClass();
                int iBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag != -1) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return;
                    }
                }
            }
        };
    }

    public static final <E> void commonEncode(ProtoAdapter<E> protoAdapter, xz0 xz0Var, E e) {
        protoAdapter.getClass();
        xz0Var.getClass();
        ReverseProtoWriter reverseProtoWriter = new ReverseProtoWriter();
        protoAdapter.encode(reverseProtoWriter, e);
        reverseProtoWriter.writeTo(xz0Var);
    }

    public static final <E> h21 commonEncodeByteString(ProtoAdapter<E> protoAdapter, E e) {
        protoAdapter.getClass();
        kz0 kz0Var = new kz0();
        protoAdapter.encode(kz0Var, e);
        return kz0Var.r(kz0Var.b);
    }

    public static final <E> void commonEncodeWithTag(ProtoAdapter<E> protoAdapter, ReverseProtoWriter reverseProtoWriter, int i, E e) {
        protoAdapter.getClass();
        reverseProtoWriter.getClass();
        if (e == null) {
            return;
        }
        if (protoAdapter.getFieldEncoding() == FieldEncoding.LENGTH_DELIMITED) {
            int byteCount = reverseProtoWriter.getByteCount();
            protoAdapter.encode(reverseProtoWriter, e);
            reverseProtoWriter.writeVarint32(reverseProtoWriter.getByteCount() - byteCount);
        } else {
            protoAdapter.encode(reverseProtoWriter, e);
        }
        reverseProtoWriter.writeTag(i, protoAdapter.getFieldEncoding());
    }

    public static final <E> int commonEncodedSizeWithTag(ProtoAdapter<E> protoAdapter, int i, E e) {
        protoAdapter.getClass();
        if (e == null) {
            return 0;
        }
        int iEncodedSize = protoAdapter.encodedSize(e);
        if (protoAdapter.getFieldEncoding() == FieldEncoding.LENGTH_DELIMITED) {
            iEncodedSize += ProtoWriter.INSTANCE.varint32Size$wire_runtime(iEncodedSize);
        }
        return ProtoWriter.INSTANCE.tagSize$wire_runtime(i) + iEncodedSize;
    }

    public static final ProtoAdapter<Integer> commonFixed32() {
        return new ProtoAdapter<Integer>(FieldEncoding.FIXED32, n1b.a.b(Integer.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonFixed32.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader reader) {
                reader.getClass();
                return Integer.valueOf(reader.readFixed32());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Integer num) {
                encode(protoWriter, num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Integer num) {
                num.intValue();
                return 4;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Integer redact(Integer num) {
                num.intValue();
                throw new UnsupportedOperationException();
            }

            public final int encodedSize(int value) {
                return 4;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Integer num) throws EOFException {
                encode(reverseProtoWriter, num.intValue());
            }

            public final void encode(ProtoWriter writer, int value) {
                writer.getClass();
                writer.writeFixed32(value);
            }

            public final Integer redact(int value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, int value) throws EOFException {
                writer.getClass();
                writer.writeFixed32(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader32 reader) {
                reader.getClass();
                return Integer.valueOf(reader.readFixed32());
            }
        };
    }

    public static final ProtoAdapter<Long> commonFixed64() {
        return new ProtoAdapter<Long>(FieldEncoding.FIXED64, n1b.a.b(Long.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonFixed64.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader reader) {
                reader.getClass();
                return Long.valueOf(reader.readFixed64());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Long l) {
                encode(protoWriter, l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Long l) {
                l.longValue();
                return 8;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Long redact(Long l) {
                l.longValue();
                throw new UnsupportedOperationException();
            }

            public final int encodedSize(long value) {
                return 8;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Long l) throws EOFException {
                encode(reverseProtoWriter, l.longValue());
            }

            public final void encode(ProtoWriter writer, long value) {
                writer.getClass();
                writer.writeFixed64(value);
            }

            public final Long redact(long value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, long value) throws EOFException {
                writer.getClass();
                writer.writeFixed64(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader32 reader) {
                reader.getClass();
                return Long.valueOf(reader.readFixed64());
            }
        };
    }

    public static final FloatProtoAdapter commonFloat() {
        return new FloatProtoAdapter();
    }

    public static final ProtoAdapter<Instant> commonInstant() {
        return new ProtoAdapter<Instant>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Instant.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonInstant.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Instant decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                long jLongValue = 0;
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        Instant instantOfEpochSecond = Instant.ofEpochSecond(jLongValue, iIntValue);
                        instantOfEpochSecond.getClass();
                        return instantOfEpochSecond;
                    }
                    if (iNextTag == 1) {
                        jLongValue = ProtoAdapter.INT64.decode(reader).longValue();
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Instant value) {
                writer.getClass();
                value.getClass();
                long epochSecond = value.getEpochSecond();
                if (epochSecond != 0) {
                    ProtoAdapter.INT64.encodeWithTag(writer, 1, Long.valueOf(epochSecond));
                }
                int nano = value.getNano();
                if (nano != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(nano));
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Instant value) {
                value.getClass();
                long epochSecond = value.getEpochSecond();
                int iEncodedSizeWithTag = epochSecond != 0 ? ProtoAdapter.INT64.encodedSizeWithTag(1, Long.valueOf(epochSecond)) : 0;
                int nano = value.getNano();
                return nano != 0 ? ProtoAdapter.INT32.encodedSizeWithTag(2, Integer.valueOf(nano)) + iEncodedSizeWithTag : iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Instant redact(Instant instant) {
                Instant instant2 = instant;
                instant2.getClass();
                return instant2;
            }

            /* JADX INFO: renamed from: redact, reason: avoid collision after fix types in other method */
            public final Instant redact2(Instant value) {
                value.getClass();
                return value;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Instant value) {
                writer.getClass();
                value.getClass();
                int nano = value.getNano();
                if (nano != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(nano));
                }
                long epochSecond = value.getEpochSecond();
                if (epochSecond != 0) {
                    ProtoAdapter.INT64.encodeWithTag(writer, 1, Long.valueOf(epochSecond));
                }
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Instant decode(ProtoReader32 reader) {
                reader.getClass();
                int iBeginMessage = reader.beginMessage();
                long jLongValue = 0;
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        Instant instantOfEpochSecond = Instant.ofEpochSecond(jLongValue, iIntValue);
                        instantOfEpochSecond.getClass();
                        return instantOfEpochSecond;
                    }
                    if (iNextTag == 1) {
                        jLongValue = ProtoAdapter.INT64.decode(reader).longValue();
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    }
                }
            }
        };
    }

    public static final ProtoAdapter<Integer> commonInt32() {
        return new ProtoAdapter<Integer>(FieldEncoding.VARINT, n1b.a.b(Integer.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonInt32.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader reader) {
                reader.getClass();
                return Integer.valueOf(reader.readVarint32());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Integer num) {
                encode(protoWriter, num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Integer num) {
                return ProtoWriter.INSTANCE.int32Size$wire_runtime(num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Integer redact(Integer num) {
                num.intValue();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Integer num) throws EOFException {
                encode(reverseProtoWriter, num.intValue());
            }

            public final void encode(ProtoWriter writer, int value) {
                writer.getClass();
                writer.writeSignedVarint32$wire_runtime(value);
            }

            public final Integer redact(int value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, int value) throws EOFException {
                writer.getClass();
                writer.writeSignedVarint32$wire_runtime(value);
            }

            public final int encodedSize(int value) {
                return ProtoWriter.INSTANCE.int32Size$wire_runtime(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader32 reader) {
                reader.getClass();
                return Integer.valueOf(reader.readVarint32());
            }
        };
    }

    public static final ProtoAdapter<Long> commonInt64() {
        return new ProtoAdapter<Long>(FieldEncoding.VARINT, n1b.a.b(Long.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonInt64.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader reader) {
                reader.getClass();
                return Long.valueOf(reader.readVarint64());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Long l) {
                encode(protoWriter, l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Long l) {
                return ProtoWriter.INSTANCE.varint64Size$wire_runtime(l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Long redact(Long l) {
                l.longValue();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Long l) throws EOFException {
                encode(reverseProtoWriter, l.longValue());
            }

            public final void encode(ProtoWriter writer, long value) {
                writer.getClass();
                writer.writeVarint64(value);
            }

            public final Long redact(long value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, long value) throws EOFException {
                writer.getClass();
                writer.writeVarint64(value);
            }

            public final int encodedSize(long value) {
                return ProtoWriter.INSTANCE.varint64Size$wire_runtime(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader32 reader) {
                reader.getClass();
                return Long.valueOf(reader.readVarint64());
            }
        };
    }

    public static final <K, V> ProtoAdapter<Map<K, V>> commonNewMapAdapter(ProtoAdapter<K> protoAdapter, ProtoAdapter<V> protoAdapter2) {
        protoAdapter.getClass();
        protoAdapter2.getClass();
        return new MapProtoAdapter(protoAdapter, protoAdapter2);
    }

    public static final ProtoAdapter<Integer> commonSfixed32() {
        return commonFixed32();
    }

    public static final ProtoAdapter<Long> commonSfixed64() {
        return commonFixed64();
    }

    public static final ProtoAdapter<Integer> commonSint32() {
        return new ProtoAdapter<Integer>(FieldEncoding.VARINT, n1b.a.b(Integer.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonSint32.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader reader) {
                reader.getClass();
                return Integer.valueOf(ProtoWriter.INSTANCE.decodeZigZag32$wire_runtime(reader.readVarint32()));
            }

            public final void encode(ProtoWriter writer, int value) {
                writer.getClass();
                writer.writeVarint32(ProtoWriter.INSTANCE.encodeZigZag32$wire_runtime(value));
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Integer num) {
                return encodedSize(num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Integer redact(Integer num) {
                num.intValue();
                throw new UnsupportedOperationException();
            }

            public final int encodedSize(int value) {
                ProtoWriter.Companion companion = ProtoWriter.INSTANCE;
                return companion.varint32Size$wire_runtime(companion.encodeZigZag32$wire_runtime(value));
            }

            public final Integer redact(int value) {
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Integer num) {
                encode(reverseProtoWriter, num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Integer num) {
                encode(protoWriter, num.intValue());
            }

            public final void encode(ReverseProtoWriter writer, int value) {
                writer.getClass();
                writer.writeVarint32(ProtoWriter.INSTANCE.encodeZigZag32$wire_runtime(value));
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader32 reader) {
                reader.getClass();
                return Integer.valueOf(ProtoWriter.INSTANCE.decodeZigZag32$wire_runtime(reader.readVarint32()));
            }
        };
    }

    public static final ProtoAdapter<Long> commonSint64() {
        return new ProtoAdapter<Long>(FieldEncoding.VARINT, n1b.a.b(Long.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonSint64.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader reader) {
                reader.getClass();
                return Long.valueOf(ProtoWriter.INSTANCE.decodeZigZag64$wire_runtime(reader.readVarint64()));
            }

            public final void encode(ProtoWriter writer, long value) {
                writer.getClass();
                writer.writeVarint64(ProtoWriter.INSTANCE.encodeZigZag64$wire_runtime(value));
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ int encodedSize(Long l) {
                return encodedSize(l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Long redact(Long l) {
                l.longValue();
                throw new UnsupportedOperationException();
            }

            public final int encodedSize(long value) {
                ProtoWriter.Companion companion = ProtoWriter.INSTANCE;
                return companion.varint64Size$wire_runtime(companion.encodeZigZag64$wire_runtime(value));
            }

            public final Long redact(long value) {
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Long l) throws EOFException {
                encode(reverseProtoWriter, l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Long l) {
                encode(protoWriter, l.longValue());
            }

            public final void encode(ReverseProtoWriter writer, long value) throws EOFException {
                writer.getClass();
                writer.writeVarint64(ProtoWriter.INSTANCE.encodeZigZag64$wire_runtime(value));
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader32 reader) {
                reader.getClass();
                return Long.valueOf(ProtoWriter.INSTANCE.decodeZigZag64$wire_runtime(reader.readVarint64()));
            }
        };
    }

    public static final ProtoAdapter<String> commonString() {
        return new ProtoAdapter<String>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(String.class), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonString.1
            @Override // com.squareup.wire.ProtoAdapter
            public final String decode(ProtoReader reader) {
                reader.getClass();
                return reader.readString();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, String value) {
                writer.getClass();
                value.getClass();
                writer.writeString(value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(String value) {
                value.getClass();
                return (int) jq7.v(value);
            }

            /* JADX INFO: renamed from: redact, reason: avoid collision after fix types in other method */
            public final String redact2(String value) {
                value.getClass();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ String redact(String str) {
                redact2(str);
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final String decode(ProtoReader32 reader) {
                reader.getClass();
                return reader.readString();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, String value) throws EOFException {
                writer.getClass();
                value.getClass();
                writer.writeString(value);
            }
        };
    }

    public static final ProtoAdapter<List<?>> commonStructList() {
        return new ProtoAdapter<List<?>>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Map.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonStructList.1
            @Override // com.squareup.wire.ProtoAdapter
            public final List<?> decode(ProtoReader32 reader) {
                reader.getClass();
                ArrayList arrayList = new ArrayList();
                int iBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return arrayList;
                    }
                    if (iNextTag != 1) {
                        reader.skip();
                    } else {
                        arrayList.add(ProtoAdapter.STRUCT_VALUE.decode(reader));
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, List<?> value) {
                writer.getClass();
                if (value == null) {
                    return;
                }
                Iterator<?> it2 = value.iterator();
                while (it2.hasNext()) {
                    ProtoAdapter.STRUCT_VALUE.encodeWithTag(writer, 1, it2.next());
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(List<?> value) {
                int iEncodedSizeWithTag = 0;
                if (value == null) {
                    return 0;
                }
                Iterator<?> it2 = value.iterator();
                while (it2.hasNext()) {
                    iEncodedSizeWithTag += ProtoAdapter.STRUCT_VALUE.encodedSizeWithTag(1, it2.next());
                }
                return iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final List<Object> redact(List<?> value) {
                if (value == null) {
                    return null;
                }
                ArrayList arrayList = new ArrayList(cu1.k0(value, 10));
                Iterator<T> it2 = value.iterator();
                while (it2.hasNext()) {
                    arrayList.add(ProtoAdapter.STRUCT_VALUE.redact(it2.next()));
                }
                return arrayList;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, List<?> value) {
                writer.getClass();
                if (value == null) {
                    return;
                }
                for (int size = value.size() - 1; -1 < size; size--) {
                    ProtoAdapter.STRUCT_VALUE.encodeWithTag(writer, 1, value.get(size));
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final List<?> decode(ProtoReader reader) throws IOException {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return arrayListF;
                    }
                    if (iNextTag != 1) {
                        reader.skip();
                    } else {
                        arrayListF.add(ProtoAdapter.STRUCT_VALUE.decode(reader));
                    }
                }
            }
        };
    }

    public static final ProtoAdapter<Map<String, ?>> commonStructMap() {
        return new ProtoAdapter<Map<String, ?>>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Map.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonStructMap.1
            @Override // com.squareup.wire.ProtoAdapter
            public final Map<String, ?> decode(ProtoReader reader) throws IOException {
                reader.getClass();
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return linkedHashMap;
                    }
                    if (iNextTag != 1) {
                        reader.skip();
                    } else {
                        long jBeginMessage2 = reader.beginMessage();
                        String strDecode = null;
                        Object objDecode = null;
                        while (true) {
                            int iNextTag2 = reader.nextTag();
                            if (iNextTag2 == -1) {
                                break;
                            }
                            if (iNextTag2 == 1) {
                                strDecode = ProtoAdapter.STRING.decode(reader);
                            } else if (iNextTag2 != 2) {
                                reader.readUnknownField(iNextTag2);
                            } else {
                                objDecode = ProtoAdapter.STRUCT_VALUE.decode(reader);
                            }
                        }
                        reader.endMessageAndGetUnknownFields(jBeginMessage2);
                        if (strDecode != null) {
                            linkedHashMap.put(strDecode, objDecode);
                        }
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Map<String, ?> value) {
                writer.getClass();
                if (value == null) {
                    return;
                }
                Set<Map.Entry<String, ?>> setEntrySet = value.entrySet();
                Map.Entry[] entryArr = (Map.Entry[]) setEntrySet.toArray(new Map.Entry[0]);
                k80.I0(entryArr);
                for (Map.Entry entry : entryArr) {
                    String str = (String) entry.getKey();
                    Object value2 = entry.getValue();
                    int byteCount = writer.getByteCount();
                    ProtoAdapter.STRUCT_VALUE.encodeWithTag(writer, 2, value2);
                    ProtoAdapter.STRING.encodeWithTag(writer, 1, str);
                    writer.writeVarint32(writer.getByteCount() - byteCount);
                    writer.writeTag(1, FieldEncoding.LENGTH_DELIMITED);
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Map<String, ?> value) {
                int iVarint32Size$wire_runtime = 0;
                if (value == null) {
                    return 0;
                }
                for (Map.Entry<String, ?> entry : value.entrySet()) {
                    String key = entry.getKey();
                    Object value2 = entry.getValue();
                    int iEncodedSizeWithTag = ProtoAdapter.STRUCT_VALUE.encodedSizeWithTag(2, value2) + ProtoAdapter.STRING.encodedSizeWithTag(1, key);
                    ProtoWriter.Companion companion = ProtoWriter.INSTANCE;
                    iVarint32Size$wire_runtime += companion.varint32Size$wire_runtime(iEncodedSizeWithTag) + companion.tagSize$wire_runtime(1) + iEncodedSizeWithTag;
                }
                return iVarint32Size$wire_runtime;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Map<String, Object> redact(Map<String, ?> value) {
                if (value == null) {
                    return null;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(ei7.P(value.size()));
                Iterator<T> it2 = value.entrySet().iterator();
                while (it2.hasNext()) {
                    Map.Entry entry = (Map.Entry) it2.next();
                    linkedHashMap.put(entry.getKey(), ProtoAdapter.STRUCT_VALUE.redact(entry));
                }
                return linkedHashMap;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Map<String, ?> value) {
                writer.getClass();
                if (value == null) {
                    return;
                }
                for (Map.Entry<String, ?> entry : value.entrySet()) {
                    String key = entry.getKey();
                    Object value2 = entry.getValue();
                    ProtoAdapter<String> protoAdapter = ProtoAdapter.STRING;
                    int iEncodedSizeWithTag = protoAdapter.encodedSizeWithTag(1, key);
                    ProtoAdapter<Object> protoAdapter2 = ProtoAdapter.STRUCT_VALUE;
                    int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(2, value2) + iEncodedSizeWithTag;
                    writer.writeTag(1, FieldEncoding.LENGTH_DELIMITED);
                    writer.writeVarint32(iEncodedSizeWithTag2);
                    protoAdapter.encodeWithTag(writer, 1, key);
                    protoAdapter2.encodeWithTag(writer, 2, value2);
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Map<String, ?> decode(ProtoReader32 reader) {
                reader.getClass();
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                int iBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return linkedHashMap;
                    }
                    if (iNextTag != 1) {
                        reader.skip();
                    } else {
                        int iBeginMessage2 = reader.beginMessage();
                        String strDecode = null;
                        Object objDecode = null;
                        while (true) {
                            int iNextTag2 = reader.nextTag();
                            if (iNextTag2 == -1) {
                                break;
                            }
                            if (iNextTag2 == 1) {
                                strDecode = ProtoAdapter.STRING.decode(reader);
                            } else if (iNextTag2 != 2) {
                                reader.readUnknownField(iNextTag2);
                            } else {
                                objDecode = ProtoAdapter.STRUCT_VALUE.decode(reader);
                            }
                        }
                        reader.endMessageAndGetUnknownFields(iBeginMessage2);
                        if (strDecode != null) {
                            linkedHashMap.put(strDecode, objDecode);
                        }
                    }
                }
            }
        };
    }

    public static final ProtoAdapter commonStructNull() {
        return new ProtoAdapter(FieldEncoding.VARINT, n1b.a.b(Void.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonStructNull.1
            @Override // com.squareup.wire.ProtoAdapter
            public final Void decode(ProtoReader reader) throws IOException {
                reader.getClass();
                int varint32 = reader.readVarint32();
                if (varint32 == 0) {
                    return null;
                }
                ik4.g(b09.w(varint32, "expected 0 but was "));
                return null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Void value) {
                writer.getClass();
                writer.writeVarint32(0);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encodeWithTag(ReverseProtoWriter writer, int tag, Void value) {
                writer.getClass();
                writer.writeVarint32(0);
                writer.writeTag(tag, getFieldEncoding());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Void value) {
                return ProtoWriter.INSTANCE.varint32Size$wire_runtime(0);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSizeWithTag(int tag, Void value) {
                int iEncodedSize = encodedSize(value);
                ProtoWriter.Companion companion = ProtoWriter.INSTANCE;
                return companion.varint32Size$wire_runtime(iEncodedSize) + companion.tagSize$wire_runtime(tag);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object redact(Object obj) {
                return null;
            }

            public final Void redact(Void value) {
                return null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Void value) {
                writer.getClass();
                writer.writeVarint32(0);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encodeWithTag(ProtoWriter writer, int tag, Void value) {
                writer.getClass();
                writer.writeTag(tag, getFieldEncoding());
                writer.writeVarint32(0);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object decode(ProtoReader protoReader) throws IOException {
                decode(protoReader);
                return null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ Object decode(ProtoReader32 protoReader32) throws IOException {
                decode(protoReader32);
                return null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Void decode(ProtoReader32 reader) throws IOException {
                reader.getClass();
                int varint32 = reader.readVarint32();
                if (varint32 == 0) {
                    return null;
                }
                ik4.g(b09.w(varint32, "expected 0 but was "));
                return null;
            }
        };
    }

    public static final ProtoAdapter<Object> commonStructValue() {
        return new ProtoAdapter<Object>(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Object.class), Syntax.PROTO_3) { // from class: com.squareup.wire.ProtoAdapterKt.commonStructValue.1
            @Override // com.squareup.wire.ProtoAdapter
            public final Object decode(ProtoReader reader) throws IOException {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Object objDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return objDecode;
                    }
                    switch (iNextTag) {
                        case 1:
                            objDecode = ProtoAdapter.STRUCT_NULL.decode(reader);
                            break;
                        case 2:
                            objDecode = ProtoAdapter.DOUBLE.decode(reader);
                            break;
                        case 3:
                            objDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            objDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 5:
                            objDecode = ProtoAdapter.STRUCT_MAP.decode(reader);
                            break;
                        case 6:
                            objDecode = ProtoAdapter.STRUCT_LIST.decode(reader);
                            break;
                        default:
                            reader.skip();
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Object value) {
                writer.getClass();
                if (value == null) {
                    ProtoAdapter.STRUCT_NULL.encodeWithTag(writer, 1, value);
                    return;
                }
                if (value instanceof Number) {
                    ProtoAdapter.DOUBLE.encodeWithTag(writer, 2, Double.valueOf(((Number) value).doubleValue()));
                    return;
                }
                if (value instanceof String) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value);
                    return;
                }
                if (value instanceof Boolean) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 4, value);
                    return;
                }
                if (value instanceof Map) {
                    ProtoAdapter.STRUCT_MAP.encodeWithTag(writer, 5, (Map<String, ?>) value);
                } else if (value instanceof List) {
                    ProtoAdapter.STRUCT_LIST.encodeWithTag(writer, 6, value);
                } else {
                    ay0.e(ka1.q("unexpected struct value: ", value));
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encodeWithTag(ReverseProtoWriter writer, int tag, Object value) {
                writer.getClass();
                if (value != null) {
                    super.encodeWithTag(writer, tag, value);
                    return;
                }
                int byteCount = writer.getByteCount();
                encode(writer, value);
                writer.writeVarint32(writer.getByteCount() - byteCount);
                writer.writeTag(tag, getFieldEncoding());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Object value) {
                if (value == null) {
                    return ProtoAdapter.STRUCT_NULL.encodedSizeWithTag(1, value);
                }
                if (value instanceof Number) {
                    return ProtoAdapter.DOUBLE.encodedSizeWithTag(2, Double.valueOf(((Number) value).doubleValue()));
                }
                if (value instanceof String) {
                    return ProtoAdapter.STRING.encodedSizeWithTag(3, value);
                }
                if (value instanceof Boolean) {
                    return ProtoAdapter.BOOL.encodedSizeWithTag(4, value);
                }
                if (value instanceof Map) {
                    return ProtoAdapter.STRUCT_MAP.encodedSizeWithTag(5, (Map) value);
                }
                if (value instanceof List) {
                    return ProtoAdapter.STRUCT_LIST.encodedSizeWithTag(6, value);
                }
                ay0.e(ka1.q("unexpected struct value: ", value));
                return 0;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSizeWithTag(int tag, Object value) {
                if (value != null) {
                    return super.encodedSizeWithTag(tag, value);
                }
                int iEncodedSize = encodedSize(value);
                ProtoWriter.Companion companion = ProtoWriter.INSTANCE;
                return companion.varint32Size$wire_runtime(iEncodedSize) + companion.tagSize$wire_runtime(tag) + iEncodedSize;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Object redact(Object value) {
                if (value == null) {
                    return ProtoAdapter.STRUCT_NULL.redact(value);
                }
                if (value instanceof Number) {
                    return value;
                }
                if (value instanceof String) {
                    return null;
                }
                if (value instanceof Boolean) {
                    return value;
                }
                if (value instanceof Map) {
                    return ProtoAdapter.STRUCT_MAP.redact((Map) value);
                }
                if (value instanceof List) {
                    return ProtoAdapter.STRUCT_LIST.redact(value);
                }
                ay0.e(ka1.q("unexpected struct value: ", value));
                return null;
            }

            {
                String str = DtuT.ZLiFxlELN;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encodeWithTag(ProtoWriter writer, int tag, Object value) {
                writer.getClass();
                if (value == null) {
                    writer.writeTag(tag, getFieldEncoding());
                    writer.writeVarint32(encodedSize(value));
                    encode(writer, value);
                    return;
                }
                super.encodeWithTag(writer, tag, value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Object decode(ProtoReader32 reader) {
                reader.getClass();
                int iBeginMessage = reader.beginMessage();
                Object objDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag != -1) {
                        switch (iNextTag) {
                            case 1:
                                objDecode = ProtoAdapter.STRUCT_NULL.decode(reader);
                                break;
                            case 2:
                                objDecode = ProtoAdapter.DOUBLE.decode(reader);
                                break;
                            case 3:
                                objDecode = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 4:
                                objDecode = ProtoAdapter.BOOL.decode(reader);
                                break;
                            case 5:
                                objDecode = ProtoAdapter.STRUCT_MAP.decode(reader);
                                break;
                            case 6:
                                objDecode = ProtoAdapter.STRUCT_LIST.decode(reader);
                                break;
                            default:
                                reader.skip();
                                break;
                        }
                    } else {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return objDecode;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Object value) {
                writer.getClass();
                if (value == null) {
                    ProtoAdapter.STRUCT_NULL.encodeWithTag(writer, 1, value);
                    return;
                }
                if (value instanceof Number) {
                    ProtoAdapter.DOUBLE.encodeWithTag(writer, 2, Double.valueOf(((Number) value).doubleValue()));
                    return;
                }
                if (value instanceof String) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value);
                    return;
                }
                if (value instanceof Boolean) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 4, value);
                    return;
                }
                if (value instanceof Map) {
                    ProtoAdapter.STRUCT_MAP.encodeWithTag(writer, 5, (Map<String, ?>) value);
                } else if (value instanceof List) {
                    ProtoAdapter.STRUCT_LIST.encodeWithTag(writer, 6, value);
                } else {
                    ay0.e(ka1.q("unexpected struct value: ", value));
                }
            }
        };
    }

    public static final <E> String commonToString(E e) {
        return String.valueOf(e);
    }

    public static final <E> void commonTryDecode(ProtoAdapter<E> protoAdapter, ProtoReader protoReader, List<E> list) {
        protoAdapter.getClass();
        protoReader.getClass();
        list.getClass();
        if (protoReader.beforePossiblyPackedScalar$wire_runtime()) {
            list.add(protoAdapter.decode(protoReader));
        }
    }

    public static final ProtoAdapter<Integer> commonUint32() {
        return new ProtoAdapter<Integer>(FieldEncoding.VARINT, n1b.a.b(Integer.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonUint32.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader reader) {
                reader.getClass();
                return Integer.valueOf(reader.readVarint32());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Integer num) {
                encode(protoWriter, num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Integer num) {
                return ProtoWriter.INSTANCE.varint32Size$wire_runtime(num.intValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Integer redact(Integer num) {
                num.intValue();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Integer num) {
                encode(reverseProtoWriter, num.intValue());
            }

            public final void encode(ProtoWriter writer, int value) {
                writer.getClass();
                writer.writeVarint32(value);
            }

            public final Integer redact(int value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, int value) {
                writer.getClass();
                writer.writeVarint32(value);
            }

            public final int encodedSize(int value) {
                return ProtoWriter.INSTANCE.varint32Size$wire_runtime(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Integer decode(ProtoReader32 reader) {
                reader.getClass();
                return Integer.valueOf(reader.readVarint32());
            }
        };
    }

    public static final ProtoAdapter<Long> commonUint64() {
        return new ProtoAdapter<Long>(FieldEncoding.VARINT, n1b.a.b(Long.TYPE), Syntax.PROTO_2) { // from class: com.squareup.wire.ProtoAdapterKt.commonUint64.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader reader) {
                reader.getClass();
                return Long.valueOf(reader.readVarint64());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Long l) {
                encode(protoWriter, l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Long l) {
                return ProtoWriter.INSTANCE.varint64Size$wire_runtime(l.longValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Long redact(Long l) {
                l.longValue();
                throw new UnsupportedOperationException();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Long l) throws EOFException {
                encode(reverseProtoWriter, l.longValue());
            }

            public final void encode(ProtoWriter writer, long value) {
                writer.getClass();
                writer.writeVarint64(value);
            }

            public final Long redact(long value) {
                throw new UnsupportedOperationException();
            }

            public final void encode(ReverseProtoWriter writer, long value) throws EOFException {
                writer.getClass();
                writer.writeVarint64(value);
            }

            public final int encodedSize(long value) {
                return ProtoWriter.INSTANCE.varint64Size$wire_runtime(value);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Long decode(ProtoReader32 reader) {
                reader.getClass();
                return Long.valueOf(reader.readVarint64());
            }
        };
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final <E> ProtoAdapter<?> commonWithLabel(ProtoAdapter<E> protoAdapter, WireField.Label label) {
        protoAdapter.getClass();
        label.getClass();
        return label.isRepeated() ? label.isPacked() ? protoAdapter.asPacked() : protoAdapter.asRepeated() : protoAdapter;
    }

    public static final <T> ProtoAdapter<T> commonWrapper(final ProtoAdapter<T> protoAdapter, String str) {
        protoAdapter.getClass();
        str.getClass();
        return new ProtoAdapter<T>(str, FieldEncoding.LENGTH_DELIMITED, protoAdapter.getType(), Syntax.PROTO_3, protoAdapter.getIdentity()) { // from class: com.squareup.wire.ProtoAdapterKt.commonWrapper.1
            @Override // com.squareup.wire.ProtoAdapter
            public final T decode(ProtoReader reader) {
                reader.getClass();
                T identity = protoAdapter.getIdentity();
                ProtoAdapter<T> protoAdapter2 = protoAdapter;
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return identity;
                    }
                    if (iNextTag == 1) {
                        identity = protoAdapter2.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, T value) {
                writer.getClass();
                if (value == null || value.equals(protoAdapter.getIdentity())) {
                    return;
                }
                protoAdapter.encodeWithTag(writer, 1, value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(T value) {
                if (value == null || value.equals(protoAdapter.getIdentity())) {
                    return 0;
                }
                return protoAdapter.encodedSizeWithTag(1, value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final T redact(T value) {
                if (value == null) {
                    return null;
                }
                return protoAdapter.redact(value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, T value) {
                writer.getClass();
                if (value == null || value.equals(protoAdapter.getIdentity())) {
                    return;
                }
                protoAdapter.encodeWithTag(writer, 1, value);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final T decode(ProtoReader32 reader) {
                reader.getClass();
                T identity = protoAdapter.getIdentity();
                ProtoAdapter<T> protoAdapter2 = protoAdapter;
                int iBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return identity;
                    }
                    if (iNextTag == 1) {
                        identity = protoAdapter2.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }
        };
    }

    public static final <E> void delegateEncode(ProtoAdapter<E> protoAdapter, ReverseProtoWriter reverseProtoWriter, E e) {
        protoAdapter.getClass();
        reverseProtoWriter.getClass();
        reverseProtoWriter.writeForward$wire_runtime(new C00481(protoAdapter, e));
    }

    /* JADX INFO: renamed from: com.squareup.wire.ProtoAdapterKt$delegateEncode$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 0, 0}, xi = 176)
    public static final class C00481 implements x45 {
        final /* synthetic */ ProtoAdapter<E> $this_delegateEncode;
        final /* synthetic */ E $value;

        public C00481(ProtoAdapter<E> protoAdapter, E e) {
            this.$this_delegateEncode = protoAdapter;
            this.$value = e;
        }

        /* JADX WARN: Type inference fix 'apply assigned field type' failed
        java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
        	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
        	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
        	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
         */
        public final void invoke(ProtoWriter protoWriter) {
            protoWriter.getClass();
            this.$this_delegateEncode.encode(protoWriter, this.$value);
        }

        @Override // defpackage.x45
        public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((ProtoWriter) obj);
            return c1e.a;
        }
    }

    public static final <E> E commonDecode(ProtoAdapter<E> protoAdapter, h21 h21Var) {
        protoAdapter.getClass();
        h21Var.getClass();
        return protoAdapter.decode(ProtoReader32Kt.ProtoReader32$default(h21Var, 0, 0, 6, (Object) null));
    }

    public static final <E> byte[] commonEncode(ProtoAdapter<E> protoAdapter, E e) {
        protoAdapter.getClass();
        kz0 kz0Var = new kz0();
        protoAdapter.encode(kz0Var, e);
        return kz0Var.U(kz0Var.b);
    }

    public static final <E> E commonDecode(ProtoAdapter<E> protoAdapter, zz0 zz0Var) {
        protoAdapter.getClass();
        zz0Var.getClass();
        return protoAdapter.decode(new ProtoReader(zz0Var));
    }

    public static final <E> void commonTryDecode(ProtoAdapter<E> protoAdapter, ProtoReader32 protoReader32, List<E> list) {
        protoAdapter.getClass();
        protoReader32.getClass();
        list.getClass();
        if (protoReader32.beforePossiblyPackedScalar()) {
            list.add(protoAdapter.decode(protoReader32));
        }
    }

    public static final <E> void commonEncodeWithTag(ProtoAdapter<E> protoAdapter, ProtoWriter protoWriter, int i, E e) {
        protoAdapter.getClass();
        protoWriter.getClass();
        if (e == null) {
            return;
        }
        protoWriter.writeTag(i, protoAdapter.getFieldEncoding());
        if (protoAdapter.getFieldEncoding() == FieldEncoding.LENGTH_DELIMITED) {
            protoWriter.writeVarint32(protoAdapter.encodedSize(e));
        }
        protoAdapter.encode(protoWriter, e);
    }
}
