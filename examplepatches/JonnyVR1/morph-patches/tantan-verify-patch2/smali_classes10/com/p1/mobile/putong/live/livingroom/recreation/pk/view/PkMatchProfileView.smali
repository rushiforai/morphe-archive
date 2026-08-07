.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Lv/VImage;

.field public d:Lv/VImage;

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:J

.field public h:F

.field public i:F

.field public j:Z

.field public k:F

.field public l:Landroid/animation/ValueAnimator;

.field public m:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    const-wide/16 v0, 0x5dc

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->g:J

    .line 14
    .line 15
    const p1, 0x3f28f5c3    # 0.66f

    .line 16
    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h:F

    .line 19
    .line 20
    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 26
    .line 27
    new-instance p1, Ll/s380;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ll/s380;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->m:Ljava/lang/Runnable;

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    const-wide/16 p1, 0x5dc

    .line 37
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->g:J

    const p1, 0x3f28f5c3    # 0.66f

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 41
    new-instance p1, Ll/s380;

    invoke-direct {p1, p0}, Ll/s380;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->m:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    const-wide/16 p1, 0x5dc

    .line 44
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->g:J

    const p1, 0x3f28f5c3    # 0.66f

    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 48
    new-instance p1, Ll/s380;

    invoke-direct {p1, p0}, Ll/s380;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->m:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method private getNextPic()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ltz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-gt v0, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 17
    .line 18
    add-int/2addr v0, v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 26
    .line 27
    if-lt v0, v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 41
    .line 42
    add-int/2addr p0, v2

    .line 43
    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_2
    :goto_0
    return v1
.end method


# virtual methods
.method public b(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    new-instance v1, Ll/t380;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/t380;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->g:J

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic d(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->k:F

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h:F

    .line 14
    .line 15
    cmpg-float p1, p1, v0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-gtz p1, :cond_2

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    .line 28
    .line 29
    const/high16 v2, -0x40800000    # -1.0f

    .line 30
    .line 31
    mul-float/2addr v0, v2

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    .line 33
    .line 34
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-lt v0, v2, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 47
    .line 48
    add-int/2addr p1, v1

    .line 49
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 54
    .line 55
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    if-nez v0, :cond_3

    .line 72
    .line 73
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j:Z

    .line 74
    .line 75
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->getNextPic()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    return-void

    .line 82
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->b:Lv/VImage;

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->k:F

    .line 88
    .line 89
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h:F

    .line 90
    .line 91
    sub-float/2addr p1, v0

    .line 92
    const/high16 v1, 0x3f800000    # 1.0f

    .line 93
    .line 94
    sub-float/2addr v1, v0

    .line 95
    div-float/2addr p1, v1

    .line 96
    const/high16 v0, 0x43340000    # 180.0f

    .line 97
    .line 98
    mul-float/2addr p1, v0

    .line 99
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i:F

    .line 100
    .line 101
    mul-float/2addr p1, v0

    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    div-int/lit8 v1, v1, 0x2

    .line 109
    .line 110
    int-to-float v1, v1

    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    int-to-float v1, v1

    .line 121
    const v2, 0x3f99999a    # 1.2f

    .line 122
    .line 123
    .line 124
    mul-float/2addr v1, v2

    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Landroid/view/View;->setRotation(F)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 136
    .line 137
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f:I

    .line 138
    .line 139
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    check-cast p0, Ljava/lang/Integer;

    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final e()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 13
    .line 14
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 15
    .line 16
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 17
    .line 18
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    new-array v9, v0, [F

    .line 23
    .line 24
    fill-array-data v9, :array_0

    .line 25
    .line 26
    .line 27
    const-wide/16 v4, 0x0

    .line 28
    .line 29
    const-wide/16 v6, 0x190

    .line 30
    .line 31
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d:Lv/VImage;

    .line 39
    .line 40
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 41
    .line 42
    new-instance v8, Landroid/view/animation/BounceInterpolator;

    .line 43
    .line 44
    invoke-direct {v8}, Landroid/view/animation/BounceInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    new-array v9, v0, [F

    .line 48
    .line 49
    fill-array-data v9, :array_1

    .line 50
    .line 51
    .line 52
    const-wide/16 v4, 0xc8

    .line 53
    .line 54
    const-wide/16 v6, 0x320

    .line 55
    .line 56
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->b(J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->b:Lv/VImage;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->b:Lv/VImage;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->l:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->W0:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->a:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->i4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->b:Lv/VImage;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->A1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VImage;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->B1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VImage;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->d:Lv/VImage;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c:Lv/VImage;

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 54
    .line 55
    sget v1, Ll/obc0;->c5:I

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 65
    .line 66
    sget v1, Ll/obc0;->d5:I

    .line 67
    .line 68
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->e:Ljava/util/ArrayList;

    .line 76
    .line 77
    sget v1, Ll/obc0;->e5:I

    .line 78
    .line 79
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->c()V

    .line 87
    .line 88
    .line 89
    return-void
.end method
