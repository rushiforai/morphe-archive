.class public Lcom/tencent/liteav/beauty/d;
.super Lcom/tencent/liteav/basic/module/a;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/beauty/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/d$a;,
        Lcom/tencent/liteav/beauty/d$b;,
        Lcom/tencent/liteav/beauty/d$c;,
        Lcom/tencent/liteav/beauty/d$e;,
        Lcom/tencent/liteav/beauty/d$g;,
        Lcom/tencent/liteav/beauty/d$f;,
        Lcom/tencent/liteav/beauty/d$d;
    }
.end annotation


# instance fields
.field protected a:Landroid/content/Context;

.field protected b:Z

.field protected c:Z

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:Lcom/tencent/liteav/basic/c/a;

.field protected h:Lcom/tencent/liteav/beauty/c;

.field protected i:Lcom/tencent/liteav/beauty/d$b;

.field protected j:Lcom/tencent/liteav/beauty/d$c;

.field k:Lcom/tencent/liteav/beauty/f;

.field private l:Lcom/tencent/liteav/beauty/d$d;

.field private m:J

.field private n:J

.field private o:J

.field private p:Ljava/lang/Object;

.field private q:Lcom/tencent/liteav/beauty/d$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/module/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/beauty/d;->b:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/tencent/liteav/beauty/d;->c:Z

    .line 9
    .line 10
    iput v1, p0, Lcom/tencent/liteav/beauty/d;->d:I

    .line 11
    .line 12
    iput v1, p0, Lcom/tencent/liteav/beauty/d;->e:I

    .line 13
    .line 14
    iput v0, p0, Lcom/tencent/liteav/beauty/d;->f:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;

    .line 18
    .line 19
    new-instance v1, Lcom/tencent/liteav/beauty/d$b;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/tencent/liteav/beauty/d$b;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 27
    .line 28
    sget-object v0, Lcom/tencent/liteav/beauty/d$d;->c:Lcom/tencent/liteav/beauty/d$d;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->l:Lcom/tencent/liteav/beauty/d$d;

    .line 31
    .line 32
    const-wide/16 v0, 0x0

    .line 33
    .line 34
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->m:J

    .line 35
    .line 36
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->o:J

    .line 39
    .line 40
    new-instance v0, Lcom/tencent/liteav/beauty/d$a;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/tencent/liteav/beauty/d$a;-><init>(Lcom/tencent/liteav/beauty/d;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 46
    .line 47
    const-string v0, "activity"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/app/ActivityManager;

    .line 54
    .line 55
    const-string v1, "TXCVideoPreprocessor version: VideoPreprocessor-v1.1"

    .line 56
    .line 57
    const-string v2, "TXCVideoPreprocessor"

    .line 58
    .line 59
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v3, "opengl es version "

    .line 71
    .line 72
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget v3, v0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    .line 76
    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v3, "set GLContext "

    .line 90
    .line 91
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget v0, v0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    .line 105
    .line 106
    const/high16 v1, 0x20000

    .line 107
    .line 108
    if-le v0, v1, :cond_0

    .line 109
    .line 110
    const-string v0, "This devices is OpenGlUtils.OPENGL_ES_3"

    .line 111
    .line 112
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    const/4 v0, 0x3

    .line 116
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a(I)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    const-string v0, "This devices is OpenGlUtils.OPENGL_ES_2"

    .line 121
    .line 122
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const/4 v0, 0x2

    .line 126
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a(I)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    const-string v0, "getDeviceConfigurationInfo opengl Info failed!"

    .line 131
    .line 132
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :goto_0
    iput-object p1, p0, Lcom/tencent/liteav/beauty/d;->a:Landroid/content/Context;

    .line 136
    .line 137
    iput-boolean p2, p0, Lcom/tencent/liteav/beauty/d;->b:Z

    .line 138
    .line 139
    new-instance p2, Lcom/tencent/liteav/beauty/c;

    .line 140
    .line 141
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->a:Landroid/content/Context;

    .line 142
    .line 143
    iget-boolean v1, p0, Lcom/tencent/liteav/beauty/d;->b:Z

    .line 144
    .line 145
    invoke-direct {p2, v0, v1}, Lcom/tencent/liteav/beauty/c;-><init>(Landroid/content/Context;Z)V

    .line 146
    .line 147
    .line 148
    iput-object p2, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 149
    .line 150
    invoke-static {}, Lcom/tencent/liteav/beauty/a;->a()Lcom/tencent/liteav/beauty/a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/a;->a(Landroid/content/Context;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method private a(IIIII)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/beauty/d$c;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lcom/tencent/liteav/beauty/d$c;-><init>(Lcom/tencent/liteav/beauty/d$1;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->o:J

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 24
    .line 25
    iget v1, v0, Lcom/tencent/liteav/beauty/d$c;->b:I

    .line 26
    .line 27
    if-ne p1, v1, :cond_9

    .line 28
    .line 29
    iget v1, v0, Lcom/tencent/liteav/beauty/d$c;->c:I

    .line 30
    .line 31
    if-ne p2, v1, :cond_9

    .line 32
    .line 33
    iget v1, v0, Lcom/tencent/liteav/beauty/d$c;->d:I

    .line 34
    .line 35
    if-ne p3, v1, :cond_9

    .line 36
    .line 37
    iget v1, p0, Lcom/tencent/liteav/beauty/d;->d:I

    .line 38
    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    iget v2, v0, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 42
    .line 43
    if-ne v1, v2, :cond_9

    .line 44
    .line 45
    :cond_1
    iget v1, p0, Lcom/tencent/liteav/beauty/d;->e:I

    .line 46
    .line 47
    if-lez v1, :cond_2

    .line 48
    .line 49
    iget v2, v0, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 50
    .line 51
    if-ne v1, v2, :cond_9

    .line 52
    .line 53
    :cond_2
    iget-object v1, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;

    .line 54
    .line 55
    if-eqz v1, :cond_6

    .line 56
    .line 57
    iget v2, v1, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 58
    .line 59
    if-lez v2, :cond_3

    .line 60
    .line 61
    iget-object v3, v0, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    .line 62
    .line 63
    if-eqz v3, :cond_9

    .line 64
    .line 65
    iget v3, v3, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 66
    .line 67
    if-ne v2, v3, :cond_9

    .line 68
    .line 69
    :cond_3
    iget v2, v1, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 70
    .line 71
    if-lez v2, :cond_4

    .line 72
    .line 73
    iget-object v3, v0, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    .line 74
    .line 75
    if-eqz v3, :cond_9

    .line 76
    .line 77
    iget v3, v3, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 78
    .line 79
    if-ne v2, v3, :cond_9

    .line 80
    .line 81
    :cond_4
    iget v2, v1, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 82
    .line 83
    if-ltz v2, :cond_5

    .line 84
    .line 85
    iget-object v3, v0, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    .line 86
    .line 87
    if-eqz v3, :cond_9

    .line 88
    .line 89
    iget v3, v3, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 90
    .line 91
    if-ne v2, v3, :cond_9

    .line 92
    .line 93
    :cond_5
    iget v1, v1, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 94
    .line 95
    if-ltz v1, :cond_6

    .line 96
    .line 97
    iget-object v2, v0, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    .line 98
    .line 99
    if-eqz v2, :cond_9

    .line 100
    .line 101
    iget v2, v2, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 102
    .line 103
    if-ne v1, v2, :cond_9

    .line 104
    .line 105
    :cond_6
    iget-boolean v1, p0, Lcom/tencent/liteav/beauty/d;->c:Z

    .line 106
    .line 107
    iget-boolean v2, v0, Lcom/tencent/liteav/beauty/d$c;->e:Z

    .line 108
    .line 109
    if-ne v1, v2, :cond_9

    .line 110
    .line 111
    iget v1, v0, Lcom/tencent/liteav/beauty/d$c;->h:I

    .line 112
    .line 113
    if-eq v1, p4, :cond_7

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_7
    if-ne p4, v1, :cond_8

    .line 117
    .line 118
    iget p1, v0, Lcom/tencent/liteav/beauty/d$c;->i:I

    .line 119
    .line 120
    if-eq p5, p1, :cond_15

    .line 121
    .line 122
    :cond_8
    iput p4, v0, Lcom/tencent/liteav/beauty/d$c;->h:I

    .line 123
    .line 124
    iget-object p1, p0, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    .line 125
    .line 126
    iput p4, p1, Lcom/tencent/liteav/beauty/d$b;->k:I

    .line 127
    .line 128
    iput p5, v0, Lcom/tencent/liteav/beauty/d$c;->i:I

    .line 129
    .line 130
    iput p5, p1, Lcom/tencent/liteav/beauty/d$b;->l:I

    .line 131
    .line 132
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 133
    .line 134
    invoke-virtual {p0, p5}, Lcom/tencent/liteav/beauty/c;->b(I)V

    .line 135
    .line 136
    .line 137
    goto/16 :goto_8

    .line 138
    .line 139
    :cond_9
    :goto_0
    const-string v0, "Init sdk"

    .line 140
    .line 141
    const-string v1, "TXCVideoPreprocessor"

    .line 142
    .line 143
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v2, "Input widht "

    .line 149
    .line 150
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v2, " height "

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 172
    .line 173
    iput p1, v0, Lcom/tencent/liteav/beauty/d$c;->b:I

    .line 174
    .line 175
    iput p2, v0, Lcom/tencent/liteav/beauty/d$c;->c:I

    .line 176
    .line 177
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;

    .line 178
    .line 179
    if-eqz v0, :cond_c

    .line 180
    .line 181
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 182
    .line 183
    if-ltz v2, :cond_c

    .line 184
    .line 185
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 186
    .line 187
    if-ltz v2, :cond_c

    .line 188
    .line 189
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 190
    .line 191
    if-lez v2, :cond_c

    .line 192
    .line 193
    iget v0, v0, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 194
    .line 195
    if-lez v0, :cond_c

    .line 196
    .line 197
    const-string v0, "set Crop Rect; init "

    .line 198
    .line 199
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;

    .line 203
    .line 204
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 205
    .line 206
    sub-int v3, p1, v2

    .line 207
    .line 208
    iget v4, v0, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 209
    .line 210
    if-le v3, v4, :cond_a

    .line 211
    .line 212
    move p1, v4

    .line 213
    goto :goto_1

    .line 214
    :cond_a
    sub-int/2addr p1, v2

    .line 215
    :goto_1
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 216
    .line 217
    sub-int v3, p2, v2

    .line 218
    .line 219
    iget v4, v0, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 220
    .line 221
    if-le v3, v4, :cond_b

    .line 222
    .line 223
    move p2, v4

    .line 224
    goto :goto_2

    .line 225
    :cond_b
    sub-int/2addr p2, v2

    .line 226
    :goto_2
    iput p1, v0, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 227
    .line 228
    iput p2, v0, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 229
    .line 230
    :cond_c
    move v3, p1

    .line 231
    move v4, p2

    .line 232
    iget-object p1, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 233
    .line 234
    iget-object p2, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;

    .line 235
    .line 236
    iput-object p2, p1, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    .line 237
    .line 238
    iput p3, p1, Lcom/tencent/liteav/beauty/d$c;->d:I

    .line 239
    .line 240
    iget-boolean p2, p0, Lcom/tencent/liteav/beauty/d;->b:Z

    .line 241
    .line 242
    iput-boolean p2, p1, Lcom/tencent/liteav/beauty/d$c;->a:Z

    .line 243
    .line 244
    iput p4, p1, Lcom/tencent/liteav/beauty/d$c;->h:I

    .line 245
    .line 246
    iput p5, p1, Lcom/tencent/liteav/beauty/d$c;->i:I

    .line 247
    .line 248
    iget p2, p0, Lcom/tencent/liteav/beauty/d;->d:I

    .line 249
    .line 250
    iput p2, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 251
    .line 252
    iget p4, p0, Lcom/tencent/liteav/beauty/d;->e:I

    .line 253
    .line 254
    iput p4, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 255
    .line 256
    const/16 p5, 0x10e

    .line 257
    .line 258
    const/16 v0, 0x5a

    .line 259
    .line 260
    if-lez p2, :cond_d

    .line 261
    .line 262
    if-gtz p4, :cond_10

    .line 263
    .line 264
    :cond_d
    if-eq v0, p3, :cond_f

    .line 265
    .line 266
    if-ne p5, p3, :cond_e

    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_e
    iput v3, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 270
    .line 271
    iput v4, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 272
    .line 273
    goto :goto_4

    .line 274
    :cond_f
    :goto_3
    iput v4, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 275
    .line 276
    iput v3, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 277
    .line 278
    :cond_10
    :goto_4
    iget-object p2, p0, Lcom/tencent/liteav/beauty/d;->l:Lcom/tencent/liteav/beauty/d$d;

    .line 279
    .line 280
    sget-object p4, Lcom/tencent/liteav/beauty/d$d;->a:Lcom/tencent/liteav/beauty/d$d;

    .line 281
    .line 282
    if-ne p2, p4, :cond_13

    .line 283
    .line 284
    if-eq v0, p3, :cond_12

    .line 285
    .line 286
    if-ne p5, p3, :cond_11

    .line 287
    .line 288
    goto :goto_6

    .line 289
    :cond_11
    iget v3, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 290
    .line 291
    iget v4, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 292
    .line 293
    :goto_5
    move-object v2, p0

    .line 294
    goto :goto_7

    .line 295
    :cond_12
    :goto_6
    iget v3, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 296
    .line 297
    iget v4, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 298
    .line 299
    goto :goto_5

    .line 300
    :cond_13
    sget-object p4, Lcom/tencent/liteav/beauty/d$d;->b:Lcom/tencent/liteav/beauty/d$d;

    .line 301
    .line 302
    if-ne p2, p4, :cond_14

    .line 303
    .line 304
    goto :goto_5

    .line 305
    :cond_14
    iget v6, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    .line 306
    .line 307
    iget v7, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    .line 308
    .line 309
    move-object v2, p0

    .line 310
    move v5, p3

    .line 311
    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/beauty/d;->b(IIIII)Lcom/tencent/liteav/basic/util/d;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    iget p1, p0, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 316
    .line 317
    add-int/lit8 p1, p1, 0x7

    .line 318
    .line 319
    div-int/lit8 p1, p1, 0x8

    .line 320
    .line 321
    mul-int/lit8 v3, p1, 0x8

    .line 322
    .line 323
    iget p0, p0, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 324
    .line 325
    add-int/lit8 p0, p0, 0x7

    .line 326
    .line 327
    div-int/lit8 p0, p0, 0x8

    .line 328
    .line 329
    mul-int/lit8 v4, p0, 0x8

    .line 330
    .line 331
    :goto_7
    iget-object p0, v2, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    .line 332
    .line 333
    iget-boolean p1, v2, Lcom/tencent/liteav/beauty/d;->c:Z

    .line 334
    .line 335
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/d$c;->e:Z

    .line 336
    .line 337
    invoke-direct {v2, p0, v3, v4}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/beauty/d$c;II)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-nez p0, :cond_15

    .line 342
    .line 343
    const-string p0, "init failed!"

    .line 344
    .line 345
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    const/4 p0, 0x0

    .line 349
    return p0

    .line 350
    :cond_15
    :goto_8
    const/4 p0, 0x1

    .line 351
    return p0
.end method

.method private a(Lcom/tencent/liteav/beauty/d$c;II)Z
    .locals 2

    .line 422
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    iget v1, p1, Lcom/tencent/liteav/beauty/d$c;->b:I

    iput v1, v0, Lcom/tencent/liteav/beauty/d$b;->d:I

    .line 423
    iget v1, p1, Lcom/tencent/liteav/beauty/d$c;->c:I

    iput v1, v0, Lcom/tencent/liteav/beauty/d$b;->e:I

    .line 424
    iget-object v1, p1, Lcom/tencent/liteav/beauty/d$c;->j:Lcom/tencent/liteav/basic/c/a;

    iput-object v1, v0, Lcom/tencent/liteav/beauty/d$b;->m:Lcom/tencent/liteav/basic/c/a;

    .line 425
    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->g:I

    .line 426
    iput p3, v0, Lcom/tencent/liteav/beauty/d$b;->f:I

    .line 427
    iget p2, p1, Lcom/tencent/liteav/beauty/d$c;->d:I

    add-int/lit16 p2, p2, 0x168

    rem-int/lit16 p2, p2, 0x168

    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->h:I

    .line 428
    iget p2, p1, Lcom/tencent/liteav/beauty/d$c;->f:I

    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->b:I

    .line 429
    iget p2, p1, Lcom/tencent/liteav/beauty/d$c;->g:I

    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->c:I

    const/4 p2, 0x0

    .line 430
    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->a:I

    .line 431
    iget-boolean p2, p1, Lcom/tencent/liteav/beauty/d$c;->a:Z

    iput-boolean p2, v0, Lcom/tencent/liteav/beauty/d$b;->j:Z

    .line 432
    iget-boolean p2, p1, Lcom/tencent/liteav/beauty/d$c;->e:Z

    iput-boolean p2, v0, Lcom/tencent/liteav/beauty/d$b;->i:Z

    .line 433
    iget p2, p1, Lcom/tencent/liteav/beauty/d$c;->h:I

    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->k:I

    .line 434
    iget p2, p1, Lcom/tencent/liteav/beauty/d$c;->i:I

    iput p2, v0, Lcom/tencent/liteav/beauty/d$b;->l:I

    .line 435
    iget-object p2, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-nez p2, :cond_0

    .line 436
    new-instance p2, Lcom/tencent/liteav/beauty/c;

    iget-object p3, p0, Lcom/tencent/liteav/beauty/d;->a:Landroid/content/Context;

    iget-boolean p1, p1, Lcom/tencent/liteav/beauty/d$c;->a:Z

    invoke-direct {p2, p3, p1}, Lcom/tencent/liteav/beauty/c;-><init>(Landroid/content/Context;Z)V

    iput-object p2, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 437
    iget p1, p0, Lcom/tencent/liteav/beauty/d;->f:I

    invoke-virtual {p2, p1}, Lcom/tencent/liteav/beauty/c;->a(I)V

    .line 438
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/d$b;)Z

    move-result p0

    return p0
.end method

.method private b(IIIII)Lcom/tencent/liteav/basic/util/d;
    .locals 4

    .line 1
    const/16 p0, 0x5a

    .line 2
    .line 3
    if-eq p3, p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x10e

    .line 6
    .line 7
    if-ne p3, p0, :cond_1

    .line 8
    .line 9
    :cond_0
    move v3, p5

    .line 10
    move p5, p4

    .line 11
    move p4, v3

    .line 12
    :cond_1
    invoke-static {p4, p5}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    const/16 v0, 0x438

    .line 21
    .line 22
    const/16 v1, 0x500

    .line 23
    .line 24
    const/16 v2, 0x2d0

    .line 25
    .line 26
    filled-new-array {v2, v0, v1}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    const/4 v2, 0x3

    .line 32
    if-ge v1, v2, :cond_3

    .line 33
    .line 34
    aget v2, v0, v1

    .line 35
    .line 36
    if-gt p0, v2, :cond_2

    .line 37
    .line 38
    if-lt p3, v2, :cond_2

    .line 39
    .line 40
    const/high16 p1, 0x3f800000    # 1.0f

    .line 41
    .line 42
    int-to-float p2, v2

    .line 43
    mul-float/2addr p2, p1

    .line 44
    int-to-float p0, p0

    .line 45
    div-float/2addr p2, p0

    .line 46
    new-instance p0, Lcom/tencent/liteav/basic/util/d;

    .line 47
    .line 48
    int-to-float p1, p4

    .line 49
    mul-float/2addr p1, p2

    .line 50
    float-to-int p1, p1

    .line 51
    int-to-float p3, p5

    .line 52
    mul-float/2addr p2, p3

    .line 53
    float-to-int p2, p2

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    new-instance p0, Lcom/tencent/liteav/basic/util/d;

    .line 62
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/util/d;-><init>(II)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method

.method private c()V
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/beauty/d;->m:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v4, p0, Lcom/tencent/liteav/beauty/d;->m:J

    .line 14
    .line 15
    sub-long/2addr v0, v4

    .line 16
    const/16 v4, 0xbba

    .line 17
    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v4, v0}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 26
    .line 27
    const-wide/16 v4, 0x1

    .line 28
    .line 29
    add-long/2addr v0, v4

    .line 30
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iget-wide v4, p0, Lcom/tencent/liteav/beauty/d;->o:J

    .line 37
    .line 38
    const-wide/16 v6, 0x7d0

    .line 39
    .line 40
    add-long/2addr v6, v4

    .line 41
    cmp-long v6, v0, v6

    .line 42
    .line 43
    if-lez v6, :cond_1

    .line 44
    .line 45
    iget-wide v6, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 46
    .line 47
    long-to-double v6, v6

    .line 48
    const-wide v8, 0x408f400000000000L    # 1000.0

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    mul-double/2addr v6, v8

    .line 54
    sub-long v4, v0, v4

    .line 55
    .line 56
    long-to-double v4, v4

    .line 57
    div-double/2addr v6, v4

    .line 58
    const/16 v4, 0xbbb

    .line 59
    .line 60
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {p0, v4, v5}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iput-wide v2, p0, Lcom/tencent/liteav/beauty/d;->n:J

    .line 68
    .line 69
    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->o:J

    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method private z(I)I
    .locals 0

    const/4 p0, 0x1

    if-eq p1, p0, :cond_2

    const/4 p0, 0x2

    if-eq p1, p0, :cond_1

    const/4 p0, 0x3

    if-eq p1, p0, :cond_0

    return p1

    :cond_0
    const/16 p0, 0x10e

    return p0

    :cond_1
    const/16 p0, 0xb4

    return p0

    :cond_2
    const/16 p0, 0x5a

    return p0
