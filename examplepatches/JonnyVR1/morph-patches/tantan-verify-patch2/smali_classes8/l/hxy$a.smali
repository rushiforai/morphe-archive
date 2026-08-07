.class public Ll/hxy$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hxy;->p(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/hxy;


# direct methods
.method public constructor <init>(Ll/hxy;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hxy$a;->b:Ll/hxy;

    .line 2
    .line 3
    iput p2, p0, Ll/hxy$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 6
    .line 7
    .line 8
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
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$n;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/high16 p3, 0x41800000    # 16.0f

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    iput p4, p1, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/high16 p4, 0x41400000    # 12.0f

    .line 20
    .line 21
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    iput p4, p1, Landroid/graphics/Rect;->left:I

    .line 26
    .line 27
    :goto_0
    iget p0, p0, Ll/hxy$a;->a:I

    .line 28
    .line 29
    add-int/lit8 p0, p0, -0x1

    .line 30
    .line 31
    if-ne p2, p0, :cond_1

    .line 32
    .line 33
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    return-void
.end method
