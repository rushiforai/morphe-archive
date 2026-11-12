.class public final Lm6n;
.super Lo6n;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILtjn;)V
    .registers 8

    new-instance v0, Ly46;

    new-instance v1, Lk6n;

    const/4 v2, 0x1

    invoke-direct {v1, p3, v2}, Lk6n;-><init>(Ltjn;B)V

    new-instance v2, Lk6n;

    const/4 v3, 0x2

    invoke-direct {v2, p3, v3}, Lk6n;-><init>(Ltjn;B)V

    invoke-direct {v0, p1, v1, v2}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-direct {p0, v0, p2, p3}, Lo6n;-><init>(Ly46;ILtjn;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    const p3, 0x7f0d047c

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p1, :cond_40

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    iput-object p1, p0, Lm6n;->c:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lsvk;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void

    :cond_40
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method
