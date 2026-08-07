.class public Ll/df3;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:I


# direct methods
.method public constructor <init>(IIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42b00000    # 88.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 7
    .line 8
    .line 9
    iput p1, p0, Ll/df3;->a:I

    .line 10
    .line 11
    iput p2, p0, Ll/df3;->c:I

    .line 12
    .line 13
    iput-boolean p3, p0, Ll/df3;->b:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 2

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Ll/df3;->c:I

    .line 14
    .line 15
    sub-int/2addr v0, v1

    .line 16
    iget v1, p0, Ll/df3;->a:I

    .line 17
    .line 18
    div-int/2addr v0, v1

    .line 19
    iget-boolean p0, p0, Ll/df3;->b:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    :cond_0
    if-nez p2, :cond_1

    .line 27
    .line 28
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    add-int/lit8 p4, p4, -0x1

    .line 32
    .line 33
    if-ne p2, p4, :cond_2

    .line 34
    .line 35
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 36
    .line 37
    :cond_2
    return-void
.end method
