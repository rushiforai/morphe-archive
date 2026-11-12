.class public final Ltqe;
.super Lz85;
.source "SourceFile"


# instance fields
.field public g:J

.field public final synthetic h:Luqe;


# direct methods
.method public constructor <init>(Luqe;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltqe;->h:Luqe;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    invoke-super {p0}, Lz85;->a()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ltqe;->g:J

    return-void
.end method

.method public final d(Lg82;Llqm;Z)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Lz85;->d(Lg82;Llqm;Z)V

    iget-boolean p1, p0, Lz85;->f:Z

    if-eqz p1, :cond_9

    const/4 p1, 0x0

    goto :goto_b

    :cond_9
    iget-object p1, p0, Lz85;->a:Lg82;

    :goto_b
    if-eqz p1, :cond_27

    iget-object p2, p1, Lg82;->a:Ljava/lang/String;

    const/4 p3, 0x1

    iget-object p0, p0, Ltqe;->h:Luqe;

    invoke-virtual {p0, p2, p3}, Luqe;->e(Ljava/lang/String;Z)Lmsh;

    move-result-object p2

    if-eqz p2, :cond_27

    iget-boolean p1, p1, Lg82;->h:Z

    iget-object p0, p0, Luqe;->h:Luy8;

    if-eqz p1, :cond_23

    const/4 p1, 0x2

    invoke-virtual {p0, p1, p2}, Luy8;->h(ILmsh;)V

    return-void

    :cond_23
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Luy8;->h(ILmsh;)V

    :cond_27
    return-void
.end method

.method public final f(Lg82;Ly85;)V
    .registers 14

    iget-object v0, p0, Ltqe;->h:Luqe;

    iget-object v1, v0, Luqe;->f:Lx5f;

    iget-wide v2, p2, Ly85;->a:J

    iget-boolean v4, v1, Lx5f;->h:Z

    if-eqz v4, :cond_41

    iget-object v4, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v4}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v4

    const/4 v6, 0x2

    invoke-virtual {v4, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-eqz v7, :cond_29

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_29

    new-instance v8, Lhf0;

    invoke-direct {v8, v4, v6, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_37

    :cond_29
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, -0x1

    invoke-virtual {v4, v6, v8, v7}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lhf0;

    invoke-direct {v8, v4, v6, v7}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_37
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Lx5f;->U0(Lx56;)V

    :cond_41
    iget-object p1, p1, Lg82;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Luqe;->e(Ljava/lang/String;Z)Lmsh;

    move-result-object v5

    if-eqz v5, :cond_7f

    iget-object p1, v0, Luqe;->h:Luy8;

    iget-wide v0, p0, Ltqe;->g:J

    const-wide/16 v6, 0x3e8

    div-long/2addr v0, v6

    div-long v8, v2, v6

    iget p0, p2, Ly85;->b:I

    int-to-float p0, p0

    const/high16 p2, 0x42c80000    # 100.0f

    div-float/2addr p0, p2

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p0, p2, v2}, Lcs5;->s(FFF)F

    move-result v10

    iget-object p0, p1, Luy8;->s:Ljava/util/Set;

    iget-object p2, v5, Lmsh;->v:Lp12;

    iget-object p2, p2, Lp12;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-interface {p0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7f

    iget-object p0, p1, Luy8;->L:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result p0

    if-eqz p0, :cond_7f

    new-instance v4, Lry8;

    move-wide v6, v0

    invoke-direct/range {v4 .. v10}, Lry8;-><init>(Lmsh;JJF)V

    invoke-virtual {p1, v4}, Luy8;->c(Ldy8;)V

    :cond_7f
    return-void
.end method
