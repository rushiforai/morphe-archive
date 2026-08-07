.class public Lcom/p1/mobile/putong/core/ui/home/BounceButton;
.super Lcom/p1/mobile/putong/core/ui/BounceView;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:F

.field public E:Landroid/graphics/RectF;

.field public F:Landroid/graphics/RectF;

.field public G:Landroid/graphics/LinearGradient;

.field public H:Landroid/graphics/LinearGradient;

.field public final b:Ljava/lang/String;

.field public c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:Landroid/graphics/Paint;

.field public r:Landroid/graphics/Paint;

.field public s:Landroid/graphics/Paint;

.field public t:Landroid/graphics/Paint;

.field public u:Landroid/graphics/drawable/Drawable;

.field public v:Landroid/graphics/drawable/Drawable;

.field public w:Landroid/graphics/drawable/Drawable;

.field public x:F

.field public y:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/Integer;",
            "Ll/pf60<",
            "Ljava/lang/Float;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field public z:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/BounceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->b:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "#efede8"

    .line 15
    .line 16
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->c:I

    .line 21
    .line 22
    const-string v0, "#1f979797"

    .line 23
    .line 24
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->d:I

    .line 29
    .line 30
    const-string v0, "#00979797"

    .line 31
    .line 32
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->e:I

    .line 37
    .line 38
    const-string v0, "#00ffffff"

    .line 39
    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->f:I

    .line 45
    .line 46
    const-string v0, "#85ffffff"

    .line 47
    .line 48
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->g:I

    .line 53
    .line 54
    const-string v0, "#ffffff"

    .line 55
    .line 56
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->h:I

    .line 61
    .line 62
    const-string v0, "#D8D8D8"

    .line 63
    .line 64
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->i:I

    .line 69
    .line 70
    const-string v0, "#ec553f"

    .line 71
    .line 72
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->j:I

    .line 77
    .line 78
    const/high16 v0, 0x3f800000    # 1.0f

    .line 79
    .line 80
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    int-to-float v0, v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->v:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->w:Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    new-instance v0, Ll/l01;

    .line 95
    .line 96
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 100
    .line 101
    const/4 v0, 0x1

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->A:Z

    .line 103
    .line 104
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 105
    .line 106
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 107
    .line 108
    .line 109
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->c()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 113
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/BounceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->b:Ljava/lang/String;

    .line 115
    const-string p3, "#efede8"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->c:I

    .line 116
    const-string p3, "#1f979797"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->d:I

    .line 117
    const-string p3, "#00979797"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->e:I

    .line 118
    const-string p3, "#00ffffff"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->f:I

    .line 119
    const-string p3, "#85ffffff"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->g:I

    .line 120
    const-string p3, "#ffffff"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->h:I

    .line 121
    const-string p3, "#D8D8D8"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->i:I

    .line 122
    const-string p3, "#ec553f"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->j:I

    const/high16 p3, 0x3f800000    # 1.0f

    .line 123
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    int-to-float p3, p3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    const/4 p3, 0x0

    .line 124
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 125
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->v:Landroid/graphics/drawable/Drawable;

    .line 126
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->w:Landroid/graphics/drawable/Drawable;

    .line 127
    new-instance p3, Ll/l01;

    invoke-direct {p3}, Ll/l01;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    const/4 p3, 0x1

    .line 128
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->A:Z

    .line 129
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 130
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 131
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->c()V

    return-void
.end method

