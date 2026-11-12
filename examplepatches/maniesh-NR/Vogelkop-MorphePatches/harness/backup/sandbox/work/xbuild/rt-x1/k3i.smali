.class public final Lk3i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Liv1;

.field public final b:Liv1;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Liv1;Liv1;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk3i;->a:Liv1;

    iput-object p2, p0, Lk3i;->b:Liv1;

    new-instance p1, Lj3i;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk3i;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Likc;
    .registers 1

    iget-object p0, p0, Lk3i;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Likc;

    return-object p0
.end method

.method public final b()Z
    .registers 2

    iget-object p0, p0, Lk3i;->a:Liv1;

    invoke-virtual {p0}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    invoke-virtual {p0}, Lf8f;->j()Z

    move-result p0

    return p0
.end method

.method public final c()Z
    .registers 11

    iget-object v0, p0, Lk3i;->a:Liv1;

    invoke-virtual {v0}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcq5;

    iget-object v0, v0, Lcq5;->d:Ljava/lang/Object;

    check-cast v0, Ljdj;

    monitor-enter v0

    :try_start_d
    invoke-virtual {v0}, Ljdj;->p()J

    move-result-wide v1

    iget v3, v0, Ljdj;->k:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iget-wide v3, v0, Ljdj;->i:J

    sub-long/2addr v1, v3

    long-to-int v1, v1

    const/4 v2, 0x0

    if-nez v1, :cond_20

    sget-object v1, Ll08;->a:Ll08;
    :try_end_1e
    .catchall {:try_start_d .. :try_end_1e} :catchall_72

    monitor-exit v0

    goto :goto_3a

    :cond_20
    :try_start_20
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v4, v0, Ljdj;->h:[Ljava/lang/Object;

    move v5, v2

    :goto_28
    if-ge v5, v1, :cond_38

    iget-wide v6, v0, Ljdj;->i:J

    int-to-long v8, v5

    add-long/2addr v6, v8

    invoke-static {v4, v6, v7}, Lipe;->C([Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_35
    .catchall {:try_start_20 .. :try_end_35} :catchall_72

    add-int/lit8 v5, v5, 0x1

    goto :goto_28

    :cond_38
    monitor-exit v0

    move-object v1, v3

    :goto_3a
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    iget-object p0, p0, Lk3i;->b:Liv1;

    invoke-virtual {p0}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_rewards"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-nez v0, :cond_53

    sget-object p0, Lm18;->a:Lm18;

    goto :goto_6b

    :cond_53
    invoke-static {}, Li0l;->g()Z

    move-result v1

    if-eqz v1, :cond_5b

    move v0, v2

    goto :goto_5f

    :cond_5b
    invoke-virtual {v0}, Lf8f;->j()Z

    move-result v0

    :goto_5f
    if-nez v0, :cond_64

    sget-object p0, Lm18;->d:Lm18;

    goto :goto_6b

    :cond_64
    if-eqz p0, :cond_69

    sget-object p0, Lm18;->b:Lm18;

    goto :goto_6b

    :cond_69
    sget-object p0, Lm18;->c:Lm18;

    :goto_6b
    sget-object v0, Lm18;->b:Lm18;

    if-ne p0, v0, :cond_71

    const/4 p0, 0x1

    return p0

    :cond_71
    return v2

    :catchall_72
    move-exception p0

    monitor-exit v0

    throw p0
.end method
