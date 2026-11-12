.class public final Lcom/opera/android/browser/minigame/MinigameExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static report(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    :try_start_12
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "event"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b4

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v4, -0x20421c24

    if-eq v3, v4, :cond_86

    const v2, 0x68ac462

    if-eq v3, v2, :cond_60

    const v2, 0x416a9e0f

    if-ne v3, v2, :cond_bc

    const-string v2, "restart"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_bc

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_bc

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    new-instance v2, Lck0;

    invoke-direct {v2, v1, p0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v2}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v2, Lv2e;

    const/4 v3, 0x1

    invoke-direct {v2, p1, p2, v3}, Lv2e;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ltd0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_60
    const-string v2, "start"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_bc

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_bc

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    new-instance v2, Lck0;

    invoke-direct {v2, v1, p0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v2}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v2, Lv2e;

    const/4 v3, 0x0

    invoke-direct {v2, p1, p2, v3}, Lv2e;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ltd0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_86
    const-string v3, "completion"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_bc

    const-string p0, "score"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_bc

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    new-instance v2, Lck0;

    invoke-direct {v2, v1, p0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v2}, Lck0;->d()Ltd0;

    move-result-object v1

    new-instance v3, Lo02;

    const/4 v8, 0x4

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v3 .. v8}, Lo02;-><init>(Ljava/lang/Object;Ljava/lang/String;JB)V

    invoke-virtual {v1, v3}, Ltd0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_b4
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "event is null"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_bc
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_bc} :catch_bc

    :catch_bc
    :cond_bc
    return-void
.end method
