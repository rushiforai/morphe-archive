.class public final Lkjo;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lfro;


# instance fields
.field public a:Lejo;


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 8

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0035

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d003b

    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x3

    const v2, 0x7f0a00a1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lhro;

    invoke-direct {p1, p0}, Lijo;-><init>(Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Lkjo;->a:Lejo;

    return-object p0
.end method

.method public final a()V
    .registers 1

    .line 61
    iget-object p0, p0, Lkjo;->a:Lejo;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lejo;->g()V

    return-void
.end method

.method public final e(Lcie;)V
    .registers 4

    iget-object p0, p0, Lkjo;->a:Lejo;

    if-nez p0, :cond_5

    return-void

    :cond_5
    instance-of v0, p0, Ldoo;

    if-eqz v0, :cond_12

    iget v0, p1, Lcie;->W:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_12

    const/4 p0, 0x0

    throw p0

    :cond_12
    invoke-virtual {p0, p1}, Lejo;->c(Lcie;)V

    return-void
.end method
