.class final Ltech/sud/runtime/component/f/a$a;
.super Landroid/widget/Button;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/f/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/f/a;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:Z


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/f/a;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/f/a$a;->a:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-int v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    and-int/lit16 p1, p1, 0xff

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz p1, :cond_7

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-eq p1, v2, :cond_5

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    if-eq p1, v4, :cond_0

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_0
    iget p1, p0, Ltech/sud/runtime/component/f/a$a;->d:I

    .line 29
    .line 30
    add-int/2addr p1, v0

    .line 31
    iget v4, p0, Ltech/sud/runtime/component/f/a$a;->b:I

    .line 32
    .line 33
    sub-int/2addr p1, v4

    .line 34
    iget v4, p0, Ltech/sud/runtime/component/f/a$a;->e:I

    .line 35
    .line 36
    add-int/2addr v4, v1

    .line 37
    iget v5, p0, Ltech/sud/runtime/component/f/a$a;->c:I

    .line 38
    .line 39
    sub-int/2addr v4, v5

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    iget-object v7, p0, Ltech/sud/runtime/component/f/a$a;->a:Ltech/sud/runtime/component/f/a;

    .line 49
    .line 50
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    sub-int/2addr v7, v5

    .line 55
    iget-object v5, p0, Ltech/sud/runtime/component/f/a$a;->a:Ltech/sud/runtime/component/f/a;

    .line 56
    .line 57
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    sub-int/2addr v5, v6

    .line 62
    if-gez p1, :cond_1

    .line 63
    .line 64
    move p1, v3

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    if-le p1, v7, :cond_2

    .line 67
    .line 68
    move p1, v7

    .line 69
    :cond_2
    :goto_0
    if-gez v4, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    if-le v4, v5, :cond_4

    .line 73
    .line 74
    move v3, v5

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move v3, v4

    .line 77
    :goto_1
    iget v4, p0, Ltech/sud/runtime/component/f/a$a;->b:I

    .line 78
    .line 79
    sub-int/2addr v0, v4

    .line 80
    int-to-double v4, v0

    .line 81
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 82
    .line 83
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 84
    .line 85
    .line 86
    move-result-wide v4

    .line 87
    iget v0, p0, Ltech/sud/runtime/component/f/a$a;->c:I

    .line 88
    .line 89
    sub-int/2addr v1, v0

    .line 90
    int-to-double v0, v1

    .line 91
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 92
    .line 93
    .line 94
    move-result-wide v0

    .line 95
    add-double/2addr v0, v4

    .line 96
    const-wide/high16 v4, 0x4044000000000000L    # 40.0

    .line 97
    .line 98
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 99
    .line 100
    .line 101
    move-result-wide v4

    .line 102
    cmpl-double v0, v0, v4

    .line 103
    .line 104
    if-lez v0, :cond_8

    .line 105
    .line 106
    iput-boolean v2, p0, Ltech/sud/runtime/component/f/a$a;->f:Z

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 113
    .line 114
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 115
    .line 116
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_5
    iget-boolean p1, p0, Ltech/sud/runtime/component/f/a$a;->f:Z

    .line 123
    .line 124
    if-eqz p1, :cond_6

    .line 125
    .line 126
    iput-boolean v3, p0, Ltech/sud/runtime/component/f/a$a;->f:Z

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 145
    .line 146
    iget v3, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 147
    .line 148
    iput v3, p0, Ltech/sud/runtime/component/f/a$a;->d:I

    .line 149
    .line 150
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 151
    .line 152
    iput p1, p0, Ltech/sud/runtime/component/f/a$a;->e:I

    .line 153
    .line 154
    iput v0, p0, Ltech/sud/runtime/component/f/a$a;->b:I

    .line 155
    .line 156
    iput v1, p0, Ltech/sud/runtime/component/f/a$a;->c:I

    .line 157
    .line 158
    :cond_8
    :goto_2
    return v2
.end method
