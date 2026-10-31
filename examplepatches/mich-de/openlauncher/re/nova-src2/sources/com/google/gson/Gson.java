package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import com.google.gson.stream.MalformedJsonException;
import in.e1;
import in.g1;
import in.p1;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* loaded from: classes.dex */
public final class Gson {
    static final boolean DEFAULT_COMPLEX_MAP_KEYS = false;
    static final boolean DEFAULT_ESCAPE_HTML = true;
    static final boolean DEFAULT_JSON_NON_EXECUTABLE = false;
    static final boolean DEFAULT_SERIALIZE_NULLS = false;
    static final boolean DEFAULT_SPECIALIZE_FLOAT_VALUES = false;
    static final z DEFAULT_STRICTNESS = null;
    static final boolean DEFAULT_USE_JDK_UNSAFE = true;
    private static final String JSON_NON_EXECUTABLE_PREFIX = ")]}'\n";
    final List<i0> builderFactories;
    final List<i0> builderHierarchyFactories;
    final boolean complexMapKeySerialization;
    private final hn.c constructorConstructor;
    final String datePattern;
    final int dateStyle;
    final hn.e excluder;
    final List<i0> factories;
    final FieldNamingStrategy fieldNamingStrategy;
    final j formattingStyle;
    final boolean generateNonExecutableJson;
    final boolean htmlSafe;
    final Map<Type, Object> instanceCreators;
    private final in.l jsonAdapterFactory;
    final x longSerializationPolicy;
    final f0 numberToNumberStrategy;
    final f0 objectToNumberStrategy;
    final List<y> reflectionFilters;
    final boolean serializeNulls;
    final boolean serializeSpecialFloatingPointValues;
    final z strictness;
    private final ThreadLocal<Map<mn.a<?>, h0>> threadLocalAdapterResults;
    final int timeStyle;
    private final ConcurrentMap<mn.a<?>, h0> typeTokenCache;
    final boolean useJdkUnsafe;
    static final j DEFAULT_FORMATTING_STYLE = j.f34785d;
    static final String DEFAULT_DATE_PATTERN = null;
    static final FieldNamingStrategy DEFAULT_FIELD_NAMING_STRATEGY = i.f34782a;
    static final f0 DEFAULT_OBJECT_TO_NUMBER_STRATEGY = e0.f34778a;
    static final f0 DEFAULT_NUMBER_TO_NUMBER_STRATEGY = e0.f34779b;

    public class a extends h0 {
        @Override // com.google.gson.h0
        public final Object b(JsonReader jsonReader) throws IOException {
            if (jsonReader.peek() != JsonToken.NULL) {
                return Long.valueOf(jsonReader.nextLong());
            }
            jsonReader.nextNull();
            return null;
        }

        @Override // com.google.gson.h0
        public final void c(JsonWriter jsonWriter, Object obj) throws IOException {
            Number number = (Number) obj;
            if (number == null) {
                jsonWriter.nullValue();
            } else {
                jsonWriter.value(number.toString());
            }
        }
    }

    public static class b extends in.g0 {

        /* renamed from: a, reason: collision with root package name */
        public h0 f34777a = null;

        @Override // com.google.gson.h0
        public final Object b(JsonReader jsonReader) {
            h0 h0Var = this.f34777a;
            if (h0Var != null) {
                return h0Var.b(jsonReader);
            }
            throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        }

        @Override // com.google.gson.h0
        public final void c(JsonWriter jsonWriter, Object obj) {
            h0 h0Var = this.f34777a;
            if (h0Var == null) {
                throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
            }
            h0Var.c(jsonWriter, obj);
        }

