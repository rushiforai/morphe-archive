.class public final Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;
.super Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
.source "SourceFile"


# instance fields
.field private final collection:Ljava/util/Collection;

.field private final index:I

.field private final key:Ljava/lang/Object;

.field private final list:Ljava/util/List;

.field private final map:Ljava/util/Map;

.field private final parser:Lcom/alibaba/fastjson/parser/DefaultJSONParser;


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/util/List;I)V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 20
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->parser:Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .line 21
    iput p3, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 22
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->list:Ljava/util/List;

    .line 23
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->key:Ljava/lang/Object;

    .line 24
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->map:Ljava/util/Map;

    .line 25
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->collection:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 2

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, v0, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 27
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->parser:Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    const/4 v1, -0x1

    .line 28
    iput v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 29
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->list:Ljava/util/List;

    .line 30
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->key:Ljava/lang/Object;

    .line 31
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->map:Ljava/util/Map;

    .line 32
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->collection:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Ljava/lang/Object;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 3
    .line 4
    .line 5
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->parser:Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 9
    .line 10
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->list:Ljava/util/List;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->key:Ljava/lang/Object;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->map:Ljava/util/Map;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->collection:Ljava/util/Collection;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->map:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->key:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->collection:Ljava/util/Collection;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-interface {p1, p2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->list:Ljava/util/List;

    .line 20
    .line 21
    iget v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 22
    .line 23
    invoke-interface {p1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->list:Ljava/util/List;

    .line 27
    .line 28
    instance-of v0, p1, Lcom/alibaba/fastjson/JSONArray;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    check-cast p1, Lcom/alibaba/fastjson/JSONArray;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSONArray;->getRelatedArray()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget v2, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 45
    .line 46
    if-le v1, v2, :cond_3

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSONArray;->getComponentType()Ljava/lang/reflect/Type;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSONArray;->getComponentType()Ljava/lang/reflect/Type;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->parser:Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {p2, p1, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    :cond_2
    iget p0, p0, Lcom/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer;->index:I

    .line 69
    .line 70
    invoke-static {v0, p0, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void
.end method
