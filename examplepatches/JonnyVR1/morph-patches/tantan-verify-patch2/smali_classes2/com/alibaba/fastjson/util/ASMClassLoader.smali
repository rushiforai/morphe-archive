.class public Lcom/alibaba/fastjson/util/ASMClassLoader;
.super Ljava/lang/ClassLoader;
.source "SourceFile"


# static fields
.field private static DOMAIN:Ljava/security/ProtectionDomain;

.field private static classMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 57

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/util/ASMClassLoader;->classMapping:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Lcom/alibaba/fastjson/util/ASMClassLoader$1;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/alibaba/fastjson/util/ASMClassLoader$1;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/security/ProtectionDomain;

    .line 18
    .line 19
    sput-object v0, Lcom/alibaba/fastjson/util/ASMClassLoader;->DOMAIN:Ljava/security/ProtectionDomain;

    .line 20
    .line 21
    const-class v55, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 22
    .line 23
    const-class v56, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 24
    .line 25
    const-class v1, Lcom/alibaba/fastjson/JSON;

    .line 26
    .line 27
    const-class v2, Lcom/alibaba/fastjson/JSONObject;

    .line 28
    .line 29
    const-class v3, Lcom/alibaba/fastjson/JSONArray;

    .line 30
    .line 31
    const-class v4, Lcom/alibaba/fastjson/JSONPath;

    .line 32
    .line 33
    const-class v5, Lcom/alibaba/fastjson/JSONAware;

    .line 34
    .line 35
    const-class v6, Lcom/alibaba/fastjson/JSONException;

    .line 36
    .line 37
    const-class v7, Lcom/alibaba/fastjson/JSONPathException;

    .line 38
    .line 39
    const-class v8, Lcom/alibaba/fastjson/JSONReader;

    .line 40
    .line 41
    const-class v9, Lcom/alibaba/fastjson/JSONStreamAware;

    .line 42
    .line 43
    const-class v10, Lcom/alibaba/fastjson/JSONWriter;

    .line 44
    .line 45
    const-class v11, Lcom/alibaba/fastjson/TypeReference;

    .line 46
    .line 47
    const-class v12, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 48
    .line 49
    const-class v13, Lcom/alibaba/fastjson/util/TypeUtils;

    .line 50
    .line 51
    const-class v14, Lcom/alibaba/fastjson/util/IOUtils;

    .line 52
    .line 53
    const-class v15, Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 54
    .line 55
    const-class v16, Lcom/alibaba/fastjson/util/ParameterizedTypeImpl;

    .line 56
    .line 57
    const-class v17, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 58
    .line 59
    const-class v18, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 60
    .line 61
    const-class v19, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .line 62
    .line 63
    const-class v20, Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    .line 64
    .line 65
    const-class v21, Lcom/alibaba/fastjson/serializer/SerializeBeanInfo;

    .line 66
    .line 67
    const-class v22, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    .line 68
    .line 69
    const-class v23, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 70
    .line 71
    const-class v24, Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 72
    .line 73
    const-class v25, Lcom/alibaba/fastjson/serializer/Labels;

    .line 74
    .line 75
    const-class v26, Lcom/alibaba/fastjson/serializer/LabelFilter;

    .line 76
    .line 77
    const-class v27, Lcom/alibaba/fastjson/serializer/ContextValueFilter;

    .line 78
    .line 79
    const-class v28, Lcom/alibaba/fastjson/serializer/AfterFilter;

    .line 80
    .line 81
    const-class v29, Lcom/alibaba/fastjson/serializer/BeforeFilter;

    .line 82
    .line 83
    const-class v30, Lcom/alibaba/fastjson/serializer/NameFilter;

    .line 84
    .line 85
    const-class v31, Lcom/alibaba/fastjson/serializer/PropertyFilter;

    .line 86
    .line 87
    const-class v32, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;

    .line 88
    .line 89
    const-class v33, Lcom/alibaba/fastjson/serializer/ValueFilter;

    .line 90
    .line 91
    const-class v34, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 92
    .line 93
    const-class v35, Lcom/alibaba/fastjson/serializer/ContextObjectSerializer;

    .line 94
    .line 95
    const-class v36, Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 96
    .line 97
    const-class v37, Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 98
    .line 99
    const-class v38, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 100
    .line 101
    const-class v39, Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 102
    .line 103
    const-class v40, Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .line 104
    .line 105
    const-class v41, Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 106
    .line 107
    const-class v42, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .line 108
    .line 109
    const-class v43, Lcom/alibaba/fastjson/parser/ParseContext;

    .line 110
    .line 111
    const-class v44, Lcom/alibaba/fastjson/parser/JSONToken;

    .line 112
    .line 113
    const-class v45, Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 114
    .line 115
    const-class v46, Lcom/alibaba/fastjson/parser/Feature;

    .line 116
    .line 117
    const-class v47, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 118
    .line 119
    const-class v48, Lcom/alibaba/fastjson/parser/JSONReaderScanner;

    .line 120
    .line 121
    const-class v49, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;

    .line 122
    .line 123
    const-class v50, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 124
    .line 125
    const-class v51, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessor;

    .line 126
    .line 127
    const-class v52, Lcom/alibaba/fastjson/parser/deserializer/ExtraProcessable;

    .line 128
    .line 129
    const-class v53, Lcom/alibaba/fastjson/parser/deserializer/ExtraTypeProvider;

    .line 130
    .line 131
    const-class v54, Lcom/alibaba/fastjson/serializer/BeanContext;

    .line 132
    .line 133
    filled-new-array/range {v1 .. v56}, [Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const/4 v1, 0x0

    .line 138
    :goto_0
    const/16 v2, 0x38

    .line 139
    .line 140
    if-ge v1, v2, :cond_0

    .line 141
    .line 142
    aget-object v2, v0, v1

    .line 143
    .line 144
    sget-object v3, Lcom/alibaba/fastjson/util/ASMClassLoader;->classMapping:Ljava/util/Map;

    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    add-int/lit8 v1, v1, 0x1

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/alibaba/fastjson/util/ASMClassLoader;->getParentClassLoader()Ljava/lang/ClassLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    return-void
.end method

.method public static getParentClassLoader()Ljava/lang/ClassLoader;
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-class v1, Lcom/alibaba/fastjson/JSON;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :catch_0
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method


# virtual methods
.method public defineClassPublic(Ljava/lang/String;[BII)Ljava/lang/Class;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[BII)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassFormatError;
        }
    .end annotation

    .line 1
    sget-object v5, Lcom/alibaba/fastjson/util/ASMClassLoader;->DOMAIN:Ljava/security/ProtectionDomain;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    invoke-virtual/range {v0 .. v5}, Ljava/lang/ClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public isExternalClass(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    :goto_0
    if-eqz p0, :cond_2

    .line 10
    .line 11
    if-ne p0, p1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    invoke-virtual {p0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    goto :goto_0

    .line 19
    :cond_2
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/util/ASMClassLoader;->classMapping:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Class;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;Z)Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
