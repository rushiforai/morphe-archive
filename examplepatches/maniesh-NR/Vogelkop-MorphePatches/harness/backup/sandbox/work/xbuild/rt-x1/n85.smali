.class public final Ln85;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/view/View;

.field public final c:I

.field public final d:I

.field public e:Z

.field public f:Z

.field public g:F

.field public h:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln85;->a:Landroid/view/View;

    iput-object p2, p0, Ln85;->b:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_14

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    if-nez v0, :cond_17

    :cond_14
    invoke-virtual {p2, v1, v1}, Landroid/view/View;->measure(II)V

    :cond_17
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    if-nez v0, :cond_2a

    :cond_27
    invoke-virtual {p1, v1, v1}, Landroid/view/View;->measure(II)V

    :cond_2a
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Ln85;->c:I

    add-int/2addr p2, p1

    iput p2, p0, Ln85;->d:I

    const/4 p2, 0x1

    if-lez p1, :cond_38

    move v0, p2

    goto :goto_39

    :cond_38
    move v0, v1

    :goto_39
    iput-boolean v0, p0, Ln85;->e:Z

    if-lez p1, :cond_3e

    move v1, p2

    :cond_3e
    iput-boolean v1, p0, Ln85;->f:Z

    if-lez p1, :cond_45

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_46

    :cond_45
    const/4 p1, 0x0

    :goto_46
    iput p1, p0, Ln85;->g:F

    return-void
.end method
