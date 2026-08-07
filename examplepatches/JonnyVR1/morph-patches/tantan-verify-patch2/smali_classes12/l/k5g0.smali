.class public Ll/k5g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mgl;
.implements Ll/uol;
.implements Ll/i7m;
.implements Ll/l5m;
.implements Ll/e5m;
.implements Ll/f2m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/k5g0$b;,
        Ll/k5g0$a;
    }
.end annotation


# instance fields
.field public a:Ll/dkl0;

.field public b:F

.field public c:Ljava/nio/FloatBuffer;

.field public d:[F

.field public final e:[F

.field protected f:[F

.field public g:F

.field public h:F

.field public i:J

.field public j:Ljava/lang/Object;

.field protected k:Landroid/content/Context;

.field l:J

.field public m:Ljava/nio/FloatBuffer;

.field public n:Ljava/nio/FloatBuffer;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:I

.field private r:J

.field private s:Landroid/graphics/Bitmap;

.field public t:Z

.field private u:Ll/lgl;

.field private v:Ll/iqf;

.field public w:Ll/k5g0$a;

.field private x:F

.field private y:F

.field private z:Ll/k5g0$b;


# direct methods
.method public constructor <init>(Ll/dkl0;Landroid/content/Context;Lcom/immomo/velib/anim/model/Element;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    iput-object v0, p0, Ll/k5g0;->e:[F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/k5g0;->g:F

    .line 12
    .line 13
    iput v0, p0, Ll/k5g0;->h:F

    .line 14
    .line 15
    const-wide/16 v0, -0x1

    .line 16
    .line 17
    iput-wide v0, p0, Ll/k5g0;->i:J

    .line 18
    .line 19
    new-instance v2, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Ll/k5g0;->j:Ljava/lang/Object;

    .line 25
    .line 26
    iput-wide v0, p0, Ll/k5g0;->l:J

    .line 27
    .line 28
    new-instance v2, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v2}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Ll/k5g0;->o:Ljava/util/List;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    iput-boolean v2, p0, Ll/k5g0;->p:Z

    .line 41
    .line 42
    iput v2, p0, Ll/k5g0;->q:I

    .line 43
    .line 44
    iput-wide v0, p0, Ll/k5g0;->r:J

    .line 45
    .line 46
    new-instance v0, Ll/k5g0$a;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/k5g0$a;-><init>(Ll/k5g0;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 52
    .line 53
    iput-object p1, p0, Ll/k5g0;->a:Ll/dkl0;

    .line 54
    .line 55
    iput-object p2, p0, Ll/k5g0;->k:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {p3}, Lcom/immomo/velib/anim/model/Element;->getWidth()F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Ll/k5g0;->x:F

    .line 62
    .line 63
    invoke-virtual {p3}, Lcom/immomo/velib/anim/model/Element;->getHeight()F

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, Ll/k5g0;->y:F

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/k5g0;->m()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3}, Lcom/immomo/velib/anim/model/Element;->getNew_anim()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ll/k5g0;->n(Lcom/immomo/velib/anim/model/Element;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    invoke-virtual {p0, p3}, Ll/k5g0;->l(Lcom/immomo/velib/anim/model/Element;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iput p1, p0, Ll/k5g0$a;->b:F

    .line 4
    .line 5
    return-void
.end method

.method public b(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iput p1, p0, Ll/k5g0$a;->d:F

    .line 4
    .line 5
    return-void
.end method

.method public c(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iput p1, p0, Ll/k5g0$a;->c:F

    .line 4
    .line 5
    return-void
.end method

.method public d(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iput p1, p0, Ll/k5g0$a;->a:F

    .line 4
    .line 5
    return-void
.end method

.method public e(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iput p1, p0, Ll/k5g0$a;->e:F

    .line 4
    .line 5
    return-void
.end method

.method public f(Ll/dj60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iget v0, p1, Ll/dj60;->a:F

    .line 4
    .line 5
    iput v0, p0, Ll/k5g0$a;->c:F

    .line 6
    .line 7
    iget p1, p1, Ll/dj60;->b:F

    .line 8
    .line 9
    iput p1, p0, Ll/k5g0$a;->d:F

    .line 10
    .line 11
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5g0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/k5g0;->o:Ljava/util/List;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget v0, p0, Ll/k5g0;->q:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Ll/k5g0;->q:I

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/k5g0;->s:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/k5g0;->s:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public i()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k5g0;->s:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/k5g0;->a:Ll/dkl0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkl0;->b()Ll/dkl0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/k5g0;->a:Ll/dkl0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dkl0;->b()Ll/dkl0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/dkl0$a;->a()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/k5g0;->s:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Ll/k5g0;->s:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    return-object p0
.end method

.method public j()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5g0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()F
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5g0;->a:Ll/dkl0;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkl0;->a()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-float/2addr v0, v1

    .line 12
    iget-object p0, p0, Ll/k5g0;->a:Ll/dkl0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dkl0;->c()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    div-float/2addr v0, p0

    .line 19
    return v0

    .line 20
    :cond_0
    return v1
.end method

.method public l(Lcom/immomo/velib/anim/model/Element;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getWidth()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f000000    # 0.5f

    .line 6
    .line 7
    div-float/2addr v0, v1

    .line 8
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getAnim()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-lez v2, :cond_2

    .line 19
    .line 20
    new-instance v2, Ll/lgl;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/lgl;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v2, p0, Ll/k5g0;->u:Ll/lgl;

    .line 26
    .line 27
    new-instance v2, Ll/ogl;

    .line 28
    .line 29
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-direct {v2, p0, v3}, Ll/ogl;-><init>(Ll/mgl;Landroid/view/animation/Interpolator;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v2, v3}, Ll/jgl;->c(I)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/pgl;

    .line 45
    .line 46
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 47
    .line 48
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-direct {v3, p0, v4}, Ll/pgl;-><init>(Ll/mgl;Landroid/view/animation/Interpolator;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {v3, v4}, Ll/jgl;->c(I)V

    .line 59
    .line 60
    .line 61
    new-instance v4, Ll/ngl;

    .line 62
    .line 63
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 64
    .line 65
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-direct {v4, p0, v5}, Ll/ngl;-><init>(Ll/mgl;Landroid/view/animation/Interpolator;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-virtual {v4, v5}, Ll/jgl;->c(I)V

    .line 76
    .line 77
    .line 78
    new-instance v5, Ll/igl;

    .line 79
    .line 80
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 81
    .line 82
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-direct {v5, p0, v6}, Ll/igl;-><init>(Ll/mgl;Landroid/view/animation/Interpolator;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    invoke-virtual {v5, v6}, Ll/jgl;->c(I)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    const/4 v7, 0x0

    .line 100
    :goto_0
    const/4 v8, 0x0

    .line 101
    if-ge v7, v6, :cond_1

    .line 102
    .line 103
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 108
    .line 109
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getInterpolator()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    if-nez v9, :cond_0

    .line 118
    .line 119
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    check-cast v8, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 124
    .line 125
    invoke-virtual {v8}, Lcom/immomo/velib/anim/model/ElementAnimation;->getInterpolator()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    invoke-virtual {p0, v8}, Ll/k5g0;->p(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    :cond_0
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 138
    .line 139
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getTime()I

    .line 140
    .line 141
    .line 142
    move-result v9

    .line 143
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v10

    .line 147
    check-cast v10, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 148
    .line 149
    invoke-virtual {v10}, Lcom/immomo/velib/anim/model/ElementAnimation;->getX()F

    .line 150
    .line 151
    .line 152
    move-result v10

    .line 153
    invoke-virtual {v2, v9, v10, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v9

    .line 160
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 161
    .line 162
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getTime()I

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    check-cast v10, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 171
    .line 172
    invoke-virtual {v10}, Lcom/immomo/velib/anim/model/ElementAnimation;->getY()F

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    invoke-virtual {v3, v9, v10, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v9

    .line 183
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 184
    .line 185
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getTime()I

    .line 186
    .line 187
    .line 188
    move-result v9

    .line 189
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v10

    .line 193
    check-cast v10, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 194
    .line 195
    invoke-virtual {v10}, Lcom/immomo/velib/anim/model/ElementAnimation;->getScale()F

    .line 196
    .line 197
    .line 198
    move-result v10

    .line 199
    mul-float/2addr v10, v0

    .line 200
    invoke-virtual {v4, v9, v10, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 201
    .line 202
    .line 203
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 208
    .line 209
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getTime()I

    .line 210
    .line 211
    .line 212
    move-result v9

    .line 213
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v10

    .line 217
    check-cast v10, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 218
    .line 219
    invoke-virtual {v10}, Lcom/immomo/velib/anim/model/ElementAnimation;->getAlpha()F

    .line 220
    .line 221
    .line 222
    move-result v10

    .line 223
    invoke-virtual {v5, v9, v10, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 224
    .line 225
    .line 226
    add-int/lit8 v7, v7, 0x1

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :cond_1
    add-int/lit8 v6, v6, -0x1

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 233
    .line 234
    .line 235
    move-result v7

    .line 236
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v9

    .line 240
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 241
    .line 242
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getX()F

    .line 243
    .line 244
    .line 245
    move-result v9

    .line 246
    invoke-virtual {v2, v7, v9, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 250
    .line 251
    .line 252
    move-result v7

    .line 253
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v9

    .line 257
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 258
    .line 259
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getY()F

    .line 260
    .line 261
    .line 262
    move-result v9

    .line 263
    invoke-virtual {v3, v7, v9, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 267
    .line 268
    .line 269
    move-result v7

    .line 270
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v9

    .line 274
    check-cast v9, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 275
    .line 276
    invoke-virtual {v9}, Lcom/immomo/velib/anim/model/ElementAnimation;->getScale()F

    .line 277
    .line 278
    .line 279
    move-result v9

    .line 280
    mul-float/2addr v9, v0

    .line 281
    invoke-virtual {v4, v7, v9, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getDuration()I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Lcom/immomo/velib/anim/model/ElementAnimation;

    .line 293
    .line 294
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/ElementAnimation;->getAlpha()F

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    invoke-virtual {v5, p1, v0, v8}, Ll/kgl;->f(IFLandroid/view/animation/Interpolator;)V

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/k5g0;->u:Ll/lgl;

    .line 302
    .line 303
    invoke-virtual {p1, v2}, Ll/lgl;->a(Ll/jgl;)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Ll/k5g0;->u:Ll/lgl;

    .line 307
    .line 308
    invoke-virtual {p1, v3}, Ll/lgl;->a(Ll/jgl;)V

    .line 309
    .line 310
    .line 311
    iget-object p1, p0, Ll/k5g0;->u:Ll/lgl;

    .line 312
    .line 313
    invoke-virtual {p1, v4}, Ll/lgl;->a(Ll/jgl;)V

    .line 314
    .line 315
    .line 316
    iget-object p0, p0, Ll/k5g0;->u:Ll/lgl;

    .line 317
    .line 318
    invoke-virtual {p0, v5}, Ll/lgl;->a(Ll/jgl;)V

    .line 319
    .line 320
    .line 321
    :cond_2
    return-void
.end method

.method public m()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/k5g0;->a:Ll/dkl0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/dkl0;->a()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, v0, Ll/k5g0;->a:Ll/dkl0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/dkl0;->c()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    div-float/2addr v1, v2

    .line 16
    iput v1, v0, Ll/k5g0;->b:F

    .line 17
    .line 18
    const/high16 v2, 0x3f000000    # 0.5f

    .line 19
    .line 20
    mul-float v3, v1, v2

    .line 21
    .line 22
    const/high16 v4, -0x41000000    # -0.5f

    .line 23
    .line 24
    mul-float v5, v4, v1

    .line 25
    .line 26
    mul-float v6, v4, v1

    .line 27
    .line 28
    mul-float/2addr v1, v2

    .line 29
    const/16 v7, 0x8

    .line 30
    .line 31
    new-array v8, v7, [F

    .line 32
    .line 33
    const/4 v9, 0x0

    .line 34
    aput v4, v8, v9

    .line 35
    .line 36
    const/4 v10, 0x1

    .line 37
    aput v3, v8, v10

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    aput v4, v8, v3

    .line 41
    .line 42
    const/4 v11, 0x3

    .line 43
    aput v5, v8, v11

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    aput v2, v8, v5

    .line 47
    .line 48
    const/4 v12, 0x5

    .line 49
    aput v6, v8, v12

    .line 50
    .line 51
    const/4 v6, 0x6

    .line 52
    aput v2, v8, v6

    .line 53
    .line 54
    const/4 v13, 0x7

    .line 55
    aput v1, v8, v13

    .line 56
    .line 57
    const/16 v1, 0x20

    .line 58
    .line 59
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v14

    .line 63
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 64
    .line 65
    .line 66
    move-result-object v15

    .line 67
    invoke-virtual {v14, v15}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v14

    .line 74
    iput-object v14, v0, Ll/k5g0;->c:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    invoke-virtual {v14, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    .line 79
    iget-object v14, v0, Ll/k5g0;->c:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    invoke-virtual {v14, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 89
    .line 90
    .line 91
    move-result-object v14

    .line 92
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Ll/k5g0;->n:Ljava/nio/FloatBuffer;

    .line 100
    .line 101
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 102
    .line 103
    .line 104
    iget-object v1, v0, Ll/k5g0;->n:Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    invoke-virtual {v1, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 107
    .line 108
    .line 109
    iget v1, v0, Ll/k5g0;->b:F

    .line 110
    .line 111
    mul-float v8, v1, v2

    .line 112
    .line 113
    mul-float v14, v4, v1

    .line 114
    .line 115
    mul-float v15, v4, v1

    .line 116
    .line 117
    mul-float/2addr v1, v2

    .line 118
    move/from16 v16, v2

    .line 119
    .line 120
    const/16 v2, 0x10

    .line 121
    .line 122
    new-array v2, v2, [F

    .line 123
    .line 124
    aput v4, v2, v9

    .line 125
    .line 126
    aput v8, v2, v10

    .line 127
    .line 128
    const/4 v8, 0x0

    .line 129
    aput v8, v2, v3

    .line 130
    .line 131
    const/high16 v3, 0x3f800000    # 1.0f

    .line 132
    .line 133
    aput v3, v2, v11

    .line 134
    .line 135
    aput v4, v2, v5

    .line 136
    .line 137
    aput v14, v2, v12

    .line 138
    .line 139
    aput v8, v2, v6

    .line 140
    .line 141
    aput v3, v2, v13

    .line 142
    .line 143
    aput v16, v2, v7

    .line 144
    .line 145
    const/16 v4, 0x9

    .line 146
    .line 147
    aput v15, v2, v4

    .line 148
    .line 149
    const/16 v4, 0xa

    .line 150
    .line 151
    aput v8, v2, v4

    .line 152
    .line 153
    const/16 v4, 0xb

    .line 154
    .line 155
    aput v3, v2, v4

    .line 156
    .line 157
    const/16 v4, 0xc

    .line 158
    .line 159
    aput v16, v2, v4

    .line 160
    .line 161
    const/16 v4, 0xd

    .line 162
    .line 163
    aput v1, v2, v4

    .line 164
    .line 165
    const/16 v1, 0xe

    .line 166
    .line 167
    aput v8, v2, v1

    .line 168
    .line 169
    const/16 v1, 0xf

    .line 170
    .line 171
    aput v3, v2, v1

    .line 172
    .line 173
    iput-object v2, v0, Ll/k5g0;->d:[F

    .line 174
    .line 175
    iget-object v1, v0, Ll/k5g0;->e:[F

    .line 176
    .line 177
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 178
    .line 179
    .line 180
    iget-object v0, v0, Ll/k5g0;->e:[F

    .line 181
    .line 182
    const/high16 v1, -0x40800000    # -1.0f

    .line 183
    .line 184
    aput v1, v0, v9

    .line 185
    .line 186
    return-void
.end method

.method public n(Lcom/immomo/velib/anim/model/Element;)V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/Element;->getNew_anim()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/Element;->getWidth()F

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/high16 v4, 0x3f000000    # 0.5f

    .line 17
    .line 18
    div-float v7, v3, v4

    .line 19
    .line 20
    iget v3, v0, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 21
    .line 22
    int-to-float v8, v3

    .line 23
    iget v0, v0, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 24
    .line 25
    int-to-float v9, v0

    .line 26
    new-instance v0, Ll/iqf;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/iqf;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, v1, Ll/k5g0;->v:Ll/iqf;

    .line 32
    .line 33
    iget-object v0, v1, Ll/k5g0;->w:Ll/k5g0$a;

    .line 34
    .line 35
    iget v3, v0, Ll/k5g0$a;->b:F

    .line 36
    .line 37
    mul-float/2addr v3, v7

    .line 38
    iput v3, v0, Ll/k5g0$a;->b:F

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v10

    .line 44
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_e

    .line 49
    .line 50
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    move-object v11, v0

    .line 55
    check-cast v11, Lcom/immomo/velib/anim/model/ElementNewAnimation;

    .line 56
    .line 57
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getType()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getInterpolator()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0}, Ll/k5g0;->p(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getType()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    const/4 v3, 0x3

    .line 88
    const/4 v4, 0x4

    .line 89
    const/4 v5, 0x2

    .line 90
    const/4 v12, 0x0

    .line 91
    const/4 v13, 0x1

    .line 92
    const/4 v14, -0x1

    .line 93
    sparse-switch v2, :sswitch_data_0

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :sswitch_0
    const-string v2, "translate"

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    move v14, v4

    .line 107
    goto :goto_1

    .line 108
    :sswitch_1
    const-string v2, "scale"

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    move v14, v3

    .line 118
    goto :goto_1

    .line 119
    :sswitch_2
    const-string v2, "alpha"

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_4

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_4
    move v14, v5

    .line 129
    goto :goto_1

    .line 130
    :sswitch_3
    const-string v2, "path"

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_5

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    move v14, v13

    .line 140
    goto :goto_1

    .line 141
    :sswitch_4
    const-string v2, "rotate"

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_6

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_6
    move v14, v12

    .line 151
    :goto_1
    packed-switch v14, :pswitch_data_0

    .line 152
    .line 153
    .line 154
    goto/16 :goto_4

    .line 155
    .line 156
    :pswitch_0
    new-instance v0, Ll/mqf;

    .line 157
    .line 158
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getX()F

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getY()F

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getToX()F

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getToY()F

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-direct/range {v0 .. v6}, Ll/mqf;-><init>(Ll/i7m;FFFFLandroid/animation/TimeInterpolator;)V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_5

    .line 178
    .line 179
    :pswitch_1
    new-instance v0, Ll/lqf;

    .line 180
    .line 181
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getScale()F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    mul-float/2addr v2, v7

    .line 186
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getToScale()F

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    mul-float/2addr v3, v7

    .line 191
    invoke-direct {v0, v1, v2, v3, v6}, Ll/lqf;-><init>(Ll/l5m;FFLandroid/animation/TimeInterpolator;)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_5

    .line 195
    .line 196
    :pswitch_2
    new-instance v0, Ll/gqf;

    .line 197
    .line 198
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getAlpha()F

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getToAlpha()F

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    invoke-direct {v0, v1, v2, v3, v6}, Ll/gqf;-><init>(Ll/uol;FFLandroid/animation/TimeInterpolator;)V

    .line 207
    .line 208
    .line 209
    goto/16 :goto_5

    .line 210
    .line 211
    :pswitch_3
    new-instance v14, Ll/nj60;

    .line 212
    .line 213
    invoke-direct {v14}, Ll/nj60;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getPoints()Ljava/util/List;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    if-eqz v0, :cond_c

    .line 221
    .line 222
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getPoints()Ljava/util/List;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-lez v0, :cond_c

    .line 231
    .line 232
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getPoints()Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    if-eqz v0, :cond_b

    .line 237
    .line 238
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-nez v2, :cond_7

    .line 243
    .line 244
    goto/16 :goto_4

    .line 245
    .line 246
    :cond_7
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Lcom/immomo/velib/anim/model/PointSet;

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/PointSet;->getPoint()Ljava/util/List;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    check-cast v2, Ljava/lang/Float;

    .line 261
    .line 262
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    div-float/2addr v2, v8

    .line 267
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/PointSet;->getPoint()Ljava/util/List;

    .line 268
    .line 269
    .line 270
    move-result-object v6

    .line 271
    invoke-interface {v6, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    check-cast v6, Ljava/lang/Float;

    .line 276
    .line 277
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    div-float/2addr v6, v9

    .line 282
    const/high16 v22, 0x3f800000    # 1.0f

    .line 283
    .line 284
    sub-float v6, v22, v6

    .line 285
    .line 286
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/PointSet;->getInterpolator()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v1, v0}, Ll/k5g0;->p(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v14, v2, v6, v0}, Ll/nj60;->d(FFLandroid/animation/TimeInterpolator;)V

    .line 295
    .line 296
    .line 297
    move v0, v13

    .line 298
    :goto_2
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getPoints()Ljava/util/List;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    if-ge v0, v2, :cond_c

    .line 307
    .line 308
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getPoints()Ljava/util/List;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    check-cast v2, Lcom/immomo/velib/anim/model/PointSet;

    .line 317
    .line 318
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/PointSet;->getPoint()Ljava/util/List;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/PointSet;->getInterpolator()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-virtual {v1, v2}, Ll/k5g0;->p(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 331
    .line 332
    .line 333
    move-result v15

    .line 334
    if-ne v15, v5, :cond_8

    .line 335
    .line 336
    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v15

    .line 340
    check-cast v15, Ljava/lang/Float;

    .line 341
    .line 342
    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    .line 343
    .line 344
    .line 345
    move-result v15

    .line 346
    div-float/2addr v15, v8

    .line 347
    invoke-interface {v6, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    check-cast v6, Ljava/lang/Float;

    .line 352
    .line 353
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 354
    .line 355
    .line 356
    move-result v6

    .line 357
    div-float/2addr v6, v9

    .line 358
    sub-float v6, v22, v6

    .line 359
    .line 360
    invoke-virtual {v14, v15, v6, v2}, Ll/nj60;->c(FFLandroid/animation/TimeInterpolator;)V

    .line 361
    .line 362
    .line 363
    goto/16 :goto_3

    .line 364
    .line 365
    :cond_8
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 366
    .line 367
    .line 368
    move-result v15

    .line 369
    if-ne v15, v4, :cond_9

    .line 370
    .line 371
    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v15

    .line 375
    check-cast v15, Ljava/lang/Float;

    .line 376
    .line 377
    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    .line 378
    .line 379
    .line 380
    move-result v15

    .line 381
    div-float/2addr v15, v8

    .line 382
    invoke-interface {v6, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v16

    .line 386
    check-cast v16, Ljava/lang/Float;

    .line 387
    .line 388
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    .line 389
    .line 390
    .line 391
    move-result v16

    .line 392
    div-float v16, v16, v9

    .line 393
    .line 394
    sub-float v16, v22, v16

    .line 395
    .line 396
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object v17

    .line 400
    check-cast v17, Ljava/lang/Float;

    .line 401
    .line 402
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Float;->floatValue()F

    .line 403
    .line 404
    .line 405
    move-result v17

    .line 406
    div-float v17, v17, v8

    .line 407
    .line 408
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    check-cast v6, Ljava/lang/Float;

    .line 413
    .line 414
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 415
    .line 416
    .line 417
    move-result v6

    .line 418
    div-float/2addr v6, v9

    .line 419
    sub-float v18, v22, v6

    .line 420
    .line 421
    move-object/from16 v19, v2

    .line 422
    .line 423
    invoke-virtual/range {v14 .. v19}, Ll/nj60;->e(FFFFLandroid/animation/TimeInterpolator;)V

    .line 424
    .line 425
    .line 426
    goto :goto_3

    .line 427
    :cond_9
    move-object/from16 v19, v2

    .line 428
    .line 429
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    const/4 v15, 0x6

    .line 434
    if-ne v2, v15, :cond_a

    .line 435
    .line 436
    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    check-cast v2, Ljava/lang/Float;

    .line 441
    .line 442
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    div-float v15, v2, v8

    .line 447
    .line 448
    invoke-interface {v6, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    check-cast v2, Ljava/lang/Float;

    .line 453
    .line 454
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    div-float/2addr v2, v9

    .line 459
    sub-float v16, v22, v2

    .line 460
    .line 461
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v2

    .line 465
    check-cast v2, Ljava/lang/Float;

    .line 466
    .line 467
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 468
    .line 469
    .line 470
    move-result v2

    .line 471
    div-float v17, v2, v8

    .line 472
    .line 473
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object v2

    .line 477
    check-cast v2, Ljava/lang/Float;

    .line 478
    .line 479
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    div-float/2addr v2, v9

    .line 484
    sub-float v18, v22, v2

    .line 485
    .line 486
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 487
    .line 488
    .line 489
    move-result-object v2

    .line 490
    check-cast v2, Ljava/lang/Float;

    .line 491
    .line 492
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 493
    .line 494
    .line 495
    move-result v2

    .line 496
    div-float/2addr v2, v8

    .line 497
    const/4 v3, 0x5

    .line 498
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object v3

    .line 502
    check-cast v3, Ljava/lang/Float;

    .line 503
    .line 504
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 505
    .line 506
    .line 507
    move-result v3

    .line 508
    div-float/2addr v3, v9

    .line 509
    sub-float v20, v22, v3

    .line 510
    .line 511
    move-object/from16 v21, v19

    .line 512
    .line 513
    move/from16 v19, v2

    .line 514
    .line 515
    invoke-virtual/range {v14 .. v21}, Ll/nj60;->a(FFFFFFLandroid/animation/TimeInterpolator;)V

    .line 516
    .line 517
    .line 518
    :cond_a
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 519
    .line 520
    const/4 v3, 0x3

    .line 521
    goto/16 :goto_2

    .line 522
    .line 523
    :cond_b
    :goto_4
    const/4 v0, 0x0

    .line 524
    goto :goto_5

    .line 525
    :cond_c
    new-instance v0, Ll/yi60;

    .line 526
    .line 527
    invoke-direct {v0}, Ll/yi60;-><init>()V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v14}, Ll/nj60;->b()Ljava/util/List;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    invoke-static {v1, v0, v2}, Ll/jqf;->n(Ll/f2m;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Ll/jqf;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    goto :goto_5

    .line 543
    :pswitch_4
    new-instance v0, Ll/kqf;

    .line 544
    .line 545
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getDegress()F

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getToDegress()F

    .line 550
    .line 551
    .line 552
    move-result v3

    .line 553
    invoke-direct {v0, v1, v2, v3, v6}, Ll/kqf;-><init>(Ll/e5m;FFLandroid/animation/TimeInterpolator;)V

    .line 554
    .line 555
    .line 556
    :goto_5
    if-nez v0, :cond_d

    .line 557
    .line 558
    goto/16 :goto_0

    .line 559
    .line 560
    :cond_d
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getDuration()J

    .line 561
    .line 562
    .line 563
    move-result-wide v2

    .line 564
    invoke-virtual {v0, v2, v3}, Ll/hqf;->e(J)Ll/hqf;

    .line 565
    .line 566
    .line 567
    invoke-virtual {v11}, Lcom/immomo/velib/anim/model/ElementNewAnimation;->getStartDelay()J

    .line 568
    .line 569
    .line 570
    move-result-wide v2

    .line 571
    invoke-virtual {v0, v2, v3}, Ll/hqf;->f(J)Ll/hqf;

    .line 572
    .line 573
    .line 574
    iget-object v2, v1, Ll/k5g0;->v:Ll/iqf;

    .line 575
    .line 576
    invoke-virtual {v2, v0}, Ll/iqf;->a(Ll/hqf;)V

    .line 577
    .line 578
    .line 579
    goto/16 :goto_0

    .line 580
    .line 581
    :cond_e
    iget-object v0, v1, Ll/k5g0;->v:Ll/iqf;

    .line 582
    .line 583
    invoke-virtual {v0}, Ll/iqf;->c()V

    .line 584
    .line 585
    .line 586
    return-void

    .line 587
    :sswitch_data_0
    .sparse-switch
        -0x372522a5 -> :sswitch_4
        0x346425 -> :sswitch_3
        0x589b15e -> :sswitch_2
        0x683094a -> :sswitch_1
        0x3ec0f14e -> :sswitch_0
    .end sparse-switch

    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 2
    .line 3
    iget v0, v0, Ll/k5g0$a;->b:F

    .line 4
    .line 5
    new-instance v1, Landroid/graphics/PointF;

    .line 6
    .line 7
    iget-object v2, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 8
    .line 9
    iget v3, v2, Ll/k5g0$a;->c:F

    .line 10
    .line 11
    iget v2, v2, Ll/k5g0$a;->d:F

    .line 12
    .line 13
    invoke-direct {v1, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/k5g0;->w:Ll/k5g0$a;

    .line 17
    .line 18
    iget v2, v2, Ll/k5g0$a;->e:F

    .line 19
    .line 20
    invoke-virtual {p0, v0, v0, v1, v2}, Ll/k5g0;->r(FFLandroid/graphics/PointF;F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public p(Ljava/lang/String;)Landroid/view/animation/Interpolator;
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, ","

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    array-length p1, p0

    .line 18
    const/4 v1, 0x4

    .line 19
    if-ge p1, v1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    :try_start_0
    new-instance p1, Ll/jke;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    aget-object v1, p0, v1

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    aget-object v2, p0, v2

    .line 37
    .line 38
    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const/4 v3, 0x2

    .line 47
    aget-object v3, p0, v3

    .line 48
    .line 49
    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v4, 0x3

    .line 58
    aget-object p0, p0, v4

    .line 59
    .line 60
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-direct {p1, v1, v2, v3, p0}, Ll/jke;-><init>(FFFF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    return-object p1

    .line 72
    :catch_0
    move-exception p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 74
    .line 75
    .line 76
    :cond_2
    :goto_0
    return-object v0
.end method

.method public q(Ll/k5g0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k5g0;->z:Ll/k5g0$b;

    .line 2
    .line 3
    return-void
.end method

.method public r(FFLandroid/graphics/PointF;F)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, v2

    .line 12
    neg-float v0, v0

    .line 13
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float p3, p3

    .line 16
    mul-float/2addr p3, v1

    .line 17
    add-float/2addr p3, v2

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    new-array v3, v1, [F

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 26
    .line 27
    .line 28
    neg-float v0, v0

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v1, v9, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Ll/k5g0;->e:[F

    .line 34
    .line 35
    iget-object v7, p0, Ll/k5g0;->f:[F

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 41
    .line 42
    .line 43
    move-object v7, v3

    .line 44
    move-object v5, v1

    .line 45
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 46
    .line 47
    .line 48
    move-object p3, v5

    .line 49
    const/4 v7, 0x0

    .line 50
    const/high16 v8, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p4

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 55
    .line 56
    .line 57
    mul-float/2addr p1, v2

    .line 58
    mul-float/2addr p2, v2

    .line 59
    invoke-static {v3, v9, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Ll/k5g0;->d:[F

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    move-object v5, v3

    .line 67
    move-object v3, p3

    .line 68
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 69
    .line 70
    .line 71
    aget p1, p3, v9

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 v0, 0x4

    .line 77
    aget v1, p3, v0

    .line 78
    .line 79
    const/4 v2, 0x5

    .line 80
    aget v3, p3, v2

    .line 81
    .line 82
    const/16 v4, 0x8

    .line 83
    .line 84
    aget v5, p3, v4

    .line 85
    .line 86
    const/16 v6, 0x9

    .line 87
    .line 88
    aget v6, p3, v6

    .line 89
    .line 90
    const/16 v7, 0xc

    .line 91
    .line 92
    aget v7, p3, v7

    .line 93
    .line 94
    const/16 v8, 0xd

    .line 95
    .line 96
    aget p3, p3, v8

    .line 97
    .line 98
    new-array v4, v4, [F

    .line 99
    .line 100
    aput p1, v4, v9

    .line 101
    .line 102
    aput p4, v4, p2

    .line 103
    .line 104
    const/4 p1, 0x2

    .line 105
    aput v1, v4, p1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v3, v4, p1

    .line 109
    .line 110
    aput v5, v4, v0

    .line 111
    .line 112
    aput v6, v4, v2

    .line 113
    .line 114
    const/4 p1, 0x6

    .line 115
    aput v7, v4, p1

    .line 116
    .line 117
    const/4 p1, 0x7

    .line 118
    aput p3, v4, p1

    .line 119
    .line 120
    iget-object p0, p0, Ll/k5g0;->o:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public s(F)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/k5g0;->r:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/k5g0;->r:J

    .line 14
    .line 15
    :cond_0
    iget-wide v0, p0, Ll/k5g0;->i:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-wide v0, p0, Ll/k5g0;->r:J

    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iget-wide v2, p0, Ll/k5g0;->r:J

    .line 32
    .line 33
    sub-long/2addr v0, v2

    .line 34
    iget-wide v2, p0, Ll/k5g0;->i:J

    .line 35
    .line 36
    cmp-long v0, v0, v2

    .line 37
    .line 38
    if-lez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/k5g0;->g()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/k5g0;->z:Ll/k5g0$b;

    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-interface {p0}, Ll/k5g0$b;->stickerRenderFinished()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object p0, p0, Ll/k5g0;->u:Ll/lgl;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/lgl;->b(F)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public t([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k5g0;->f:[F

    .line 2
    .line 3
    return-void
.end method

.method public u(J)V
    .locals 1

    .line 1
    iput-wide p1, p0, Ll/k5g0;->l:J

    .line 2
    .line 3
    iget-object v0, p0, Ll/k5g0;->v:Ll/iqf;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Ll/iqf;->b(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/k5g0;->o()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