        @Override // in.g0
        public final h0 d() {
            h0 h0Var = this.f34777a;
            if (h0Var != null) {
                return h0Var;
            }
            throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public Gson() {
        hn.e eVar = hn.e.f59902g;
        FieldNamingStrategy fieldNamingStrategy = DEFAULT_FIELD_NAMING_STRATEGY;
        Map map = Collections.EMPTY_MAP;
        j jVar = DEFAULT_FORMATTING_STYLE;
        z zVar = DEFAULT_STRICTNESS;
        String str = DEFAULT_DATE_PATTERN;
        List list = Collections.EMPTY_LIST;
        this(eVar, fieldNamingStrategy, map, false, false, false, true, jVar, zVar, false, true, x.f34798a, str, 2, 2, list, list, list, DEFAULT_OBJECT_TO_NUMBER_STRATEGY, DEFAULT_NUMBER_TO_NUMBER_STRATEGY, list);
    }

    private static void assertFullConsumption(Object obj, JsonReader jsonReader) {
        if (obj != null) {
            try {
                if (jsonReader.peek() == JsonToken.END_DOCUMENT) {
                } else {
                    throw new JsonSyntaxException("JSON document was not fully consumed.");
                }
            } catch (MalformedJsonException e3) {
                throw new JsonSyntaxException(e3);
            } catch (IOException e11) {
                throw new JsonIOException(e11);
            }
        }
    }

    private static h0 atomicLongAdapter(h0 h0Var) {
        return new l(h0Var, 0).a();
    }

    private static h0 atomicLongArrayAdapter(h0 h0Var) {
        return new l(h0Var, 1).a();
    }

    public static void checkValidFloatingPoint(double d5) {
        if (Double.isNaN(d5) || Double.isInfinite(d5)) {
            throw new IllegalArgumentException(d5 + " is not a valid double value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method.");
        }
    }

    private h0 doubleAdapter(boolean z11) {
        return z11 ? p1.f61738m : new k(0);
    }

    private h0 floatAdapter(boolean z11) {
        return z11 ? p1.f61737l : new k(1);
    }

    private static h0 longAdapter(x xVar) {
        return xVar == x.f34798a ? p1.f61736k : new a();
    }

    @Deprecated
    public hn.e excluder() {
        return this.excluder;
    }

    public FieldNamingStrategy fieldNamingStrategy() {
        return this.fieldNamingStrategy;
    }

    public <T> T fromJson(p pVar, Type type) throws JsonSyntaxException {
        return (T) fromJson(pVar, new mn.a<>(type));
    }

    public <T> h0 getAdapter(Class<T> cls) {
        return getAdapter(new mn.a<>(cls));
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public <T> h0 getDelegateAdapter(i0 i0Var, mn.a<T> aVar) {
        Objects.requireNonNull(i0Var, "skipPast must not be null");
        Objects.requireNonNull(aVar, "type must not be null");
        in.l lVar = this.jsonAdapterFactory;
        lVar.getClass();
        ConcurrentHashMap concurrentHashMap = lVar.f61722b;
        if (i0Var == in.l.f61719c) {
            i0Var = this.jsonAdapterFactory;
        } else {
            Class cls = aVar.f76504a;
            i0 i0Var2 = (i0) concurrentHashMap.get(cls);
            if (i0Var2 == null) {
                gn.b bVar = (gn.b) cls.getAnnotation(gn.b.class);
                if (bVar != null) {
                    Class clsValue = bVar.value();
                    if (i0.class.isAssignableFrom(clsValue)) {
                        i0 i0Var3 = (i0) lVar.f61721a.b(new mn.a(clsValue), true).a();
                        i0 i0Var4 = (i0) concurrentHashMap.putIfAbsent(cls, i0Var3);
                        if (i0Var4 != null) {
                            i0Var3 = i0Var4;
                        }
                        if (i0Var3 == i0Var) {
                        }
                    }
                }
            } else if (i0Var2 == i0Var) {
            }
        }
        boolean z11 = false;
        for (i0 i0Var5 : this.factories) {
            if (z11) {
                h0 h0VarA = i0Var5.a(this, aVar);
                if (h0VarA != null) {
                    return h0VarA;
                }
            } else if (i0Var5 == i0Var) {
                z11 = true;
            }
        }
        if (!z11) {
            return getAdapter(aVar);
        }
        throw new IllegalArgumentException("GSON cannot serialize or deserialize " + aVar);
    }

    public boolean htmlSafe() {
        return this.htmlSafe;
    }

    public GsonBuilder newBuilder() {
        return new GsonBuilder(this);
    }

    public JsonReader newJsonReader(Reader reader) {
        JsonReader jsonReader = new JsonReader(reader);
        z zVar = this.strictness;
        if (zVar == null) {
            zVar = z.f34801b;
        }
        jsonReader.setStrictness(zVar);
        return jsonReader;
    }

    public JsonWriter newJsonWriter(Writer writer) throws IOException {
        if (this.generateNonExecutableJson) {
            writer.write(JSON_NON_EXECUTABLE_PREFIX);
        }
        JsonWriter jsonWriter = new JsonWriter(writer);
        jsonWriter.setFormattingStyle(this.formattingStyle);
        jsonWriter.setHtmlSafe(this.htmlSafe);
        z zVar = this.strictness;
        if (zVar == null) {
            zVar = z.f34801b;
        }
        jsonWriter.setStrictness(zVar);
        jsonWriter.setSerializeNulls(this.serializeNulls);
        return jsonWriter;
    }

    public boolean serializeNulls() {
        return this.serializeNulls;
    }

    public void toJson(p pVar, Appendable appendable) throws JsonIOException {
        try {
            toJson(pVar, newJsonWriter(appendable instanceof Writer ? (Writer) appendable : new hn.r(appendable)));
        } catch (IOException e3) {
            throw new JsonIOException(e3);
        }
    }

    public p toJsonTree(Object obj) {
        return obj == null ? q.f34794a : toJsonTree(obj, obj.getClass());
    }

    public String toString() {
        return "{serializeNulls:" + this.serializeNulls + ",factories:" + this.factories + ",instanceCreators:" + this.constructorConstructor + "}";
    }

    public <T> T fromJson(JsonReader jsonReader, Type type) throws JsonSyntaxException, JsonIOException {
        return (T) fromJson(jsonReader, new mn.a<>(type));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> h0 getAdapter(mn.a<T> aVar) {
        boolean z11;
        Objects.requireNonNull(aVar, "type must not be null");
        h0 h0Var = this.typeTokenCache.get(aVar);
        if (h0Var != null) {
            return h0Var;
        }
        Map<? extends mn.a<?>, ? extends h0> map = this.threadLocalAdapterResults.get();
        if (map == null) {
            map = new HashMap<>();
            this.threadLocalAdapterResults.set(map);
            z11 = true;
        } else {
            h0 h0Var2 = (h0) map.get(aVar);
            if (h0Var2 != null) {
                return h0Var2;
            }
            z11 = false;
        }
        try {
            b bVar = new b();
            map.put(aVar, bVar);
            Iterator<i0> it = this.factories.iterator();
            h0 h0VarA = null;
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                h0VarA = it.next().a(this, aVar);
                if (h0VarA != null) {
                    if (bVar.f34777a == null) {
                        bVar.f34777a = h0VarA;
                        map.put(aVar, h0VarA);
                    } else {
                        throw new AssertionError("Delegate is already set");
                    }
                }
            }
            if (z11) {
                this.threadLocalAdapterResults.remove();
            }
            if (h0VarA != null) {
                if (z11) {
                    this.typeTokenCache.putAll(map);
                }
                return h0VarA;
            }
            throw new IllegalArgumentException("GSON (2.13.2) cannot handle " + aVar);
        } catch (Throwable th2) {
            if (z11) {
                this.threadLocalAdapterResults.remove();
            }
            throw th2;
        }
    }

    public p toJsonTree(Object obj, Type type) throws JsonIOException {
        in.s sVar = new in.s();
        toJson(obj, type, sVar);
        return sVar.a();
    }

    public <T> T fromJson(Reader reader, Type type) throws JsonSyntaxException, JsonIOException {
        return (T) fromJson(reader, new mn.a<>(type));
    }

    public Gson(hn.e eVar, FieldNamingStrategy fieldNamingStrategy, Map<Type, Object> map, boolean z11, boolean z12, boolean z13, boolean z14, j jVar, z zVar, boolean z15, boolean z16, x xVar, String str, int i5, int i11, List<i0> list, List<i0> list2, List<i0> list3, f0 f0Var, f0 f0Var2, List<y> list4) {
        in.d dVar;
        in.d dVar2;
        this.threadLocalAdapterResults = new ThreadLocal<>();
        this.typeTokenCache = new ConcurrentHashMap();
        this.excluder = eVar;
        this.fieldNamingStrategy = fieldNamingStrategy;
        this.instanceCreators = map;
        hn.c cVar = new hn.c(map, z16, list4);
        this.constructorConstructor = cVar;
        this.serializeNulls = z11;
        this.complexMapKeySerialization = z12;
        this.generateNonExecutableJson = z13;
        this.htmlSafe = z14;
        this.formattingStyle = jVar;
        this.strictness = zVar;
        this.serializeSpecialFloatingPointValues = z15;
        this.useJdkUnsafe = z16;
        this.longSerializationPolicy = xVar;
        this.datePattern = str;
        this.dateStyle = i5;
        this.timeStyle = i11;
        this.builderFactories = list;
        this.builderHierarchyFactories = list2;
        this.objectToNumberStrategy = f0Var;
        this.numberToNumberStrategy = f0Var2;
        this.reflectionFilters = list4;
        ArrayList arrayList = new ArrayList();
        arrayList.add(p1.C);
        if (f0Var == e0.f34778a) {
            dVar = in.y.f61771c;
        } else {
            dVar = new in.d(f0Var, 2);
        }
        arrayList.add(dVar);
        arrayList.add(eVar);
        arrayList.addAll(list3);
        arrayList.add(p1.f61741r);
        arrayList.add(p1.f61732g);
        arrayList.add(p1.f61729d);
        arrayList.add(p1.f61730e);
        arrayList.add(p1.f61731f);
        h0 h0VarLongAdapter = longAdapter(xVar);
        arrayList.add(new g1(Long.TYPE, Long.class, h0VarLongAdapter));
        arrayList.add(new g1(Double.TYPE, Double.class, doubleAdapter(z15)));
        arrayList.add(new g1(Float.TYPE, Float.class, floatAdapter(z15)));
        if (f0Var2 == e0.f34779b) {
            dVar2 = in.w.f61768b;
        } else {
            dVar2 = new in.d(new in.w(f0Var2), 1);
        }
        arrayList.add(dVar2);
        arrayList.add(p1.f61733h);
        arrayList.add(p1.f61734i);
        arrayList.add(new e1(AtomicLong.class, atomicLongAdapter(h0VarLongAdapter), 0));
        int i12 = 0;
        arrayList.add(new e1(AtomicLongArray.class, atomicLongArrayAdapter(h0VarLongAdapter), i12));
        arrayList.add(p1.f61735j);
        arrayList.add(p1.n);
        arrayList.add(p1.f61742s);
        arrayList.add(p1.f61743t);
        arrayList.add(new e1(BigDecimal.class, p1.o, i12));
        arrayList.add(new e1(BigInteger.class, p1.f61739p, i12));
        arrayList.add(new e1(hn.k.class, p1.f61740q, i12));
        arrayList.add(p1.f61744u);
        arrayList.add(p1.f61745v);
        arrayList.add(p1.f61747x);
        arrayList.add(p1.f61748y);
        arrayList.add(p1.A);
        arrayList.add(p1.f61746w);
        arrayList.add(p1.f61727b);
        arrayList.add(in.h.f61695c);
        arrayList.add(p1.f61749z);
        if (ln.f.f75060a) {
            arrayList.add(ln.f.f75064e);
            arrayList.add(ln.f.f75063d);
            arrayList.add(ln.f.f75065f);
        }
        arrayList.add(in.b.f61663c);
        arrayList.add(p1.f61726a);
        arrayList.add(new in.d(cVar, 0));
        arrayList.add(new in.u(cVar, z12));
        in.l lVar = new in.l(cVar);
        this.jsonAdapterFactory = lVar;
        arrayList.add(lVar);
        arrayList.add(p1.D);
        arrayList.add(new in.f0(cVar, fieldNamingStrategy, eVar, lVar, list4));
        this.factories = Collections.unmodifiableList(arrayList);
    }

    public <T> T fromJson(String str, Type type) throws JsonSyntaxException {
        return (T) fromJson(str, new mn.a<>(type));
    }

    public void toJson(Object obj, Type type, Appendable appendable) throws JsonIOException {
        try {
            toJson(obj, type, newJsonWriter(appendable instanceof Writer ? (Writer) appendable : new hn.r(appendable)));
        } catch (IOException e3) {
            throw new JsonIOException(e3);
        }
    }

    public <T> T fromJson(p pVar, Class<T> cls) throws JsonSyntaxException {
        return (T) fromJson(pVar, new mn.a<>(cls));
    }

    public <T> T fromJson(Reader reader, Class<T> cls) throws JsonSyntaxException, JsonIOException {
        return (T) fromJson(reader, new mn.a<>(cls));
    }

    public <T> T fromJson(String str, Class<T> cls) throws JsonSyntaxException {
        return (T) fromJson(str, new mn.a<>(cls));
    }

    public String toJson(Object obj) {
        if (obj == null) {
            return toJson((p) q.f34794a);
        }
        return toJson(obj, obj.getClass());
    }

    public <T> T fromJson(String str, mn.a<T> aVar) throws JsonSyntaxException {
        if (str == null) {
            return null;
        }
        return (T) fromJson(new StringReader(str), aVar);
    }

    public String toJson(Object obj, Type type) throws JsonIOException {
        StringBuilder sb2 = new StringBuilder();
        toJson(obj, type, sb2);
        return sb2.toString();
    }

    public <T> T fromJson(Reader reader, mn.a<T> aVar) throws JsonSyntaxException, JsonIOException {
        JsonReader jsonReaderNewJsonReader = newJsonReader(reader);
        T t6 = (T) fromJson(jsonReaderNewJsonReader, aVar);
        assertFullConsumption(t6, jsonReaderNewJsonReader);
        return t6;
    }

    public void toJson(Object obj, Appendable appendable) throws JsonIOException {
        if (obj != null) {
            toJson(obj, obj.getClass(), appendable);
        } else {
            toJson((p) q.f34794a, appendable);
        }
    }

    public <T> T fromJson(JsonReader jsonReader, mn.a<T> aVar) throws JsonSyntaxException, JsonIOException {
        boolean z11;
        z strictness = jsonReader.getStrictness();
        z zVar = this.strictness;
        if (zVar != null) {
            jsonReader.setStrictness(zVar);
        } else if (jsonReader.getStrictness() == z.f34801b) {
            jsonReader.setStrictness(z.f34800a);
        }
        try {
            try {
                try {
                    try {
                        jsonReader.peek();
                        z11 = false;
                        try {
                            h0 adapter = getAdapter(aVar);
                            T t6 = (T) adapter.b(jsonReader);
                            Class clsM = hn.h.m(aVar.f76504a);
                            if (t6 != null && !clsM.isInstance(t6)) {
                                throw new ClassCastException("Type adapter '" + adapter + "' returned wrong type; requested " + aVar.f76504a + " but got instance of " + t6.getClass() + "\nVerify that the adapter was registered for the correct type.");
                            }
                            return t6;
                        } catch (EOFException e3) {
                            e = e3;
                            if (z11) {
                                jsonReader.setStrictness(strictness);
                                return null;
                            }
                            throw new JsonSyntaxException(e);
                        }
                    } finally {
                        jsonReader.setStrictness(strictness);
                    }
                } catch (AssertionError e11) {
                    throw new AssertionError("AssertionError (GSON 2.13.2): " + e11.getMessage(), e11);
                }
            } catch (EOFException e12) {
                e = e12;
                z11 = true;
            }
        } catch (IOException e13) {
            throw new JsonSyntaxException(e13);
        } catch (IllegalStateException e14) {
            throw new JsonSyntaxException(e14);
        }
    }

    public void toJson(Object obj, Type type, JsonWriter jsonWriter) throws JsonIOException {
        h0 adapter = getAdapter(new mn.a(type));
        z strictness = jsonWriter.getStrictness();
        z zVar = this.strictness;
        if (zVar != null) {
            jsonWriter.setStrictness(zVar);
        } else if (jsonWriter.getStrictness() == z.f34801b) {
            jsonWriter.setStrictness(z.f34800a);
        }
        boolean zIsHtmlSafe = jsonWriter.isHtmlSafe();
        boolean serializeNulls = jsonWriter.getSerializeNulls();
        jsonWriter.setHtmlSafe(this.htmlSafe);
        jsonWriter.setSerializeNulls(this.serializeNulls);
        try {
            try {
                try {
                    adapter.c(jsonWriter, obj);
                } catch (IOException e3) {
                    throw new JsonIOException(e3);
                }
            } catch (AssertionError e11) {
                throw new AssertionError("AssertionError (GSON 2.13.2): " + e11.getMessage(), e11);
            }
        } finally {
            jsonWriter.setStrictness(strictness);
            jsonWriter.setHtmlSafe(zIsHtmlSafe);
            jsonWriter.setSerializeNulls(serializeNulls);
        }
    }

    public String toJson(p pVar) throws JsonIOException {
        StringBuilder sb2 = new StringBuilder();
        toJson(pVar, (Appendable) sb2);
        return sb2.toString();
    }

    public void toJson(p pVar, JsonWriter jsonWriter) throws JsonIOException {
        z strictness = jsonWriter.getStrictness();
        boolean zIsHtmlSafe = jsonWriter.isHtmlSafe();
        boolean serializeNulls = jsonWriter.getSerializeNulls();
        jsonWriter.setHtmlSafe(this.htmlSafe);
        jsonWriter.setSerializeNulls(this.serializeNulls);
        z zVar = this.strictness;
        if (zVar != null) {
            jsonWriter.setStrictness(zVar);
        } else if (jsonWriter.getStrictness() == z.f34801b) {
            jsonWriter.setStrictness(z.f34800a);
        }
        try {
            try {
                in.n nVar = p1.B;
                nVar.getClass();
                nVar.c(pVar, jsonWriter);
                jsonWriter.setStrictness(strictness);
                jsonWriter.setHtmlSafe(zIsHtmlSafe);
                jsonWriter.setSerializeNulls(serializeNulls);
            } catch (IOException e3) {
                throw new JsonIOException(e3);
            } catch (AssertionError e11) {
                throw new AssertionError("AssertionError (GSON 2.13.2): " + e11.getMessage(), e11);
            }
        } catch (Throwable th2) {
            jsonWriter.setStrictness(strictness);
            jsonWriter.setHtmlSafe(zIsHtmlSafe);
            jsonWriter.setSerializeNulls(serializeNulls);
            throw th2;
        }
    }

    public <T> T fromJson(p pVar, mn.a<T> aVar) throws JsonSyntaxException {
        if (pVar == null) {
            return null;
        }
        in.q qVar = new in.q(in.q.f61750e);
        qVar.f61752a = new Object[32];
        qVar.f61753b = 0;
        qVar.f61754c = new String[32];
        qVar.f61755d = new int[32];
        qVar.f(pVar);
        return (T) fromJson(qVar, aVar);
    }
}
