.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static volatile x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;


# instance fields
.field public final a:Landroid/text/TextPaint;

.field public final b:Landroid/text/TextPaint;

.field public c:I

.field public d:I

.field public e:I

.field public f:F

.field public g:I

.field public h:F

.field public i:F

.field public j:F

.field public k:I

.field public l:Z

.field public final m:Landroid/graphics/Rect;

.field public final n:Landroid/graphics/Rect;

.field public final o:Landroid/graphics/Rect;

.field public p:J

.field public q:Ljava/lang/Long;

.field public r:Landroid/graphics/Bitmap;

.field public s:Landroid/graphics/Canvas;

.field public t:Landroid/graphics/Bitmap;

.field public u:Landroid/graphics/Canvas;

.field public v:F

.field public w:Ll/mgw;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/text/TextPaint;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 11
    .line 12
    new-instance p1, Landroid/text/TextPaint;

    .line 13
    .line 14
    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 21
    .line 22
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 23
    .line 24
    new-instance p1, Landroid/graphics/Rect;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->m:Landroid/graphics/Rect;

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->n:Landroid/graphics/Rect;

    .line 37
    .line 38
    new-instance p1, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 44
    .line 45
    const-wide/16 p1, 0x0

    .line 46
    .line 47
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->p:J

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private getLrcHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private getLrcWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method


# virtual methods
.method public final a(II)V
    .locals 1

    .line 1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    new-instance p1, Landroid/graphics/Canvas;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 17
    .line 18
    return-void
.end method

.method public final b(II)V
    .locals 1

    .line 1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    new-instance p1, Landroid/graphics/Canvas;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 17
    .line 18
    return-void
.end method

