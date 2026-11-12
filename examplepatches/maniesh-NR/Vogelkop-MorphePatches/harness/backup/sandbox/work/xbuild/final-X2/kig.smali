.class public final Lkig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lw73;
.implements Lx73;


# instance fields
.field public final synthetic a:Lmig;


# direct methods
.method public constructor <init>(Lmig;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkig;->a:Lmig;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lcom/google/android/material/slider/Slider;

    invoke-virtual {p1}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result p1

    float-to-long v0, p1

    const/4 p1, 0x1

    iget-object p0, p0, Lkig;->a:Lmig;

    iput-boolean p1, p0, Lmig;->h:Z

    iget-object p1, p0, Lmig;->c:Llig;

    iget-object p0, p0, Lmig;->e:Lc5o;

    invoke-virtual {p0, v0, v1}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Llig;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Ljava/lang/Object;FZ)V
    .registers 4

    check-cast p1, Lcom/google/android/material/slider/Slider;

    if-eqz p3, :cond_16

    invoke-virtual {p1}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result p1

    float-to-long p1, p1

    iget-object p0, p0, Lkig;->a:Lmig;

    iget-object p3, p0, Lmig;->c:Llig;

    iget-object p0, p0, Lmig;->e:Lc5o;

    invoke-virtual {p0, p1, p2}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p3, p0}, Llig;->h(Ljava/lang/String;)V

    :cond_16
    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lcom/google/android/material/slider/Slider;

    invoke-virtual {p1}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result p1

    float-to-long v0, p1

    const/4 p1, 0x0

    iget-object p0, p0, Lkig;->a:Lmig;

    iput-boolean p1, p0, Lmig;->h:Z

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->getCurrentWindowIndex()I

    move-result p1

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0, p1, v0, v1}, Lgig;->seekTo(IJ)V

    return-void
.end method

.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    if-eqz p3, :cond_14

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-long p1, p1

    iget-object p0, p0, Lkig;->a:Lmig;

    iget-object p3, p0, Lmig;->c:Llig;

    iget-object p0, p0, Lmig;->e:Lc5o;

    invoke-virtual {p0, p1, p2}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p3, p0}, Llig;->h(Ljava/lang/String;)V

    :cond_14
    return-void
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-long v0, p1

    const/4 p1, 0x1

    iget-object p0, p0, Lkig;->a:Lmig;

    iput-boolean p1, p0, Lmig;->h:Z

    iget-object p1, p0, Lmig;->c:Llig;

    iget-object p0, p0, Lmig;->e:Lc5o;

    invoke-virtual {p0, v0, v1}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Llig;->h(Ljava/lang/String;)V

    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-long v0, p1

    const/4 p1, 0x0

    iget-object p0, p0, Lkig;->a:Lmig;

    iput-boolean p1, p0, Lmig;->h:Z

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->getCurrentWindowIndex()I

    move-result p1

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0, p1, v0, v1}, Lgig;->seekTo(IJ)V

    return-void
.end method
