.class public final Lyr8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lxr8;

.field public final c:Lgjf;

.field public final d:I

.field public final e:Lzzj;

.field public f:Lhq8;

.field public g:Ljl6;

.field public h:Lgk6;

.field public i:Lwr8;

.field public j:I

.field public k:Ljava/lang/String;

.field public l:Lvmj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lxr8;Lgjf;ILzzj;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyr8;->a:Landroid/content/Context;

    iput-object p2, p0, Lyr8;->b:Lxr8;

    iput-object p3, p0, Lyr8;->c:Lgjf;

    iput p4, p0, Lyr8;->d:I

    iput-object p5, p0, Lyr8;->e:Lzzj;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;IIII)V
    .registers 8

    iget-object v0, p0, Lyr8;->g:Ljl6;

    if-eqz v0, :cond_12

    iget-object v1, p0, Lyr8;->b:Lxr8;

    invoke-interface {v1}, Lxr8;->i()I

    move-result v1

    iput v1, v0, Ljl6;->c:I

    iget-object p0, p0, Lyr8;->g:Ljl6;

    invoke-virtual/range {p0 .. p5}, Ljl6;->g(Landroid/graphics/Canvas;IIII)V

    return-void

    :cond_12
    iget-object v0, p0, Lyr8;->h:Lgk6;

    if-eqz v0, :cond_1f

    invoke-virtual {v0, p2, p3, p4, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p0, Lyr8;->h:Lgk6;

    invoke-virtual {p0, p1}, Lgk6;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_1f
    iget-object v0, p0, Lyr8;->l:Lvmj;

    if-eqz v0, :cond_2b

    invoke-virtual {v0, p2, p3, p4, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p0, Lyr8;->l:Lvmj;

    invoke-virtual {p0, p1}, Lvmj;->draw(Landroid/graphics/Canvas;)V

    :cond_2b
    return-void
.end method

.method public final b(ILjava/lang/String;ZZ)V
    .registers 11

    new-instance v0, Lwr8;

    move-object v1, p0

    move v5, p1

    move-object v4, p2

    move v3, p3

    move v2, p4

    invoke-direct/range {v0 .. v5}, Lwr8;-><init>(Lyr8;ZZLjava/lang/String;I)V

    iput-object v0, v1, Lyr8;->i:Lwr8;

    iget-object p0, v1, Lyr8;->a:Landroid/content/Context;

    invoke-static {p0, v5, v4}, Lqbe;->G(Landroid/content/Context;ILjava/lang/String;)Ldwh;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz v2, :cond_1b

    const/4 p2, 0x3

    new-array p3, p1, [I

    invoke-virtual {p0, p2, p3}, Ldwh;->i(I[I)V

    :cond_1b
    if-eqz v3, :cond_23

    const/4 p2, 0x1

    new-array p1, p1, [I

    invoke-virtual {p0, p2, p1}, Ldwh;->h(I[I)V

    :cond_23
    iget-object p1, v1, Lyr8;->i:Lwr8;

    invoke-virtual {p0, p1}, Ldwh;->f(Lacl;)V

    return-void
.end method

.method public final c(Lifd;)V
    .registers 9

    instance-of v0, p1, Lnnj;

    if-eqz v0, :cond_9

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyr8;->i(Z)V

    return-void

    :cond_9
    instance-of v0, p1, Ltnj;

    if-eqz v0, :cond_28

    check-cast p1, Ltnj;

    iget-object p1, p1, Ltnj;->a:Ljava/io/File;

    iget-object v0, p0, Lyr8;->b:Lxr8;

    invoke-interface {v0}, Lxr8;->v()I

    move-result v2

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    new-instance v6, Lqq6;

    const/16 p1, 0xc

    invoke-direct {v6, p0, p1}, Lqq6;-><init>(Ljava/lang/Object;B)V

    const/4 v5, 0x0

    const/4 v4, 0x0

    move v3, v2

    invoke-static/range {v1 .. v6}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    :cond_28
    return-void
.end method

.method public final d(Landroid/graphics/Bitmap;)V
    .registers 8

    const/4 v0, 0x0

    iget-object v1, p0, Lyr8;->b:Lxr8;

    if-eqz p1, :cond_13

    new-instance v2, Ljl6;

    iget v3, p0, Lyr8;->d:I

    invoke-interface {v1}, Lxr8;->i()I

    move-result v4

    iget-object v5, p0, Lyr8;->c:Lgjf;

    invoke-direct {v2, p1, v5, v3, v4}, Ljl6;-><init>(Landroid/graphics/Bitmap;Lgjf;II)V

    goto :goto_14

    :cond_13
    move-object v2, v0

    :goto_14
    iput-object v2, p0, Lyr8;->g:Ljl6;

    iput-object v0, p0, Lyr8;->i:Lwr8;

    if-nez v2, :cond_22

    invoke-interface {v1}, Lxr8;->l()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyr8;->i(Z)V

    goto :goto_25

    :cond_22
    invoke-interface {v1}, Lxr8;->h()V

    :goto_25
    invoke-interface {v1}, Lxr8;->invalidate()V

    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lyr8;->i:Lwr8;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    sget-object v2, Lyne;->b:Ldeg;

    invoke-virtual {v2, v0}, Ldeg;->a(Ljava/lang/Object;)V

    iput-object v1, p0, Lyr8;->i:Lwr8;

    :cond_c
    iput-object v1, p0, Lyr8;->g:Ljl6;

    iput-object v1, p0, Lyr8;->h:Lgk6;

    return-void
.end method

.method public final f(Z)V
    .registers 12

    iget-object v0, p0, Lyr8;->f:Lhq8;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    iget-object v3, p0, Lyr8;->b:Lxr8;

    if-nez v1, :cond_3a

    invoke-interface {v3}, Lxr8;->s()I

    move-result v1

    if-nez p1, :cond_20

    iget v4, p0, Lyr8;->j:I

    if-ne v4, v1, :cond_20

    invoke-interface {v3}, Lxr8;->h()V

    return-void

    :cond_20
    iput v1, p0, Lyr8;->j:I

    invoke-virtual {p0}, Lyr8;->e()V

    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_36

    const-string v3, "file://"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_36

    const/4 v2, 0x1

    :cond_36
    invoke-virtual {p0, v1, v0, p1, v2}, Lyr8;->b(ILjava/lang/String;ZZ)V

    return-void

    :cond_3a
    iget-object v0, p0, Lyr8;->f:Lhq8;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lhk6;->e:La36;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, La36;->p(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8e

    invoke-virtual {p0}, Lyr8;->e()V

    iget-object p1, p0, Lyr8;->f:Lhq8;

    invoke-virtual {p1, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v3}, Lxr8;->v()I

    move-result v7

    invoke-static {p1}, La36;->s(Ljava/lang/String;)Lhk6;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_77

    iget v5, p1, Lhk6;->b:I

    iget-object v6, p1, Lhk6;->c:Ljava/lang/Integer;

    sget p1, Lgk6;->j:I

    const/4 v8, 0x0

    const/16 v9, 0x30

    iget-object v4, p0, Lyr8;->a:Landroid/content/Context;

    invoke-static/range {v4 .. v9}, Ls16;->t(Landroid/content/Context;ILjava/lang/Integer;III)Lgk6;

    move-result-object p1

    invoke-interface {v3}, Lxr8;->i()I

    move-result v1

    iput v1, p1, Lgk6;->f:I

    goto :goto_78

    :cond_77
    move-object p1, v0

    :goto_78
    iput-object v0, p0, Lyr8;->g:Ljl6;

    iput-object p1, p0, Lyr8;->h:Lgk6;

    iput-object v0, p0, Lyr8;->i:Lwr8;

    if-nez p1, :cond_87

    invoke-interface {v3}, Lxr8;->l()V

    invoke-virtual {p0, v2}, Lyr8;->i(Z)V

    goto :goto_8a

    :cond_87
    invoke-interface {v3}, Lxr8;->h()V

    :goto_8a
    invoke-interface {v3}, Lxr8;->invalidate()V

    return-void

    :cond_8e
    iget-object v0, p0, Lyr8;->e:Lzzj;

    if-eqz v0, :cond_b8

    invoke-virtual {p0}, Lyr8;->e()V

    iget-object p1, p0, Lyr8;->f:Lhq8;

    if-eqz p1, :cond_b4

    new-instance v1, Ltu7;

    const/16 v3, 0x9

    invoke-direct {v1, p0, v3}, Ltu7;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lzzj;->a:Lvnj;

    invoke-static {p1}, Lzzj;->a(Lhq8;)Lknj;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    move-result-object p1

    if-nez p1, :cond_b0

    invoke-virtual {p0, v2}, Lyr8;->g(Z)V

    return-void

    :cond_b0
    invoke-virtual {p0, p1}, Lyr8;->c(Lifd;)V

    return-void

    :cond_b4
    invoke-virtual {p0, v2}, Lyr8;->i(Z)V

    return-void

    :cond_b8
    invoke-virtual {p0, p1}, Lyr8;->i(Z)V

    return-void
.end method

.method public final g(Z)V
    .registers 5

    iget-object v0, p0, Lyr8;->f:Lhq8;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lyr8;->b:Lxr8;

    invoke-interface {v0}, Lxr8;->p()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lyr8;->k:Ljava/lang/String;

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_15

    if-nez p1, :cond_15

    :cond_14
    return-void

    :cond_15
    iput-object v1, p0, Lyr8;->k:Ljava/lang/String;

    invoke-interface {v0, v1}, Lxr8;->k(Ljava/lang/String;)Lvmj;

    move-result-object p1

    iput-object p1, p0, Lyr8;->l:Lvmj;

    invoke-interface {v0}, Lxr8;->invalidate()V

    return-void
.end method

.method public final h()V
    .registers 5

    iget-object v0, p0, Lyr8;->h:Lgk6;

    if-eqz v0, :cond_28

    iget-object v1, p0, Lyr8;->a:Landroid/content/Context;

    iget-object v2, p0, Lyr8;->b:Lxr8;

    invoke-interface {v2}, Lxr8;->i()I

    move-result v3

    invoke-virtual {v0, v3, v1}, Lgk6;->a(ILandroid/content/Context;)V

    iget-object v0, p0, Lyr8;->h:Lgk6;

    const/4 v1, 0x0

    iput-object v1, p0, Lyr8;->g:Ljl6;

    iput-object v0, p0, Lyr8;->h:Lgk6;

    iput-object v1, p0, Lyr8;->i:Lwr8;

    if-nez v0, :cond_22

    invoke-interface {v2}, Lxr8;->l()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lyr8;->i(Z)V

    goto :goto_25

    :cond_22
    invoke-interface {v2}, Lxr8;->h()V

    :goto_25
    invoke-interface {v2}, Lxr8;->invalidate()V

    :cond_28
    return-void
.end method

.method public final i(Z)V
    .registers 2

    invoke-virtual {p0}, Lyr8;->e()V

    invoke-virtual {p0, p1}, Lyr8;->g(Z)V

    iget-object p0, p0, Lyr8;->b:Lxr8;

    invoke-interface {p0}, Lxr8;->h()V

    return-void
.end method
