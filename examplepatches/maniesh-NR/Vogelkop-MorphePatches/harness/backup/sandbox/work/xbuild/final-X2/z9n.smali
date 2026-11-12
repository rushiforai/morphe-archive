.class public final Lz9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:F

.field public c:F

.field public final synthetic d:Laan;


# direct methods
.method public constructor <init>(Laan;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz9n;->d:Laan;

    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lz9n;->b:F

    iput p1, p0, Lz9n;->c:F

    iput-object p2, p0, Lz9n;->a:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .registers 4

    iget-object v0, p0, Lz9n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getY()F

    move-result v0

    iget v2, p0, Lz9n;->b:F

    cmpl-float v2, v1, v2

    if-nez v2, :cond_17

    iget v2, p0, Lz9n;->c:F

    cmpl-float v2, v0, v2

    if-nez v2, :cond_17

    return-void

    :cond_17
    iput v1, p0, Lz9n;->b:F

    iput v0, p0, Lz9n;->c:F

    iget-object p0, p0, Lz9n;->d:Laan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void
.end method
