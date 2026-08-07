.class public Ll/m6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/n6g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/n6g;

.field public final b:Lv/VImage;

.field public final c:Lv/VImage;

.field public final d:Lv/VImage;

.field public final e:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lv/VImage;Lv/VImage;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m6g;->b:Lv/VImage;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m6g;->c:Lv/VImage;

    .line 7
    .line 8
    iput-object p3, p0, Ll/m6g;->d:Lv/VImage;

    .line 9
    .line 10
    const/4 p1, 0x2

    .line 11
    new-array p1, p1, [F

    .line 12
    .line 13
    fill-array-data p1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    return-void

    .line 23
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Ll/m6g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m6g;->d()V

    return-void
.end method

.method public static synthetic b(Ll/m6g;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m6g;->e(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m6g;->b:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/n6g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m6g;->a:Ll/n6g;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m6g;->b:Lv/VImage;

    .line 2
    .line 3
    sget v0, Ll/qa00;->j:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/m6g;->b:Lv/VImage;

    .line 12
    .line 13
    sget v1, Ll/qa00;->j:I

    .line 14
    .line 15
    int-to-float v2, v1

    .line 16
    const/high16 v3, 0x3f800000    # 1.0f

    .line 17
    .line 18
    sub-float/2addr v3, p1

    .line 19
    mul-float/2addr v2, v3

    .line 20
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/m6g;->c:Lv/VImage;

    .line 24
    .line 25
    int-to-float v2, v1

    .line 26
    mul-float/2addr v2, p1

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/m6g;->d:Lv/VImage;

    .line 31
    .line 32
    int-to-float v0, v1

    .line 33
    mul-float/2addr v0, p1

    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const-wide/16 v1, 0x7d0

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    new-instance v1, Ll/k6g;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/k6g;-><init>(Ll/m6g;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v1, Ll/l6g;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/l6g;-><init>(Ll/m6g;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 31
    .line 32
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    const/4 v1, -0x1

    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m6g;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/n6g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m6g;->c(Ll/n6g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
