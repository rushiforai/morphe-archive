.class public Ll/io0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Ll/kk90;

.field protected b:Ll/kk90;

.field public c:Ll/drf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/drf0<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected d:Ll/li80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/li80<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Ll/lk90;

.field protected f:Ll/kk90;

.field protected g:Ll/lk90;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kk90;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, v1}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/io0;->a:Ll/kk90;

    .line 15
    .line 16
    new-instance v0, Ll/kk90;

    .line 17
    .line 18
    invoke-direct {v0, v1, v1}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/io0;->b:Ll/kk90;

    .line 22
    .line 23
    new-instance v0, Ll/drf0;

    .line 24
    .line 25
    invoke-direct {v0, v1, v1}, Ll/drf0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/io0;->c:Ll/drf0;

    .line 29
    .line 30
    new-instance v0, Ll/li80;

    .line 31
    .line 32
    invoke-direct {v0, v1, v1}, Ll/li80;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/io0;->d:Ll/li80;

    .line 36
    .line 37
    new-instance v0, Ll/lk90;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1, v1}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/io0;->e:Ll/lk90;

    .line 48
    .line 49
    new-instance v0, Ll/kk90;

    .line 50
    .line 51
    const/high16 v1, 0x3f800000    # 1.0f

    .line 52
    .line 53
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-direct {v0, v1, v1}, Ll/kk90;-><init>(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/io0;->f:Ll/kk90;

    .line 61
    .line 62
    new-instance v0, Ll/lk90;

    .line 63
    .line 64
    const/16 v1, 0x32

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const/16 v2, 0xff

    .line 71
    .line 72
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-direct {v0, v1, v2}, Ll/lk90;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ll/io0;->g:Ll/lk90;

    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public a(FLcom/sunshine/engine/base/a;)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    :goto_0
    move p1, v0

    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    cmpl-float v1, p1, v0

    .line 11
    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    :goto_1
    iget-object v0, p0, Ll/io0;->a:Ll/kk90;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/io0;->b:Ll/kk90;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ll/kk90;->l(F)Ljava/lang/Float;

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
    iget-object v2, p0, Ll/io0;->f:Ll/kk90;

    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ll/kk90;->l(F)Ljava/lang/Float;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v2}, Ll/a2j0;->e(F)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x0

    .line 50
    if-nez v3, :cond_4

    .line 51
    .line 52
    invoke-static {v2}, Ll/a2j0;->e(F)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    goto/16 :goto_2

    .line 59
    .line 60
    :cond_2
    iget-object v3, p0, Ll/io0;->c:Ll/drf0;

    .line 61
    .line 62
    iget-object v3, v3, Ll/drf0;->a:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v3, Ljava/lang/Float;

    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    mul-float/2addr v3, v2

    .line 71
    iget-object v5, p0, Ll/io0;->c:Ll/drf0;

    .line 72
    .line 73
    iget-object v5, v5, Ll/drf0;->b:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v5, Ljava/lang/Float;

    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    mul-float/2addr v5, v2

    .line 82
    iget-object v6, p2, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 83
    .line 84
    iget-object v7, v6, Ll/cce;->a:Landroid/graphics/RectF;

    .line 85
    .line 86
    sub-float v8, v0, v3

    .line 87
    .line 88
    iput v8, v7, Landroid/graphics/RectF;->left:F

    .line 89
    .line 90
    sub-float v8, v1, v5

    .line 91
    .line 92
    iput v8, v7, Landroid/graphics/RectF;->top:F

    .line 93
    .line 94
    add-float/2addr v0, v3

    .line 95
    iput v0, v7, Landroid/graphics/RectF;->right:F

    .line 96
    .line 97
    add-float/2addr v1, v5

    .line 98
    iput v1, v7, Landroid/graphics/RectF;->bottom:F

    .line 99
    .line 100
    iget-object v0, p0, Ll/io0;->e:Ll/lk90;

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    int-to-float v0, v0

    .line 111
    iput v0, v6, Ll/cce;->d:F

    .line 112
    .line 113
    iget-object v0, p2, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 114
    .line 115
    iget-object v1, v0, Ll/cce;->b:Landroid/graphics/PointF;

    .line 116
    .line 117
    iget-object v0, v0, Ll/cce;->a:Landroid/graphics/RectF;

    .line 118
    .line 119
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 120
    .line 121
    iget-object v3, p0, Ll/io0;->d:Ll/li80;

    .line 122
    .line 123
    iget-object v3, v3, Ll/li80;->a:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v3, Ljava/lang/Float;

    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    mul-float/2addr v3, v2

    .line 132
    add-float/2addr v0, v3

    .line 133
    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 134
    .line 135
    iget-object v0, p2, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 136
    .line 137
    iget-object v1, v0, Ll/cce;->b:Landroid/graphics/PointF;

    .line 138
    .line 139
    iget-object v0, v0, Ll/cce;->a:Landroid/graphics/RectF;

    .line 140
    .line 141
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 142
    .line 143
    iget-object v3, p0, Ll/io0;->d:Ll/li80;

    .line 144
    .line 145
    iget-object v3, v3, Ll/li80;->b:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v3, Ljava/lang/Float;

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    mul-float/2addr v3, v2

    .line 154
    add-float/2addr v0, v3

    .line 155
    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 156
    .line 157
    iget-object v0, p2, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 158
    .line 159
    iget-object p0, p0, Ll/io0;->g:Ll/lk90;

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Ll/lk90;->l(F)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    iput p0, v0, Ll/cce;->f:I

    .line 170
    .line 171
    iget-object p0, p2, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 172
    .line 173
    iget p0, p0, Ll/cce;->f:I

    .line 174
    .line 175
    int-to-float p0, p0

    .line 176
    invoke-static {p0}, Ll/a2j0;->e(F)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_3

    .line 181
    .line 182
    iget-boolean p0, p2, Lcom/sunshine/engine/base/a;->n:Z

    .line 183
    .line 184
    if-nez p0, :cond_3

    .line 185
    .line 186
    return v4

    .line 187
    :cond_3
    const/4 p0, 0x1

    .line 188
    return p0

    .line 189
    :cond_4
    :goto_2
    return v4
.end method
