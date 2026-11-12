.class public final Llm6;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Lyl6;

.field public final d:Z

.field public final e:Lgm6;


# direct methods
.method public constructor <init>(Lmej;Lyl6;ZLgm6;)V
    .registers 5

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Llm6;->c:Lyl6;

    iput-boolean p3, p0, Llm6;->d:Z

    iput-object p4, p0, Llm6;->e:Lgm6;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 15

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d00f3

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a014c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_108

    invoke-static {v4}, Lzt5;->a(Landroid/view/View;)Lzt5;

    move-result-object v7

    const v1, 0x7f0a014d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroid/widget/FrameLayout;

    if-eqz v8, :cond_108

    const v1, 0x7f0a01b6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v4, :cond_108

    const v1, 0x7f0a06b5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_108

    const v1, 0x7f0a074b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v10, :cond_108

    const v1, 0x7f0a084d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v11, :cond_108

    const v1, 0x7f0a0a9f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Space;

    if-eqz v4, :cond_108

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v12, :cond_108

    new-instance v5, Lkf;

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v12}, Lkf;-><init>(Landroid/widget/LinearLayout;Lzt5;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/DialogTitle;)V

    const v0, 0x7f1401b7

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object v1

    new-instance v2, Lwj;

    const/4 v4, 0x2

    invoke-direct {v2, v5, p0, v4}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v6, v2}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    iget-object v1, v7, Lzt5;->c:Landroid/widget/TextView;

    const v2, 0x7f140554

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v2, p0, Llm6;->d:Z

    if-eqz v2, :cond_ae

    const v2, 0x7f140558

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b9

    :cond_ae
    const v2, 0x7f140556

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_b9
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Llm6;->c:Lyl6;

    invoke-virtual {v1}, Lyl6;->c()Z

    move-result v2

    if-eqz v2, :cond_d4

    const v1, 0x7f14055d

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_f1

    :cond_d4
    invoke-virtual {v1}, Lyl6;->b()Z

    move-result v1

    if-eqz v1, :cond_e6

    const v1, 0x7f14055a

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_f1

    :cond_e6
    const v1, 0x7f140559

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_f1
    invoke-virtual {v9, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lfm6;

    iget-object v0, p0, Llm6;->e:Lgm6;

    invoke-direct {p1, v0, p0, v3}, Lfm6;-><init>(Lgm6;Llm6;B)V

    invoke-virtual {v11, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lfm6;

    const/4 v1, 0x1

    invoke-direct {p1, v0, p0, v1}, Lfm6;-><init>(Lgm6;Llm6;B)V

    invoke-virtual {v10, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v6

    :cond_108
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method
