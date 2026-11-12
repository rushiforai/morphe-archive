.class public final Lv25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public f:J

.field public g:I


# direct methods
.method public constructor <init>()V
    .registers 7

    new-instance v2, Lrxh;

    const v0, 0x7f14104e

    invoke-direct {v2, v0}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v0, 0x7f14104f

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    const v4, 0x7f08050a

    sget-object v5, La35;->j:La35;

    const-string v1, "FileCache"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void
.end method


# virtual methods
.method public final b()I
    .registers 1

    const p0, 0x7f14043f

    return p0
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 8

    new-instance v0, Lsu;

    check-cast p2, Liu2;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p1, p2, v1}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lrqd;

    const/16 v3, 0xf

    invoke-direct {v2, v3}, Lrqd;-><init>(B)V

    invoke-virtual {v1, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v3, Llw0;

    const/4 v4, 0x1

    invoke-direct {v3, v0, v4}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v1, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v2, v0}, Lnml;->b(Lnml;)V

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Lnml;->a(Ljava/lang/Object;)Loml;

    new-instance v0, Lu25;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lu25;-><init>(Lv25;Ls25;Liu2;B)V

    sget-object v1, Llx3;->a:Li7f;

    invoke-static {v0}, LJ/N;->MG3rn5iA(Ljava/lang/Object;)V

    new-instance v0, Lu25;

    invoke-direct {v0, p0, p1, p2, v4}, Lu25;-><init>(Lv25;Ls25;Liu2;B)V

    invoke-static {v0}, LJ/N;->M6cFqzr$(Ljava/lang/Object;)V

    iget-object v0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->S0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leoj;

    new-instance v1, Lf9;

    const/16 v2, 0x14

    invoke-direct {v1, p0, p1, p2, v2}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Leoj;->c:Livg;

    iget-object p1, p0, Livg;->b:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance p2, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p2, v0, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Ljoj;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Ljoj;-><init>(Livg;B)V

    invoke-virtual {p2, p1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ltji;

    const/16 p2, 0x16

    invoke-direct {p1, v1, p2}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final e(Ls25;Liu2;)V
    .registers 7

    iget v0, p0, Lv25;->g:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lv25;->g:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_a

    return-void

    :cond_a
    iget-wide v0, p0, Lv25;->f:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_1c

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f141050

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_22

    :cond_1c
    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v0, v1, p0}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    :goto_22
    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method
