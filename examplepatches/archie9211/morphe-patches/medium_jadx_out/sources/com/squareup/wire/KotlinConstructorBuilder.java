package com.squareup.wire;

import com.squareup.wire.Message;
import com.squareup.wire.Message.Builder;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.cu1;
import defpackage.ey3;
import defpackage.f09;
import defpackage.fy3;
import defpackage.g46;
import defpackage.g76;
import defpackage.h21;
import defpackage.m46;
import defpackage.m70;
import defpackage.n46;
import defpackage.nec;
import defpackage.pwd;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\b\n\u0002\u0010%\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\b\u0004\b\u0000\u0018\u0000*\u0014\b\u0000\u0010\u0002*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001*\u0014\b\u0001\u0010\u0004*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00032\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003:\u0001#B\u0015\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0002¢\u0006\u0004\b\f\u0010\rJ\u001f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e*\b\u0012\u0004\u0012\u00028\u00000\u0005H\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u001f\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\t2\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u0017\u0010\u0016\u001a\u0004\u0018\u00010\u00122\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00028\u0000H\u0016¢\u0006\u0004\b\u0018\u0010\u0019R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u00058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001aR.\u0010\u001e\u001a\u001c\u0012\u0004\u0012\u00020\u001c\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00120\u001d0\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010\u001fR0\u0010!\u001a\u001e\u0012\u0004\u0012\u00020\u001c\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\t\u0012\b\u0012\u0006\u0012\u0002\b\u00030 0\u001d0\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b!\u0010\u001fR4\u0010\"\u001a\"\u0012\u0004\u0012\u00020\u001c\u0012\u0018\u0012\u0016\u0012\u0004\u0012\u00020\t\u0012\f\u0012\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u001b0\u001d0\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\"\u0010\u001f¨\u0006$"}, d2 = {"Lcom/squareup/wire/KotlinConstructorBuilder;", "Lcom/squareup/wire/Message;", "M", "Lcom/squareup/wire/Message$Builder;", "B", "Ljava/lang/Class;", "messageType", "<init>", "(Ljava/lang/Class;)V", "Lcom/squareup/wire/WireField;", "field", "Lc1e;", "clobberOtherIsOneOfs", "(Lcom/squareup/wire/WireField;)V", "", "Lcom/squareup/wire/KotlinConstructorBuilder$ProtoField;", "declaredProtoFields", "(Ljava/lang/Class;)Ljava/util/List;", "", "value", "set", "(Lcom/squareup/wire/WireField;Ljava/lang/Object;)V", "get", "(Lcom/squareup/wire/WireField;)Ljava/lang/Object;", "build", "()Lcom/squareup/wire/Message;", "Ljava/lang/Class;", "", "", "Lf09;", "fieldValueMap", "Ljava/util/Map;", "", "repeatedFieldValueMap", "mapFieldKeyValueMap", "ProtoField", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class KotlinConstructorBuilder<M extends Message<M, B>, B extends Message.Builder<M, B>> extends Message.Builder<M, B> {
    private final Map<Integer, f09> fieldValueMap;
    private final Map<Integer, f09> mapFieldKeyValueMap;
    private final Class<M> messageType;
    private final Map<Integer, f09> repeatedFieldValueMap;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0002\u0018\u00002\u00020\u0001B\u001b\u0012\n\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0015\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/squareup/wire/KotlinConstructorBuilder$ProtoField;", "", "type", "Ljava/lang/Class;", "wireField", "Lcom/squareup/wire/WireField;", "<init>", "(Ljava/lang/Class;Lcom/squareup/wire/WireField;)V", "getType", "()Ljava/lang/Class;", "getWireField", "()Lcom/squareup/wire/WireField;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class ProtoField {
        private final Class<?> type;
        private final WireField wireField;

        public ProtoField(Class<?> cls, WireField wireField) {
            cls.getClass();
            wireField.getClass();
            this.type = cls;
            this.wireField = wireField;
        }

        public final Class<?> getType() {
            return this.type;
        }

        public final WireField getWireField() {
            return this.wireField;
        }
    }

    public KotlinConstructorBuilder(Class<M> cls) {
        cls.getClass();
        this.messageType = cls;
        int length = cls.getDeclaredFields().length;
        this.fieldValueMap = new LinkedHashMap(length);
        this.repeatedFieldValueMap = new LinkedHashMap(length);
        this.mapFieldKeyValueMap = new LinkedHashMap(length);
    }

    private final void clobberOtherIsOneOfs(WireField field) {
        Collection<f09> collectionValues = this.fieldValueMap.values();
        ArrayList arrayList = new ArrayList(cu1.k0(collectionValues, 10));
        Iterator<T> it2 = collectionValues.iterator();
        while (it2.hasNext()) {
            arrayList.add((WireField) ((f09) it2.next()).a);
        }
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            WireField wireField = (WireField) obj;
            if (g76.L(wireField.oneofName(), field.oneofName()) && wireField.tag() != field.tag()) {
                arrayList2.add(obj);
            }
        }
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            this.fieldValueMap.remove(Integer.valueOf(((WireField) it3.next()).tag()));
        }
    }

    private final List<ProtoField> declaredProtoFields(Class<M> cls) {
        ProtoField protoField;
        Field[] declaredFields = cls.getDeclaredFields();
        declaredFields.getClass();
        ArrayList arrayList = new ArrayList();
        for (Field field : declaredFields) {
            Annotation[] declaredAnnotations = field.getDeclaredAnnotations();
            declaredAnnotations.getClass();
            ArrayList arrayList2 = new ArrayList();
            for (Annotation annotation : declaredAnnotations) {
                if (annotation instanceof WireField) {
                    arrayList2.add(annotation);
                }
            }
            WireField wireField = (WireField) bu1.z0(arrayList2);
            if (wireField != null) {
                Class<?> type = field.getType();
                type.getClass();
                protoField = new ProtoField(type, wireField);
            } else {
                protoField = null;
            }
            if (protoField != null) {
                arrayList.add(protoField);
            }
        }
        return bu1.f1(arrayList, new KotlinConstructorBuilder$declaredProtoFields$$inlined$sortedBy$1());
    }

    @Override // com.squareup.wire.Message.Builder
    public final M build() throws IllegalAccessException, NoSuchMethodException, InstantiationException, InvocationTargetException {
        List<ProtoField> listDeclaredProtoFields = declaredProtoFields(this.messageType);
        m70 m70Var = new m70();
        Iterator<ProtoField> it2 = listDeclaredProtoFields.iterator();
        while (it2.hasNext()) {
            m70Var.addLast(it2.next());
        }
        ArrayList arrayList = new ArrayList(cu1.k0(listDeclaredProtoFields, 10));
        Iterator<T> it3 = listDeclaredProtoFields.iterator();
        while (it3.hasNext()) {
            arrayList.add(((ProtoField) it3.next()).getType());
        }
        Class[] clsArr = (Class[]) arrayList.toArray(new Class[0]);
        Class<M> cls = this.messageType;
        nec necVar = new nec(2);
        ArrayList arrayList2 = (ArrayList) necVar.b;
        necVar.e(clsArr);
        necVar.b(h21.class);
        Constructor<M> declaredConstructor = cls.getDeclaredConstructor((Class[]) arrayList2.toArray(new Class[arrayList2.size()]));
        n46 n46Var = new n46(0, clsArr.length, 1);
        ArrayList arrayList3 = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it4 = n46Var.iterator();
        while (((m46) it4).c) {
            arrayList3.add(((g46) it4).nextInt() == listDeclaredProtoFields.size() ? buildUnknownFields() : get(((ProtoField) m70Var.removeFirst()).getWireField()));
        }
        Object[] array = arrayList3.toArray(new Object[0]);
        M mNewInstance = declaredConstructor.newInstance(Arrays.copyOf(array, array.length));
        mNewInstance.getClass();
        return mNewInstance;
    }

    public final Object get(WireField field) {
        List list;
        Map map;
        field.getClass();
        if (KotlinConstructorBuilderKt.isMap(field)) {
            f09 f09Var = this.mapFieldKeyValueMap.get(Integer.valueOf(field.tag()));
            return (f09Var == null || (map = (Map) f09Var.b) == null) ? fy3.a : map;
        }
        if (field.label().isRepeated()) {
            f09 f09Var2 = this.repeatedFieldValueMap.get(Integer.valueOf(field.tag()));
            return (f09Var2 == null || (list = (List) f09Var2.b) == null) ? ey3.a : list;
        }
        f09 f09Var3 = this.fieldValueMap.get(Integer.valueOf(field.tag()));
        Object obj = f09Var3 != null ? f09Var3.b : null;
        return (obj == null && field.label() == WireField.Label.OMIT_IDENTITY) ? ProtoAdapter.INSTANCE.get(field.adapter()).getIdentity() : obj;
    }

    public final void set(WireField field, Object value) {
        field.getClass();
        if (KotlinConstructorBuilderKt.isMap(field)) {
            Map<Integer, f09> map = this.mapFieldKeyValueMap;
            Integer numValueOf = Integer.valueOf(field.tag());
            value.getClass();
            map.put(numValueOf, new f09(field, pwd.y(value)));
            return;
        }
        if (field.label().isRepeated()) {
            Map<Integer, f09> map2 = this.repeatedFieldValueMap;
            Integer numValueOf2 = Integer.valueOf(field.tag());
            value.getClass();
            map2.put(numValueOf2, new f09(field, pwd.x(value)));
            return;
        }
        this.fieldValueMap.put(Integer.valueOf(field.tag()), new f09(field, value));
        if (value == null || !field.label().isOneOf()) {
            return;
        }
        clobberOtherIsOneOfs(field);
    }
}
