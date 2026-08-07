.class public Lcom/alibaba/fastjson/serializer/MapSerializer;
.super Lcom/alibaba/fastjson/serializer/SerializeFilterable;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field private static final NON_STRINGKEY_AS_STRING:I

.field public static instance:Lcom/alibaba/fastjson/serializer/MapSerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/MapSerializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/MapSerializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/MapSerializer;->instance:Lcom/alibaba/fastjson/serializer/MapSerializer;

    .line 7
    .line 8
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 9
    .line 10
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringKeyAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 11
    .line 12
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 13
    .line 14
    filled-new-array {v0, v1, v2}, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sput v0, Lcom/alibaba/fastjson/serializer/MapSerializer;->NON_STRINGKEY_AS_STRING:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    .line 105
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/serializer/MapSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;IZ)V

    return-void
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;IZ)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move-object/from16 v7, p4

    .line 1
    iget-object v8, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    if-nez v3, :cond_0

    .line 2
    invoke-virtual {v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    .line 3
    :cond_0
    move-object v2, v3

    check-cast v2, Ljava/util/Map;

    .line 4
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->MapSortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 5
    iget v5, v8, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    and-int/2addr v5, v4

    if-nez v5, :cond_2

    and-int v4, p5, v4

    if-eqz v4, :cond_1

    goto :goto_0

    :catch_0
    :cond_1
    move-object v9, v2

    goto :goto_1

    .line 6
    :cond_2
    :goto_0
    instance-of v4, v2, Lcom/alibaba/fastjson/JSONObject;

    if-eqz v4, :cond_3

    .line 7
    check-cast v2, Lcom/alibaba/fastjson/JSONObject;

    invoke-virtual {v2}, Lcom/alibaba/fastjson/JSONObject;->getInnerMap()Ljava/util/Map;

    move-result-object v2

    .line 8
    :cond_3
    instance-of v4, v2, Ljava/util/SortedMap;

    if-nez v4, :cond_1

    instance-of v4, v2, Ljava/util/LinkedHashMap;

    if-nez v4, :cond_1

    .line 9
    :try_start_0
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v9, v4

    .line 10
    :goto_1
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 11
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    return-void

    .line 12
    :cond_4
    iget-object v10, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    const/4 v11, 0x0

    move-object/from16 v2, p3

    .line 13
    invoke-virtual {v1, v10, v3, v2, v11}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    if-nez p6, :cond_5

    const/16 v2, 0x7b

    .line 14
    :try_start_1
    invoke-virtual {v8, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_18

    .line 15
    :cond_5
    :goto_2
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->incrementIndent()V

    .line 16
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v8, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v2

    const/4 v12, 0x1

    if-eqz v2, :cond_8

    .line 17
    iget-object v2, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    iget-object v2, v2, Lcom/alibaba/fastjson/serializer/SerializeConfig;->typeKey:Ljava/lang/String;

    .line 18
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 19
    const-class v5, Lcom/alibaba/fastjson/JSONObject;

    if-eq v4, v5, :cond_6

    const-class v5, Ljava/util/HashMap;

    if-eq v4, v5, :cond_6

    const-class v5, Ljava/util/LinkedHashMap;

    if-ne v4, v5, :cond_7

    .line 20
    :cond_6
    invoke-interface {v9, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_3

    .line 21
    :cond_7
    invoke-virtual {v8, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 22
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    move v2, v11

    goto :goto_4

    :cond_8
    :goto_3
    move v2, v12

    .line 23
    :goto_4
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    move v15, v2

    const/4 v2, 0x0

    const/16 v16, 0x0

    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 24
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 25
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 26
    iget-object v6, v1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    if-eqz v6, :cond_c

    .line 27
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_c

    if-eqz v4, :cond_b

    .line 28
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_9

    goto :goto_7

    .line 29
    :cond_9
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_a

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_c

    .line 30
    :cond_a
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 31
    invoke-virtual {v0, v1, v3, v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->applyName(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_c

    :goto_6
    move/from16 v6, p5

    move-object v11, v2

    goto/16 :goto_13

    .line 32
    :cond_b
    :goto_7
    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->applyName(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_c

    goto :goto_6

    .line 33
    :cond_c
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    if-eqz v6, :cond_10

    .line 34
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_10

    if-eqz v4, :cond_f

    .line 35
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_d

    goto :goto_8

    .line 36
    :cond_d
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_e

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_10

    .line 37
    :cond_e
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 38
    invoke-virtual {v0, v1, v3, v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->applyName(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_10

    goto :goto_6

    .line 39
    :cond_f
    :goto_8
    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->applyName(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_10

    goto :goto_6

    .line 40
    :cond_10
    iget-object v6, v1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    if-eqz v6, :cond_14

    .line 41
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_14

    if-eqz v4, :cond_13

    .line 42
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_11

    goto :goto_9

    .line 43
    :cond_11
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_12

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_14

    .line 44
    :cond_12
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 45
    invoke-virtual {v0, v1, v3, v6, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_14

    goto :goto_6

    .line 46
    :cond_13
    :goto_9
    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v6, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_14

    goto :goto_6

    .line 47
    :cond_14
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    if-eqz v6, :cond_18

    .line 48
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_18

    if-eqz v4, :cond_17

    .line 49
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_15

    goto :goto_a

    .line 50
    :cond_15
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_16

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_18

    .line 51
    :cond_16
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 52
    invoke-virtual {v0, v1, v3, v6, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    goto/16 :goto_6

    .line 53
    :cond_17
    :goto_a
    move-object v6, v4

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v6, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    goto/16 :goto_6

    .line 54
    :cond_18
    iget-object v6, v1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    if-eqz v6, :cond_1c

    .line 55
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_1c

    if-eqz v4, :cond_1b

    .line 56
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_19

    goto :goto_b

    .line 57
    :cond_19
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_1a

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_1c

    .line 58
    :cond_1a
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 59
    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processKey(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_c

    .line 60
    :cond_1b
    :goto_b
    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processKey(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 61
    :cond_1c
    :goto_c
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    if-eqz v6, :cond_20

    .line 62
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_20

    if-eqz v4, :cond_1f

    .line 63
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_1d

    goto :goto_d

    .line 64
    :cond_1d
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_1e

    instance-of v6, v4, Ljava/lang/Number;

    if-eqz v6, :cond_20

    .line 65
    :cond_1e
    invoke-static {v4}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 66
    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processKey(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 67
    :cond_1f
    :goto_d
    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processKey(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_20
    :goto_e
    if-eqz v4, :cond_21

    .line 68
    :try_start_2
    instance-of v6, v4, Ljava/lang/String;

    if-eqz v6, :cond_22

    :cond_21
    move-object v11, v2

    move-object v14, v4

    goto :goto_11

    .line 69
    :cond_22
    instance-of v6, v4, Ljava/util/Map;

    if-nez v6, :cond_23

    instance-of v6, v4, Ljava/util/Collection;

    if-eqz v6, :cond_24

    :cond_23
    move-object v11, v2

    move-object v14, v4

    goto :goto_f

    :cond_24
    move-object v6, v4

    .line 70
    invoke-static {v6}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v17, v2

    const/4 v2, 0x0

    move-object v14, v6

    move-object/from16 v11, v17

    move/from16 v6, p5

    .line 71
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processValue(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    :goto_f
    move-object/from16 v1, p1

    move/from16 v6, p5

    :goto_10
    move-object v2, v5

    goto :goto_12

    :catchall_1
    move-exception v0

    move-object/from16 v1, p1

    goto/16 :goto_18

    .line 72
    :goto_11
    move-object v4, v14

    check-cast v4, Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move/from16 v6, p5

    :try_start_3
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->processValue(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_10

    :goto_12
    if-nez v2, :cond_25

    .line 73
    iget v0, v8, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-static {v0, v6, v3}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->isEnabled(IILcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-nez v0, :cond_25

    :goto_13
    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-object v2, v11

    const/4 v11, 0x0

    goto/16 :goto_5

    .line 74
    :cond_25
    instance-of v0, v14, Ljava/lang/String;

    const/16 v3, 0x2c

    if-eqz v0, :cond_28

    .line 75
    move-object v4, v14

    check-cast v4, Ljava/lang/String;

    if-nez v15, :cond_26

    .line 76
    invoke-virtual {v8, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 77
    :cond_26
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 78
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 79
    :cond_27
    invoke-virtual {v8, v4, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    goto :goto_15

    :cond_28
    if-nez v15, :cond_29

    .line 80
    invoke-virtual {v8, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 81
    :cond_29
    sget v0, Lcom/alibaba/fastjson/serializer/MapSerializer;->NON_STRINGKEY_AS_STRING:I

    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(I)Z

    move-result v0

    if-nez v0, :cond_2a

    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringKeyAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-static {v6, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->isEnabled(ILcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_2b

    :cond_2a
    instance-of v0, v14, Ljava/lang/Enum;

    if-nez v0, :cond_2b

    .line 82
    invoke-static {v14}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 83
    invoke-virtual {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    goto :goto_14

    .line 84
    :cond_2b
    invoke-virtual {v1, v14}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    :goto_14
    const/16 v0, 0x3a

    .line 85
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :goto_15
    if-nez v2, :cond_2c

    .line 86
    invoke-virtual {v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-object v2, v11

    const/4 v11, 0x0

    const/4 v15, 0x0

    goto/16 :goto_5

    .line 87
    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    if-eq v0, v11, :cond_2d

    .line 88
    invoke-virtual {v1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v16

    move-object v11, v0

    :cond_2d
    move-object/from16 v15, v16

    .line 89
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-static {v6, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->isEnabled(ILcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_2f

    :try_start_4
    instance-of v0, v15, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    if-eqz v0, :cond_2f

    .line 90
    instance-of v0, v7, Ljava/lang/reflect/ParameterizedType;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_2e

    .line 91
    :try_start_5
    move-object v0, v7

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 92
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 93
    array-length v3, v0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2e

    .line 94
    aget-object v0, v0, v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object v4, v0

    goto :goto_16

    :cond_2e
    const/4 v4, 0x0

    .line 95
    :goto_16
    :try_start_6
    move-object v0, v15

    check-cast v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move v5, v6

    move-object v3, v14

    .line 96
    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->writeNoneASM(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-object/from16 v1, p1

    move-object v0, v15

    goto :goto_17

    :cond_2f
    move-object v3, v14

    const/4 v4, 0x0

    move-object/from16 v1, p1

    move/from16 v5, p5

    move-object v0, v15

    .line 97
    :try_start_7
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :goto_17
    move-object/from16 v3, p2

    move-object/from16 v16, v0

    move-object v2, v11

    const/4 v11, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    goto/16 :goto_5

    .line 98
    :cond_30
    iput-object v10, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 99
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->decrementIdent()V

    .line 100
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_31

    .line 101
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    :cond_31
    if-nez p6, :cond_32

    const/16 v0, 0x7d

    .line 102
    invoke-virtual {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :cond_32
    return-void

    .line 103
    :goto_18
    iput-object v10, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 104
    throw v0
.end method
