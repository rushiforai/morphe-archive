.class public final synthetic Lrjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lujn;


# direct methods
.method public synthetic constructor <init>(Lujn;B)V
    .registers 3

    iput-byte p2, p0, Lrjn;->a:B

    iput-object p1, p0, Lrjn;->b:Lujn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 13

    iget-byte v0, p0, Lrjn;->a:B

    const-string v1, "Missing required view with ID: "

    const v2, 0x7f0a0322

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object p0, p0, Lrjn;->b:Lujn;

    packed-switch v0, :pswitch_data_160

    new-instance v0, Lr6n;

    const v5, 0x7f0d0475

    invoke-static {p1, v5, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_49

    const v2, 0x7f0a08f0

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_49

    const v2, 0x7f0a069d

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_49

    new-instance v5, Lvs;

    move-object v6, p1

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v10, 0x1a

    invoke-direct/range {v5 .. v10}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, v5, p0}, Lr6n;-><init>(Lvs;Ltjn;)V

    move-object v3, v0

    goto :goto_58

    :cond_49
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_58
    return-object v3

    :pswitch_59
    new-instance v0, Ll6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    invoke-virtual {v1}, Ln1;->k0()I

    move-result v1

    iget-object p0, p0, Lujn;->g:Ltjn;

    new-instance v2, Ly46;

    new-instance v5, Lk6n;

    invoke-direct {v5, p0, v4}, Lk6n;-><init>(Ltjn;B)V

    invoke-direct {v2, p1, v3, v5}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-direct {v0, v2, v1, p0}, Lo6n;-><init>(Ly46;ILtjn;)V

    iget-object p0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    iget-object p1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p0, p1}, Lbt1;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lbt1;

    iget-object p0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p1, Lsvk;

    const/16 v1, 0xd

    invoke-direct {p1, v0, v1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-object v0

    :pswitch_92
    new-instance v0, Lm6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    iget-object v1, v1, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const v2, 0x7f04035b

    const v3, 0x7f07013a

    invoke-static {v2, v1, v3}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v1

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, p1, v1, p0}, Lm6n;-><init>(Landroid/content/Context;ILtjn;)V

    return-object v0

    :pswitch_ae
    new-instance v0, Ly6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    invoke-virtual {v1}, Ln1;->k0()I

    move-result v1

    iget-object v2, p0, Lujn;->f:Lagm;

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, p1, v1, v2, p0}, Ly6n;-><init>(Landroid/content/Context;ILagm;Ltjn;)V

    return-object v0

    :pswitch_c2
    new-instance v3, Lu6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object p1, p0, Lujn;->e:Ln1;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v5, p1, Lvjn;

    invoke-virtual {p1}, Ln1;->k0()I

    move-result v6

    iget-object v7, p0, Lujn;->f:Lagm;

    iget-object v8, p0, Lujn;->g:Ltjn;

    invoke-direct/range {v3 .. v8}, Lu6n;-><init>(Landroid/content/Context;ZILagm;Ltjn;)V

    return-object v3

    :pswitch_db
    new-instance v0, Lv6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    invoke-virtual {v1}, Ln1;->k0()I

    move-result v1

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, p1, v1, p0}, Lv6n;-><init>(Landroid/content/Context;ILtjn;)V

    return-object v0

    :pswitch_ed
    new-instance v0, Ly6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    invoke-virtual {v1}, Ln1;->k0()I

    move-result v1

    iget-object v2, p0, Lujn;->f:Lagm;

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, p1, v1, v2, p0}, Ly6n;-><init>(Landroid/content/Context;ILagm;Ltjn;)V

    return-object v0

    :pswitch_101
    new-instance v0, Lx6n;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lujn;->e:Ln1;

    invoke-virtual {v1}, Ln1;->k0()I

    move-result v1

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, p1, v1, p0}, Lx6n;-><init>(Landroid/content/Context;ILtjn;)V

    return-object v0

    :pswitch_113
    new-instance v0, Lw6n;

    const v5, 0x7f0d0481

    invoke-static {p1, v5, p1, v4}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_150

    const v2, 0x7f0a06c5

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_150

    const v2, 0x7f0a0cc5

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_150

    new-instance v1, Lnck;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {v1, p1, v4, v5}, Lnck;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;)V

    iget-object p1, p0, Lujn;->e:Ln1;

    invoke-virtual {p1}, Ln1;->k0()I

    move-result p1

    iget-object v2, p0, Lujn;->f:Lagm;

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, v1, p1, v2, p0}, Lw6n;-><init>(Lnck;ILagm;Ltjn;)V

    move-object v3, v0

    goto :goto_15f

    :cond_150
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_15f
    return-object v3

    :pswitch_data_160
    .packed-switch 0x0
        :pswitch_113
        :pswitch_101
        :pswitch_ed
        :pswitch_db
        :pswitch_c2
        :pswitch_ae
        :pswitch_92
        :pswitch_59
    .end packed-switch
.end method
