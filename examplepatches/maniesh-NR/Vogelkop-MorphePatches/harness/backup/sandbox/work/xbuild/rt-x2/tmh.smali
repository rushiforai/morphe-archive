.class public final synthetic Ltmh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lumh;


# direct methods
.method public synthetic constructor <init>(Lumh;B)V
    .registers 3

    iput-byte p2, p0, Ltmh;->a:B

    iput-object p1, p0, Ltmh;->b:Lumh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 16

    iget-byte v0, p0, Ltmh;->a:B

    const v1, 0x7f0a06c5

    const v2, 0x7f0a0685

    const-string v3, "Missing required view with ID: "

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p0, p0, Ltmh;->b:Lumh;

    packed-switch v0, :pswitch_data_116

    new-instance v6, Lymh;

    const v0, 0x7f0d0404

    invoke-static {p1, v0, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0514

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_8b

    const v0, 0x7f0a0239

    invoke-static {v0, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v10, :cond_7a

    const v0, 0x7f0a04f1

    invoke-static {v0, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v11, v7

    check-cast v11, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v11, :cond_7a

    invoke-static {v2, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_78

    invoke-static {v1, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v13, :cond_7b

    new-instance v8, Lfbl;

    move-object v9, v4

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v8 .. v13}, Lfbl;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    const v0, 0x7f0a08ae

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_8b

    new-instance v7, Lq5g;

    check-cast p1, Landroid/widget/LinearLayout;

    const/16 v0, 0xa

    invoke-direct {v7, p1, v8, v1, v0}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v8, p0, Lumh;->f:Lgnh;

    iget-object v9, p0, Lumh;->g:Likc;

    iget-object v10, p0, Lumh;->h:Lyqa;

    iget-object v11, p0, Lumh;->j:Lro9;

    iget-object v12, p0, Lumh;->i:Ljvk;

    invoke-direct/range {v6 .. v12}, Lymh;-><init>(Lq5g;Lgnh;Likc;Lyqa;Lro9;Ljvk;)V

    move-object v5, v6

    goto :goto_9a

    :cond_78
    move v1, v2

    goto :goto_7b

    :cond_7a
    move v1, v0

    :cond_7b
    :goto_7b
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_9a

    :cond_8b
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_9a
    return-object v5

    :pswitch_9b
    new-instance v0, Lwmh;

    const v6, 0x7f0d0405

    invoke-static {p1, v6, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v4, 0x7f0a0401

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v9, :cond_eb

    const v4, 0x7f0a0322

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v10, :cond_eb

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v11, :cond_e9

    const v2, 0x7f0a0b32

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_e9

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_ec

    new-instance v7, Lpt1;

    move-object v8, p1

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v7 .. v13}, Lpt1;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;)V

    iget-object p0, p0, Lumh;->f:Lgnh;

    invoke-direct {v0, v7, p0}, Lwmh;-><init>(Lpt1;Lgnh;)V

    move-object v5, v0

    goto :goto_fb

    :cond_e9
    move v1, v2

    goto :goto_ec

    :cond_eb
    move v1, v4

    :cond_ec
    :goto_ec
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_fb
    return-object v5

    :pswitch_fc
    new-instance v6, Lcnh;

    iget-object v7, p0, Lumh;->e:Lpde;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Lpt1;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpt1;

    move-result-object v8

    iget-object v9, p0, Lumh;->f:Lgnh;

    iget-object v10, p0, Lumh;->g:Likc;

    iget-object v11, p0, Lumh;->h:Lyqa;

    invoke-direct/range {v6 .. v11}, Lcnh;-><init>(Likc;Lpt1;Lgnh;Likc;Lyqa;)V

    return-object v6

    :pswitch_data_116
    .packed-switch 0x0
        :pswitch_fc
        :pswitch_9b
    .end packed-switch
.end method
