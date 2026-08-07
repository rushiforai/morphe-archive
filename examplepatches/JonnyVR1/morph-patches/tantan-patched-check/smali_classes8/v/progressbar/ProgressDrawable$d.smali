.class public Lv/progressbar/ProgressDrawable$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/progressbar/ProgressDrawable;->E()V
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
    iput-object p1, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

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
    invoke-static {p1}, Ll/o4b0;->e(Landroid/animation/ValueAnimator;)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 6
    .line 7
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->f(Lv/progressbar/ProgressDrawable;)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    int-to-float v2, v2

    .line 12
    iget-object v3, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 13
    .line 14
    invoke-static {v3}, Lv/progressbar/ProgressDrawable;->f(Lv/progressbar/ProgressDrawable;)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    iget-object v4, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 19
    .line 20
    invoke-static {v4}, Lv/progressbar/ProgressDrawable;->g(Lv/progressbar/ProgressDrawable;)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    sub-int/2addr v3, v4

    .line 25
    int-to-float v3, v3

    .line 26
    mul-float/2addr v0, v3

    .line 27
    sub-float/2addr v2, v0

    .line 28
    invoke-virtual {v1, v2}, Lv/progressbar/ProgressDrawable;->B(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    long-to-float p1, v2

    .line 40
    long-to-float v0, v0

    .line 41
    div-float/2addr p1, v0

    .line 42
    iget-object v0, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 43
    .line 44
    invoke-static {v0}, Lv/progressbar/ProgressDrawable;->a(Lv/progressbar/ProgressDrawable;)[I

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    array-length v0, v0

    .line 49
    const/4 v1, 0x1

    .line 50
    if-le v0, v1, :cond_0

    .line 51
    .line 52
    const v0, 0x3f333333    # 0.7f

    .line 53
    .line 54
    .line 55
    cmpl-float v2, p1, v0

    .line 56
    .line 57
    if-lez v2, :cond_0

    .line 58
    .line 59
    iget-object v2, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 60
    .line 61
    invoke-static {v2}, Lv/progressbar/ProgressDrawable;->b(Lv/progressbar/ProgressDrawable;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 66
    .line 67
    invoke-static {v3}, Lv/progressbar/ProgressDrawable;->a(Lv/progressbar/ProgressDrawable;)[I

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget-object v4, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 72
    .line 73
    invoke-static {v4}, Lv/progressbar/ProgressDrawable;->c(Lv/progressbar/ProgressDrawable;)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    add-int/2addr v4, v1

    .line 78
    iget-object v1, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 79
    .line 80
    invoke-static {v1}, Lv/progressbar/ProgressDrawable;->a(Lv/progressbar/ProgressDrawable;)[I

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    array-length v1, v1

    .line 85
    rem-int/2addr v4, v1

    .line 86
    aget v1, v3, v4

    .line 87
    .line 88
    invoke-static {}, Lv/progressbar/ProgressDrawable;->s()Landroid/animation/ArgbEvaluator;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    sub-float/2addr p1, v0

    .line 93
    const v0, 0x3e99999a    # 0.3f

    .line 94
    .line 95
    .line 96
    div-float/2addr p1, v0

    .line 97
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v3, p1, v0, v1}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Ljava/lang/Integer;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iget-object p0, p0, Lv/progressbar/ProgressDrawable$d;->a:Lv/progressbar/ProgressDrawable;

    .line 116
    .line 117
    invoke-static {p0}, Lv/progressbar/ProgressDrawable;->i(Lv/progressbar/ProgressDrawable;)Landroid/graphics/Paint;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    :cond_0
    return-void
.end method
