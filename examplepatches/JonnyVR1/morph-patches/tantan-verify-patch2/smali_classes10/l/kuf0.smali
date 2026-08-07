.class public Ll/kuf0;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/kuf0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/kuf0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

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
    iget p0, p0, Ll/kuf0;->b:I

    .line 12
    .line 13
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    add-int/lit8 p3, p3, -0x1

    .line 25
    .line 26
    if-ne p2, p3, :cond_1

    .line 27
    .line 28
    iget p2, p0, Ll/kuf0;->b:I

    .line 29
    .line 30
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget p0, p0, Ll/kuf0;->a:I

    .line 33
    .line 34
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget p0, p0, Ll/kuf0;->a:I

    .line 38
    .line 39
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    return-void
.end method
