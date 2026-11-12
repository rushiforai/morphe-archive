.class public final Lcom/opera/android/qr/ScanQrCodeActivity;
.super Lhjf;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/qr/ScanQrCodeActivity;",
        "Lhjf;",
        "<init>",
        "()V",
        "hv3",
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
.field public static final synthetic k:I


# instance fields
.field public j:Llfh;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lhjf;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 17

    invoke-super/range {p0 .. p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lmcj;->s(Landroid/view/Window;Z)Z

    const v0, 0x7f0d0020

    invoke-virtual {p0, v0}, Lfp1;->setContentView(I)V

    const v0, 0x7f0a04d3

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v3, 0x7f0a0046

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v7, :cond_13d

    const v3, 0x7f0a0193

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v4, :cond_13d

    const v3, 0x7f0a01c5

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroidx/camera/view/PreviewView;

    if-eqz v8, :cond_13d

    const v3, 0x7f0a0231

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v9, :cond_13d

    const v3, 0x7f0a0278

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_13d

    const v3, 0x7f0a0292

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v11, :cond_13d

    const v3, 0x7f0a04b6

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v12, :cond_13d

    move-object v6, v0

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v3, 0x7f0a0618

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v13, :cond_13d

    const v3, 0x7f0a0aad

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/Spinner;

    if-eqz v4, :cond_13d

    const v3, 0x7f0a0bd2

    invoke-static {v3, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v14, :cond_13d

    new-instance v4, Lei;

    move-object v5, v4

    invoke-direct/range {v5 .. v14}, Lei;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Landroidx/camera/view/PreviewView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageView;Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    new-instance v0, Llfh;

    sget-object v3, Lvml;->d:Lumi;

    new-instance v5, Lgzh;

    const/16 v6, 0xe

    invoke-direct {v5, v6}, Lgzh;-><init>(B)V

    invoke-direct {v0, p0, v8, v5}, Llfh;-><init>(Lndc;Landroidx/camera/view/PreviewView;Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Lcom/opera/android/qr/ScanQrCodeActivity;->j:Llfh;

    new-instance v5, Lpli;

    invoke-direct {v5, p0, v2}, Lpli;-><init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V

    new-instance v6, Lw4i;

    const/4 v7, 0x3

    invoke-direct {v6, v5, v7}, Lw4i;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Llfh;->j:Lpde;

    invoke-virtual {v0, p0, v6}, Lekc;->j(Lndc;Lf7f;)V

    const-string v0, "android.permission.CAMERA"

    invoke-static {p0, v0}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v5, 0x1

    if-nez v0, :cond_eb

    sget-object v0, Lzeh;->a:Lzeh;

    invoke-static {v0}, Lmfh;->q(Lbfh;)Lrxh;

    move-result-object v0

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v0, v6}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    const-string v7, "error-message"

    invoke-virtual {v6, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v5, v6}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_eb
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v6, Lami;

    new-instance v7, Lole;

    invoke-direct {v7, p0}, Lole;-><init>(Lxd5;)V

    iget-object v7, v7, Lole;->a:Ljava/lang/Object;

    check-cast v7, Lpde;

    new-instance v8, Liv0;

    const/4 v9, 0x4

    invoke-direct {v8, p0, v9}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-static {v7, v8}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v7

    invoke-static {v7}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v7

    iget-object v8, p0, Lcom/opera/android/qr/ScanQrCodeActivity;->j:Llfh;

    if-nez v8, :cond_111

    const/4 v8, 0x0

    :cond_111
    iget-object v0, v0, Lcom/opera/android/OperaApplication;->s:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu0a;

    iget-object v0, v0, Lu0a;->a:Lpde;

    move-object v9, v7

    move-object v7, v0

    move-object v0, v6

    move-object v6, v8

    new-instance v8, Lqli;

    invoke-direct {v8, p0, v2}, Lqli;-><init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V

    move-object v2, v9

    new-instance v9, Lpli;

    invoke-direct {v9, p0, v5}, Lpli;-><init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V

    new-instance v10, La7b;

    const/16 v11, 0x1d

    invoke-direct {v10, p0, v11}, La7b;-><init>(Ljava/lang/Object;B)V

    new-instance v11, Lqli;

    invoke-direct {v11, p0, v5}, Lqli;-><init>(Lcom/opera/android/qr/ScanQrCodeActivity;B)V

    move-object v5, v2

    move-object v2, p0

    move-object v1, p0

    invoke-direct/range {v0 .. v11}, Lami;-><init>(Lcom/opera/android/qr/ScanQrCodeActivity;Lcom/opera/android/qr/ScanQrCodeActivity;Lumi;Lei;Ltsd;Llfh;Lpde;Lqli;Lpli;La7b;Lqli;)V

    return-void

    :cond_13d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/16 v0, 0x18

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_22

    const/16 v0, 0x19

    if-eq p1, v0, :cond_18

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_17

    const/16 v0, 0x50

    if-eq p1, v0, :cond_17

    invoke-super {p0, p1, p2}, Lfp1;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_17
    return v2

    :cond_18
    iget-object p0, p0, Lcom/opera/android/qr/ScanQrCodeActivity;->j:Llfh;

    if-eqz p0, :cond_1d

    move-object v1, p0

    :cond_1d
    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Llfh;->a(Z)V

    return v2

    :cond_22
    iget-object p0, p0, Lcom/opera/android/qr/ScanQrCodeActivity;->j:Llfh;

    if-eqz p0, :cond_27

    move-object v1, p0

    :cond_27
    invoke-virtual {v1, v2}, Llfh;->a(Z)V

    return v2
.end method
