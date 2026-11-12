.class public abstract Lh6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lusi;


# instance fields
.field public final a:B

.field public b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lh6e;->b:Ljava/lang/Object;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lh6e;->c:Ljava/lang/Object;

    iput-byte p1, p0, Lh6e;->a:B

    return-void
.end method

.method public constructor <init>(Lpqk;I)V
    .registers 3

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lh6e;->c:Ljava/lang/Object;

    .line 22
    iput-byte p2, p0, Lh6e;->a:B

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 7

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lh6e;->b(Landroid/view/View;)I

    move-result v3

    iget-byte v4, p0, Lh6e;->a:B

    if-gt v3, v4, :cond_1c

    add-int/lit8 v2, v2, 0x1

    if-le v2, v0, :cond_8

    invoke-virtual {p0}, Lh6e;->f()V

    return-void

    :cond_1c
    :goto_1c
    if-le v0, v2, :cond_2b

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lh6e;->b(Landroid/view/View;)I

    move-result v1

    if-gt v1, v4, :cond_2b

    add-int/lit8 v0, v0, -0x1

    goto :goto_1c

    :cond_2b
    invoke-virtual {p0, p1, v2, v0}, Lh6e;->e(Landroidx/recyclerview/widget/RecyclerView;II)V

    return-void
.end method

.method public final b(Landroid/view/View;)I
    .registers 3

    iget-object p0, p0, Lh6e;->c:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    if-eqz p1, :cond_c

    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 p0, 0x0

    return p0

    :cond_e
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    mul-int/2addr p0, v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    mul-int/2addr p1, v0

    mul-int/lit8 p0, p0, 0x64

    div-int/2addr p0, p1

    return p0
.end method

.method public final c(Lvpb;IZ)Ldri;
    .registers 6

    iget-object v0, p0, Lh6e;->c:Ljava/lang/Object;

    check-cast v0, Lpqk;

    iget-byte v1, p0, Lh6e;->a:B

    invoke-interface {v0, v1}, Lpqk;->i(I)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p0, p1, p2, p3}, Lh6e;->g(Lvpb;IZ)Ldri;

    move-result-object v0

    if-eqz v0, :cond_13

    return-object v0

    :cond_13
    iget-object p0, p0, Lh6e;->b:Ljava/lang/Object;

    check-cast p0, Lh6e;

    if-eqz p0, :cond_1e

    invoke-virtual {p0, p1, p2, p3}, Lh6e;->c(Lvpb;IZ)Ldri;

    move-result-object p0

    return-object p0

    :cond_1e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0, p1}, Lh6e;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    :cond_10
    new-instance v0, Laqh;

    invoke-direct {v0, p0, p1}, Laqh;-><init>(Lh6e;Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 v1, 0x0

    invoke-static {p1, p0, v1, v0}, Lp37;->A(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnDrawListener;)V

    return-void
.end method

.method public abstract e(Landroidx/recyclerview/widget/RecyclerView;II)V
.end method

.method public f()V
    .registers 1

    return-void
.end method

.method public abstract g(Lvpb;IZ)Ldri;
.end method
