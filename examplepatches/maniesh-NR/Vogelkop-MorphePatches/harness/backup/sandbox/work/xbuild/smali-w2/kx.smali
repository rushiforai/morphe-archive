.class public final Lkx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lea2;


# instance fields
.field public final synthetic a:B

.field public final b:Lkze;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lkze;Lizj;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lkx;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkx;->b:Lkze;

    iput-object p2, p0, Lkx;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5f;Lkze;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lkx;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lkx;->c:Ljava/lang/Object;

    .line 13
    iput-object p2, p0, Lkx;->b:Lkze;

    return-void
.end method


# virtual methods
.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 8

    iget-byte v0, p0, Lkx;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lkx;->b:Lkze;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_f2

    const p0, 0x7f0d015a

    if-eq p2, p0, :cond_c3

    const p0, 0x7f0d015f

    if-eq p2, p0, :cond_c3

    const p0, 0x7f0d015d

    if-eq p2, p0, :cond_c3

    const p0, 0x7f0d0161

    const v0, 0x7f150690

    if-ne p2, p0, :cond_2f

    new-instance v1, Li00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    const/16 p1, 0x15e

    const/16 p2, 0xc8

    invoke-direct {v1, p0, p1, p2, v2}, Lf00;-><init>(Landroid/view/View;IILkze;)V

    goto/16 :goto_dd

    :cond_2f
    const p0, 0x7f0d014e

    if-ne p2, p0, :cond_43

    new-instance v1, Li00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    const/16 p1, 0x12c

    const/16 p2, 0xfa

    invoke-direct {v1, p0, p1, p2, v2}, Lf00;-><init>(Landroid/view/View;IILkze;)V

    goto/16 :goto_dd

    :cond_43
    const p0, 0x7f0d0151

    const/4 v4, 0x1

    if-ne p2, p0, :cond_54

    new-instance v1, Lj00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v4, v2}, Lj00;-><init>(Landroid/view/View;ZLkze;)V

    goto/16 :goto_dd

    :cond_54
    const p0, 0x7f0d014f

    if-eq p2, p0, :cond_b9

    const p0, 0x7f0d0150

    if-eq p2, p0, :cond_b9

    const p0, 0x7f0d0153

    if-ne p2, p0, :cond_6e

    new-instance v1, Lk00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v4, v2}, Lk00;-><init>(Landroid/view/View;ZLkze;)V

    goto/16 :goto_dd

    :cond_6e
    const p0, 0x7f0d0152

    if-ne p2, p0, :cond_7d

    new-instance v1, Lk00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v3, v2}, Lk00;-><init>(Landroid/view/View;ZLkze;)V

    goto :goto_dd

    :cond_7d
    const p0, 0x7f0d015e

    if-ne p2, p0, :cond_8c

    new-instance v1, La10;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v2}, Ld10;-><init>(Landroid/view/View;Lkze;)V

    goto :goto_dd

    :cond_8c
    const p0, 0x7f0d0160

    if-ne p2, p0, :cond_9b

    new-instance v1, Le10;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v2}, Ld10;-><init>(Landroid/view/View;Lkze;)V

    goto :goto_dd

    :cond_9b
    const p0, 0x7f0d015b

    if-ne p2, p0, :cond_aa

    new-instance v1, Ly00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v2}, Lg10;-><init>(Landroid/view/View;Lkze;)V

    goto :goto_dd

    :cond_aa
    const p0, 0x7f0d0163

    if-ne p2, p0, :cond_dd

    new-instance v1, Lmu8;

    invoke-static {p1, p0, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0}, Lab2;-><init>(Landroid/view/View;)V

    goto :goto_dd

    :cond_b9
    new-instance v1, Lj00;

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0, v3, v2}, Lj00;-><init>(Landroid/view/View;ZLkze;)V

    goto :goto_dd

    :cond_c3
    new-instance v1, Lh00;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    new-instance p1, Ln00;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-direct {v1, p0, p1, v2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    new-instance p1, Ljsd;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {p1, p0}, Ljsd;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lxv8;->h0(Landroid/view/View;)V

    :cond_dd
    :goto_dd
    return-object v1

    :pswitch_de
    const v0, 0x7f0d014a

    if-ne p2, v0, :cond_f0

    new-instance v1, Llx;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lkx;->c:Ljava/lang/Object;

    check-cast p0, Lizj;

    invoke-direct {v1, p1, v2, p0}, Llx;-><init>(Landroid/view/View;Lkze;Lizj;)V

    :cond_f0
    return-object v1

    nop

    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_de
    .end packed-switch
.end method

.method public final q(Lja2;ILca2;)I
    .registers 14

    iget-byte p2, p0, Lkx;->a:B

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_aa

    iget-byte p2, p3, Lca2;->b:B

    iget-boolean p3, p3, Lca2;->a:Z

    instance-of v1, p1, Lx10;

    if-eqz v1, :cond_a1

    check-cast p1, Lx10;

    iget-object p1, p1, Lmq;->d:Lyz;

    check-cast p1, Lw10;

    iget-object v0, p1, Lw10;->u:Lcie;

    iget-object v0, v0, Lbzo;->d:Lw06;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_92

    const/4 v2, 0x3

    if-eq v0, v2, :cond_8e

    const/16 v2, 0x8

    if-eq v0, v2, :cond_8a

    packed-switch v0, :pswitch_data_b0

    packed-switch v0, :pswitch_data_ba

    iget-object p2, p1, Lyz;->n:Luz;

    invoke-virtual {p1}, Lyz;->h()Ldl;

    move-result-object p3

    iget-object p0, p0, Lkx;->c:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lx5f;

    iget-object v1, p1, Lyz;->g:Ljava/lang/String;

    iget-object p0, p1, Lyz;->i:Lyo;

    invoke-static {p0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v2

    if-eqz p3, :cond_45

    iget-object p0, p3, Ldl;->b:Lq50;

    :goto_43
    move-object v3, p0

    goto :goto_48

    :cond_45
    sget-object p0, Lq50;->f:Lq50;

    goto :goto_43

    :goto_48
    if-eqz p2, :cond_4e

    iget-object p0, p2, Luz;->a:Ljava/lang/String;

    :goto_4c
    move-object v4, p0

    goto :goto_51

    :cond_4e
    const-string p0, ""

    goto :goto_4c

    :goto_51
    invoke-virtual {p1}, Lw10;->e()Lv50;

    move-result-object v8

    const/4 v9, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v9}, Lx5f;->p(Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JZLv50;Ljava/lang/Long;)V

    const v0, 0x7f0d0163

    goto :goto_a1

    :pswitch_60
    if-gt p2, v1, :cond_64

    if-nez p3, :cond_9a

    :cond_64
    const v0, 0x7f0d0161

    goto :goto_a1

    :pswitch_68
    const v0, 0x7f0d0160

    goto :goto_a1

    :pswitch_6c
    const v0, 0x7f0d015e

    goto :goto_a1

    :pswitch_70
    if-eqz p3, :cond_76

    const v0, 0x7f0d0153

    goto :goto_a1

    :cond_76
    const v0, 0x7f0d0152

    goto :goto_a1

    :pswitch_7a
    if-le p2, v1, :cond_80

    const v0, 0x7f0d0150

    goto :goto_a1

    :cond_80
    if-eqz p3, :cond_86

    const v0, 0x7f0d0151

    goto :goto_a1

    :cond_86
    const v0, 0x7f0d014f

    goto :goto_a1

    :cond_8a
    const v0, 0x7f0d015b

    goto :goto_a1

    :cond_8e
    const v0, 0x7f0d014e

    goto :goto_a1

    :cond_92
    :pswitch_92
    if-le p2, v1, :cond_98

    const v0, 0x7f0d015d

    goto :goto_a1

    :cond_98
    if-eqz p3, :cond_9e

    :cond_9a
    const v0, 0x7f0d015f

    goto :goto_a1

    :cond_9e
    const v0, 0x7f0d015a

    :cond_a1
    :goto_a1
    return v0

    :pswitch_a2
    instance-of p0, p1, Lfo;

    if-eqz p0, :cond_a9

    const v0, 0x7f0d014a

    :cond_a9
    return v0

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_a2
    .end packed-switch

    :pswitch_data_b0
    .packed-switch 0xd
        :pswitch_7a
        :pswitch_70
        :pswitch_6c
    .end packed-switch

    :pswitch_data_ba
    .packed-switch 0x13
        :pswitch_68
        :pswitch_68
        :pswitch_68
        :pswitch_60
        :pswitch_60
        :pswitch_60
        :pswitch_92
    .end packed-switch
.end method
