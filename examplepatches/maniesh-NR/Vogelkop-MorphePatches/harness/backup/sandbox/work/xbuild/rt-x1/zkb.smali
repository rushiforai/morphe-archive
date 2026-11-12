.class public final Lzkb;
.super Lelb;
.source "SourceFile"


# instance fields
.field public final synthetic u:I

.field public final synthetic v:Landroidx/recyclerview/widget/i;

.field public final synthetic w:Lflb;


# direct methods
.method public constructor <init>(Lflb;Landroidx/recyclerview/widget/i;IIFFFFILandroidx/recyclerview/widget/i;)V
    .registers 11

    iput p9, p0, Lzkb;->u:I

    iput-object p10, p0, Lzkb;->v:Landroidx/recyclerview/widget/i;

    iput-object p1, p0, Lzkb;->w:Lflb;

    move-object p1, p2

    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move p6, p7

    move p7, p8

    invoke-direct/range {p0 .. p7}, Lelb;-><init>(Landroidx/recyclerview/widget/i;IIFFFF)V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 6

    invoke-super {p0, p1}, Lelb;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-boolean p1, p0, Lelb;->q:Z

    if-nez p1, :cond_38

    iget p1, p0, Lzkb;->u:I

    iget-object v0, p0, Lzkb;->v:Landroidx/recyclerview/widget/i;

    iget-object v1, p0, Lzkb;->w:Lflb;

    if-gtz p1, :cond_17

    iget-object p0, v1, Lflb;->q:Lblb;

    iget-object p1, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1, v0}, Lblb;->d(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    goto :goto_2d

    :cond_17
    iget-object v2, v1, Lflb;->a:Ljava/util/ArrayList;

    iget-object v3, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lelb;->i:Z

    if-lez p1, :cond_2d

    iget-object v2, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lsq1;

    invoke-direct {v3, v1, p0, p1}, Lsq1;-><init>(Lflb;Lzkb;I)V

    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_2d
    :goto_2d
    iget-object p0, v1, Lflb;->A:Landroid/view/View;

    iget-object p1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-ne p0, p1, :cond_38

    if-ne p1, p0, :cond_38

    const/4 p0, 0x0

    iput-object p0, v1, Lflb;->A:Landroid/view/View;

    :cond_38
    return-void
.end method
