.class public final synthetic Lk9d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Ln9d;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ln9d;B)V
    .registers 4

    iput-byte p3, p0, Lk9d;->a:B

    iput-object p1, p0, Lk9d;->b:Ljava/util/Set;

    iput-object p2, p0, Lk9d;->c:Ln9d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Lk9d;->a:B

    iget-object v2, v0, Lk9d;->c:Ln9d;

    iget-object v3, v0, Lk9d;->b:Ljava/util/Set;

    packed-switch v1, :pswitch_data_388

    move-object/from16 v0, p1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, v0, Lq0i;

    if-nez v1, :cond_20

    check-cast v0, Lm9d;

    iget-object v1, v2, Ln9d;->g:Ljava/util/Set;

    if-ne v3, v1, :cond_20

    iget-object v1, v2, Ln9d;->d:Lh42;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_20
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/Unit;

    iget-object v1, v2, Ln9d;->e:Ljava/util/LinkedHashMap;

    iget-object v0, v2, Ln9d;->b:Luu1;

    invoke-virtual {v0}, Luu1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iget-object v2, v2, Ln9d;->c:Landroid/content/res/AssetManager;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-nez v4, :cond_3f

    sget-object v0, Lv08;->a:Lv08;

    goto/16 :goto_d0

    :cond_3f
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_49

    sget-object v0, Lv08;->a:Lv08;

    goto/16 :goto_d0

    :cond_49
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    if-nez v4, :cond_53

    sget-object v0, Lv08;->a:Lv08;

    goto/16 :goto_d0

    :cond_53
    new-instance v7, Ljava/util/ArrayList;

    array-length v0, v4

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    array-length v8, v4

    move v9, v5

    :goto_5b
    if-ge v9, v8, :cond_c4

    aget-object v10, v4, v9

    sget-object v11, Lf8a;->h:Lf8a;

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    iget-object v12, v11, Lf8a;->a:Ljava/lang/String;

    invoke-static {v12}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v12

    invoke-virtual {v12}, Ljava/security/MessageDigest;->reset()V

    new-instance v13, Lc5o;

    invoke-direct {v13, v11, v12, v5}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v12, Ll8a;

    invoke-direct {v12, v0, v13}, Ll8a;-><init>(Ljava/io/FileInputStream;Lc5o;)V

    :try_start_79
    sget-object v0, Lt0i;->b:Lp0i;
    :try_end_7b
    .catchall {:try_start_79 .. :try_end_7b} :catchall_9a

    :try_start_7b
    new-instance v0, Le4f;

    invoke-direct {v0}, Ljava/io/OutputStream;-><init>()V

    invoke-static {v12, v0}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_83
    .catchall {:try_start_7b .. :try_end_83} :catchall_92

    :try_start_83
    invoke-virtual {v12}, Ll8a;->close()V

    iget-object v0, v12, Ll8a;->b:Ljava/lang/String;

    if-nez v0, :cond_a3

    const-string v0, "Required value was null."

    new-instance v12, Ljava/lang/IllegalStateException;

    invoke-direct {v12, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_92
    .catchall {:try_start_83 .. :try_end_92} :catchall_9a

    :catchall_92
    move-exception v0

    move-object v13, v0

    :try_start_94
    throw v13
    :try_end_95
    .catchall {:try_start_94 .. :try_end_95} :catchall_95

    :catchall_95
    move-exception v0

    :try_start_96
    invoke-static {v12, v13}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_9a
    .catchall {:try_start_96 .. :try_end_9a} :catchall_9a

    :catchall_9a
    move-exception v0

    sget-object v12, Lt0i;->b:Lp0i;

    new-instance v12, Lq0i;

    invoke-direct {v12, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v12

    :cond_a3
    iget-object v11, v11, Lf8a;->c:Lkotlin/jvm/functions/Function1;

    instance-of v12, v0, Lq0i;

    if-nez v12, :cond_ad

    invoke-interface {v11, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :cond_ad
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v11

    if-nez v11, :cond_bd

    check-cast v0, Lc8a;

    iget-object v0, v0, Lc8a;->a:Ljava/lang/String;

    new-instance v11, Lak3;

    invoke-direct {v11, v10, v0}, Lak3;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_be

    :cond_bd
    move-object v11, v6

    :goto_be
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_5b

    :cond_c4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v7, v0}, Lkotlin/collections/CollectionsKt;->I(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    :goto_d0
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v7, v0

    check-cast v7, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_dc
    :goto_dc
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_102

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lak3;

    iget-object v9, v8, Lak3;->b:Ljava/lang/String;

    new-instance v10, Lc8a;

    invoke-direct {v10, v9}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lak3;

    if-eqz v9, :cond_dc

    iget-object v8, v8, Lak3;->b:Ljava/lang/String;

    new-instance v10, Lc8a;

    invoke-direct {v10, v8}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_dc

    :cond_102
    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v4

    :try_start_10c
    const-string v7, "abp_files/op"

    invoke-virtual {v2, v7}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2
    :try_end_112
    .catch Ljava/io/IOException; {:try_start_10c .. :try_end_112} :catch_113

    goto :goto_114

    :catch_113
    move-object v2, v6

    :goto_114
    if-nez v2, :cond_119

    sget-object v2, Lv08;->a:Lv08;

    goto :goto_134

    :cond_119
    new-instance v7, Ljava/util/ArrayList;

    array-length v8, v2

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    array-length v8, v2

    move v9, v5

    :goto_121
    if-ge v9, v8, :cond_130

    aget-object v10, v2, v9

    new-instance v11, Lzj3;

    invoke-direct {v11, v10}, Lzj3;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_121

    :cond_130
    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v2

    :goto_134
    sget-object v7, Lv08;->a:Lv08;

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v4, v2}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v2

    invoke-static {v2, v7}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v2

    check-cast v3, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_150
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_169

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lyj3;

    iget-boolean v9, v9, Lyj3;->a:Z

    if-eqz v9, :cond_165

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_150

    :cond_165
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_150

    :cond_169
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v5

    :goto_173
    if-ge v9, v8, :cond_183

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lyj3;

    iget-object v10, v10, Lyj3;->b:Lxj3;

    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_173

    :cond_183
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    :goto_18c
    if-ge v5, v8, :cond_19c

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v5, v5, 0x1

    check-cast v9, Lyj3;

    iget-object v9, v9, Lyj3;->b:Lxj3;

    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_18c

    :cond_19c
    invoke-static {v2, v3}, Luup;->E(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lp4j;

    move-result-object v5

    invoke-static {v2, v4}, Luup;->E(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)Lp4j;

    move-result-object v7

    invoke-static {v5, v7}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1ac
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1d2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ll9d;

    iget-object v10, v9, Ll9d;->b:Ljava/lang/String;

    iget-object v9, v9, Ll9d;->a:Lvj3;

    iget-object v11, v9, Lvj3;->a:Lsj3;

    new-instance v12, Lkotlin/Pair;

    invoke-direct {v12, v10, v11}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v9, v9, Lvj3;->b:Ltj3;

    invoke-interface {v9}, Ltj3;->a()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Lc8a;

    invoke-direct {v10, v9}, Lc8a;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1ac

    :cond_1d2
    new-instance v8, Ljava/util/LinkedHashSet;

    invoke-direct {v8}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v5}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1db
    move-object v10, v9

    check-cast v10, Lt9d;

    invoke-virtual {v10}, Lt9d;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_207

    move-object v10, v9

    check-cast v10, Lr9d;

    invoke-virtual {v10}, Lr9d;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ll9d;

    new-instance v11, Lxj3;

    new-instance v12, Lwj3;

    iget-object v13, v10, Ll9d;->a:Lvj3;

    iget-object v14, v13, Lvj3;->a:Lsj3;

    iget-object v13, v13, Lvj3;->b:Ltj3;

    invoke-interface {v13}, Ltj3;->a()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v14, v13}, Lwj3;-><init>(Lsj3;Ljava/lang/String;)V

    iget-object v10, v10, Ll9d;->b:Ljava/lang/String;

    invoke-direct {v11, v12, v10}, Lxj3;-><init>(Lwj3;Ljava/lang/String;)V

    invoke-interface {v8, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1db

    :cond_207
    invoke-static {v3, v8}, Lb5j;->d(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v3

    new-instance v8, Lp4j;

    invoke-direct {v8}, Lp4j;-><init>()V

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_216
    :goto_216
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_272

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lxj3;

    iget-object v11, v10, Lxj3;->b:Ljava/lang/String;

    iget-object v10, v10, Lxj3;->a:Lwj3;

    iget-object v12, v10, Lwj3;->a:Lsj3;

    new-instance v13, Lkotlin/Pair;

    invoke-direct {v13, v11, v12}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lc8a;

    if-eqz v11, :cond_238

    iget-object v11, v11, Lc8a;->a:Ljava/lang/String;

    goto :goto_239

    :cond_238
    move-object v11, v6

    :goto_239
    if-eqz v11, :cond_216

    iget-object v13, v10, Lwj3;->b:Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_216

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_247
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_25f

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Ltj3;

    invoke-interface {v15}, Ltj3;->a()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_247

    goto :goto_260

    :cond_25f
    move-object v14, v6

    :goto_260
    check-cast v14, Ltj3;

    if-eqz v14, :cond_216

    new-instance v11, Luj3;

    new-instance v13, Lvj3;

    invoke-direct {v13, v12, v14}, Lvj3;-><init>(Lsj3;Ltj3;)V

    invoke-direct {v11, v13, v10}, Luj3;-><init>(Lvj3;Lwj3;)V

    invoke-virtual {v8, v11}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_216

    :cond_272
    invoke-static {v8}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v18

    invoke-static {v5, v7}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_283
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_297

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ll9d;

    iget-object v6, v6, Ll9d;->a:Lvj3;

    iget-object v6, v6, Lvj3;->b:Ltj3;

    invoke-interface {v2, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_283

    :cond_297
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual/range {v18 .. v18}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2a0
    move-object v8, v6

    check-cast v8, Lt9d;

    invoke-virtual {v8}, Lt9d;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2ba

    move-object v8, v6

    check-cast v8, Lr9d;

    invoke-virtual {v8}, Lr9d;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Luj3;

    iget-object v8, v8, Luj3;->a:Lvj3;

    iget-object v8, v8, Lvj3;->b:Ltj3;

    invoke-interface {v1, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2a0

    :cond_2ba
    invoke-static {v2, v1}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2c7
    :goto_2c7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2d9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    instance-of v8, v6, Lak3;

    if-eqz v8, :cond_2c7

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c7

    :cond_2d9
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lb5j;->d(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2ee
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_300

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lak3;

    iget-object v2, v2, Lak3;->a:Ljava/io/File;

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2ee

    :cond_300
    new-instance v15, Lm9d;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v5}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_30b
    move-object v5, v2

    check-cast v5, Lt9d;

    invoke-virtual {v5}, Lt9d;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_323

    move-object v5, v2

    check-cast v5, Lr9d;

    invoke-virtual {v5}, Lr9d;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ll9d;

    iget-object v5, v5, Ll9d;->a:Lvj3;

    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_30b

    :cond_323
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_32c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxj3;

    iget-object v5, v5, Lxj3;->a:Lwj3;

    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_32c

    :cond_33e
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v7}, Lp4j;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_347
    move-object v6, v5

    check-cast v6, Lt9d;

    invoke-virtual {v6}, Lt9d;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_35f

    move-object v6, v5

    check-cast v6, Lr9d;

    invoke-virtual {v6}, Lr9d;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ll9d;

    iget-object v6, v6, Ll9d;->a:Lvj3;

    invoke-interface {v3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_347

    :cond_35f
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_368
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_37a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxj3;

    iget-object v6, v6, Lxj3;->a:Lwj3;

    invoke-interface {v5, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_368

    :cond_37a
    move-object/from16 v16, v0

    move-object/from16 v19, v1

    move-object/from16 v17, v2

    move-object/from16 v20, v3

    move-object/from16 v21, v5

    invoke-direct/range {v15 .. v21}, Lm9d;-><init>(Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;Lp4j;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;Ljava/util/LinkedHashSet;)V

    return-object v15

    :pswitch_data_388
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
