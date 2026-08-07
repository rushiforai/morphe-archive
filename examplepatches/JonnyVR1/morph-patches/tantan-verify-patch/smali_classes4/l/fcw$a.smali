.class public Ll/fcw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fcw;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fcw;


# direct methods
.method public constructor <init>(Ll/fcw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fcw$a;->a:Ll/fcw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/fcw$a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcw$a;->c(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/fcw$a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fcw$a;->d(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Landroid/animation/ValueAnimator;)V
    .locals 1

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
    iget-object p0, p0, Ll/fcw$a;->a:Ll/fcw;

    .line 12
    .line 13
    iget-object p0, p0, Ll/fcw;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    const/high16 v0, 0x3e800000    # 0.25f

    .line 16
    .line 17
    mul-float/2addr p1, v0

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic d(Landroid/animation/ValueAnimator;)V
    .locals 1

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
    iget-object p0, p0, Ll/fcw$a;->a:Ll/fcw;

    .line 12
    .line 13
    iget-object p0, p0, Ll/fcw;->j:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    const/high16 v0, 0x43190000    # 153.0f

    .line 16
    .line 17
    mul-float/2addr p1, v0

    .line 18
    float-to-int p1, p1

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 5
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const/4 p1, 0x2

    .line 2
    new-array p2, p1, [F

    .line 3
    .line 4
    fill-array-data p2, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-wide/16 v0, 0x3e8

    .line 12
    .line 13
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance v0, Ll/dcw;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/dcw;-><init>(Ll/fcw$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 26
    .line 27
    .line 28
    new-array p2, p1, [F

    .line 29
    .line 30
    fill-array-data p2, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-wide/16 v0, 0xfa

    .line 38
    .line 39
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 44
    .line 45
    const v1, 0x3f428f5c    # 0.76f

    .line 46
    .line 47
    .line 48
    const v2, 0x3f2b851f    # 0.67f

    .line 49
    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    const/high16 v4, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-direct {v0, v1, v3, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/ecw;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/ecw;-><init>(Ll/fcw$a;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0xa7

    .line 69
    .line 70
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-array p1, p1, [Landroid/animation/Animator;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    aput-object p0, p1, v0

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    aput-object p2, p1, p0

    .line 81
    .line 82
    invoke-static {p1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    nop

    .line 91
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
