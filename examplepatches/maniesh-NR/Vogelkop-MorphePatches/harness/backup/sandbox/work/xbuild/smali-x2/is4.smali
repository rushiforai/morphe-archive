.class public final Lis4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhs4;

.field public final b:Ljava/util/Map;

.field public final synthetic c:Lls4;


# direct methods
.method public constructor <init>(Lls4;Lhs4;Ljava/util/Map;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lis4;->c:Lls4;

    iput-object p2, p0, Lis4;->a:Lhs4;

    iput-object p3, p0, Lis4;->b:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final a(Lu9d;Ljava/util/Set;Lqa6;)Ljava/lang/Object;
    .registers 12

    sget-object v0, Lfbb;->a:Ls55;

    invoke-virtual {v0}, Ls55;->a()Lebb;

    move-result-object v0

    const-class v1, Lcs4;

    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    iget-object v2, p0, Lis4;->c:Lls4;

    iget-object v2, v2, Lls4;->f:Ljava/lang/Object;

    monitor-enter v2

    :try_start_11
    iget-object v3, p0, Lis4;->a:Lhs4;

    iput-object v0, v3, Lhs4;->c:Lebb;

    invoke-virtual {p1}, Lu9d;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Lv9d;

    invoke-virtual {p1}, Lv9d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcs4;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzy8;

    iget-object v5, p0, Lis4;->a:Lhs4;

    iget-object v5, v5, Lhs4;->a:Ljava/util/LinkedHashMap;

    new-instance v6, Lfs4;

    iget-object v7, v3, Lzy8;->a:Ljava/lang/String;

    iget-object v3, v3, Lzy8;->b:[B

    invoke-direct {v6, v7, v0, v3}, Lfs4;-><init>(Ljava/lang/String;Lebb;[B)V

    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v4}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_4b
    iget-object p1, p0, Lis4;->a:Lhs4;

    iget-object p1, p1, Lhs4;->b:Ljava/util/Set;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5b

    iget-object p1, p0, Lis4;->a:Lhs4;

    iput-object p2, p1, Lhs4;->b:Ljava/util/Set;
    :try_end_59
    .catchall {:try_start_11 .. :try_end_59} :catchall_89

    const/4 p1, 0x1

    goto :goto_5c

    :cond_5b
    const/4 p1, 0x0

    :goto_5c
    monitor-exit v2

    iget-object p2, p0, Lis4;->c:Lls4;

    iget-object p2, p2, Lls4;->d:Lks4;

    iget-object v0, p0, Lis4;->a:Lhs4;

    invoke-virtual {p2, v0}, Ln1f;->l(Ljava/lang/Object;)V

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_71

    if-nez p1, :cond_71

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_71
    sget-object p1, Ldze;->b:Ldze;

    new-instance p2, Lr3;

    iget-object p0, p0, Lis4;->c:Lls4;

    const/4 v0, 0x0

    const/16 v2, 0x12

    invoke-direct {p2, p0, v1, v0, v2}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p1, p2, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_86

    return-object p0

    :cond_86
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_89
    move-exception p0

    monitor-exit v2

    throw p0
.end method
