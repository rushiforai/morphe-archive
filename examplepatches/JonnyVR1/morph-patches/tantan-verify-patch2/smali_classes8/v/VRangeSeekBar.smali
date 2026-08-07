.class public Lv/VRangeSeekBar;
.super Landroid/widget/ImageView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VRangeSeekBar$Thumb;,
        Lv/VRangeSeekBar$NumberType;,
        Lv/VRangeSeekBar$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Number;",
        ">",
        "Landroid/widget/ImageView;"
    }
.end annotation


# instance fields
.field public A:Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public B:Z

.field public final a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Bitmap;

.field public c:Landroid/graphics/Bitmap;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public k:Lv/VRangeSeekBar$NumberType;

.field public l:D

.field public m:D

.field public n:D

.field public o:D

.field public p:Lv/VRangeSeekBar$Thumb;

.field public q:Z

.field public r:Lv/VRangeSeekBar$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lv/VRangeSeekBar$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public s:I

.field public t:I

.field public u:F

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/high16 p1, 0x40400000    # 3.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    iput p1, p0, Lv/VRangeSeekBar;->g:F

    .line 20
    .line 21
    const-wide/16 v0, 0x0

    .line 22
    .line 23
    iput-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 24
    .line 25
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 26
    .line 27
    iput-wide v0, p0, Lv/VRangeSeekBar;->o:D

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lv/VRangeSeekBar;->q:Z

    .line 34
    .line 35
    const v1, -0x333334

    .line 36
    .line 37
    .line 38
    iput v1, p0, Lv/VRangeSeekBar;->t:I

    .line 39
    .line 40
    const/16 v1, 0xff

    .line 41
    .line 42
    iput v1, p0, Lv/VRangeSeekBar;->v:I

    .line 43
    .line 44
    iput-boolean v0, p0, Lv/VRangeSeekBar;->B:Z

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->a(Landroid/util/AttributeSet;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    const/high16 p1, 0x40400000    # 3.0f

    .line 52
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lv/VRangeSeekBar;->g:F

    const-wide/16 v0, 0x0

    .line 53
    iput-wide v0, p0, Lv/VRangeSeekBar;->n:D

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 54
    iput-wide v0, p0, Lv/VRangeSeekBar;->o:D

    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    const/4 p1, 0x0

    .line 56
    iput-boolean p1, p0, Lv/VRangeSeekBar;->q:Z

    const v0, -0x333334

    .line 57
    iput v0, p0, Lv/VRangeSeekBar;->t:I

    const/16 v0, 0xff

    .line 58
    iput v0, p0, Lv/VRangeSeekBar;->v:I

    .line 59
    iput-boolean p1, p0, Lv/VRangeSeekBar;->B:Z

    .line 60
    invoke-virtual {p0, p2}, Lv/VRangeSeekBar;->a(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 61
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    new-instance p1, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p1, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    const/high16 p1, 0x40400000    # 3.0f

    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lv/VRangeSeekBar;->g:F

    const-wide/16 v0, 0x0

    .line 64
    iput-wide v0, p0, Lv/VRangeSeekBar;->n:D

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 65
    iput-wide v0, p0, Lv/VRangeSeekBar;->o:D

    const/4 p1, 0x0

    .line 66
    iput-object p1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Lv/VRangeSeekBar;->q:Z

    const p3, -0x333334

    .line 68
    iput p3, p0, Lv/VRangeSeekBar;->t:I

    const/16 p3, 0xff

    .line 69
    iput p3, p0, Lv/VRangeSeekBar;->v:I

    .line 70
    iput-boolean p1, p0, Lv/VRangeSeekBar;->B:Z

    .line 71
    invoke-virtual {p0, p2}, Lv/VRangeSeekBar;->a(Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lv/VRangeSeekBar;->w:I

    .line 21
    .line 22
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ll/hhc0;->A4:[I

    .line 29
    .line 30
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget v0, Ll/hhc0;->C4:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    sget v0, Ll/hhc0;->C4:I

    .line 43
    .line 44
    sget v1, Ll/abc0;->n6:I

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lv/VRangeSeekBar;->x:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget v0, Ll/abc0;->n6:I

    .line 54
    .line 55
    iput v0, p0, Lv/VRangeSeekBar;->x:I

    .line 56
    .line 57
    :goto_0
    sget v0, Ll/hhc0;->D4:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    sget v0, Ll/hhc0;->D4:I

    .line 66
    .line 67
    sget v1, Ll/abc0;->o6:I

    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, Lv/VRangeSeekBar;->y:I

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    sget v0, Ll/abc0;->o6:I

    .line 77
    .line 78
    iput v0, p0, Lv/VRangeSeekBar;->y:I

    .line 79
    .line 80
    :goto_1
    sget v0, Ll/hhc0;->B4:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    sget v0, Ll/hhc0;->B4:I

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/z8c0;->D:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lv/VRangeSeekBar;->s:I

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_2
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getRangeColor()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Lv/VRangeSeekBar;->s:I

    .line 112
    .line 113
    :goto_2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_3
    sget p1, Ll/abc0;->n6:I

    .line 118
    .line 119
    iput p1, p0, Lv/VRangeSeekBar;->x:I

    .line 120
    .line 121
    sget p1, Ll/abc0;->o6:I

    .line 122
    .line 123
    iput p1, p0, Lv/VRangeSeekBar;->y:I

    .line 124
    .line 125
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getRangeColor()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iput p1, p0, Lv/VRangeSeekBar;->s:I

    .line 130
    .line 131
    :goto_3
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getThumbImage()Landroid/graphics/Bitmap;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lv/VRangeSeekBar;->b:Landroid/graphics/Bitmap;

    .line 136
    .line 137
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getThumbPressedImage()Landroid/graphics/Bitmap;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lv/VRangeSeekBar;->c:Landroid/graphics/Bitmap;

    .line 142
    .line 143
    iget-object p1, p0, Lv/VRangeSeekBar;->b:Landroid/graphics/Bitmap;

    .line 144
    .line 145
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    int-to-float p1, p1

    .line 150
    iput p1, p0, Lv/VRangeSeekBar;->d:F

    .line 151
    .line 152
    const/high16 v0, 0x3f000000    # 0.5f

    .line 153
    .line 154
    mul-float/2addr p1, v0

    .line 155
    iput p1, p0, Lv/VRangeSeekBar;->e:F

    .line 156
    .line 157
    iget-object p1, p0, Lv/VRangeSeekBar;->b:Landroid/graphics/Bitmap;

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    int-to-float p1, p1

    .line 164
    mul-float/2addr p1, v0

    .line 165
    iput p1, p0, Lv/VRangeSeekBar;->f:F

    .line 166
    .line 167
    iget p1, p0, Lv/VRangeSeekBar;->e:F

    .line 168
    .line 169
    iput p1, p0, Lv/VRangeSeekBar;->h:F

    .line 170
    .line 171
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final c(FZLandroid/graphics/Canvas;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lv/VRangeSeekBar;->c:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p2, p0, Lv/VRangeSeekBar;->b:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    :goto_0
    iget v0, p0, Lv/VRangeSeekBar;->e:F

    .line 9
    .line 10
    sub-float/2addr p1, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    const/high16 v1, 0x3f000000    # 0.5f

    .line 17
    .line 18
    mul-float/2addr v0, v1

    .line 19
    iget v1, p0, Lv/VRangeSeekBar;->f:F

    .line 20
    .line 21
    sub-float/2addr v0, v1

    .line 22
    iget-object p0, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {p3, p2, p1, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final d(F)Lv/VRangeSeekBar$Thumb;
    .locals 3

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, v1}, Lv/VRangeSeekBar;->f(FD)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-wide v1, p0, Lv/VRangeSeekBar;->o:D

    .line 8
    .line 9
    invoke-virtual {p0, p1, v1, v2}, Lv/VRangeSeekBar;->f(FD)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lv/VRangeSeekBar$Thumb;->BOTH:Lv/VRangeSeekBar$Thumb;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object p0, Lv/VRangeSeekBar$Thumb;->MIN:Lv/VRangeSeekBar$Thumb;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    if-eqz p0, :cond_2

    .line 26
    .line 27
    sget-object p0, Lv/VRangeSeekBar$Thumb;->MAX:Lv/VRangeSeekBar$Thumb;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final e(Ljava/lang/Number;Ljava/lang/Number;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lv/VRangeSeekBar;->j:Ljava/lang/Number;

    .line 2
    .line 3
    iput-object p1, p0, Lv/VRangeSeekBar;->i:Ljava/lang/Number;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lv/VRangeSeekBar;->l:D

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 12
    .line 13
    .line 14
    move-result-wide p1

    .line 15
    iput-wide p1, p0, Lv/VRangeSeekBar;->m:D

    .line 16
    .line 17
    iget-object p1, p0, Lv/VRangeSeekBar;->i:Ljava/lang/Number;

    .line 18
    .line 19
    invoke-static {p1}, Lv/VRangeSeekBar$NumberType;->fromNumber(Ljava/lang/Number;)Lv/VRangeSeekBar$NumberType;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lv/VRangeSeekBar;->k:Lv/VRangeSeekBar$NumberType;

    .line 24
    .line 25
    return-void
.end method

.method public final f(FD)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p3}, Lv/VRangeSeekBar;->g(D)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    sub-float/2addr p1, p2

    .line 6
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget p0, p0, Lv/VRangeSeekBar;->e:F

    .line 11
    .line 12
    cmpg-float p0, p1, p0

    .line 13
    .line 14
    if-gtz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final g(D)F
    .locals 4

    .line 1
    iget v0, p0, Lv/VRangeSeekBar;->h:F

    .line 2
    .line 3
    float-to-double v0, v0

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    int-to-float v2, v2

    .line 9
    const/high16 v3, 0x40000000    # 2.0f

    .line 10
    .line 11
    iget p0, p0, Lv/VRangeSeekBar;->h:F

    .line 12
    .line 13
    mul-float/2addr p0, v3

    .line 14
    sub-float/2addr v2, p0

    .line 15
    float-to-double v2, v2

    .line 16
    mul-double/2addr p1, v2

    .line 17
    add-double/2addr v0, p1

    .line 18
    double-to-float p0, v0

    .line 19
    return p0
.end method

.method public getAbsoluteMaxValue()Ljava/lang/Number;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VRangeSeekBar;->j:Ljava/lang/Number;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAbsoluteMinValue()Ljava/lang/Number;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VRangeSeekBar;->i:Ljava/lang/Number;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRangeColor()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/z8c0;->D:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getSelectedMaxValue()Ljava/lang/Number;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->o:D

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->h(D)Ljava/lang/Number;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSelectedMinValue()Ljava/lang/Number;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->h(D)Ljava/lang/Number;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getThumbImage()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p0, p0, Lv/VRangeSeekBar;->x:I

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getThumbPressedImage()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p0, p0, Lv/VRangeSeekBar;->y:I

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final h(D)Ljava/lang/Number;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lv/VRangeSeekBar;->k:Lv/VRangeSeekBar$NumberType;

    .line 2
    .line 3
    iget-wide v1, p0, Lv/VRangeSeekBar;->l:D

    .line 4
    .line 5
    iget-wide v3, p0, Lv/VRangeSeekBar;->m:D

    .line 6
    .line 7
    sub-double/2addr v3, v1

    .line 8
    mul-double/2addr p1, v3

    .line 9
    add-double/2addr v1, p1

    .line 10
    invoke-virtual {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;->toNumber(D)Ljava/lang/Number;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final i(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xff00

    .line 6
    .line 7
    .line 8
    and-int/2addr v0, v1

    .line 9
    shr-int/lit8 v0, v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lv/VRangeSeekBar;->v:I

    .line 16
    .line 17
    if-ne v1, v2, :cond_1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Lv/VRangeSeekBar;->u:F

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lv/VRangeSeekBar;->v:I

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/VRangeSeekBar;->z:Z

    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lv/VRangeSeekBar;->z:Z

    .line 3
    .line 4
    return-void
.end method

.method public final l(F)D
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iget p0, p0, Lv/VRangeSeekBar;->h:F

    .line 7
    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    mul-float v2, p0, v1

    .line 11
    .line 12
    cmpg-float v2, v0, v2

    .line 13
    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    if-gtz v2, :cond_0

    .line 17
    .line 18
    return-wide v3

    .line 19
    :cond_0
    sub-float/2addr p1, p0

    .line 20
    mul-float/2addr p0, v1

    .line 21
    sub-float/2addr v0, p0

    .line 22
    div-float/2addr p1, v0

    .line 23
    float-to-double p0, p1

    .line 24
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 25
    .line 26
    invoke-static {v3, v4, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 27
    .line 28
    .line 29
    move-result-wide p0

    .line 30
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(DD)D

    .line 31
    .line 32
    .line 33
    move-result-wide p0

    .line 34
    return-wide p0
.end method

.method public final m(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget v0, p0, Lv/VRangeSeekBar;->v:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    sget-object v0, Lv/VRangeSeekBar$Thumb;->MIN:Lv/VRangeSeekBar$Thumb;

    .line 12
    .line 13
    iget-object v1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->l(F)D

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->setNormalizedMinValue(D)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    sget-object v0, Lv/VRangeSeekBar$Thumb;->MAX:Lv/VRangeSeekBar$Thumb;

    .line 30
    .line 31
    iget-object v1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->l(F)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->setNormalizedMaxValue(D)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final n(Ljava/lang/Number;)D
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)D"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->m:D

    .line 2
    .line 3
    iget-wide v2, p0, Lv/VRangeSeekBar;->l:D

    .line 4
    .line 5
    sub-double/2addr v0, v2

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmpl-double v0, v2, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-wide v2

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide v2, p0, Lv/VRangeSeekBar;->l:D

    .line 18
    .line 19
    sub-double/2addr v0, v2

    .line 20
    iget-wide p0, p0, Lv/VRangeSeekBar;->m:D

    .line 21
    .line 22
    sub-double/2addr p0, v2

    .line 23
    div-double/2addr v0, p0

    .line 24
    return-wide v0
.end method

.method public declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Landroid/graphics/RectF;

    .line 6
    .line 7
    iget v1, p0, Lv/VRangeSeekBar;->h:F

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    iget v3, p0, Lv/VRangeSeekBar;->g:F

    .line 15
    .line 16
    sub-float/2addr v2, v3

    .line 17
    const/high16 v3, 0x3f000000    # 0.5f

    .line 18
    .line 19
    mul-float/2addr v2, v3

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    int-to-float v4, v4

    .line 25
    iget v5, p0, Lv/VRangeSeekBar;->h:F

    .line 26
    .line 27
    sub-float/2addr v4, v5

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    int-to-float v5, v5

    .line 33
    iget v6, p0, Lv/VRangeSeekBar;->g:F

    .line 34
    .line 35
    add-float/2addr v5, v6

    .line 36
    mul-float/2addr v5, v3

    .line 37
    invoke-direct {v0, v1, v2, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 41
    .line 42
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget v2, p0, Lv/VRangeSeekBar;->t:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 63
    .line 64
    .line 65
    iget-wide v1, p0, Lv/VRangeSeekBar;->n:D

    .line 66
    .line 67
    invoke-virtual {p0, v1, v2}, Lv/VRangeSeekBar;->g(D)F

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 72
    .line 73
    iget-wide v1, p0, Lv/VRangeSeekBar;->o:D

    .line 74
    .line 75
    invoke-virtual {p0, v1, v2}, Lv/VRangeSeekBar;->g(D)F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 80
    .line 81
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 82
    .line 83
    iget v2, p0, Lv/VRangeSeekBar;->s:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lv/VRangeSeekBar;->a:Landroid/graphics/Paint;

    .line 89
    .line 90
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    iget-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 94
    .line 95
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->g(D)F

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    sget-object v1, Lv/VRangeSeekBar$Thumb;->MIN:Lv/VRangeSeekBar$Thumb;

    .line 100
    .line 101
    iget-object v2, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    invoke-virtual {p0, v0, v1, p1}, Lv/VRangeSeekBar;->c(FZLandroid/graphics/Canvas;)V

    .line 108
    .line 109
    .line 110
    iget-wide v0, p0, Lv/VRangeSeekBar;->o:D

    .line 111
    .line 112
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->g(D)F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    sget-object v1, Lv/VRangeSeekBar$Thumb;->MAX:Lv/VRangeSeekBar$Thumb;

    .line 117
    .line 118
    iget-object v2, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-virtual {p0, v0, v1, p1}, Lv/VRangeSeekBar;->c(FZLandroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    .line 126
    .line 127
    monitor-exit p0

    .line 128
    return-void

    .line 129
    :catchall_0
    move-exception p1

    .line 130
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    throw p1
.end method

.method public declared-synchronized onMeasure(II)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/16 p1, 0xc8

    .line 16
    .line 17
    :goto_0
    iget-object v0, p0, Lv/VRangeSeekBar;->b:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    :cond_1
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setMeasuredDimension(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p1
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "SUPER"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "MIN"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getDouble(Ljava/lang/String;)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 19
    .line 20
    const-string v0, "MAX"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getDouble(Ljava/lang/String;)D

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Lv/VRangeSeekBar;->o:D

    .line 27
    .line 28
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "SUPER"

    .line 7
    .line 8
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "MIN"

    .line 16
    .line 17
    iget-wide v2, p0, Lv/VRangeSeekBar;->n:D

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 20
    .line 21
    .line 22
    const-string v1, "MAX"

    .line 23
    .line 24
    iget-wide v2, p0, Lv/VRangeSeekBar;->o:D

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_b

    .line 17
    .line 18
    if-eq v0, v2, :cond_9

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v0, v3, :cond_5

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v0, v3, :cond_3

    .line 25
    .line 26
    const/4 v1, 0x5

    .line 27
    if-eq v0, v1, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x6

    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->i(Landroid/view/MotionEvent;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 38
    .line 39
    .line 40
    goto/16 :goto_3

    .line 41
    .line 42
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sub-int/2addr v0, v2

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput v1, p0, Lv/VRangeSeekBar;->u:F

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Lv/VRangeSeekBar;->v:I

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 60
    .line 61
    .line 62
    goto/16 :goto_3

    .line 63
    .line 64
    :cond_3
    iget-boolean p1, p0, Lv/VRangeSeekBar;->z:Z

    .line 65
    .line 66
    if-eqz p1, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0}, Lv/VRangeSeekBar;->k()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 72
    .line 73
    .line 74
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 75
    .line 76
    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_5
    iget-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 80
    .line 81
    if-eqz v0, :cond_e

    .line 82
    .line 83
    iget-boolean v0, p0, Lv/VRangeSeekBar;->z:Z

    .line 84
    .line 85
    if-eqz v0, :cond_6

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->m(Landroid/view/MotionEvent;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_6
    iget v0, p0, Lv/VRangeSeekBar;->v:I

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget v1, p0, Lv/VRangeSeekBar;->u:F

    .line 102
    .line 103
    sub-float v1, v0, v1

    .line 104
    .line 105
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iget v3, p0, Lv/VRangeSeekBar;->w:I

    .line 110
    .line 111
    int-to-float v3, v3

    .line 112
    cmpl-float v1, v1, v3

    .line 113
    .line 114
    if-lez v1, :cond_8

    .line 115
    .line 116
    iget v1, p0, Lv/VRangeSeekBar;->u:F

    .line 117
    .line 118
    sub-float/2addr v0, v1

    .line 119
    const/4 v1, 0x0

    .line 120
    cmpl-float v0, v0, v1

    .line 121
    .line 122
    if-lez v0, :cond_7

    .line 123
    .line 124
    sget-object v0, Lv/VRangeSeekBar$Thumb;->MAX:Lv/VRangeSeekBar$Thumb;

    .line 125
    .line 126
    iput-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_7
    sget-object v0, Lv/VRangeSeekBar$Thumb;->MIN:Lv/VRangeSeekBar$Thumb;

    .line 130
    .line 131
    iput-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 132
    .line 133
    :goto_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lv/VRangeSeekBar;->j()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->m(Landroid/view/MotionEvent;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Lv/VRangeSeekBar;->b()V

    .line 146
    .line 147
    .line 148
    :cond_8
    :goto_1
    iget-boolean p1, p0, Lv/VRangeSeekBar;->q:Z

    .line 149
    .line 150
    if-eqz p1, :cond_e

    .line 151
    .line 152
    iget-object p1, p0, Lv/VRangeSeekBar;->r:Lv/VRangeSeekBar$b;

    .line 153
    .line 154
    if-eqz p1, :cond_e

    .line 155
    .line 156
    iget-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 157
    .line 158
    sget-object v1, Lv/VRangeSeekBar$Thumb;->BOTH:Lv/VRangeSeekBar$Thumb;

    .line 159
    .line 160
    if-eq v0, v1, :cond_e

    .line 161
    .line 162
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMinValue()Ljava/lang/Number;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMaxValue()Ljava/lang/Number;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-interface {p1, p0, v0, v1, v2}, Lv/VRangeSeekBar$b;->a(Lv/VRangeSeekBar;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 171
    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_9
    iget-boolean v0, p0, Lv/VRangeSeekBar;->z:Z

    .line 175
    .line 176
    if-eqz v0, :cond_a

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->m(Landroid/view/MotionEvent;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Lv/VRangeSeekBar;->k()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 185
    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_a
    invoke-virtual {p0}, Lv/VRangeSeekBar;->j()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->m(Landroid/view/MotionEvent;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Lv/VRangeSeekBar;->k()V

    .line 195
    .line 196
    .line 197
    :goto_2
    const/4 p1, 0x0

    .line 198
    iput-object p1, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 199
    .line 200
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lv/VRangeSeekBar;->r:Lv/VRangeSeekBar$b;

    .line 204
    .line 205
    if-eqz p1, :cond_e

    .line 206
    .line 207
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMinValue()Ljava/lang/Number;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMaxValue()Ljava/lang/Number;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-interface {p1, p0, v0, v3, v1}, Lv/VRangeSeekBar$b;->a(Lv/VRangeSeekBar;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    sub-int/2addr v0, v2

    .line 224
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iput v0, p0, Lv/VRangeSeekBar;->v:I

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    iput v0, p0, Lv/VRangeSeekBar;->u:F

    .line 239
    .line 240
    invoke-virtual {p0, v0}, Lv/VRangeSeekBar;->d(F)Lv/VRangeSeekBar$Thumb;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    iput-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 245
    .line 246
    if-nez v0, :cond_c

    .line 247
    .line 248
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 249
    .line 250
    .line 251
    move-result p0

    .line 252
    return p0

    .line 253
    :cond_c
    invoke-virtual {p0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Lv/VRangeSeekBar;->p:Lv/VRangeSeekBar$Thumb;

    .line 257
    .line 258
    sget-object v1, Lv/VRangeSeekBar$Thumb;->BOTH:Lv/VRangeSeekBar$Thumb;

    .line 259
    .line 260
    if-eq v0, v1, :cond_d

    .line 261
    .line 262
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p0}, Lv/VRangeSeekBar;->j()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->m(Landroid/view/MotionEvent;)V

    .line 269
    .line 270
    .line 271
    :cond_d
    invoke-virtual {p0}, Lv/VRangeSeekBar;->b()V

    .line 272
    .line 273
    .line 274
    :cond_e
    :goto_3
    return v2
.end method

.method public setLineHeight(F)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-float p1, p1

    .line 6
    iput p1, p0, Lv/VRangeSeekBar;->g:F

    .line 7
    .line 8
    return-void
.end method

.method public setMinSpace(Ljava/lang/Number;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VRangeSeekBar;->A:Ljava/lang/Number;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lv/VRangeSeekBar;->B:Z

    .line 5
    .line 6
    return-void
.end method

.method public setNormalizedMaxValue(D)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->n:D

    .line 2
    .line 3
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 8
    .line 9
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(DD)D

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    iput-wide p1, p0, Lv/VRangeSeekBar;->o:D

    .line 20
    .line 21
    iget-boolean p1, p0, Lv/VRangeSeekBar;->B:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMaxValue()Ljava/lang/Number;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMinValue()Ljava/lang/Number;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sub-int/2addr p1, p2

    .line 42
    iget-object p2, p0, Lv/VRangeSeekBar;->A:Ljava/lang/Number;

    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-ge p1, p2, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lv/VRangeSeekBar;->k:Lv/VRangeSeekBar$NumberType;

    .line 51
    .line 52
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMinValue()Ljava/lang/Number;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    iget-object p2, p0, Lv/VRangeSeekBar;->A:Ljava/lang/Number;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 63
    .line 64
    .line 65
    move-result-wide v6

    .line 66
    add-double/2addr v4, v6

    .line 67
    invoke-virtual {p1, v4, v5}, Lv/VRangeSeekBar$NumberType;->toNumber(D)Ljava/lang/Number;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->n(Ljava/lang/Number;)D

    .line 72
    .line 73
    .line 74
    move-result-wide p1

    .line 75
    iget-wide v4, p0, Lv/VRangeSeekBar;->n:D

    .line 76
    .line 77
    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->max(DD)D

    .line 78
    .line 79
    .line 80
    move-result-wide p1

    .line 81
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    .line 82
    .line 83
    .line 84
    move-result-wide p1

    .line 85
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(DD)D

    .line 86
    .line 87
    .line 88
    move-result-wide p1

    .line 89
    iput-wide p1, p0, Lv/VRangeSeekBar;->o:D

    .line 90
    .line 91
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public setNormalizedMinValue(D)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->o:D

    .line 2
    .line 3
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(DD)D

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 8
    .line 9
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(DD)D

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    iput-wide p1, p0, Lv/VRangeSeekBar;->n:D

    .line 20
    .line 21
    iget-boolean p1, p0, Lv/VRangeSeekBar;->B:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMaxValue()Ljava/lang/Number;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMinValue()Ljava/lang/Number;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sub-int/2addr p1, p2

    .line 42
    iget-object p2, p0, Lv/VRangeSeekBar;->A:Ljava/lang/Number;

    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-ge p1, p2, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lv/VRangeSeekBar;->k:Lv/VRangeSeekBar$NumberType;

    .line 51
    .line 52
    invoke-virtual {p0}, Lv/VRangeSeekBar;->getSelectedMaxValue()Ljava/lang/Number;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    iget-object p2, p0, Lv/VRangeSeekBar;->A:Ljava/lang/Number;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    .line 63
    .line 64
    .line 65
    move-result-wide v6

    .line 66
    sub-double/2addr v4, v6

    .line 67
    invoke-virtual {p1, v4, v5}, Lv/VRangeSeekBar$NumberType;->toNumber(D)Ljava/lang/Number;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->n(Ljava/lang/Number;)D

    .line 72
    .line 73
    .line 74
    move-result-wide p1

    .line 75
    iget-wide v4, p0, Lv/VRangeSeekBar;->o:D

    .line 76
    .line 77
    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->min(DD)D

    .line 78
    .line 79
    .line 80
    move-result-wide p1

    .line 81
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    .line 82
    .line 83
    .line 84
    move-result-wide p1

    .line 85
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(DD)D

    .line 86
    .line 87
    .line 88
    move-result-wide p1

    .line 89
    iput-wide p1, p0, Lv/VRangeSeekBar;->n:D

    .line 90
    .line 91
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public setNotifyWhileDragging(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VRangeSeekBar;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnRangeSeekBarChangeListener(Lv/VRangeSeekBar$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VRangeSeekBar$b<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VRangeSeekBar;->r:Lv/VRangeSeekBar$b;

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedMaxValue(Ljava/lang/Number;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->m:D

    .line 2
    .line 3
    iget-wide v2, p0, Lv/VRangeSeekBar;->l:D

    .line 4
    .line 5
    sub-double/2addr v0, v2

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmpl-double v0, v2, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->setNormalizedMaxValue(D)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->n(Ljava/lang/Number;)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->setNormalizedMaxValue(D)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setSelectedMinValue(Ljava/lang/Number;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lv/VRangeSeekBar;->m:D

    .line 2
    .line 3
    iget-wide v2, p0, Lv/VRangeSeekBar;->l:D

    .line 4
    .line 5
    sub-double/2addr v0, v2

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmpl-double v0, v2, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v2, v3}, Lv/VRangeSeekBar;->setNormalizedMinValue(D)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lv/VRangeSeekBar;->n(Ljava/lang/Number;)D

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-virtual {p0, v0, v1}, Lv/VRangeSeekBar;->setNormalizedMinValue(D)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
