.class public Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;
.super Lv/VLinear;
.source "SourceFile"


# static fields
.field public static w:F


# instance fields
.field public c:I

.field public d:I

.field public e:F

.field public f:Z

.field public g:Landroid/view/View;

.field public h:I

.field public i:I

.field public j:I

.field public k:Ljava/lang/String;

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public m:I

.field public n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field public o:Z

.field public p:Z

.field public q:I

.field public r:I

.field public s:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public u:I

.field public v:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42580000    # 54.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    .line 11
    .line 12
    const/high16 p1, 0x42f00000    # 120.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    neg-int p1, p1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->e:F

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->f:Z

    .line 26
    .line 27
    const-string v0, "default_style"

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->k:Ljava/lang/String;

    .line 30
    .line 31
    const v0, 0x44e74000    # 1850.0f

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->m:I

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 43
    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->o:Z

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->p:Z

    .line 52
    .line 53
    new-instance v1, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->s:Ljava/util/HashMap;

    .line 59
    .line 60
    new-instance v1, Ll/pf60;

    .line 61
    .line 62
    invoke-direct {v1, v0, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->t:Ll/pf60;

    .line 66
    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 68
    .line 69
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->v:I

    .line 70
    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 72
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42580000    # 54.0f

    .line 73
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    const/high16 p1, 0x42f00000    # 120.0f

    .line 74
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    neg-int p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    const/4 p1, 0x0

    .line 75
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->e:F

    const/4 p1, 0x1

    .line 76
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->f:Z

    .line 77
    const-string p2, "default_style"

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->k:Ljava/lang/String;

    const p2, 0x44e74000    # 1850.0f

    .line 78
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->m:I

    .line 79
    sget-object p2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 80
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->o:Z

    const/4 p1, 0x0

    .line 81
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 82
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->p:Z

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->s:Ljava/util/HashMap;

    .line 84
    new-instance v0, Ll/pf60;

    invoke-direct {v0, p2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->t:Ll/pf60;

    .line 85
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 86
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->v:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 87
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42580000    # 54.0f

    .line 88
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    const/high16 p1, 0x42f00000    # 120.0f

    .line 89
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    neg-int p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    const/4 p1, 0x0

    .line 90
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->e:F

    const/4 p1, 0x1

    .line 91
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->f:Z

    .line 92
    const-string p2, "default_style"

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->k:Ljava/lang/String;

    const p2, 0x44e74000    # 1850.0f

    .line 93
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->m:I

    .line 94
    sget-object p2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 95
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->o:Z

    const/4 p1, 0x0

    .line 96
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 97
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->p:Z

    .line 98
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->s:Ljava/util/HashMap;

    .line 99
    new-instance p3, Ll/pf60;

    invoke-direct {p3, p2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->t:Ll/pf60;

    .line 100
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 101
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->v:I

    return-void
.end method


# virtual methods
.method public P()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->w:F

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getImageContainerWith()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public getShadowBottomAuxiliary()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->s:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->s:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->Z5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->g:Landroid/view/View;

    .line 11
    .line 12
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->r:I

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->v:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eq v0, p2, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->v:I

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 19
    .line 20
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 21
    .line 22
    if-ne v3, v4, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->m:I

    .line 26
    .line 27
    if-le p2, v3, :cond_2

    .line 28
    .line 29
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->r:I

    .line 30
    .line 31
    :cond_2
    :goto_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->i:I

    .line 36
    .line 37
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->r:I

    .line 38
    .line 39
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    .line 40
    .line 41
    sub-int/2addr v3, v5

    .line 42
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 45
    .line 46
    sget-object v6, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 47
    .line 48
    if-ne v5, v6, :cond_3

    .line 49
    .line 50
    const v5, 0x3f333333    # 0.7f

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    const v5, 0x3f19999a    # 0.6f

    .line 55
    .line 56
    .line 57
    :goto_2
    int-to-float p2, p2

    .line 58
    div-float/2addr p2, v5

    .line 59
    float-to-int p2, p2

    .line 60
    if-lt v3, p2, :cond_4

    .line 61
    .line 62
    sub-int/2addr v3, p2

    .line 63
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 64
    .line 65
    sub-int/2addr v3, v5

    .line 66
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    neg-int v3, v3

    .line 71
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    .line 72
    .line 73
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    .line 78
    .line 79
    :cond_4
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 80
    .line 81
    if-ne v3, v4, :cond_6

    .line 82
    .line 83
    sget v3, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->w:F

    .line 84
    .line 85
    const/4 v4, 0x0

    .line 86
    cmpg-float v3, v3, v4

    .line 87
    .line 88
    if-lez v3, :cond_5

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    :cond_5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 93
    .line 94
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    .line 95
    .line 96
    add-int/2addr v0, v3

    .line 97
    if-lez v0, :cond_6

    .line 98
    .line 99
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->i:I

    .line 100
    .line 101
    if-lez v3, :cond_6

    .line 102
    .line 103
    int-to-float v3, v3

    .line 104
    const/high16 v4, 0x3f800000    # 1.0f

    .line 105
    .line 106
    mul-float/2addr v3, v4

    .line 107
    int-to-float v0, v0

    .line 108
    div-float/2addr v3, v0

    .line 109
    sput v3, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->w:F

    .line 110
    .line 111
    :cond_6
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 112
    .line 113
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->e:F

    .line 114
    .line 115
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->d:I

    .line 116
    .line 117
    int-to-float v4, v4

    .line 118
    mul-float/2addr v3, v4

    .line 119
    float-to-int v3, v3

    .line 120
    add-int/2addr v0, v3

    .line 121
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 122
    .line 123
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 124
    .line 125
    sub-int/2addr v0, v3

    .line 126
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->h:I

    .line 127
    .line 128
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->j:I

    .line 129
    .line 130
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->p:Z

    .line 131
    .line 132
    const/high16 v4, 0x40000000    # 2.0f

    .line 133
    .line 134
    if-eqz v3, :cond_7

    .line 135
    .line 136
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->o:Z

    .line 137
    .line 138
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->f:Z

    .line 139
    .line 140
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->h:I

    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->g:Landroid/view/View;

    .line 147
    .line 148
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 157
    .line 158
    .line 159
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->i:I

    .line 160
    .line 161
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->h:I

    .line 162
    .line 163
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 164
    .line 165
    add-int/2addr p2, v0

    .line 166
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->l:Ll/y20;

    .line 170
    .line 171
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_8

    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->l:Ll/y20;

    .line 178
    .line 179
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->h:I

    .line 180
    .line 181
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->u:I

    .line 182
    .line 183
    add-int/2addr p2, p0

    .line 184
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_7
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->g:Landroid/view/View;

    .line 201
    .line 202
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 203
    .line 204
    .line 205
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->i:I

    .line 206
    .line 207
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 208
    .line 209
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->l:Ll/y20;

    .line 213
    .line 214
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-eqz p1, :cond_8

    .line 219
    .line 220
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->l:Ll/y20;

    .line 221
    .line 222
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->q:I

    .line 223
    .line 224
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    :cond_8
    return-void
.end method

.method public setBackgroundShadows(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCardStyle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCardStyleChangeProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->e:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMeasureDoneCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setNextInfoExposureSize(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    .line 7
    .line 8
    return-void
.end method

.method public setNextInfoExposureSizePx(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderFrom(Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->n:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 2
    .line 3
    return-void
.end method

.method public setShortCardStyle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->p:Z

    .line 2
    .line 3
    return-void
.end method
