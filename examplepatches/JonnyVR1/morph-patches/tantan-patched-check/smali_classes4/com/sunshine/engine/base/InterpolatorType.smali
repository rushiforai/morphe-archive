.class public final enum Lcom/sunshine/engine/base/InterpolatorType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sunshine/engine/base/InterpolatorType$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sunshine/engine/base/InterpolatorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum accelerate:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum accelerateDecelerate:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum bounce:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum cos:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum decelerate:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum linear:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum overshoot:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum resonance:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum shake:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum sin:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum spring:Lcom/sunshine/engine/base/InterpolatorType;

.field public static final enum triangle:Lcom/sunshine/engine/base/InterpolatorType;


# instance fields
.field private final callback:Lcom/sunshine/engine/base/InterpolatorType$a;

.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lcom/sunshine/engine/base/InterpolatorType;

    .line 2
    .line 3
    new-instance v1, Lcom/sunshine/engine/base/i;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/sunshine/engine/base/i;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "linear"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-direct {v0, v2, v3, v2, v1}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/sunshine/engine/base/InterpolatorType;->linear:Lcom/sunshine/engine/base/InterpolatorType;

    .line 15
    .line 16
    new-instance v1, Lcom/sunshine/engine/base/InterpolatorType;

    .line 17
    .line 18
    new-instance v2, Lcom/sunshine/engine/base/l;

    .line 19
    .line 20
    invoke-direct {v2}, Lcom/sunshine/engine/base/l;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v3, "accelerate"

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-direct {v1, v3, v4, v3, v2}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 27
    .line 28
    .line 29
    sput-object v1, Lcom/sunshine/engine/base/InterpolatorType;->accelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 30
    .line 31
    new-instance v2, Lcom/sunshine/engine/base/InterpolatorType;

    .line 32
    .line 33
    new-instance v3, Lcom/sunshine/engine/base/m;

    .line 34
    .line 35
    invoke-direct {v3}, Lcom/sunshine/engine/base/m;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v4, "decelerate"

    .line 39
    .line 40
    const/4 v5, 0x2

    .line 41
    invoke-direct {v2, v4, v5, v4, v3}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 42
    .line 43
    .line 44
    sput-object v2, Lcom/sunshine/engine/base/InterpolatorType;->decelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 45
    .line 46
    new-instance v3, Lcom/sunshine/engine/base/InterpolatorType;

    .line 47
    .line 48
    new-instance v4, Lcom/sunshine/engine/base/b;

    .line 49
    .line 50
    invoke-direct {v4}, Lcom/sunshine/engine/base/b;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v5, "accelerateDecelerate"

    .line 54
    .line 55
    const/4 v6, 0x3

    .line 56
    invoke-direct {v3, v5, v6, v5, v4}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 57
    .line 58
    .line 59
    sput-object v3, Lcom/sunshine/engine/base/InterpolatorType;->accelerateDecelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 60
    .line 61
    new-instance v4, Lcom/sunshine/engine/base/InterpolatorType;

    .line 62
    .line 63
    new-instance v5, Lcom/sunshine/engine/base/c;

    .line 64
    .line 65
    invoke-direct {v5}, Lcom/sunshine/engine/base/c;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v6, "overshoot"

    .line 69
    .line 70
    const/4 v7, 0x4

    .line 71
    invoke-direct {v4, v6, v7, v6, v5}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 72
    .line 73
    .line 74
    sput-object v4, Lcom/sunshine/engine/base/InterpolatorType;->overshoot:Lcom/sunshine/engine/base/InterpolatorType;

    .line 75
    .line 76
    new-instance v5, Lcom/sunshine/engine/base/InterpolatorType;

    .line 77
    .line 78
    new-instance v6, Lcom/sunshine/engine/base/d;

    .line 79
    .line 80
    invoke-direct {v6}, Lcom/sunshine/engine/base/d;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v7, "bounce"

    .line 84
    .line 85
    const/4 v8, 0x5

    .line 86
    invoke-direct {v5, v7, v8, v7, v6}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 87
    .line 88
    .line 89
    sput-object v5, Lcom/sunshine/engine/base/InterpolatorType;->bounce:Lcom/sunshine/engine/base/InterpolatorType;

    .line 90
    .line 91
    new-instance v6, Lcom/sunshine/engine/base/InterpolatorType;

    .line 92
    .line 93
    new-instance v7, Lcom/sunshine/engine/base/e;

    .line 94
    .line 95
    invoke-direct {v7}, Lcom/sunshine/engine/base/e;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v8, "spring"

    .line 99
    .line 100
    const/4 v9, 0x6

    .line 101
    invoke-direct {v6, v8, v9, v8, v7}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 102
    .line 103
    .line 104
    sput-object v6, Lcom/sunshine/engine/base/InterpolatorType;->spring:Lcom/sunshine/engine/base/InterpolatorType;

    .line 105
    .line 106
    new-instance v7, Lcom/sunshine/engine/base/InterpolatorType;

    .line 107
    .line 108
    new-instance v8, Lcom/sunshine/engine/base/f;

    .line 109
    .line 110
    invoke-direct {v8}, Lcom/sunshine/engine/base/f;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v9, "shake"

    .line 114
    .line 115
    const/4 v10, 0x7

    .line 116
    invoke-direct {v7, v9, v10, v9, v8}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 117
    .line 118
    .line 119
    sput-object v7, Lcom/sunshine/engine/base/InterpolatorType;->shake:Lcom/sunshine/engine/base/InterpolatorType;

    .line 120
    .line 121
    new-instance v8, Lcom/sunshine/engine/base/InterpolatorType;

    .line 122
    .line 123
    new-instance v9, Lcom/sunshine/engine/base/g;

    .line 124
    .line 125
    invoke-direct {v9}, Lcom/sunshine/engine/base/g;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string v10, "resonance"

    .line 129
    .line 130
    const/16 v11, 0x8

    .line 131
    .line 132
    invoke-direct {v8, v10, v11, v10, v9}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 133
    .line 134
    .line 135
    sput-object v8, Lcom/sunshine/engine/base/InterpolatorType;->resonance:Lcom/sunshine/engine/base/InterpolatorType;

    .line 136
    .line 137
    new-instance v9, Lcom/sunshine/engine/base/InterpolatorType;

    .line 138
    .line 139
    new-instance v10, Lcom/sunshine/engine/base/h;

    .line 140
    .line 141
    invoke-direct {v10}, Lcom/sunshine/engine/base/h;-><init>()V

    .line 142
    .line 143
    .line 144
    const-string v11, "sin"

    .line 145
    .line 146
    const/16 v12, 0x9

    .line 147
    .line 148
    invoke-direct {v9, v11, v12, v11, v10}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 149
    .line 150
    .line 151
    sput-object v9, Lcom/sunshine/engine/base/InterpolatorType;->sin:Lcom/sunshine/engine/base/InterpolatorType;

    .line 152
    .line 153
    new-instance v10, Lcom/sunshine/engine/base/InterpolatorType;

    .line 154
    .line 155
    new-instance v11, Lcom/sunshine/engine/base/j;

    .line 156
    .line 157
    invoke-direct {v11}, Lcom/sunshine/engine/base/j;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v12, "cos"

    .line 161
    .line 162
    const/16 v13, 0xa

    .line 163
    .line 164
    invoke-direct {v10, v12, v13, v12, v11}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 165
    .line 166
    .line 167
    sput-object v10, Lcom/sunshine/engine/base/InterpolatorType;->cos:Lcom/sunshine/engine/base/InterpolatorType;

    .line 168
    .line 169
    new-instance v11, Lcom/sunshine/engine/base/InterpolatorType;

    .line 170
    .line 171
    new-instance v12, Lcom/sunshine/engine/base/k;

    .line 172
    .line 173
    invoke-direct {v12}, Lcom/sunshine/engine/base/k;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v13, "triangle"

    .line 177
    .line 178
    const/16 v14, 0xb

    .line 179
    .line 180
    invoke-direct {v11, v13, v14, v13, v12}, Lcom/sunshine/engine/base/InterpolatorType;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V

    .line 181
    .line 182
    .line 183
    sput-object v11, Lcom/sunshine/engine/base/InterpolatorType;->triangle:Lcom/sunshine/engine/base/InterpolatorType;

    .line 184
    .line 185
    filled-new-array/range {v0 .. v11}, [Lcom/sunshine/engine/base/InterpolatorType;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    sput-object v0, Lcom/sunshine/engine/base/InterpolatorType;->$VALUES:[Lcom/sunshine/engine/base/InterpolatorType;

    .line 190
    .line 191
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/sunshine/engine/base/InterpolatorType$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/sunshine/engine/base/InterpolatorType$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/sunshine/engine/base/InterpolatorType;->text:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/sunshine/engine/base/InterpolatorType;->callback:Lcom/sunshine/engine/base/InterpolatorType$a;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic A(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    new-instance p0, Ll/s1n;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/s1n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic B(IF)F
    .locals 8

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr v0, p1

    .line 4
    float-to-double v0, v0

    .line 5
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 6
    .line 7
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    double-to-float v0, v0

    .line 12
    const-wide v4, 0x401921fb54442d18L    # 6.283185307179586

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    int-to-double v6, p0

    .line 18
    mul-double/2addr v6, v4

    .line 19
    div-double/2addr v6, v2

    .line 20
    float-to-double p0, p1

    .line 21
    mul-double/2addr v6, p0

    .line 22
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    double-to-float p0, p0

    .line 27
    mul-float/2addr v0, p0

    .line 28
    return v0
.end method

.method public static synthetic a(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/t1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic b(IF)F
    .locals 1

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    int-to-float p0, p0

    .line 5
    mul-float/2addr p1, p0

    .line 6
    float-to-int p0, p1

    .line 7
    rem-int/lit8 v0, p0, 0x2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    sub-float/2addr p1, p0

    .line 13
    return p1

    .line 14
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    sub-float/2addr v0, p1

    .line 17
    int-to-float p0, p0

    .line 18
    add-float/2addr v0, p0

    .line 19
    return v0
.end method

.method public static synthetic f(F)F
    .locals 2

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    mul-float/2addr v0, p0

    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    sub-float/2addr v1, p0

    .line 7
    mul-float/2addr v0, v1

    .line 8
    return v0
.end method

.method public static synthetic g(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/p1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic h(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    new-instance p0, Landroid/view/animation/BounceInterpolator;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/BounceInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic i(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/k1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic j(IF)F
    .locals 2

    .line 1
    float-to-double v0, p1

    .line 2
    const/4 p1, 0x2

    .line 3
    if-ge p0, p1, :cond_0

    .line 4
    .line 5
    const-wide/high16 p0, 0x4000000000000000L    # 2.0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    int-to-double p0, p0

    .line 9
    :goto_0
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    double-to-float p0, p0

    .line 14
    return p0
.end method

.method public static synthetic m(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/q1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic n(IF)F
    .locals 4

    .line 1
    const-wide v0, 0x401921fb54442d18L    # 6.283185307179586

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    int-to-double v2, p0

    .line 7
    mul-double/2addr v2, v0

    .line 8
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 9
    .line 10
    div-double/2addr v2, v0

    .line 11
    float-to-double p0, p1

    .line 12
    mul-double/2addr v2, p0

    .line 13
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    double-to-float p0, p0

    .line 18
    return p0
.end method

.method public static synthetic o(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    new-instance p0, Ll/m1n;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/m1n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic p(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/o1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/o1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic q(IF)F
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    mul-float v1, p1, p1

    .line 5
    .line 6
    add-int/lit8 v2, p0, 0x1

    .line 7
    .line 8
    int-to-float v2, v2

    .line 9
    mul-float/2addr v2, p1

    .line 10
    int-to-float p0, p0

    .line 11
    add-float/2addr v2, p0

    .line 12
    mul-float/2addr v1, v2

    .line 13
    add-float/2addr v1, v0

    .line 14
    return v1
.end method

.method public static synthetic r(IF)F
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float p1, v0, p1

    .line 4
    .line 5
    float-to-double v1, p1

    .line 6
    const/4 p1, 0x2

    .line 7
    if-ge p0, p1, :cond_0

    .line 8
    .line 9
    const-wide/high16 p0, 0x4000000000000000L    # 2.0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    int-to-double p0, p0

    .line 13
    :goto_0
    invoke-static {v1, v2, p0, p1}, Ljava/lang/Math;->pow(DD)D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    double-to-float p0, p0

    .line 18
    sub-float/2addr v0, p0

    .line 19
    return v0
.end method

.method public static synthetic s(F)F
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    add-float/2addr p0, v0

    .line 4
    float-to-double v0, p0

    .line 5
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    mul-double/2addr v0, v2

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 16
    .line 17
    div-double/2addr v0, v2

    .line 18
    double-to-float p0, v0

    .line 19
    const/high16 v0, 0x3f000000    # 0.5f

    .line 20
    .line 21
    add-float/2addr p0, v0

    .line 22
    return p0
.end method

.method public static synthetic t(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    new-instance p0, Ll/r1n;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/r1n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic u(F)F
    .locals 0

    .line 1
    return p0
.end method

.method public static synthetic v(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/n1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sunshine/engine/base/InterpolatorType;
    .locals 1

    .line 1
    const-class v0, Lcom/sunshine/engine/base/InterpolatorType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/sunshine/engine/base/InterpolatorType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/sunshine/engine/base/InterpolatorType;
    .locals 1

    .line 1
    sget-object v0, Lcom/sunshine/engine/base/InterpolatorType;->$VALUES:[Lcom/sunshine/engine/base/InterpolatorType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/sunshine/engine/base/InterpolatorType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/sunshine/engine/base/InterpolatorType;

    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic w(IF)F
    .locals 4

    .line 1
    const-wide v0, 0x401921fb54442d18L    # 6.283185307179586

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    int-to-double v2, p0

    .line 7
    mul-double/2addr v2, v0

    .line 8
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 9
    .line 10
    div-double/2addr v2, v0

    .line 11
    float-to-double p0, p1

    .line 12
    mul-double/2addr v2, p0

    .line 13
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    double-to-float p0, p0

    .line 18
    return p0
.end method

.method public static synthetic x(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/l1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic y(IF)F
    .locals 9

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float v1, v0, p1

    .line 4
    .line 5
    float-to-double v1, v1

    .line 6
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 7
    .line 8
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 9
    .line 10
    .line 11
    move-result-wide v5

    .line 12
    double-to-float v5, v5

    .line 13
    sub-float/2addr v0, v5

    .line 14
    const-wide v5, 0x401921fb54442d18L    # 6.283185307179586

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    int-to-double v7, p0

    .line 20
    mul-double/2addr v7, v5

    .line 21
    div-double/2addr v7, v3

    .line 22
    float-to-double p0, p1

    .line 23
    mul-double/2addr v7, p0

    .line 24
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 25
    .line 26
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    sub-double/2addr p0, v1

    .line 31
    mul-double/2addr v7, p0

    .line 32
    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    double-to-float p0, p0

    .line 37
    mul-float/2addr v0, p0

    .line 38
    return v0
.end method

.method public static synthetic z(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ll/j1n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j1n;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public build(I)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/InterpolatorType;->callback:Lcom/sunshine/engine/base/InterpolatorType$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/sunshine/engine/base/InterpolatorType$a;->a(I)Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public obtain()Landroid/view/animation/Interpolator;
    .locals 0

    .line 30
    invoke-virtual {p0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/i1n;->c(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    move-result-object p0

    return-object p0
.end method

.method public obtain(I)Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/sunshine/engine/base/InterpolatorType;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "_"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/i1n;->c(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/InterpolatorType;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
