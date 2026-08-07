.class public Lv/bottombar/VBottomBarRippleView$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/bottombar/VBottomBarRippleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static final d:Landroid/view/animation/Interpolator;


# instance fields
.field public a:J

.field public b:I

.field public c:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lv/bottombar/VBottomBarRippleView$c;->d:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x2

    .line 5
    .line 6
    iput-wide v0, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 7
    .line 8
    const/16 v0, 0x3e8

    .line 9
    .line 10
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$c;->b:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 14
    .line 15
    return-void
.end method

.method public synthetic constructor <init>(Ll/kok0;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lv/bottombar/VBottomBarRippleView$c;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBarRippleView$c;->e(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBarRippleView$c;->f(Landroid/view/View;)F

    move-result p0

    return p0
.end method

.method public static bridge synthetic c(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBarRippleView$c;->g(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBarRippleView$c;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x2

    .line 2
    .line 3
    iput-wide v0, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f(Landroid/view/View;)F
    .locals 6

    .line 1
    iget-wide v0, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 2
    .line 3
    const-wide/16 v2, -0x2

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const-wide/16 v2, -0x1

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    iput-wide v2, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 24
    .line 25
    iput v1, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    iget-wide v4, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 36
    .line 37
    sub-long/2addr v2, v4

    .line 38
    long-to-float v0, v2

    .line 39
    const/high16 v2, 0x3f800000    # 1.0f

    .line 40
    .line 41
    mul-float/2addr v0, v2

    .line 42
    iget v3, p0, Lv/bottombar/VBottomBarRippleView$c;->b:I

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    div-float/2addr v0, v3

    .line 46
    cmpl-float v3, v0, v2

    .line 47
    .line 48
    if-lez v3, :cond_3

    .line 49
    .line 50
    iget v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 51
    .line 52
    cmpl-float v0, v0, v2

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 57
    .line 58
    .line 59
    :cond_2
    iput v2, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    cmpg-float v2, v0, v1

    .line 63
    .line 64
    if-gez v2, :cond_5

    .line 65
    .line 66
    iget v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 67
    .line 68
    cmpl-float v0, v0, v1

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 73
    .line 74
    .line 75
    :cond_4
    iput v1, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    sget-object v1, Lv/bottombar/VBottomBarRippleView$c;->d:Landroid/view/animation/Interpolator;

    .line 79
    .line 80
    invoke-interface {v1, v0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 87
    .line 88
    .line 89
    :goto_0
    iget p0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 90
    .line 91
    return p0
.end method

.method public final g(Landroid/view/View;)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x2

    .line 2
    .line 3
    iput-wide v0, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$c;->c:F

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final h(Landroid/view/View;)V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Lv/bottombar/VBottomBarRippleView$c;->a:J

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
