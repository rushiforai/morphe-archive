.class public final Lutil/PatchListGeneratorKt;
.super Ljava/lang/Object;
.source "PatchListGenerator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPatchListGenerator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PatchListGenerator.kt\nutil/PatchListGeneratorKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 5 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n*L\n1#1,150:1\n1739#2:151\n1814#2,3:152\n231#2,2:155\n1739#2:158\n1814#2,3:159\n1221#2:164\n1739#2:165\n1814#2,2:166\n1739#2:168\n1814#2,3:169\n1739#2:172\n1814#2,2:173\n1739#2:175\n1814#2,2:176\n1419#2,4:180\n1816#2:184\n1816#2:185\n1739#2:186\n1814#2,3:187\n1816#2:190\n1#3:157\n37#4,2:162\n625#5:178\n571#5:179\n*S KotlinDebug\n*F\n+ 1 PatchListGenerator.kt\nutil/PatchListGeneratorKt\n*L\n17#1:151\n17#1:152,3\n18#1:155,2\n23#1:158\n23#1:159,3\n40#1:164\n40#1:165\n40#1:166,2\n45#1:168\n45#1:169,3\n48#1:172\n48#1:173,2\n57#1:175\n57#1:176,2\n60#1:180,4\n57#1:184\n48#1:185\n68#1:186\n68#1:187,3\n40#1:190\n23#1:162,2\n60#1:178\n60#1:179\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\u001a\u0006\u0010\u0000\u001a\u00020\u0001\u001a\"\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u0010\u0010\u0005\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00070\u0006H\u0002\u00a8\u0006\u0008"
    }
    d2 = {
        "main",
        "",
        "generatePatchList",
        "version",
        "",
        "patches",
        "",
        "Lapp/morphe/patcher/patch/Patch;",
        "app.yydarlinker:patches"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final generatePatchList(Ljava/lang/String;Ljava/util/Set;)V
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "+",
            "Lapp/morphe/patcher/patch/Patch<",
            "*>;>;)V"
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/io/File;

    const-string v1, "../patches-list.json"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Iterable;

    .line 164
    new-instance v2, Lutil/PatchListGeneratorKt$generatePatchList$$inlined$sortedBy$1;

    invoke-direct {v2}, Lutil/PatchListGeneratorKt$generatePatchList$$inlined$sortedBy$1;-><init>()V

    check-cast v2, Ljava/util/Comparator;

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 165
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 166
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 167
    check-cast v4, Lapp/morphe/patcher/patch/Patch;

    .line 42
    invoke-virtual {v4}, Lapp/morphe/patcher/patch/Patch;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 43
    invoke-virtual {v4}, Lapp/morphe/patcher/patch/Patch;->getDescription()Ljava/lang/String;

    move-result-object v8

    .line 44
    invoke-virtual {v4}, Lapp/morphe/patcher/patch/Patch;->getDefault()Z

    move-result v9

    .line 45
    invoke-virtual {v4}, Lapp/morphe/patcher/patch/Patch;->getDependencies()Ljava/util/Set;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .line 168
    new-instance v10, Ljava/util/ArrayList;

    invoke-static {v6, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v10, Ljava/util/Collection;

    .line 169
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_59
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_71

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 170
    check-cast v11, Lapp/morphe/patcher/patch/Patch;

    .line 45
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v11

    .line 170
    invoke-interface {v10, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 171
    :cond_71
    check-cast v10, Ljava/util/List;

    .line 48
    invoke-virtual {v4}, Lapp/morphe/patcher/patch/Patch;->getCompatibility()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_190

    check-cast v6, Ljava/lang/Iterable;

    .line 172
    new-instance v11, Ljava/util/ArrayList;

    invoke-static {v6, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .line 173
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_8a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_187

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 174
    check-cast v12, Lapp/morphe/patcher/patch/Compatibility;

    .line 50
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 51
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getName()Ljava/lang/String;

    move-result-object v15

    .line 52
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getDescription()Ljava/lang/String;

    move-result-object v16

    .line 53
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getApkFileType()Lapp/morphe/patcher/patch/ApkFileType;

    move-result-object v13

    if-eqz v13, :cond_b2

    invoke-virtual {v13}, Lapp/morphe/patcher/patch/ApkFileType;->name()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v17, v13

    goto :goto_b4

    :cond_b2
    const/16 v17, 0x0

    .line 55
    :goto_b4
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getAppIconColor()Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_db

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    const/4 v5, 0x1

    invoke-static {v13, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    const-string v13, "#%06X"

    invoke-static {v13, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v13, "format(...)"

    invoke-static {v5, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v18, v5

    goto :goto_dd

    :cond_db
    const/16 v18, 0x0

    .line 56
    :goto_dd
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getSignatures()Ljava/util/Set;

    move-result-object v19

    .line 57
    invoke-virtual {v12}, Lapp/morphe/patcher/patch/Compatibility;->getTargets()Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    .line 175
    new-instance v12, Ljava/util/ArrayList;

    invoke-static {v5, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v12, Ljava/util/Collection;

    .line 176
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_f6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_173

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 177
    check-cast v13, Lapp/morphe/patcher/patch/AppTarget;

    .line 59
    invoke-virtual {v13}, Lapp/morphe/patcher/patch/AppTarget;->getVersion()Ljava/lang/String;

    move-result-object v21

    .line 60
    invoke-virtual {v13}, Lapp/morphe/patcher/patch/AppTarget;->getVersionCodes()Ljava/util/Map;

    move-result-object v20

    if-eqz v20, :cond_150

    .line 178
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->size()I

    move-result v22

    move-object/from16 v26, v1

    invoke-static/range {v22 .. v22}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v1

    invoke-direct {v3, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v3, Ljava/util/Map;

    .line 179
    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 180
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_127
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_14d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .line 181
    check-cast v20, Ljava/util/Map$Entry;

    .line 60
    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lapp/morphe/patcher/patch/SupportedAbi;

    move-object/from16 v23, v1

    invoke-virtual/range {v22 .. v22}, Lapp/morphe/patcher/patch/SupportedAbi;->name()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v27, v4

    .line 179
    invoke-interface/range {v20 .. v20}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 181
    invoke-interface {v3, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, v23

    move-object/from16 v4, v27

    goto :goto_127

    :cond_14d
    move-object/from16 v22, v3

    goto :goto_154

    :cond_150
    move-object/from16 v26, v1

    const/16 v22, 0x0

    :goto_154
    move-object/from16 v27, v4

    .line 61
    invoke-virtual {v13}, Lapp/morphe/patcher/patch/AppTarget;->isExperimental()Z

    move-result v23

    .line 62
    invoke-virtual {v13}, Lapp/morphe/patcher/patch/AppTarget;->getMinSdk()Ljava/lang/Integer;

    move-result-object v24

    .line 63
    invoke-virtual {v13}, Lapp/morphe/patcher/patch/AppTarget;->getDescription()Ljava/lang/String;

    move-result-object v25

    .line 58
    new-instance v20, Lutil/JsonCompatibility$Target;

    invoke-direct/range {v20 .. v25}, Lutil/JsonCompatibility$Target;-><init>(Ljava/lang/String;Ljava/util/Map;ZLjava/lang/Integer;Ljava/lang/String;)V

    move-object/from16 v1, v20

    .line 177
    invoke-interface {v12, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v1, v26

    move-object/from16 v4, v27

    const/16 v3, 0xa

    goto :goto_f6

    :cond_173
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    .line 184
    move-object/from16 v20, v12

    check-cast v20, Ljava/util/List;

    .line 49
    new-instance v13, Lutil/JsonCompatibility;

    invoke-direct/range {v13 .. v20}, Lutil/JsonCompatibility;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/util/List;)V

    .line 174
    invoke-interface {v11, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v3, 0xa

    goto/16 :goto_8a

    :cond_187
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    .line 185
    move-object v5, v11

    check-cast v5, Ljava/util/List;

    move-object v11, v5

    goto :goto_195

    :cond_190
    move-object/from16 v26, v1

    move-object/from16 v27, v4

    const/4 v11, 0x0

    .line 68
    :goto_195
    invoke-virtual/range {v27 .. v27}, Lapp/morphe/patcher/patch/Patch;->getOptions()Lapp/morphe/patcher/patch/Options;

    move-result-object v1

    invoke-virtual {v1}, Lapp/morphe/patcher/patch/Options;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 186
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v3, Ljava/util/Collection;

    .line 187
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1b0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1e5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 188
    check-cast v5, Lapp/morphe/patcher/patch/Option;

    .line 69
    new-instance v12, Lutil/JsonPatch$Option;

    .line 70
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getKey()Ljava/lang/String;

    move-result-object v13

    .line 71
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getTitle()Ljava/lang/String;

    move-result-object v14

    .line 72
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getDescription()Ljava/lang/String;

    move-result-object v15

    .line 73
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getRequired()Z

    move-result v16

    .line 74
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getType()Lkotlin/reflect/KType;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    .line 75
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getDefault()Ljava/lang/Object;

    move-result-object v18

    .line 76
    invoke-virtual {v5}, Lapp/morphe/patcher/patch/Option;->getValues()Ljava/util/Map;

    move-result-object v19

    .line 69
    invoke-direct/range {v12 .. v19}, Lutil/JsonPatch$Option;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Object;Ljava/util/Map;)V

    .line 188
    invoke-interface {v3, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1b0

    .line 189
    :cond_1e5
    move-object v12, v3

    check-cast v12, Ljava/util/List;

    .line 41
    new-instance v6, Lutil/JsonPatch;

    invoke-direct/range {v6 .. v12}, Lutil/JsonPatch;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 167
    invoke-interface {v2, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move v3, v4

    move-object/from16 v1, v26

    goto/16 :goto_29

    .line 190
    :cond_1f5
    check-cast v2, Ljava/util/List;

    .line 82
    new-instance v1, Lcom/google/gson/GsonBuilder;

    invoke-direct {v1}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 83
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->serializeNulls()Lcom/google/gson/GsonBuilder;

    move-result-object v1

    .line 84
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->disableHtmlEscaping()Lcom/google/gson/GsonBuilder;

    move-result-object v1

    .line 85
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->setPrettyPrinting()Lcom/google/gson/GsonBuilder;

    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v1

    .line 88
    new-instance v3, Lcom/google/gson/JsonObject;

    invoke-direct {v3}, Lcom/google/gson/JsonObject;-><init>()V

    .line 90
    const-string v4, "NOTE"

    .line 91
    const-string v5, "Do NOT manually edit this file. This file is automatically updated when semantic release (release.yml) runs. Manually editing this file can break your releases and break third party tools that use this file."

    .line 89
    invoke-virtual {v3, v4, v5}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v4, "version"

    move-object/from16 v5, p0

    invoke-virtual {v3, v4, v5}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const-string v4, "patches"

    invoke-virtual {v1, v2}, Lcom/google/gson/Gson;->toJsonTree(Ljava/lang/Object;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 98
    check-cast v3, Lcom/google/gson/JsonElement;

    invoke-virtual {v1, v3}, Lcom/google/gson/Gson;->toJson(Lcom/google/gson/JsonElement;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "toJson(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2, v3}, Lkotlin/io/FilesKt;->writeText$default(Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)V

    return-void
.end method

.method public static final main()V
    .registers 9

    .line 17
    new-instance v0, Ljava/io/File;

    const-string v1, "../gradle.properties"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlin/io/FilesKt;->readLines$default(Ljava/io/File;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 151
    new-instance v1, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 152
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 153
    check-cast v4, Ljava/lang/String;

    .line 17
    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 153
    invoke-interface {v1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_20

    .line 154
    :cond_3a
    check-cast v1, Ljava/util/List;

    .line 151
    check-cast v1, Ljava/lang/Iterable;

    .line 155
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_42
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_11b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 18
    const-string v4, "version"

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-static {v1, v4, v5, v6, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    const-string v7, "="

    move-object v8, v7

    check-cast v8, Ljava/lang/CharSequence;

    invoke-static {v4, v8, v5, v6, v2}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    invoke-static {v1, v7, v2, v6, v2}, Lkotlin/text/StringsKt;->substringAfter$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 19
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "build/libs/patches-"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".mpp"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_103

    .line 21
    invoke-static {v1}, Lkotlin/collections/SetsKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 22
    invoke-static {v0}, Lapp/morphe/patcher/patch/PatchKt;->loadPatchesFromJar(Ljava/util/Set;)Lapp/morphe/patcher/patch/PatchLoader$Jar;

    move-result-object v1

    .line 23
    check-cast v0, Ljava/lang/Iterable;

    .line 158
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 159
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_ab
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 160
    check-cast v3, Ljava/io/File;

    .line 23
    invoke-virtual {v3}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v3

    .line 160
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_ab

    .line 161
    :cond_c3
    check-cast v2, Ljava/util/List;

    .line 158
    check-cast v2, Ljava/util/Collection;

    .line 163
    new-array v0, v5, [Ljava/net/URL;

    invoke-interface {v2, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/net/URL;

    .line 23
    new-instance v2, Ljava/net/URLClassLoader;

    invoke-direct {v2, v0}, Ljava/net/URLClassLoader;-><init>([Ljava/net/URL;)V

    .line 24
    const-string v0, "META-INF/MANIFEST.MF"

    invoke-virtual {v2, v0}, Ljava/net/URLClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    .line 26
    :cond_da
    :goto_da
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_102

    .line 27
    new-instance v2, Ljava/util/jar/Manifest;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/jar/Manifest;-><init>(Ljava/io/InputStream;)V

    .line 28
    invoke-virtual {v2}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v2

    .line 29
    const-string v3, "Version"

    invoke-virtual {v2, v3}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_da

    .line 31
    move-object v3, v1

    check-cast v3, Ljava/util/Set;

    invoke-static {v2, v3}, Lutil/PatchListGeneratorKt;->generatePatchList(Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_da

    :cond_102
    return-void

    .line 20
    :cond_103
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Missing current version bundle: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_11b
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Collection contains no element matching the predicate."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic main([Ljava/lang/String;)V
    .registers 1

    invoke-static {}, Lutil/PatchListGeneratorKt;->main()V

    return-void
.end method
