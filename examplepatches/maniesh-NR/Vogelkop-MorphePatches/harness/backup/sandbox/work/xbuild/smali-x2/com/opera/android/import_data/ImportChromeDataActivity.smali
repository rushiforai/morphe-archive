.class public final Lcom/opera/android/import_data/ImportChromeDataActivity;
.super Ll2b;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0007\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\u0008B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/android/import_data/ImportChromeDataActivity;",
        "Ll2b;",
        "<init>",
        "()V",
        "j2b",
        "cx3",
        "xm5",
        "d06",
        "ir5",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic d0:I


# instance fields
.field public a0:Lj2b;

.field public final b0:Ljm3;

.field public final c0:Lv5g;


# direct methods
.method public constructor <init>()V
    .registers 6

    invoke-direct {p0}, Ll2b;-><init>()V

    new-instance v0, Ljm3;

    sget-object v1, Lnl3;->d:Lnl3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    iput-boolean v2, v0, Ljm3;->a:Z

    const-wide/16 v3, 0x0

    iput-wide v3, v0, Ljm3;->b:J

    iput-object v1, v0, Ljm3;->c:Lnl3;

    iput-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->b0:Ljm3;

    new-instance v0, Lv5g;

    sget-object v1, Ly2b;->e:Ly2b;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, v0, Lv5g;->a:Z

    iput v2, v0, Lv5g;->b:I

    iput-object v1, v0, Lv5g;->c:Ly2b;

    iput-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->c0:Lv5g;

    return-void
.end method


# virtual methods
.method public final D0()V
    .registers 4

    invoke-super {p0}, Ll2b;->D0()V

    iget-object v0, p0, Ll2b;->N:Lj3b;

    if-eqz v0, :cond_23

    iget-object v1, v0, Lj3b;->b:Lor2;

    const v2, 0x7f040555

    invoke-virtual {v0, v2}, Lj3b;->a(I)V

    iget-object v0, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f14087b

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f140879

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :cond_23
    iget-object v0, p0, Ll2b;->N:Lj3b;

    if-eqz v0, :cond_36

    new-instance v1, Lsma;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lsma;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_36
    return-void
.end method

.method public final F0()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    sget-object v1, Lj2b;->c:Lj2b;

    if-ne v0, v1, :cond_11

    const v0, 0x7f140c6a

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void

    :cond_11
    sget-object v1, Lj2b;->d:Lj2b;

    if-ne v0, v1, :cond_1a

    const-string v0, "Google Takeout"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1a
    return-void
.end method

.method public final G0()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    sget-object v1, Lj2b;->c:Lj2b;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_d

    const-string v0, "https://passwords.google.com/options"

    invoke-virtual {p0, v2, v0}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    return-void

    :cond_d
    sget-object v1, Lj2b;->d:Lj2b;

    if-ne v0, v1, :cond_16

    const-string v0, "https://takeout.google.com"

    invoke-virtual {p0, v2, v0}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    :cond_16
    return-void
.end method

