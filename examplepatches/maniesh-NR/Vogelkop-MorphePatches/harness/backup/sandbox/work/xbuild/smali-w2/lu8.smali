.class public abstract Llu8;
.super Lbu8;
.source "SourceFile"


# instance fields
.field public final i:Landroid/widget/RelativeLayout;

.field public final j:Landroid/view/View;

.field public final k:Lize;


# direct methods
.method public constructor <init>(Landroid/view/View;Lize;)V
    .registers 5

    invoke-direct {p0, p1}, Lbu8;-><init>(Landroid/view/View;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0430

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Llu8;->i:Landroid/widget/RelativeLayout;

    iput-object p2, p0, Llu8;->k:Lize;

    iput-object p1, p0, Llu8;->j:Landroid/view/View;

    new-instance v0, Lks6;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, v0}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    new-instance p2, Lpc5;

    const/16 v0, 0x10

    invoke-direct {p2, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 6

    invoke-super {p0, p1, p2}, Lo43;->V(Lja2;Z)V

    invoke-virtual {p0}, Llu8;->i0()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    iget-object v0, p0, Llu8;->i:Landroid/widget/RelativeLayout;

    if-eq p2, v0, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/view/ViewGroup;

    if-eqz p2, :cond_22

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_22
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-lez p2, :cond_2b

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_2b
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2}, Llu8;->h0(Landroid/widget/RelativeLayout$LayoutParams;)V

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_38
    return-void
.end method

.method public h0(Landroid/widget/RelativeLayout$LayoutParams;)V
    .registers 2

    const/16 p0, 0xa

    invoke-virtual {p1, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    return-void
.end method

.method public i0()Landroid/view/View;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->d:Lyz;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0
.end method

.method public final j0()V
    .registers 4

    iget-object v0, p0, Llu8;->k:Lize;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f3

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    goto :goto_20

    :cond_1f
    const/4 v0, 0x0

    :goto_20
    iget-object p0, p0, Llu8;->j:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