.end method


# virtual methods
.method public a(III)I
    .locals 2

    .line 414
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 415
    new-instance v0, Lcom/tencent/liteav/basic/structs/b;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 416
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 417
    iput p3, v0, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 418
    iput v1, v0, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 419
    iget-object p2, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    if-eqz p2, :cond_0

    iget-boolean v1, p2, Lcom/tencent/liteav/beauty/d$c;->e:Z

    :cond_0
    iput-boolean v1, v0, Lcom/tencent/liteav/basic/structs/b;->i:Z

    .line 420
    iput p1, v0, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 421
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    invoke-interface {p0, v0}, Lcom/tencent/liteav/beauty/f;->a(Lcom/tencent/liteav/basic/structs/b;)I

    move-result p0

    return p0

    :cond_1
    return v1
.end method

.method public declared-synchronized a(IIIIIIJ)I
    .locals 7

    monitor-enter p0

    .line 372
    :try_start_0
    invoke-direct {p0, p4}, Lcom/tencent/liteav/beauty/d;->z(I)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v5, p5

    move v6, p6

    .line 373
    :try_start_1
    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/beauty/d;->a(IIIII)Z

    .line 374
    iget-object p0, v1, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    iget-object p2, v1, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    invoke-virtual {p0, p2}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/d$b;)Z

    .line 375
    iget-object p0, v1, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    invoke-virtual {p0, p1, v5, p7, p8}, Lcom/tencent/liteav/beauty/c;->a(IIJ)I

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 376
    monitor-exit v1

    return p0

    :catchall_0
    move-exception v0

    :goto_0
    move-object p0, v0

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v1, p0

    goto :goto_0

    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/basic/structs/b;IIJ)I
    .locals 10

    monitor-enter p0

    .line 377
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/liteav/beauty/d;->m:J

    .line 378
    iget-object v0, p1, Lcom/tencent/liteav/basic/structs/b;->l:Lcom/tencent/liteav/basic/c/a;

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/d;->a(Lcom/tencent/liteav/basic/c/a;)V

    .line 379
    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/beauty/d;->a(II)V

    .line 380
    iget-boolean v0, p1, Lcom/tencent/liteav/basic/structs/b;->i:Z

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/d;->b(Z)V

    .line 381
    iget-object v0, p1, Lcom/tencent/liteav/basic/structs/b;->c:[F

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/d;->a([F)V

    .line 382
    iget-boolean v0, p1, Lcom/tencent/liteav/basic/structs/b;->d:Z

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/d;->a(Z)V

    .line 383
    iget-object v2, p1, Lcom/tencent/liteav/basic/structs/b;->m:[B

    if-eqz v2, :cond_0

    iget v0, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 384
    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->j:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v1, p0

    move v6, p2

    move v7, p3

    :try_start_1
    invoke-virtual/range {v1 .. v7}, Lcom/tencent/liteav/beauty/d;->a([BIIIII)I

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return p0

    :catchall_0
    move-exception v0

    :goto_0
    move-object p0, v0

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v1, p0

    goto :goto_0

    :cond_0
    move-object v1, p0

    move v6, p2

    move v7, p3

    .line 385
    :try_start_2
    iget v2, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    iget v3, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->j:I

    move-wide v8, p4

    invoke-virtual/range {v1 .. v9}, Lcom/tencent/liteav/beauty/d;->a(IIIIIIJ)I

    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v1

    return p0

    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0
.end method

.method public declared-synchronized a([BIIIII)I
    .locals 7

    monitor-enter p0

    .line 367
    :try_start_0
    invoke-direct {p0, p4}, Lcom/tencent/liteav/beauty/d;->z(I)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v5, p5

    move v6, p6

    .line 368
    :try_start_1
    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/beauty/d;->a(IIIII)Z

    .line 369
    iget-object p0, v1, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    iget-object p2, v1, Lcom/tencent/liteav/beauty/d;->i:Lcom/tencent/liteav/beauty/d$b;

    invoke-virtual {p0, p2}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/d$b;)Z

    .line 370
    iget-object p0, v1, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    invoke-virtual {p0, p1, v5}, Lcom/tencent/liteav/beauty/c;->a([BI)I

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 371
    monitor-exit v1

    return p0

    :catchall_0
    move-exception v0

    :goto_0
    move-object p0, v0

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v1, p0

    goto :goto_0

    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public declared-synchronized a()Ljava/lang/Object;
    .locals 1

    monitor-enter p0

    .line 401
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->p:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized a(F)V
    .locals 1

    monitor-enter p0

    .line 448
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 449
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 450
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(I)V
    .locals 1

    .line 439
    iget v0, p0, Lcom/tencent/liteav/beauty/d;->f:I

    if-eq p1, v0, :cond_0

    .line 440
    iput p1, p0, Lcom/tencent/liteav/beauty/d;->f:I

    .line 441
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz p0, :cond_0

    .line 442
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/c;->a(I)V

    :cond_0
    return-void
.end method

.method public declared-synchronized a(II)V
    .locals 0

    monitor-enter p0

    .line 391
    :try_start_0
    iput p1, p0, Lcom/tencent/liteav/beauty/d;->d:I

    .line 392
    iput p2, p0, Lcom/tencent/liteav/beauty/d;->e:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(IIIJ)V
    .locals 1

    .line 352
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/d;->c()V

    .line 353
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    if-eqz v0, :cond_1

    .line 354
    new-instance v0, Lcom/tencent/liteav/basic/structs/b;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 355
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 356
    iput p3, v0, Lcom/tencent/liteav/basic/structs/b;->f:I

    const/4 p2, 0x0

    .line 357
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 358
    iget-object p3, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;

    if-eqz p3, :cond_0

    iget-boolean p2, p3, Lcom/tencent/liteav/beauty/d$c;->e:Z

    :cond_0
    iput-boolean p2, v0, Lcom/tencent/liteav/basic/structs/b;->i:Z

    .line 359
    iput p1, v0, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 360
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    invoke-interface {p0, v0, p4, p5}, Lcom/tencent/liteav/beauty/f;->a(Lcom/tencent/liteav/basic/structs/b;J)V

    :cond_1
    return-void
.end method

.method public declared-synchronized a(Landroid/graphics/Bitmap;)V
    .locals 1

    monitor-enter p0

    .line 451
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 452
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 453
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Landroid/graphics/Bitmap;FFF)V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    if-ltz v1, :cond_2

    cmpg-float v0, p3, v0

    if-ltz v0, :cond_2

    float-to-double v0, p4

    const-wide/16 v2, 0x0

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    goto :goto_1

    .line 394
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_1

    .line 395
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/tencent/liteav/beauty/c;->a(Landroid/graphics/Bitmap;FFF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 396
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 397
    :cond_2
    :goto_1
    :try_start_1
    const-string p1, "TXCVideoPreprocessor"

    const-string p2, "WaterMark param is Error!"

    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 398
    monitor-exit p0

    return-void

    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    monitor-enter p0

    .line 409
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-nez v0, :cond_0

    .line 410
    const-string p1, "TXCVideoPreprocessor"

    const-string v0, "setListener mDrawer is null!"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 411
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 412
    :cond_0
    :try_start_1
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/basic/b/b;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    monitor-exit p0

    return-void

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/basic/c/a;)V
    .locals 0

    monitor-enter p0

    .line 389
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/beauty/d;->g:Lcom/tencent/liteav/basic/c/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 390
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/beauty/d$d;)V
    .locals 3

    const-string v0, "set Process SDK performance "

    monitor-enter p0

    .line 386
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/beauty/d;->l:Lcom/tencent/liteav/beauty/d$d;

    .line 387
    const-string v1, "TXCVideoPreprocessor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Lcom/tencent/liteav/beauty/f;)V
    .locals 1

    monitor-enter p0

    .line 402
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-nez v0, :cond_0

    .line 403
    const-string p1, "TXCVideoPreprocessor"

    const-string v0, "setListener mDrawer is null!"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 405
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    if-nez p1, :cond_1

    const/4 p1, 0x0

    .line 406
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/e;)V

    goto :goto_0

    .line 407
    :cond_1
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/e;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 408
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Ljava/lang/Object;)V
    .locals 0

    monitor-enter p0

    .line 399
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/beauty/d;->p:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized a(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    .line 443
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 444
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 445
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(Z)V
    .locals 0

    .line 365
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz p0, :cond_0

    .line 366
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/c;->a(Z)V

    :cond_0
    return-void
.end method

.method public a([BIIIJ)V
    .locals 0

    .line 361
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->k:Lcom/tencent/liteav/beauty/f;

    if-eqz p0, :cond_0

    .line 362
    invoke-interface/range {p0 .. p6}, Lcom/tencent/liteav/beauty/f;->a([BIIIJ)V

    :cond_0
    return-void
.end method

.method public a([F)V
    .locals 0

    .line 363
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz p0, :cond_0

    .line 364
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/c;->a([F)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Z)Z
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 446
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz p0, :cond_0

    .line 447
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/c;->a(Ljava/lang/String;Z)V

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public declared-synchronized b()V
    .locals 1

    monitor-enter p0

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/c;->a()V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/tencent/liteav/beauty/d;->j:Lcom/tencent/liteav/beauty/d$c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized b(I)V
    .locals 2

    monitor-enter p0

    .line 73
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->d(I)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 75
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    const-string v1, "beautyStyle"

    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized b(Z)V
    .locals 0

    monitor-enter p0

    .line 67
    :try_start_0
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/d;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized c(I)V
    .locals 2

    monitor-enter p0

    const/16 v0, 0x9

    if-le p1, v0, :cond_0

    .line 72
    :try_start_0
    const-string p1, "TXCVideoPreprocessor"

    const-string v1, "Beauty value too large! set max value 9"

    invoke-static {p1, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    move p1, v0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    if-gez p1, :cond_1

    .line 73
    const-string p1, "TXCVideoPreprocessor"

    const-string v0, "Beauty < 0; set 0"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 74
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_2

    .line 75
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->c(I)V

    .line 76
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    const-string v1, "beautyLevel"

    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized c(Z)V
    .locals 1

    monitor-enter p0

    .line 78
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->b(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 80
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized d(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/16 v0, 0x9

    .line 3
    .line 4
    if-le p1, v0, :cond_0

    .line 5
    .line 6
    :try_start_0
    const-string p1, "TXCVideoPreprocessor"

    .line 7
    .line 8
    const-string v1, "Brightness value too large! set max value 9"

    .line 9
    .line 10
    invoke-static {p1, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move p1, v0

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    if-gez p1, :cond_1

    .line 18
    .line 19
    const-string p1, "TXCVideoPreprocessor"

    .line 20
    .line 21
    const-string v0, "Brightness < 0; set 0"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->e(I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 35
    .line 36
    const-string v1, "whiteLevel"

    .line 37
    .line 38
    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public declared-synchronized e(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/16 v0, 0x9

    .line 3
    .line 4
    if-le p1, v0, :cond_0

    .line 5
    .line 6
    :try_start_0
    const-string p1, "TXCVideoPreprocessor"

    .line 7
    .line 8
    const-string v1, "Ruddy value too large! set max value 9"

    .line 9
    .line 10
    invoke-static {p1, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move p1, v0

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    if-gez p1, :cond_1

    .line 18
    .line 19
    const-string p1, "TXCVideoPreprocessor"

    .line 20
    .line 21
    const-string v0, "Ruddy < 0; set 0"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->g(I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 35
    .line 36
    const-string v1, "ruddyLevel"

    .line 37
    .line 38
    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public f(I)V
    .locals 2

    .line 1
    const-string v0, "TXCVideoPreprocessor"

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    if-le p1, v1, :cond_0

    .line 6
    .line 7
    const-string p1, "Brightness value too large! set max value 9"

    .line 8
    .line 9
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    move p1, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-gez p1, :cond_1

    .line 15
    .line 16
    const-string p1, "Brightness < 0; set 0"

    .line 17
    .line 18
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/c;->f(I)V

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public declared-synchronized g(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->h(I)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 13
    .line 14
    const-string v1, "eyeBigScale"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public declared-synchronized h(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->i(I)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 13
    .line 14
    const-string v1, "faceSlimLevel"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public i(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->j(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "faceVLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->k(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "faceShortLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->l(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "chinLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->m(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "noseSlimLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->n(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "eyeLightenLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->o(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "toothWhitenLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->p(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "wrinkleRemoveLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->q(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "pounchRemoveLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->r(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "smileLinesRemoveLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public r(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->s(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "foreheadLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public s(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->t(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "eyeDistanceLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setID(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/tencent/liteav/beauty/d$a;->a()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/16 v0, 0xbb9

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->u(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "eyeAngleLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public u(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->v(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "mouthShapeLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public v(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "noseWingLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public w(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->x(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "nosePositionLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public x(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->y(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "lipsThicknessLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/d;->h:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/beauty/c;->z(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/beauty/d;->q:Lcom/tencent/liteav/beauty/d$a;

    .line 9
    .line 10
    const-string v0, "faceBeautyLevel"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/beauty/d$a;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