.method public final c()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/mgw;->d()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/2addr v0, v1

    .line 17
    int-to-float v0, v0

    .line 18
    const/high16 v1, 0x40000000    # 2.0f

    .line 19
    .line 20
    div-float/2addr v0, v1

    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->i:F

    .line 22
    .line 23
    add-float/2addr v0, v1

    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 25
    .line 26
    add-float/2addr v0, v1

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 28
    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->f:F

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 35
    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->e:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 50
    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 53
    .line 54
    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 57
    .line 58
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-ge v1, v3, :cond_2

    .line 67
    .line 68
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 69
    .line 70
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 79
    .line 80
    new-instance v4, Ll/mgw;

    .line 81
    .line 82
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcWidth()I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    invoke-direct {v4, v3, v5, v6}, Ll/mgw;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;Landroid/text/TextPaint;I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4}, Ll/mgw;->d()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    int-to-float v3, v3

    .line 96
    add-float/2addr v3, v0

    .line 97
    float-to-double v5, v3

    .line 98
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    int-to-double v7, v3

    .line 103
    const-wide/high16 v9, 0x3ff8000000000000L    # 1.5

    .line 104
    .line 105
    mul-double/2addr v7, v9

    .line 106
    cmpl-double v3, v5, v7

    .line 107
    .line 108
    if-lez v3, :cond_1

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 112
    .line 113
    invoke-virtual {v4, v3}, Ll/mgw;->a(Landroid/graphics/Canvas;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4}, Ll/mgw;->d()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    int-to-float v3, v3

    .line 121
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->i:F

    .line 122
    .line 123
    add-float/2addr v3, v4

    .line 124
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 125
    .line 126
    invoke-virtual {v4, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 127
    .line 128
    .line 129
    add-float/2addr v0, v3

    .line 130
    goto :goto_0

    .line 131
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->p:J

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Ll/mgw;->c(J)[Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    array-length v0, v0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-le v0, v2, :cond_1

    .line 18
    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/high16 v0, -0x3ee00000    # -10.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 30
    .line 31
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/mgw;->d()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-int/2addr v0, v2

    .line 42
    int-to-float v0, v0

    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr v0, v2

    .line 46
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 47
    .line 48
    add-float/2addr v0, v2

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 55
    .line 56
    invoke-virtual {v2, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ll/mgw;->a(Landroid/graphics/Canvas;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->s:Landroid/graphics/Canvas;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 69
    .line 70
    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->v:F

    .line 72
    .line 73
    return-void
.end method

.method public final e()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->p:J

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3}, Ll/mgw;->c(J)[Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_1
    array-length v2, v0

    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x1

    .line 27
    if-le v2, v4, :cond_2

    .line 28
    .line 29
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/high16 v2, -0x3ee00000    # -10.0f

    .line 33
    .line 34
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    int-to-float v2, v2

    .line 39
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 40
    .line 41
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/mgw;->d()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    sub-int/2addr v2, v4

    .line 52
    int-to-float v2, v2

    .line 53
    const/high16 v4, 0x40000000    # 2.0f

    .line 54
    .line 55
    div-float/2addr v2, v4

    .line 56
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 57
    .line 58
    add-float/2addr v2, v4

    .line 59
    array-length v4, v0

    .line 60
    :goto_1
    if-ge v1, v4, :cond_4

    .line 61
    .line 62
    aget-object v5, v0, v1

    .line 63
    .line 64
    iget v6, v5, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    iget v7, v5, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    if-ne v6, v7, :cond_3

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->m:Landroid/graphics/Rect;

    .line 72
    .line 73
    iput v6, v8, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    iget v6, v5, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    int-to-float v6, v6

    .line 78
    add-float/2addr v6, v2

    .line 79
    float-to-int v6, v6

    .line 80
    iput v6, v8, Landroid/graphics/Rect;->top:I

    .line 81
    .line 82
    iput v7, v8, Landroid/graphics/Rect;->right:I

    .line 83
    .line 84
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 85
    .line 86
    int-to-float v5, v5

    .line 87
    add-float/2addr v5, v2

    .line 88
    float-to-int v5, v5

    .line 89
    iput v5, v8, Landroid/graphics/Rect;->bottom:I

    .line 90
    .line 91
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 92
    .line 93
    invoke-virtual {v5}, Landroid/graphics/Canvas;->save()I

    .line 94
    .line 95
    .line 96
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 97
    .line 98
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->m:Landroid/graphics/Rect;

    .line 99
    .line 100
    invoke-virtual {v5, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 101
    .line 102
    .line 103
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 104
    .line 105
    invoke-virtual {v5, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 106
    .line 107
    .line 108
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 109
    .line 110
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 111
    .line 112
    invoke-virtual {v5, v6}, Ll/mgw;->b(Landroid/graphics/Canvas;)V

    .line 113
    .line 114
    .line 115
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->u:Landroid/graphics/Canvas;

    .line 116
    .line 117
    invoke-virtual {v5}, Landroid/graphics/Canvas;->restore()V

    .line 118
    .line 119
    .line 120
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_4
    :goto_3
    return-void
.end method

.method public final f(J)I
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    :goto_0
    const/4 v1, 0x0

    .line 23
    if-ltz v0, :cond_2

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-lez v2, :cond_1

    .line 54
    .line 55
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 68
    .line 69
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->begin:J

    .line 70
    .line 71
    cmp-long v1, v1, p1

    .line 72
    .line 73
    if-gez v1, :cond_1

    .line 74
    .line 75
    return v0

    .line 76
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return v1

    .line 80
    :cond_3
    :goto_1
    const/4 p0, -0x1

    .line 81
    return p0
.end method

.method public final g()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final h()V
    .locals 4

    .line 1
    sget v0, Ll/qa00;->l:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 5
    .line 6
    const/high16 v0, 0x41500000    # 13.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->f:F

    .line 14
    .line 15
    const/high16 v0, 0x40800000    # 4.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->i:F

    .line 23
    .line 24
    const/high16 v0, -0x3ee00000    # -10.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    int-to-float v0, v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->j:F

    .line 32
    .line 33
    const-string v0, "#ffffff"

    .line 34
    .line 35
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->c:I

    .line 40
    .line 41
    const-string v0, "#F200FF"

    .line 42
    .line 43
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->d:I

    .line 48
    .line 49
    const-string v1, "#9affffff"

    .line 50
    .line 51
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->e:I

    .line 56
    .line 57
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->g:I

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 71
    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->g:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 84
    .line 85
    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 91
    .line 92
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->f:F

    .line 93
    .line 94
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 98
    .line 99
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->c:I

    .line 100
    .line 101
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 110
    .line 111
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    iput-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->p:J

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->v:F

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->q:Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public j(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->p:J

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->f(J)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 15
    .line 16
    if-eq p1, p2, :cond_1

    .line 17
    .line 18
    const/4 p2, 0x1

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 20
    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 22
    .line 23
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->g()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcWidth()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v4, :cond_2

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance v1, Landroid/text/StaticLayout;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 26
    .line 27
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    const/4 v8, 0x0

    .line 31
    const-string v2, "\u6682\u65e0\u6b4c\u8bcd"

    .line 32
    .line 33
    const/high16 v6, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-direct/range {v1 .. v8}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-float p0, p0

    .line 46
    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    sub-int/2addr v0, v2

    .line 51
    int-to-float v0, v0

    .line 52
    const/high16 v2, 0x40000000    # 2.0f

    .line 53
    .line 54
    div-float/2addr v0, v2

    .line 55
    add-float/2addr p0, v0

    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-lt v0, v1, :cond_3

    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void

    .line 82
    :cond_3
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 83
    .line 84
    if-nez v0, :cond_4

    .line 85
    .line 86
    const/high16 v0, 0x41500000    # 13.0f

    .line 87
    .line 88
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    int-to-float v0, v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    const/high16 v0, 0x41700000    # 15.0f

    .line 97
    .line 98
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 104
    .line 105
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 106
    .line 107
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 113
    .line 114
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 117
    .line 118
    .line 119
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 126
    .line 127
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 132
    .line 133
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 134
    .line 135
    if-eqz v1, :cond_8

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 138
    .line 139
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->c:I

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 145
    .line 146
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->h:F

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Ll/mgw;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a:Landroid/text/TextPaint;

    .line 154
    .line 155
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b:Landroid/text/TextPaint;

    .line 156
    .line 157
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcWidth()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    invoke-direct {v1, v0, v2, v3, v4}, Ll/mgw;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;Landroid/text/TextPaint;Landroid/text/TextPaint;I)V

    .line 162
    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->w:Ll/mgw;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 167
    .line 168
    const/4 v1, 0x0

    .line 169
    if-eqz v0, :cond_5

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 172
    .line 173
    .line 174
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->k:I

    .line 175
    .line 176
    if-ltz v0, :cond_7

    .line 177
    .line 178
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 179
    .line 180
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-lt v0, v2, :cond_6

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->d()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->c()V

    .line 195
    .line 196
    .line 197
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_7
    :goto_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->l:Z

    .line 201
    .line 202
    return-void

    .line 203
    :cond_8
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->n:Landroid/graphics/Rect;

    .line 206
    .line 207
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 208
    .line 209
    const/4 v3, 0x0

    .line 210
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->e()V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->n:Landroid/graphics/Rect;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 221
    .line 222
    invoke-virtual {p1, v0, v1, p0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_b

    .line 5
    .line 6
    sub-int/2addr p4, p2

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    sub-int/2addr p4, p1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-int/2addr p4, p1

    .line 17
    sub-int/2addr p5, p3

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    sub-int/2addr p5, p1

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-int/2addr p5, p1

    .line 28
    if-lez p5, :cond_a

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b(II)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-ne p1, p4, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eq p1, p5, :cond_3

    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->t:Landroid/graphics/Bitmap;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->b(II)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 69
    .line 70
    if-nez p1, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a(II)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-ne p1, p4, :cond_5

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eq p1, p5, :cond_a

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_6

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 101
    .line 102
    .line 103
    :cond_6
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a(II)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    if-nez p1, :cond_7

    .line 109
    .line 110
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a(II)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-ne p1, p4, :cond_8

    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eq p1, p5, :cond_a

    .line 127
    .line 128
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-nez p1, :cond_9

    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->r:Landroid/graphics/Bitmap;

    .line 137
    .line 138
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 139
    .line 140
    .line 141
    :cond_9
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->a(II)V

    .line 142
    .line 143
    .line 144
    :cond_a
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->n:Landroid/graphics/Rect;

    .line 145
    .line 146
    const/4 p2, 0x0

    .line 147
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 148
    .line 149
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 150
    .line 151
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcWidth()I

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->n:Landroid/graphics/Rect;

    .line 158
    .line 159
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 174
    .line 175
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcWidth()I

    .line 188
    .line 189
    .line 190
    move-result p3

    .line 191
    add-int/2addr p2, p3

    .line 192
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->o:Landroid/graphics/Rect;

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->getLrcHeight()I

    .line 201
    .line 202
    .line 203
    move-result p3

    .line 204
    add-int/2addr p2, p3

    .line 205
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 208
    .line 209
    .line 210
    :cond_b
    return-void
.end method

.method public setLrcData(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;)V
    .locals 2

    .line 1
    sput-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->q:Ljava/lang/Long;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcWrapperBean;->getLrcBeans()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/lit8 v0, v0, -0x1

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean;->tones:Ljava/util/List;

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/lit8 v0, v0, -0x1

    .line 70
    .line 71
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/LrcView;->q:Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/LrcBean$Tone;->end:J

    .line 84
    .line 85
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 86
    .line 87
    .line 88
    return-void
.end method
