.class public Ll/te60;
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
    iput p1, p0, Ll/te60;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/te60;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/te60;->c:I

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
    const/4 p3, 0x1

    .line 6
    if-nez p2, :cond_1

    .line 7
    .line 8
    iget v0, p0, Ll/te60;->a:I

    .line 9
    .line 10
    iget v1, p0, Ll/te60;->b:I

    .line 11
    .line 12
    if-ne v0, p3, :cond_0

    .line 13
    .line 14
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    :cond_1
    :goto_0
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    sub-int/2addr p4, p3

    .line 24
    if-ne p2, p4, :cond_3

    .line 25
    .line 26
    iget p2, p0, Ll/te60;->a:I

    .line 27
    .line 28
    iget p0, p0, Ll/te60;->c:I

    .line 29
    .line 30
    if-ne p2, p3, :cond_2

    .line 31
    .line 32
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 36
    .line 37
    :cond_3
    return-void
.end method
