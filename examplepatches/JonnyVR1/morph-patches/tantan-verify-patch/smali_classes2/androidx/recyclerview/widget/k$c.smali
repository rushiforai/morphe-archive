.class public Landroidx/recyclerview/widget/k$c;
.super Landroidx/recyclerview/widget/k$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/recyclerview/widget/k;->z(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic o:I

.field public final synthetic p:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic q:Landroidx/recyclerview/widget/k;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/k;Landroidx/recyclerview/widget/RecyclerView$e0;IIFFFFILandroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/k$c;->q:Landroidx/recyclerview/widget/k;

    .line 2
    .line 3
    iput p9, p0, Landroidx/recyclerview/widget/k$c;->o:I

    .line 4
    .line 5
    iput-object p10, p0, Landroidx/recyclerview/widget/k$c;->p:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 6
    .line 7
    move-object p1, p2

    .line 8
    move p2, p3

    .line 9
    move p3, p4

    .line 10
    move p4, p5

    .line 11
    move p5, p6

    .line 12
    move p6, p7

    .line 13
    move p7, p8

    .line 14
    invoke-direct/range {p0 .. p7}, Landroidx/recyclerview/widget/k$g;-><init>(Landroidx/recyclerview/widget/RecyclerView$e0;IIFFFF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/k$g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Landroidx/recyclerview/widget/k$g;->l:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget p1, p0, Landroidx/recyclerview/widget/k$c;->o:I

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/recyclerview/widget/k$c;->q:Landroidx/recyclerview/widget/k;

    .line 12
    .line 13
    if-gtz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, v0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 16
    .line 17
    iget-object v0, v0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object v1, p0, Landroidx/recyclerview/widget/k$c;->p:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p1, v0, Landroidx/recyclerview/widget/k;->a:Ljava/util/List;

    .line 26
    .line 27
    iget-object v0, p0, Landroidx/recyclerview/widget/k$c;->p:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 28
    .line 29
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Landroidx/recyclerview/widget/k$g;->i:Z

    .line 36
    .line 37
    iget p1, p0, Landroidx/recyclerview/widget/k$c;->o:I

    .line 38
    .line 39
    if-lez p1, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Landroidx/recyclerview/widget/k$c;->q:Landroidx/recyclerview/widget/k;

    .line 42
    .line 43
    invoke-virtual {v0, p0, p1}, Landroidx/recyclerview/widget/k;->v(Landroidx/recyclerview/widget/k$g;I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    :goto_0
    iget-object p1, p0, Landroidx/recyclerview/widget/k$c;->q:Landroidx/recyclerview/widget/k;

    .line 47
    .line 48
    iget-object v0, p1, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 49
    .line 50
    iget-object p0, p0, Landroidx/recyclerview/widget/k$c;->p:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 51
    .line 52
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 53
    .line 54
    if-ne v0, p0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/k;->x(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_1
    return-void
.end method
