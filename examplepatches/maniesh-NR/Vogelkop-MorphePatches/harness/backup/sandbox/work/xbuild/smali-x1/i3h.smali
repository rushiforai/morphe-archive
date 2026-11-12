.class public final Li3h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lodb;


# instance fields
.field public final a:Lx5f;

.field public final b:Ljava/util/LinkedHashMap;

.field public final c:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li3h;->a:Lx5f;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Li3h;->b:Ljava/util/LinkedHashMap;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Li3h;->c:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 6

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    if-eqz p1, :cond_16

    check-cast p1, Lc3h;

    iget-object v0, p1, Lc3h;->c:Ljava/lang/String;

    iget-object v1, p1, Lc3h;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Li3h;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    :cond_16
    return-void

    :cond_17
    new-instance v1, Lh3h;

    iget-object p1, p1, Lc3h;->h:Ljava/lang/String;

    invoke-direct {v1, p1, v0}, Lh3h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Li3h;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2e

    new-instance p1, Lg3h;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2e
    check-cast p1, Lg3h;

    iget-wide v0, p1, Lg3h;->a:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p1, Lg3h;->a:J

    return-void
.end method

.method public final b(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 6

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    if-nez p1, :cond_5

    return-void

    :cond_5
    check-cast p1, Lc3h;

    new-instance v0, Lh3h;

    iget-object v1, p1, Lc3h;->h:Ljava/lang/String;

    iget-object p1, p1, Lc3h;->c:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Lh3h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Li3h;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_20

    new-instance p1, Lg3h;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    check-cast p1, Lg3h;

    iget-wide v0, p1, Lg3h;->b:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p1, Lg3h;->b:J

    return-void
.end method

.method public final reset()V
    .registers 14

    iget-object v0, p0, Li3h;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_47

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lh3h;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lg3h;

    iget-object v9, v3, Lh3h;->a:Ljava/lang/String;

    iget-object v10, v3, Lh3h;->b:Ljava/lang/String;

    iget-wide v5, v2, Lg3h;->a:J

    iget-wide v7, v2, Lg3h;->b:J

    iget-object v2, p0, Li3h;->a:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    if-eqz v3, :cond_a

    iget-object v3, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v11

    new-instance v12, Lck0;

    invoke-direct {v12, v3, v11}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v4, Lao3;

    invoke-direct/range {v4 .. v10}, Lao3;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v4}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2, v11}, Lx5f;->U0(Lx56;)V

    goto :goto_a

    :cond_47
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object p0, p0, Li3h;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    return-void
.end method
