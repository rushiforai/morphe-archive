package com.google.gson;

import in.d1;
import in.e1;
import in.p1;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
public final class GsonBuilder {
    private boolean complexMapKeySerialization;
    private String datePattern;
    private int dateStyle;
    private boolean escapeHtmlChars;
    private hn.e excluder;
    private final List<i0> factories;
    private FieldNamingStrategy fieldNamingPolicy;
    private j formattingStyle;
    private boolean generateNonExecutableJson;
    private final List<i0> hierarchyFactories;
    private final Map<Type, Object> instanceCreators;
    private x longSerializationPolicy;
    private f0 numberToNumberStrategy;
    private f0 objectToNumberStrategy;
    private final ArrayDeque<y> reflectionFilters;
    private boolean serializeNulls;
    private boolean serializeSpecialFloatingPointValues;
    private z strictness;
    private int timeStyle;
    private boolean useJdkUnsafe;

    public GsonBuilder() {
        this.excluder = hn.e.f59902g;
        this.longSerializationPolicy = x.f34798a;
        this.fieldNamingPolicy = i.f34782a;
        this.instanceCreators = new HashMap();
        this.factories = new ArrayList();
        this.hierarchyFactories = new ArrayList();
        this.serializeNulls = false;
        this.datePattern = Gson.DEFAULT_DATE_PATTERN;
        this.dateStyle = 2;
        this.timeStyle = 2;
        this.complexMapKeySerialization = false;
        this.serializeSpecialFloatingPointValues = false;
        this.escapeHtmlChars = true;
        this.formattingStyle = Gson.DEFAULT_FORMATTING_STYLE;
        this.generateNonExecutableJson = false;
        this.strictness = Gson.DEFAULT_STRICTNESS;
        this.useJdkUnsafe = true;
        this.objectToNumberStrategy = Gson.DEFAULT_OBJECT_TO_NUMBER_STRATEGY;
        this.numberToNumberStrategy = Gson.DEFAULT_NUMBER_TO_NUMBER_STRATEGY;
        this.reflectionFilters = new ArrayDeque<>();
    }

    private static void addTypeAdaptersForDate(String str, int i5, int i11, List<i0> list) {
        e1 e1Var;
        e1 e1Var2;
        boolean z11 = ln.f.f75060a;
        int i12 = 0;
        Class<Date> cls = Date.class;
        in.f fVar = in.g.f61690b;
        e1 e1Var3 = null;
        if (str != null && !str.trim().isEmpty()) {
            in.h hVar = new in.h(fVar, str);
            e1 e1Var4 = p1.f61726a;
            e1Var = new e1(cls, hVar, i12);
            if (z11) {
                ln.e eVar = ln.f.f75062c;
                eVar.getClass();
                e1Var3 = new e1(eVar.f61691a, new in.h(eVar, str), i12);
                ln.e eVar2 = ln.f.f75061b;
                eVar2.getClass();
                e1Var2 = new e1(eVar2.f61691a, new in.h(eVar2, str), i12);
            } else {
                e1Var2 = null;
            }
        } else {
            if (i5 == 2 && i11 == 2) {
                return;
            }
            in.h hVar2 = new in.h(fVar, i5, i11);
            e1 e1Var5 = p1.f61726a;
            e1 e1Var6 = new e1(cls, hVar2, i12);
            if (z11) {
                ln.e eVar3 = ln.f.f75062c;
                eVar3.getClass();
                e1Var3 = new e1(eVar3.f61691a, new in.h(eVar3, i5, i11), i12);
                ln.e eVar4 = ln.f.f75061b;
                eVar4.getClass();
                e1Var2 = new e1(eVar4.f61691a, new in.h(eVar4, i5, i11), i12);
                e1Var = e1Var6;
            } else {
                e1Var = e1Var6;
                e1Var2 = null;
            }
        }
        list.add(e1Var);
        if (z11) {
            list.add(e1Var3);
            list.add(e1Var2);
        }
    }

    private static int checkDateFormatStyle(int i5) {
        if (i5 < 0 || i5 > 3) {
            throw new IllegalArgumentException(b.c0.h(i5, "Invalid style: "));
        }
        return i5;
    }

    private static boolean hasNonOverridableAdapter(Type type) {
        return type == Object.class;
    }

    public GsonBuilder addDeserializationExclusionStrategy(a aVar) {
        Objects.requireNonNull(aVar);
        this.excluder = this.excluder.e(false, true);
        return this;
    }

    public GsonBuilder addReflectionAccessFilter(y yVar) {
        Objects.requireNonNull(yVar);
        this.reflectionFilters.addFirst(yVar);
        return this;
    }

    public GsonBuilder addSerializationExclusionStrategy(a aVar) {
        Objects.requireNonNull(aVar);
        this.excluder = this.excluder.e(true, false);
        return this;
    }

