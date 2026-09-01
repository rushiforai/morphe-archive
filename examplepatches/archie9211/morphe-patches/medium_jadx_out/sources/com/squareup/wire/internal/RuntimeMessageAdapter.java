package com.squareup.wire.internal;

import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.WireField;
import defpackage.c55;
import defpackage.g76;
import defpackage.wg6;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\b\u000f\u0018\u0000 F*\b\b\u0000\u0010\u0002*\u00020\u0001*\b\b\u0001\u0010\u0003*\u00020\u00012\b\u0012\u0004\u0012\u00028\u00000\u0004:\u0001FB\u001b\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\t\u001a\u00028\u0001¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\r\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001f\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001f\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u00142\u0006\u0010\u000b\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\u0012\u0010\u0015J\u0017\u0010\u0016\u001a\u00028\u00002\u0006\u0010\u000b\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u0096\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\fH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u0017\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u000b\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010#\u001a\u00028\u00002\u0006\u0010\"\u001a\u00020!H\u0016¢\u0006\u0004\b#\u0010$JW\u0010,\u001a\u00020\u0011\"\u0004\b\u0002\u0010%2\b\u0010&\u001a\u0004\u0018\u00018\u00002\f\u0010(\u001a\b\u0012\u0004\u0012\u00028\u00020'2\b\u0010)\u001a\u0004\u0018\u00018\u00022 \u0010+\u001a\u001c\u0012\u0004\u0012\u00020\u001e\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00020\u00110*¢\u0006\u0004\b,\u0010-R \u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010.R\u001c\u00100\u001a\n\u0012\u0006\b\u0000\u0012\u00028\u00000/8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b0\u00101R/\u00104\u001a\u001a\u0012\u0004\u0012\u00020\f\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000103028\u0006¢\u0006\f\n\u0004\b4\u00105\u001a\u0004\b6\u00107R)\u00109\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000103088\u0006¢\u0006\f\n\u0004\b9\u0010:\u001a\u0004\b;\u0010<R\u001d\u0010=\u001a\b\u0012\u0004\u0012\u00020\u001e0'8\u0006¢\u0006\f\n\u0004\b=\u0010>\u001a\u0004\b?\u0010@R\u001f\u0010A\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u001e0'8\u0006¢\u0006\f\n\u0004\bA\u0010>\u001a\u0004\bB\u0010@R\u001d\u0010E\u001a\u00020\u001e*\n\u0012\u0002\b\u0003\u0012\u0002\b\u0003038F¢\u0006\u0006\u001a\u0004\bC\u0010D¨\u0006G"}, d2 = {"Lcom/squareup/wire/internal/RuntimeMessageAdapter;", "", "M", "B", "Lcom/squareup/wire/ProtoAdapter;", "Lcom/squareup/wire/internal/MessageBinding;", "binding", "<init>", "(Lcom/squareup/wire/internal/MessageBinding;)V", "newBuilder", "()Ljava/lang/Object;", "value", "", "encodedSize", "(Ljava/lang/Object;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Ljava/lang/Object;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Ljava/lang/Object;)V", "redact", "(Ljava/lang/Object;)Ljava/lang/Object;", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "(Ljava/lang/Object;)Ljava/lang/String;", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Ljava/lang/Object;", "A", "message", "", "jsonAdapters", "redactedFieldsAdapter", "Lkotlin/Function3;", "encodeValue", "writeAllFields", "(Ljava/lang/Object;Ljava/util/List;Ljava/lang/Object;Lc55;)V", "Lcom/squareup/wire/internal/MessageBinding;", "Lwg6;", "messageType", "Lwg6;", "", "Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "fields", "Ljava/util/Map;", "getFields", "()Ljava/util/Map;", "", "fieldBindingsArray", "[Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "getFieldBindingsArray", "()[Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "jsonNames", "Ljava/util/List;", "getJsonNames", "()Ljava/util/List;", "jsonAlternateNames", "getJsonAlternateNames", "getJsonName", "(Lcom/squareup/wire/internal/FieldOrOneOfBinding;)Ljava/lang/String;", "jsonName", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class RuntimeMessageAdapter<M, B> extends ProtoAdapter<M> {
    private static final String REDACTED = "██";
    private final MessageBinding<M, B> binding;
    private final FieldOrOneOfBinding<M, B>[] fieldBindingsArray;
    private final Map<Integer, FieldOrOneOfBinding<M, B>> fields;
    private final List<String> jsonAlternateNames;
    private final List<String> jsonNames;
    private final wg6 messageType;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RuntimeMessageAdapter(MessageBinding<M, B> messageBinding) {
        String name;
        super(FieldEncoding.LENGTH_DELIMITED, messageBinding.getMessageType(), messageBinding.getTypeUrl(), messageBinding.getSyntax(), null, null, 48, null);
        messageBinding.getClass();
        this.binding = messageBinding;
        this.messageType = messageBinding.getMessageType();
        Map<Integer, FieldOrOneOfBinding<M, B>> fields = messageBinding.getFields();
        this.fields = fields;
        FieldOrOneOfBinding<M, B>[] fieldOrOneOfBindingArr = (FieldOrOneOfBinding[]) fields.values().toArray(new FieldOrOneOfBinding[0]);
        this.fieldBindingsArray = fieldOrOneOfBindingArr;
        ArrayList arrayList = new ArrayList(fieldOrOneOfBindingArr.length);
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : fieldOrOneOfBindingArr) {
            arrayList.add(getJsonName(fieldOrOneOfBinding));
        }
        this.jsonNames = arrayList;
        FieldOrOneOfBinding<M, B>[] fieldOrOneOfBindingArr2 = this.fieldBindingsArray;
        ArrayList arrayList2 = new ArrayList(fieldOrOneOfBindingArr2.length);
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding2 : fieldOrOneOfBindingArr2) {
            arrayList2.add(getJsonName(fieldOrOneOfBinding2));
        }
        FieldOrOneOfBinding<M, B>[] fieldOrOneOfBindingArr3 = this.fieldBindingsArray;
        ArrayList arrayList3 = new ArrayList(fieldOrOneOfBindingArr3.length);
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding3 : fieldOrOneOfBindingArr3) {
            if (!g76.L(getJsonName(fieldOrOneOfBinding3), fieldOrOneOfBinding3.getDeclaredName())) {
                name = fieldOrOneOfBinding3.getDeclaredName();
            } else if (g76.L(getJsonName(fieldOrOneOfBinding3), fieldOrOneOfBinding3.getName())) {
                String strCamelCase$default = _PlatformKt.camelCase$default(fieldOrOneOfBinding3.getDeclaredName(), false, 2, null);
                name = (g76.L(getJsonName(fieldOrOneOfBinding3), strCamelCase$default) || arrayList2.contains(strCamelCase$default)) ? null : strCamelCase$default;
            } else {
                name = fieldOrOneOfBinding3.getName();
            }
            arrayList3.add(name);
        }
        this.jsonAlternateNames = arrayList3;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final M decode(ProtoReader reader) {
        reader.getClass();
        B bNewBuilder = this.binding.newBuilder();
        long jBeginMessage = reader.beginMessage();
        while (true) {
            int iNextTag = reader.nextTag();
            if (iNextTag == -1) {
                reader.endMessageAndGetUnknownFields(jBeginMessage);
                return this.binding.build(bNewBuilder);
            }
            FieldOrOneOfBinding<M, B> fieldOrOneOfBinding = this.fields.get(Integer.valueOf(iNextTag));
            if (fieldOrOneOfBinding != null) {
                try {
                    Object objDecode = (fieldOrOneOfBinding.isMap() ? fieldOrOneOfBinding.getAdapter() : fieldOrOneOfBinding.getSingleAdapter()).decode(reader);
                    objDecode.getClass();
                    fieldOrOneOfBinding.value(bNewBuilder, objDecode);
                } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                    this.binding.addUnknownField(bNewBuilder, iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                }
            } else {
                FieldEncoding nextFieldEncoding = reader.getNextFieldEncoding();
                nextFieldEncoding.getClass();
                this.binding.addUnknownField(bNewBuilder, iNextTag, nextFieldEncoding, nextFieldEncoding.rawProtoAdapter().decode(reader));
            }
        }
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ProtoWriter writer, M value) {
        writer.getClass();
        value.getClass();
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : this.fields.values()) {
            Object obj = fieldOrOneOfBinding.get(value);
            if (obj != null) {
                fieldOrOneOfBinding.getAdapter().encodeWithTag(writer, fieldOrOneOfBinding.getTag(), obj);
            }
        }
        writer.writeBytes(this.binding.unknownFields(value));
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSize(M value) {
        value.getClass();
        int cachedSerializedSize = this.binding.getCachedSerializedSize(value);
        if (cachedSerializedSize != 0) {
            return cachedSerializedSize;
        }
        int iEncodedSizeWithTag = 0;
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : this.fields.values()) {
            Object obj = fieldOrOneOfBinding.get(value);
            if (obj != null) {
                iEncodedSizeWithTag += fieldOrOneOfBinding.getAdapter().encodedSizeWithTag(fieldOrOneOfBinding.getTag(), obj);
            }
        }
        int iE = this.binding.unknownFields(value).e() + iEncodedSizeWithTag;
        this.binding.setCachedSerializedSize(value, iE);
        return iE;
    }

    public final boolean equals(Object other) {
        return (other instanceof RuntimeMessageAdapter) && g76.L(((RuntimeMessageAdapter) other).messageType, this.messageType);
    }

    public final FieldOrOneOfBinding<M, B>[] getFieldBindingsArray() {
        return this.fieldBindingsArray;
    }

    public final Map<Integer, FieldOrOneOfBinding<M, B>> getFields() {
        return this.fields;
    }

    public final List<String> getJsonAlternateNames() {
        return this.jsonAlternateNames;
    }

    public final String getJsonName(FieldOrOneOfBinding<?, ?> fieldOrOneOfBinding) {
        fieldOrOneOfBinding.getClass();
        return fieldOrOneOfBinding.getWireFieldJsonName().length() == 0 ? fieldOrOneOfBinding.getDeclaredName() : fieldOrOneOfBinding.getWireFieldJsonName();
    }

    public final List<String> getJsonNames() {
        return this.jsonNames;
    }

    public final int hashCode() {
        return this.messageType.hashCode();
    }

    public final B newBuilder() {
        return this.binding.newBuilder();
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final M redact(M value) {
        value.getClass();
        B bNewBuilder = this.binding.newBuilder();
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : this.fields.values()) {
            if (fieldOrOneOfBinding.getRedacted() && fieldOrOneOfBinding.getLabel() == WireField.Label.REQUIRED) {
                throw new UnsupportedOperationException("Field '" + fieldOrOneOfBinding.getName() + "' in " + getType() + " is required and cannot be redacted.");
            }
            boolean zIsMessage = fieldOrOneOfBinding.isMessage();
            if (fieldOrOneOfBinding.getRedacted() || (zIsMessage && !fieldOrOneOfBinding.getLabel().isRepeated())) {
                Object fromBuilder = fieldOrOneOfBinding.getFromBuilder(bNewBuilder);
                if (fromBuilder != null) {
                    fieldOrOneOfBinding.set(bNewBuilder, fieldOrOneOfBinding.getAdapter().redact(fromBuilder));
                }
            } else if (zIsMessage && fieldOrOneOfBinding.getLabel().isRepeated()) {
                Object fromBuilder2 = fieldOrOneOfBinding.getFromBuilder(bNewBuilder);
                fromBuilder2.getClass();
                fieldOrOneOfBinding.set(bNewBuilder, Internal__InternalKt.m99redactElements((List) fromBuilder2, fieldOrOneOfBinding.getSingleAdapter()));
            }
        }
        this.binding.clearUnknownFields(bNewBuilder);
        return this.binding.build(bNewBuilder);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final String toString(M value) {
        value.getClass();
        StringBuilder sb = new StringBuilder();
        sb.append(this.messageType.j());
        sb.append('{');
        boolean z = true;
        for (FieldOrOneOfBinding<M, B> fieldOrOneOfBinding : this.fields.values()) {
            Object obj = fieldOrOneOfBinding.get(value);
            if (obj != null) {
                if (!z) {
                    sb.append(", ");
                }
                sb.append(fieldOrOneOfBinding.getName());
                sb.append('=');
                if (fieldOrOneOfBinding.getRedacted()) {
                    obj = REDACTED;
                }
                sb.append(obj);
                z = false;
            }
        }
        sb.append('}');
        return sb.toString();
    }

    public final <A> void writeAllFields(M message, List<? extends A> jsonAdapters, A redactedFieldsAdapter, c55 encodeValue) {
        jsonAdapters.getClass();
        encodeValue.getClass();
        int length = this.fieldBindingsArray.length;
        ArrayList arrayList = null;
        for (int i = 0; i < length; i++) {
            FieldOrOneOfBinding<M, B> fieldOrOneOfBinding = this.fieldBindingsArray[i];
            message.getClass();
            Object obj = fieldOrOneOfBinding.get(message);
            if (!fieldOrOneOfBinding.omitFromJson(getSyntax(), obj)) {
                if (!fieldOrOneOfBinding.getRedacted() || redactedFieldsAdapter == null || obj == null) {
                    encodeValue.f(this.jsonNames.get(i), obj, jsonAdapters.get(i));
                } else {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(this.jsonNames.get(i));
                }
            }
        }
        if (arrayList == null || !(!arrayList.isEmpty())) {
            return;
        }
        redactedFieldsAdapter.getClass();
        encodeValue.f("__redacted_fields", arrayList, redactedFieldsAdapter);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ReverseProtoWriter writer, M value) {
        writer.getClass();
        value.getClass();
        writer.writeBytes(this.binding.unknownFields(value));
        int length = this.fieldBindingsArray.length;
        while (true) {
            length--;
            if (-1 >= length) {
                return;
            }
            FieldOrOneOfBinding<M, B> fieldOrOneOfBinding = this.fieldBindingsArray[length];
            Object obj = fieldOrOneOfBinding.get(value);
            if (obj != null) {
                fieldOrOneOfBinding.getAdapter().encodeWithTag(writer, fieldOrOneOfBinding.getTag(), obj);
            }
        }
    }
}
