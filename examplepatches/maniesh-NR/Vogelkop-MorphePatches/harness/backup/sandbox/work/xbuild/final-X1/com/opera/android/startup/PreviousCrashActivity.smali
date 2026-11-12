.class public Lcom/opera/android/startup/PreviousCrashActivity;
.super Lg9k;
.source "SourceFile"

# interfaces
.implements Lqch;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lg9k;-><init>()V

    return-void
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

    new-instance p1, Lhch;

    invoke-direct {p1}, Lhch;-><init>()V

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
