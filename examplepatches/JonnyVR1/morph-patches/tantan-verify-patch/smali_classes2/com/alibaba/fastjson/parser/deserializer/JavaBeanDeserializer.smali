.class public Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# instance fields
.field private final alterNameFieldDeserializers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;",
            ">;"
        }
    .end annotation
.end field

.field public final beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

.field protected final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private extraFieldDeserializers:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private fieldDeserializerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;",
            ">;"
        }
    .end annotation
.end field

.field private final fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

.field private transient hashArray:[J

.field private transient hashArrayMapping:[S

.field private transient smartMatchHashArray:[J

.field private transient smartMatchHashArrayMapping:[S

.field protected final sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 9
    .line 10
    iget-object v0, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 11
    .line 12
    array-length v1, v0

    .line 13
    new-array v1, v1, [Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 16
    .line 17
    array-length v0, v0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    move v3, v2

    .line 21
    :goto_0
    if-ge v3, v0, :cond_4

    .line 22
    .line 23
    iget-object v4, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 24
    .line 25
    aget-object v4, v4, v3

    .line 26
    .line 27
    invoke-virtual {p1, p1, p2, v4}, Lcom/alibaba/fastjson/parser/ParserConfig;->createFieldDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 32
    .line 33
    aput-object v5, v6, v3

    .line 34
    .line 35
    const/16 v6, 0x80

    .line 36
    .line 37
    if-le v0, v6, :cond_1

    .line 38
    .line 39
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializerMap:Ljava/util/Map;

    .line 40
    .line 41
    if-nez v6, :cond_0

    .line 42
    .line 43
    new-instance v6, Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializerMap:Ljava/util/Map;

    .line 49
    .line 50
    :cond_0
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializerMap:Ljava/util/Map;

    .line 51
    .line 52
    iget-object v7, v4, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v4, v4, Lcom/alibaba/fastjson/util/FieldInfo;->alternateNames:[Ljava/lang/String;

    .line 58
    .line 59
    array-length v6, v4

    .line 60
    move v7, v2

    .line 61
    :goto_1
    if-ge v7, v6, :cond_3

    .line 62
    .line 63
    aget-object v8, v4, v7

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    new-instance v1, Ljava/util/HashMap;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 70
    .line 71
    .line 72
    :cond_2
    invoke-interface {v1, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    add-int/lit8 v7, v7, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->alterNameFieldDeserializers:Ljava/util/Map;

    .line 82
    .line 83
    iget-object p1, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 84
    .line 85
    array-length v0, p1

    .line 86
    new-array v0, v0, [Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 89
    .line 90
    array-length p1, p1

    .line 91
    :goto_2
    if-ge v2, p1, :cond_5

    .line 92
    .line 93
    iget-object v0, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 94
    .line 95
    aget-object v0, v0, v2

    .line 96
    .line 97
    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 104
    .line 105
    aput-object v0, v1, v2

    .line 106
    .line 107
    add-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 114
    invoke-direct {p0, p1, p2, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .line 111
    iget-object v2, p1, Lcom/alibaba/fastjson/parser/ParserConfig;->propertyNamingStrategy:Lcom/alibaba/fastjson/PropertyNamingStrategy;

    iget-boolean v3, p1, Lcom/alibaba/fastjson/parser/ParserConfig;->fieldBased:Z

    iget-boolean v4, p1, Lcom/alibaba/fastjson/parser/ParserConfig;->compatibleWithJavaBean:Z

    .line 112
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->isJacksonCompatible()Z

    move-result v5

    move-object v0, p2

    move-object v1, p3

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-result-object p2

    .line 113
    invoke-direct {p0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;)V

    return-void
.end method

.method private createFactoryInstance(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    .locals 6

    .line 1
    iget-object p1, p1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {p1}, Lcom/alibaba/fastjson/annotation/JSONType;->seeAlso()[Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    array-length v1, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_3

    .line 14
    .line 15
    aget-object v3, p1, v2

    .line 16
    .line 17
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    instance-of v4, v3, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 22
    .line 23
    if-eqz v4, :cond_2

    .line 24
    .line 25
    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 26
    .line 27
    iget-object v4, v3, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 28
    .line 29
    iget-object v5, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_1

    .line 36
    .line 37
    return-object v3

    .line 38
    :cond_1
    invoke-static {p0, v4, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    if-eqz v3, :cond_2

    .line 43
    .line 44
    return-object v3

    .line 45
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    return-object v0
.end method

.method public static isSetFlag(I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    div-int/lit8 v1, p0, 0x20

    .line 6
    .line 7
    rem-int/lit8 p0, p0, 0x20

    .line 8
    .line 9
    array-length v2, p1

    .line 10
    if-ge v1, v2, :cond_1

    .line 11
    .line 12
    aget p1, p1, v1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    shl-int p0, v1, p0

    .line 16
    .line 17
    and-int/2addr p0, p1

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    return v0
.end method

.method public static parseArray(Ljava/util/Collection;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object p4, p2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    check-cast p4, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    const/16 v2, 0x10

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/16 v1, 0xe

    .line 23
    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->throwException(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/16 v3, 0x5b

    .line 34
    .line 35
    if-ne v0, v3, :cond_2

    .line 36
    .line 37
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 38
    .line 39
    .line 40
    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/16 v4, 0xf

    .line 52
    .line 53
    if-ne v0, v4, :cond_3

    .line 54
    .line 55
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    const/4 v0, 0x0

    .line 60
    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-interface {p1, p2, p3, v5}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-interface {p0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-ne v5, v2, :cond_5

    .line 78
    .line 79
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-ne v5, v3, :cond_4

    .line 84
    .line 85
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 86
    .line 87
    .line 88
    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_4
    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_5
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eq p0, v4, :cond_6

    .line 101
    .line 102
    invoke-virtual {p2, p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->throwException(I)V

    .line 103
    .line 104
    .line 105
    :cond_6
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    const/16 p1, 0x2c

    .line 110
    .line 111
    if-ne p0, p1, :cond_7

    .line 112
    .line 113
    invoke-virtual {p4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 114
    .line 115
    .line 116
    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setToken(I)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_7
    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
.method public check(Lcom/alibaba/fastjson/parser/JSONLexer;I)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ne p0, p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "syntax error"

    .line 9
    .line 10
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 9

    .line 644
    const-string v0, "create instance error, class "

    instance-of v1, p2, Ljava/lang/Class;

    if-eqz v1, :cond_0

    .line 645
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 646
    check-cast p2, Ljava/lang/Class;

    .line 647
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    .line 648
    new-instance p1, Lcom/alibaba/fastjson/JSONObject;

    invoke-direct {p1}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 649
    filled-new-array {p2}, [Ljava/lang/Class;

    move-result-object p2

    invoke-static {p0, p2, p1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 650
    :cond_0
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v2, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    const/4 v3, 0x0

    if-nez v2, :cond_1

    iget-object v4, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    if-nez v4, :cond_1

    return-object v3

    .line 651
    :cond_1
    iget-object v4, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    if-eqz v4, :cond_2

    iget v5, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    if-lez v5, :cond_2

    return-object v3

    .line 652
    :cond_2
    :try_start_0
    iget v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    const/4 v5, 0x0

    if-nez v1, :cond_4

    if-eqz v2, :cond_3

    .line 653
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto/16 :goto_1

    :catch_0
    move-exception p1

    goto/16 :goto_4

    .line 654
    :cond_3
    invoke-virtual {v4, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto/16 :goto_1

    .line 655
    :cond_4
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v1
    :try_end_0
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 656
    const-string v4, "can\'t create non-static inner class instance."

    if-eqz v1, :cond_d

    :try_start_1
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v6, :cond_d

    .line 657
    instance-of v6, p2, Ljava/lang/Class;

    if-eqz v6, :cond_c

    .line 658
    check-cast p2, Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const/16 v6, 0x24

    .line 659
    invoke-virtual {p2, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 660
    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 661
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 662
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 663
    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 664
    iget-object v1, v1, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    if-eqz v1, :cond_7

    .line 665
    iget-object v8, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v8, :cond_7

    const-string v8, "java.util.ArrayList"

    .line 666
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "java.util.List"

    .line 667
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "java.util.Collection"

    .line 668
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "java.util.Map"

    .line 669
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    const-string v8, "java.util.HashMap"

    .line 670
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 671
    :cond_5
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 672
    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 673
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    goto :goto_0

    :cond_6
    move-object v6, v3

    :cond_7
    :goto_0
    if-eqz v6, :cond_b

    .line 674
    instance-of p2, v6, Ljava/util/Collection;

    if-eqz p2, :cond_8

    move-object p2, v6

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_b

    .line 675
    :cond_8
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2
    :try_end_1
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    if-eqz p1, :cond_a

    .line 676
    iget-object p1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    .line 677
    invoke-interface {p1, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 678
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object p1, p1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v1, p1

    :goto_2
    if-ge v5, v1, :cond_a

    aget-object v2, p1, v5

    .line 679
    iget-object v4, v2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    if-ne v4, v6, :cond_9

    .line 680
    :try_start_2
    const-string v4, ""

    invoke-virtual {v2, p2, v4}, Lcom/alibaba/fastjson/util/FieldInfo;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception p1

    .line 681
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v3

    :cond_9
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_a
    return-object p2

    .line 682
    :cond_b
    :try_start_3
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    invoke-direct {p1, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 683
    :cond_c
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    invoke-direct {p1, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 684
    :cond_d
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    invoke-direct {p1, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 685
    :goto_4
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v3

    :catch_2
    move-exception p0

    .line 686
    throw p0
.end method

.method public createInstance(Ljava/util/Map;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    iget-object v2, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 6
    .line 7
    iget-object v3, v2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 8
    .line 9
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 10
    .line 11
    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 12
    .line 13
    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 14
    .line 15
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    const/4 v10, 0x0

    .line 21
    if-nez v3, :cond_11

    .line 22
    .line 23
    iget-object v3, v2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 24
    .line 25
    if-nez v3, :cond_11

    .line 26
    .line 27
    iget-object v2, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 28
    .line 29
    invoke-virtual {v1, v10, v2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v11

    .line 45
    if-eqz v11, :cond_f

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v11

    .line 51
    check-cast v11, Ljava/util/Map$Entry;

    .line 52
    .line 53
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    check-cast v12, Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v11

    .line 63
    invoke-virtual {v1, v12}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatch(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 64
    .line 65
    .line 66
    move-result-object v12

    .line 67
    if-nez v12, :cond_0

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iget-object v13, v12, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 71
    .line 72
    iget-object v14, v13, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 73
    .line 74
    iget-object v15, v13, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 75
    .line 76
    if-eqz v14, :cond_2

    .line 77
    .line 78
    invoke-virtual {v14}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    if-ne v10, v8, :cond_3

    .line 83
    .line 84
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 85
    .line 86
    if-ne v11, v10, :cond_1

    .line 87
    .line 88
    invoke-virtual {v14, v2, v9}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 89
    .line 90
    .line 91
    :goto_1
    const/4 v10, 0x0

    .line 92
    goto :goto_0

    .line 93
    :cond_1
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 94
    .line 95
    if-ne v11, v10, :cond_2

    .line 96
    .line 97
    const/4 v10, 0x1

    .line 98
    invoke-virtual {v14, v2, v10}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    move/from16 v17, v9

    .line 103
    .line 104
    goto/16 :goto_5

    .line 105
    .line 106
    :cond_3
    if-ne v10, v7, :cond_4

    .line 107
    .line 108
    instance-of v10, v11, Ljava/lang/Number;

    .line 109
    .line 110
    if-eqz v10, :cond_2

    .line 111
    .line 112
    check-cast v11, Ljava/lang/Number;

    .line 113
    .line 114
    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v10

    .line 118
    invoke-virtual {v14, v2, v10}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    if-ne v10, v6, :cond_5

    .line 123
    .line 124
    instance-of v10, v11, Ljava/lang/Number;

    .line 125
    .line 126
    if-eqz v10, :cond_2

    .line 127
    .line 128
    check-cast v11, Ljava/lang/Number;

    .line 129
    .line 130
    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    .line 131
    .line 132
    .line 133
    move-result-wide v10

    .line 134
    invoke-virtual {v14, v2, v10, v11}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_5
    move/from16 v17, v9

    .line 139
    .line 140
    const/16 v9, 0xa

    .line 141
    .line 142
    if-ne v10, v5, :cond_8

    .line 143
    .line 144
    instance-of v10, v11, Ljava/lang/Number;

    .line 145
    .line 146
    if-eqz v10, :cond_6

    .line 147
    .line 148
    check-cast v11, Ljava/lang/Number;

    .line 149
    .line 150
    invoke-virtual {v11}, Ljava/lang/Number;->floatValue()F

    .line 151
    .line 152
    .line 153
    move-result v9

    .line 154
    invoke-virtual {v14, v2, v9}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 155
    .line 156
    .line 157
    :goto_2
    move/from16 v9, v17

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_6
    instance-of v10, v11, Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v10, :cond_c

    .line 163
    .line 164
    check-cast v11, Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 167
    .line 168
    .line 169
    move-result v10

    .line 170
    if-gt v10, v9, :cond_7

    .line 171
    .line 172
    invoke-static {v11}, Lcom/alibaba/fastjson/util/TypeUtils;->parseFloat(Ljava/lang/String;)F

    .line 173
    .line 174
    .line 175
    move-result v9

    .line 176
    goto :goto_3

    .line 177
    :cond_7
    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 178
    .line 179
    .line 180
    move-result v9

    .line 181
    :goto_3
    invoke-virtual {v14, v2, v9}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_8
    if-ne v10, v4, :cond_b

    .line 186
    .line 187
    instance-of v10, v11, Ljava/lang/Number;

    .line 188
    .line 189
    if-eqz v10, :cond_9

    .line 190
    .line 191
    check-cast v11, Ljava/lang/Number;

    .line 192
    .line 193
    invoke-virtual {v11}, Ljava/lang/Number;->doubleValue()D

    .line 194
    .line 195
    .line 196
    move-result-wide v9

    .line 197
    invoke-virtual {v14, v2, v9, v10}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V

    .line 198
    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_9
    instance-of v10, v11, Ljava/lang/String;

    .line 202
    .line 203
    if-eqz v10, :cond_c

    .line 204
    .line 205
    check-cast v11, Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 208
    .line 209
    .line 210
    move-result v10

    .line 211
    if-gt v10, v9, :cond_a

    .line 212
    .line 213
    invoke-static {v11}, Lcom/alibaba/fastjson/util/TypeUtils;->parseDouble(Ljava/lang/String;)D

    .line 214
    .line 215
    .line 216
    move-result-wide v9

    .line 217
    goto :goto_4

    .line 218
    :cond_a
    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 219
    .line 220
    .line 221
    move-result-wide v9

    .line 222
    :goto_4
    invoke-virtual {v14, v2, v9, v10}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_b
    if-eqz v11, :cond_c

    .line 227
    .line 228
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 229
    .line 230
    .line 231
    move-result-object v9

    .line 232
    if-ne v15, v9, :cond_c

    .line 233
    .line 234
    invoke-virtual {v14, v2, v11}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_c
    :goto_5
    iget-object v9, v13, Lcom/alibaba/fastjson/util/FieldInfo;->format:Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v9, :cond_d

    .line 241
    .line 242
    const-class v10, Ljava/util/Date;

    .line 243
    .line 244
    if-ne v15, v10, :cond_d

    .line 245
    .line 246
    invoke-static {v11, v9}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Date;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    goto :goto_6

    .line 251
    :cond_d
    instance-of v9, v15, Ljava/lang/reflect/ParameterizedType;

    .line 252
    .line 253
    if-eqz v9, :cond_e

    .line 254
    .line 255
    check-cast v15, Ljava/lang/reflect/ParameterizedType;

    .line 256
    .line 257
    invoke-static {v11, v15, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/ParameterizedType;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v9

    .line 261
    goto :goto_6

    .line 262
    :cond_e
    invoke-static {v11, v15, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v9

    .line 266
    :goto_6
    invoke-virtual {v12, v2, v9}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_f
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 271
    .line 272
    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;

    .line 273
    .line 274
    if-eqz v0, :cond_10

    .line 275
    .line 276
    const/4 v1, 0x0

    .line 277
    :try_start_0
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    return-object v0

    .line 282
    :catch_0
    move-exception v0

    .line 283
    const-string v2, "build object error"

    .line 284
    .line 285
    invoke-static {v2, v0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 286
    .line 287
    .line 288
    return-object v1

    .line 289
    :cond_10
    return-object v2

    .line 290
    :cond_11
    move/from16 v17, v9

    .line 291
    .line 292
    iget-object v0, v2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 293
    .line 294
    array-length v2, v0

    .line 295
    new-array v3, v2, [Ljava/lang/Object;

    .line 296
    .line 297
    move/from16 v10, v17

    .line 298
    .line 299
    const/4 v9, 0x0

    .line 300
    :goto_7
    if-ge v10, v2, :cond_1c

    .line 301
    .line 302
    aget-object v11, v0, v10

    .line 303
    .line 304
    iget-object v12, v11, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 305
    .line 306
    move-object/from16 v13, p1

    .line 307
    .line 308
    invoke-interface {v13, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v12

    .line 312
    if-nez v12, :cond_1b

    .line 313
    .line 314
    iget-object v14, v11, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 315
    .line 316
    if-ne v14, v7, :cond_12

    .line 317
    .line 318
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 319
    .line 320
    .line 321
    move-result-object v12

    .line 322
    goto :goto_8

    .line 323
    :cond_12
    if-ne v14, v6, :cond_13

    .line 324
    .line 325
    const-wide/16 v14, 0x0

    .line 326
    .line 327
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 328
    .line 329
    .line 330
    move-result-object v12

    .line 331
    goto :goto_8

    .line 332
    :cond_13
    sget-object v15, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 333
    .line 334
    if-ne v14, v15, :cond_14

    .line 335
    .line 336
    invoke-static/range {v17 .. v17}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 337
    .line 338
    .line 339
    move-result-object v12

    .line 340
    goto :goto_8

    .line 341
    :cond_14
    sget-object v15, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 342
    .line 343
    if-ne v14, v15, :cond_15

    .line 344
    .line 345
    invoke-static/range {v17 .. v17}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 346
    .line 347
    .line 348
    move-result-object v12

    .line 349
    goto :goto_8

    .line 350
    :cond_15
    if-ne v14, v5, :cond_16

    .line 351
    .line 352
    const/4 v12, 0x0

    .line 353
    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 354
    .line 355
    .line 356
    move-result-object v12

    .line 357
    goto :goto_8

    .line 358
    :cond_16
    if-ne v14, v4, :cond_17

    .line 359
    .line 360
    const-wide/16 v14, 0x0

    .line 361
    .line 362
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 363
    .line 364
    .line 365
    move-result-object v12

    .line 366
    goto :goto_8

    .line 367
    :cond_17
    sget-object v15, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 368
    .line 369
    if-ne v14, v15, :cond_18

    .line 370
    .line 371
    const/16 v12, 0x30

    .line 372
    .line 373
    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 374
    .line 375
    .line 376
    move-result-object v12

    .line 377
    goto :goto_8

    .line 378
    :cond_18
    if-ne v14, v8, :cond_19

    .line 379
    .line 380
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 381
    .line 382
    :cond_19
    :goto_8
    if-nez v9, :cond_1a

    .line 383
    .line 384
    new-instance v9, Ljava/util/HashMap;

    .line 385
    .line 386
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 387
    .line 388
    .line 389
    :cond_1a
    iget-object v11, v11, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 390
    .line 391
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 392
    .line 393
    .line 394
    move-result-object v14

    .line 395
    invoke-interface {v9, v11, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    :cond_1b
    aput-object v12, v3, v10

    .line 399
    .line 400
    add-int/lit8 v10, v10, 0x1

    .line 401
    .line 402
    goto :goto_7

    .line 403
    :cond_1c
    move-object/from16 v13, p1

    .line 404
    .line 405
    if-eqz v9, :cond_1e

    .line 406
    .line 407
    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    :cond_1d
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 416
    .line 417
    .line 418
    move-result v4

    .line 419
    if-eqz v4, :cond_1e

    .line 420
    .line 421
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v4

    .line 425
    check-cast v4, Ljava/util/Map$Entry;

    .line 426
    .line 427
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v5

    .line 431
    check-cast v5, Ljava/lang/String;

    .line 432
    .line 433
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v4

    .line 437
    invoke-virtual {v1, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatch(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 438
    .line 439
    .line 440
    move-result-object v5

    .line 441
    if-eqz v5, :cond_1d

    .line 442
    .line 443
    iget-object v5, v5, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 444
    .line 445
    iget-object v5, v5, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 446
    .line 447
    invoke-interface {v9, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object v5

    .line 451
    check-cast v5, Ljava/lang/Integer;

    .line 452
    .line 453
    if-eqz v5, :cond_1d

    .line 454
    .line 455
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 456
    .line 457
    .line 458
    move-result v5

    .line 459
    aput-object v4, v3, v5

    .line 460
    .line 461
    goto :goto_9

    .line 462
    :cond_1e
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 463
    .line 464
    iget-object v4, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 465
    .line 466
    if-eqz v4, :cond_23

    .line 467
    .line 468
    iget-boolean v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlin:Z

    .line 469
    .line 470
    const-string v4, "create instance error, "

    .line 471
    .line 472
    if-eqz v0, :cond_22

    .line 473
    .line 474
    move/from16 v0, v17

    .line 475
    .line 476
    :goto_a
    if-ge v0, v2, :cond_22

    .line 477
    .line 478
    aget-object v5, v3, v0

    .line 479
    .line 480
    if-nez v5, :cond_21

    .line 481
    .line 482
    iget-object v5, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 483
    .line 484
    iget-object v6, v5, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 485
    .line 486
    if-eqz v6, :cond_21

    .line 487
    .line 488
    array-length v7, v6

    .line 489
    if-ge v0, v7, :cond_21

    .line 490
    .line 491
    aget-object v0, v6, v0

    .line 492
    .line 493
    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 494
    .line 495
    const-class v6, Ljava/lang/String;

    .line 496
    .line 497
    if-ne v0, v6, :cond_22

    .line 498
    .line 499
    iget-object v0, v5, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlinDefaultConstructor:Ljava/lang/reflect/Constructor;

    .line 500
    .line 501
    if-eqz v0, :cond_22

    .line 502
    .line 503
    const/4 v5, 0x0

    .line 504
    :try_start_1
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    move/from16 v9, v17

    .line 509
    .line 510
    :goto_b
    if-ge v9, v2, :cond_20

    .line 511
    .line 512
    aget-object v5, v3, v9

    .line 513
    .line 514
    if-eqz v5, :cond_1f

    .line 515
    .line 516
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 517
    .line 518
    iget-object v6, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 519
    .line 520
    if-eqz v6, :cond_1f

    .line 521
    .line 522
    array-length v7, v6

    .line 523
    if-ge v9, v7, :cond_1f

    .line 524
    .line 525
    aget-object v6, v6, v9

    .line 526
    .line 527
    invoke-virtual {v6, v0, v5}, Lcom/alibaba/fastjson/util/FieldInfo;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 528
    .line 529
    .line 530
    goto :goto_c

    .line 531
    :catch_1
    move-exception v0

    .line 532
    goto :goto_d

    .line 533
    :cond_1f
    :goto_c
    add-int/lit8 v9, v9, 0x1

    .line 534
    .line 535
    goto :goto_b

    .line 536
    :cond_20
    return-object v0

    .line 537
    :goto_d
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    .line 538
    .line 539
    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 540
    .line 541
    iget-object v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 542
    .line 543
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->toGenericString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    new-instance v3, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    .line 554
    .line 555
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v1

    .line 559
    invoke-direct {v2, v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 560
    .line 561
    .line 562
    throw v2

    .line 563
    :cond_21
    add-int/lit8 v0, v0, 0x1

    .line 564
    .line 565
    goto :goto_a

    .line 566
    :cond_22
    :try_start_2
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 567
    .line 568
    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 569
    .line 570
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 574
    return-object v0

    .line 575
    :catch_2
    move-exception v0

    .line 576
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    .line 577
    .line 578
    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 579
    .line 580
    iget-object v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 581
    .line 582
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->toGenericString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v1

    .line 586
    new-instance v3, Ljava/lang/StringBuilder;

    .line 587
    .line 588
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v1

    .line 598
    invoke-direct {v2, v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 599
    .line 600
    .line 601
    throw v2

    .line 602
    :cond_23
    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 603
    .line 604
    if-eqz v0, :cond_24

    .line 605
    .line 606
    const/4 v5, 0x0

    .line 607
    :try_start_3
    invoke-virtual {v0, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    .line 609
    .line 610
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 611
    return-object v0

    .line 612
    :catch_3
    move-exception v0

    .line 613
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    .line 614
    .line 615
    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 616
    .line 617
    iget-object v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 618
    .line 619
    new-instance v3, Ljava/lang/StringBuilder;

    .line 620
    .line 621
    const-string v4, "create factory method error, "

    .line 622
    .line 623
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 631
    .line 632
    .line 633
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v1

    .line 637
    invoke-direct {v2, v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 638
    .line 639
    .line 640
    throw v2

    .line 641
    :cond_24
    const/16 v16, 0x0

    .line 642
    .line 643
    return-object v16
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 278
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "I)TT;"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    .line 277
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I[I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I[I)Ljava/lang/Object;
    .locals 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "I[I)TT;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v5, p2

    move-object/from16 v0, p3

    const-wide/16 v8, 0x0

    .line 1
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const/4 v11, 0x0

    .line 2
    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    const-wide/16 v13, 0x0

    .line 3
    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v15

    const/4 v3, 0x0

    .line 4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    .line 5
    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v17

    .line 6
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v18

    .line 7
    const-class v4, Lcom/alibaba/fastjson/JSON;

    if-eq v5, v4, :cond_9a

    const-class v4, Lcom/alibaba/fastjson/JSONObject;

    if-ne v5, v4, :cond_0

    goto/16 :goto_5c

    .line 8
    :cond_0
    iget-object v4, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    check-cast v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;

    .line 9
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v6

    .line 10
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v7

    move-wide/from16 v19, v8

    const/16 v8, 0x8

    const/16 v9, 0x10

    move/from16 v21, v11

    const/4 v11, 0x0

    if-ne v7, v8, :cond_1

    .line 11
    invoke-virtual {v4, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    return-object v11

    .line 12
    :cond_1
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v8

    if-eqz p4, :cond_2

    if-eqz v8, :cond_2

    .line 13
    iget-object v8, v8, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    :cond_2
    move-wide/from16 v22, v13

    const/16 v13, 0xd

    if-ne v7, v13, :cond_4

    .line 14
    :try_start_0
    invoke-virtual {v4, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    if-nez p4, :cond_3

    .line 15
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object/from16 v4, p4

    :goto_0
    move-object v9, v8

    goto/16 :goto_5b

    :cond_3
    move-object/from16 v0, p4

    .line 16
    :goto_1
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    :cond_4
    const/16 v14, 0xe

    if-ne v7, v14, :cond_6

    move-object/from16 v24, v11

    .line 17
    :try_start_1
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->SupportArrayToBean:Lcom/alibaba/fastjson/parser/Feature;

    iget v13, v11, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    move/from16 v26, v3

    .line 18
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget v3, v3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    and-int/2addr v3, v13

    if-nez v3, :cond_5

    .line 19
    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v3

    if-nez v3, :cond_5

    and-int v3, p5, v13

    if-eqz v3, :cond_7

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object/from16 v4, p4

    move-object v9, v8

    move-object/from16 v11, v24

    goto/16 :goto_5b

    .line 20
    :cond_5
    :goto_2
    invoke-virtual/range {p0 .. p4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialzeArrayMapping(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    :cond_6
    move/from16 v26, v3

    move-object/from16 v24, v11

    :cond_7
    const/16 v3, 0xc

    .line 22
    const-class v13, Ljava/lang/Integer;

    const-class v11, Ljava/lang/String;

    const/4 v14, 0x1

    if-eq v7, v3, :cond_11

    if-eq v7, v9, :cond_11

    .line 23
    :try_start_2
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isBlankInput()Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v3, :cond_8

    .line 24
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v24

    :cond_8
    const/4 v3, 0x4

    if-ne v7, v3, :cond_c

    .line 25
    :try_start_3
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v3

    .line 26
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_9

    .line 27
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 28
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v24

    .line 29
    :cond_9
    :try_start_4
    iget-object v5, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v5, v5, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    if-eqz v5, :cond_b

    .line 30
    invoke-interface {v5}, Lcom/alibaba/fastjson/annotation/JSONType;->seeAlso()[Ljava/lang/Class;

    move-result-object v5

    array-length v9, v5

    move/from16 v10, v26

    :goto_3
    if-ge v10, v9, :cond_b

    aget-object v12, v5, v10

    .line 31
    const-class v15, Ljava/lang/Enum;

    invoke-virtual {v15, v12}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v15
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v15, :cond_a

    .line 32
    :try_start_5
    invoke-static {v12, v3}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 33
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    :catch_0
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_b
    :goto_4
    const/16 v3, 0xe

    goto :goto_5

    :cond_c
    const/4 v3, 0x5

    if-ne v7, v3, :cond_b

    .line 34
    :try_start_6
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    goto :goto_4

    :goto_5
    if-ne v7, v3, :cond_d

    .line 35
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    move-result v3

    const/16 v5, 0x5d

    if-ne v3, v5, :cond_d

    .line 36
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 37
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 38
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v24

    .line 39
    :cond_d
    :try_start_7
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v5, v3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_f

    iget-object v3, v3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v5, v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-ne v5, v14, :cond_f

    .line 40
    :try_start_8
    aget-object v3, v3, v26

    .line 41
    iget-object v3, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    if-ne v3, v13, :cond_e

    const/4 v5, 0x2

    if-ne v7, v5, :cond_f

    .line 42
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->intValue()I

    move-result v0

    .line 43
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 44
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {v1, v6, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createFactoryInstance(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 45
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    :catch_1
    move-exception v0

    goto :goto_6

    :cond_e
    if-ne v3, v11, :cond_f

    const/4 v3, 0x4

    if-ne v7, v3, :cond_f

    .line 46
    :try_start_9
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 47
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 48
    invoke-direct {v1, v6, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createFactoryInstance(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 49
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    .line 50
    :goto_6
    :try_start_a
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 51
    :cond_f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "syntax error, expect {, actual "

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->tokenName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", pos "

    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_10

    .line 57
    const-string v3, ", fieldName "

    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    :cond_10
    const-string v0, ", fastjson-version "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "1.2.62"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 62
    :cond_11
    :try_start_b
    iget v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1b

    const/4 v7, 0x2

    if-ne v3, v7, :cond_12

    move/from16 v3, v26

    .line 63
    :try_start_c
    iput v3, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    goto :goto_7

    :cond_12
    move/from16 v3, v26

    .line 64
    :goto_7
    :try_start_d
    iget-object v7, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v7, v7, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeKey:Ljava/lang/String;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1b

    move-object/from16 v27, p6

    move v14, v3

    move-object/from16 v30, v10

    move-object/from16 v28, v24

    move-object/from16 v29, v28

    move-object/from16 v3, p4

    move v10, v14

    .line 65
    :goto_8
    :try_start_e
    iget-object v9, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-object/from16 v31, v12

    array-length v12, v9
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1a

    if-ge v14, v12, :cond_15

    const/16 v12, 0x10

    if-ge v10, v12, :cond_15

    .line 66
    :try_start_f
    aget-object v9, v9, v14

    .line 67
    iget-object v12, v9, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move/from16 p4, v10

    .line 68
    iget-object v10, v12, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 69
    invoke-virtual {v12}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v32

    if-eqz v32, :cond_13

    move-object/from16 p6, v10

    .line 70
    instance-of v10, v9, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    if-eqz v10, :cond_14

    .line 71
    move-object v10, v9

    check-cast v10, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    iget-boolean v10, v10, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->customDeserilizer:Z
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    move/from16 v33, v10

    move-object/from16 v10, p6

    move/from16 p6, v33

    move/from16 v33, v14

    goto :goto_a

    :catchall_2
    move-exception v0

    move-object v4, v3

    move-object v9, v8

    move-object/from16 v11, v28

    goto/16 :goto_5b

    :cond_13
    move-object/from16 p6, v10

    :cond_14
    move-object/from16 v10, p6

    move/from16 v33, v14

    :goto_9
    const/16 p6, 0x0

    goto :goto_a

    :cond_15
    move/from16 p4, v10

    move/from16 v33, v14

    move-object/from16 v9, v24

    move-object v10, v9

    move-object v12, v10

    move-object/from16 v32, v12

    goto :goto_9

    .line 72
    :goto_a
    sget-object v14, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v34, v15

    sget-object v15, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v35, v3

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v36, v6

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eqz v9, :cond_41

    move-object/from16 v37, v7

    .line 73
    :try_start_10
    iget-object v7, v12, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    if-eqz p6, :cond_16

    .line 74
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchField([C)Z

    move-result v38

    if-eqz v38, :cond_16

    move-object/from16 v32, v13

    :goto_b
    move-object/from16 v0, v24

    const/4 v7, 0x1

    :goto_c
    const/4 v13, 0x0

    goto/16 :goto_21

    :catchall_3
    move-exception v0

    move-object v9, v8

    move-object/from16 v11, v28

    :goto_d
    move-object/from16 v4, v35

    goto/16 :goto_5b

    :cond_16
    if-eq v10, v6, :cond_17

    if-ne v10, v13, :cond_18

    :cond_17
    move-object/from16 v32, v13

    goto/16 :goto_1f

    :cond_18
    if-eq v10, v3, :cond_19

    .line 75
    const-class v0, Ljava/lang/Long;

    if-ne v10, v0, :cond_1a

    :cond_19
    move-object/from16 v32, v13

    goto/16 :goto_1d

    :cond_1a
    if-ne v10, v11, :cond_1e

    .line 76
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldString([C)Ljava/lang/String;

    move-result-object v0

    .line 77
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_1b

    :goto_e
    move-object/from16 v32, v13

    :goto_f
    const/4 v7, 0x1

    const/4 v13, 0x1

    goto/16 :goto_21

    :cond_1b
    move-object/from16 p6, v0

    const/4 v0, -0x2

    if-ne v7, v0, :cond_1c

    :goto_10
    add-int/lit8 v10, p4, 0x1

    move-object v9, v8

    move v0, v10

    move-object v8, v11

    move-object/from16 v32, v13

    :goto_11
    move-object/from16 v12, v24

    move-object/from16 v14, v36

    move-object/from16 v36, v37

    const/4 v3, 0x1

    const/16 v5, 0x10

    const/16 v6, 0xd

    const/16 v26, 0x0

    move-object/from16 v11, p3

    move-object v10, v4

    goto/16 :goto_5a

    :cond_1c
    move-object/from16 v0, p6

    move-object/from16 v32, v13

    :cond_1d
    :goto_12
    const/4 v7, 0x0

    goto :goto_c

    .line 78
    :cond_1e
    const-class v0, Ljava/util/Date;

    if-ne v10, v0, :cond_20

    iget-object v0, v12, Lcom/alibaba/fastjson/util/FieldInfo;->format:Ljava/lang/String;

    if-nez v0, :cond_20

    .line 79
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldDate([C)Ljava/util/Date;

    move-result-object v0

    .line 80
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_1f

    goto :goto_e

    :cond_1f
    move-object/from16 p6, v0

    const/4 v0, -0x2

    if-ne v7, v0, :cond_1c

    goto :goto_10

    .line 81
    :cond_20
    const-class v0, Ljava/math/BigDecimal;

    if-ne v10, v0, :cond_22

    .line 82
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldDecimal([C)Ljava/math/BigDecimal;

    move-result-object v0

    .line 83
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_21

    goto :goto_e

    :cond_21
    move-object/from16 p6, v0

    const/4 v0, -0x2

    if-ne v7, v0, :cond_1c

    goto :goto_10

    .line 84
    :cond_22
    const-class v0, Ljava/math/BigInteger;

    if-ne v10, v0, :cond_24

    .line 85
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldBigInteger([C)Ljava/math/BigInteger;

    move-result-object v0

    .line 86
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_23

    goto :goto_e

    :cond_23
    move-object/from16 p6, v0

    const/4 v0, -0x2

    if-ne v7, v0, :cond_1c

    goto :goto_10

    :cond_24
    if-eq v10, v5, :cond_25

    .line 87
    const-class v0, Ljava/lang/Boolean;

    if-ne v10, v0, :cond_26

    :cond_25
    move-object/from16 v32, v13

    goto/16 :goto_1b

    :cond_26
    if-eq v10, v15, :cond_27

    .line 88
    const-class v0, Ljava/lang/Float;

    if-ne v10, v0, :cond_28

    :cond_27
    move-object/from16 v32, v13

    goto/16 :goto_19

    :cond_28
    if-eq v10, v14, :cond_29

    .line 89
    const-class v0, Ljava/lang/Double;

    if-ne v10, v0, :cond_2a

    :cond_29
    move-object/from16 v32, v13

    goto/16 :goto_17

    .line 90
    :cond_2a
    invoke-virtual {v10}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 91
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    instance-of v0, v0, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    if-eqz v0, :cond_2d

    if-eqz v32, :cond_2b

    .line 92
    invoke-interface/range {v32 .. v32}, Lcom/alibaba/fastjson/annotation/JSONField;->deserializeUsing()Ljava/lang/Class;

    move-result-object v0

    move-object/from16 v32, v13

    const-class v13, Ljava/lang/Void;

    if-ne v0, v13, :cond_2e

    goto :goto_13

    :cond_2b
    move-object/from16 v32, v13

    .line 93
    :goto_13
    instance-of v0, v9, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    if-eqz v0, :cond_42

    .line 94
    move-object v0, v9

    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->fieldValueDeserilizer:Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 95
    invoke-virtual {v1, v4, v7, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->scanEnum(Lcom/alibaba/fastjson/parser/JSONLexerBase;[CLcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)Ljava/lang/Enum;

    move-result-object v0

    .line 96
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_2c

    goto :goto_15

    :cond_2c
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    :goto_14
    add-int/lit8 v10, p4, 0x1

    move-object v9, v8

    move v0, v10

    move-object v8, v11

    goto/16 :goto_11

    :cond_2d
    move-object/from16 v32, v13

    .line 97
    :cond_2e
    const-class v0, [I

    if-ne v10, v0, :cond_30

    .line 98
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldIntArray([C)[I

    move-result-object v0

    .line 99
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_2f

    :goto_15
    goto/16 :goto_f

    :cond_2f
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    :goto_16
    goto :goto_14

    .line 100
    :cond_30
    const-class v0, [F

    if-ne v10, v0, :cond_32

    .line 101
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldFloatArray([C)[F

    move-result-object v0

    .line 102
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_31

    goto :goto_15

    :cond_31
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto :goto_16

    .line 103
    :cond_32
    const-class v0, [[F

    if-ne v10, v0, :cond_34

    .line 104
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldFloatArray2([C)[[F

    move-result-object v0

    .line 105
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_33

    goto :goto_15

    :cond_33
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto :goto_16

    .line 106
    :cond_34
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchField([C)Z

    move-result v0

    if-eqz v0, :cond_35

    goto/16 :goto_b

    :cond_35
    move-object/from16 v39, v11

    move-object/from16 v13, v28

    move-object/from16 v7, v35

    move-object/from16 v14, v36

    move-object/from16 v5, v37

    move-object/from16 v11, p3

    goto/16 :goto_32

    .line 107
    :goto_17
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldDouble([C)D

    move-result-wide v38

    cmpl-double v0, v38, v22

    if-nez v0, :cond_36

    .line 108
    iget v0, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v7, 0x5

    if-ne v0, v7, :cond_36

    move-object/from16 v0, v24

    goto :goto_18

    .line 109
    :cond_36
    invoke-static/range {v38 .. v39}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 110
    :goto_18
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_37

    goto :goto_15

    :cond_37
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto :goto_16

    .line 111
    :goto_19
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldFloat([C)F

    move-result v0

    cmpl-float v7, v0, v21

    if-nez v7, :cond_38

    .line 112
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v13, 0x5

    if-ne v7, v13, :cond_38

    move-object/from16 v0, v24

    goto :goto_1a

    .line 113
    :cond_38
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 114
    :goto_1a
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_39

    goto :goto_15

    :cond_39
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto/16 :goto_14

    .line 115
    :goto_1b
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldBoolean([C)Z

    move-result v0

    .line 116
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v13, 0x5

    if-ne v7, v13, :cond_3a

    move-object/from16 v0, v24

    goto :goto_1c

    .line 117
    :cond_3a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 118
    :goto_1c
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_3b

    goto/16 :goto_15

    :cond_3b
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto/16 :goto_16

    .line 119
    :goto_1d
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldLong([C)J

    move-result-wide v38

    cmp-long v0, v38, v19

    if-nez v0, :cond_3c

    .line 120
    iget v0, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v13, 0x5

    if-ne v0, v13, :cond_3c

    move-object/from16 v0, v24

    goto :goto_1e

    .line 121
    :cond_3c
    invoke-static/range {v38 .. v39}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 122
    :goto_1e
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    if-lez v7, :cond_3d

    goto/16 :goto_15

    :cond_3d
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto/16 :goto_16

    .line 123
    :goto_1f
    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFieldInt([C)I

    move-result v0

    if-nez v0, :cond_3e

    .line 124
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v13, 0x5

    if-ne v7, v13, :cond_3f

    move-object/from16 v0, v24

    goto :goto_20

    :cond_3e
    const/4 v13, 0x5

    .line 125
    :cond_3f
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 126
    :goto_20
    iget v7, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    if-lez v7, :cond_40

    goto/16 :goto_15

    :cond_40
    const/4 v13, -0x2

    if-ne v7, v13, :cond_1d

    goto/16 :goto_16

    :cond_41
    move-object/from16 v37, v7

    move-object/from16 v32, v13

    :cond_42
    move-object/from16 v0, v24

    goto/16 :goto_12

    :goto_21
    if-nez v7, :cond_5e

    move/from16 p6, v7

    .line 127
    :try_start_11
    iget-object v7, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    invoke-virtual {v4, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v7
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    if-nez v7, :cond_44

    move/from16 v38, v13

    .line 128
    :try_start_12
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v13

    move-object/from16 v39, v11

    const/16 v11, 0xd

    if-ne v13, v11, :cond_43

    const/16 v11, 0x10

    .line 129
    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    move-object/from16 v11, p3

    move-object/from16 v37, v14

    move-object/from16 v13, v28

    move-object/from16 v7, v35

    move-object/from16 v28, v5

    goto/16 :goto_31

    :cond_43
    const/16 v11, 0x10

    if-ne v13, v11, :cond_45

    .line 130
    sget-object v11, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v11
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    if-eqz v11, :cond_45

    move-object/from16 v11, p3

    move-object/from16 v13, v28

    move-object/from16 v7, v35

    move-object/from16 v14, v36

    move-object/from16 v5, v37

    goto/16 :goto_32

    :cond_44
    move-object/from16 v39, v11

    move/from16 v38, v13

    .line 131
    :cond_45
    :try_start_13
    const-string v11, "$ref"

    if-ne v11, v7, :cond_53

    if-eqz v8, :cond_53

    const/4 v11, 0x4

    .line 132
    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithColon(I)V

    .line 133
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v0

    if-ne v0, v11, :cond_52

    .line 134
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 135
    const-string v1, "@"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    if-eqz v1, :cond_46

    .line 136
    :try_start_14
    iget-object v0, v8, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    move-object v3, v0

    :goto_22
    const/16 v11, 0xd

    goto/16 :goto_26

    .line 137
    :cond_46
    :try_start_15
    const-string v1, ".."

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    if-eqz v1, :cond_48

    .line 138
    :try_start_16
    iget-object v1, v8, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    .line 139
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v3, :cond_47

    goto :goto_22

    .line 140
    :cond_47
    new-instance v3, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    invoke-direct {v3, v1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    const/4 v0, 0x1

    .line 141
    iput v0, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    goto :goto_25

    .line 142
    :cond_48
    :try_start_17
    const-string v1, "$"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_6

    if-eqz v1, :cond_4b

    move-object v1, v8

    .line 143
    :goto_23
    :try_start_18
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/ParseContext;->parent:Lcom/alibaba/fastjson/parser/ParseContext;

    if-eqz v3, :cond_49

    move-object v1, v3

    goto :goto_23

    .line 144
    :cond_49
    iget-object v3, v1, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    if-eqz v3, :cond_4a

    goto :goto_22

    .line 145
    :cond_4a
    new-instance v3, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    invoke-direct {v3, v1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    const/4 v0, 0x1

    .line 146
    iput v0, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    goto :goto_25

    :cond_4b
    const/16 v1, 0x5c

    .line 147
    :try_start_19
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v3
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    if-lez v3, :cond_4e

    .line 148
    :try_start_1a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    .line 149
    :goto_24
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_4d

    .line 150
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v1, :cond_4c

    add-int/lit8 v5, v5, 0x1

    .line 151
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 152
    :cond_4c
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v6, 0x1

    add-int/2addr v5, v6

    goto :goto_24

    .line 153
    :cond_4d
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_3

    .line 154
    :cond_4e
    :try_start_1b
    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4f

    move-object v3, v1

    goto :goto_22

    .line 155
    :cond_4f
    new-instance v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    invoke-direct {v1, v8, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    const/4 v0, 0x1

    .line 156
    iput v0, v2, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_6

    :goto_25
    move-object/from16 v3, v35

    goto :goto_22

    .line 157
    :goto_26
    :try_start_1c
    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 158
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v0

    if-ne v0, v11, :cond_51

    const/16 v11, 0x10

    .line 159
    invoke-virtual {v4, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    move-object/from16 v11, p3

    .line 160
    invoke-virtual {v2, v8, v3, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_4

    move-object/from16 v13, v28

    if-eqz v13, :cond_50

    .line 161
    iput-object v3, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 162
    :cond_50
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v3

    :catchall_4
    move-exception v0

    move-object/from16 v13, v28

    :goto_27
    move-object v4, v3

    :goto_28
    move-object v9, v8

    move-object v11, v13

    goto/16 :goto_5b

    :cond_51
    move-object/from16 v13, v28

    .line 163
    :try_start_1d
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "illegal ref"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_5

    :catchall_5
    move-exception v0

    goto :goto_27

    :catchall_6
    move-exception v0

    move-object/from16 v13, v28

    :goto_29
    move-object v9, v8

    move-object v11, v13

    goto/16 :goto_d

    :cond_52
    move-object/from16 v13, v28

    .line 164
    :try_start_1e
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "illegal ref, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_7
    move-exception v0

    goto :goto_29

    :cond_53
    move-object/from16 v11, p3

    move-object/from16 v13, v28

    if-eqz v37, :cond_55

    move-object/from16 v28, v5

    move-object/from16 v5, v37

    .line 165
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-nez v37, :cond_54

    :goto_2a
    move-object/from16 v37, v14

    goto :goto_2c

    :cond_54
    move-object/from16 v37, v14

    :goto_2b
    const/4 v0, 0x4

    goto :goto_2d

    :cond_55
    move-object/from16 v28, v5

    move-object/from16 v5, v37

    goto :goto_2a

    :goto_2c
    sget-object v14, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_7

    if-ne v14, v7, :cond_5d

    goto :goto_2b

    .line 166
    :goto_2d
    :try_start_1f
    invoke-virtual {v4, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithColon(I)V

    .line 167
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v7

    if-ne v7, v0, :cond_5c

    .line 168
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v0

    const/16 v12, 0x10

    .line 169
    invoke-virtual {v4, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 170
    iget-object v7, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v7, v7, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_56

    sget-object v7, Lcom/alibaba/fastjson/parser/Feature;->IgnoreAutoType:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {v2, v7}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v7

    if-eqz v7, :cond_57

    :cond_56
    move-object/from16 v7, v35

    move-object/from16 v14, v36

    goto :goto_30

    .line 171
    :cond_57
    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v14, v36

    invoke-static {v14, v1, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-result-object v1
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_8

    if-nez v1, :cond_58

    .line 172
    :try_start_20
    invoke-static/range {p2 .. p2}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    .line 173
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getFeatures()I

    move-result v3

    invoke-virtual {v14, v0, v1, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->checkAutoType(Ljava/lang/String;Ljava/lang/Class;I)Ljava/lang/Class;

    move-result-object v1

    .line 174
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v3
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_7

    move-object/from16 v42, v3

    move-object v3, v1

    move-object/from16 v1, v42

    goto :goto_2e

    :cond_58
    move-object/from16 v3, v24

    .line 175
    :goto_2e
    :try_start_21
    invoke-interface {v1, v2, v3, v11}, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 176
    instance-of v4, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_8

    if-eqz v4, :cond_59

    .line 177
    :try_start_22
    check-cast v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    if-eqz v5, :cond_59

    .line 178
    invoke-virtual {v1, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v1

    .line 179
    invoke-virtual {v1, v3, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_7

    :cond_59
    if-eqz v13, :cond_5a

    move-object/from16 v7, v35

    .line 180
    iput-object v7, v13, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 181
    :cond_5a
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v3

    :catchall_8
    move-exception v0

    move-object/from16 v7, v35

    :goto_2f
    move-object v4, v7

    goto/16 :goto_28

    .line 182
    :goto_30
    :try_start_23
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v0

    const/16 v9, 0xd

    if-ne v0, v9, :cond_5b

    .line 183
    invoke-virtual {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    :goto_31
    move-object v0, v3

    move-object v4, v7

    move-object v3, v13

    move-object/from16 v9, v28

    move-object/from16 v5, v29

    move-object/from16 v12, v37

    move-object v13, v6

    goto/16 :goto_42

    :catchall_9
    move-exception v0

    goto :goto_2f

    :cond_5b
    :goto_32
    move/from16 v0, p4

    move-object v10, v4

    move-object/from16 v36, v5

    move-object/from16 v35, v7

    move-object v9, v8

    move-object/from16 v28, v13

    move-object/from16 v12, v24

    move-object/from16 v8, v39

    const/4 v3, 0x1

    const/16 v5, 0x10

    const/16 v6, 0xd

    const/16 v26, 0x0

    goto/16 :goto_5a

    :cond_5c
    move-object/from16 v7, v35

    .line 184
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "syntax error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_9

    :cond_5d
    :goto_33
    move-object/from16 v14, v36

    goto :goto_34

    :cond_5e
    move/from16 p6, v7

    move-object/from16 v39, v11

    move/from16 v38, v13

    move-object/from16 v13, v28

    move-object/from16 v11, p3

    move-object/from16 v28, v5

    move-object/from16 v5, v37

    move-object/from16 v37, v14

    move-object/from16 v7, v24

    goto :goto_33

    :goto_34
    if-nez v35, :cond_61

    if-nez v29, :cond_61

    move-object/from16 v36, v5

    .line 185
    :try_start_24
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_d

    if-nez v5, :cond_5f

    move-object/from16 v40, v7

    .line 186
    :try_start_25
    new-instance v7, Ljava/util/HashMap;
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_b

    move-object/from16 v41, v13

    :try_start_26
    iget-object v13, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v13, v13

    invoke-direct {v7, v13}, Ljava/util/HashMap;-><init>(I)V

    move-object/from16 v29, v7

    goto :goto_38

    :catchall_a
    move-exception v0

    :goto_35
    move-object v4, v5

    :goto_36
    move-object v9, v8

    :goto_37
    move-object/from16 v11, v41

    goto/16 :goto_5b

    :catchall_b
    move-exception v0

    move-object/from16 v41, v13

    goto :goto_35

    :cond_5f
    move-object/from16 v40, v7

    move-object/from16 v41, v13

    .line 187
    :goto_38
    invoke-virtual {v2, v8, v5, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v7
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_a

    if-nez v27, :cond_60

    .line 188
    :try_start_27
    iget-object v13, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v13, v13

    div-int/lit8 v13, v13, 0x20

    const/16 v27, 0x1

    add-int/lit8 v13, v13, 0x1

    new-array v13, v13, [I
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_c

    move-object/from16 v41, v7

    move-object v7, v13

    :goto_39
    move-object/from16 v13, v29

    goto :goto_3b

    :catchall_c
    move-exception v0

    move-object v4, v5

    move-object v11, v7

    goto/16 :goto_0

    :cond_60
    move-object/from16 v41, v7

    move-object/from16 v7, v27

    goto :goto_39

    :catchall_d
    move-exception v0

    move-object/from16 v41, v13

    move-object v9, v8

    :goto_3a
    move-object/from16 v4, v35

    goto :goto_37

    :cond_61
    move-object/from16 v36, v5

    move-object/from16 v40, v7

    move-object/from16 v41, v13

    move-object/from16 v7, v27

    move-object/from16 v13, v29

    move-object/from16 v5, v35

    :goto_3b
    if-eqz p6, :cond_69

    if-nez v38, :cond_62

    move-object/from16 p6, v7

    move-object/from16 v7, p2

    .line 189
    :try_start_28
    invoke-virtual {v9, v2, v5, v7, v13}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V

    move-object/from16 v7, p6

    move-object v0, v3

    move-object v10, v4

    move-object v4, v5

    move-object/from16 v27, v13

    move-object/from16 v9, v28

    move-object/from16 v12, v37

    :goto_3c
    move-object v13, v6

    goto/16 :goto_40

    :cond_62
    move-object/from16 p6, v7

    move-object/from16 v7, p2

    if-nez v5, :cond_64

    .line 190
    iget-object v9, v12, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-interface {v13, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_a

    :cond_63
    move-object/from16 v2, v28

    move-object/from16 v12, v37

    goto :goto_3d

    :cond_64
    if-nez v0, :cond_65

    if-eq v10, v6, :cond_63

    if-eq v10, v3, :cond_63

    if-eq v10, v15, :cond_63

    move-object/from16 v12, v37

    move-object/from16 v2, v28

    if-eq v10, v12, :cond_66

    if-eq v10, v2, :cond_66

    .line 191
    :try_start_29
    invoke-virtual {v9, v5, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3d

    :catchall_e
    move-exception v0

    move-object/from16 v2, p1

    goto/16 :goto_35

    :cond_65
    move-object/from16 v2, v28

    move-object/from16 v12, v37

    .line 192
    invoke-virtual {v9, v5, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_66
    :goto_3d
    if-eqz p6, :cond_67

    .line 193
    div-int/lit8 v0, v33, 0x20

    .line 194
    rem-int/lit8 v9, v33, 0x20

    .line 195
    aget v10, p6, v0

    const/16 v27, 0x1

    shl-int v9, v27, v9

    or-int/2addr v9, v10

    aput v9, p6, v0

    .line 196
    :cond_67
    iget v0, v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    const/4 v9, 0x4

    if-ne v0, v9, :cond_68

    move-object v9, v2

    move-object v0, v3

    move-object v4, v5

    move-object/from16 v27, v13

    move-object/from16 v2, p1

    move-object v13, v6

    goto/16 :goto_41

    :cond_68
    move-object/from16 v7, p6

    move-object v9, v2

    move-object v0, v3

    move-object v10, v4

    move-object v4, v5

    move-object/from16 v27, v13

    move-object/from16 v2, p1

    goto :goto_3c

    :cond_69
    move-object/from16 p6, v7

    move-object/from16 v2, v28

    move-object/from16 v12, v37

    const/4 v9, 0x4

    move-object/from16 v7, p2

    if-nez v13, :cond_6a

    .line 197
    new-instance v0, Ljava/util/HashMap;

    iget-object v10, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v10, v10

    invoke-direct {v0, v10}, Ljava/util/HashMap;-><init>(I)V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_e

    move-object/from16 v27, v13

    move-object v13, v6

    move-object v6, v0

    move-object v9, v2

    move-object v10, v4

    move-object v4, v5

    move-object v5, v7

    move-object/from16 v2, p1

    move-object/from16 v7, p6

    move-object v0, v3

    move-object/from16 v3, v40

    goto :goto_3e

    :cond_6a
    move-object/from16 v27, v13

    move-object v13, v6

    move-object/from16 v6, v27

    move-object v9, v2

    move-object v0, v3

    move-object v10, v4

    move-object v4, v5

    move-object v5, v7

    move-object/from16 v3, v40

    move-object/from16 v2, p1

    move-object/from16 v7, p6

    :goto_3e
    :try_start_2a
    invoke-virtual/range {v1 .. v7}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;[I)Z

    move-result v3

    if-nez v3, :cond_6c

    .line 198
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v3

    const/16 v5, 0xd

    if-ne v3, v5, :cond_6b

    .line 199
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    goto :goto_41

    :catchall_f
    move-exception v0

    goto/16 :goto_36

    :cond_6b
    move v6, v5

    move-object v9, v8

    move-object/from16 v12, v24

    move-object/from16 v8, v39

    const/4 v3, 0x1

    const/16 v5, 0x10

    :goto_3f
    const/16 v26, 0x0

    goto/16 :goto_59

    .line 200
    :cond_6c
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v3

    const/16 v5, 0x11

    if-eq v3, v5, :cond_98

    .line 201
    :goto_40
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v3

    const/16 v5, 0x10

    if-ne v3, v5, :cond_6d

    move-object v9, v8

    move-object/from16 v12, v24

    move-object/from16 v8, v39

    const/4 v3, 0x1

    const/16 v6, 0xd

    goto :goto_3f

    .line 202
    :cond_6d
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v3

    const/16 v6, 0xd

    if-ne v3, v6, :cond_96

    .line 203
    invoke-virtual {v10, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_f

    :goto_41
    move-object/from16 v5, v27

    move-object/from16 v3, v41

    :goto_42
    if-nez v4, :cond_91

    if-nez v5, :cond_70

    .line 204
    :try_start_2b
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_11

    if-nez v3, :cond_6e

    .line 205
    :try_start_2c
    invoke-virtual {v2, v8, v1, v11}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    move-result-object v3
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_10

    goto :goto_44

    :catchall_10
    move-exception v0

    move-object v4, v1

    :goto_43
    move-object v11, v3

    goto/16 :goto_0

    :cond_6e
    :goto_44
    if-eqz v3, :cond_6f

    .line 206
    iput-object v1, v3, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 207
    :cond_6f
    invoke-virtual {v2, v8}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v1

    :catchall_11
    move-exception v0

    goto :goto_43

    .line 208
    :cond_70
    :try_start_2d
    iget-object v6, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v7, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameters:[Ljava/lang/String;
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_15

    .line 209
    const-string v10, ""

    sget-object v11, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    sget-object v14, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eqz v7, :cond_7e

    .line 210
    :try_start_2e
    array-length v6, v7

    new-array v6, v6, [Ljava/lang/Object;
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_15

    move-object/from16 p4, v4

    move-object/from16 v19, v6

    const/4 v4, 0x0

    .line 211
    :goto_45
    :try_start_2f
    array-length v6, v7

    if-ge v4, v6, :cond_7d

    .line 212
    aget-object v6, v7, v4

    .line 213
    invoke-interface {v5, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_14

    move-object/from16 p2, v10

    .line 214
    iget-object v10, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    if-nez v6, :cond_79

    .line 215
    :try_start_30
    iget-object v2, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

    aget-object v2, v2, v4

    .line 216
    iget-object v10, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    aget-object v10, v10, v4
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_14

    if-ne v2, v14, :cond_71

    move-object/from16 v25, v8

    move-object/from16 v6, v18

    :goto_46
    move-object/from16 v8, v39

    goto :goto_49

    :cond_71
    if-ne v2, v11, :cond_72

    move-object/from16 v25, v8

    move-object/from16 v6, v17

    goto :goto_46

    :cond_72
    if-ne v2, v13, :cond_73

    move-object/from16 v25, v8

    move-object/from16 v6, v16

    goto :goto_46

    :cond_73
    if-ne v2, v0, :cond_74

    move-object/from16 v25, v8

    move-object/from16 v6, v30

    goto :goto_46

    :cond_74
    if-ne v2, v15, :cond_75

    move-object/from16 v25, v8

    move-object/from16 v6, v31

    goto :goto_46

    :cond_75
    if-ne v2, v12, :cond_76

    move-object/from16 v25, v8

    move-object/from16 v6, v34

    goto :goto_46

    :cond_76
    if-ne v2, v9, :cond_77

    .line 217
    :try_start_31
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_12

    move-object/from16 v25, v8

    goto :goto_46

    :catchall_12
    move-exception v0

    move-object/from16 v2, p1

    move-object/from16 v4, p4

    goto :goto_43

    :cond_77
    move-object/from16 v25, v8

    move-object/from16 v8, v39

    if-ne v2, v8, :cond_78

    .line 218
    :try_start_32
    iget v2, v10, Lcom/alibaba/fastjson/util/FieldInfo;->parserFeatures:I

    sget-object v10, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    iget v10, v10, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    and-int/2addr v2, v10

    if-eqz v2, :cond_78

    move-object/from16 v6, p2

    goto :goto_49

    :catchall_13
    move-exception v0

    :goto_47
    move-object/from16 v2, p1

    move-object/from16 v4, p4

    :goto_48
    move-object v11, v3

    move-object/from16 v9, v25

    goto/16 :goto_5b

    :cond_78
    :goto_49
    move/from16 v20, v4

    const/4 v4, 0x0

    goto :goto_4c

    :catchall_14
    move-exception v0

    move-object/from16 v25, v8

    goto :goto_47

    :cond_79
    move-object/from16 v25, v8

    move-object/from16 v8, v39

    .line 219
    iget-object v2, v10, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

    if-eqz v2, :cond_7b

    array-length v10, v2

    if-ge v4, v10, :cond_7b

    .line 220
    aget-object v2, v2, v4

    .line 221
    instance-of v10, v2, Ljava/lang/Class;

    if-eqz v10, :cond_7b

    .line 222
    check-cast v2, Ljava/lang/Class;

    .line 223
    invoke-virtual {v2, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7b

    .line 224
    instance-of v10, v6, Ljava/util/List;

    if-eqz v10, :cond_7b

    .line 225
    move-object v10, v6

    check-cast v10, Ljava/util/List;

    move/from16 v20, v4

    .line 226
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v4

    move-object/from16 p3, v6

    const/4 v6, 0x1

    if-ne v4, v6, :cond_7a

    const/4 v4, 0x0

    .line 227
    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 228
    invoke-virtual {v2, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 229
    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_4c

    :cond_7a
    :goto_4a
    const/4 v4, 0x0

    goto :goto_4b

    :cond_7b
    move/from16 v20, v4

    move-object/from16 p3, v6

    goto :goto_4a

    :cond_7c
    :goto_4b
    move-object/from16 v6, p3

    .line 230
    :goto_4c
    aput-object v6, v19, v20

    add-int/lit8 v2, v20, 0x1

    move-object/from16 v10, p2

    move v4, v2

    move-object/from16 v39, v8

    move-object/from16 v8, v25

    move-object/from16 v2, p1

    goto/16 :goto_45

    :cond_7d
    move-object/from16 v25, v8

    move-object/from16 v8, v39

    move-object/from16 v6, v19

    goto/16 :goto_50

    :catchall_15
    move-exception v0

    move-object/from16 p4, v4

    move-object/from16 v25, v8

    :goto_4d
    move-object/from16 v2, p1

    goto :goto_48

    :cond_7e
    move-object/from16 p4, v4

    move-object/from16 v25, v8

    move-object/from16 p2, v10

    move-object/from16 v8, v39

    const/4 v4, 0x0

    .line 231
    iget-object v2, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 232
    array-length v6, v2

    .line 233
    new-array v10, v6, [Ljava/lang/Object;

    :goto_4e
    if-ge v4, v6, :cond_88

    move-object/from16 v19, v2

    .line 234
    aget-object v2, v19, v4

    move/from16 v20, v4

    .line 235
    iget-object v4, v2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_86

    move-object/from16 p3, v4

    .line 236
    iget-object v4, v2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    if-ne v4, v14, :cond_7f

    move-object/from16 v4, v18

    goto :goto_4f

    :cond_7f
    if-ne v4, v11, :cond_80

    move-object/from16 v4, v17

    goto :goto_4f

    :cond_80
    if-ne v4, v13, :cond_81

    move-object/from16 v4, v16

    goto :goto_4f

    :cond_81
    if-ne v4, v0, :cond_82

    move-object/from16 v4, v30

    goto :goto_4f

    :cond_82
    if-ne v4, v15, :cond_83

    move-object/from16 v4, v31

    goto :goto_4f

    :cond_83
    if-ne v4, v12, :cond_84

    move-object/from16 v4, v34

    goto :goto_4f

    :cond_84
    if-ne v4, v9, :cond_85

    .line 237
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4f

    :cond_85
    if-ne v4, v8, :cond_87

    .line 238
    iget v2, v2, Lcom/alibaba/fastjson/util/FieldInfo;->parserFeatures:I

    sget-object v4, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    iget v4, v4, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    and-int/2addr v2, v4

    if-eqz v2, :cond_87

    move-object/from16 v4, p2

    goto :goto_4f

    :cond_86
    move-object/from16 p3, v4

    :cond_87
    move-object/from16 v4, p3

    .line 239
    :goto_4f
    aput-object v4, v10, v20

    add-int/lit8 v4, v20, 0x1

    move-object/from16 v2, v19

    goto :goto_4e

    :cond_88
    move-object v6, v10

    .line 240
    :goto_50
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v2, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v2, :cond_8e

    .line 241
    iget-boolean v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlin:Z

    if-eqz v0, :cond_8b

    const/4 v0, 0x0

    .line 242
    :goto_51
    array-length v2, v6

    if-ge v0, v2, :cond_8b

    .line 243
    aget-object v2, v6, v0

    if-nez v2, :cond_8a

    iget-object v2, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v4, v2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    if-eqz v4, :cond_8a

    array-length v9, v4

    if-ge v0, v9, :cond_8a

    .line 244
    aget-object v0, v4, v0

    .line 245
    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_13

    if-ne v0, v8, :cond_8b

    .line 246
    :try_start_33
    iget-object v0, v2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlinDefaultConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_8b

    move-object/from16 v2, v24

    .line 247
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_3
    .catchall {:try_start_33 .. :try_end_33} :catchall_13

    const/4 v0, 0x0

    .line 248
    :goto_52
    :try_start_34
    array-length v2, v6

    if-ge v0, v2, :cond_8c

    .line 249
    aget-object v2, v6, v0

    if-eqz v2, :cond_89

    .line 250
    iget-object v8, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v8, v8, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    if-eqz v8, :cond_89

    array-length v9, v8

    if-ge v0, v9, :cond_89

    .line 251
    aget-object v8, v8, v0

    .line 252
    invoke-virtual {v8, v4, v2}, Lcom/alibaba/fastjson/util/FieldInfo;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_2
    .catchall {:try_start_34 .. :try_end_34} :catchall_16

    goto :goto_53

    :catchall_16
    move-exception v0

    goto/16 :goto_4d

    :catch_2
    move-exception v0

    goto :goto_55

    :cond_89
    :goto_53
    add-int/lit8 v0, v0, 0x1

    goto :goto_52

    :catch_3
    move-exception v0

    move-object/from16 v4, p4

    goto :goto_55

    :cond_8a
    add-int/lit8 v0, v0, 0x1

    const/16 v24, 0x0

    goto :goto_51

    .line 253
    :cond_8b
    :try_start_35
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_35} :catch_3
    .catchall {:try_start_35 .. :try_end_35} :catchall_13

    move-object v4, v0

    :cond_8c
    if-eqz v7, :cond_90

    .line 254
    :try_start_36
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8d
    :goto_54
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_90

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 255
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v5

    if-eqz v5, :cond_8d

    .line 256
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v4, v2}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_54

    .line 257
    :goto_55
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "create instance error, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 258
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->toGenericString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_16

    .line 259
    :cond_8e
    :try_start_37
    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_13

    if-eqz v0, :cond_8f

    const/4 v2, 0x0

    .line 260
    :try_start_38
    invoke-virtual {v0, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_38} :catch_4
    .catchall {:try_start_38 .. :try_end_38} :catchall_13

    move-object v4, v0

    goto :goto_56

    :catch_4
    move-exception v0

    .line 261
    :try_start_39
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "create factory method error, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v1, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_13

    :cond_8f
    move-object/from16 v4, p4

    :cond_90
    :goto_56
    if-eqz v3, :cond_92

    .line 262
    :try_start_3a
    iput-object v4, v3, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_16

    goto :goto_57

    :cond_91
    move-object/from16 p4, v4

    move-object/from16 v25, v8

    .line 263
    :cond_92
    :goto_57
    :try_start_3b
    iget-object v0, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v0, v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_18

    if-nez v0, :cond_94

    if-eqz v3, :cond_93

    .line 264
    iput-object v4, v3, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    :cond_93
    move-object/from16 v2, p1

    move-object/from16 v9, v25

    .line 265
    invoke-virtual {v2, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v4

    :cond_94
    move-object/from16 v2, p1

    move-object/from16 v9, v25

    const/4 v12, 0x0

    .line 266
    :try_start_3c
    invoke-virtual {v0, v4, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_3c} :catch_5
    .catchall {:try_start_3c .. :try_end_3c} :catchall_17

    if-eqz v3, :cond_95

    .line 267
    iput-object v4, v3, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 268
    :cond_95
    invoke-virtual {v2, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    return-object v0

    :catchall_17
    move-exception v0

    :goto_58
    move-object v11, v3

    goto/16 :goto_5b

    :catch_5
    move-exception v0

    .line 269
    :try_start_3d
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "build object error"

    invoke-direct {v1, v5, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_17

    :catchall_18
    move-exception v0

    move-object/from16 v2, p1

    move-object/from16 v9, v25

    goto :goto_58

    :cond_96
    move-object v9, v8

    move-object/from16 v12, v24

    move-object/from16 v8, v39

    const/16 v26, 0x0

    .line 270
    :try_start_3e
    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v0

    const/16 v3, 0x12

    if-eq v0, v3, :cond_97

    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_97

    :goto_59
    move/from16 v0, p4

    move-object/from16 v35, v4

    move-object/from16 v29, v27

    move-object/from16 v28, v41

    move-object/from16 v27, v7

    :goto_5a
    add-int/lit8 v4, v33, 0x1

    move-object/from16 v5, p2

    move-object/from16 v24, v12

    move-object v6, v14

    move-object/from16 v12, v31

    move-object/from16 v13, v32

    move-object/from16 v15, v34

    move-object/from16 v3, v35

    move-object/from16 v7, v36

    move v14, v4

    move-object v4, v10

    move v10, v0

    move-object v0, v11

    move-object v11, v8

    move-object v8, v9

    goto/16 :goto_8

    :catchall_19
    move-exception v0

    goto/16 :goto_37

    .line 271
    :cond_97
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "syntax error, unexpect token "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token()I

    move-result v3

    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_98
    move-object v9, v8

    .line 272
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "syntax error, unexpect token \':\'"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_19

    :catchall_1a
    move-exception v0

    move-object/from16 v35, v3

    move-object v9, v8

    move-object/from16 v41, v28

    goto/16 :goto_3a

    :catchall_1b
    move-exception v0

    move-object v9, v8

    move-object/from16 v12, v24

    move-object/from16 v4, p4

    move-object v11, v12

    :goto_5b
    if-eqz v11, :cond_99

    .line 273
    iput-object v4, v11, Lcom/alibaba/fastjson/parser/ParseContext;->object:Ljava/lang/Object;

    .line 274
    :cond_99
    invoke-virtual {v2, v9}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 275
    throw v0

    .line 276
    :cond_9a
    :goto_5c
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public deserialzeArrayMapping(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0xe

    .line 8
    .line 9
    if-ne v1, v2, :cond_12

    .line 10
    .line 11
    iget-object v1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanTypeName(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 24
    .line 25
    invoke-static {v3, v4, v1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getSeeAlso(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    invoke-static {p2}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->getFeatures()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    invoke-virtual {v4, v1, v3, v5}, Lcom/alibaba/fastjson/parser/ParserConfig;->checkAutoType(Ljava/lang/String;Ljava/lang/Class;I)Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    :cond_0
    instance-of v1, v3, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 60
    .line 61
    invoke-virtual {v3, p1, p2, p3, p4}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialzeArrayMapping(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iget-object p3, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 71
    .line 72
    array-length p3, p3

    .line 73
    const/4 p4, 0x0

    .line 74
    :goto_0
    const/16 v1, 0x10

    .line 75
    .line 76
    if-ge p4, p3, :cond_11

    .line 77
    .line 78
    add-int/lit8 v3, p3, -0x1

    .line 79
    .line 80
    const/16 v4, 0x5d

    .line 81
    .line 82
    if-ne p4, v3, :cond_2

    .line 83
    .line 84
    move v3, v4

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    const/16 v3, 0x2c

    .line 87
    .line 88
    :goto_1
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 89
    .line 90
    aget-object v5, v5, p4

    .line 91
    .line 92
    iget-object v6, v5, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 93
    .line 94
    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 95
    .line 96
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 97
    .line 98
    if-ne v6, v7, :cond_3

    .line 99
    .line 100
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanInt(C)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;I)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_4

    .line 108
    .line 109
    :cond_3
    const-class v7, Ljava/lang/String;

    .line 110
    .line 111
    if-ne v6, v7, :cond_4

    .line 112
    .line 113
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanString(C)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto/16 :goto_4

    .line 121
    .line 122
    :cond_4
    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 123
    .line 124
    if-ne v6, v7, :cond_5

    .line 125
    .line 126
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanLong(C)J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    invoke-virtual {v5, p2, v3, v4}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;J)V

    .line 131
    .line 132
    .line 133
    goto/16 :goto_4

    .line 134
    .line 135
    :cond_5
    invoke-virtual {v6}, Ljava/lang/Class;->isEnum()Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-eqz v7, :cond_9

    .line 140
    .line 141
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    const/16 v4, 0x22

    .line 146
    .line 147
    if-eq v1, v4, :cond_8

    .line 148
    .line 149
    const/16 v4, 0x6e

    .line 150
    .line 151
    if-ne v1, v4, :cond_6

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    const/16 v4, 0x30

    .line 155
    .line 156
    if-lt v1, v4, :cond_7

    .line 157
    .line 158
    const/16 v4, 0x39

    .line 159
    .line 160
    if-gt v1, v4, :cond_7

    .line 161
    .line 162
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanInt(C)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    move-object v3, v5

    .line 167
    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v3, v4}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->getFieldValueDeserilizer(Lcom/alibaba/fastjson/parser/ParserConfig;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 178
    .line 179
    invoke-virtual {v3, v1}, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->valueOf(I)Ljava/lang/Enum;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    goto :goto_3

    .line 184
    :cond_7
    invoke-virtual {p0, v0, v3}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->scanEnum(Lcom/alibaba/fastjson/parser/JSONLexer;C)Ljava/lang/Enum;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    goto :goto_3

    .line 189
    :cond_8
    :goto_2
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-interface {v0, v6, v1, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanEnum(Ljava/lang/Class;Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/Enum;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    :goto_3
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    goto/16 :goto_4

    .line 201
    .line 202
    :cond_9
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 203
    .line 204
    if-ne v6, v7, :cond_a

    .line 205
    .line 206
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanBoolean(C)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Z)V

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_a
    sget-object v7, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 215
    .line 216
    if-ne v6, v7, :cond_b

    .line 217
    .line 218
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanFloat(C)F

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_b
    sget-object v7, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 231
    .line 232
    if-ne v6, v7, :cond_c

    .line 233
    .line 234
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanDouble(C)D

    .line 235
    .line 236
    .line 237
    move-result-wide v3

    .line 238
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    goto :goto_4

    .line 246
    :cond_c
    const-class v7, Ljava/util/Date;

    .line 247
    .line 248
    if-ne v6, v7, :cond_d

    .line 249
    .line 250
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->getCurrent()C

    .line 251
    .line 252
    .line 253
    move-result v7

    .line 254
    const/16 v8, 0x31

    .line 255
    .line 256
    if-ne v7, v8, :cond_d

    .line 257
    .line 258
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanLong(C)J

    .line 259
    .line 260
    .line 261
    move-result-wide v3

    .line 262
    new-instance v1, Ljava/util/Date;

    .line 263
    .line 264
    invoke-direct {v1, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_d
    const-class v7, Ljava/math/BigDecimal;

    .line 272
    .line 273
    if-ne v6, v7, :cond_e

    .line 274
    .line 275
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanDecimal(C)Ljava/math/BigDecimal;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v5, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    goto :goto_4

    .line 283
    :cond_e
    invoke-interface {v0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 284
    .line 285
    .line 286
    iget-object v6, v5, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 287
    .line 288
    iget-object v7, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 289
    .line 290
    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {p1, v7, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    invoke-virtual {v5, p2, v6}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 300
    .line 301
    .line 302
    move-result v5

    .line 303
    const/16 v6, 0xf

    .line 304
    .line 305
    if-ne v5, v6, :cond_f

    .line 306
    .line 307
    goto :goto_5

    .line 308
    :cond_f
    if-ne v3, v4, :cond_10

    .line 309
    .line 310
    move v1, v6

    .line 311
    :cond_10
    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->check(Lcom/alibaba/fastjson/parser/JSONLexer;I)V

    .line 312
    .line 313
    .line 314
    :goto_4
    add-int/lit8 p4, p4, 0x1

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :cond_11
    :goto_5
    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 319
    .line 320
    .line 321
    return-object p2

    .line 322
    :cond_12
    const-string p0, "error"

    .line 323
    .line 324
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    const/4 p0, 0x0

    .line 328
    return-object p0
.end method

.method public getFastMatchToken()I
    .locals 0

    const/16 p0, 0xc

    return p0
.end method

.method public getFieldDeserializer(J)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArray:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    new-array v0, v0, [J

    .line 10
    .line 11
    move v2, v1

    .line 12
    :goto_0
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 13
    .line 14
    array-length v4, v3

    .line 15
    if-ge v2, v4, :cond_0

    .line 16
    .line 17
    aget-object v3, v3, v2

    .line 18
    .line 19
    iget-object v3, v3, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    aput-wide v3, v0, v2

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v0}, Ljava/util/Arrays;->sort([J)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArray:[J

    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArray:[J

    .line 38
    .line 39
    invoke-static {v0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 p2, 0x0

    .line 44
    if-gez p1, :cond_2

    .line 45
    .line 46
    return-object p2

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArrayMapping:[S

    .line 48
    .line 49
    const/4 v2, -0x1

    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArray:[J

    .line 53
    .line 54
    array-length v0, v0

    .line 55
    new-array v0, v0, [S

    .line 56
    .line 57
    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([SS)V

    .line 58
    .line 59
    .line 60
    :goto_1
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 61
    .line 62
    array-length v4, v3

    .line 63
    if-ge v1, v4, :cond_4

    .line 64
    .line 65
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArray:[J

    .line 66
    .line 67
    aget-object v3, v3, v1

    .line 68
    .line 69
    iget-object v3, v3, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64(Ljava/lang/String;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v5

    .line 77
    invoke-static {v4, v5, v6}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-ltz v3, :cond_3

    .line 82
    .line 83
    int-to-short v4, v1

    .line 84
    aput-short v4, v0, v3

    .line 85
    .line 86
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArrayMapping:[S

    .line 90
    .line 91
    :cond_5
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->hashArrayMapping:[S

    .line 92
    .line 93
    aget-short p1, v0, p1

    .line 94
    .line 95
    if-eq p1, v2, :cond_6

    .line 96
    .line 97
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 98
    .line 99
    aget-object p0, p0, p1

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_6
    return-object p2
.end method

.method public getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 1

    const/4 v0, 0x0

    .line 112
    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object p0

    return-object p0
.end method

.method public getFieldDeserializer(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 103
    :cond_0
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->fieldDeserializerMap:Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 104
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    if-eqz v1, :cond_1

    return-object v1

    .line 105
    :cond_1
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    :goto_0
    if-gt v2, v1, :cond_5

    add-int v3, v2, v1

    ushr-int/lit8 v3, v3, 0x1

    .line 106
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object v4, v4, v3

    iget-object v4, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v4, v4, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 107
    invoke-virtual {v4, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_2

    add-int/lit8 v3, v3, 0x1

    move v2, v3

    goto :goto_0

    :cond_2
    if-lez v4, :cond_3

    add-int/lit8 v3, v3, -0x1

    move v1, v3

    goto :goto_0

    .line 108
    :cond_3
    invoke-static {v3, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->isSetFlag(I[I)Z

    move-result p1

    if-eqz p1, :cond_4

    return-object v0

    .line 109
    :cond_4
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    aget-object p0, p0, v3

    return-object p0

    .line 110
    :cond_5
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->alterNameFieldDeserializers:Ljava/util/Map;

    if-eqz p0, :cond_6

    .line 111
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    return-object p0

    :cond_6
    return-object v0
.end method

.method public getFieldType(I)Ljava/lang/reflect/Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 480
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;[I)Z

    move-result p0

    return p0
.end method

.method public parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;[I)Z
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;[I)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v11, p3

    .line 8
    .line 9
    move-object/from16 v12, p4

    .line 10
    .line 11
    move-object/from16 v13, p5

    .line 12
    .line 13
    move-object/from16 v14, p6

    .line 14
    .line 15
    iget-object v15, v1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 16
    .line 17
    sget-object v2, Lcom/alibaba/fastjson/parser/Feature;->DisableFieldSmartMatch:Lcom/alibaba/fastjson/parser/Feature;

    .line 18
    .line 19
    iget v2, v2, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 20
    .line 21
    invoke-interface {v15, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(I)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_1

    .line 26
    .line 27
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 28
    .line 29
    iget v4, v4, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    .line 30
    .line 31
    and-int/2addr v2, v4

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {v0, v3, v14}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatch(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    :goto_1
    sget-object v4, Lcom/alibaba/fastjson/parser/Feature;->SupportNonPublicField:Lcom/alibaba/fastjson/parser/Feature;

    .line 45
    .line 46
    iget v4, v4, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 47
    .line 48
    const/16 v16, 0x0

    .line 49
    .line 50
    const/4 v5, 0x1

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    invoke-interface {v15, v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(I)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-nez v6, :cond_3

    .line 58
    .line 59
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 60
    .line 61
    iget v6, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    .line 62
    .line 63
    and-int/2addr v4, v6

    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    move/from16 v17, v5

    .line 68
    .line 69
    goto/16 :goto_6

    .line 70
    .line 71
    :cond_3
    :goto_2
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->extraFieldDeserializers:Ljava/util/concurrent/ConcurrentMap;

    .line 72
    .line 73
    if-nez v4, :cond_9

    .line 74
    .line 75
    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    .line 76
    .line 77
    const/high16 v6, 0x3f400000    # 0.75f

    .line 78
    .line 79
    invoke-direct {v4, v5, v6, v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    .line 80
    .line 81
    .line 82
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 83
    .line 84
    :goto_3
    if-eqz v6, :cond_8

    .line 85
    .line 86
    const-class v7, Ljava/lang/Object;

    .line 87
    .line 88
    if-eq v6, v7, :cond_8

    .line 89
    .line 90
    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    array-length v8, v7

    .line 95
    move/from16 v9, v16

    .line 96
    .line 97
    :goto_4
    if-ge v9, v8, :cond_7

    .line 98
    .line 99
    aget-object v10, v7, v9

    .line 100
    .line 101
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 106
    .line 107
    .line 108
    move-result-object v18

    .line 109
    if-eqz v18, :cond_4

    .line 110
    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getModifiers()I

    .line 113
    .line 114
    .line 115
    move-result v18

    .line 116
    and-int/lit8 v19, v18, 0x10

    .line 117
    .line 118
    if-nez v19, :cond_6

    .line 119
    .line 120
    and-int/lit8 v18, v18, 0x8

    .line 121
    .line 122
    if-eqz v18, :cond_5

    .line 123
    .line 124
    goto :goto_5

    .line 125
    :cond_5
    invoke-virtual {v4, v5, v10}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    :cond_6
    :goto_5
    add-int/lit8 v9, v9, 0x1

    .line 129
    .line 130
    const/4 v5, 0x1

    .line 131
    goto :goto_4

    .line 132
    :cond_7
    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    const/4 v5, 0x1

    .line 137
    goto :goto_3

    .line 138
    :cond_8
    iput-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->extraFieldDeserializers:Ljava/util/concurrent/ConcurrentMap;

    .line 139
    .line 140
    :cond_9
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->extraFieldDeserializers:Ljava/util/concurrent/ConcurrentMap;

    .line 141
    .line 142
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    if-eqz v4, :cond_a

    .line 147
    .line 148
    instance-of v2, v4, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 149
    .line 150
    if-eqz v2, :cond_b

    .line 151
    .line 152
    move-object v2, v4

    .line 153
    check-cast v2, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 154
    .line 155
    :cond_a
    const/16 v17, 0x1

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_b
    move-object v7, v4

    .line 159
    check-cast v7, Ljava/lang/reflect/Field;

    .line 160
    .line 161
    const/4 v2, 0x1

    .line 162
    invoke-virtual {v7, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 163
    .line 164
    .line 165
    move/from16 v17, v2

    .line 166
    .line 167
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 168
    .line 169
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    const/4 v9, 0x0

    .line 182
    const/4 v10, 0x0

    .line 183
    const/4 v8, 0x0

    .line 184
    invoke-direct/range {v2 .. v10}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;III)V

    .line 185
    .line 186
    .line 187
    new-instance v4, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 194
    .line 195
    invoke-direct {v4, v5, v6, v2}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 196
    .line 197
    .line 198
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->extraFieldDeserializers:Ljava/util/concurrent/ConcurrentMap;

    .line 199
    .line 200
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-object v2, v4

    .line 204
    :goto_6
    if-nez v2, :cond_15

    .line 205
    .line 206
    sget-object v2, Lcom/alibaba/fastjson/parser/Feature;->IgnoreNotMatch:Lcom/alibaba/fastjson/parser/Feature;

    .line 207
    .line 208
    invoke-interface {v15, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-eqz v2, :cond_14

    .line 213
    .line 214
    move/from16 v2, v16

    .line 215
    .line 216
    const/4 v5, -0x1

    .line 217
    :goto_7
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 218
    .line 219
    array-length v7, v6

    .line 220
    if-ge v2, v7, :cond_11

    .line 221
    .line 222
    aget-object v6, v6, v2

    .line 223
    .line 224
    iget-object v7, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 225
    .line 226
    iget-boolean v8, v7, Lcom/alibaba/fastjson/util/FieldInfo;->unwrapped:Z

    .line 227
    .line 228
    if-eqz v8, :cond_10

    .line 229
    .line 230
    instance-of v8, v6, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 231
    .line 232
    if-eqz v8, :cond_10

    .line 233
    .line 234
    iget-object v8, v7, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 235
    .line 236
    const-string v9, "parse unwrapped field error."

    .line 237
    .line 238
    if-eqz v8, :cond_f

    .line 239
    .line 240
    move-object v8, v6

    .line 241
    check-cast v8, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    .line 242
    .line 243
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 244
    .line 245
    .line 246
    move-result-object v10

    .line 247
    invoke-virtual {v8, v10}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->getFieldValueDeserilizer(Lcom/alibaba/fastjson/parser/ParserConfig;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 248
    .line 249
    .line 250
    move-result-object v10

    .line 251
    instance-of v4, v10, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 252
    .line 253
    if-eqz v4, :cond_d

    .line 254
    .line 255
    move-object v4, v10

    .line 256
    check-cast v4, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 257
    .line 258
    invoke-virtual {v4, v3}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    if-eqz v4, :cond_10

    .line 263
    .line 264
    :try_start_0
    iget-object v5, v7, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 265
    .line 266
    invoke-virtual {v5, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    if-nez v5, :cond_c

    .line 271
    .line 272
    check-cast v10, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 273
    .line 274
    iget-object v5, v7, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 275
    .line 276
    invoke-virtual {v10, v1, v5}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v5

    .line 280
    invoke-virtual {v6, v11, v5}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    goto :goto_8

    .line 284
    :catch_0
    move-exception v0

    .line 285
    goto :goto_9

    .line 286
    :cond_c
    :goto_8
    invoke-virtual {v8}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;->getFastMatchToken()I

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    invoke-interface {v15, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v4, v1, v5, v12, v13}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    .line 295
    .line 296
    goto :goto_c

    .line 297
    :goto_9
    invoke-static {v9, v0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 298
    .line 299
    .line 300
    return v16

    .line 301
    :cond_d
    instance-of v4, v10, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 302
    .line 303
    if-eqz v4, :cond_10

    .line 304
    .line 305
    check-cast v10, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    .line 306
    .line 307
    :try_start_1
    iget-object v4, v7, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 308
    .line 309
    invoke-virtual {v4, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    check-cast v4, Ljava/util/Map;

    .line 314
    .line 315
    if-nez v4, :cond_e

    .line 316
    .line 317
    iget-object v4, v7, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 318
    .line 319
    invoke-virtual {v10, v4}, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->createMap(Ljava/lang/reflect/Type;)Ljava/util/Map;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-virtual {v6, v11, v4}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    goto :goto_a

    .line 327
    :catch_1
    move-exception v0

    .line 328
    goto :goto_b

    .line 329
    :cond_e
    :goto_a
    invoke-interface {v15}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon()V

    .line 330
    .line 331
    .line 332
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 337
    .line 338
    .line 339
    goto :goto_c

    .line 340
    :goto_b
    invoke-static {v9, v0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 341
    .line 342
    .line 343
    return v16

    .line 344
    :cond_f
    iget-object v4, v7, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 345
    .line 346
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 347
    .line 348
    .line 349
    move-result-object v4

    .line 350
    array-length v4, v4

    .line 351
    const/4 v6, 0x2

    .line 352
    if-ne v4, v6, :cond_10

    .line 353
    .line 354
    invoke-interface {v15}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon()V

    .line 355
    .line 356
    .line 357
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    :try_start_2
    iget-object v5, v7, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 362
    .line 363
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v4

    .line 367
    invoke-virtual {v5, v11, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 368
    .line 369
    .line 370
    :goto_c
    move v5, v2

    .line 371
    goto :goto_d

    .line 372
    :catch_2
    move-exception v0

    .line 373
    invoke-static {v9, v0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 374
    .line 375
    .line 376
    return v16

    .line 377
    :cond_10
    :goto_d
    add-int/lit8 v2, v2, 0x1

    .line 378
    .line 379
    goto/16 :goto_7

    .line 380
    .line 381
    :cond_11
    const/4 v2, -0x1

    .line 382
    if-eq v5, v2, :cond_13

    .line 383
    .line 384
    if-eqz v14, :cond_12

    .line 385
    .line 386
    div-int/lit8 v0, v5, 0x20

    .line 387
    .line 388
    rem-int/lit8 v5, v5, 0x20

    .line 389
    .line 390
    aget v1, v14, v0

    .line 391
    .line 392
    shl-int v2, v17, v5

    .line 393
    .line 394
    or-int/2addr v1, v2

    .line 395
    aput v1, v14, v0

    .line 396
    .line 397
    :cond_12
    return v17

    .line 398
    :cond_13
    invoke-virtual {v1, v11, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseExtra(Ljava/lang/Object;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    return v16

    .line 402
    :cond_14
    iget-object v0, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->clazz:Ljava/lang/Class;

    .line 403
    .line 404
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    const-string v1, ", property "

    .line 409
    .line 410
    const-string v2, "setter not found, class "

    .line 411
    .line 412
    invoke-static {v2, v0, v1, v3}, Ll/pg60;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 413
    .line 414
    .line 415
    return v16

    .line 416
    :cond_15
    move/from16 v4, v16

    .line 417
    .line 418
    :goto_e
    iget-object v5, v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 419
    .line 420
    array-length v6, v5

    .line 421
    if-ge v4, v6, :cond_17

    .line 422
    .line 423
    aget-object v5, v5, v4

    .line 424
    .line 425
    if-ne v5, v2, :cond_16

    .line 426
    .line 427
    :goto_f
    const/4 v0, -0x1

    .line 428
    goto :goto_10

    .line 429
    :cond_16
    add-int/lit8 v4, v4, 0x1

    .line 430
    .line 431
    goto :goto_e

    .line 432
    :cond_17
    const/4 v4, -0x1

    .line 433
    goto :goto_f

    .line 434
    :goto_10
    if-eq v4, v0, :cond_18

    .line 435
    .line 436
    if-eqz v14, :cond_18

    .line 437
    .line 438
    const-string v0, "_"

    .line 439
    .line 440
    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    if-eqz v0, :cond_18

    .line 445
    .line 446
    invoke-static {v4, v14}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->isSetFlag(I[I)Z

    .line 447
    .line 448
    .line 449
    move-result v0

    .line 450
    if-eqz v0, :cond_18

    .line 451
    .line 452
    invoke-virtual {v1, v11, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseExtra(Ljava/lang/Object;Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    return v16

    .line 456
    :cond_18
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->getFastMatchToken()I

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    invoke-interface {v15, v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 461
    .line 462
    .line 463
    invoke-virtual {v2, v1, v11, v12, v13}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 464
    .line 465
    .line 466
    if-eqz v14, :cond_19

    .line 467
    .line 468
    div-int/lit8 v0, v4, 0x20

    .line 469
    .line 470
    rem-int/lit8 v4, v4, 0x20

    .line 471
    .line 472
    aget v1, v14, v0

    .line 473
    .line 474
    shl-int v2, v17, v4

    .line 475
    .line 476
    or-int/2addr v1, v2

    .line 477
    aput v1, v14, v0

    .line 478
    .line 479
    :cond_19
    return v17
.end method

.method public parseRest(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v7, v0, [I

    .line 3
    .line 4
    move-object v1, p0

    .line 5
    move-object v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move-object v4, p3

    .line 8
    move-object v5, p4

    .line 9
    move v6, p5

    .line 10
    invoke-virtual/range {v1 .. v7}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->parseRest(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I[I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public parseRest(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I[I)Ljava/lang/Object;
    .locals 0

    .line 15
    invoke-virtual/range {p0 .. p6}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;I[I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public scanEnum(Lcom/alibaba/fastjson/parser/JSONLexer;C)Ljava/lang/Enum;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/JSONLexer;",
            "C)",
            "Ljava/lang/Enum<",
            "*>;"
        }
    .end annotation

    .line 59
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "illegal enum. "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->info()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public scanEnum(Lcom/alibaba/fastjson/parser/JSONLexerBase;[CLcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)Ljava/lang/Enum;
    .locals 5

    .line 1
    instance-of p0, p3, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p3, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object p3, v0

    .line 10
    :goto_0
    if-nez p3, :cond_1

    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    iput p0, p1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanEnumSymbol([C)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iget p0, p1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 21
    .line 22
    if-lez p0, :cond_5

    .line 23
    .line 24
    invoke-virtual {p3, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->getEnumByHashCode(J)Ljava/lang/Enum;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-nez p0, :cond_4

    .line 29
    .line 30
    const-wide v3, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    cmp-long p2, v1, v3

    .line 36
    .line 37
    if-nez p2, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    sget-object p2, Lcom/alibaba/fastjson/parser/Feature;->ErrorOnEnumNotMatch:Lcom/alibaba/fastjson/parser/Feature;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_3

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    const-string p0, "not match enum value, "

    .line 50
    .line 51
    iget-object p1, p3, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;->enumClass:Ljava/lang/Class;

    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_4
    :goto_1
    return-object p0

    .line 58
    :cond_5
    return-object v0
.end method

.method public smartMatch(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 1

    const/4 v0, 0x0

    .line 174
    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatch(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object p0

    return-object p0
.end method

.method public smartMatch(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;[I)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_a

    .line 10
    .line 11
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64_lower(Ljava/lang/String;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    if-nez v4, :cond_2

    .line 19
    .line 20
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 21
    .line 22
    array-length v4, v4

    .line 23
    new-array v4, v4, [J

    .line 24
    .line 25
    move v6, v5

    .line 26
    :goto_0
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 27
    .line 28
    array-length v8, v7

    .line 29
    if-ge v6, v8, :cond_1

    .line 30
    .line 31
    aget-object v7, v7, v6

    .line 32
    .line 33
    iget-object v7, v7, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 34
    .line 35
    iget-object v7, v7, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v7}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64_lower(Ljava/lang/String;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v7

    .line 41
    aput-wide v7, v4, v6

    .line 42
    .line 43
    add-int/lit8 v6, v6, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-static {v4}, Ljava/util/Arrays;->sort([J)V

    .line 47
    .line 48
    .line 49
    iput-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 50
    .line 51
    :cond_2
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 52
    .line 53
    invoke-static {v4, v2, v3}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-gez v2, :cond_3

    .line 58
    .line 59
    const-string v3, "is"

    .line 60
    .line 61
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_4

    .line 66
    .line 67
    const/4 v2, 0x2

    .line 68
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64_lower(Ljava/lang/String;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v6

    .line 76
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 77
    .line 78
    invoke-static {p1, v6, v7}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move v3, v5

    .line 84
    :cond_4
    :goto_1
    if-ltz v2, :cond_8

    .line 85
    .line 86
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArrayMapping:[S

    .line 87
    .line 88
    const/4 v4, -0x1

    .line 89
    if-nez p1, :cond_7

    .line 90
    .line 91
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 92
    .line 93
    array-length p1, p1

    .line 94
    new-array p1, p1, [S

    .line 95
    .line 96
    invoke-static {p1, v4}, Ljava/util/Arrays;->fill([SS)V

    .line 97
    .line 98
    .line 99
    :goto_2
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 100
    .line 101
    array-length v7, v6

    .line 102
    if-ge v5, v7, :cond_6

    .line 103
    .line 104
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArray:[J

    .line 105
    .line 106
    aget-object v6, v6, v5

    .line 107
    .line 108
    iget-object v6, v6, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 109
    .line 110
    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v6}, Lcom/alibaba/fastjson/util/TypeUtils;->fnv1a_64_lower(Ljava/lang/String;)J

    .line 113
    .line 114
    .line 115
    move-result-wide v8

    .line 116
    invoke-static {v7, v8, v9}, Ljava/util/Arrays;->binarySearch([JJ)I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-ltz v6, :cond_5

    .line 121
    .line 122
    int-to-short v7, v5

    .line 123
    aput-short v7, p1, v6

    .line 124
    .line 125
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_6
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArrayMapping:[S

    .line 129
    .line 130
    :cond_7
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->smartMatchHashArrayMapping:[S

    .line 131
    .line 132
    aget-short p1, p1, v2

    .line 133
    .line 134
    if-eq p1, v4, :cond_8

    .line 135
    .line 136
    invoke-static {p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->isSetFlag(I[I)Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-nez p2, :cond_8

    .line 141
    .line 142
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->sortedFieldDeserializers:[Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    .line 143
    .line 144
    aget-object v1, p0, p1

    .line 145
    .line 146
    :cond_8
    if-eqz v1, :cond_a

    .line 147
    .line 148
    iget-object p0, v1, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 149
    .line 150
    iget p1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->parserFeatures:I

    .line 151
    .line 152
    sget-object p2, Lcom/alibaba/fastjson/parser/Feature;->DisableFieldSmartMatch:Lcom/alibaba/fastjson/parser/Feature;

    .line 153
    .line 154
    iget p2, p2, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    .line 155
    .line 156
    and-int/2addr p1, p2

    .line 157
    if-eqz p1, :cond_9

    .line 158
    .line 159
    return-object v0

    .line 160
    :cond_9
    iget-object p0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 161
    .line 162
    if-eqz v3, :cond_a

    .line 163
    .line 164
    sget-object p1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 165
    .line 166
    if-eq p0, p1, :cond_a

    .line 167
    .line 168
    const-class p1, Ljava/lang/Boolean;

    .line 169
    .line 170
    if-eq p0, p1, :cond_a

    .line 171
    .line 172
    return-object v0

    .line 173
    :cond_a
    return-object v1
.end method
