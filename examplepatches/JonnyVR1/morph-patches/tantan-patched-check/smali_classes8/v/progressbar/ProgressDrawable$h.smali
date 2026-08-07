.class public Lv/progressbar/ProgressDrawable$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/progressbar/ProgressDrawable;->x(Lv/progressbar/ProgressDrawable$j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/progressbar/ProgressDrawable;


# direct methods
.method public constructor <init>(Lv/progressbar/ProgressDrawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$h;->a:Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$h;->a:Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->d(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$h;->a:Lv/progressbar/ProgressDrawable;

    .line 11
    .line 12
    invoke-static {p0}, Lv/progressbar/ProgressDrawable;->h(Lv/progressbar/ProgressDrawable;)Lv/progressbar/ProgressDrawable$j;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
