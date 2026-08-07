.class public Ll/pdk;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/pdk;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/pdk;->b:I

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
    const/4 p3, 0x0

    .line 10
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 13
    .line 14
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget p3, p0, Ll/pdk;->b:I

    .line 19
    .line 20
    div-int p4, p2, p3

    .line 21
    .line 22
    rem-int/2addr p2, p3

    .line 23
    if-lez p2, :cond_0

    .line 24
    .line 25
    iget p2, p0, Ll/pdk;->a:I

    .line 26
    .line 27
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    :cond_0
    if-lez p4, :cond_1

    .line 30
    .line 31
    iget p0, p0, Ll/pdk;->a:I

    .line 32
    .line 33
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    :cond_1
    return-void
.end method
