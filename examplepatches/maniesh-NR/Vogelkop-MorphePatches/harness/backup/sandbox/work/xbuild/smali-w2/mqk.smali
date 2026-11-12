.class public abstract Lmqk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkqk;

.field public final b:Ljava/lang/String;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Liv7;

.field public final e:Likc;

.field public final f:Lndc;

.field public final g:Lkotlin/jvm/functions/Function2;

.field public final h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmqk;->a:Lkqk;

    iput-object p2, p0, Lmqk;->b:Ljava/lang/String;

    iput-object p3, p0, Lmqk;->c:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lmqk;->d:Liv7;

    iput-object p5, p0, Lmqk;->e:Likc;

    iput-object p6, p0, Lmqk;->f:Lndc;

    iput-object p7, p0, Lmqk;->g:Lkotlin/jvm/functions/Function2;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmqk;->h:Z

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 3

    invoke-virtual {p0}, Lmqk;->d()Z

    move-result v0

    iget-object v1, p0, Lmqk;->d:Liv7;

    if-eqz v0, :cond_16

    iget-object v0, v1, Liv7;->k:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_42

    :cond_16
    invoke-virtual {v1}, Liv7;->b()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {p0}, Lmqk;->b()Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Lmqk;->e:Likc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_36

    invoke-virtual {p0}, Lmqk;->c()Z

    move-result v0

    if-eqz v0, :cond_42

    :cond_36
    iget-object v0, p0, Lmqk;->b:Ljava/lang/String;

    if-eqz v0, :cond_44

    iget-object p0, p0, Lmqk;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_44

    :cond_42
    const/4 p0, 0x0

    return p0

    :cond_44
    const/4 p0, 0x1

    return p0
.end method

.method public b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public c()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public d()Z
    .registers 1

    iget-boolean p0, p0, Lmqk;->h:Z

    return p0
.end method

.method public final e()V
    .registers 5

    invoke-virtual {p0}, Lmqk;->a()Z

    move-result v0

    iget-boolean v1, p0, Lmqk;->i:Z

    if-eq v0, v1, :cond_15

    iget-object v1, p0, Lmqk;->a:Lkqk;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lmqk;->g:Lkotlin/jvm/functions/Function2;

    invoke-interface {v3, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v0, p0, Lmqk;->i:Z

    :cond_15
    return-void
.end method

.method public f()V
    .registers 7

    iget-object v0, p0, Lmqk;->f:Lndc;

    iget-object v1, p0, Lmqk;->b:Ljava/lang/String;

    if-eqz v1, :cond_11

    new-instance v2, Lt00;

    const/4 v3, 0x3

    invoke-direct {v2, v1, p0, v3}, Lt00;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lmqk;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v1, v0, v2}, Laib;->D(Lw6f;Lndc;Ljava/lang/Object;)V

    :cond_11
    iget-object v1, p0, Lmqk;->d:Liv7;

    iget-object v2, v1, Liv7;->f:Lpde;

    new-instance v3, Llqk;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Llqk;-><init>(Lmqk;B)V

    new-instance v4, Lt7d;

    const/16 v5, 0x16

    invoke-direct {v4, v3, v5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v1, Liv7;->k:Lpde;

    new-instance v2, Llqk;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Llqk;-><init>(Lmqk;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v2, v5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v0, v3}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Llqk;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Llqk;-><init>(Lmqk;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v1, v5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p0, p0, Lmqk;->e:Likc;

    invoke-virtual {p0, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
