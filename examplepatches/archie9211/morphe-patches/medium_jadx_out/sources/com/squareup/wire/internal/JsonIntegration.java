package com.squareup.wire.internal;

import com.squareup.wire.EnumAdapter;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import defpackage.dq1;
import defpackage.g76;
import defpackage.h21;
import defpackage.lg8;
import defpackage.vx0;
import defpackage.wg6;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\b&\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u00020\u0003:\b()*+,-./B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u001d\u0010\u0006\u001a\u00028\u00012\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010\b\u001a\u00020\tH&¢\u0006\u0002\u0010\nJ\u0015\u0010\u000b\u001a\u00028\u00012\u0006\u0010\f\u001a\u00028\u0001H&¢\u0006\u0002\u0010\rJ)\u0010\u000e\u001a\u00028\u00012\u0006\u0010\u0007\u001a\u00028\u00002\n\u0010\u000f\u001a\u0006\u0012\u0002\b\u00030\u00102\u0006\u0010\u0011\u001a\u00028\u0001H&¢\u0006\u0002\u0010\u0012J\u0015\u0010\u0013\u001a\u00028\u00012\u0006\u0010\u0007\u001a\u00028\u0000H&¢\u0006\u0002\u0010\rJ\u0019\u0010\u0014\u001a\u00028\u00012\n\u0010\u0015\u001a\u0006\u0012\u0002\b\u00030\u0010H&¢\u0006\u0002\u0010\u0016JA\u0010\u0017\u001a\b\u0012\u0004\u0012\u00028\u00010\u0018\"\b\b\u0002\u0010\u0019*\u00020\u0003\"\b\b\u0003\u0010\u001a*\u00020\u00032\u0012\u0010\u001b\u001a\u000e\u0012\u0004\u0012\u0002H\u0019\u0012\u0004\u0012\u0002H\u001a0\u001c2\u0006\u0010\u0007\u001a\u00028\u0000¢\u0006\u0002\u0010\u001dJE\u0010\u001e\u001a\u00028\u0001\"\b\b\u0002\u0010\u0019*\u00020\u0003\"\b\b\u0003\u0010\u001a*\u00020\u00032\u0006\u0010\u0007\u001a\u00028\u00002\u0006\u0010\u001f\u001a\u00020 2\u0012\u0010!\u001a\u000e\u0012\u0004\u0012\u0002H\u0019\u0012\u0004\u0012\u0002H\u001a0\"H\u0002¢\u0006\u0002\u0010#J\"\u0010$\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u00102\u0006\u0010\u001f\u001a\u00020 2\n\u0010%\u001a\u0006\u0012\u0002\b\u00030&H\u0002J\u0018\u0010'\u001a\u0006\u0012\u0002\b\u00030\u00102\n\u0010%\u001a\u0006\u0012\u0002\b\u00030&H\u0002¨\u00060"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration;", "F", "A", "", "<init>", "()V", "frameworkAdapter", "framework", "type", "Ljava/lang/reflect/Type;", "(Ljava/lang/Object;Ljava/lang/reflect/Type;)Ljava/lang/Object;", "listAdapter", "elementAdapter", "(Ljava/lang/Object;)Ljava/lang/Object;", "mapAdapter", "keyFormatter", "Lcom/squareup/wire/internal/JsonFormatter;", "valueAdapter", "(Ljava/lang/Object;Lcom/squareup/wire/internal/JsonFormatter;Ljava/lang/Object;)Ljava/lang/Object;", "structAdapter", "formatterAdapter", "jsonStringAdapter", "(Lcom/squareup/wire/internal/JsonFormatter;)Ljava/lang/Object;", "jsonAdapters", "", "M", "B", "adapter", "Lcom/squareup/wire/internal/RuntimeMessageAdapter;", "(Lcom/squareup/wire/internal/RuntimeMessageAdapter;Ljava/lang/Object;)Ljava/util/List;", "jsonAdapter", "syntax", "Lcom/squareup/wire/Syntax;", "field", "Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "(Ljava/lang/Object;Lcom/squareup/wire/Syntax;Lcom/squareup/wire/internal/FieldOrOneOfBinding;)Ljava/lang/Object;", "jsonFormatter", "protoAdapter", "Lcom/squareup/wire/ProtoAdapter;", "mapKeyJsonFormatter", "UnsignedLongAsNumberJsonFormatter", "UnsignedLongAsStringJsonFormatter", "LongAsStringJsonFormatter", "UnsignedIntAsNumberJsonFormatter", "UnsignedIntAsStringJsonFormatter", "IntAsStringJsonFormatter", "ByteStringJsonFormatter", "StringJsonFormatter", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public abstract class JsonIntegration<F, A> {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u0019\u0010\t\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0005\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$ByteStringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "Lh21;", "<init>", "()V", "value", "", "toStringOrNumber", "(Lh21;)Ljava/lang/String;", "fromString", "(Ljava/lang/String;)Lh21;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class ByteStringJsonFormatter implements JsonFormatter<h21> {
        public static final ByteStringJsonFormatter INSTANCE = new ByteStringJsonFormatter();

        private ByteStringJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final h21 fromString(String value) {
            value.getClass();
            h21 h21Var = h21.d;
            return dq1.m(value);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final String toStringOrNumber(h21 value) {
            value.getClass();
            return value.a();
        }
    }

    private final <M, B> A jsonAdapter(F framework, Syntax syntax, FieldOrOneOfBinding<M, B> field) {
        A aFrameworkAdapter;
        if (field.getSingleAdapter().isStruct$wire_runtime()) {
            return structAdapter(framework);
        }
        JsonFormatter<?> jsonFormatter = jsonFormatter(syntax, field.getSingleAdapter());
        if (jsonFormatter != null) {
            aFrameworkAdapter = formatterAdapter(jsonFormatter);
        } else {
            wg6 type = field.getSingleAdapter().getType();
            Class clsU = type != null ? vx0.U(type) : null;
            clsU.getClass();
            aFrameworkAdapter = frameworkAdapter(framework, clsU);
        }
        return field.getLabel().isRepeated() ? listAdapter(aFrameworkAdapter) : field.isMap() ? mapAdapter(framework, mapKeyJsonFormatter(field.getKeyAdapter()), aFrameworkAdapter) : aFrameworkAdapter;
    }

    private final JsonFormatter<?> jsonFormatter(Syntax syntax, ProtoAdapter<?> protoAdapter) {
        if (g76.L(protoAdapter, ProtoAdapter.BYTES) || g76.L(protoAdapter, ProtoAdapter.BYTES_VALUE)) {
            return ByteStringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.DURATION)) {
            return DurationJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.INSTANT)) {
            return InstantJsonFormatter.INSTANCE;
        }
        if (protoAdapter instanceof EnumAdapter) {
            return new EnumJsonFormatter((EnumAdapter) protoAdapter);
        }
        if (syntax == Syntax.PROTO_2) {
            if (g76.L(protoAdapter, ProtoAdapter.UINT64) || g76.L(protoAdapter, ProtoAdapter.UINT64_VALUE)) {
                return UnsignedLongAsNumberJsonFormatter.INSTANCE;
            }
            return null;
        }
        if (g76.L(protoAdapter, ProtoAdapter.UINT32) || g76.L(protoAdapter, ProtoAdapter.FIXED32) || g76.L(protoAdapter, ProtoAdapter.UINT32_VALUE)) {
            return UnsignedIntAsNumberJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.INT64) || g76.L(protoAdapter, ProtoAdapter.SFIXED64) || g76.L(protoAdapter, ProtoAdapter.SINT64) || g76.L(protoAdapter, ProtoAdapter.INT64_VALUE)) {
            return LongAsStringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.FIXED64) || g76.L(protoAdapter, ProtoAdapter.UINT64) || g76.L(protoAdapter, ProtoAdapter.UINT64_VALUE)) {
            return UnsignedLongAsStringJsonFormatter.INSTANCE;
        }
        return null;
    }

    private final JsonFormatter<?> mapKeyJsonFormatter(ProtoAdapter<?> protoAdapter) {
        if (g76.L(protoAdapter, ProtoAdapter.STRING)) {
            return StringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.INT32) || g76.L(protoAdapter, ProtoAdapter.SINT32) || g76.L(protoAdapter, ProtoAdapter.SFIXED32)) {
            return IntAsStringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.FIXED32) || g76.L(protoAdapter, ProtoAdapter.UINT32)) {
            return UnsignedIntAsStringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.INT64) || g76.L(protoAdapter, ProtoAdapter.SFIXED64) || g76.L(protoAdapter, ProtoAdapter.SINT64)) {
            return LongAsStringJsonFormatter.INSTANCE;
        }
        if (g76.L(protoAdapter, ProtoAdapter.FIXED64) || g76.L(protoAdapter, ProtoAdapter.UINT64)) {
            return UnsignedLongAsStringJsonFormatter.INSTANCE;
        }
        lg8.w("Unexpected map key type: ", protoAdapter.getType());
        return null;
    }

    public abstract A formatterAdapter(JsonFormatter<?> jsonStringAdapter);

    public abstract A frameworkAdapter(F framework, Type type);

    public final <M, B> List<A> jsonAdapters(RuntimeMessageAdapter<M, B> adapter, F framework) {
        adapter.getClass();
        FieldOrOneOfBinding<M, B>[] fieldOrOneOfBindingArr = (FieldOrOneOfBinding[]) adapter.getFields().values().toArray(new FieldOrOneOfBinding[0]);
        ArrayList arrayList = new ArrayList(fieldOrOneOfBindingArr.length);
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : fieldOrOneOfBindingArr) {
            arrayList.add(jsonAdapter(framework, adapter.getSyntax(), fieldOrOneOfBinding));
        }
        return arrayList;
    }

    public abstract A listAdapter(A elementAdapter);

    public abstract A mapAdapter(F framework, JsonFormatter<?> keyFormatter, A valueAdapter);

    public abstract A structAdapter(F framework);

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0010\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¨\u0006\b"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$StringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "toStringOrNumber", "value", "fromString", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class StringJsonFormatter implements JsonFormatter<String> {
        public static final StringJsonFormatter INSTANCE = new StringJsonFormatter();

        private StringJsonFormatter() {
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final String fromString(String str) {
            str.getClass();
            return str;
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final Object toStringOrNumber(String str) {
            String str2 = str;
            str2.getClass();
            return str2;
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        /* JADX INFO: renamed from: fromString, reason: avoid collision after fix types in other method */
        public final String fromString2(String value) {
            value.getClass();
            return value;
        }

        /* JADX INFO: renamed from: toStringOrNumber, reason: avoid collision after fix types in other method */
        public final String toStringOrNumber2(String value) {
            value.getClass();
            return value;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0003\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0007H\u0016¢\u0006\u0002\u0010\bJ\u0010\u0010\t\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0002H\u0016¨\u0006\n"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$IntAsStringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "fromString", "value", "", "(Ljava/lang/String;)Ljava/lang/Integer;", "toStringOrNumber", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class IntAsStringJsonFormatter implements JsonFormatter<Integer> {
        public static final IntAsStringJsonFormatter INSTANCE = new IntAsStringJsonFormatter();

        private IntAsStringJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Integer fromString(String value) {
            value.getClass();
            return Integer.valueOf(Integer.parseInt(value));
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final Object toStringOrNumber(Integer num) {
            return String.valueOf(num.intValue());
        }

        public final String toStringOrNumber(int value) {
            return String.valueOf(value);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0002H\u0016J\u0015\u0010\b\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0002\u0010\t¨\u0006\n"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$LongAsStringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "toStringOrNumber", "", "value", "fromString", "(Ljava/lang/String;)Ljava/lang/Long;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class LongAsStringJsonFormatter implements JsonFormatter<Long> {
        public static final LongAsStringJsonFormatter INSTANCE = new LongAsStringJsonFormatter();

        private LongAsStringJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Long fromString(String value) {
            long jLongValueExact;
            value.getClass();
            try {
                jLongValueExact = Long.parseLong(value);
            } catch (Exception unused) {
                jLongValueExact = new BigDecimal(value).longValueExact();
            }
            return Long.valueOf(jLongValueExact);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final Object toStringOrNumber(Long l) {
            return String.valueOf(l.longValue());
        }

        public final String toStringOrNumber(long value) {
            return String.valueOf(value);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0002H\u0016J\u0015\u0010\b\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0002\u0010\t¨\u0006\n"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$UnsignedLongAsStringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "toStringOrNumber", "", "value", "fromString", "(Ljava/lang/String;)Ljava/lang/Long;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class UnsignedLongAsStringJsonFormatter implements JsonFormatter<Long> {
        public static final UnsignedLongAsStringJsonFormatter INSTANCE = new UnsignedLongAsStringJsonFormatter();

        private UnsignedLongAsStringJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Long fromString(String value) {
            value.getClass();
            return UnsignedLongAsNumberJsonFormatter.INSTANCE.fromString(value);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final /* bridge */ /* synthetic */ Object toStringOrNumber(Long l) {
            return toStringOrNumber(l.longValue());
        }

        public final String toStringOrNumber(long value) {
            return UnsignedLongAsNumberJsonFormatter.INSTANCE.toStringOrNumber(value).toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\b\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\nH\u0016¢\u0006\u0002\u0010\u000bJ\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u0002H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$UnsignedIntAsNumberJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "power32", "", "maxInt", "fromString", "value", "", "(Ljava/lang/String;)Ljava/lang/Integer;", "toStringOrNumber", "", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class UnsignedIntAsNumberJsonFormatter implements JsonFormatter<Integer> {
        public static final UnsignedIntAsNumberJsonFormatter INSTANCE = new UnsignedIntAsNumberJsonFormatter();
        private static final long maxInt = 2147483647L;
        private static final long power32 = 4294967296L;

        private UnsignedIntAsNumberJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Integer fromString(String value) {
            value.getClass();
            long j = (long) Double.parseDouble(value);
            if (j >= maxInt) {
                j -= power32;
            }
            return Integer.valueOf((int) j);
        }

        public final Object toStringOrNumber(int value) {
            return value < 0 ? Long.valueOf(((long) value) + power32) : Integer.valueOf(value);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final /* bridge */ /* synthetic */ Object toStringOrNumber(Integer num) {
            return toStringOrNumber(num.intValue());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0007\u001a\u00020\u00022\u0006\u0010\b\u001a\u00020\tH\u0016¢\u0006\u0002\u0010\nJ\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\b\u001a\u00020\u0002H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$UnsignedIntAsStringJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "power32", "", "fromString", "value", "", "(Ljava/lang/String;)Ljava/lang/Integer;", "toStringOrNumber", "", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class UnsignedIntAsStringJsonFormatter implements JsonFormatter<Integer> {
        public static final UnsignedIntAsStringJsonFormatter INSTANCE = new UnsignedIntAsStringJsonFormatter();
        private static final long power32 = 4294967296L;

        private UnsignedIntAsStringJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Integer fromString(String value) {
            value.getClass();
            return Integer.valueOf((int) Long.parseLong(value));
        }

        public final Object toStringOrNumber(int value) {
            return value < 0 ? String.valueOf(((long) value) + power32) : String.valueOf(value);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final /* bridge */ /* synthetic */ Object toStringOrNumber(Integer num) {
            return toStringOrNumber(num.intValue());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\n\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\fH\u0016¢\u0006\u0002\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\u0002H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u0007\u001a\n \b*\u0004\u0018\u00010\u00060\u0006X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\t¨\u0006\u0010"}, d2 = {"Lcom/squareup/wire/internal/JsonIntegration$UnsignedLongAsNumberJsonFormatter;", "Lcom/squareup/wire/internal/JsonFormatter;", "", "<init>", "()V", "power64", "Ljava/math/BigInteger;", "maxLong", "kotlin.jvm.PlatformType", "Ljava/math/BigInteger;", "fromString", "value", "", "(Ljava/lang/String;)Ljava/lang/Long;", "toStringOrNumber", "", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class UnsignedLongAsNumberJsonFormatter implements JsonFormatter<Long> {
        public static final UnsignedLongAsNumberJsonFormatter INSTANCE = new UnsignedLongAsNumberJsonFormatter();
        private static final BigInteger power64 = new BigInteger("18446744073709551616");
        private static final BigInteger maxLong = BigInteger.valueOf(Long.MAX_VALUE);

        private UnsignedLongAsNumberJsonFormatter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.squareup.wire.internal.JsonFormatter
        public final Long fromString(String value) {
            BigInteger bigInteger;
            value.getClass();
            try {
                bigInteger = new BigInteger(value);
            } catch (Exception unused) {
                bigInteger = new BigDecimal(value).toBigInteger();
            }
            return Long.valueOf(bigInteger.compareTo(maxLong) > 0 ? bigInteger.subtract(power64).longValue() : bigInteger.longValue());
        }

        public final Object toStringOrNumber(long value) {
            return value < 0 ? power64.add(BigInteger.valueOf(value)) : Long.valueOf(value);
        }

        @Override // com.squareup.wire.internal.JsonFormatter
        public final /* bridge */ /* synthetic */ Object toStringOrNumber(Long l) {
            return toStringOrNumber(l.longValue());
        }
    }
}
