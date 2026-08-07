.class public Lcom/immomo/velib/player/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d;
.implements Ll/zyl$a;
.implements Ll/zyl$b;
.implements Ll/zyl$c;
.implements Ll/zyl$d;


# instance fields
.field private a:Ll/jre;

.field private b:Ll/ire;

.field private c:Ll/yej;

.field private d:Ll/it2;

.field private e:Ll/ekl0;

.field private f:Landroid/net/Uri;

.field private g:Landroid/content/Context;

.field private h:I

.field private i:Lcom/immomo/velib/player/a;

.field private j:J

.field private k:I

.field private l:I

.field private m:Lcom/immomo/velib/player/d$b;

.field private n:Lcom/immomo/velib/player/d$e;

.field private o:Lcom/immomo/velib/player/d$f;

.field private p:Lcom/immomo/velib/player/d$c;

.field private q:Lcom/immomo/velib/player/d$d;

.field private r:Ll/zl80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/velib/player/c;->g:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o(Lcom/immomo/velib/player/c;)Lcom/immomo/velib/player/d$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/c;->q:Lcom/immomo/velib/player/d$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/immomo/velib/player/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/velib/player/c;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/immomo/velib/player/c;)Lcom/immomo/velib/player/d$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/c;->m:Lcom/immomo/velib/player/d$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private r(Lcom/immomo/velib/anim/model/MixSetting;)V
    .locals 4

    .line 1
    new-instance v0, Ll/afl0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/afl0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/MixSetting;->getRatio()[F

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 17
    .line 18
    check-cast v0, Ll/afl0;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/MixSetting;->getRatio()[F

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Ll/afl0;->Q([F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 28
    .line 29
    check-cast p1, Ll/afl0;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const-string v1, "mediump"

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move-object v0, v1

    .line 47
    :goto_0
    iput-object v0, p1, Ll/afl0;->E:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 50
    .line 51
    iget v0, p0, Lcom/immomo/velib/player/c;->k:I

    .line 52
    .line 53
    iget v2, p0, Lcom/immomo/velib/player/c;->l:I

    .line 54
    .line 55
    invoke-virtual {p1, v0, v2}, Ll/vej;->E(II)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 63
    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getPostProcessing()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    const/4 p1, 0x0

    .line 72
    :goto_1
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    iget-boolean v0, v0, Lcom/immomo/velib/player/a;->j:Z

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    goto :goto_2

    .line 82
    :cond_3
    const/4 v0, 0x0

    .line 83
    :goto_2
    new-instance v2, Ll/zl80;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 86
    .line 87
    invoke-direct {v2, p1, v0, v3}, Ll/zl80;-><init>(Ljava/util/List;ZLl/jre;)V

    .line 88
    .line 89
    .line 90
    iput-object v2, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 91
    .line 92
    iget-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 103
    .line 104
    :cond_4
    invoke-virtual {v2, v1}, Ll/zl80;->f(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/ffj;->H(Ll/cfj;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 115
    .line 116
    iget-object v0, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/ffj;->H(Ll/cfj;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 122
    .line 123
    iget-object v0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/ffj;->H(Ll/cfj;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 131
    .line 132
    invoke-virtual {p1, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method private s()V
    .locals 5

    .line 1
    new-instance v0, Ll/jre;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jre;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Ll/jre;->t(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/velib/player/c;->f:Landroid/net/Uri;

    .line 13
    .line 14
    if-eqz v0, :cond_6

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_6

    .line 25
    .line 26
    new-instance v0, Ll/ire;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/immomo/velib/player/c;->g:Landroid/content/Context;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/immomo/velib/player/c;->f:Landroid/net/Uri;

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {v0, v2, v3}, Ll/ire;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Ll/jre;->l(Ll/vej;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ll/jre;->n(Ll/vej;)Ll/mre;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ll/ire;->W(Lcom/immomo/velib/player/a;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ll/ire;->Y(Ll/mre;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 69
    .line 70
    if-eqz v2, :cond_0

    .line 71
    .line 72
    iget-object v2, v2, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 73
    .line 74
    if-eqz v2, :cond_0

    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->isLoopOn()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_0

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/4 v1, 0x0

    .line 84
    :goto_0
    invoke-virtual {v0, v1}, Ll/ire;->X(Z)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/ekl0;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/immomo/velib/player/c;->g:Landroid/content/Context;

    .line 90
    .line 91
    invoke-direct {v0, v1}, Ll/ekl0;-><init>(Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 95
    .line 96
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 97
    .line 98
    invoke-static {v1}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    const-string v2, "mediump"

    .line 103
    .line 104
    if-eqz v1, :cond_1

    .line 105
    .line 106
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    move-object v1, v2

    .line 112
    :goto_1
    iput-object v1, v0, Ll/ekl0;->k0:Ljava/lang/String;

    .line 113
    .line 114
    iget-object v0, p0, Lcom/immomo/velib/player/c;->f:Landroid/net/Uri;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-direct {p0, v0}, Lcom/immomo/velib/player/c;->w(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 124
    .line 125
    iget-wide v3, p0, Lcom/immomo/velib/player/c;->j:J

    .line 126
    .line 127
    invoke-virtual {v0, v3, v4}, Ll/ekl0;->c0(J)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/yej;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/yej;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 138
    .line 139
    invoke-static {v1}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 146
    .line 147
    iget-object v2, v1, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 148
    .line 149
    :cond_2
    iput-object v2, v0, Ll/yej;->C:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v0, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 152
    .line 153
    iget v1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 154
    .line 155
    iget v2, p0, Lcom/immomo/velib/player/c;->l:I

    .line 156
    .line 157
    invoke-virtual {v0, v1, v2}, Ll/yej;->E(II)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 161
    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    iget v1, v0, Lcom/immomo/velib/player/a;->k:I

    .line 165
    .line 166
    if-eqz v1, :cond_3

    .line 167
    .line 168
    iget v0, v0, Lcom/immomo/velib/player/a;->l:I

    .line 169
    .line 170
    if-eqz v0, :cond_3

    .line 171
    .line 172
    iget-object v2, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 173
    .line 174
    invoke-virtual {v2, v1, v0}, Ll/yej;->K(II)V

    .line 175
    .line 176
    .line 177
    :cond_3
    iget-object v0, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 178
    .line 179
    const/4 v1, 0x0

    .line 180
    invoke-virtual {v0, v1, v1, v1, v1}, Ll/vej;->A(FFFF)V

    .line 181
    .line 182
    .line 183
    iget v0, p0, Lcom/immomo/velib/player/c;->h:I

    .line 184
    .line 185
    const/4 v1, 0x2

    .line 186
    if-ne v0, v1, :cond_4

    .line 187
    .line 188
    new-instance v0, Ll/o9k;

    .line 189
    .line 190
    invoke-direct {v0}, Ll/o9k;-><init>()V

    .line 191
    .line 192
    .line 193
    iput-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 194
    .line 195
    iget v1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 196
    .line 197
    iget v2, p0, Lcom/immomo/velib/player/c;->l:I

    .line 198
    .line 199
    invoke-virtual {v0, v1, v2}, Ll/vej;->E(II)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 203
    .line 204
    iget-object v1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 210
    .line 211
    iget-object v1, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 217
    .line 218
    iget-object v1, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_4
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 225
    .line 226
    if-eqz v0, :cond_5

    .line 227
    .line 228
    iget-object v0, v0, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 229
    .line 230
    if-eqz v0, :cond_5

    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getMixSetting()Lcom/immomo/velib/anim/model/MixSetting;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    if-eqz v0, :cond_5

    .line 237
    .line 238
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 239
    .line 240
    iget-object v0, v0, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 241
    .line 242
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getMixSetting()Lcom/immomo/velib/anim/model/MixSetting;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-direct {p0, v0}, Lcom/immomo/velib/player/c;->r(Lcom/immomo/velib/anim/model/MixSetting;)V

    .line 247
    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_5
    invoke-direct {p0}, Lcom/immomo/velib/player/c;->t()V

    .line 251
    .line 252
    .line 253
    :goto_2
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 254
    .line 255
    invoke-virtual {v0, p0}, Ll/ire;->b0(Ll/zyl$c;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 259
    .line 260
    invoke-virtual {v0, p0}, Ll/ire;->Z(Ll/zyl$a;)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 264
    .line 265
    invoke-virtual {v0, p0}, Ll/ire;->a0(Ll/zyl$b;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 269
    .line 270
    invoke-virtual {v0, p0}, Ll/ire;->c0(Ll/zyl$d;)V

    .line 271
    .line 272
    .line 273
    iget-object p0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 274
    .line 275
    invoke-virtual {p0}, Ll/ire;->d0()V

    .line 276
    .line 277
    .line 278
    return-void

    .line 279
    :cond_6
    const-string p0, "EffectPlayer"

    .line 280
    .line 281
    const-string v0, "uri : filepath null"

    .line 282
    .line 283
    invoke-static {p0, v0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method private t()V
    .locals 5

    .line 1
    new-instance v0, Ll/zel0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zel0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "mediump"

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v1, v2

    .line 24
    :goto_0
    iput-object v1, v0, Ll/zel0;->E:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 27
    .line 28
    iget v1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 29
    .line 30
    iget v3, p0, Lcom/immomo/velib/player/c;->l:I

    .line 31
    .line 32
    invoke-virtual {v0, v1, v3}, Ll/vej;->E(II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, v0, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getPostProcessing()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/4 v0, 0x0

    .line 49
    :goto_1
    iget-object v1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-boolean v1, v1, Lcom/immomo/velib/player/a;->j:Z

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    const/4 v1, 0x0

    .line 60
    :goto_2
    new-instance v3, Ll/zl80;

    .line 61
    .line 62
    iget-object v4, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 63
    .line 64
    invoke-direct {v3, v0, v1, v4}, Ll/zl80;-><init>(Ljava/util/List;ZLl/jre;)V

    .line 65
    .line 66
    .line 67
    iput-object v3, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/immomo/velib/player/a;->d(Lcom/immomo/velib/player/a;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 78
    .line 79
    iget-object v2, v0, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 80
    .line 81
    :cond_3
    invoke-virtual {v3, v2}, Ll/zl80;->f(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 108
    .line 109
    invoke-virtual {v0, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/immomo/velib/player/c;->r:Ll/zl80;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/jre;->m()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/ire;->e0()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-virtual {v0, v1}, Ll/ire;->b0(Ll/zyl$c;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/ire;->Z(Ll/zyl$a;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ll/ire;->a0(Ll/zyl$b;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ll/ire;->c0(Ll/zyl$d;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method private w(Ljava/lang/String;)V
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/16 p1, 0x9

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/16 v1, 0x12

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/16 v2, 0x13

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    iput-wide v3, p0, Lcom/immomo/velib/player/c;->j:J

    .line 32
    .line 33
    iget p1, p0, Lcom/immomo/velib/player/c;->h:I

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    if-ne p1, v3, :cond_0

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    div-int/lit8 p1, p1, 0x2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    move-exception p1

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget v2, p0, Lcom/immomo/velib/player/c;->k:I

    .line 56
    .line 57
    if-nez v2, :cond_1

    .line 58
    .line 59
    if-lez p1, :cond_1

    .line 60
    .line 61
    iput p1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 62
    .line 63
    :cond_1
    iget p1, p0, Lcom/immomo/velib/player/c;->l:I

    .line 64
    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    if-lez v1, :cond_2

    .line 68
    .line 69
    iput v1, p0, Lcom/immomo/velib/player/c;->l:I

    .line 70
    .line 71
    :cond_2
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 76
    .line 77
    .line 78
    const/16 p1, 0x2d0

    .line 79
    .line 80
    iput p1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 81
    .line 82
    const/16 p1, 0x500

    .line 83
    .line 84
    iput p1, p0, Lcom/immomo/velib/player/c;->l:I

    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public a(Ll/zyl;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/immomo/velib/player/c;->n:Lcom/immomo/velib/player/d$e;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    iget p1, p0, Lcom/immomo/velib/player/c;->h:I

    .line 6
    .line 7
    const/4 p4, 0x1

    .line 8
    if-ne p1, p4, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getMixSetting()Lcom/immomo/velib/anim/model/MixSetting;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getMixSetting()Lcom/immomo/velib/anim/model/MixSetting;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/MixSetting;->getRatio()[F

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/16 p4, 0x8

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    array-length p5, p1

    .line 41
    if-ne p5, p4, :cond_0

    .line 42
    .line 43
    int-to-float p2, p2

    .line 44
    const/4 p5, 0x6

    .line 45
    aget p5, p1, p5

    .line 46
    .line 47
    mul-float/2addr p2, p5

    .line 48
    float-to-int p2, p2

    .line 49
    :cond_0
    if-eqz p1, :cond_2

    .line 50
    .line 51
    array-length p5, p1

    .line 52
    if-ne p5, p4, :cond_2

    .line 53
    .line 54
    int-to-float p3, p3

    .line 55
    const/4 p4, 0x7

    .line 56
    aget p1, p1, p4

    .line 57
    .line 58
    mul-float/2addr p3, p1

    .line 59
    float-to-int p3, p3

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    div-int/lit8 p2, p2, 0x2

    .line 62
    .line 63
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/immomo/velib/player/c;->n:Lcom/immomo/velib/player/d$e;

    .line 64
    .line 65
    invoke-interface {p0, p2, p3}, Lcom/immomo/velib/player/d$e;->a(II)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public b(Ll/zyl;ILjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/immomo/velib/player/c;->p:Lcom/immomo/velib/player/d$c;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0, p2, p3}, Lcom/immomo/velib/player/d$c;->onError(Lcom/immomo/velib/player/d;ILjava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/velib/player/c;->d:Ll/it2;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v1, v2, v0}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/immomo/velib/player/c;->c:Ll/yej;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v1, v2}, Ll/jre;->k(Ll/vej;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/jre;->m()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/immomo/velib/player/c;->b:Ll/ire;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ire;->e0()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/c;->a:Ll/jre;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jre;->u(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Lcom/immomo/velib/player/d$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->q:Lcom/immomo/velib/player/d$d;

    .line 2
    .line 3
    return-void
.end method

.method public f(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/player/c;->k:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/velib/player/c;->l:I

    .line 4
    .line 5
    return-void
.end method

.method public g(Lcom/immomo/velib/player/d$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->n:Lcom/immomo/velib/player/d$e;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/zyl;)V
    .locals 3

    .line 1
    new-instance p1, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/immomo/velib/player/c$b;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/immomo/velib/player/c$b;-><init>(Lcom/immomo/velib/player/c;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v1, 0x64

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public i(Ll/dkl0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ekl0;->R(Ll/dkl0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Lcom/immomo/velib/player/d$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->m:Lcom/immomo/velib/player/d$b;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "EffectPlayer"

    .line 8
    .line 9
    const-string p1, "path must be not null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/immomo/velib/player/c;->f:Landroid/net/Uri;

    .line 20
    .line 21
    iput p2, p0, Lcom/immomo/velib/player/c;->h:I

    .line 22
    .line 23
    return-void
.end method

.method public l(Lcom/immomo/velib/player/d$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->p:Lcom/immomo/velib/player/d$c;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/immomo/velib/player/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->i:Lcom/immomo/velib/player/a;

    .line 2
    .line 3
    return-void
.end method

.method public n(Lcom/immomo/velib/player/d$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/c;->o:Lcom/immomo/velib/player/d$f;

    .line 2
    .line 3
    return-void
.end method

.method public onRenderTimestampChanged(J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "pos : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "EffectPlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/zqe;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/velib/player/c;->o:Lcom/immomo/velib/player/d$f;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {v0, p1, p2}, Lcom/immomo/velib/player/d$f;->renderPositionChanged(J)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/immomo/velib/player/c;->e:Ll/ekl0;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ll/ekl0;->b0(J)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public prepareAsync()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/velib/player/c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/immomo/velib/player/c$a;-><init>(Lcom/immomo/velib/player/c;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nre;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/velib/player/c;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
