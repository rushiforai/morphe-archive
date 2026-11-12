.class public final Lxu4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lodb;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lole;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lxu4;->a:B

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxu4;->b:Ljava/lang/Object;

    .line 33
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lxu4;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Lxu4;->a:B

    packed-switch p2, :pswitch_data_20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxu4;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lxu4;->c:Ljava/lang/Object;

    return-void

    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxu4;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lxu4;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 7

    iget-byte v0, p0, Lxu4;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lxu4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_86

    check-cast v2, Ljava/util/LinkedHashSet;

    iget v0, p1, Lcom/opera/android/suggestion/Suggestion;->j:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    new-instance v0, Lb3g;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lb3g;-><init>(I)V

    iget p1, p1, Lcom/opera/android/suggestion/Suggestion;->j:I

    invoke-virtual {v0, p1}, Lb3g;->a(I)La3g;

    move-result-object p1

    iget-wide v1, p1, La3g;->b:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p1, La3g;->b:J

    iget-object p0, p0, Lxu4;->b:Ljava/lang/Object;

    check-cast p0, Lole;

    invoke-virtual {p0, v0}, Lole;->C(Lb3g;)V

    :cond_30
    return-void

    :pswitch_31
    iget-object p0, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of p1, p0, Lnt8;

    if-eqz p1, :cond_3a

    move-object v1, p0

    check-cast v1, Lnt8;

    :cond_3a
    if-eqz v1, :cond_5a

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_4c

    new-instance p0, Lrt8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {v2, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4c
    check-cast p0, Lrt8;

    iget-boolean p1, p0, Lrt8;->a:Z

    int-to-long v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_5a

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrt8;->a:Z

    :cond_5a
    return-void

    :pswitch_5b
    iget-object p0, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of p1, p0, Ljfj;

    if-eqz p1, :cond_64

    move-object v1, p0

    check-cast v1, Ljfj;

    :cond_64
    if-eqz v1, :cond_84

    check-cast v2, Ljava/util/LinkedHashSet;

    new-instance p0, Lwu4;

    iget-object p1, v1, Ljfj;->a:Ljava/lang/String;

    iget-object v0, v1, Ljfj;->f:Ljava/util/List;

    if-eqz v0, :cond_7c

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltej;

    if-eqz v0, :cond_7c

    iget-object v0, v0, Ltej;->a:Ljava/lang/String;

    if-nez v0, :cond_7e

    :cond_7c
    const-string v0, "unknown"

    :cond_7e
    invoke-direct {p0, p1, v0}, Lwu4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_84
    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_31
    .end packed-switch
.end method

.method public final b(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 7

    iget-byte v0, p0, Lxu4;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lxu4;->b:Ljava/lang/Object;

    const-wide/16 v3, 0x1

    packed-switch v0, :pswitch_data_84

    new-instance p0, Lb3g;

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lb3g;-><init>(I)V

    iget p1, p1, Lcom/opera/android/suggestion/Suggestion;->j:I

    invoke-virtual {p0, p1}, Lb3g;->a(I)La3g;

    move-result-object p1

    iget-wide v0, p1, La3g;->c:J

    add-long/2addr v0, v3

    iput-wide v0, p1, La3g;->c:J

    check-cast v2, Lole;

    invoke-virtual {v2, p0}, Lole;->C(Lb3g;)V

    return-void

    :pswitch_21
    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v0, p1, Lnt8;

    if-eqz v0, :cond_2a

    move-object v1, p1

    check-cast v1, Lnt8;

    :cond_2a
    if-eqz v1, :cond_45

    iget-object p0, p0, Lxu4;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_3e

    new-instance p1, Lrt8;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e
    check-cast p1, Lrt8;

    iget-wide v0, p1, Lrt8;->b:J

    add-long/2addr v0, v3

    iput-wide v0, p1, Lrt8;->b:J

    :cond_45
    return-void

    :pswitch_46
    iget-object p0, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of p1, p0, Ljfj;

    if-eqz p1, :cond_4f

    move-object v1, p0

    check-cast v1, Ljfj;

    :cond_4f
    if-eqz v1, :cond_83

    check-cast v2, Lx5f;

    iget-object p0, v1, Ljfj;->a:Ljava/lang/String;

    iget-object p1, v1, Ljfj;->f:Ljava/util/List;

    if-eqz p1, :cond_65

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltej;

    if-eqz p1, :cond_65

    iget-object p1, p1, Ltej;->a:Ljava/lang/String;

    if-nez p1, :cond_67

    :cond_65
    const-string p1, "unknown"

    :cond_67
    iget-object v0, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->d()Ltd0;

    move-result-object v0

    new-instance v3, Ltx0;

    const/16 v4, 0x1b

    invoke-direct {v3, p1, v4}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v0, p0, v3}, Ltd0;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2, v1}, Lx5f;->U0(Lx56;)V

    :cond_83
    return-void

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_46
        :pswitch_21
    .end packed-switch
.end method

.method public final reset()V
    .registers 13

    iget-byte v0, p0, Lxu4;->a:B

    iget-object v1, p0, Lxu4;->b:Ljava/lang/Object;

    iget-object p0, p0, Lxu4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_88

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    return-void

    :pswitch_f
    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnt8;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrt8;

    move-object v4, v1

    check-cast v4, Lx5f;

    iget-object v6, v3, Lnt8;->b:Ljava/lang/String;

    iget-boolean v3, v2, Lrt8;->a:Z

    int-to-long v7, v3

    iget-wide v9, v2, Lrt8;->b:J

    iget-boolean v2, v4, Lx5f;->h:Z

    if-eqz v2, :cond_19

    new-instance v5, Lf5f;

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v11}, Lf5f;-><init>(Ljava/lang/String;JJB)V

    invoke-virtual {v4, v5}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    goto :goto_19

    :cond_49
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    return-void

    :pswitch_4d
    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_53
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_83

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwu4;

    move-object v3, v1

    check-cast v3, Lx5f;

    iget-object v4, v2, Lwu4;->a:Ljava/lang/String;

    iget-object v2, v2, Lwu4;->b:Ljava/lang/String;

    iget-object v5, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    new-instance v7, Lck0;

    invoke-direct {v7, v5, v6}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v7}, Lck0;->d()Ltd0;

    move-result-object v5

    new-instance v7, Ltx0;

    const/16 v8, 0x1c

    invoke-direct {v7, v2, v8}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v5, v4, v7}, Ltd0;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v3, v6}, Lx5f;->U0(Lx56;)V

    goto :goto_53

    :cond_83
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    return-void

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_f
    .end packed-switch
.end method
