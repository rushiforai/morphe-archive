.class public Lv/progressbar/ProgressDrawable$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/progressbar/ProgressDrawable;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lv/progressbar/ProgressDrawable;


# direct methods
.method public constructor <init>(Lv/progressbar/ProgressDrawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$c;->b:Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$c;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$c;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lv/progressbar/ProgressDrawable$c;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$c;->b:Lv/progressbar/ProgressDrawable;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Lv/progressbar/ProgressDrawable;->n(Lv/progressbar/ProgressDrawable;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$c;->b:Lv/progressbar/ProgressDrawable;

    .line 12
    .line 13
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->q(Lv/progressbar/ProgressDrawable;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$c;->b:Lv/progressbar/ProgressDrawable;

    .line 17
    .line 18
    invoke-static {p0}, Lv/progressbar/ProgressDrawable;->k(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$c;->a:Z

    .line 3
    .line 4
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$c;->b:Lv/progressbar/ProgressDrawable;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-static {p0, p1}, Lv/progressbar/ProgressDrawable;->o(Lv/progressbar/ProgressDrawable;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
