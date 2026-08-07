.class public Ll/w0r$f;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public final synthetic c:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/w0r$f;->c:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/high16 v0, 0x41c00000    # 24.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr p1, v0

    .line 17
    div-int/lit8 p1, p1, 0x7

    .line 18
    .line 19
    const/high16 v0, 0x42200000    # 40.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sub-int/2addr p1, v0

    .line 26
    div-int/lit8 p1, p1, 0x6

    .line 27
    .line 28
    iput p1, p0, Ll/w0r$f;->a:I

    .line 29
    .line 30
    iput p2, p0, Ll/w0r$f;->b:I

    .line 31
    .line 32
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
    iget p3, p0, Ll/w0r$f;->b:I

    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    rem-int/lit8 p2, p2, 0x7

    .line 13
    .line 14
    iget p0, p0, Ll/w0r$f;->a:I

    .line 15
    .line 16
    mul-int/2addr p2, p0

    .line 17
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    if-eqz p2, :cond_3

    .line 21
    .line 22
    if-ne p2, p3, :cond_1

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_1
    if-ge p2, p3, :cond_2

    .line 26
    .line 27
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    sub-int/2addr p2, p3

    .line 31
    goto :goto_0

    .line 32
    :goto_1
    rem-int/lit8 p2, p2, 0x7

    .line 33
    .line 34
    iget p0, p0, Ll/w0r$f;->a:I

    .line 35
    .line 36
    mul-int/2addr p2, p0

    .line 37
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_2
    const/4 p0, 0x0

    .line 41
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    return-void
.end method
