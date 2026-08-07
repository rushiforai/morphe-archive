.class public Lv/VLinear$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VLinear;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:F

.field public c:F

.field public d:F

.field public e:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lv/VLinear$a;->a:Z

    .line 6
    .line 7
    const v1, -0x35bac800    # -3231232.0f

    .line 8
    .line 9
    .line 10
    iput v1, p0, Lv/VLinear$a;->b:F

    .line 11
    .line 12
    iput v1, p0, Lv/VLinear$a;->c:F

    .line 13
    .line 14
    iput v1, p0, Lv/VLinear$a;->d:F

    .line 15
    .line 16
    iput-boolean v0, p0, Lv/VLinear$a;->e:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lv/VLinear$a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDeviceId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    :cond_0
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lv/VLinear$a;->a:Z

    .line 26
    .line 27
    :cond_1
    iget v0, p0, Lv/VLinear$a;->b:F

    .line 28
    .line 29
    const v1, -0x35bac800    # -3231232.0f

    .line 30
    .line 31
    .line 32
    cmpl-float v2, v0, v1

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    iget v2, p0, Lv/VLinear$a;->c:F

    .line 37
    .line 38
    cmpl-float v2, v2, v1

    .line 39
    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    iget v2, p0, Lv/VLinear$a;->d:F

    .line 43
    .line 44
    cmpl-float v1, v2, v1

    .line 45
    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPressure()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lv/VLinear$a;->b:F

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getXPrecision()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lv/VLinear$a;->c:F

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getYPrecision()F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Lv/VLinear$a;->d:F

    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPressure()F

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    cmpl-float v0, v0, v1

    .line 72
    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    iget v0, p0, Lv/VLinear$a;->d:F

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getYPrecision()F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    cmpl-float v0, v0, v1

    .line 82
    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    iget v0, p0, Lv/VLinear$a;->c:F

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getXPrecision()F

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    cmpl-float p1, v0, p1

    .line 92
    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    :cond_3
    iget p1, p0, Lv/VLinear$a;->b:F

    .line 96
    .line 97
    const/high16 v0, -0x40000000    # -2.0f

    .line 98
    .line 99
    cmpl-float p1, p1, v0

    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    iput v0, p0, Lv/VLinear$a;->b:F

    .line 104
    .line 105
    iput v0, p0, Lv/VLinear$a;->c:F

    .line 106
    .line 107
    iput v0, p0, Lv/VLinear$a;->d:F

    .line 108
    .line 109
    :cond_4
    return-void
.end method

.method public b()Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lv/VLinear$a;->e:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lv/VLinear$a;->a:Z

    .line 5
    .line 6
    iget v2, p0, Lv/VLinear$a;->b:F

    .line 7
    .line 8
    const/high16 v3, -0x40000000    # -2.0f

    .line 9
    .line 10
    cmpl-float v2, v2, v3

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v2, v0

    .line 17
    :goto_0
    iput-boolean v0, p0, Lv/VLinear$a;->a:Z

    .line 18
    .line 19
    const v0, -0x35bac800    # -3231232.0f

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lv/VLinear$a;->b:F

    .line 23
    .line 24
    iput v0, p0, Lv/VLinear$a;->c:F

    .line 25
    .line 26
    iput v0, p0, Lv/VLinear$a;->d:F

    .line 27
    .line 28
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/VLinear$a;->e:Z

    .line 3
    .line 4
    return-void
.end method
