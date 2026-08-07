.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$c;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:F

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:J

.field public i:F

.field public j:I

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroid/graphics/Paint;

.field public m:Landroid/view/Choreographer;

.field public n:Landroid/view/Choreographer$FrameCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->b:Z

    .line 8
    .line 9
    sget p1, Ll/qa00;->e:I

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    .line 13
    .line 14
    const/16 p1, 0x9c4

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->g:I

    .line 17
    .line 18
    sget p1, Ll/qa00;->c:I

    .line 19
    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    .line 21
    .line 22
    new-instance p1, Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 28
    .line 29
    new-instance p1, Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->n:Landroid/view/Choreographer$FrameCallback;

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a:Z

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->b:Z

    .line 47
    sget p1, Ll/qa00;->e:I

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    const/16 p1, 0x9c4

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->g:I

    .line 49
    sget p1, Ll/qa00;->c:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    .line 50
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 51
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 52
    new-instance p1, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->n:Landroid/view/Choreographer$FrameCallback;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a:Z

    .line 55
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->b:Z

    .line 56
    sget p1, Ll/qa00;->e:I

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    const/16 p1, 0x9c4

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->g:I

    .line 58
    sget p1, Ll/qa00;->c:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    .line 59
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 60
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 61
    new-instance p1, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$a;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->n:Landroid/view/Choreographer$FrameCallback;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->f:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    return p0
.end method


# virtual methods
.method public final f()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    sget v5, Ll/c9c0;->c2:I

    .line 33
    .line 34
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Ll/c9c0;->H:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->m:Landroid/view/Choreographer;

    .line 93
    .line 94
    return-void
.end method

.method public getTargetStep()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-gtz v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->d:I

    .line 17
    .line 18
    add-int/lit8 v3, v2, -0x1

    .line 19
    .line 20
    int-to-float v3, v3

    .line 21
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    .line 22
    .line 23
    mul-float/2addr v3, v4

    .line 24
    sub-float/2addr v1, v3

    .line 25
    int-to-float v2, v2

    .line 26
    div-float/2addr v1, v2

    .line 27
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    .line 28
    .line 29
    div-int/lit8 v2, v2, 0x2

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    :goto_0
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->d:I

    .line 33
    .line 34
    if-ge v3, v4, :cond_6

    .line 35
    .line 36
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    .line 37
    .line 38
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->f:I

    .line 39
    .line 40
    if-le v4, v5, :cond_4

    .line 41
    .line 42
    if-ne v5, v3, :cond_4

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a:Z

    .line 49
    .line 50
    const/high16 v7, 0x3f800000    # 1.0f

    .line 51
    .line 52
    if-nez v6, :cond_1

    .line 53
    .line 54
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->i:F

    .line 55
    .line 56
    iget-wide v8, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->h:J

    .line 57
    .line 58
    sub-long v8, v4, v8

    .line 59
    .line 60
    long-to-float v8, v8

    .line 61
    mul-float/2addr v8, v7

    .line 62
    iget v9, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->g:I

    .line 63
    .line 64
    int-to-float v9, v9

    .line 65
    div-float/2addr v8, v9

    .line 66
    add-float/2addr v6, v8

    .line 67
    iput v6, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->i:F

    .line 68
    .line 69
    :cond_1
    iput-wide v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->h:J

    .line 70
    .line 71
    int-to-float v4, v3

    .line 72
    mul-float v5, v4, v1

    .line 73
    .line 74
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    .line 75
    .line 76
    mul-float/2addr v4, v6

    .line 77
    add-float/2addr v5, v4

    .line 78
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->i:F

    .line 79
    .line 80
    cmpl-float v4, v4, v7

    .line 81
    .line 82
    if-ltz v4, :cond_3

    .line 83
    .line 84
    int-to-float v8, v2

    .line 85
    add-float v7, v5, v8

    .line 86
    .line 87
    add-float/2addr v5, v1

    .line 88
    sub-float v9, v5, v8

    .line 89
    .line 90
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 91
    .line 92
    move v10, v8

    .line 93
    move-object/from16 v6, p1

    .line 94
    .line 95
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 96
    .line 97
    .line 98
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    .line 99
    .line 100
    iput v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->f:I

    .line 101
    .line 102
    const/4 v4, 0x0

    .line 103
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    if-nez v5, :cond_2

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    throw v4

    .line 111
    :cond_3
    int-to-float v14, v2

    .line 112
    add-float v13, v5, v14

    .line 113
    .line 114
    add-float/2addr v5, v1

    .line 115
    sub-float v15, v5, v14

    .line 116
    .line 117
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 118
    .line 119
    move/from16 v16, v14

    .line 120
    .line 121
    move-object/from16 v12, p1

    .line 122
    .line 123
    move-object/from16 v17, v4

    .line 124
    .line 125
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->j:I

    .line 129
    .line 130
    int-to-float v4, v4

    .line 131
    sub-float v4, v1, v4

    .line 132
    .line 133
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->i:F

    .line 134
    .line 135
    mul-float/2addr v4, v5

    .line 136
    add-float v15, v13, v4

    .line 137
    .line 138
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 139
    .line 140
    move-object/from16 v17, v4

    .line 141
    .line 142
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 143
    .line 144
    .line 145
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->m:Landroid/view/Choreographer;

    .line 146
    .line 147
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->n:Landroid/view/Choreographer$FrameCallback;

    .line 148
    .line 149
    invoke-virtual {v4, v5}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_4
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->c:F

    .line 154
    .line 155
    if-ge v3, v4, :cond_5

    .line 156
    .line 157
    int-to-float v4, v3

    .line 158
    mul-float v6, v4, v1

    .line 159
    .line 160
    mul-float/2addr v4, v5

    .line 161
    add-float/2addr v6, v4

    .line 162
    int-to-float v14, v2

    .line 163
    add-float v13, v6, v14

    .line 164
    .line 165
    add-float/2addr v6, v1

    .line 166
    sub-float v15, v6, v14

    .line 167
    .line 168
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->k:Landroid/graphics/Paint;

    .line 169
    .line 170
    move/from16 v16, v14

    .line 171
    .line 172
    move-object/from16 v12, p1

    .line 173
    .line 174
    move-object/from16 v17, v4

    .line 175
    .line 176
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_5
    int-to-float v4, v3

    .line 181
    mul-float v6, v4, v1

    .line 182
    .line 183
    mul-float/2addr v4, v5

    .line 184
    add-float/2addr v6, v4

    .line 185
    int-to-float v14, v2

    .line 186
    add-float v13, v6, v14

    .line 187
    .line 188
    add-float/2addr v6, v1

    .line 189
    sub-float v15, v6, v14

    .line 190
    .line 191
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->l:Landroid/graphics/Paint;

    .line 192
    .line 193
    move/from16 v16, v14

    .line 194
    .line 195
    move-object/from16 v12, p1

    .line 196
    .line 197
    move-object/from16 v17, v4

    .line 198
    .line 199
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 200
    .line 201
    .line 202
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_6
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setStepAnimationDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setStepCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setStepEndAnimationListener(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$c;)V
    .locals 0

    return-void
.end method

.method public setTargetStep(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->e:I

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->h:J

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->i:F

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->m:Landroid/view/Choreographer;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->n:Landroid/view/Choreographer$FrameCallback;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
