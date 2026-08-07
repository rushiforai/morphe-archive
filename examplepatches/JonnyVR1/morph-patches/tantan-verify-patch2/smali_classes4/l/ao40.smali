.class public Ll/ao40;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ao40;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/ao40;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/ao40;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 2
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
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget p3, p0, Ll/ao40;->a:I

    .line 6
    .line 7
    rem-int p3, p2, p3

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const/high16 v0, 0x42a00000    # 80.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int/2addr p4, v0

    .line 20
    iget v0, p0, Ll/ao40;->c:I

    .line 21
    .line 22
    iget v1, p0, Ll/ao40;->a:I

    .line 23
    .line 24
    mul-int/2addr v0, v1

    .line 25
    sub-int/2addr p4, v0

    .line 26
    add-int/lit8 v0, v1, -0x1

    .line 27
    .line 28
    div-int/2addr p4, v0

    .line 29
    mul-int v0, p3, p4

    .line 30
    .line 31
    div-int/2addr v0, v1

    .line 32
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    add-int/lit8 p3, p3, 0x1

    .line 35
    .line 36
    mul-int/2addr p3, p4

    .line 37
    div-int/2addr p3, v1

    .line 38
    sub-int/2addr p4, p3

    .line 39
    iput p4, p1, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    if-lt p2, v1, :cond_0

    .line 42
    .line 43
    iget p0, p0, Ll/ao40;->b:I

    .line 44
    .line 45
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    :cond_0
    return-void
.end method
