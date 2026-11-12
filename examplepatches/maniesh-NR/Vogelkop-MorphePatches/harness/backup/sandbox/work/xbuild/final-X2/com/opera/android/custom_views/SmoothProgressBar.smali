.class public Lcom/opera/android/custom_views/SmoothProgressBar;
.super Landroid/widget/ProgressBar;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public final d:Lssi;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->c:I

    new-instance p1, Lssi;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->d:Lssi;

    const/16 p1, 0x64

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void
.end method

.method public onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ProgressBar;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p2

    iget p3, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->c:I

    div-int/2addr p2, p3

    iget p4, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->b:I

    div-int/2addr p4, p3

    add-int/lit8 p1, p1, 0x63

    div-int/lit8 p1, p1, 0x64

    const/4 p3, 0x1

    invoke-static {p3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->c:I

    mul-int/lit8 p1, p1, 0x64

    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    iget p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->c:I

    mul-int/2addr p2, p1

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/SmoothProgressBar;->a(I)V

    invoke-virtual {p0, p4}, Lcom/opera/android/custom_views/SmoothProgressBar;->setProgress(I)V

    return-void
.end method

.method public declared-synchronized setProgress(I)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->c:I

    mul-int/2addr p1, v0

    iget v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->b:I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_22

    if-ne v0, p1, :cond_a

    monitor-exit p0

    return-void

    :cond_a
    :try_start_a
    iput p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->b:I

    iget-object p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->d:Lssi;

    invoke-virtual {p0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-boolean p1, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    iget-object v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->d:Lssi;

    if-eqz p1, :cond_1b

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_1e

    :cond_1b
    invoke-virtual {v0}, Lssi;->run()V
    :try_end_1e
    .catchall {:try_start_a .. :try_end_1e} :catchall_22

    :goto_1e
    monitor-exit p0

    return-void

    :goto_20
    :try_start_20
    monitor-exit p0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_22

    throw p1

    :catchall_22
    move-exception p1

    goto :goto_20
.end method