.method private b(Landroid/graphics/Canvas;F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 4
    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr v0, v1

    .line 8
    div-float v0, p2, v0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 11
    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->i:I

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 25
    .line 26
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 27
    .line 28
    add-float v4, v2, v3

    .line 29
    .line 30
    div-float/2addr v3, v1

    .line 31
    sub-float v3, p2, v3

    .line 32
    .line 33
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 39
    .line 40
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->h:I

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    .line 44
    .line 45
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 46
    .line 47
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-virtual {p1, v2, v2, p2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_3

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 69
    .line 70
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->m:F

    .line 71
    .line 72
    div-float v1, v3, v1

    .line 73
    .line 74
    mul-float/2addr v1, v0

    .line 75
    sub-float/2addr v2, v1

    .line 76
    const/4 v1, 0x0

    .line 77
    cmpl-float v1, v2, v1

    .line 78
    .line 79
    if-lez v1, :cond_3

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->A:Z

    .line 82
    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    goto :goto_0

    .line 87
    :cond_0
    const/4 v4, -0x1

    .line 88
    :goto_0
    int-to-float v4, v4

    .line 89
    mul-float/2addr v4, v2

    .line 90
    float-to-int v4, v4

    .line 91
    if-nez v1, :cond_1

    .line 92
    .line 93
    mul-float v1, v3, v0

    .line 94
    .line 95
    mul-float/2addr v3, v0

    .line 96
    invoke-static {p2, v1, v3}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, p2, v2, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 107
    .line 108
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v1, v3}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_2

    .line 117
    .line 118
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->m:F

    .line 119
    .line 120
    mul-float v3, v1, v0

    .line 121
    .line 122
    mul-float/2addr v1, v0

    .line 123
    invoke-static {p2, v3, v1}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 128
    .line 129
    invoke-virtual {p1, p2, v2, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 130
    .line 131
    .line 132
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->A:Z

    .line 133
    .line 134
    if-eqz p1, :cond_3

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 137
    .line 138
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 155
    .line 156
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p2, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    check-cast p2, Ll/pf60;

    .line 165
    .line 166
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast p2, Landroid/graphics/Bitmap;

    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 171
    .line 172
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Ll/pf60;

    .line 181
    .line 182
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast v0, Ljava/lang/Float;

    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 191
    .line 192
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v1, v2}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    check-cast v1, Ll/pf60;

    .line 201
    .line 202
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast v1, Ljava/lang/Float;

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 211
    .line 212
    invoke-virtual {p1, p2, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 213
    .line 214
    .line 215
    :cond_3
    return-void
.end method

.method private c()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->q:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 30
    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 37
    .line 38
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Landroid/graphics/Paint;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 74
    .line 75
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Landroid/graphics/RectF;

    .line 81
    .line 82
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->E:Landroid/graphics/RectF;

    .line 86
    .line 87
    new-instance v0, Landroid/graphics/RectF;

    .line 88
    .line 89
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->F:Landroid/graphics/RectF;

    .line 93
    .line 94
    return-void
.end method

.method private d(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/nhc0;->d:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/nhc0;->i:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->o:F

    .line 15
    .line 16
    sget p2, Ll/nhc0;->h:I

    .line 17
    .line 18
    const/high16 v0, 0x41d00000    # 26.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    int-to-float v0, v0

    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->n:F

    .line 30
    .line 31
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->m:F

    .line 32
    .line 33
    sget p2, Ll/nhc0;->f:I

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->w:Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    sget p2, Ll/nhc0;->g:I

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->v:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    sget p2, Ll/nhc0;->e:I

    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 59
    .line 60
    sget p2, Ll/nhc0;->j:I

    .line 61
    .line 62
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->C:Z

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private f(I)I
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 v0, -0x80000000

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/high16 v0, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    return p1
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;F)V
    .locals 12

    .line 1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->l:F

    .line 2
    .line 3
    const/high16 v2, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr v1, v2

    .line 6
    sub-float v3, v1, p2

    .line 7
    .line 8
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 11
    .line 12
    .line 13
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 14
    .line 15
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->c:I

    .line 16
    .line 17
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 21
    .line 22
    div-float/2addr v3, v2

    .line 23
    add-float/2addr v3, p2

    .line 24
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->s:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {p1, v4, v4, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 27
    .line 28
    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->D:F

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    cmpg-float v3, v3, v4

    .line 33
    .line 34
    if-gtz v3, :cond_0

    .line 35
    .line 36
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->D:F

    .line 37
    .line 38
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->C:Z

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->z:F

    .line 43
    .line 44
    cmpl-float v3, v0, v4

    .line 45
    .line 46
    if-lez v3, :cond_1

    .line 47
    .line 48
    const/high16 v3, 0x3f800000    # 1.0f

    .line 49
    .line 50
    cmpg-float v0, v0, v3

    .line 51
    .line 52
    if-gtz v0, :cond_1

    .line 53
    .line 54
    new-instance v7, Landroid/graphics/RectF;

    .line 55
    .line 56
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 57
    .line 58
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->D:F

    .line 59
    .line 60
    sub-float v4, v1, v3

    .line 61
    .line 62
    div-float/2addr v4, v2

    .line 63
    add-float/2addr v4, v3

    .line 64
    sub-float v4, v0, v4

    .line 65
    .line 66
    sub-float v5, v1, v3

    .line 67
    .line 68
    div-float/2addr v5, v2

    .line 69
    add-float/2addr v5, v3

    .line 70
    sub-float v5, v0, v5

    .line 71
    .line 72
    sub-float v8, v1, v3

    .line 73
    .line 74
    div-float/2addr v8, v2

    .line 75
    add-float/2addr v8, v3

    .line 76
    add-float/2addr v8, v0

    .line 77
    sub-float v9, v1, v3

    .line 78
    .line 79
    div-float/2addr v9, v2

    .line 80
    add-float/2addr v3, v9

    .line 81
    add-float/2addr v0, v3

    .line 82
    invoke-direct {v7, v4, v5, v8, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 86
    .line 87
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->D:F

    .line 88
    .line 89
    sub-float v2, v1, v2

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 95
    .line 96
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->j:I

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 99
    .line 100
    .line 101
    const/high16 v0, 0x43b40000    # 360.0f

    .line 102
    .line 103
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->z:F

    .line 104
    .line 105
    mul-float v9, v2, v0

    .line 106
    .line 107
    const/4 v10, 0x0

    .line 108
    iget-object v11, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->t:Landroid/graphics/Paint;

    .line 109
    .line 110
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 111
    .line 112
    move-object v6, p1

    .line 113
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->F:Landroid/graphics/RectF;

    .line 117
    .line 118
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 119
    .line 120
    sub-float v3, v2, v1

    .line 121
    .line 122
    sub-float v4, v2, v1

    .line 123
    .line 124
    add-float v5, v2, v1

    .line 125
    .line 126
    add-float/2addr v2, v1

    .line 127
    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->G:Landroid/graphics/LinearGradient;

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 135
    .line 136
    .line 137
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->F:Landroid/graphics/RectF;

    .line 138
    .line 139
    const/4 v10, 0x0

    .line 140
    iget-object v11, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 141
    .line 142
    const/4 v8, 0x0

    .line 143
    const/high16 v9, 0x43b40000    # 360.0f

    .line 144
    .line 145
    move-object v6, p1

    .line 146
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 147
    .line 148
    .line 149
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 150
    .line 151
    if-eqz v0, :cond_2

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->E:Landroid/graphics/RectF;

    .line 154
    .line 155
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 156
    .line 157
    sub-float v3, v2, v1

    .line 158
    .line 159
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 160
    .line 161
    sub-float/2addr v3, v4

    .line 162
    sub-float v5, v2, v1

    .line 163
    .line 164
    sub-float/2addr v5, v4

    .line 165
    add-float v6, v2, v1

    .line 166
    .line 167
    add-float/2addr v6, v4

    .line 168
    add-float/2addr v2, v1

    .line 169
    add-float/2addr v2, v4

    .line 170
    invoke-virtual {v0, v3, v5, v6, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->H:Landroid/graphics/LinearGradient;

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 178
    .line 179
    .line 180
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->E:Landroid/graphics/RectF;

    .line 181
    .line 182
    const/4 v10, 0x0

    .line 183
    iget-object v11, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->r:Landroid/graphics/Paint;

    .line 184
    .line 185
    const/4 v8, 0x0

    .line 186
    const/high16 v9, 0x43b40000    # 360.0f

    .line 187
    .line 188
    move-object v6, p1

    .line 189
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 190
    .line 191
    .line 192
    :cond_2
    return-void
.end method

.method public final e()V
    .locals 15

    .line 1
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 2
    .line 3
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->l:F

    .line 4
    .line 5
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->d:I

    .line 6
    .line 7
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->e:I

    .line 8
    .line 9
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->G:Landroid/graphics/LinearGradient;

    .line 18
    .line 19
    move-object v14, v7

    .line 20
    new-instance v7, Landroid/graphics/LinearGradient;

    .line 21
    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->l:F

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->p:F

    .line 25
    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    mul-float/2addr v1, v2

    .line 29
    add-float v11, v0, v1

    .line 30
    .line 31
    iget v12, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->f:I

    .line 32
    .line 33
    iget v13, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->g:I

    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    const/4 v9, 0x0

    .line 37
    const/4 v10, 0x0

    .line 38
    invoke-direct/range {v7 .. v14}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 39
    .line 40
    .line 41
    iput-object v7, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->H:Landroid/graphics/LinearGradient;

    .line 42
    .line 43
    return-void
.end method

.method public getInnerButtonPos()Ll/bnl0$g;
    .locals 5

    .line 1
    invoke-static {p0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bnl0$g;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/bnl0$g;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v2, v0, Ll/bnl0$g;->a:I

    .line 11
    .line 12
    int-to-float v2, v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    int-to-float v3, v3

    .line 18
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 19
    .line 20
    iget v4, v4, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 21
    .line 22
    sub-float/2addr v3, v4

    .line 23
    const/high16 v4, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v3, v4

    .line 26
    add-float/2addr v2, v3

    .line 27
    float-to-int v2, v2

    .line 28
    iput v2, v1, Ll/bnl0$g;->a:I

    .line 29
    .line 30
    iget v0, v0, Ll/bnl0$g;->b:I

    .line 31
    .line 32
    int-to-float v0, v0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-float v2, v2

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 39
    .line 40
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 41
    .line 42
    sub-float/2addr v2, p0

    .line 43
    div-float/2addr v2, v4

    .line 44
    add-float/2addr v0, v2

    .line 45
    float-to-int v0, v0

    .line 46
    iput v0, v1, Ll/bnl0$g;->b:I

    .line 47
    .line 48
    float-to-int p0, p0

    .line 49
    iput p0, v1, Ll/bnl0$g;->d:I

    .line 50
    .line 51
    iput p0, v1, Ll/bnl0$g;->c:I

    .line 52
    .line 53
    return-object v1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/a;->j()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->a(Landroid/graphics/Canvas;F)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->b(Landroid/graphics/Canvas;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->k:F

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->o:F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    cmpl-float v2, v1, v2

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    div-float v1, v0, v1

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->n:F

    .line 18
    .line 19
    mul-float/2addr v1, v2

    .line 20
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->m:F

    .line 21
    .line 22
    :cond_0
    const/high16 v1, 0x40800000    # 4.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    sub-float/2addr v0, v1

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->l:F

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->k:F

    .line 33
    .line 34
    const/high16 v2, 0x40000000    # 2.0f

    .line 35
    .line 36
    div-float/2addr v1, v2

    .line 37
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->x:F

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 40
    .line 41
    const/high16 v2, 0x41100000    # 9.0f

    .line 42
    .line 43
    div-float v2, v0, v2

    .line 44
    .line 45
    sub-float/2addr v0, v2

    .line 46
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/a;->k(F)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->e()V

    .line 50
    .line 51
    .line 52
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->f(I)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->f(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/oof0;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/a;->i(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public setBorderOuterCircle(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->B:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setCenterIconWidth(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->n:F

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->m:F

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->u:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->y:Ll/l01;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/oof0;->clear()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setLongPressingListener(Lcom/p1/mobile/putong/core/ui/a$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/a;->l:Lcom/p1/mobile/putong/core/ui/a$d;

    .line 4
    .line 5
    return-void
.end method

.method public setProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->z:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->z:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
