.class public Ll/z2p0$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z2p0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 p3, -0x1

    .line 12
    if-ne p2, p3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    const/4 p4, 0x3

    .line 20
    if-le p3, p4, :cond_3

    .line 21
    .line 22
    const/4 p3, 0x0

    .line 23
    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    const/high16 p4, 0x41900000    # 18.0f

    .line 28
    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    if-ne p2, p0, :cond_2

    .line 41
    .line 42
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 52
    .line 53
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method
