.class public abstract Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.super Lcom/tantanapp/common/data/JsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/tantanapp/common/data/ValueObject;",
        ">",
        "Lcom/tantanapp/common/data/JsonAdapter<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/JsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addExtDataToModuleData(Ljava/util/ArrayList;Ljava/lang/String;Lcom/tantanapp/common/data/ValueObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/ValueObject;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1, p3}, Lcom/tantanapp/common/data/BaseData;->addExtData(Lcom/tantanapp/common/data/ValueObject;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method private parseOnce(Lcom/fasterxml/jackson/core/JsonParser;Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 15
    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 27
    .line 28
    if-eq p0, v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {p3, v3}, Lcom/tantanapp/common/data/ValueObject;->putParsedField(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 38
    .line 39
    .line 40
    move-object v4, p1

    .line 41
    move-object v1, p2

    .line 42
    move-object v2, p3

    .line 43
    move-object v5, p4

    .line 44
    move-object v6, p5

    .line 45
    move-object v7, p6

    .line 46
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-object v2, p3

    .line 54
    if-nez p7, :cond_3

    .line 55
    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->onApiParseComplete()V

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method


# virtual methods
.method public abstract newInstance()Lcom/tantanapp/common/data/ValueObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Lcom/tantanapp/common/data/ValueObject;
    .locals 16
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

    move-object/from16 v3, p1

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->newInstance()Lcom/tantanapp/common/data/ValueObject;

    move-result-object v8

    .line 2
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ValueObject;->getClassParseName()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v4, p2

    .line 3
    invoke-virtual {v8, v4}, Lcom/tantanapp/common/data/ValueObject;->setParsedApiRequest(Ljava/lang/String;)V

    .line 4
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    if-nez v1, :cond_0

    .line 5
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 6
    :cond_0
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v5, 0x0

    if-eq v1, v2, :cond_1

    .line 7
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    return-object v5

    .line 8
    :cond_1
    instance-of v1, v8, Lcom/p1/mobile/putong/data/Data;

    const/4 v7, 0x1

    if-nez v1, :cond_9

    .line 9
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/rrq;->c(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 11
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 12
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v6, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Pair;

    .line 14
    iget-object v9, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    invoke-virtual {v9}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->newInstance()Lcom/tantanapp/common/data/ValueObject;

    move-result-object v9

    .line 15
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    iget-object v11, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v11, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    move-object/from16 v10, p0

    move-object/from16 v11, p3

    invoke-direct {v10, v11, v6, v9}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->addExtDataToModuleData(Ljava/util/ArrayList;Ljava/lang/String;Lcom/tantanapp/common/data/ValueObject;)V

    move v6, v7

    goto :goto_0

    :cond_2
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move-object v9, v2

    move-object v12, v5

    goto :goto_1

    :cond_3
    move-object/from16 v10, p0

    move-object/from16 v11, p3

    move v6, v1

    move-object v9, v5

    move-object v12, v9

    :goto_1
    if-eqz v6, :cond_6

    .line 18
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v13

    .line 19
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 20
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v13, v2}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v2

    .line 21
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/dbcenter/parse/JsonParseHelper;->readJsonBegin(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 22
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->flush()V

    .line 23
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V

    .line 24
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v14

    .line 25
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 26
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v15, v0, 0x1

    move v0, v1

    :goto_2
    if-ge v0, v15, :cond_5

    .line 27
    invoke-virtual {v13, v14}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v1

    .line 28
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 29
    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/tantanapp/common/data/ValueObject;

    .line 30
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    const/4 v7, 0x0

    move-object v5, v10

    move v10, v0

    move-object v0, v5

    move-object/from16 v6, p4

    move-object v5, v11

    .line 31
    invoke-direct/range {v0 .. v7}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseOnce(Lcom/fasterxml/jackson/core/JsonParser;Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;Z)V

    move-object v1, v8

    goto :goto_3

    :cond_4
    move v10, v0

    const/4 v7, 0x1

    move-object/from16 v2, p0

    move-object/from16 v0, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object v3, v8

    .line 32
    invoke-direct/range {v0 .. v7}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseOnce(Lcom/fasterxml/jackson/core/JsonParser;Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;Z)V

    move-object v1, v3

    :goto_3
    add-int/lit8 v0, v10, 0x1

    move-object/from16 v10, p0

    move-object/from16 v4, p2

    move-object/from16 v11, p3

    move-object v8, v1

    goto :goto_2

    :cond_5
    move-object v10, v8

    goto :goto_5

    :cond_6
    move-object v1, v8

    .line 33
    :goto_4
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v2, :cond_7

    .line 34
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->putParsedField(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    .line 37
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-object v10, v1

    move-object v8, v3

    .line 38
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_4

    :cond_7
    move-object v10, v1

    :goto_5
    if-eqz v9, :cond_8

    .line 39
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 40
    invoke-virtual {v10, v9}, Lcom/tantanapp/common/data/ValueObject;->setExtTabList(Ljava/util/ArrayList;)V

    :cond_8
    move-object/from16 v6, p4

    goto/16 :goto_c

    :cond_9
    move-object v10, v8

    move-object v8, v3

    .line 41
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    move-result-object v0

    invoke-virtual {v0}, Ll/rrq;->a()Ljava/util/ArrayList;

    move-result-object v0

    .line 42
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 43
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->newInstance()Lcom/tantanapp/common/data/ValueObject;

    move-result-object v2

    check-cast v2, Lcom/tantanapp/common/data/BaseData;

    .line 46
    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 48
    :cond_a
    :goto_7
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_12

    .line 49
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 50
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 51
    invoke-static {v9, v2}, Lcom/p1/mobile/putong/dbcenter/parse/JsonParseHelper;->parseTimes(Ljava/util/ArrayList;Ljava/lang/String;)I

    move-result v0

    .line 52
    const-string v11, "id"

    if-le v0, v7, :cond_e

    .line 53
    invoke-static {}, Lcom/tantanapp/common/data/JsonAdapter;->JSON_FACTORY()Lcom/fasterxml/jackson/core/JsonFactory;

    move-result-object v12

    .line 54
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 55
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v12, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v1

    .line 56
    invoke-static {v8, v1}, Lcom/p1/mobile/putong/dbcenter/parse/JsonParseHelper;->readJsonBegin(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 57
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->flush()V

    .line 58
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V

    .line 59
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v13

    .line 60
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 61
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_b
    :goto_8
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/util/Pair;

    .line 62
    invoke-virtual {v12, v13}, Lcom/fasterxml/jackson/core/JsonFactory;->createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 64
    iget-object v0, v15, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    iget-object v1, v15, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/tantanapp/common/data/BaseData;

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    .line 65
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 66
    invoke-static {v2, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 67
    :cond_c
    iget-object v0, v15, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/tantanapp/common/data/BaseData;

    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/ValueObject;->putParsedField(Ljava/lang/String;)V

    goto :goto_8

    :cond_d
    move-object/from16 v6, p4

    goto :goto_a

    .line 68
    :cond_e
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_9
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroid/util/Pair;

    .line 69
    iget-object v0, v13, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;

    iget-object v1, v13, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/tantanapp/common/data/BaseData;

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object v3, v8

    .line 70
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 71
    invoke-static {v2, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 72
    :cond_f
    iget-object v1, v13, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/tantanapp/common/data/BaseData;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->putParsedField(Ljava/lang/String;)V

    :cond_10
    if-eqz v0, :cond_11

    goto :goto_a

    :cond_11
    move-object/from16 v8, p1

    goto :goto_9

    .line 73
    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    move-object/from16 v8, p1

    goto/16 :goto_7

    :cond_12
    move-object/from16 v6, p4

    .line 74
    move-object v8, v10

    check-cast v8, Lcom/p1/mobile/putong/data/Data;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v8, Lcom/p1/mobile/putong/data/Data;->dataList:Ljava/util/ArrayList;

    .line 76
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 77
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lcom/tantanapp/common/data/BaseData;

    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 78
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Lcom/tantanapp/common/data/BaseData;

    invoke-virtual {v2}, Lcom/tantanapp/common/data/ValueObject;->onApiParseComplete()V

    .line 79
    iget-object v2, v8, Lcom/p1/mobile/putong/data/Data;->dataList:Ljava/util/ArrayList;

    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lcom/tantanapp/common/data/BaseData;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_13
    :goto_c
    if-eqz v6, :cond_15

    .line 80
    invoke-virtual {v6, v10}, Lcom/tantanapp/common/data/DataChecker;->needCheck(Lcom/tantanapp/common/data/ValueObject;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 81
    invoke-virtual {v6, v10}, Lcom/tantanapp/common/data/DataChecker;->netDataErrorCheck(Lcom/tantanapp/common/data/ValueObject;)Z

    move-result v0

    if-nez v0, :cond_14

    goto :goto_d

    .line 82
    :cond_14
    new-instance v0, Lcom/p1/mobile/putong/dbcenter/parse/DataCheckException;

    const-string v1, "parsed error"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/dbcenter/parse/DataCheckException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_15
    :goto_d
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 84
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ValueObject;->onApiParseComplete()V

    return-object v10
.end method

.method public bridge synthetic parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Lcom/tantanapp/common/data/ValueObject;

    move-result-object p0

    return-object p0
.end method

.method public abstract parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    const/4 p0, 0x0

    return p0
.end method

.method public final serialize(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 0
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

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    if-eqz p3, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 10
    .line 11
    .line 12
    :cond_1
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ValueObject;->beforeApiSerialize()Lcom/tantanapp/common/data/ValueObject;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 22
    .line 23
    .line 24
    :cond_2
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->serialize(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method

.method public abstract serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
