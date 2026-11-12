.class public final synthetic Lzgb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgjo;
.implements Lg94;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lchb;


# direct methods
.method public synthetic constructor <init>(Lchb;B)V
    .registers 3

    iput-byte p2, p0, Lzgb;->a:B

    iput-object p1, p0, Lzgb;->b:Lchb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 15

    iget-byte v0, p0, Lzgb;->a:B

    sget-object v1, Lwz;->a:Lwz;

    sget-object v2, Lwz;->d:Lwz;

    sget-object v3, Lwz;->b:Lwz;

    sget-object v4, Lwz;->c:Lwz;

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    const/4 v10, -0x1

    const/16 v11, 0x19

    iget-object p0, p0, Lzgb;->b:Lchb;

    packed-switch v0, :pswitch_data_c8

    iget-object v0, p0, Lbzo;->j:Ljava/lang/String;

    invoke-static {p1}, Lvep;->f(I)B

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lw8h;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11}, Lphj;->t(Ljava/lang/String;I)V

    iget-object p0, p0, Lchb;->p:Lqb7;

    if-eqz p0, :cond_6e

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lh10;

    iget-object v0, v0, Lh10;->v:Ldl;

    iget-object v11, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v11, Lyz;

    if-eqz p1, :cond_40

    sget-object v10, Li10;->a:[I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    aget v10, v10, p1

    :cond_40
    if-eq v10, v9, :cond_5a

    if-eq v10, v8, :cond_54

    if-eq v10, v7, :cond_4e

    if-ne v10, v6, :cond_5f

    new-instance v5, Lohb;

    invoke-direct {v5, v4}, Lxz;-><init>(Lwz;)V

    goto :goto_5f

    :cond_4e
    new-instance v5, Lohb;

    invoke-direct {v5, v3}, Lxz;-><init>(Lwz;)V

    goto :goto_5f

    :cond_54
    new-instance v5, Lohb;

    invoke-direct {v5, v2}, Lxz;-><init>(Lwz;)V

    goto :goto_5f

    :cond_5a
    new-instance v5, Lohb;

    invoke-direct {v5, v1}, Lxz;-><init>(Lwz;)V

    :cond_5f
    :goto_5f
    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lj10;

    iget-object p0, p0, Lj10;->a:Lyl;

    if-eqz v5, :cond_6b

    invoke-virtual {p0, v5, v11, v0}, Ln1;->v(Lxz;Lyz;Ldl;)V

    goto :goto_6e

    :cond_6b
    invoke-virtual {p0, v11, v0}, Ln1;->x(Lyz;Ldl;)V

    :cond_6e
    :goto_6e
    return-void

    :pswitch_6f
    iget-object v0, p0, Lbzo;->j:Ljava/lang/String;

    invoke-static {p1}, Lvep;->f(I)B

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lw8h;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11}, Lphj;->t(Ljava/lang/String;I)V

    iget-object p0, p0, Lchb;->p:Lqb7;

    if-eqz p0, :cond_c6

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Lh10;

    iget-object v0, v0, Lh10;->v:Ldl;

    iget-object v11, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v11, Lyz;

    if-eqz p1, :cond_98

    sget-object v10, Li10;->a:[I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    aget v10, v10, p1

    :cond_98
    if-eq v10, v9, :cond_b2

    if-eq v10, v8, :cond_ac

    if-eq v10, v7, :cond_a6

    if-ne v10, v6, :cond_b7

    new-instance v5, Lohb;

    invoke-direct {v5, v4}, Lxz;-><init>(Lwz;)V

    goto :goto_b7

    :cond_a6
    new-instance v5, Lohb;

    invoke-direct {v5, v3}, Lxz;-><init>(Lwz;)V

    goto :goto_b7

    :cond_ac
    new-instance v5, Lohb;

    invoke-direct {v5, v2}, Lxz;-><init>(Lwz;)V

    goto :goto_b7

    :cond_b2
    new-instance v5, Lohb;

    invoke-direct {v5, v1}, Lxz;-><init>(Lwz;)V

    :cond_b7
    :goto_b7
    iget-object p0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lj10;

    iget-object p0, p0, Lj10;->a:Lyl;

    if-eqz v5, :cond_c3

    invoke-virtual {p0, v5, v11, v0}, Ln1;->v(Lxz;Lyz;Ldl;)V

    goto :goto_c6

    :cond_c3
    invoke-virtual {p0, v11, v0}, Ln1;->x(Lyz;Ldl;)V

    :cond_c6
    :goto_c6
    return-void

    nop

    :pswitch_data_c8
    .packed-switch 0x1
        :pswitch_6f
    .end packed-switch
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lzgb;->b:Lchb;

    iget-object v0, p0, Lchb;->q:Ll45;

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lchb;->q:Ll45;

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Ll45;->i()V

    return-void

    :cond_15
    sget-object p1, Lbm;->g:Lbm;

    invoke-virtual {p0, p1}, Ll45;->p(Lbm;)V

    return-void
.end method
