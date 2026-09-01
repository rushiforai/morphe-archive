package com.squareup.wire.internal;

import com.squareup.wire.Message;
import com.squareup.wire.Message.Builder;
import com.squareup.wire.OneOf;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.WireField;
import defpackage.vx0;
import defpackage.wg6;
import java.lang.reflect.Field;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u0001\n\u0002\b\u0004\b\u0000\u0018\u0000*\u0014\b\u0000\u0010\u0002*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001*\u0014\b\u0001\u0010\u0004*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00032\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0005B3\b\u0000\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00028\u00010\b\u0012\n\u0010\u000b\u001a\u0006\u0012\u0002\b\u00030\n\u0012\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u001f\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00028\u00012\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0014J!\u0010\u0015\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00028\u00012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0016¢\u0006\u0004\b\u0015\u0010\u0014J\u001a\u0010\u0017\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0016\u001a\u00028\u0000H\u0096\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u0019\u0010\u0019\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0010\u001a\u00028\u0001H\u0016¢\u0006\u0004\b\u0019\u0010\u001aR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001bR\u0018\u0010\u000b\u001a\u0006\u0012\u0002\b\u00030\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001cR\u001a\u0010\r\u001a\u00020\f8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\r\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010 \u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b \u0010\u001bR \u0010&\u001a\b\u0012\u0004\u0012\u00020\u00110!8VX\u0096\u0004¢\u0006\f\u0012\u0004\b$\u0010%\u001a\u0004\b\"\u0010#R\u0014\u0010*\u001a\u00020'8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b(\u0010)R\u0014\u0010.\u001a\u00020+8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b,\u0010-R\u0014\u00100\u001a\u00020\f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b/\u0010\u001fR\u0014\u00104\u001a\u0002018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b2\u00103R\u0014\u00106\u001a\u0002018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b5\u00103R\u0014\u00108\u001a\u0002018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b7\u00103R\u0014\u00109\u001a\u00020\f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b9\u0010\u001fR\u0014\u0010:\u001a\u00020\f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b:\u0010\u001fR\u0014\u0010>\u001a\u00020;8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b<\u0010=¨\u0006?"}, d2 = {"Lcom/squareup/wire/internal/OneOfBinding;", "Lcom/squareup/wire/Message;", "M", "Lcom/squareup/wire/Message$Builder;", "B", "Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "Ljava/lang/reflect/Field;", "messageField", "Ljava/lang/Class;", "builderType", "Lcom/squareup/wire/OneOf$Key;", "key", "", "writeIdentityValues", "<init>", "(Ljava/lang/reflect/Field;Ljava/lang/Class;Lcom/squareup/wire/OneOf$Key;Z)V", "builder", "", "value", "Lc1e;", "(Lcom/squareup/wire/Message$Builder;Ljava/lang/Object;)V", "set", "message", "get", "(Lcom/squareup/wire/Message;)Ljava/lang/Object;", "getFromBuilder", "(Lcom/squareup/wire/Message$Builder;)Ljava/lang/Object;", "Ljava/lang/reflect/Field;", "Lcom/squareup/wire/OneOf$Key;", "Z", "getWriteIdentityValues", "()Z", "builderField", "Lcom/squareup/wire/ProtoAdapter;", "getSingleAdapter", "()Lcom/squareup/wire/ProtoAdapter;", "getSingleAdapter$annotations", "()V", "singleAdapter", "", "getTag", "()I", "tag", "Lcom/squareup/wire/WireField$Label;", "getLabel", "()Lcom/squareup/wire/WireField$Label;", "label", "getRedacted", "redacted", "", "getWireFieldJsonName", "()Ljava/lang/String;", "wireFieldJsonName", "getName", "name", "getDeclaredName", "declaredName", "isMap", "isMessage", "", "getKeyAdapter", "()Ljava/lang/Void;", "keyAdapter", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class OneOfBinding<M extends Message<M, B>, B extends Message.Builder<M, B>> extends FieldOrOneOfBinding<M, B> {
    private final Field builderField;
    private final OneOf.Key<?> key;
    private final Field messageField;
    private final boolean writeIdentityValues;

    public OneOfBinding(Field field, Class<B> cls, OneOf.Key<?> key, boolean z) throws NoSuchFieldException {
        field.getClass();
        cls.getClass();
        key.getClass();
        this.messageField = field;
        this.key = key;
        this.writeIdentityValues = z;
        Field declaredField = cls.getDeclaredField(field.getName());
        declaredField.getClass();
        this.builderField = declaredField;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final Object get(M message) {
        message.getClass();
        OneOf oneOf = (OneOf) this.messageField.get(message);
        if (oneOf != null) {
            return oneOf.getOrNull(this.key);
        }
        return null;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getDeclaredName() {
        return this.key.getDeclaredName();
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final Object getFromBuilder(B builder) {
        builder.getClass();
        OneOf oneOf = (OneOf) this.builderField.get(builder);
        if (oneOf != null) {
            return oneOf.getOrNull(this.key);
        }
        return null;
    }

    /* JADX INFO: renamed from: getKeyAdapter, reason: collision with other method in class */
    public final Void m101getKeyAdapter() {
        throw new IllegalStateException("not a map");
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final WireField.Label getLabel() {
        return WireField.Label.OPTIONAL;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getName() {
        return this.key.getDeclaredName();
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean getRedacted() {
        return this.key.getRedacted();
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final ProtoAdapter<Object> getSingleAdapter() {
        ProtoAdapter<?> adapter = this.key.getAdapter();
        adapter.getClass();
        return adapter;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final int getTag() {
        return this.key.getTag();
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getWireFieldJsonName() {
        return this.key.getJsonName();
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean getWriteIdentityValues() {
        return this.writeIdentityValues;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean isMap() {
        return false;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean isMessage() {
        wg6 type = getSingleAdapter().getType();
        return Message.class.isAssignableFrom(type != null ? vx0.U(type) : null);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final void set(B builder, Object value) throws IllegalAccessException {
        builder.getClass();
        Field field = this.builderField;
        OneOf.Key<?> key = this.key;
        key.getClass();
        value.getClass();
        field.set(builder, new OneOf(key, value));
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final void value(B builder, Object value) throws IllegalAccessException {
        builder.getClass();
        value.getClass();
        set((Message.Builder) builder, value);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final /* bridge */ /* synthetic */ ProtoAdapter getKeyAdapter() {
        m101getKeyAdapter();
        throw null;
    }

    public static /* synthetic */ void getSingleAdapter$annotations() {
    }
}
