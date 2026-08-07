.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroid/graphics/Paint;

.field public g:F

.field public h:F

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/Paint;

.field public k:F

.field public l:J

.field public m:J

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Landroid/graphics/Path;

.field public q:Landroid/graphics/Path;

.field public r:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public s:Landroid/graphics/drawable/Drawable;

.field public t:Z

.field public u:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41200000    # 10.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 11
    .line 12
    const/high16 p1, 0x41300000    # 11.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    .line 19
    .line 20
    const/high16 p1, 0x41400000    # 12.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 27
    .line 28
    const/high16 p1, 0x40800000    # 4.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    .line 35
    .line 36
    const/high16 p1, 0x40a00000    # 5.0f

    .line 37
    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->e:I

    .line 43
    .line 44
    const/high16 p1, 0x40000000    # 2.0f

    .line 45
    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->k:F

    .line 47
    .line 48
    const-wide/16 v0, 0x0

    .line 49
    .line 50
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 51
    .line 52
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 53
    .line 54
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qa:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->n:Ljava/lang/String;

    .line 63
    .line 64
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 65
    .line 66
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->xe:I

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->o:Ljava/lang/String;

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->t:Z

    .line 76
    .line 77
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->u:Z

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget v0, Ll/obc0;->l5:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->s:Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 92
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41200000    # 10.0f

    .line 93
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    const/high16 p1, 0x41300000    # 11.0f

    .line 94
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 95
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    const/high16 p1, 0x40800000    # 4.0f

    .line 96
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    const/high16 p1, 0x40a00000    # 5.0f

    .line 97
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->e:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 98
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->k:F

    const-wide/16 p1, 0x0

    .line 99
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 100
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 101
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qa:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->n:Ljava/lang/String;

    .line 102
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->xe:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 103
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->t:Z

    .line 104
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->u:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 105
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41200000    # 10.0f

    .line 106
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    const/high16 p1, 0x41300000    # 11.0f

    .line 107
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 108
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    const/high16 p1, 0x40800000    # 4.0f

    .line 109
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    const/high16 p1, 0x40a00000    # 5.0f

    .line 110
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->e:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 111
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->k:F

    const-wide/16 p1, 0x0

    .line 112
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 113
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 114
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qa:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->n:Ljava/lang/String;

    .line 115
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->xe:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 116
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->t:Z

    .line 117
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->u:Z

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(JJZZ)V
    .locals 0

    .line 1
    iput-boolean p5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->t:Z

    .line 2
    .line 3
    iput-boolean p6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->u:Z

    .line 4
    .line 5
    iget-wide p5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 6
    .line 7
    cmp-long p5, p1, p5

    .line 8
    .line 9
    if-lez p5, :cond_0

    .line 10
    .line 11
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 12
    .line 13
    :cond_0
    iget-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 14
    .line 15
    cmp-long p1, p3, p1

    .line 16
    .line 17
    if-lez p1, :cond_1

    .line 18
    .line 19
    iput-wide p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public getLeftScore()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRightScore()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 19
    .line 20
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v3, -0x1

    .line 28
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 38
    .line 39
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 40
    .line 41
    int-to-float v4, v4

    .line 42
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    int-to-float v4, v4

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    int-to-float v5, v5

    .line 62
    const/4 v6, 0x0

    .line 63
    invoke-direct {v0, v6, v6, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    iget v5, v4, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 73
    .line 74
    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 75
    .line 76
    sub-float v4, v5, v4

    .line 77
    .line 78
    div-float/2addr v4, v1

    .line 79
    sub-float/2addr v4, v5

    .line 80
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    add-float/2addr v5, v4

    .line 85
    iput v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->g:F

    .line 86
    .line 87
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 88
    .line 89
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 90
    .line 91
    int-to-float v5, v5

    .line 92
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 93
    .line 94
    .line 95
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iget v5, v4, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 102
    .line 103
    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 104
    .line 105
    sub-float v4, v5, v4

    .line 106
    .line 107
    div-float/2addr v4, v1

    .line 108
    sub-float/2addr v4, v5

    .line 109
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    add-float/2addr v5, v4

    .line 114
    iput v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->h:F

    .line 115
    .line 116
    new-instance v4, Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->i:Landroid/graphics/Paint;

    .line 122
    .line 123
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    .line 125
    .line 126
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->i:Landroid/graphics/Paint;

    .line 127
    .line 128
    const v5, -0xd69d01

    .line 129
    .line 130
    .line 131
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 132
    .line 133
    .line 134
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->i:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 137
    .line 138
    .line 139
    new-instance v4, Landroid/graphics/Paint;

    .line 140
    .line 141
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->j:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->j:Landroid/graphics/Paint;

    .line 150
    .line 151
    const v4, -0xbf7f

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->j:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 160
    .line 161
    .line 162
    new-instance v2, Landroid/graphics/Path;

    .line 163
    .line 164
    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->p:Landroid/graphics/Path;

    .line 168
    .line 169
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->p:Landroid/graphics/Path;

    .line 173
    .line 174
    const/high16 v3, 0x41000000    # 8.0f

    .line 175
    .line 176
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    int-to-float v4, v4

    .line 181
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    int-to-float v3, v3

    .line 186
    sget-object v5, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 187
    .line 188
    invoke-virtual {v2, v0, v4, v3, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 189
    .line 190
    .line 191
    new-instance v0, Landroid/graphics/Path;

    .line 192
    .line 193
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 194
    .line 195
    .line 196
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 197
    .line 198
    :cond_1
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 199
    .line 200
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 205
    .line 206
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 211
    .line 212
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    .line 213
    .line 214
    int-to-float v4, v4

    .line 215
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 216
    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 219
    .line 220
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->n:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 227
    .line 228
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 229
    .line 230
    int-to-float v5, v5

    .line 231
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 232
    .line 233
    .line 234
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 235
    .line 236
    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 237
    .line 238
    .line 239
    move-result v4

    .line 240
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 241
    .line 242
    int-to-float v5, v5

    .line 243
    add-float/2addr v5, v3

    .line 244
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    .line 245
    .line 246
    int-to-float v7, v6

    .line 247
    add-float/2addr v5, v7

    .line 248
    add-float/2addr v5, v4

    .line 249
    int-to-float v4, v6

    .line 250
    add-float/2addr v5, v4

    .line 251
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 252
    .line 253
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    .line 254
    .line 255
    int-to-float v6, v6

    .line 256
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 257
    .line 258
    .line 259
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 260
    .line 261
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->o:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 264
    .line 265
    .line 266
    move-result v4

    .line 267
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 268
    .line 269
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 270
    .line 271
    int-to-float v7, v7

    .line 272
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 273
    .line 274
    .line 275
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 276
    .line 277
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 282
    .line 283
    int-to-float v7, v7

    .line 284
    add-float/2addr v7, v4

    .line 285
    iget v8, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    .line 286
    .line 287
    int-to-float v9, v8

    .line 288
    add-float/2addr v7, v9

    .line 289
    add-float/2addr v7, v6

    .line 290
    int-to-float v8, v8

    .line 291
    add-float/2addr v7, v8

    .line 292
    iget-wide v8, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->l:J

    .line 293
    .line 294
    const-wide/16 v10, 0x0

    .line 295
    .line 296
    cmp-long v12, v8, v10

    .line 297
    .line 298
    if-nez v12, :cond_2

    .line 299
    .line 300
    iget-wide v12, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 301
    .line 302
    cmp-long v12, v12, v10

    .line 303
    .line 304
    if-nez v12, :cond_2

    .line 305
    .line 306
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 307
    .line 308
    .line 309
    move-result v5

    .line 310
    int-to-float v5, v5

    .line 311
    div-float/2addr v5, v1

    .line 312
    goto :goto_0

    .line 313
    :cond_2
    cmp-long v12, v8, v10

    .line 314
    .line 315
    if-nez v12, :cond_3

    .line 316
    .line 317
    goto :goto_0

    .line 318
    :cond_3
    iget-wide v12, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->m:J

    .line 319
    .line 320
    cmp-long v10, v12, v10

    .line 321
    .line 322
    if-nez v10, :cond_4

    .line 323
    .line 324
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    int-to-float v5, v5

    .line 329
    sub-float/2addr v5, v7

    .line 330
    goto :goto_0

    .line 331
    :cond_4
    long-to-float v10, v8

    .line 332
    add-long/2addr v8, v12

    .line 333
    long-to-float v8, v8

    .line 334
    div-float/2addr v10, v8

    .line 335
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 336
    .line 337
    .line 338
    move-result v8

    .line 339
    int-to-float v8, v8

    .line 340
    sub-float/2addr v8, v5

    .line 341
    sub-float/2addr v8, v7

    .line 342
    mul-float/2addr v8, v10

    .line 343
    add-float/2addr v5, v8

    .line 344
    :goto_0
    iget-boolean v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->t:Z

    .line 345
    .line 346
    if-eqz v7, :cond_5

    .line 347
    .line 348
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 349
    .line 350
    .line 351
    move-result v5

    .line 352
    int-to-float v5, v5

    .line 353
    div-float/2addr v5, v1

    .line 354
    :cond_5
    move v8, v5

    .line 355
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->r:Ll/y20;

    .line 356
    .line 357
    if-eqz v1, :cond_6

    .line 358
    .line 359
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 360
    .line 361
    .line 362
    move-result-object v5

    .line 363
    invoke-interface {v1, v5}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 364
    .line 365
    .line 366
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 367
    .line 368
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 369
    .line 370
    .line 371
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 372
    .line 373
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    int-to-float v11, v1

    .line 378
    sget-object v12, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 379
    .line 380
    move v10, v8

    .line 381
    const/4 v8, 0x0

    .line 382
    const/4 v9, 0x0

    .line 383
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 384
    .line 385
    .line 386
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 387
    .line 388
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->p:Landroid/graphics/Path;

    .line 389
    .line 390
    sget-object v13, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 391
    .line 392
    invoke-virtual {v1, v5, v13}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 393
    .line 394
    .line 395
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 396
    .line 397
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->i:Landroid/graphics/Paint;

    .line 398
    .line 399
    invoke-virtual {p1, v1, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 400
    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 403
    .line 404
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 405
    .line 406
    .line 407
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 408
    .line 409
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    int-to-float v1, v1

    .line 414
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 415
    .line 416
    .line 417
    move-result v5

    .line 418
    int-to-float v11, v5

    .line 419
    move v8, v10

    .line 420
    move v10, v1

    .line 421
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 422
    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 425
    .line 426
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->p:Landroid/graphics/Path;

    .line 427
    .line 428
    invoke-virtual {v1, v5, v13}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 429
    .line 430
    .line 431
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->q:Landroid/graphics/Path;

    .line 432
    .line 433
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->j:Landroid/graphics/Paint;

    .line 434
    .line 435
    invoke-virtual {p1, v1, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 436
    .line 437
    .line 438
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 439
    .line 440
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    .line 441
    .line 442
    int-to-float v5, v5

    .line 443
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 444
    .line 445
    .line 446
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->n:Ljava/lang/String;

    .line 447
    .line 448
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 449
    .line 450
    int-to-float v5, v5

    .line 451
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->h:F

    .line 452
    .line 453
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 454
    .line 455
    invoke-virtual {p1, v1, v5, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 456
    .line 457
    .line 458
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 459
    .line 460
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 461
    .line 462
    int-to-float v5, v5

    .line 463
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 464
    .line 465
    .line 466
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 467
    .line 468
    int-to-float v1, v1

    .line 469
    add-float/2addr v1, v3

    .line 470
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->d:I

    .line 471
    .line 472
    int-to-float v3, v3

    .line 473
    add-float/2addr v1, v3

    .line 474
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->g:F

    .line 475
    .line 476
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->k:F

    .line 477
    .line 478
    add-float/2addr v3, v5

    .line 479
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 480
    .line 481
    invoke-virtual {p1, v0, v1, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 482
    .line 483
    .line 484
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 485
    .line 486
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b:I

    .line 487
    .line 488
    int-to-float v1, v1

    .line 489
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->o:Ljava/lang/String;

    .line 493
    .line 494
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 495
    .line 496
    .line 497
    move-result v1

    .line 498
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 499
    .line 500
    sub-int/2addr v1, v3

    .line 501
    int-to-float v1, v1

    .line 502
    sub-float/2addr v1, v4

    .line 503
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->h:F

    .line 504
    .line 505
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 506
    .line 507
    invoke-virtual {p1, v0, v1, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 508
    .line 509
    .line 510
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->u:Z

    .line 511
    .line 512
    if-nez v0, :cond_7

    .line 513
    .line 514
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 515
    .line 516
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->c:I

    .line 517
    .line 518
    int-to-float v1, v1

    .line 519
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 527
    .line 528
    sub-int/2addr v0, v1

    .line 529
    int-to-float v0, v0

    .line 530
    sub-float/2addr v0, v4

    .line 531
    sub-float/2addr v0, v6

    .line 532
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->e:I

    .line 533
    .line 534
    int-to-float v1, v1

    .line 535
    sub-float/2addr v0, v1

    .line 536
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->g:F

    .line 537
    .line 538
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->k:F

    .line 539
    .line 540
    add-float/2addr v1, v3

    .line 541
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->f:Landroid/graphics/Paint;

    .line 542
    .line 543
    invoke-virtual {p1, v2, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 544
    .line 545
    .line 546
    return-void

    .line 547
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a:I

    .line 552
    .line 553
    sub-int/2addr v0, v1

    .line 554
    int-to-float v0, v0

    .line 555
    sub-float/2addr v0, v4

    .line 556
    const/high16 v1, 0x41f00000    # 30.0f

    .line 557
    .line 558
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 559
    .line 560
    .line 561
    move-result v2

    .line 562
    int-to-float v2, v2

    .line 563
    sub-float/2addr v0, v2

    .line 564
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->e:I

    .line 565
    .line 566
    int-to-float v2, v2

    .line 567
    sub-float/2addr v0, v2

    .line 568
    float-to-int v0, v0

    .line 569
    const/high16 v2, 0x40a00000    # 5.0f

    .line 570
    .line 571
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 572
    .line 573
    .line 574
    move-result v2

    .line 575
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    add-int/2addr v1, v0

    .line 580
    const/high16 v3, 0x41400000    # 12.0f

    .line 581
    .line 582
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 583
    .line 584
    .line 585
    move-result v3

    .line 586
    add-int/2addr v3, v2

    .line 587
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->s:Landroid/graphics/drawable/Drawable;

    .line 588
    .line 589
    if-nez v4, :cond_8

    .line 590
    .line 591
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 592
    .line 593
    .line 594
    move-result-object v4

    .line 595
    sget v5, Ll/obc0;->l5:I

    .line 596
    .line 597
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 598
    .line 599
    .line 600
    move-result-object v4

    .line 601
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->s:Landroid/graphics/drawable/Drawable;

    .line 602
    .line 603
    :cond_8
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->s:Landroid/graphics/drawable/Drawable;

    .line 604
    .line 605
    invoke-virtual {v4, v0, v2, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 606
    .line 607
    .line 608
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->s:Landroid/graphics/drawable/Drawable;

    .line 609
    .line 610
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 611
    .line 612
    .line 613
    return-void
.end method

.method public setCursorListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->r:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