.method public final H0()V
    .registers 2

    const v0, 0x7f14086a

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final I0()V
    .registers 3

    sget-object v0, Lj2b;->c:Lj2b;

    sget-object v1, Lb3b;->a:[Lb3b;

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    return-void
.end method

.method public final J0()V
    .registers 2

    const v0, 0x7f14086a

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final K0()V
    .registers 3

    invoke-virtual {p0}, Ll2b;->M0()V

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    if-eqz v0, :cond_d

    sget-object v1, Lb3b;->a:[Lb3b;

    const/4 v1, -0x3

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/import_data/ImportChromeDataActivity;->R0(Lj2b;I)V

    :cond_d
    return-void
.end method

.method public final N0(Lre7;)V
    .registers 4

    new-instance v0, Lcx3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcx3;-><init>(Ldx3;Lre7;B)V

    return-void
.end method

.method public final R0(Lj2b;I)V
    .registers 9

    sget-object v0, Lj2b;->c:Lj2b;

    sget-object v1, Leb0;->c:Leb0;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->b0:Ljm3;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->c0:Lv5g;

    if-ne p1, v0, :cond_31

    iput-boolean v4, v5, Lv5g;->a:Z

    sget-object v0, Ly2b;->b:Lix5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lix5;->p(I)Ly2b;

    move-result-object p2

    iput-object p2, v5, Lv5g;->c:Ly2b;

    sget-object p2, Lv2b;->c:Lv2b;

    iget-object v0, p0, Ll2b;->U:Lx5f;

    if-eqz v0, :cond_20

    move-object v2, v0

    :cond_20
    sget-object v0, Lw2b;->b:Lhv5;

    iget-object v4, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object v0

    sget-object v4, Lc3b;->c:Lc3b;

    invoke-virtual {v2, v0, v4, p2, v1}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    goto :goto_59

    :cond_31
    sget-object v0, Lj2b;->d:Lj2b;

    if-ne p1, v0, :cond_59

    iput-boolean v4, v3, Ljm3;->a:Z

    sget-object v0, Lnl3;->b:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lulp;->C(I)Lnl3;

    move-result-object p2

    iput-object p2, v3, Ljm3;->c:Lnl3;

    sget-object p2, Lv2b;->b:Lv2b;

    iget-object v0, p0, Ll2b;->U:Lx5f;

    if-eqz v0, :cond_49

    move-object v2, v0

    :cond_49
    sget-object v0, Lw2b;->b:Lhv5;

    iget-object v4, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object v0

    sget-object v4, Lc3b;->c:Lc3b;

    invoke-virtual {v2, v0, v4, p2, v1}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    :cond_59
    :goto_59
    iget-boolean p2, p1, Lj2b;->a:Z

    if-eqz p2, :cond_8f

    iget-object p1, p0, Ll2b;->N:Lj3b;

    if-eqz p1, :cond_6a

    iget-object p1, p1, Lj3b;->b:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p1}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :cond_6a
    invoke-static {p0}, Ljoh;->p(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_86

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    invoke-static {v3, v5}, Lvtp;->y(Ljm3;Lv5g;)Lnz0;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_86
    new-instance p0, Lfc6;

    invoke-direct {p0, v3, v5}, Lfc6;-><init>(Ljm3;Lv5g;)V

    invoke-static {p0}, Lac8;->b(Ljava/lang/Object;)V

    return-void

    :cond_8f
    sget-object p2, Lj2b;->b:Lwu5;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lwu5;->i(Lj2b;)Lj2b;

    move-result-object p1

    if-eqz p1, :cond_9d

    invoke-static {p0, p1}, Lir5;->i(Landroid/content/Context;Lj2b;)V

    :cond_9d
    return-void
.end method

.method public final S0(Lj2b;I)V
    .registers 3

    invoke-virtual {p0}, Ll2b;->M0()V

    invoke-virtual {p0}, Ll2b;->B0()V

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/import_data/ImportChromeDataActivity;->R0(Lj2b;I)V

    return-void
.end method

.method public final T0(Lj2b;)V
    .registers 3

    invoke-virtual {p0}, Ll2b;->M0()V

    invoke-virtual {p0}, Ll2b;->B0()V

    iget-boolean v0, p1, Lj2b;->a:Z

    if-eqz v0, :cond_1e

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    new-instance p1, Lfc6;

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->b0:Ljm3;

    iget-object p0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->c0:Lv5g;

    invoke-direct {p1, v0, p0}, Lfc6;-><init>(Ljm3;Lv5g;)V

    invoke-static {p1}, Lac8;->b(Ljava/lang/Object;)V

    return-void

    :cond_1e
    sget-object v0, Lj2b;->b:Lwu5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lwu5;->i(Lj2b;)Lj2b;

    move-result-object p1

    if-eqz p1, :cond_2c

    invoke-static {p0, p1}, Lir5;->i(Landroid/content/Context;Lj2b;)V

    :cond_2c
    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Ll2b;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Ll2b;->P0()V

    return-void
.end method

.method public final p0()V
    .registers 9

    invoke-super {p0}, Ll2b;->p0()V

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->k0()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_10

    :cond_f
    move-object v0, v1

    :goto_10
    const-string v2, "passwords.google.com"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v2, 0x0

    const-string v4, "extra_imported_partly"

    const/4 v5, 0x0

    const-string v6, "extra_try_again_partly"

    const/4 v7, 0x1

    if-eqz v0, :cond_43

    sget-object v0, Lj2b;->c:Lj2b;

    iput-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v6, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_78

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    if-eqz v0, :cond_34

    iput-boolean v7, v0, Lj2b;->a:Z

    :cond_34
    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->b0:Ljm3;

    iput-boolean v7, v0, Ljm3;->a:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, v0, Ljm3;->b:J

    return-void

    :cond_43
    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->k0()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    :cond_4d
    const-string v0, "takeout.google.com"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_78

    sget-object v0, Lj2b;->d:Lj2b;

    iput-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v6, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_78

    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->a0:Lj2b;

    if-eqz v0, :cond_69

    iput-boolean v7, v0, Lj2b;->a:Z

    :cond_69
    iget-object v0, p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->c0:Lv5g;

    iput-boolean v7, v0, Lv5g;->a:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    long-to-int p0, v1

    iput p0, v0, Lv5g;->b:I

    :cond_78
    return-void
.end method
