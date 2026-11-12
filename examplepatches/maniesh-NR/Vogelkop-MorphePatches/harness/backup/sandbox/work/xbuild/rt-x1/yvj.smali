.class public abstract Lyvj;
.super Lqw4;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/d;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/d;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyvj;->a:Landroidx/recyclerview/widget/d;

    return-void
.end method


# virtual methods
.method public final I(IILjava/lang/Object;)V
    .registers 4

    iget-object p0, p0, Lyvj;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(IILjava/lang/Object;)V

    return-void
.end method

.method public final S(II)V
    .registers 3

    iget-object p0, p0, Lyvj;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    return-void
.end method

.method public final f(II)V
    .registers 3

    iget-object p0, p0, Lyvj;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    return-void
.end method

.method public final t(II)V
    .registers 3

    iget-object p0, p0, Lyvj;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    return-void
.end method
