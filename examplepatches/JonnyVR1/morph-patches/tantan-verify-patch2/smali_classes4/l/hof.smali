.class public Ll/hof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kj2;


# static fields
.field public static e:I


# instance fields
.field public a:F

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43160000    # 150.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/hof;->e:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/ox2;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hof;->c:I

    .line 6
    .line 7
    const/16 v0, 0xff

    .line 8
    .line 9
    iput v0, p0, Ll/hof;->d:I

    .line 10
    .line 11
    const v0, 0x3f798700

    .line 12
    .line 13
    .line 14
    iput v0, p0, Ll/hof;->a:F

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 28
    .line 29
    const v1, -0x15120c

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "VirtualCard"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->v(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/gof;

    .line 56
    .line 57
    invoke-direct {v0, p0, p2}, Ll/gof;-><init>(Ll/hof;Ll/ox2;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic c(Ll/hof;Ll/ox2;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hof;->d(Ll/ox2;Landroid/util/Pair;)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/hof;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public b(Landroid/graphics/Canvas;II)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ll/uih0;->A0()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    iget v2, v0, Ll/hof;->d:I

    .line 16
    .line 17
    const/16 v3, 0xff

    .line 18
    .line 19
    invoke-static {v2, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, v0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    sget v2, Ll/hof;->e:I

    .line 29
    .line 30
    int-to-float v5, v2

    .line 31
    int-to-float v6, v1

    .line 32
    move/from16 v2, p3

    .line 33
    .line 34
    int-to-float v7, v2

    .line 35
    iget-object v8, v0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    move-object/from16 v3, p1

    .line 39
    .line 40
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    iget v2, v0, Ll/hof;->c:I

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    if-gt v2, v3, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v2, v0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 50
    .line 51
    const v3, -0x15120c

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    sget v2, Ll/qa00;->h:I

    .line 58
    .line 59
    mul-int/lit8 v2, v2, 0x2

    .line 60
    .line 61
    sub-int v2, v1, v2

    .line 62
    .line 63
    int-to-float v2, v2

    .line 64
    iget v3, v0, Ll/hof;->a:F

    .line 65
    .line 66
    mul-float/2addr v2, v3

    .line 67
    const/high16 v3, 0x42c80000    # 100.0f

    .line 68
    .line 69
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    int-to-float v3, v3

    .line 74
    const/high16 v4, 0x41400000    # 12.0f

    .line 75
    .line 76
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    int-to-float v4, v4

    .line 81
    iget v5, v0, Ll/hof;->a:F

    .line 82
    .line 83
    div-float/2addr v4, v5

    .line 84
    sub-float/2addr v3, v4

    .line 85
    div-int/lit8 v1, v1, 0x2

    .line 86
    .line 87
    int-to-float v1, v1

    .line 88
    const/high16 v4, 0x40000000    # 2.0f

    .line 89
    .line 90
    div-float/2addr v2, v4

    .line 91
    sub-float v10, v1, v2

    .line 92
    .line 93
    sub-float v13, v7, v3

    .line 94
    .line 95
    const/high16 v3, 0x43480000    # 200.0f

    .line 96
    .line 97
    sub-float v11, v13, v3

    .line 98
    .line 99
    add-float v12, v1, v2

    .line 100
    .line 101
    const/high16 v1, 0x41a00000    # 20.0f

    .line 102
    .line 103
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    int-to-float v2, v2

    .line 108
    iget v3, v0, Ll/hof;->a:F

    .line 109
    .line 110
    mul-float v14, v2, v3

    .line 111
    .line 112
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    int-to-float v1, v1

    .line 117
    iget v2, v0, Ll/hof;->a:F

    .line 118
    .line 119
    mul-float v15, v1, v2

    .line 120
    .line 121
    iget-object v0, v0, Ll/hof;->b:Landroid/graphics/Paint;

    .line 122
    .line 123
    move-object/from16 v9, p1

    .line 124
    .line 125
    move-object/from16 v16, v0

    .line 126
    .line 127
    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic d(Ll/ox2;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, p2

    .line 12
    const/high16 p2, 0x437f0000    # 255.0f

    .line 13
    .line 14
    mul-float/2addr v0, p2

    .line 15
    float-to-int p2, v0

    .line 16
    iput p2, p0, Ll/hof;->d:I

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ox2;->B()Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
