.class public final Lv4b;
.super Ljwh;
.source "SourceFile"

# interfaces
.implements Lysd;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/LinkedHashMap;


# direct methods
.method public constructor <init>(Ltcc;Lnr5;Lzsd;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    const-string v4, "incognito"

    invoke-static {v3, v4}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lv4b;->a:Ljava/lang/String;

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v3, v0, Lv4b;->b:Ljava/util/LinkedHashMap;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_33

    new-instance v6, Lgp7;

    invoke-direct {v6, v1, v0, v4}, Lgp7;-><init>(Lnr5;Lv4b;B)V

    new-instance v7, Lgp7;

    invoke-direct {v7, v1, v0, v3}, Lgp7;-><init>(Lnr5;Lv4b;B)V

    const/4 v9, 0x0

    const/16 v10, 0xc

    const/4 v8, 0x0

    move-object/from16 v5, p1

    invoke-static/range {v5 .. v10}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    :cond_33
    if-eqz v2, :cond_48

    new-instance v12, Latd;

    invoke-direct {v12, v2, v0, v4}, Latd;-><init>(Lzsd;Lv4b;B)V

    new-instance v13, Latd;

    invoke-direct {v13, v2, v0, v3}, Latd;-><init>(Lzsd;Lv4b;B)V

    const/4 v15, 0x0

    const/16 v16, 0xc

    const/4 v14, 0x0

    move-object/from16 v11, p1

    invoke-static/range {v11 .. v16}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    :cond_48
    return-void
.end method


# virtual methods
.method public final b(Ljvh;)Z
    .registers 2

    iget-object p1, p1, Ljvh;->b:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lv4b;->a:Ljava/lang/String;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final e(Ljvh;I)Lro9;
    .registers 4

    iget-object p1, p1, Ljvh;->b:Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lv4b;->g(Landroid/net/Uri;)[B

    move-result-object p0

    if-eqz p0, :cond_14

    new-instance p1, Lro9;

    new-instance p2, Lre6;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lre6;-><init>([BB)V

    invoke-direct {p1, p2, v0}, Lro9;-><init>(Lewj;I)V

    return-object p1

    :cond_14
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Landroid/net/Uri;)[B
    .registers 3

    iget-object v0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt4b;

    if-eqz p0, :cond_10

    iget-object p0, p0, Lt4b;->a:[B
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_13

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    monitor-exit v0

    return-object p0

    :catchall_13
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final h(Ljava/io/File;)Landroid/net/Uri;
    .registers 3

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    iget-object p0, p0, Lv4b;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final i(Landroid/net/Uri;)Lehc;
    .registers 9

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object v1, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    monitor-enter v1

    :try_start_7
    iget-object p0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_11
    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_57

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_51

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_51

    invoke-static {v3, v5, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_51

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-static {v3, v4}, Lkotlin/text/StringsKt;->c0(Ljava/lang/String;C)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_4b

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    :cond_4b
    invoke-static {v3, v4}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v3

    xor-int/lit8 v4, v3, 0x1

    :cond_51
    if-eqz v4, :cond_11

    invoke-virtual {v0, v2}, Lehc;->add(Ljava/lang/Object;)Z
    :try_end_56
    .catchall {:try_start_7 .. :try_end_56} :catchall_5d

    goto :goto_11

    :cond_57
    monitor-exit v1

    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :catchall_5d
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final j(Landroid/net/Uri;[BLjava/util/EnumSet;)V
    .registers 6

    iget-object v0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    new-instance v1, Lt4b;

    invoke-direct {v1, p2, p3}, Lt4b;-><init>([BLjava/util/EnumSet;)V

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt4b;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-void

    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final k(Landroid/net/Uri;)V
    .registers 3

    iget-object v0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt4b;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d

    monitor-exit v0

    return-void

    :catchall_d
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final l(I)V
    .registers 7

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lj7c;->a(II)Z

    move-result p1

    if-nez p1, :cond_8

    return-void

    :cond_8
    iget-object p1, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    monitor-enter p1

    :try_start_b
    iget-object v0, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_42

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lt4b;

    iget-object v3, v3, Lt4b;->b:Ljava/util/EnumSet;

    sget-object v4, Lu4b;->a:Lu4b;

    invoke-virtual {v3, v4}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a

    :cond_42
    invoke-static {v1}, Ltbd;->k(Ljava/util/LinkedHashMap;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_60

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/Pair;

    iget-object v2, p0, Lv4b;->b:Ljava/util/LinkedHashMap;

    iget-object v1, v1, Lkotlin/Pair;->a:Ljava/lang/Object;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5f
    .catchall {:try_start_b .. :try_end_5f} :catchall_62

    goto :goto_4c

    :cond_60
    monitor-exit p1

    return-void

    :catchall_62
    move-exception p0

    monitor-exit p1

    throw p0
.end method
