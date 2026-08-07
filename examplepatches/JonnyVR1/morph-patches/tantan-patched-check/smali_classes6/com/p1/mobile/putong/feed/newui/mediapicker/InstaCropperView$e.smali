.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->s(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->t(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->r(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 47
    .line 48
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    mul-float/2addr v0, p1

    .line 53
    sub-float/2addr v4, v0

    .line 54
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    mul-float/2addr v1, p1

    .line 64
    sub-float/2addr v3, v1

    .line 65
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    div-float/2addr v0, v2

    .line 75
    const/high16 v1, 0x3f800000    # 1.0f

    .line 76
    .line 77
    sub-float/2addr v1, p1

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 79
    .line 80
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    mul-float/2addr v1, v2

    .line 85
    mul-float/2addr p1, v0

    .line 86
    add-float/2addr v1, p1

    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 88
    .line 89
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-static {p1, v1, v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FFF)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$e;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 110
    .line 111
    .line 112
    return-void
.end method
