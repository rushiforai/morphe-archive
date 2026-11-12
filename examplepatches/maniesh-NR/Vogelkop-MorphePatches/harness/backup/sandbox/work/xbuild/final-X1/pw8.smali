.class public final Lpw8;
.super Lrph;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Z

.field public final synthetic c:I

.field public final synthetic d:Lnw8;


# direct methods
.method public constructor <init>(Lxw8;ILnw8;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lpw8;->c:I

    iput-object p3, p0, Lpw8;->d:Lnw8;

    return-void
.end method


# virtual methods
.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4d

    if-eq v0, v2, :cond_e

    const/4 v2, 0x3

    if-eq v0, v2, :cond_e

    return v1

    :cond_e
    iget-boolean v0, p0, Lpw8;->b:Z

    if-eqz v0, :cond_4a

    iget v0, p0, Lpw8;->a:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    sub-float/2addr v0, p2

    iget p2, p0, Lpw8;->c:I

    int-to-float p2, p2

    cmpl-float p2, v0, p2

    if-lez p2, :cond_4a

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-eqz p2, :cond_4a

    const/high16 v0, -0x80000000

    move v2, v1

    :goto_29
    if-ge v2, p2, :cond_3a

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    :cond_3a
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    sub-int/2addr p2, p1

    if-gt v0, p2, :cond_4a

    iget-object p1, p0, Lpw8;->d:Lnw8;

    invoke-virtual {p1}, Lnw8;->run()V

    :cond_4a
    iput-boolean v1, p0, Lpw8;->b:Z

    return v1

    :cond_4d
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lpw8;->a:F

    iput-boolean v2, p0, Lpw8;->b:Z

    return v1
.end method
