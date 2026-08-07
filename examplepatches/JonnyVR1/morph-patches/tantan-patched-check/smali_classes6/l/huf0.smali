.class public Ll/huf0;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/huf0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/huf0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/huf0;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/huf0;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget p2, p0, Ll/huf0;->b:I

    .line 12
    .line 13
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    iget p0, p0, Ll/huf0;->a:I

    .line 16
    .line 17
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    add-int/lit8 p3, p3, -0x1

    .line 31
    .line 32
    if-ne p2, p3, :cond_1

    .line 33
    .line 34
    iget p2, p0, Ll/huf0;->c:I

    .line 35
    .line 36
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    iget p2, p0, Ll/huf0;->a:I

    .line 39
    .line 40
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 41
    .line 42
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    iget p0, p0, Ll/huf0;->d:I

    .line 45
    .line 46
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget p2, p0, Ll/huf0;->a:I

    .line 50
    .line 51
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iget p0, p0, Ll/huf0;->c:I

    .line 56
    .line 57
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 58
    .line 59
    return-void
.end method
