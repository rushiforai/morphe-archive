.class public final Ldq;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Lmq;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/util/List;


# direct methods
.method public constructor <init>(Lmej;Lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 7

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Ldq;->c:Lmq;

    iput-object p3, p0, Ldq;->d:Ljava/lang/String;

    iput-object p4, p0, Ldq;->e:Ljava/lang/String;

    iput-object p5, p0, Ldq;->f:Ljava/lang/String;

    iput-object p6, p0, Ldq;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 12

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0025

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0010

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_7b

    const v0, 0x7f0a03a8

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_7b

    const v0, 0x7f0a0525

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_7b

    const v0, 0x7f0a0322

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_7b

    check-cast p1, Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    const/16 v7, 0x8

    iget-object v8, p0, Ldq;->f:Ljava/lang/String;

    if-eqz v8, :cond_54

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_54

    sget-object v9, Lyne;->b:Ldeg;

    invoke-virtual {v9, v8}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v8

    iput-boolean v0, v8, Ldwh;->d:Z

    invoke-virtual {v8, v6, v1}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    goto :goto_57

    :cond_54
    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    :goto_57
    iget-object v1, p0, Ldq;->d:Ljava/lang/String;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lbq;

    invoke-direct {v1, p0, v2}, Lbq;-><init>(Ldq;B)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Ldq;->g:Ljava/util/List;

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_77

    new-instance v1, Lbq;

    invoke-direct {v1, p0, v0}, Lbq;-><init>(Ldq;B)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1

    :cond_77
    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    return-object p1

    :cond_7b
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method
