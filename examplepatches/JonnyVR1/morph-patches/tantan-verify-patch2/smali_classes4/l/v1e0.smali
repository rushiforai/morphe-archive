.class public Ll/v1e0;
.super Lcom/sunshine/engine/base/a;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wg60;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/wg60;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/xg60;",
            ">;"
        }
    .end annotation
.end field

.field private E:J

.field private F:J

.field private G:J

.field private H:Ll/kk90;

.field private I:Z

.field private J:Z

.field private K:J

.field private L:J


# direct methods
.method public constructor <init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sunshine/engine/base/a;-><init>(Lcom/sunshine/engine/base/s;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x6

    .line 5
    iput p1, p0, Ll/v1e0;->A:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 27
    .line 28
    const-wide/16 p1, -0x1

    .line 29
    .line 30
    iput-wide p1, p0, Ll/v1e0;->E:J

    .line 31
    .line 32
    iput-wide p1, p0, Ll/v1e0;->F:J

    .line 33
    .line 34
    iput-wide p1, p0, Ll/v1e0;->G:J

    .line 35
    .line 36
    new-instance p3, Ll/kk90;

    .line 37
    .line 38
    const/4 p4, 0x0

    .line 39
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    const/high16 v0, 0x3f800000    # 1.0f

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "spring"

    .line 50
    .line 51
    invoke-direct {p3, p4, v0, v1}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iput-object p3, p0, Ll/v1e0;->H:Ll/kk90;

    .line 55
    .line 56
    const/4 p3, 0x0

    .line 57
    iput-boolean p3, p0, Ll/v1e0;->I:Z

    .line 58
    .line 59
    iput-boolean p3, p0, Ll/v1e0;->J:Z

    .line 60
    .line 61
    iput-wide p1, p0, Ll/v1e0;->K:J

    .line 62
    .line 63
    iput-wide p1, p0, Ll/v1e0;->L:J

    .line 64
    .line 65
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 66
    .line 67
    iget-object p1, p0, Ll/drf0;->a:Ljava/lang/Object;

    .line 68
    .line 69
    iput-object p1, p0, Ll/drf0;->b:Ljava/lang/Object;

    .line 70
    .line 71
    return-void
.end method

.method private l()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/v1e0;->I:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/v1e0;->H:Ll/kk90;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/sunshine/engine/base/a;->f()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p0, Ll/v1e0;->A:I

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    mul-float/2addr v0, v1

    .line 28
    float-to-int v0, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    iget v0, p0, Ll/v1e0;->A:I

    .line 31
    .line 32
    :goto_1
    iget-object v1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-le v0, v1, :cond_6

    .line 39
    .line 40
    iget v0, p0, Ll/v1e0;->A:I

    .line 41
    .line 42
    iget-object v1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sub-int/2addr v0, v1

    .line 49
    invoke-direct {p0, v0}, Ll/v1e0;->n(I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_6

    .line 54
    .line 55
    iget-object v0, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-lez v0, :cond_6

    .line 62
    .line 63
    iget-object v1, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Ll/wg60;

    .line 71
    .line 72
    invoke-static {}, Ll/a2j0;->h()J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    iput-wide v3, p0, Ll/v1e0;->F:J

    .line 77
    .line 78
    iget-object v3, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    const/4 v4, 0x1

    .line 85
    if-ne v3, v4, :cond_2

    .line 86
    .line 87
    iget-object v3, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Ll/xg60;

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_2
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    double-to-float v3, v3

    .line 101
    const/4 v4, 0x0

    .line 102
    :goto_2
    iget-object v5, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-ge v2, v5, :cond_3

    .line 109
    .line 110
    iget-object v4, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Ll/xg60;

    .line 117
    .line 118
    if-eqz v4, :cond_4

    .line 119
    .line 120
    iget-object v5, v4, Ll/xg60;->c:Ll/kk90;

    .line 121
    .line 122
    invoke-virtual {v5}, Ll/ok90;->c()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    check-cast v5, Ljava/lang/Float;

    .line 127
    .line 128
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    iget-object v6, v4, Ll/xg60;->c:Ll/kk90;

    .line 133
    .line 134
    invoke-virtual {v6}, Ll/ok90;->g()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    check-cast v6, Ljava/lang/Float;

    .line 139
    .line 140
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    invoke-static {v3, v5, v6}, Ll/a2j0;->i(FFF)Z

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    if-eqz v5, :cond_4

    .line 149
    .line 150
    :cond_3
    move-object v2, v4

    .line 151
    goto :goto_3

    .line 152
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :goto_3
    if-eqz v2, :cond_6

    .line 156
    .line 157
    invoke-virtual {v2, p0, v1}, Ll/xg60;->a(Ll/v1e0;Ll/wg60;)V

    .line 158
    .line 159
    .line 160
    iget-boolean v2, p0, Ll/v1e0;->I:Z

    .line 161
    .line 162
    if-nez v2, :cond_5

    .line 163
    .line 164
    iget-boolean v2, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 165
    .line 166
    if-eqz v2, :cond_5

    .line 167
    .line 168
    const/4 v2, 0x4

    .line 169
    if-le v0, v2, :cond_5

    .line 170
    .line 171
    iget-wide v2, p0, Ll/v1e0;->G:J

    .line 172
    .line 173
    iget v0, v1, Ll/wg60;->e:I

    .line 174
    .line 175
    int-to-double v4, v0

    .line 176
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 177
    .line 178
    .line 179
    move-result-wide v6

    .line 180
    mul-double/2addr v4, v6

    .line 181
    double-to-long v4, v4

    .line 182
    sub-long/2addr v2, v4

    .line 183
    iput-wide v2, v1, Ll/wg60;->f:J

    .line 184
    .line 185
    :cond_5
    iget-object v0, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 186
    .line 187
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    :cond_6
    return-void
.end method

.method private n(I)Z
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/v1e0;->I:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/v1e0;->J:Z

    .line 7
    .line 8
    iput-boolean v1, p0, Ll/v1e0;->J:Z

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    const/4 v0, 0x2

    .line 12
    const/4 v2, 0x1

    .line 13
    if-le p1, v0, :cond_1

    .line 14
    .line 15
    return v2

    .line 16
    :cond_1
    invoke-static {}, Ll/a2j0;->h()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    iget-wide v5, p0, Ll/v1e0;->F:J

    .line 21
    .line 22
    sub-long/2addr v3, v5

    .line 23
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    iget-wide p0, p0, Ll/v1e0;->E:J

    .line 28
    .line 29
    cmp-long p0, v3, p0

    .line 30
    .line 31
    if-ltz p0, :cond_2

    .line 32
    .line 33
    return v2

    .line 34
    :cond_2
    return v1
.end method

.method private o(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wg60;

    .line 18
    .line 19
    iget-wide v2, p0, Ll/v1e0;->G:J

    .line 20
    .line 21
    invoke-virtual {v1, p0, p1, v2, v3}, Ll/wg60;->a(Ll/v1e0;Landroid/graphics/Canvas;J)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/v1e0;->l()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/v1e0;->o(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/sunshine/engine/base/a;->r:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/v1e0;->I:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/sunshine/engine/base/a;->f()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    cmpl-float p1, p1, v0

    .line 22
    .line 23
    if-ltz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/sunshine/engine/base/a;->n:Z

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->a:Lcom/sunshine/engine/base/s;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/sunshine/engine/base/s;->e()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public d(Landroid/graphics/Canvas;J)Z
    .locals 0

    .line 1
    iput-wide p2, p0, Ll/v1e0;->G:J

    .line 2
    .line 3
    invoke-super {p0, p1, p2, p3}, Lcom/sunshine/engine/base/a;->d(Landroid/graphics/Canvas;J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Lorg/xml/sax/helpers/DefaultHandler;
    .locals 1

    .line 1
    new-instance v0, Ll/y1e0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y1e0;-><init>(Ll/v1e0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public h(F)Z
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/v1e0;->I:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-gtz p1, :cond_1

    .line 13
    .line 14
    iget-boolean p0, p0, Ll/v1e0;->J:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    return v0
.end method

.method public j(Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Lcom/sunshine/engine/base/a;->j(Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 p2, 0x0

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/xg60;

    .line 22
    .line 23
    iget-object v1, v0, Ll/xg60;->c:Ll/kk90;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/ok90;->g()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, v0, Ll/xg60;->c:Ll/kk90;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/ok90;->c()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ljava/lang/Float;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sub-float/2addr v1, v2

    .line 48
    iget-object v2, v0, Ll/xg60;->d:Ll/lk90;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/ok90;->c()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget-object v0, v0, Ll/xg60;->d:Ll/lk90;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/ok90;->g()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr v2, v0

    .line 73
    div-int/lit8 v2, v2, 0x2

    .line 74
    .line 75
    int-to-long v2, v2

    .line 76
    int-to-float p2, p2

    .line 77
    long-to-float v0, v2

    .line 78
    mul-float/2addr v1, v0

    .line 79
    add-float/2addr p2, v1

    .line 80
    float-to-int p2, p2

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    iget p1, p0, Ll/v1e0;->A:I

    .line 83
    .line 84
    div-int/2addr p2, p1

    .line 85
    int-to-long p1, p2

    .line 86
    iput-wide p1, p0, Ll/v1e0;->E:J

    .line 87
    .line 88
    return-void
.end method

.method public k(Ll/xg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m()Ll/xg60;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/v1e0;->D:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/xg60;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public p(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/v1e0;->A:I

    .line 2
    .line 3
    iget-object p1, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/v1e0;->C:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    :goto_0
    iget-object p1, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget v0, p0, Ll/v1e0;->A:I

    .line 20
    .line 21
    if-ge p1, v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/v1e0;->B:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/wg60;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/wg60;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method
