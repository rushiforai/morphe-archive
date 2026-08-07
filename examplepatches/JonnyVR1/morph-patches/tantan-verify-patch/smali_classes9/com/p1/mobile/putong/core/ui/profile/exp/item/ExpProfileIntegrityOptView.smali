.class public Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView$a;
    }
.end annotation


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Paint;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    .line 10
    .line 11
    const/high16 p1, 0x41a00000    # 20.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    .line 18
    .line 19
    const/high16 p1, 0x41800000    # 16.0f

    .line 20
    .line 21
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    .line 26
    .line 27
    const/high16 p1, 0x40400000    # 3.0f

    .line 28
    .line 29
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    const/high16 p1, 0x41a00000    # 20.0f

    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    const/high16 p1, 0x40400000    # 3.0f

    .line 40
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 42
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    const/high16 p1, 0x41a00000    # 20.0f

    .line 43
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 44
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    const/high16 p1, 0x40400000    # 3.0f

    .line 45
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    return-void
.end method


# virtual methods
.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->i:I

    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->j:I

    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    const/high16 v1, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v0, v1

    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    .line 21
    .line 22
    int-to-float v2, v2

    .line 23
    add-float/2addr v0, v2

    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    div-float/2addr v2, v1

    .line 28
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 29
    .line 30
    invoke-virtual {p1, v3, v0, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    .line 34
    .line 35
    int-to-float v2, v0

    .line 36
    div-float/2addr v2, v1

    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    .line 38
    .line 39
    int-to-float v3, v3

    .line 40
    add-float/2addr v2, v3

    .line 41
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    .line 42
    .line 43
    int-to-float v3, v3

    .line 44
    div-float/2addr v3, v1

    .line 45
    int-to-float v0, v0

    .line 46
    div-float/2addr v0, v1

    .line 47
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    .line 48
    .line 49
    int-to-float v4, v4

    .line 50
    sub-float/2addr v0, v4

    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->g:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {p1, v2, v3, v0, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    .line 57
    .line 58
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    .line 59
    .line 60
    add-int/2addr v0, v2

    .line 61
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    add-int/2addr v2, v3

    .line 66
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->k:I

    .line 67
    .line 68
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->m:I

    .line 69
    .line 70
    add-int/2addr v3, v4

    .line 71
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    .line 72
    .line 73
    sub-int/2addr v3, v4

    .line 74
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->l:I

    .line 75
    .line 76
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    sub-int/2addr v4, v1

    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->n:I

    .line 82
    .line 83
    sub-int/2addr v4, v1

    .line 84
    new-instance v6, Landroid/graphics/RectF;

    .line 85
    .line 86
    int-to-float v0, v0

    .line 87
    int-to-float v1, v2

    .line 88
    int-to-float v2, v3

    .line 89
    int-to-float v3, v4

    .line 90
    invoke-direct {v6, v0, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->i:I

    .line 94
    .line 95
    if-nez v0, :cond_1

    .line 96
    .line 97
    const/high16 v0, 0x42100000    # 36.0f

    .line 98
    .line 99
    :goto_0
    move v8, v0

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    int-to-float v0, v0

    .line 102
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->j:I

    .line 103
    .line 104
    int-to-float v1, v1

    .line 105
    div-float/2addr v0, v1

    .line 106
    const/high16 v1, 0x43b40000    # 360.0f

    .line 107
    .line 108
    mul-float/2addr v0, v1

    .line 109
    goto :goto_0

    .line 110
    :goto_1
    const/4 v9, 0x0

    .line 111
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->h:Landroid/graphics/Paint;

    .line 112
    .line 113
    const/4 v7, 0x0

    .line 114
    move-object v5, p1

    .line 115
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5}, Landroid/graphics/Canvas;->restore()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->I5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->c:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/adc0;->je:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->d:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/adc0;->u:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->e:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/adc0;->f4:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->f:Lv/VText;

    .line 43
    .line 44
    new-instance v0, Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->g:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Ll/c9c0;->o0:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->g:Landroid/graphics/Paint;

    .line 65
    .line 66
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->g:Landroid/graphics/Paint;

    .line 72
    .line 73
    const v2, 0x404ccccd    # 3.2f

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    int-to-float v3, v3

    .line 81
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->g:Landroid/graphics/Paint;

    .line 85
    .line 86
    const/4 v3, 0x1

    .line 87
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Landroid/graphics/Paint;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->h:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    sget v5, Ll/c9c0;->b:I

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->h:Landroid/graphics/Paint;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->h:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    int-to-float v1, v1

    .line 122
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/ExpProfileIntegrityOptView;->h:Landroid/graphics/Paint;

    .line 126
    .line 127
    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
