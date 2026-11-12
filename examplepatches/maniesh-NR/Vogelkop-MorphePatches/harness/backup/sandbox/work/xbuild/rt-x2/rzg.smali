.class public final Lrzg;
.super Lzp1;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const v0, 0x7f1506ac

    .line 9
    invoke-direct {p0, p1, v0}, Lzp1;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Lqvl;Landroid/content/Context;Lb2l;)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Lrzg;->g:B

    iput-object p1, p0, Lrzg;->h:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lrzg;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lxzg;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lrzg;->g:B

    .line 10
    iput-object p1, p0, Lrzg;->h:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lrzg;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final dismiss()V
    .registers 5

    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_36

    const v0, 0x7f0a02de

    invoke-virtual {p0, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    sget-object v2, Lvgb;->a:Lyp8;

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lssi;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lssi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void

    :cond_36
    invoke-super {p0}, Lzp1;->dismiss()V

    return-void
.end method

.method public final f()V
    .registers 6

    const v0, 0x7f0a02de

    invoke-virtual {p0, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lh4i;

    const/16 v3, 0x19

    invoke-direct {v2, p0, v3}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setLayout(II)V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, -0x78000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, 0x4000000

    invoke-virtual {v3, v4}, Landroid/view/Window;->clearFlags(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iput v2, v3, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    new-instance v3, Lsvk;

    const/4 v4, 0x7

    invoke-direct {v3, p0, v4}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v4

    if-eqz v4, :cond_5c

    invoke-static {v4, v1, v3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_5c
    invoke-virtual {v3, v1}, Lsvk;->a(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Ln5l;

    invoke-direct {v1, p0, v0, v2}, Ln5l;-><init>(Landroid/view/KeyEvent$Callback;Landroid/view/View;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final g()V
    .registers 1

    invoke-super {p0}, Lzp1;->dismiss()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 7

    iget-byte v0, p0, Lrzg;->g:B

    iget-object v1, p0, Lrzg;->h:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6c

    invoke-super {p0, p1}, Lzp1;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0307

    invoke-virtual {p0, p1}, Lrzg;->setContentView(I)V

    const p1, 0x7f0a026e

    invoke-virtual {p0, p1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewStub;

    check-cast v1, Lqvl;

    iget-object p1, v1, Lqvl;->a:Lebf;

    invoke-interface {p1, p0, v1}, Lebf;->j(Landroid/view/ViewStub;Labf;)V

    return-void

    :pswitch_21
    check-cast v1, Lxzg;

    invoke-super {p0, p1}, Lzp1;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d034f

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0269

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_5a

    invoke-static {v2}, Lei;->a(Landroid/view/View;)Lei;

    move-result-object v0

    move-object v2, p1

    check-cast v2, Landroid/widget/FrameLayout;

    const v3, 0x7f0a0bcf

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/privacy_monitor/views/PrivacyMonitorTopSheetLayout;

    if-eqz v4, :cond_59

    iput-object v4, v1, Lxzg;->g:Landroid/view/ViewGroup;

    iput-object v0, v1, Lxzg;->h:Lei;

    invoke-virtual {p0, v2}, Lrzg;->setContentView(Landroid/view/View;)V

    invoke-virtual {v1}, Lxzg;->i0()V

    goto :goto_6b

    :cond_59
    move v0, v3

    :cond_5a
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method

.method public final setContentView(I)V
    .registers 2

    invoke-super {p0, p1}, Lzp1;->setContentView(I)V

    invoke-virtual {p0}, Lrzg;->f()V

    return-void
.end method

.method public final setContentView(Landroid/view/View;)V
    .registers 2

    .line 7
    invoke-super {p0, p1}, Lzp1;->setContentView(Landroid/view/View;)V

    .line 8
    invoke-virtual {p0}, Lrzg;->f()V

    return-void
.end method

.method public final setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3

    .line 9
    invoke-super {p0, p1, p2}, Lzp1;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    invoke-virtual {p0}, Lrzg;->f()V

    return-void
.end method
