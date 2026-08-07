.class public Ll/wg60;
.super Ll/mrf0;
.source "SourceFile"


# instance fields
.field protected e:I

.field protected f:J

.field protected g:Landroid/graphics/Rect;

.field protected h:Ll/io0;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/mrf0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e8

    .line 5
    .line 6
    iput v0, p0, Ll/wg60;->e:I

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Ll/wg60;->f:J

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/wg60;->g:Landroid/graphics/Rect;

    .line 18
    .line 19
    new-instance v0, Ll/io0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/io0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/wg60;->h:Ll/io0;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/wg60;->i:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a(Ll/v1e0;Landroid/graphics/Canvas;J)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/mrf0;->a:Z

    .line 8
    .line 9
    iget-object v1, p0, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 13
    .line 14
    .line 15
    iget-wide v1, p0, Ll/wg60;->f:J

    .line 16
    .line 17
    const-wide/16 v3, -0x1

    .line 18
    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iput-wide p3, p0, Ll/wg60;->f:J

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Ll/wg60;->i:Ljava/lang/String;

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    if-nez v1, :cond_3

    .line 31
    .line 32
    iget-wide v4, p0, Ll/wg60;->f:J

    .line 33
    .line 34
    sub-long/2addr p3, v4

    .line 35
    long-to-float p3, p3

    .line 36
    iget p4, p0, Ll/wg60;->e:I

    .line 37
    .line 38
    int-to-float p4, p4

    .line 39
    div-float/2addr p3, p4

    .line 40
    cmpg-float p4, p3, v2

    .line 41
    .line 42
    if-gtz p4, :cond_2

    .line 43
    .line 44
    iget-object p4, p0, Ll/wg60;->h:Ll/io0;

    .line 45
    .line 46
    invoke-virtual {p4, p3, p1}, Ll/io0;->a(FLcom/sunshine/engine/base/a;)Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    iput-boolean v3, p0, Ll/mrf0;->a:Z

    .line 53
    .line 54
    iget-object p3, p0, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 55
    .line 56
    iget-object p4, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 57
    .line 58
    iget-object p4, p4, Ll/cce;->a:Landroid/graphics/RectF;

    .line 59
    .line 60
    invoke-virtual {p3, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 64
    .line 65
    invoke-virtual {p1, p3}, Lcom/sunshine/engine/base/a;->g(Landroid/graphics/Matrix;)V

    .line 66
    .line 67
    .line 68
    iget-object p3, p1, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 69
    .line 70
    iget-object p0, p0, Ll/wg60;->g:Landroid/graphics/Rect;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 73
    .line 74
    invoke-static {p2, p3, p0, p1}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return v0

    .line 78
    :cond_2
    invoke-virtual {p0}, Ll/wg60;->b()V

    .line 79
    .line 80
    .line 81
    return v3

    .line 82
    :cond_3
    iget-object v4, p1, Lcom/sunshine/engine/base/a;->u:Ljava/util/Map;

    .line 83
    .line 84
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Landroid/graphics/Bitmap;

    .line 89
    .line 90
    const/4 v4, 0x0

    .line 91
    if-nez v1, :cond_4

    .line 92
    .line 93
    iget-object v5, p1, Lcom/sunshine/engine/base/a;->w:Ljava/util/Map;

    .line 94
    .line 95
    iget-object v6, p0, Ll/wg60;->i:Ljava/lang/String;

    .line 96
    .line 97
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    check-cast v5, Lcom/sunshine/engine/base/r$a;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    move-object v5, v4

    .line 105
    :goto_0
    if-nez v1, :cond_6

    .line 106
    .line 107
    if-eqz v5, :cond_5

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    return v0

    .line 111
    :cond_6
    :goto_1
    iget-wide v6, p0, Ll/wg60;->f:J

    .line 112
    .line 113
    sub-long/2addr p3, v6

    .line 114
    long-to-float p3, p3

    .line 115
    iget p4, p0, Ll/wg60;->e:I

    .line 116
    .line 117
    int-to-float p4, p4

    .line 118
    div-float/2addr p3, p4

    .line 119
    cmpg-float p4, p3, v2

    .line 120
    .line 121
    if-gtz p4, :cond_9

    .line 122
    .line 123
    iget-object p4, p0, Ll/wg60;->h:Ll/io0;

    .line 124
    .line 125
    invoke-virtual {p4, p3, p1}, Ll/io0;->a(FLcom/sunshine/engine/base/a;)Z

    .line 126
    .line 127
    .line 128
    move-result p4

    .line 129
    if-eqz p4, :cond_8

    .line 130
    .line 131
    iput-boolean v3, p0, Ll/mrf0;->a:Z

    .line 132
    .line 133
    iget-object p4, p0, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 134
    .line 135
    iget-object v2, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 136
    .line 137
    iget-object v2, v2, Ll/cce;->a:Landroid/graphics/RectF;

    .line 138
    .line 139
    invoke-virtual {p4, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 143
    .line 144
    invoke-virtual {p1, p0}, Lcom/sunshine/engine/base/a;->g(Landroid/graphics/Matrix;)V

    .line 145
    .line 146
    .line 147
    if-eqz v1, :cond_7

    .line 148
    .line 149
    iget-object p0, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 150
    .line 151
    invoke-static {p2, v1, v4, p0}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_7
    invoke-static {p2, v5, p3, p1}, Lcom/sunshine/engine/base/r;->b(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V

    .line 156
    .line 157
    .line 158
    :cond_8
    :goto_2
    return v0

    .line 159
    :cond_9
    invoke-virtual {p0}, Ll/wg60;->b()V

    .line 160
    .line 161
    .line 162
    return v3
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mrf0;->a:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/mrf0;->d:Ljava/lang/String;

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/wg60;->f:J

    .line 10
    .line 11
    return-void
.end method

.method public c(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wg60;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
