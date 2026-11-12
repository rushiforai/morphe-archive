.class public final Lw1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Lno7;


# direct methods
.method public constructor <init>(Ldj9;Lx5f;Lhd;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lw1;->a:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lw1;->d:Lno7;

    .line 22
    iput-object p2, p0, Lw1;->b:Ljava/lang/Object;

    .line 23
    iput-object p3, p0, Lw1;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lv1;Lcom/opera/android/browser/chromium/TurboDelegate;Lx5f;Lhd;)V
    .registers 5

    const/4 p2, 0x0

    iput-byte p2, p0, Lw1;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lw1;->d:Lno7;

    .line 18
    iput-object p3, p0, Lw1;->b:Ljava/lang/Object;

    .line 19
    iput-object p4, p0, Lw1;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxnh;Llzj;Lox3;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lw1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw1;->d:Lno7;

    iput-object p2, p0, Lw1;->b:Ljava/lang/Object;

    iput-object p3, p0, Lw1;->c:Ljava/lang/Object;

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 12

    iget-byte p1, p0, Lw1;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Lw1;->c:Ljava/lang/Object;

    iget-object v3, p0, Lw1;->d:Lno7;

    iget-object p0, p0, Lw1;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_10a

    check-cast p0, Llzj;

    check-cast v3, Lxnh;

    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    invoke-virtual {p1, v1}, Lwnh;->b(I)Z

    move-result p1

    if-eqz p1, :cond_3b

    check-cast v2, Lox3;

    invoke-virtual {v2}, Lox3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    if-eqz p1, :cond_3e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-wide/32 v5, 0x5265c00

    add-long/2addr v3, v5

    cmp-long p1, v1, v3

    if-gtz p1, :cond_3e

    invoke-virtual {p0, v0}, Llzj;->a(Z)V

    goto :goto_3e

    :cond_3b
    invoke-virtual {p0, v1}, Llzj;->a(Z)V

    :cond_3e
    :goto_3e
    return-void

    :pswitch_3f
    check-cast v3, Ldj9;

    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcj9;

    invoke-virtual {p1}, Lcj9;->isEmpty()Z

    move-result v0

    iget-object v3, p1, Lcj9;->a:Ljava/lang/String;

    iget-object v4, p1, Lcj9;->b:Ljava/lang/String;

    if-nez v0, :cond_95

    check-cast p0, Lx5f;

    iget-object v0, p1, Lcj9;->d:Ljava/lang/String;

    iget-object v5, p1, Lcj9;->e:Ljava/lang/String;

    iget p1, p1, Lcj9;->c:I

    iget-object v6, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    invoke-virtual {v7, v6}, Lx56;->M(Lzpa;)Lls0;

    move-result-object v6

    if-eqz v4, :cond_69

    const/4 v8, 0x2

    invoke-virtual {v6, v8, v4}, Lls0;->x(ILjava/lang/String;)V

    :cond_69
    if-eqz v3, :cond_6f

    const/4 v8, 0x3

    invoke-virtual {v6, v8, v3}, Lls0;->x(ILjava/lang/String;)V

    :cond_6f
    if-eqz v0, :cond_75

    const/4 v8, 0x4

    invoke-virtual {v6, v8, v0}, Lls0;->x(ILjava/lang/String;)V

    :cond_75
    if-eqz v5, :cond_7b

    const/4 v0, 0x5

    invoke-virtual {v6, v0, v5}, Lls0;->x(ILjava/lang/String;)V

    :cond_7b
    int-to-long v8, p1

    const/4 p1, 0x7

    invoke-virtual {v6, p1, v1, v8, v9}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v7}, Lx5f;->U0(Lx56;)V

    check-cast v2, Lhd;

    iget-boolean p0, v2, Lhd;->b:Z

    if-eqz p0, :cond_95

    if-nez v4, :cond_8d

    if-eqz v3, :cond_95

    :cond_8d
    new-instance p0, Le5f;

    invoke-direct {p0, v4, v3, p1}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v2, p0}, Lhd;->t(Lkotlin/jvm/functions/Function1;)V

    :cond_95
    return-void

    :pswitch_96
    check-cast v3, Lv1;

    invoke-virtual {v3}, Lv1;->y()Z

    move-result p1

    if-eqz p1, :cond_109

    invoke-virtual {v3}, Lv1;->x()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_109

    check-cast p0, Lx5f;

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v1}, Lx56;->M(Lzpa;)Lls0;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lls0;->x(ILjava/lang/String;)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    check-cast v2, Lhd;

    iget-boolean p0, v2, Lhd;->b:Z

    if-eqz p0, :cond_101

    iget-object p0, v2, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v1

    new-instance v3, Lbk0;

    invoke-direct {v3, p0, v1}, Lbk0;-><init>(Ln9a;Lw56;)V

    iget-object p0, v3, Lbk0;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltn0;

    iget-object p0, p0, Ltn0;->a:Lrn0;

    invoke-virtual {p0, v0, p1}, Lrn0;->x(ILjava/lang/String;)V

    iget-object p0, v2, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lmgh;

    invoke-virtual {p0, v1}, Lmgh;->c(Ljf0;)Z

    move-result p0

    if-nez p0, :cond_101

    iget-object p0, v2, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lo5f;

    const/16 v1, 0x12

    invoke-direct {p0, v2, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    iget-object v0, v2, Lhd;->f:Ljava/lang/Object;

    check-cast v0, Lqie;

    invoke-virtual {p0, v0}, Lplk;->m(Lqie;)Lp1j;

    :cond_101
    const-string p0, "abgroup"

    invoke-static {p0, p1}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, LJ/N;->MdrkO_AS()V

    :cond_109
    return-void

    :pswitch_data_10a
    .packed-switch 0x0
        :pswitch_96
        :pswitch_3f
    .end packed-switch
.end method
