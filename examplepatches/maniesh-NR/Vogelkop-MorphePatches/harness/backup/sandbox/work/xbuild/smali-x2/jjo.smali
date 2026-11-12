.class public final Ljjo;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lfro;


# instance fields
.field public a:Lejo;

.field public b:I


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 8

    const/4 v0, 0x2

    iput v0, p0, Ljjo;->b:I

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

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const v1, 0x7f0a00a1

    const/4 v3, 0x3

    invoke-virtual {v0, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v1, 0x7f0d0038

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lgro;

    invoke-direct {p1, p0}, Lijo;-><init>(Landroid/widget/RelativeLayout;)V

    iput-object p1, p0, Ljjo;->a:Lejo;

    return-object p0
.end method

.method public final a()V
    .registers 1

    .line 64
    iget-object p0, p0, Ljjo;->a:Lejo;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lejo;->g()V

    return-void
.end method

.method public final e(Lcie;)V
    .registers 6

    iget-object v0, p0, Ljjo;->a:Lejo;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget v1, p0, Ljjo;->b:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_27

    instance-of v0, v0, Lcoo;

    if-eqz v0, :cond_27

    iget v0, p1, Lcie;->V:I

    const/4 v1, 0x0

    if-gtz v0, :cond_26

    iget-object v0, p0, Ljjo;->a:Lejo;

    check-cast v0, Lcoo;

    iget v2, p1, Lcie;->W:F

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_22

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_27

    :cond_22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    throw v1

    :cond_26
    throw v1

    :cond_27
    :goto_27
    iget-object p0, p0, Ljjo;->a:Lejo;

    invoke-virtual {p0, p1}, Lejo;->c(Lcie;)V

    return-void
.end method