    public Gson create() {
        ArrayList arrayList = new ArrayList(this.hierarchyFactories.size() + this.factories.size() + 3);
        arrayList.addAll(this.factories);
        Collections.reverse(arrayList);
        ArrayList arrayList2 = new ArrayList(this.hierarchyFactories);
        Collections.reverse(arrayList2);
        arrayList.addAll(arrayList2);
        addTypeAdaptersForDate(this.datePattern, this.dateStyle, this.timeStyle, arrayList);
        return new Gson(this.excluder, this.fieldNamingPolicy, new HashMap(this.instanceCreators), this.serializeNulls, this.complexMapKeySerialization, this.generateNonExecutableJson, this.escapeHtmlChars, this.formattingStyle, this.strictness, this.serializeSpecialFloatingPointValues, this.useJdkUnsafe, this.longSerializationPolicy, this.datePattern, this.dateStyle, this.timeStyle, new ArrayList(this.factories), new ArrayList(this.hierarchyFactories), arrayList, this.objectToNumberStrategy, this.numberToNumberStrategy, new ArrayList(this.reflectionFilters));
    }

    public GsonBuilder disableHtmlEscaping() {
        this.escapeHtmlChars = false;
        return this;
    }

    public GsonBuilder disableInnerClassSerialization() {
        hn.e eVarC = this.excluder.clone();
        eVarC.f59905c = false;
        this.excluder = eVarC;
        return this;
    }

    public GsonBuilder disableJdkUnsafe() {
        this.useJdkUnsafe = false;
        return this;
    }

    public GsonBuilder enableComplexMapKeySerialization() {
        this.complexMapKeySerialization = true;
        return this;
    }

    public GsonBuilder excludeFieldsWithModifiers(int... iArr) {
        Objects.requireNonNull(iArr);
        hn.e eVarC = this.excluder.clone();
        eVarC.f59904b = 0;
        for (int i5 : iArr) {
            eVarC.f59904b = i5 | eVarC.f59904b;
        }
        this.excluder = eVarC;
        return this;
    }

    public GsonBuilder excludeFieldsWithoutExposeAnnotation() {
        hn.e eVarC = this.excluder.clone();
        eVarC.f59906d = true;
        this.excluder = eVarC;
        return this;
    }

    public GsonBuilder generateNonExecutableJson() {
        this.generateNonExecutableJson = true;
        return this;
    }

    public GsonBuilder registerTypeAdapter(Type type, Object obj) {
        Objects.requireNonNull(type);
        Objects.requireNonNull(obj);
        boolean z11 = obj instanceof u;
        if (!z11 && !(obj instanceof o) && !(obj instanceof h0)) {
            throw new IllegalArgumentException("Class " + obj.getClass().getName() + " does not implement any supported type adapter class or interface");
        }
        if (hasNonOverridableAdapter(type)) {
            throw new IllegalArgumentException("Cannot override built-in adapter for " + type);
        }
        if (z11 || (obj instanceof o)) {
            this.factories.add(in.i0.e(new mn.a(type), obj));
        }
        if (obj instanceof h0) {
            e1 e1Var = p1.f61726a;
            this.factories.add(new d1(new mn.a(type), (h0) obj));
        }
        return this;
    }

    public GsonBuilder registerTypeAdapterFactory(i0 i0Var) {
        Objects.requireNonNull(i0Var);
        this.factories.add(i0Var);
        return this;
    }

    public GsonBuilder registerTypeHierarchyAdapter(Class<?> cls, Object obj) {
        Objects.requireNonNull(cls);
        Objects.requireNonNull(obj);
        boolean z11 = obj instanceof u;
        if (!z11 && !(obj instanceof o) && !(obj instanceof h0)) {
            throw new IllegalArgumentException("Class " + obj.getClass().getName() + " does not implement any supported type adapter class or interface");
        }
        if ((obj instanceof o) || z11) {
            this.hierarchyFactories.add(in.i0.f(cls, obj));
        }
        if (obj instanceof h0) {
            e1 e1Var = p1.f61726a;
            this.factories.add(new e1(cls, (h0) obj, 1));
        }
        return this;
    }

    public GsonBuilder serializeNulls() {
        this.serializeNulls = true;
        return this;
    }

    public GsonBuilder serializeSpecialFloatingPointValues() {
        this.serializeSpecialFloatingPointValues = true;
        return this;
    }

    public GsonBuilder setDateFormat(String str) {
        if (str != null) {
            try {
                new SimpleDateFormat(str);
            } catch (IllegalArgumentException e3) {
                throw new IllegalArgumentException(b.c0.l("The date pattern '", str, "' is not valid"), e3);
            }
        }
        this.datePattern = str;
        return this;
    }

    public GsonBuilder setExclusionStrategies(a... aVarArr) {
        Objects.requireNonNull(aVarArr);
        for (a aVar : aVarArr) {
            this.excluder = this.excluder.e(true, true);
        }
        return this;
    }

