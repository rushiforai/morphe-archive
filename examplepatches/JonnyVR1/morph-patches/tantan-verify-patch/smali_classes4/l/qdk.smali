.class public Ll/qdk;
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
    iput p1, p0, Ll/qdk;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/qdk;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 1

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
    iget p3, p0, Ll/qdk;->a:I

    .line 10
    .line 11
    div-int/lit8 v0, p3, 0x2

    .line 12
    .line 13
    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    iget v0, p0, Ll/qdk;->b:I

    .line 22
    .line 23
    rem-int v0, p2, v0

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    :goto_0
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    iget v0, p0, Ll/qdk;->b:I

    .line 37
    .line 38
    rem-int/2addr p3, v0

    .line 39
    if-nez p3, :cond_1

    .line 40
    .line 41
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget p0, p0, Ll/qdk;->b:I

    .line 46
    .line 47
    sub-int/2addr v0, p0

    .line 48
    if-ge p2, v0, :cond_2

    .line 49
    .line 50
    :cond_1
    if-eqz p3, :cond_3

    .line 51
    .line 52
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    sub-int/2addr p0, p3

    .line 57
    if-lt p2, p0, :cond_3

    .line 58
    .line 59
    :cond_2
    const/4 p0, 0x0

    .line 60
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 61
    .line 62
    :cond_3
    return-void
.end method
