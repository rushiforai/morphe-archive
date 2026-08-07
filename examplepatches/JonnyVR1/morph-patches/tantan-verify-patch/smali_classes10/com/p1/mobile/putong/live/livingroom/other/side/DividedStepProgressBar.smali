.class public Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public final i:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;",
            ">;"
        }
    .end annotation
.end field

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 20
    .line 21
    sget v0, Ll/qa00;->d:I

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 24
    .line 25
    sget v0, Ll/qa00;->a:I

    .line 26
    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    .line 28
    .line 29
    const/16 v0, 0xbb8

    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->f:I

    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->h:Z

    .line 37
    .line 38
    new-instance v0, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->i:Ljava/util/HashSet;

    .line 44
    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->j:Z

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 53
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 55
    sget p2, Ll/qa00;->d:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 56
    sget p2, Ll/qa00;->a:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    const/16 p2, 0xbb8

    .line 57
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->f:I

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    const/4 p2, 0x1

    .line 59
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->h:Z

    .line 60
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->i:Ljava/util/HashSet;

    .line 61
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->j:Z

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 65
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 66
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 67
    sget p2, Ll/qa00;->d:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 68
    sget p2, Ll/qa00;->a:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    const/16 p2, 0xbb8

    .line 69
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->f:I

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    const/4 p2, 0x1

    .line 71
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->h:Z

    .line 72
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->i:Ljava/util/HashSet;

    .line 73
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->j:Z

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;ILcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b(ILcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(ILcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 2
    .line 3
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar$a;->a(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 20
    .line 21
    const v3, 0x5affffff

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 43
    .line 44
    const v0, -0x65000001

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public getRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 7
    .line 8
    if-gtz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 23
    .line 24
    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 25
    .line 26
    add-int/lit8 v5, v4, -0x1

    .line 27
    .line 28
    mul-int/2addr v3, v5

    .line 29
    sub-int/2addr v1, v3

    .line 30
    div-int/2addr v1, v4

    .line 31
    const/4 v3, 0x1

    .line 32
    :goto_0
    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 33
    .line 34
    if-gt v3, v4, :cond_1

    .line 35
    .line 36
    add-int/lit8 v4, v3, -0x1

    .line 37
    .line 38
    iget v5, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 39
    .line 40
    add-int/2addr v5, v1

    .line 41
    mul-int/2addr v4, v5

    .line 42
    add-int v5, v4, v1

    .line 43
    .line 44
    int-to-float v7, v4

    .line 45
    int-to-float v9, v5

    .line 46
    int-to-float v10, v2

    .line 47
    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    .line 48
    .line 49
    int-to-float v11, v4

    .line 50
    int-to-float v12, v4

    .line 51
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->a:Landroid/graphics/Paint;

    .line 52
    .line 53
    const/4 v8, 0x0

    .line 54
    move-object/from16 v6, p1

    .line 55
    .line 56
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 63
    .line 64
    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->f:I

    .line 65
    .line 66
    div-int v5, v3, v4

    .line 67
    .line 68
    iget v6, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->d:I

    .line 69
    .line 70
    add-int/2addr v6, v1

    .line 71
    mul-int/2addr v6, v5

    .line 72
    iget-boolean v7, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->j:Z

    .line 73
    .line 74
    if-eqz v7, :cond_2

    .line 75
    .line 76
    rem-int/2addr v3, v4

    .line 77
    sub-int v3, v4, v3

    .line 78
    .line 79
    mul-int/2addr v3, v1

    .line 80
    div-int/2addr v3, v4

    .line 81
    :goto_1
    add-int/2addr v3, v6

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    rem-int/2addr v3, v4

    .line 84
    mul-int/2addr v3, v1

    .line 85
    div-int/2addr v3, v4

    .line 86
    goto :goto_1

    .line 87
    :goto_2
    int-to-float v15, v6

    .line 88
    int-to-float v1, v3

    .line 89
    int-to-float v2, v2

    .line 90
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    .line 91
    .line 92
    int-to-float v4, v3

    .line 93
    int-to-float v3, v3

    .line 94
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->b:Landroid/graphics/Paint;

    .line 95
    .line 96
    const/16 v16, 0x0

    .line 97
    .line 98
    move-object/from16 v14, p1

    .line 99
    .line 100
    move/from16 v17, v1

    .line 101
    .line 102
    move/from16 v18, v2

    .line 103
    .line 104
    move/from16 v20, v3

    .line 105
    .line 106
    move/from16 v19, v4

    .line 107
    .line 108
    move-object/from16 v21, v6

    .line 109
    .line 110
    invoke-virtual/range {v14 .. v21}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->i:Ljava/util/HashSet;

    .line 114
    .line 115
    new-instance v2, Ll/f6e;

    .line 116
    .line 117
    invoke-direct {v2, v0, v5}, Ll/f6e;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;I)V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 121
    .line 122
    .line 123
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->h:Z

    .line 124
    .line 125
    if-eqz v1, :cond_3

    .line 126
    .line 127
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 128
    .line 129
    add-int/lit8 v1, v1, 0x32

    .line 130
    .line 131
    iget v2, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->f:I

    .line 132
    .line 133
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->c:I

    .line 134
    .line 135
    mul-int/2addr v2, v3

    .line 136
    rem-int/2addr v1, v2

    .line 137
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->g:I

    .line 138
    .line 139
    const-wide/16 v1, 0x32

    .line 140
    .line 141
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->postInvalidateDelayed(J)V

    .line 142
    .line 143
    .line 144
    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, -0x80000000

    .line 10
    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-ne v2, v0, :cond_1

    .line 28
    .line 29
    const/high16 v0, 0x429c0000    # 78.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    :cond_1
    if-ne v2, v1, :cond_2

    .line 40
    .line 41
    sget v0, Ll/qa00;->c:I

    .line 42
    .line 43
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    :cond_2
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public setRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/side/DividedStepProgressBar;->e:I

    .line 2
    .line 3
    return-void
.end method
