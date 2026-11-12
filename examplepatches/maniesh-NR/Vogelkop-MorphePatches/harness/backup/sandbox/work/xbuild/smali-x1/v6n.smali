.class public final Lv6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILtjn;)V
    .registers 7

    new-instance v0, Lft9;

    new-instance v1, Lk6n;

    const/4 v2, 0x4

    invoke-direct {v1, p3, v2}, Lk6n;-><init>(Ltjn;B)V

    invoke-direct {v0, p1, v1, v1}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput p2, p0, Lv6n;->b:I

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    const v0, 0x7f0d047f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p1, :cond_45

    check-cast p1, Landroid/widget/TextView;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Ln6n;

    const/4 v0, 0x3

    invoke-direct {p2, p3, v0}, Ln6n;-><init>(Ltjn;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lsvk;

    const/16 p3, 0x10

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void

    :cond_45
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method
