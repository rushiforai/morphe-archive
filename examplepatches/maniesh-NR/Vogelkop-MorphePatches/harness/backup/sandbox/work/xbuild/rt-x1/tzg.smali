.class public final Ltzg;
.super Lzp1;
.source "SourceFile"


# instance fields
.field public final synthetic g:Lbp;

.field public final synthetic h:Lxzg;


# direct methods
.method public constructor <init>(Lxzg;Landroid/content/Context;Lbp;)V
    .registers 4

    iput-object p3, p0, Ltzg;->g:Lbp;

    iput-object p1, p0, Ltzg;->h:Lxzg;

    const p1, 0x7f1502db

    invoke-direct {p0, p2, p1}, Lzp1;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Lzp1;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0348

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0269

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_b0

    invoke-static {v1}, Lei;->a(Landroid/view/View;)Lei;

    move-result-object v0

    const v1, 0x7f0a02d9

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/view/ConfigurationChangeFrameLayout;

    if-eqz v2, :cond_af

    check-cast p1, Lcom/opera/android/custom_views/AnchoringViewGroup;

    iget-object v1, p0, Ltzg;->h:Lxzg;

    iput-object v2, v1, Lxzg;->g:Landroid/view/ViewGroup;

    iput-object v0, v1, Lxzg;->h:Lei;

    invoke-virtual {p0, p1}, Lzp1;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setLayout(II)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v2, -0x78000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v2, 0x4000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v2, 0x1

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    new-instance v0, Lzvd;

    const/16 v2, 0x17

    invoke-direct {v0, p0, v2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p1, Lcom/opera/android/custom_views/AnchoringViewGroup;->d:Lj21;

    iget-object v2, p1, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    if-eqz v2, :cond_7d

    iget-object v2, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_7d
    iget-object v2, p0, Ltzg;->g:Lbp;

    iput-object v2, p1, Lcom/opera/android/custom_views/AnchoringViewGroup;->e:Lbp;

    iget-object v2, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/bar/OmniButtonView;

    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_98

    invoke-static {p1}, Lp8f;->w(Landroid/view/Window;)V

    :cond_98
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_ab

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, Ltu4;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, Ltu4;-><init>(Landroid/view/Window;B)V

    invoke-static {p1, v0}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_ab
    invoke-virtual {v1}, Lxzg;->i0()V

    return-void

    :cond_af
    move v0, v1

    :cond_b0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