    public GsonBuilder setFieldNamingPolicy(i iVar) {
        return setFieldNamingStrategy(iVar);
    }

    public GsonBuilder setFieldNamingStrategy(FieldNamingStrategy fieldNamingStrategy) {
        Objects.requireNonNull(fieldNamingStrategy);
        this.fieldNamingPolicy = fieldNamingStrategy;
        return this;
    }

    public GsonBuilder setFormattingStyle(j jVar) {
        Objects.requireNonNull(jVar);
        this.formattingStyle = jVar;
        return this;
    }

    @Deprecated
    public GsonBuilder setLenient() {
        return setStrictness(z.f34800a);
    }

    public GsonBuilder setLongSerializationPolicy(x xVar) {
        Objects.requireNonNull(xVar);
        this.longSerializationPolicy = xVar;
        return this;
    }

    public GsonBuilder setNumberToNumberStrategy(f0 f0Var) {
        Objects.requireNonNull(f0Var);
        this.numberToNumberStrategy = f0Var;
        return this;
    }

    public GsonBuilder setObjectToNumberStrategy(f0 f0Var) {
        Objects.requireNonNull(f0Var);
        this.objectToNumberStrategy = f0Var;
        return this;
    }

    public GsonBuilder setPrettyPrinting() {
        return setFormattingStyle(j.f34786e);
    }

    public GsonBuilder setStrictness(z zVar) {
        Objects.requireNonNull(zVar);
        this.strictness = zVar;
        return this;
    }

    public GsonBuilder setVersion(double d5) {
        if (Double.isNaN(d5) || d5 < 0.0d) {
            throw new IllegalArgumentException("Invalid version: " + d5);
        }
        hn.e eVarC = this.excluder.clone();
        eVarC.f59903a = d5;
        this.excluder = eVarC;
        return this;
    }

    @Deprecated
    public GsonBuilder setDateFormat(int i5) {
        this.dateStyle = checkDateFormatStyle(i5);
        this.datePattern = null;
        return this;
    }

    public GsonBuilder setDateFormat(int i5, int i11) {
        this.dateStyle = checkDateFormatStyle(i5);
        this.timeStyle = checkDateFormatStyle(i11);
        this.datePattern = null;
        return this;
    }

    public GsonBuilder(Gson gson) {
        this.excluder = hn.e.f59902g;
        this.longSerializationPolicy = x.f34798a;
        this.fieldNamingPolicy = i.f34782a;
        HashMap map = new HashMap();
        this.instanceCreators = map;
        ArrayList arrayList = new ArrayList();
        this.factories = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.hierarchyFactories = arrayList2;
        this.serializeNulls = false;
        this.datePattern = Gson.DEFAULT_DATE_PATTERN;
        this.dateStyle = 2;
        this.timeStyle = 2;
        this.complexMapKeySerialization = false;
        this.serializeSpecialFloatingPointValues = false;
        this.escapeHtmlChars = true;
        this.formattingStyle = Gson.DEFAULT_FORMATTING_STYLE;
        this.generateNonExecutableJson = false;
        this.strictness = Gson.DEFAULT_STRICTNESS;
        this.useJdkUnsafe = true;
        this.objectToNumberStrategy = Gson.DEFAULT_OBJECT_TO_NUMBER_STRATEGY;
        this.numberToNumberStrategy = Gson.DEFAULT_NUMBER_TO_NUMBER_STRATEGY;
        ArrayDeque<y> arrayDeque = new ArrayDeque<>();
        this.reflectionFilters = arrayDeque;
        this.excluder = gson.excluder;
        this.fieldNamingPolicy = gson.fieldNamingStrategy;
        map.putAll(gson.instanceCreators);
        this.serializeNulls = gson.serializeNulls;
        this.complexMapKeySerialization = gson.complexMapKeySerialization;
        this.generateNonExecutableJson = gson.generateNonExecutableJson;
        this.escapeHtmlChars = gson.htmlSafe;
        this.formattingStyle = gson.formattingStyle;
        this.strictness = gson.strictness;
        this.serializeSpecialFloatingPointValues = gson.serializeSpecialFloatingPointValues;
        this.longSerializationPolicy = gson.longSerializationPolicy;
        this.datePattern = gson.datePattern;
        this.dateStyle = gson.dateStyle;
        this.timeStyle = gson.timeStyle;
        arrayList.addAll(gson.builderFactories);
        arrayList2.addAll(gson.builderHierarchyFactories);
        this.useJdkUnsafe = gson.useJdkUnsafe;
        this.objectToNumberStrategy = gson.objectToNumberStrategy;
        this.numberToNumberStrategy = gson.numberToNumberStrategy;
        arrayDeque.addAll(gson.reflectionFilters);
    }
}
