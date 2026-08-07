.class public Ll/jmj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jmj$a;
    }
.end annotation


# instance fields
.field public a:Ll/jmj$a;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public c:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public d:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public e:J
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public f:F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public g:F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Ll/jmj;->b:F

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jmj;->a()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c(Landroid/content/Context;)Ll/jmj;
    .locals 1

    .line 1
    new-instance v0, Ll/jmj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jmj;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/jmj;->a:Ll/jmj$a;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jmj;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jmj;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eq v0, v1, :cond_3

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-eq v0, v3, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    iput-boolean v2, p0, Ll/jmj;->c:Z

    .line 20
    .line 21
    iput-boolean v2, p0, Ll/jmj;->d:Z

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v3, p0, Ll/jmj;->f:F

    .line 30
    .line 31
    sub-float/2addr v0, v3

    .line 32
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v3, p0, Ll/jmj;->b:F

    .line 37
    .line 38
    cmpl-float v0, v0, v3

    .line 39
    .line 40
    if-gtz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget v0, p0, Ll/jmj;->g:F

    .line 47
    .line 48
    sub-float/2addr p1, v0

    .line 49
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget v0, p0, Ll/jmj;->b:F

    .line 54
    .line 55
    cmpl-float p1, p1, v0

    .line 56
    .line 57
    if-lez p1, :cond_8

    .line 58
    .line 59
    :cond_2
    iput-boolean v2, p0, Ll/jmj;->d:Z

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    iput-boolean v2, p0, Ll/jmj;->c:Z

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v3, p0, Ll/jmj;->f:F

    .line 69
    .line 70
    sub-float/2addr v0, v3

    .line 71
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget v3, p0, Ll/jmj;->b:F

    .line 76
    .line 77
    cmpl-float v0, v0, v3

    .line 78
    .line 79
    if-gtz v0, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iget v3, p0, Ll/jmj;->g:F

    .line 86
    .line 87
    sub-float/2addr v0, v3

    .line 88
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget v3, p0, Ll/jmj;->b:F

    .line 93
    .line 94
    cmpl-float v0, v0, v3

    .line 95
    .line 96
    if-lez v0, :cond_5

    .line 97
    .line 98
    :cond_4
    iput-boolean v2, p0, Ll/jmj;->d:Z

    .line 99
    .line 100
    :cond_5
    iget-boolean v0, p0, Ll/jmj;->d:Z

    .line 101
    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 105
    .line 106
    .line 107
    move-result-wide v3

    .line 108
    iget-wide v5, p0, Ll/jmj;->e:J

    .line 109
    .line 110
    sub-long/2addr v3, v5

    .line 111
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    int-to-long v5, p1

    .line 116
    cmp-long p1, v3, v5

    .line 117
    .line 118
    if-gtz p1, :cond_6

    .line 119
    .line 120
    iget-object p1, p0, Ll/jmj;->a:Ll/jmj$a;

    .line 121
    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    invoke-interface {p1}, Ll/jmj$a;->a()Z

    .line 125
    .line 126
    .line 127
    :cond_6
    iput-boolean v2, p0, Ll/jmj;->d:Z

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_7
    iput-boolean v1, p0, Ll/jmj;->c:Z

    .line 131
    .line 132
    iput-boolean v1, p0, Ll/jmj;->d:Z

    .line 133
    .line 134
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 135
    .line 136
    .line 137
    move-result-wide v2

    .line 138
    iput-wide v2, p0, Ll/jmj;->e:J

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, p0, Ll/jmj;->f:F

    .line 145
    .line 146
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iput p1, p0, Ll/jmj;->g:F

    .line 151
    .line 152
    :cond_8
    :goto_0
    return v1
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/jmj;->c:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/jmj;->d:Z

    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/jmj$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jmj;->a:Ll/jmj$a;

    .line 2
    .line 3
    return-void
.end method
