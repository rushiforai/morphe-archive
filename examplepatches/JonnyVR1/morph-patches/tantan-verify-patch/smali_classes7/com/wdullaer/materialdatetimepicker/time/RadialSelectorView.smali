.class public Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;
    }
.end annotation


# instance fields
.field private final a:Landroid/graphics/Paint;

.field private b:Z

.field private c:Z

.field private d:F

.field private e:F

.field private f:F

.field private g:F

.field private h:F

.field private i:F

.field private j:F

.field private k:Z

.field private l:Z

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:F

.field private r:F

.field private s:I

.field private t:I

.field private u:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;

.field private v:I

.field private w:D

.field private x:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(FFZ[Ljava/lang/Boolean;)I
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 8
    .line 9
    int-to-float v2, v0

    .line 10
    sub-float v2, p2, v2

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    sub-float v0, p2, v0

    .line 14
    .line 15
    mul-float/2addr v2, v0

    .line 16
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 17
    .line 18
    int-to-float v3, v0

    .line 19
    sub-float v3, p1, v3

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    sub-float v0, p1, v0

    .line 23
    .line 24
    mul-float/2addr v3, v0

    .line 25
    add-float/2addr v2, v3

    .line 26
    float-to-double v2, v2

    .line 27
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->l:Z

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    const/4 v5, 0x0

    .line 35
    if-eqz v0, :cond_5

    .line 36
    .line 37
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->p:I

    .line 38
    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    int-to-float p3, v0

    .line 42
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->f:F

    .line 43
    .line 44
    mul-float/2addr p3, v0

    .line 45
    float-to-int p3, p3

    .line 46
    int-to-double v0, p3

    .line 47
    sub-double v0, v2, v0

    .line 48
    .line 49
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    double-to-int p3, v0

    .line 54
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->p:I

    .line 55
    .line 56
    int-to-float v0, v0

    .line 57
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->g:F

    .line 58
    .line 59
    mul-float/2addr v0, v1

    .line 60
    float-to-int v0, v0

    .line 61
    int-to-double v0, v0

    .line 62
    sub-double v0, v2, v0

    .line 63
    .line 64
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    double-to-int v0, v0

    .line 69
    if-gt p3, v0, :cond_1

    .line 70
    .line 71
    move p3, v4

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move p3, v5

    .line 74
    :goto_0
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    aput-object p3, p4, v5

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    int-to-float p3, v0

    .line 82
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->f:F

    .line 83
    .line 84
    mul-float/2addr p3, v6

    .line 85
    float-to-int p3, p3

    .line 86
    iget v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->t:I

    .line 87
    .line 88
    sub-int/2addr p3, v7

    .line 89
    int-to-float v8, v0

    .line 90
    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->g:F

    .line 91
    .line 92
    mul-float/2addr v8, v9

    .line 93
    float-to-int v8, v8

    .line 94
    add-int/2addr v8, v7

    .line 95
    int-to-float v0, v0

    .line 96
    add-float/2addr v9, v6

    .line 97
    const/high16 v6, 0x40000000    # 2.0f

    .line 98
    .line 99
    div-float/2addr v9, v6

    .line 100
    mul-float/2addr v0, v9

    .line 101
    float-to-int v0, v0

    .line 102
    int-to-double v6, p3

    .line 103
    cmpl-double p3, v2, v6

    .line 104
    .line 105
    if-ltz p3, :cond_3

    .line 106
    .line 107
    int-to-double v6, v0

    .line 108
    cmpg-double p3, v2, v6

    .line 109
    .line 110
    if-gtz p3, :cond_3

    .line 111
    .line 112
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 113
    .line 114
    aput-object p3, p4, v5

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    int-to-double v6, v8

    .line 118
    cmpg-double p3, v2, v6

    .line 119
    .line 120
    if-gtz p3, :cond_4

    .line 121
    .line 122
    int-to-double v6, v0

    .line 123
    cmpl-double p3, v2, v6

    .line 124
    .line 125
    if-ltz p3, :cond_4

    .line 126
    .line 127
    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 128
    .line 129
    aput-object p3, p4, v5

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_4
    return v1

    .line 133
    :cond_5
    if-nez p3, :cond_6

    .line 134
    .line 135
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->s:I

    .line 136
    .line 137
    int-to-double p3, p3

    .line 138
    sub-double p3, v2, p3

    .line 139
    .line 140
    invoke-static {p3, p4}, Ljava/lang/Math;->abs(D)D

    .line 141
    .line 142
    .line 143
    move-result-wide p3

    .line 144
    double-to-int p3, p3

    .line 145
    iget p4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->p:I

    .line 146
    .line 147
    int-to-float p4, p4

    .line 148
    const/high16 v0, 0x3f800000    # 1.0f

    .line 149
    .line 150
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->h:F

    .line 151
    .line 152
    sub-float/2addr v0, v6

    .line 153
    mul-float/2addr p4, v0

    .line 154
    float-to-int p4, p4

    .line 155
    if-le p3, p4, :cond_6

    .line 156
    .line 157
    return v1

    .line 158
    :cond_6
    :goto_1
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 159
    .line 160
    int-to-float p3, p3

    .line 161
    sub-float p3, p2, p3

    .line 162
    .line 163
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 164
    .line 165
    .line 166
    move-result p3

    .line 167
    float-to-double p3, p3

    .line 168
    div-double/2addr p3, v2

    .line 169
    invoke-static {p3, p4}, Ljava/lang/Math;->asin(D)D

    .line 170
    .line 171
    .line 172
    move-result-wide p3

    .line 173
    const-wide v0, 0x4066800000000000L    # 180.0

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    mul-double/2addr p3, v0

    .line 179
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    div-double/2addr p3, v0

    .line 185
    double-to-int p3, p3

    .line 186
    iget p4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 187
    .line 188
    int-to-float p4, p4

    .line 189
    cmpl-float p1, p1, p4

    .line 190
    .line 191
    if-lez p1, :cond_7

    .line 192
    .line 193
    move p1, v4

    .line 194
    goto :goto_2

    .line 195
    :cond_7
    move p1, v5

    .line 196
    :goto_2
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 197
    .line 198
    int-to-float p0, p0

    .line 199
    cmpg-float p0, p2, p0

    .line 200
    .line 201
    if-gez p0, :cond_8

    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_8
    move v4, v5

    .line 205
    :goto_3
    if-eqz p1, :cond_9

    .line 206
    .line 207
    if-eqz v4, :cond_9

    .line 208
    .line 209
    rsub-int/lit8 p0, p3, 0x5a

    .line 210
    .line 211
    return p0

    .line 212
    :cond_9
    if-eqz p1, :cond_a

    .line 213
    .line 214
    if-nez v4, :cond_a

    .line 215
    .line 216
    add-int/lit8 p3, p3, 0x5a

    .line 217
    .line 218
    return p3

    .line 219
    :cond_a
    if-nez p1, :cond_b

    .line 220
    .line 221
    if-nez v4, :cond_b

    .line 222
    .line 223
    rsub-int p0, p3, 0x10e

    .line 224
    .line 225
    return p0

    .line 226
    :cond_b
    if-nez p1, :cond_c

    .line 227
    .line 228
    if-eqz v4, :cond_c

    .line 229
    .line 230
    add-int/lit16 p3, p3, 0x10e

    .line 231
    .line 232
    :cond_c
    return p3
.end method

.method public b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;ZZIZ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "RadialSelectorView"

    .line 6
    .line 7
    const-string p1, "This RadialSelectorView may only be initialized once."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->u()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->z()Z

    .line 33
    .line 34
    .line 35
    const/16 v0, 0xff

    .line 36
    .line 37
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->m:I

    .line 38
    .line 39
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->f()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->k:Z

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget-object v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 52
    .line 53
    if-eq p2, v0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->c:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->d:F

    .line 67
    .line 68
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->a:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->e:F

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->d:I

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->d:F

    .line 92
    .line 93
    :goto_1
    iput-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->l:Z

    .line 94
    .line 95
    if-eqz p3, :cond_3

    .line 96
    .line 97
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->k:I

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->f:F

    .line 108
    .line 109
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->m:I

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->g:F

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_3
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->l:I

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->h:F

    .line 133
    .line 134
    :goto_2
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->w:I

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->i:F

    .line 145
    .line 146
    const/high16 p1, 0x3f800000    # 1.0f

    .line 147
    .line 148
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->j:F

    .line 149
    .line 150
    const/4 p2, -0x1

    .line 151
    if-eqz p4, :cond_4

    .line 152
    .line 153
    move p3, p2

    .line 154
    goto :goto_3

    .line 155
    :cond_4
    move p3, v1

    .line 156
    :goto_3
    int-to-float p3, p3

    .line 157
    const v0, 0x3d4ccccd    # 0.05f

    .line 158
    .line 159
    .line 160
    mul-float/2addr p3, v0

    .line 161
    add-float/2addr p3, p1

    .line 162
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->q:F

    .line 163
    .line 164
    if-eqz p4, :cond_5

    .line 165
    .line 166
    move p2, v1

    .line 167
    :cond_5
    int-to-float p2, p2

    .line 168
    const p3, 0x3e99999a    # 0.3f

    .line 169
    .line 170
    .line 171
    mul-float/2addr p2, p3

    .line 172
    add-float/2addr p2, p1

    .line 173
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->r:F

    .line 174
    .line 175
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;

    .line 176
    .line 177
    const/4 p2, 0x0

    .line 178
    invoke-direct {p1, p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$a;)V

    .line 179
    .line 180
    .line 181
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->u:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;

    .line 182
    .line 183
    const/4 p1, 0x0

    .line 184
    invoke-virtual {p0, p5, p6, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 185
    .line 186
    .line 187
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 188
    .line 189
    return-void
.end method

.method public c(IZZ)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->v:I

    .line 2
    .line 3
    int-to-double v0, p1

    .line 4
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    mul-double/2addr v0, v2

    .line 10
    const-wide v2, 0x4066800000000000L    # 180.0

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    div-double/2addr v0, v2

    .line 16
    iput-wide v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->w:D

    .line 17
    .line 18
    iput-boolean p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->x:Z

    .line 19
    .line 20
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->l:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->f:F

    .line 27
    .line 28
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->h:F

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->g:F

    .line 32
    .line 33
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->h:F

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public getDisappearAnimator()Landroid/animation/ObjectAnimator;
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->q:F

    .line 18
    .line 19
    const v4, 0x3e4ccccd    # 0.2f

    .line 20
    .line 21
    .line 22
    invoke-static {v4, v3}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->r:F

    .line 27
    .line 28
    invoke-static {v1, v4}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const-string v5, "animationRadiusMultiplier"

    .line 33
    .line 34
    filled-new-array {v2, v3, v4}, [Landroid/animation/Keyframe;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v5, v2}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v0, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-static {v1, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "alpha"

    .line 51
    .line 52
    filled-new-array {v3, v0}, [Landroid/animation/Keyframe;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v1, v0}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v2, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-wide/16 v1, 0x1f4

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->u:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;

    .line 75
    .line 76
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 77
    .line 78
    .line 79
    return-object v0

    .line 80
    :cond_1
    :goto_0
    const-string p0, "RadialSelectorView"

    .line 81
    .line 82
    const-string v0, "RadialSelectorView was not ready for animation."

    .line 83
    .line 84
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    return-object p0
.end method

.method public getReappearAnimator()Landroid/animation/ObjectAnimator;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->r:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v1, v0}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->r:F

    .line 18
    .line 19
    const v3, 0x3e4ccccd    # 0.2f

    .line 20
    .line 21
    .line 22
    invoke-static {v3, v2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->q:F

    .line 27
    .line 28
    const v5, 0x3f570a3d    # 0.84f

    .line 29
    .line 30
    .line 31
    invoke-static {v5, v4}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const/high16 v5, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-static {v5, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v7, "animationRadiusMultiplier"

    .line 42
    .line 43
    filled-new-array {v0, v2, v4, v6}, [Landroid/animation/Keyframe;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v7, v0}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v3, v1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v5, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const-string v4, "alpha"

    .line 64
    .line 65
    filled-new-array {v2, v1, v3}, [Landroid/animation/Keyframe;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v4, v1}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    filled-new-array {v0, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-wide/16 v1, 0x271

    .line 82
    .line 83
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->u:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView$b;

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :cond_1
    :goto_0
    const-string p0, "RadialSelectorView"

    .line 94
    .line 95
    const-string v0, "RadialSelectorView was not ready for animation."

    .line 96
    .line 97
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    const/4 p0, 0x0

    .line 101
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    div-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    div-int/lit8 v0, v0, 0x2

    .line 31
    .line 32
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 33
    .line 34
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 35
    .line 36
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    int-to-float v0, v0

    .line 41
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->d:F

    .line 42
    .line 43
    mul-float/2addr v0, v2

    .line 44
    float-to-int v0, v0

    .line 45
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->p:I

    .line 46
    .line 47
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->k:Z

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    int-to-float v2, v0

    .line 52
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->e:F

    .line 53
    .line 54
    mul-float/2addr v2, v3

    .line 55
    float-to-int v2, v2

    .line 56
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 57
    .line 58
    int-to-double v3, v3

    .line 59
    int-to-double v5, v2

    .line 60
    const-wide/high16 v7, 0x3fe8000000000000L    # 0.75

    .line 61
    .line 62
    mul-double/2addr v5, v7

    .line 63
    sub-double/2addr v3, v5

    .line 64
    double-to-int v2, v3

    .line 65
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 66
    .line 67
    :cond_1
    int-to-float v0, v0

    .line 68
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->i:F

    .line 69
    .line 70
    mul-float/2addr v0, v2

    .line 71
    float-to-int v0, v0

    .line 72
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->t:I

    .line 73
    .line 74
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c:Z

    .line 75
    .line 76
    :cond_2
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->p:I

    .line 77
    .line 78
    int-to-float v0, v0

    .line 79
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->h:F

    .line 80
    .line 81
    mul-float/2addr v0, v2

    .line 82
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->j:F

    .line 83
    .line 84
    mul-float/2addr v0, v2

    .line 85
    float-to-int v0, v0

    .line 86
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->s:I

    .line 87
    .line 88
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 89
    .line 90
    int-to-double v3, v0

    .line 91
    iget-wide v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->w:D

    .line 92
    .line 93
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    .line 94
    .line 95
    .line 96
    move-result-wide v5

    .line 97
    mul-double/2addr v3, v5

    .line 98
    double-to-int v0, v3

    .line 99
    add-int/2addr v2, v0

    .line 100
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 101
    .line 102
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->s:I

    .line 103
    .line 104
    int-to-double v3, v3

    .line 105
    iget-wide v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->w:D

    .line 106
    .line 107
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 108
    .line 109
    .line 110
    move-result-wide v5

    .line 111
    mul-double/2addr v3, v5

    .line 112
    double-to-int v3, v3

    .line 113
    sub-int/2addr v0, v3

    .line 114
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 115
    .line 116
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->m:I

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 119
    .line 120
    .line 121
    int-to-float v3, v2

    .line 122
    int-to-float v4, v0

    .line 123
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->t:I

    .line 124
    .line 125
    int-to-float v5, v5

    .line 126
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 127
    .line 128
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 129
    .line 130
    .line 131
    iget-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->x:Z

    .line 132
    .line 133
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->v:I

    .line 134
    .line 135
    rem-int/lit8 v6, v6, 0x1e

    .line 136
    .line 137
    if-eqz v6, :cond_3

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_3
    const/4 v1, 0x0

    .line 141
    :goto_0
    or-int/2addr v1, v5

    .line 142
    const/16 v5, 0xff

    .line 143
    .line 144
    if-eqz v1, :cond_4

    .line 145
    .line 146
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 147
    .line 148
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 149
    .line 150
    .line 151
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->t:I

    .line 152
    .line 153
    mul-int/lit8 v1, v1, 0x2

    .line 154
    .line 155
    div-int/lit8 v1, v1, 0x7

    .line 156
    .line 157
    int-to-float v1, v1

    .line 158
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 159
    .line 160
    invoke-virtual {p1, v3, v4, v1, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_4
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->s:I

    .line 165
    .line 166
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->t:I

    .line 167
    .line 168
    sub-int/2addr v0, v1

    .line 169
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 170
    .line 171
    int-to-double v2, v0

    .line 172
    iget-wide v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->w:D

    .line 173
    .line 174
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 175
    .line 176
    .line 177
    move-result-wide v6

    .line 178
    mul-double/2addr v6, v2

    .line 179
    double-to-int v0, v6

    .line 180
    add-int/2addr v0, v1

    .line 181
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 182
    .line 183
    iget-wide v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->w:D

    .line 184
    .line 185
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    .line 186
    .line 187
    .line 188
    move-result-wide v6

    .line 189
    mul-double/2addr v2, v6

    .line 190
    double-to-int v2, v2

    .line 191
    sub-int/2addr v1, v2

    .line 192
    move v2, v0

    .line 193
    move v0, v1

    .line 194
    :goto_1
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 195
    .line 196
    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 197
    .line 198
    .line 199
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 200
    .line 201
    const/high16 v3, 0x40400000    # 3.0f

    .line 202
    .line 203
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 204
    .line 205
    .line 206
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->n:I

    .line 207
    .line 208
    int-to-float v4, v1

    .line 209
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->o:I

    .line 210
    .line 211
    int-to-float v5, v1

    .line 212
    int-to-float v6, v2

    .line 213
    int-to-float v7, v0

    .line 214
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a:Landroid/graphics/Paint;

    .line 215
    .line 216
    move-object v3, p1

    .line 217
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 218
    .line 219
    .line 220
    :cond_5
    :goto_2
    return-void
.end method

.method public setAnimationRadiusMultiplier(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->j:F

    .line 2
    .line 3
    return-void
.end method
