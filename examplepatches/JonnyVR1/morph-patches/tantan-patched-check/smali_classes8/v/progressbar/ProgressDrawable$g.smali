.class public Lv/progressbar/ProgressDrawable$g;
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
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$g;->b:Lv/progressbar/ProgressDrawable;

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

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$g;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$g;->b:Lv/progressbar/ProgressDrawable;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lv/progressbar/ProgressDrawable;->r(Lv/progressbar/ProgressDrawable;F)V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Lv/progressbar/ProgressDrawable$g;->a:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$g;->b:Lv/progressbar/ProgressDrawable;

    .line 12
    .line 13
    invoke-virtual {p0}, Lv/progressbar/ProgressDrawable;->stop()V

    .line 14
    .line 15
    .line 16
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
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$g;->a:Z

    .line 3
    .line 4
    return-void
.end method
