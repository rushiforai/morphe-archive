.class public final Lkba;
.super Loph;
.source "SourceFile"

# interfaces
.implements Llba;


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:I

.field public c:B


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkba;->a:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final e(I)V
    .registers 5

    new-instance v0, Lbr;

    const/16 v1, 0xd

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    iget-object p0, p0, Lkba;->a:Landroidx/recyclerview/widget/RecyclerView;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lkba;->a:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 5

    if-nez p2, :cond_1a

    iget-byte v0, p0, Lkba;->c:B

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    iget p2, p0, Lkba;->b:I

    iget-object v0, p0, Lkba;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object p2

    if-eqz p2, :cond_16

    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p2}, Lqe6;->N(Landroid/view/View;)V

    :cond_16
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    return-void

    :cond_1a
    iput-byte p2, p0, Lkba;->c:B

    return-void
.end method
