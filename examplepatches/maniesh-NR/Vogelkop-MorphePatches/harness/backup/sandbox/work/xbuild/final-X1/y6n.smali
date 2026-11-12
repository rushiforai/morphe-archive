.class public final Ly6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:Ltjn;

.field public c:Laln;

.field public final d:Lpyl;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILagm;Ltjn;)V
    .registers 8

    new-instance v0, Lgt9;

    new-instance v1, Lk6n;

    const/4 v2, 0x6

    invoke-direct {v1, p4, v2}, Lk6n;-><init>(Ltjn;B)V

    invoke-direct {v0, p1, v1}, Lgt9;-><init>(Landroid/content/Context;Lk6n;)V

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p4, p0, Ly6n;->b:Ltjn;

    new-instance p1, Lpyl;

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-direct {p1, v0, p3, p2, p4}, Lpyl;-><init>(Landroid/view/View;Lagm;ILtjn;)V

    iput-object p1, p0, Ly6n;->d:Lpyl;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lpkm;

    const/4 p3, 0x7

    invoke-direct {p2, p0, p3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lzt;

    const/16 p3, 0x11

    invoke-direct {p2, p0, p3}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method
