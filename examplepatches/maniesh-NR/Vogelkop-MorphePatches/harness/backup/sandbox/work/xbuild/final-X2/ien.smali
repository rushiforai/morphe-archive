.class public final Lien;
.super Lyi2;
.source "SourceFile"


# instance fields
.field public final g:Landroid/content/Context;

.field public final h:Lx5f;

.field public final i:Lslk;

.field public final j:Lnzk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lx5f;Lslk;Lnzk;Lydn;)V
    .registers 6

    invoke-direct {p0, p1, p3, p5}, Lyi2;-><init>(Landroid/content/Context;Lslk;Lydn;)V

    iput-object p1, p0, Lien;->g:Landroid/content/Context;

    iput-object p2, p0, Lien;->h:Lx5f;

    iput-object p3, p0, Lien;->i:Lslk;

    iput-object p4, p0, Lien;->j:Lnzk;

    return-void
.end method


# virtual methods
.method public final l(Landroid/content/Context;Z)V
    .registers 8

    const/4 v0, 0x1

    if-eqz p2, :cond_5

    move v1, v0

    goto :goto_6

    :cond_5
    const/4 v1, 0x2

    :goto_6
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    const-class v4, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-direct {v3, p1, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v3, v1, v0}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    if-nez p2, :cond_1b

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lien;->r(I)V

    return-void

    :cond_1b
    sget p2, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b:I

    sget p2, Leif;->a:I

    invoke-static {p1, v4}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_2c

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lien;->r(I)V

    :cond_2c
    return-void
.end method

.method public final o()V
    .registers 2

    sget v0, Leif;->a:I

    iget-object p0, p0, Lien;->g:Landroid/content/Context;

    const-class v0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p0, v0}, Lkfo;->k0(Landroid/content/Context;Ljava/lang/Class;)V

    return-void
.end method

.method public final q()Lg1o;
    .registers 14

    iget-object v0, p0, Lyi2;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object v1, v0, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v1, :cond_26

    iget-object p0, p0, Lien;->i:Lslk;

    iget-object p0, p0, Lslk;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    iget p0, p0, Lwvg;->e:I

    const/4 v0, 0x5

    if-ne p0, v0, :cond_20

    move v2, v3

    :cond_20
    new-instance p0, Lk1o;

    invoke-direct {p0, v5, v4, v2}, Lk1o;-><init>(ILjava/lang/String;I)V

    return-object p0

    :cond_26
    invoke-virtual {v0}, Lydn;->j()I

    move-result v1

    if-eqz v1, :cond_2e

    :goto_2c
    move v11, v1

    goto :goto_35

    :cond_2e
    invoke-virtual {v0}, Lydn;->i()Lfdn;

    move-result-object v1

    iget v1, v1, Lfdn;->i:I

    goto :goto_2c

    :goto_35
    invoke-virtual {v0}, Lydn;->q()I

    move-result v1

    if-ne v1, v3, :cond_49

    new-instance p0, Lh1o;

    invoke-virtual {v0}, Lydn;->k()Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lydn;->e:Lsgi;

    iget-boolean v0, v0, Lsgi;->d:Z

    invoke-direct {p0, v11, v1, v0}, Lh1o;-><init>(ILjava/lang/String;Z)V

    return-object p0

    :cond_49
    const/4 v3, 0x2

    if-ne v1, v3, :cond_5a

    new-instance p0, Lj1o;

    invoke-virtual {v0}, Lydn;->k()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lydn;->l()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v11, v1, v0}, Lj1o;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_5a
    const/4 v6, 0x1

    if-ne v1, v6, :cond_79

    iget-object v7, v0, Lydn;->f:Lqq8;

    invoke-virtual {v7}, Lqq8;->g()Z

    move-result v7

    if-eqz v7, :cond_79

    new-instance v6, Li1o;

    invoke-virtual {v0}, Lydn;->k()Ljava/lang/String;

    move-result-object v7

    const v10, 0x7f060cb8

    const/4 v12, 0x0

    const v8, 0x7f08068e

    const v9, 0x7f140820

    invoke-direct/range {v6 .. v12}, Lg1o;-><init>(Ljava/lang/String;IIIII)V

    return-object v6

    :cond_79
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x21

    if-lt v7, v8, :cond_8f

    const-string v7, "android.permission.POST_NOTIFICATIONS"

    iget-object p0, p0, Lien;->g:Landroid/content/Context;

    invoke-static {p0, v7}, Lna2;->o(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_8f

    new-instance p0, Lk1o;

    invoke-direct {p0, v5, v4, v5}, Lk1o;-><init>(ILjava/lang/String;I)V

    return-object p0

    :cond_8f
    if-eq v1, v2, :cond_92

    move v3, v6

    :cond_92
    new-instance p0, Lk1o;

    invoke-virtual {v0}, Lydn;->k()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v11, v0, v3}, Lk1o;-><init>(ILjava/lang/String;I)V

    return-object p0
.end method

.method public final r(I)V
    .registers 7

    iget-object p0, p0, Lien;->h:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v0

    int-to-long v2, p1

    const/4 p1, 0x1

    const/16 v4, 0x9

    invoke-virtual {v0, v4, p1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
