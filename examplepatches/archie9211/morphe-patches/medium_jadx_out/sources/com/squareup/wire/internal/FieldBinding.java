package com.squareup.wire.internal;

import com.squareup.wire.KotlinConstructorBuilder;
import com.squareup.wire.Message;
import com.squareup.wire.Message.Builder;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.WireField;
import defpackage.b55;
import defpackage.c1e;
import defpackage.ff4;
import defpackage.gy2;
import defpackage.l23;
import defpackage.pwd;
import defpackage.s0;
import defpackage.th6;
import defpackage.vh6;
import defpackage.vx0;
import defpackage.wg6;
import defpackage.wh6;
import defpackage.x2b;
import defpackage.x45;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u0000 O*\u0014\b\u0000\u0010\u0002*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001*\u0014\b\u0001\u0010\u0004*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00032\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0005:\u0001OBI\b\u0000\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00028\u00000\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00010\b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u001f\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0013\u001a\u00028\u00012\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0017J!\u0010\u0018\u001a\u00020\u00162\u0006\u0010\u0013\u001a\u00028\u00012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0016¢\u0006\u0004\b\u0018\u0010\u0017J\u001a\u0010\u001a\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0019\u001a\u00028\u0000H\u0096\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u0019\u0010\u001c\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0013\u001a\u00028\u0001H\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ7\u0010\u001f\u001a\u0016\u0012\u0004\u0012\u00028\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u0014\u0012\u0004\u0012\u00020\u00160\u001e2\n\u0010\f\u001a\u0006\u0012\u0002\b\u00030\b2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u001f\u0010 J1\u0010\"\u001a\u0010\u0012\u0004\u0012\u00028\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u00140!2\n\u0010\f\u001a\u0006\u0012\u0002\b\u00030\b2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\"\u0010#J+\u0010$\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0006\u0012\u0004\u0018\u00010\u00140!2\f\u0010\t\u001a\b\u0012\u0004\u0012\u00028\u00000\bH\u0002¢\u0006\u0004\b$\u0010%R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010&R\u001a\u0010\u000e\u001a\u00020\r8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u000e\u0010'\u001a\u0004\b(\u0010)R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010*R\u001a\u0010,\u001a\u00020+8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b,\u0010-\u001a\u0004\b.\u0010/R\u001a\u00101\u001a\u0002008\u0016X\u0096\u0004¢\u0006\f\n\u0004\b1\u00102\u001a\u0004\b3\u00104R\u001a\u00105\u001a\u0002008\u0016X\u0096\u0004¢\u0006\f\n\u0004\b5\u00102\u001a\u0004\b6\u00104R\u001a\u00107\u001a\u0002008\u0016X\u0096\u0004¢\u0006\f\n\u0004\b7\u00102\u001a\u0004\b8\u00104R\u001a\u0010:\u001a\u0002098\u0016X\u0096\u0004¢\u0006\f\n\u0004\b:\u0010;\u001a\u0004\b<\u0010=R\u0014\u0010>\u001a\u0002008\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b>\u00102R\u0014\u0010?\u001a\u0002008\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b?\u00102R\u001a\u0010@\u001a\u00020\r8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b@\u0010'\u001a\u0004\bA\u0010)R(\u0010B\u001a\u0016\u0012\u0004\u0012\u00028\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u0014\u0012\u0004\u0012\u00020\u00160\u001e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bB\u0010CR\"\u0010D\u001a\u0010\u0012\u0004\u0012\u00028\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u00140!8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bD\u0010ER\"\u0010F\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0006\u0012\u0004\u0018\u00010\u00140!8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bF\u0010ER\u0018\u0010J\u001a\u0006\u0012\u0002\b\u00030G8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bH\u0010IR\u0018\u0010L\u001a\u0006\u0012\u0002\b\u00030G8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bK\u0010IR\u0014\u0010M\u001a\u00020\r8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bM\u0010)R\u0014\u0010N\u001a\u00020\r8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bN\u0010)¨\u0006P"}, d2 = {"Lcom/squareup/wire/internal/FieldBinding;", "Lcom/squareup/wire/Message;", "M", "Lcom/squareup/wire/Message$Builder;", "B", "Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "Lcom/squareup/wire/WireField;", "wireField", "Ljava/lang/Class;", "messageType", "Ljava/lang/reflect/Field;", "messageField", "builderType", "", "writeIdentityValues", "Ljava/lang/ClassLoader;", "classLoader", "<init>", "(Lcom/squareup/wire/WireField;Ljava/lang/Class;Ljava/lang/reflect/Field;Ljava/lang/Class;ZLjava/lang/ClassLoader;)V", "builder", "", "value", "Lc1e;", "(Lcom/squareup/wire/Message$Builder;Ljava/lang/Object;)V", "set", "message", "get", "(Lcom/squareup/wire/Message;)Ljava/lang/Object;", "getFromBuilder", "(Lcom/squareup/wire/Message$Builder;)Ljava/lang/Object;", "Lkotlin/Function2;", "getBuilderSetter", "(Ljava/lang/Class;Lcom/squareup/wire/WireField;)Lb55;", "Lkotlin/Function1;", "getBuilderGetter", "(Ljava/lang/Class;Lcom/squareup/wire/WireField;)Lx45;", "getInstanceGetter", "(Ljava/lang/Class;)Lx45;", "Ljava/lang/reflect/Field;", "Z", "getWriteIdentityValues", "()Z", "Ljava/lang/ClassLoader;", "Lcom/squareup/wire/WireField$Label;", "label", "Lcom/squareup/wire/WireField$Label;", "getLabel", "()Lcom/squareup/wire/WireField$Label;", "", "name", "Ljava/lang/String;", "getName", "()Ljava/lang/String;", "wireFieldJsonName", "getWireFieldJsonName", "declaredName", "getDeclaredName", "", "tag", "I", "getTag", "()I", "keyAdapterString", "adapterString", "redacted", "getRedacted", "builderSetter", "Lb55;", "builderGetter", "Lx45;", "instanceGetter", "Lcom/squareup/wire/ProtoAdapter;", "getKeyAdapter", "()Lcom/squareup/wire/ProtoAdapter;", "keyAdapter", "getSingleAdapter", "singleAdapter", "isMap", "isMessage", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class FieldBinding<M extends Message<M, B>, B extends Message.Builder<M, B>> extends FieldOrOneOfBinding<M, B> {
    private static final x2b IS_GETTER_FIELD_NAME_REGEX = new x2b("^is[^a-z].*$");
    private final String adapterString;
    private final x45 builderGetter;
    private final b55 builderSetter;
    private final ClassLoader classLoader;
    private final String declaredName;
    private final x45 instanceGetter;
    private final String keyAdapterString;
    private final WireField.Label label;
    private final Field messageField;
    private final String name;
    private final boolean redacted;
    private final int tag;
    private final String wireFieldJsonName;
    private final boolean writeIdentityValues;

    public FieldBinding(WireField wireField, Class<M> cls, Field field, Class<B> cls2, boolean z, ClassLoader classLoader) {
        String strDeclaredName;
        wireField.getClass();
        cls.getClass();
        field.getClass();
        cls2.getClass();
        this.messageField = field;
        this.writeIdentityValues = z;
        this.classLoader = classLoader;
        this.label = wireField.label();
        String name = field.getName();
        name.getClass();
        this.name = name;
        this.wireFieldJsonName = wireField.jsonName();
        if (wireField.declaredName().length() == 0) {
            strDeclaredName = field.getName();
            strDeclaredName.getClass();
        } else {
            strDeclaredName = wireField.declaredName();
        }
        this.declaredName = strDeclaredName;
        this.tag = wireField.tag();
        this.keyAdapterString = wireField.keyAdapter();
        this.adapterString = wireField.adapter();
        this.redacted = wireField.redacted();
        this.builderSetter = getBuilderSetter(cls2, wireField);
        this.builderGetter = getBuilderGetter(cls2, wireField);
        this.instanceGetter = getInstanceGetter(cls);
    }

    private final x45 getBuilderGetter(Class<?> builderType, WireField wireField) {
        if (builderType.isAssignableFrom(KotlinConstructorBuilder.class)) {
            return new s0(29, wireField);
        }
        try {
            return new ff4(0, builderType.getField(this.name));
        } catch (NoSuchFieldException unused) {
            throw new AssertionError("No builder field " + builderType.getName() + '.' + this.name);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object getBuilderGetter$lambda$3(WireField wireField, Message.Builder builder) {
        builder.getClass();
        return ((KotlinConstructorBuilder) builder).get(wireField);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object getBuilderGetter$lambda$4(Field field, Message.Builder builder) {
        builder.getClass();
        return field.get(builder);
    }

    private final b55 getBuilderSetter(Class<?> builderType, WireField wireField) {
        if (builderType.isAssignableFrom(KotlinConstructorBuilder.class)) {
            return new l23(12, wireField);
        }
        if (!wireField.label().isOneOf()) {
            try {
                return new l23(14, builderType.getField(this.name));
            } catch (NoSuchFieldException unused) {
                throw new AssertionError("No builder field " + builderType.getName() + '.' + this.name);
            }
        }
        Class<?> type = this.messageField.getType();
        try {
            return new l23(13, builderType.getMethod(this.name, type));
        } catch (NoSuchMethodException unused2) {
            throw new AssertionError("No builder method " + builderType.getName() + '.' + this.name + '(' + type.getName() + ')');
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e getBuilderSetter$lambda$0(WireField wireField, Message.Builder builder, Object obj) {
        builder.getClass();
        ((KotlinConstructorBuilder) builder).set(wireField, obj);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e getBuilderSetter$lambda$1(Method method, Message.Builder builder, Object obj) throws IllegalAccessException, InvocationTargetException {
        builder.getClass();
        method.invoke(builder, obj);
        return c1e.a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final c1e getBuilderSetter$lambda$2(Field field, Message.Builder builder, Object obj) throws IllegalAccessException {
        builder.getClass();
        field.set(builder, obj);
        return c1e.a;
    }

    private final x45 getInstanceGetter(Class<M> messageType) {
        if (!Modifier.isPrivate(this.messageField.getModifiers())) {
            return new ff4(2, this);
        }
        String name = this.messageField.getName();
        x2b x2bVar = IS_GETTER_FIELD_NAME_REGEX;
        name.getClass();
        int i = 1;
        if (!x2bVar.c(name)) {
            if (name.length() > 0) {
                StringBuilder sb = new StringBuilder();
                String strValueOf = String.valueOf(name.charAt(0));
                strValueOf.getClass();
                String upperCase = strValueOf.toUpperCase(Locale.ROOT);
                upperCase.getClass();
                sb.append((Object) upperCase);
                sb.append(name.substring(1));
                name = sb.toString();
            }
            name = "get".concat(name);
        }
        return new ff4(i, messageType.getMethod(name, null));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object getInstanceGetter$lambda$6(Method method, Message message) {
        message.getClass();
        return method.invoke(message, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object getInstanceGetter$lambda$7(FieldBinding fieldBinding, Message message) {
        message.getClass();
        return fieldBinding.messageField.get(message);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final Object get(M message) {
        message.getClass();
        return this.instanceGetter.invoke(message);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getDeclaredName() {
        return this.declaredName;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final Object getFromBuilder(B builder) {
        builder.getClass();
        return this.builderGetter.invoke(builder);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final ProtoAdapter<?> getKeyAdapter() {
        return ProtoAdapter.INSTANCE.get(this.keyAdapterString, this.classLoader);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final WireField.Label getLabel() {
        return this.label;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getName() {
        return this.name;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean getRedacted() {
        return this.redacted;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final ProtoAdapter<?> getSingleAdapter() {
        return ProtoAdapter.INSTANCE.get(this.adapterString, this.classLoader);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final int getTag() {
        return this.tag;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final String getWireFieldJsonName() {
        return this.wireFieldJsonName;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean getWriteIdentityValues() {
        return this.writeIdentityValues;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean isMap() {
        return this.keyAdapterString.length() > 0;
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final boolean isMessage() {
        wg6 type = getSingleAdapter().getType();
        Class clsU = type != null ? vx0.U(type) : null;
        clsU.getClass();
        return Message.class.isAssignableFrom(clsU);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final void set(B builder, Object value) {
        builder.getClass();
        this.builderSetter.invoke(builder, value);
    }

    @Override // com.squareup.wire.internal.FieldOrOneOfBinding
    public final void value(B builder, Object value) {
        builder.getClass();
        value.getClass();
        if (this.label.isRepeated()) {
            Object objInvoke = this.builderGetter.invoke(builder);
            boolean z = objInvoke instanceof List;
            if (z && (!(objInvoke instanceof th6) || (objInvoke instanceof vh6))) {
                objInvoke.getClass();
                pwd.x(objInvoke).add(value);
                return;
            } else if (z) {
                ArrayList arrayList = new ArrayList((Collection) objInvoke);
                arrayList.add(value);
                this.builderSetter.invoke(builder, arrayList);
                return;
            } else {
                throw new ClassCastException("Expected a list type, got " + (objInvoke != null ? objInvoke.getClass() : null) + '.');
            }
        }
        if (this.keyAdapterString.length() <= 0) {
            this.builderSetter.invoke(builder, value);
            return;
        }
        Object objInvoke2 = this.builderGetter.invoke(builder);
        boolean z2 = objInvoke2 instanceof Map;
        if (z2 && (!(objInvoke2 instanceof th6) || (objInvoke2 instanceof wh6))) {
            ((Map) objInvoke2).putAll((Map) value);
            return;
        }
        if (z2) {
            LinkedHashMap linkedHashMap = new LinkedHashMap((Map) objInvoke2);
            linkedHashMap.putAll((Map) value);
            this.builderSetter.invoke(builder, linkedHashMap);
        } else {
            throw new ClassCastException("Expected a map type, got " + (objInvoke2 != null ? objInvoke2.getClass() : null) + '.');
        }
    }

    public /* synthetic */ FieldBinding(WireField wireField, Class cls, Field field, Class cls2, boolean z, ClassLoader classLoader, int i, gy2 gy2Var) {
        this(wireField, cls, field, cls2, z, (i & 32) != 0 ? cls.getClassLoader() : classLoader);
    }
}
