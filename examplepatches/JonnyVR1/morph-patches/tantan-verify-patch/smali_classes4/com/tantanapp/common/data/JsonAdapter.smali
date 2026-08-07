.class public abstract Lcom/tantanapp/common/data/JsonAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/common/data/INetParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/tantanapp/common/data/INetParser<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final BOOLEAN_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final DOUBLE_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public static final DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public static final INT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNIT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static jf:Lcom/fasterxml/jackson/core/JsonFactory;


# instance fields
.field private aa:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private ma:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->UNIT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$3;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$3;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$4;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$4;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$5;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$5;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    .line 36
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$6;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$6;-><init>()V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 42
    .line 43
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$7;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$7;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    .line 50
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$10;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/tantanapp/common/data/JsonAdapter$10;-><init>()V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/tantanapp/common/data/JsonAdapter;->BOOLEAN_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->aa:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->ma:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    return-void
.end method

.method public static ARRAY_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$9;

    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter$9;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    return-object v0
.end method

.method public static final JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->jf:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->jf:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/fasterxml/jackson/core/JsonFactory;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/common/data/JsonAdapter;->jf:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->jf:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 27
    .line 28
    return-object v0
.end method

.method public static MAP_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Lcom/tantanapp/common/data/JsonAdapter$8;

    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter$8;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    return-object v0
.end method

.method public static parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TK;>;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")",
            "Ljava/util/List<",
            "TK;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 6
    .line 7
    if-ne v0, v1, :cond_2

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 20
    .line 21
    if-eq v1, v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object v0

    .line 34
    :cond_2
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public static parseMap(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TK;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "TK;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 6
    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 19
    .line 20
    if-eq v1, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p0, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-object v0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public static serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TK;>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TK;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p2, v0, p1, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static serializeMap(Ljava/util/Map;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TK;>;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TK;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/util/Map$Entry;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {p2, v0, p1, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->aa:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->aa:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/JsonAdapter;->aa:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    return-object p0
.end method

.method public MAP_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->ma:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/JsonAdapter;->ma:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/JsonAdapter;->ma:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    return-object p0
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public parse(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public abstract parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 23
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/io/InputStream;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 26
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    return-object p0
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/io/InputStream;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 29
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    .line 30
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    return-object p0
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 35
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    return-object p0
.end method

.method public parse([BLjava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser([B)Lcom/fasterxml/jackson/core/JsonParser;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public serialize(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/StringWriter;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {p0, p1, v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public abstract serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public serialize(Ljava/lang/Object;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .line 26
    :try_start_0
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object p2

    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 28
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
