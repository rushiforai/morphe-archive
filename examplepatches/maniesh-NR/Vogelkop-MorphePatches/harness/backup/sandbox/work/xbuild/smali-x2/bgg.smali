.class public final Lbgg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lagg;


# direct methods
.method public static b()V
    .registers 5

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    const-string v0, "General"

    const-string v1, "Campaign"

    invoke-static {v0, v1}, LJ/N;->MQ$xB7I2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_33

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->d:Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->M(Lzpa;)Lls0;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v0}, Lls0;->x(ILjava/lang/String;)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    :cond_33
    return-void
.end method

.method public static c()V
    .registers 5

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->d:Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v2

    const/4 v4, 0x3

    invoke-virtual {v2, v4, v0}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->f:Losf;

    iget-object v2, v1, Losf;->b:Lpsp;

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v3

    new-instance v4, Lyj0;

    invoke-direct {v4, v2, v3}, Lyj0;-><init>(Lpsp;Lt56;)V

    iget-object v2, v4, Lyj0;->c:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luf0;

    iget-object v2, v2, Luf0;->a:Lpf0;

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v0}, Lpf0;->x(ILjava/lang/String;)V

    iget-object v0, v1, Losf;->e:Lmgh;

    invoke-virtual {v0, v3}, Lmgh;->c(Ljf0;)Z

    move-result v0

    if-nez v0, :cond_6b

    iget-object v0, v1, Losf;->a:Lumi;

    new-instance v2, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v2, v3, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lmsf;

    invoke-direct {v0, v1, v4}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v2, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object v1, v1, Losf;->d:Lqie;

    invoke-virtual {v0, v1}, Lplk;->m(Lqie;)Lp1j;

    :cond_6b
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    const-string p0, "."

    invoke-static {p1, p0, p2}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Cookies.Client"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    invoke-static {}, Lbgg;->c()V

    return-void

    :cond_12
    const-string p1, "General.Campaign"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1d

    invoke-static {}, Lbgg;->b()V

    :cond_1d
    return-void
.end method
