.class public Lv/progressbar/ProgressDrawable$e;
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
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

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
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$e;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lv/progressbar/ProgressDrawable$e;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 6
    .line 7
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->p(Lv/progressbar/ProgressDrawable;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 11
    .line 12
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->c(Lv/progressbar/ProgressDrawable;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 19
    .line 20
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->a(Lv/progressbar/ProgressDrawable;)[I

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    array-length v1, v1

    .line 25
    rem-int/2addr v0, v1

    .line 26
    invoke-static {p1, v0}, Lv/progressbar/ProgressDrawable;->m(Lv/progressbar/ProgressDrawable;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 30
    .line 31
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->a(Lv/progressbar/ProgressDrawable;)[I

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 36
    .line 37
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->c(Lv/progressbar/ProgressDrawable;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    aget v0, v0, v1

    .line 42
    .line 43
    invoke-static {p1, v0}, Lv/progressbar/ProgressDrawable;->l(Lv/progressbar/ProgressDrawable;I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 47
    .line 48
    invoke-static {p1}, Lv/progressbar/ProgressDrawable;->i(Lv/progressbar/ProgressDrawable;)Landroid/graphics/Paint;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object v0, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 53
    .line 54
    invoke-static {v0}, Lv/progressbar/ProgressDrawable;->b(Lv/progressbar/ProgressDrawable;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$e;->b:Lv/progressbar/ProgressDrawable;

    .line 62
    .line 63
    invoke-static {p0}, Lv/progressbar/ProgressDrawable;->j(Lv/progressbar/ProgressDrawable;)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 68
    .line 69
    .line 70
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
    iput-boolean p1, p0, Lv/progressbar/ProgressDrawable$e;->a:Z

    .line 3
    .line 4
    return-void
.end method
