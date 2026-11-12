.class public Lcom/opera/android/startup/InstallSplitLocaleActivity;
.super Lg9k;
.source "SourceFile"


# static fields
.field public static m:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lg9k;-><init>()V

    return-void
.end method

.method public static K(Landroid/content/Context;)Z
    .registers 6

    invoke-static {p0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/opera/android/startup/InstallSplitLocaleActivity;->m:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    if-nez v0, :cond_e

    const-string v3, ""

    goto :goto_f

    :cond_e
    move-object v3, v0

    :goto_f
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    :cond_15
    invoke-static {v0}, Lw8h;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    if-nez v1, :cond_1e

    move v1, v3

    goto :goto_26

    :cond_1e
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v4, v1}, Lw8h;->v(Landroid/content/res/Resources;Ljava/lang/String;)Z

    move-result v1

    :goto_26
    if-eqz v1, :cond_29

    :cond_28
    return v2

    :cond_29
    invoke-static {p0, v0}, Lw8h;->o(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_50

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Installed but not active: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v1, v0}, Lx5f;->R(ILjava/lang/String;)V

    return v2

    :cond_50
    return v3
.end method


# virtual methods
.method public final I(I)V
    .registers 3

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_9

    const/4 p1, 0x0

    goto :goto_a

    :cond_9
    const/4 p1, 0x1

    :goto_a
    invoke-static {p0, p1}, Lkfo;->d0(Landroid/app/Activity;I)V

    return-void
.end method

.method public final J()V
    .registers 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_c

    const-string v0, ""

    :cond_c
    sput-object v0, Lcom/opera/android/startup/InstallSplitLocaleActivity;->m:Ljava/lang/String;

    invoke-super {p0}, Lg9k;->J()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lg9k;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lg9k;->H()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    const v0, 0x7f0d0495

    invoke-virtual {p0, v0}, Lg9k;->setContentView(I)V

    if-nez p1, :cond_2a

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0, p0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object p0

    new-instance p1, Lmab;

    invoke-direct {p1}, Lmab;-><init>()V

    const/4 v0, 0x0

    const v1, 0x7f0a04d1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, p1, v0, v2}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {p0, v2, v2}, Landroidx/fragment/app/a;->i(ZZ)I

    :cond_2a
    return-void
.end method

.method public final w()I
    .registers 3

    invoke-virtual {p0}, Lhjf;->z()Z

    move-result p0

    const/16 v0, 0xc

    sget-object v1, Lg7j;->h:Lg7j;

    invoke-static {v1, p0, v0}, Lqbe;->A(Lg7j;ZI)I

    move-result p0

    return p0
.end method
