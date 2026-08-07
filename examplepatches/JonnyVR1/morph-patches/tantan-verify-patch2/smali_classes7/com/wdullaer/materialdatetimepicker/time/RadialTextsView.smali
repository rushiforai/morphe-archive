.class public Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;,
        Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;
    }
.end annotation


# instance fields
.field private A:[F

.field private B:[F

.field private C:[F

.field private D:F

.field private E:F

.field private F:F

.field G:Landroid/animation/ObjectAnimator;

.field H:Landroid/animation/ObjectAnimator;

.field private I:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;

.field private final a:Landroid/graphics/Paint;

.field private final b:Landroid/graphics/Paint;

.field private final c:Landroid/graphics/Paint;

.field private d:Z

.field private e:Z

.field private f:I

.field private g:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;

.field private h:Landroid/graphics/Typeface;

.field private i:Landroid/graphics/Typeface;

.field private j:[Ljava/lang/String;

.field private k:[Ljava/lang/String;

.field private l:Z

.field private m:Z

.field private n:F

.field private o:F

.field private p:F

.field private q:F

.field private r:F

.field private s:F

.field private t:I

.field private u:I

.field private v:F

.field private w:Z

.field private x:F

.field private y:F

.field private z:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 24
    .line 25
    const/4 p1, -0x1

    .line 26
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->f:I

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 30
    .line 31
    return-void
.end method

.method private a([Ljava/lang/String;)[Landroid/graphics/Paint;
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    new-array v0, v0, [Landroid/graphics/Paint;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    array-length v2, p1

    .line 6
    if-ge v1, v2, :cond_2

    .line 7
    .line 8
    aget-object v2, p1, v1

    .line 9
    .line 10
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->f:I

    .line 15
    .line 16
    if-ne v2, v3, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    aput-object v2, v0, v1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->g:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;

    .line 24
    .line 25
    invoke-interface {v3, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;->a(I)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 32
    .line 33
    aput-object v2, v0, v1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 37
    .line 38
    aput-object v2, v0, v1

    .line 39
    .line 40
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    return-object v0
.end method

.method private b(FFFF[F[F)V
    .locals 4

    .line 1
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-float v0, v0

    .line 8
    mul-float/2addr v0, p1

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    div-float v2, p1, v1

    .line 13
    .line 14
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {v3, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-virtual {p4}, Landroid/graphics/Paint;->descent()F

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/graphics/Paint;->ascent()F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    add-float/2addr p4, p0

    .line 42
    div-float/2addr p4, v1

    .line 43
    sub-float/2addr p3, p4

    .line 44
    sub-float p0, p3, p1

    .line 45
    .line 46
    const/4 p4, 0x0

    .line 47
    aput p0, p5, p4

    .line 48
    .line 49
    sub-float p0, p2, p1

    .line 50
    .line 51
    aput p0, p6, p4

    .line 52
    .line 53
    sub-float p0, p3, v0

    .line 54
    .line 55
    const/4 p4, 0x1

    .line 56
    aput p0, p5, p4

    .line 57
    .line 58
    sub-float p0, p2, v0

    .line 59
    .line 60
    aput p0, p6, p4

    .line 61
    .line 62
    sub-float p0, p3, v2

    .line 63
    .line 64
    const/4 p4, 0x2

    .line 65
    aput p0, p5, p4

    .line 66
    .line 67
    sub-float p0, p2, v2

    .line 68
    .line 69
    aput p0, p6, p4

    .line 70
    .line 71
    const/4 p0, 0x3

    .line 72
    aput p3, p5, p0

    .line 73
    .line 74
    aput p2, p6, p0

    .line 75
    .line 76
    add-float p0, p3, v2

    .line 77
    .line 78
    const/4 p4, 0x4

    .line 79
    aput p0, p5, p4

    .line 80
    .line 81
    add-float/2addr v2, p2

    .line 82
    aput v2, p6, p4

    .line 83
    .line 84
    add-float p0, p3, v0

    .line 85
    .line 86
    const/4 p4, 0x5

    .line 87
    aput p0, p5, p4

    .line 88
    .line 89
    add-float/2addr v0, p2

    .line 90
    aput v0, p6, p4

    .line 91
    .line 92
    add-float/2addr p3, p1

    .line 93
    const/4 p0, 0x6

    .line 94
    aput p3, p5, p0

    .line 95
    .line 96
    add-float/2addr p2, p1

    .line 97
    aput p2, p6, p0

    .line 98
    .line 99
    return-void
.end method

.method private c(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a([Ljava/lang/String;)[Landroid/graphics/Paint;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p2, 0x0

    .line 16
    aget-object p3, p4, p2

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    aget v1, p5, v0

    .line 20
    .line 21
    aget v2, p6, p2

    .line 22
    .line 23
    aget-object v3, p0, p2

    .line 24
    .line 25
    invoke-virtual {p1, p3, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 26
    .line 27
    .line 28
    const/4 p3, 0x1

    .line 29
    aget-object v1, p4, p3

    .line 30
    .line 31
    const/4 v2, 0x4

    .line 32
    aget v3, p5, v2

    .line 33
    .line 34
    aget v4, p6, p3

    .line 35
    .line 36
    aget-object v5, p0, p3

    .line 37
    .line 38
    invoke-virtual {p1, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    aget-object v3, p4, v1

    .line 43
    .line 44
    const/4 v4, 0x5

    .line 45
    aget v5, p5, v4

    .line 46
    .line 47
    aget v6, p6, v1

    .line 48
    .line 49
    aget-object v7, p0, v1

    .line 50
    .line 51
    invoke-virtual {p1, v3, v5, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 52
    .line 53
    .line 54
    aget-object v3, p4, v0

    .line 55
    .line 56
    const/4 v5, 0x6

    .line 57
    aget v6, p5, v5

    .line 58
    .line 59
    aget v7, p6, v0

    .line 60
    .line 61
    aget-object v8, p0, v0

    .line 62
    .line 63
    invoke-virtual {p1, v3, v6, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    aget-object v3, p4, v2

    .line 67
    .line 68
    aget v6, p5, v4

    .line 69
    .line 70
    aget v7, p6, v2

    .line 71
    .line 72
    aget-object v8, p0, v2

    .line 73
    .line 74
    invoke-virtual {p1, v3, v6, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 75
    .line 76
    .line 77
    aget-object v3, p4, v4

    .line 78
    .line 79
    aget v6, p5, v2

    .line 80
    .line 81
    aget v7, p6, v4

    .line 82
    .line 83
    aget-object v8, p0, v4

    .line 84
    .line 85
    invoke-virtual {p1, v3, v6, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 86
    .line 87
    .line 88
    aget-object v3, p4, v5

    .line 89
    .line 90
    aget v6, p5, v0

    .line 91
    .line 92
    aget v7, p6, v5

    .line 93
    .line 94
    aget-object v5, p0, v5

    .line 95
    .line 96
    invoke-virtual {p1, v3, v6, v7, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    const/4 v3, 0x7

    .line 100
    aget-object v5, p4, v3

    .line 101
    .line 102
    aget v6, p5, v1

    .line 103
    .line 104
    aget v4, p6, v4

    .line 105
    .line 106
    aget-object v3, p0, v3

    .line 107
    .line 108
    invoke-virtual {p1, v5, v6, v4, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    const/16 v3, 0x8

    .line 112
    .line 113
    aget-object v4, p4, v3

    .line 114
    .line 115
    aget v5, p5, p3

    .line 116
    .line 117
    aget v2, p6, v2

    .line 118
    .line 119
    aget-object v3, p0, v3

    .line 120
    .line 121
    invoke-virtual {p1, v4, v5, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    const/16 v2, 0x9

    .line 125
    .line 126
    aget-object v3, p4, v2

    .line 127
    .line 128
    aget p2, p5, p2

    .line 129
    .line 130
    aget v0, p6, v0

    .line 131
    .line 132
    aget-object v2, p0, v2

    .line 133
    .line 134
    invoke-virtual {p1, v3, p2, v0, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    const/16 p2, 0xa

    .line 138
    .line 139
    aget-object v0, p4, p2

    .line 140
    .line 141
    aget v2, p5, p3

    .line 142
    .line 143
    aget v3, p6, v1

    .line 144
    .line 145
    aget-object p2, p0, p2

    .line 146
    .line 147
    invoke-virtual {p1, v0, v2, v3, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    const/16 p2, 0xb

    .line 151
    .line 152
    aget-object p4, p4, p2

    .line 153
    .line 154
    aget p5, p5, v1

    .line 155
    .line 156
    aget p3, p6, p3

    .line 157
    .line 158
    aget-object p0, p0, p2

    .line 159
    .line 160
    invoke-virtual {p1, p4, p5, p3, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private e()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {v0, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->E:F

    .line 9
    .line 10
    const v4, 0x3e4ccccd    # 0.2f

    .line 11
    .line 12
    .line 13
    invoke-static {v4, v3}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->F:F

    .line 18
    .line 19
    invoke-static {v1, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    filled-new-array {v2, v3, v5}, [Landroid/animation/Keyframe;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "animationRadiusMultiplier"

    .line 28
    .line 29
    invoke-static {v3, v2}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v0, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-static {v1, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array {v5, v6}, [Landroid/animation/Keyframe;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "alpha"

    .line 46
    .line 47
    invoke-static {v6, v5}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    filled-new-array {v2, v5}, [Landroid/animation/PropertyValuesHolder;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {p0, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-wide/16 v7, 0x1f4

    .line 60
    .line 61
    invoke-virtual {v2, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->G:Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->I:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;

    .line 68
    .line 69
    invoke-virtual {v2, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 70
    .line 71
    .line 72
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->F:F

    .line 73
    .line 74
    invoke-static {v0, v2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->F:F

    .line 79
    .line 80
    invoke-static {v4, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    iget v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->E:F

    .line 85
    .line 86
    const v8, 0x3f570a3d    # 0.84f

    .line 87
    .line 88
    .line 89
    invoke-static {v8, v7}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-static {v1, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    filled-new-array {v2, v5, v7, v8}, [Landroid/animation/Keyframe;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v3, v2}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v0, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-static {v4, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v1, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    filled-new-array {v3, v0, v1}, [Landroid/animation/Keyframe;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v6, v0}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    filled-new-array {v2, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const-wide/16 v1, 0x271

    .line 134
    .line 135
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->H:Landroid/animation/ObjectAnimator;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->I:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method


# virtual methods
.method public d(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;Z)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "RadialTextsView"

    .line 6
    .line 7
    const-string p1, "This RadialTextsView may only be initialized once."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p4}, Lcom/wdullaer/materialdatetimepicker/time/a;->z()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    sget v1, Ll/q9c0;->u:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget v1, Ll/q9c0;->s:I

    .line 27
    .line 28
    :goto_0
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    .line 36
    .line 37
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->o:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->h:Landroid/graphics/Typeface;

    .line 49
    .line 50
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$string;->p:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->i:Landroid/graphics/Typeface;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->a:Landroid/graphics/Paint;

    .line 69
    .line 70
    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 71
    .line 72
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 73
    .line 74
    .line 75
    sget v1, Ll/q9c0;->u:I

    .line 76
    .line 77
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b:Landroid/graphics/Paint;

    .line 92
    .line 93
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p4}, Lcom/wdullaer/materialdatetimepicker/time/a;->z()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    sget v1, Ll/q9c0;->k:I

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    sget v1, Ll/q9c0;->j:I

    .line 106
    .line 107
    :goto_1
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    invoke-virtual {v5, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c:Landroid/graphics/Paint;

    .line 122
    .line 123
    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 124
    .line 125
    .line 126
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->j:[Ljava/lang/String;

    .line 127
    .line 128
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->k:[Ljava/lang/String;

    .line 129
    .line 130
    invoke-interface {p4}, Lcom/wdullaer/materialdatetimepicker/time/a;->f()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->l:Z

    .line 135
    .line 136
    if-eqz p3, :cond_3

    .line 137
    .line 138
    move v2, v3

    .line 139
    :cond_3
    iput-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->m:Z

    .line 140
    .line 141
    if-nez p1, :cond_5

    .line 142
    .line 143
    invoke-interface {p4}, Lcom/wdullaer/materialdatetimepicker/time/a;->getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget-object p2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 148
    .line 149
    if-eq p1, p2, :cond_4

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_4
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->c:I

    .line 153
    .line 154
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->n:F

    .line 163
    .line 164
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->a:I

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->o:F

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_5
    :goto_2
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->d:I

    .line 178
    .line 179
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->n:F

    .line 188
    .line 189
    :goto_3
    const/4 p1, 0x7

    .line 190
    new-array p2, p1, [F

    .line 191
    .line 192
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->z:[F

    .line 193
    .line 194
    new-array p2, p1, [F

    .line 195
    .line 196
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->A:[F

    .line 197
    .line 198
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->m:Z

    .line 199
    .line 200
    if-eqz p2, :cond_6

    .line 201
    .line 202
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->m:I

    .line 203
    .line 204
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->p:F

    .line 213
    .line 214
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->z:I

    .line 215
    .line 216
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->r:F

    .line 225
    .line 226
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->k:I

    .line 227
    .line 228
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 233
    .line 234
    .line 235
    move-result p2

    .line 236
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->q:F

    .line 237
    .line 238
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->x:I

    .line 239
    .line 240
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 245
    .line 246
    .line 247
    move-result p2

    .line 248
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->s:F

    .line 249
    .line 250
    new-array p2, p1, [F

    .line 251
    .line 252
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->B:[F

    .line 253
    .line 254
    new-array p1, p1, [F

    .line 255
    .line 256
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->C:[F

    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_6
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->l:I

    .line 260
    .line 261
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->p:F

    .line 270
    .line 271
    sget p1, Lcom/wdullaer/materialdatetimepicker/R$string;->y:I

    .line 272
    .line 273
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->r:F

    .line 282
    .line 283
    :goto_4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 284
    .line 285
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->D:F

    .line 286
    .line 287
    const/4 p2, -0x1

    .line 288
    if-eqz p6, :cond_7

    .line 289
    .line 290
    move p3, p2

    .line 291
    goto :goto_5

    .line 292
    :cond_7
    move p3, v3

    .line 293
    :goto_5
    int-to-float p3, p3

    .line 294
    const p4, 0x3d4ccccd    # 0.05f

    .line 295
    .line 296
    .line 297
    mul-float/2addr p3, p4

    .line 298
    add-float/2addr p3, p1

    .line 299
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->E:F

    .line 300
    .line 301
    if-eqz p6, :cond_8

    .line 302
    .line 303
    move p2, v3

    .line 304
    :cond_8
    int-to-float p2, p2

    .line 305
    const p3, 0x3e99999a    # 0.3f

    .line 306
    .line 307
    .line 308
    mul-float/2addr p2, p3

    .line 309
    add-float/2addr p2, p1

    .line 310
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->F:F

    .line 311
    .line 312
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;

    .line 313
    .line 314
    const/4 p2, 0x0

    .line 315
    invoke-direct {p1, p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$a;)V

    .line 316
    .line 317
    .line 318
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->I:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$b;

    .line 319
    .line 320
    iput-object p5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->g:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;

    .line 321
    .line 322
    iput-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->w:Z

    .line 323
    .line 324
    iput-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 325
    .line 326
    return-void
.end method

.method public getDisappearAnimator()Landroid/animation/ObjectAnimator;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->G:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const-string p0, "RadialTextsView"

    .line 16
    .line 17
    const-string v0, "RadialTextView was not ready for animation."

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public getReappearAnimator()Landroid/animation/ObjectAnimator;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->H:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const-string p0, "RadialTextsView"

    .line 16
    .line 17
    const-string v0, "RadialTextView was not ready for animation."

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_6

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d:Z

    .line 14
    .line 15
    if-nez v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    div-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->t:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    div-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->u:I

    .line 32
    .line 33
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->t:I

    .line 34
    .line 35
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->n:F

    .line 41
    .line 42
    mul-float/2addr v1, v2

    .line 43
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->v:F

    .line 44
    .line 45
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->l:Z

    .line 46
    .line 47
    if-nez v2, :cond_1

    .line 48
    .line 49
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->o:F

    .line 50
    .line 51
    mul-float/2addr v2, v1

    .line 52
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->u:I

    .line 53
    .line 54
    int-to-double v3, v3

    .line 55
    float-to-double v5, v2

    .line 56
    const-wide/high16 v7, 0x3fe8000000000000L    # 0.75

    .line 57
    .line 58
    mul-double/2addr v5, v7

    .line 59
    sub-double/2addr v3, v5

    .line 60
    double-to-int v2, v3

    .line 61
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->u:I

    .line 62
    .line 63
    :cond_1
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->r:F

    .line 64
    .line 65
    mul-float/2addr v2, v1

    .line 66
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->x:F

    .line 67
    .line 68
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->m:Z

    .line 69
    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->s:F

    .line 73
    .line 74
    mul-float/2addr v1, v2

    .line 75
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->y:F

    .line 76
    .line 77
    :cond_2
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->e()V

    .line 78
    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->w:Z

    .line 82
    .line 83
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d:Z

    .line 84
    .line 85
    :cond_3
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->w:Z

    .line 86
    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->v:F

    .line 90
    .line 91
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->p:F

    .line 92
    .line 93
    mul-float/2addr v1, v2

    .line 94
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->D:F

    .line 95
    .line 96
    mul-float/2addr v1, v2

    .line 97
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->t:I

    .line 98
    .line 99
    int-to-float v2, v2

    .line 100
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->u:I

    .line 101
    .line 102
    int-to-float v3, v3

    .line 103
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->x:F

    .line 104
    .line 105
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->z:[F

    .line 106
    .line 107
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->A:[F

    .line 108
    .line 109
    move-object v0, p0

    .line 110
    invoke-direct/range {v0 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b(FFFF[F[F)V

    .line 111
    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->m:Z

    .line 114
    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->v:F

    .line 118
    .line 119
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->q:F

    .line 120
    .line 121
    mul-float/2addr v1, v2

    .line 122
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->D:F

    .line 123
    .line 124
    mul-float/2addr v1, v2

    .line 125
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->t:I

    .line 126
    .line 127
    int-to-float v2, v2

    .line 128
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->u:I

    .line 129
    .line 130
    int-to-float v3, v3

    .line 131
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->y:F

    .line 132
    .line 133
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->B:[F

    .line 134
    .line 135
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->C:[F

    .line 136
    .line 137
    move-object v0, p0

    .line 138
    invoke-direct/range {v0 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->b(FFFF[F[F)V

    .line 139
    .line 140
    .line 141
    :cond_4
    const/4 v1, 0x0

    .line 142
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->w:Z

    .line 143
    .line 144
    :cond_5
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->x:F

    .line 145
    .line 146
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->h:Landroid/graphics/Typeface;

    .line 147
    .line 148
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->j:[Ljava/lang/String;

    .line 149
    .line 150
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->A:[F

    .line 151
    .line 152
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->z:[F

    .line 153
    .line 154
    move-object v0, p0

    .line 155
    move-object v1, p1

    .line 156
    invoke-direct/range {v0 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V

    .line 157
    .line 158
    .line 159
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->m:Z

    .line 160
    .line 161
    if-eqz v1, :cond_6

    .line 162
    .line 163
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->y:F

    .line 164
    .line 165
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->i:Landroid/graphics/Typeface;

    .line 166
    .line 167
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->k:[Ljava/lang/String;

    .line 168
    .line 169
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->C:[F

    .line 170
    .line 171
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->B:[F

    .line 172
    .line 173
    move-object v0, p0

    .line 174
    move-object v1, p1

    .line 175
    invoke-direct/range {v0 .. v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->c(Landroid/graphics/Canvas;FLandroid/graphics/Typeface;[Ljava/lang/String;[F[F)V

    .line 176
    .line 177
    .line 178
    :cond_6
    :goto_0
    return-void
.end method

.method public setAnimationRadiusMultiplier(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->D:F

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->w:Z

    .line 5
    .line 6
    return-void
.end method

.method public setSelection(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->f:I

    .line 2
    .line 3
    return-void
.end method
