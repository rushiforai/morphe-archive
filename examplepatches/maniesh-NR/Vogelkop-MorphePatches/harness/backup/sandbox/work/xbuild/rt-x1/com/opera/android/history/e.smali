.class public final Lcom/opera/android/history/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lati;


# instance fields
.field public final a:Lcom/opera/android/history/HistoryManager;

.field public final b:Ltz1;

.field public final c:La64;

.field public d:Z

.field public e:Laea;

.field public final f:Lode;

.field public final g:Lqde;

.field public final h:Lode;

.field public final i:Lwnm;

.field public j:Lesi;


# direct methods
.method public constructor <init>(Lcom/opera/android/history/HistoryManager;Ltz1;La64;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/history/e;->a:Lcom/opera/android/history/HistoryManager;

    iput-object p2, p0, Lcom/opera/android/history/e;->b:Ltz1;

    iput-object p3, p0, Lcom/opera/android/history/e;->c:La64;

    sget-object p3, Laea;->a:Laea;

    iput-object p3, p0, Lcom/opera/android/history/e;->e:Laea;

    iget-object v1, p1, Lcom/opera/android/history/HistoryManager;->b:Lcom/opera/android/history/a;

    new-instance v2, Lode;

    const/4 p1, 0x0

    invoke-direct {v2, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/opera/android/history/e;->f:Lode;

    new-instance v3, Lqde;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {v3, p3}, Lqde;-><init>(Ll08;)V

    iput-object v3, p0, Lcom/opera/android/history/e;->g:Lqde;

    new-instance v4, Lode;

    invoke-direct {v4, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lcom/opera/android/history/e;->h:Lode;

    new-instance v5, Lbea;

    const-string v10, "calculateItems([Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;[Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;Ljava/util/List;Ljava/util/List;)Ljava/util/List;"

    const/4 v11, 0x0

    const/4 v6, 0x4

    const-class v8, Lcom/opera/android/history/e;

    const-string v9, "calculateItems"

    move-object v7, p0

    invoke-direct/range {v5 .. v11}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    move-object p0, v5

    new-instance p1, Lwnm;

    const/4 v0, 0x4

    new-array v0, v0, [Lekc;

    const/4 v5, 0x0

    aput-object v1, v0, v5

    const/4 v8, 0x1

    aput-object v2, v0, v8

    const/4 v5, 0x2

    aput-object v3, v0, v5

    const/4 v9, 0x3

    aput-object v4, v0, v9

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Ljava/lang/Iterable;

    new-instance v0, Li51;

    const/16 v5, 0xa

    invoke-direct/range {v0 .. v5}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v11, v0

    new-instance v0, Ln12;

    const/4 v6, 0x1

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Ln12;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, p3, v10, v11, v0}, Lwnm;-><init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object p1, v7, Lcom/opera/android/history/e;->i:Lwnm;

    new-instance p0, Lr62;

    iget-object p1, p2, Ltz1;->h:Lode;

    new-instance p2, Ly0a;

    invoke-direct {p2, v7, v9}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, p1, p2, v8}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/history/e;->j:Lesi;

    iget-object v1, p0, Lcom/opera/android/history/e;->h:Lode;

    if-nez v0, :cond_10

    iget-object p0, p0, Lcom/opera/android/history/e;->f:Lode;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_10
    iget-object v2, v0, Lesi;->a:Ljava/lang/String;

    iget-object v3, p0, Lcom/opera/android/history/e;->g:Lqde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_23
    :goto_23
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljz1;

    iget-object v6, v6, Ljz1;->c:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lesi;->a(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_23

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    :cond_3d
    iget-object v0, p0, Lcom/opera/android/history/e;->e:Laea;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    iget-object v3, p0, Lcom/opera/android/history/e;->a:Lcom/opera/android/history/HistoryManager;

    if-eqz v0, :cond_5e

    const/4 v5, 0x1

    if-ne v0, v5, :cond_5a

    new-instance v0, Lwa;

    const/16 v5, 0xd

    invoke-direct {v0, p0, v5}, Lwa;-><init>(Ljava/lang/Object;B)V

    iget-wide v5, v3, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v5, v6, v2, v0}, LJ/N;->MoY3FDNp(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v4}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_5a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_5e
    new-instance v0, Leb;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v4, v1}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-wide v3, v3, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v3, v4, v2, v0}, LJ/N;->MoY3FDNp(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final g(Lesi;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/history/e;->j:Lesi;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/history/e;->d:Z

    iput-object p1, p0, Lcom/opera/android/history/e;->j:Lesi;

    invoke-virtual {p0}, Lcom/opera/android/history/e;->a()V

    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final l()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/history/e;->a:Lcom/opera/android/history/HistoryManager;

    iget-wide v0, v0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-static {v0, v1}, LJ/N;->MEeZXtXn(J)V

    invoke-virtual {p0}, Lcom/opera/android/history/e;->a()V

    return-void
.end method

.method public final m()Lekc;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/history/e;->i:Lwnm;

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Lzda;

    if-eqz p1, :cond_41

    instance-of v0, p1, Lcom/opera/android/history/c;

    if-eqz v0, :cond_1c

    check-cast p1, Lcom/opera/android/history/c;

    iget-object p1, p1, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    iget-object p0, p0, Lcom/opera/android/history/e;->a:Lcom/opera/android/history/HistoryManager;

    iget-wide v0, p0, Lcom/opera/android/history/HistoryManager;->a:J

    invoke-interface {p1}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->b()J

    move-result-wide v2

    invoke-static {v0, v1, p0, v2, v3}, LJ/N;->MSzl$lMj(JLjava/lang/Object;J)V

    return-void

    :cond_1c
    instance-of v0, p1, Lyda;

    if-eqz v0, :cond_41

    new-instance v0, Lfg6;

    const/16 v1, 0x17

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2, v1}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v1, 0x3

    iget-object v3, p0, Lcom/opera/android/history/e;->c:La64;

    invoke-static {v3, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    iget-object p0, p0, Lcom/opera/android/history/e;->g:Lqde;

    iget-object v0, p0, Lqde;->l:Ljava/util/ArrayList;

    check-cast p1, Lyda;

    iget-object p1, p1, Lyda;->a:Ljz1;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_41
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
