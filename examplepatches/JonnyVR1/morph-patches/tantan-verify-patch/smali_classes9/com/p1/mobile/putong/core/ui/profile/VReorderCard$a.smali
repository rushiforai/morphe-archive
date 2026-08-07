.class public Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->A(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Landroid/view/animation/OvershootInterpolator;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->b:F

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->c:F

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    .line 11
    .line 12
    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->a:Landroid/view/animation/OvershootInterpolator;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->B(F)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    float-to-int v0, v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->C(F)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    float-to-int v1, v1

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->a:Landroid/view/animation/OvershootInterpolator;

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Landroid/view/animation/OvershootInterpolator;->getInterpolation(F)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->b:F

    .line 36
    .line 37
    const/high16 v4, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float v5, v4, v2

    .line 40
    .line 41
    mul-float/2addr v3, v5

    .line 42
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->c:F

    .line 43
    .line 44
    mul-float/2addr v5, v2

    .line 45
    add-float/2addr v3, v5

    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleX(F)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 56
    .line 57
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->b(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleY(F)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    sub-float/2addr v4, p1

    .line 71
    mul-float/2addr v3, v4

    .line 72
    int-to-float v0, v0

    .line 73
    mul-float/2addr v0, p1

    .line 74
    add-float/2addr v3, v0

    .line 75
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard$a;->d:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    mul-float/2addr v0, v4

    .line 85
    int-to-float v1, v1

    .line 86
    mul-float/2addr p1, v1

    .line 87
    add-float/2addr v0, p1

    .line 88
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 89
    .line 90
    .line 91
    return-void
.end method
