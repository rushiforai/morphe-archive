.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->c:I

    .line 9
    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 2
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
    rem-int/lit8 p3, p2, 0x4

    .line 6
    .line 7
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->a:I

    .line 8
    .line 9
    mul-int v0, p3, p4

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    div-int/2addr v0, v1

    .line 13
    sub-int/2addr p4, v0

    .line 14
    iput p4, p1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    add-int/lit8 p3, p3, 0x1

    .line 17
    .line 18
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->b:I

    .line 19
    .line 20
    mul-int/2addr p3, p4

    .line 21
    div-int/2addr p3, v1

    .line 22
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 23
    .line 24
    if-ge p2, v1, :cond_0

    .line 25
    .line 26
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->c:I

    .line 27
    .line 28
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/high16 p2, 0x40400000    # 3.0f

    .line 32
    .line 33
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    neg-int p2, p2

    .line 38
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    :goto_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;->d:I

    .line 41
    .line 42
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    return-void
.end method
