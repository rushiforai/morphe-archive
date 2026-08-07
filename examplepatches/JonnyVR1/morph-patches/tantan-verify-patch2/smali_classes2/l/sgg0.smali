.class public final Ll/sgg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final u:Ljava/lang/String;


# instance fields
.field public final a:Ll/aug0;

.field public final b:J

.field public final c:J

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public f:I

.field public final g:Ll/oqg0;

.field public h:Ltech/sud/gip/core/PkgDownloadStatus;

.field public i:Ll/prg0;

.field public final j:Ljava/util/ArrayList;

.field public final k:Ljava/lang/ref/WeakReference;

.field public final l:Ljava/util/ArrayList;

.field public m:Ll/ryg0;

.field public n:Ll/e0h0;

.field public final o:Ll/bxg0;

.field public p:J

.field public q:J

.field public r:J

.field public s:I

.field public final t:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/sgg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/oqg0;JLjava/lang/String;Ljava/lang/String;Ll/dzg0;)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    iput v4, v0, Ll/sgg0;->f:I

    .line 14
    .line 15
    sget-object v5, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 16
    .line 17
    iput-object v5, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 18
    .line 19
    new-instance v5, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v5, v0, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v6, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v6, v0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 32
    .line 33
    const-wide/16 v6, 0x0

    .line 34
    .line 35
    iput-wide v6, v0, Ll/sgg0;->p:J

    .line 36
    .line 37
    iput-wide v6, v0, Ll/sgg0;->q:J

    .line 38
    .line 39
    const/4 v6, 0x3

    .line 40
    iput v6, v0, Ll/sgg0;->t:I

    .line 41
    .line 42
    iput-object v1, v0, Ll/sgg0;->g:Ll/oqg0;

    .line 43
    .line 44
    new-instance v6, Ll/grg0;

    .line 45
    .line 46
    iget-object v7, v1, Ll/oqg0;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v6, v7, v2, v3}, Ll/grg0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/16 v7, 0x12c

    .line 52
    .line 53
    iput v7, v6, Ll/grg0;->k:I

    .line 54
    .line 55
    const/16 v7, 0xa

    .line 56
    .line 57
    iput v7, v6, Ll/grg0;->e:I

    .line 58
    .line 59
    const/16 v7, 0x2000

    .line 60
    .line 61
    iput v7, v6, Ll/grg0;->f:I

    .line 62
    .line 63
    const v7, 0x8000

    .line 64
    .line 65
    .line 66
    iput v7, v6, Ll/grg0;->g:I

    .line 67
    .line 68
    const/high16 v7, 0x10000

    .line 69
    .line 70
    iput v7, v6, Ll/grg0;->h:I

    .line 71
    .line 72
    const/16 v7, 0x7d0

    .line 73
    .line 74
    iput v7, v6, Ll/grg0;->i:I

    .line 75
    .line 76
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    iput-object v7, v6, Ll/grg0;->o:Ljava/lang/Integer;

    .line 81
    .line 82
    iput-boolean v4, v6, Ll/grg0;->j:Z

    .line 83
    .line 84
    const/4 v4, 0x0

    .line 85
    iput-boolean v4, v6, Ll/grg0;->m:Z

    .line 86
    .line 87
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-static {v4}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v4}, Ll/lwg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    const-string v7, "Referer"

    .line 104
    .line 105
    invoke-virtual {v6, v7, v4}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/pqg0;->a()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-static {v4}, Ll/opg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    const-string v7, "sud-device-brand"

    .line 117
    .line 118
    invoke-virtual {v6, v7, v4}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/pqg0;->d()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    const-string v7, "sud-os-version"

    .line 126
    .line 127
    invoke-virtual {v6, v7, v4}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/pqg0;->c()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    const-string v7, "sud-device-id"

    .line 135
    .line 136
    invoke-virtual {v6, v7, v4}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    new-instance v4, Ll/bxg0;

    .line 140
    .line 141
    invoke-direct {v4}, Ll/bxg0;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v4, v0, Ll/sgg0;->o:Ll/bxg0;

    .line 145
    .line 146
    iget-object v7, v6, Ll/grg0;->d:Ljava/util/HashMap;

    .line 147
    .line 148
    if-nez v7, :cond_0

    .line 149
    .line 150
    new-instance v7, Ljava/util/HashMap;

    .line 151
    .line 152
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object v7, v6, Ll/grg0;->d:Ljava/util/HashMap;

    .line 156
    .line 157
    :cond_0
    iget-object v7, v6, Ll/grg0;->d:Ljava/util/HashMap;

    .line 158
    .line 159
    const-class v8, Ll/bxg0;

    .line 160
    .line 161
    invoke-virtual {v7, v8, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    new-instance v9, Ll/aug0;

    .line 165
    .line 166
    iget-object v10, v6, Ll/grg0;->a:Ljava/lang/String;

    .line 167
    .line 168
    iget-object v11, v6, Ll/grg0;->b:Landroid/net/Uri;

    .line 169
    .line 170
    iget v12, v6, Ll/grg0;->e:I

    .line 171
    .line 172
    iget v13, v6, Ll/grg0;->f:I

    .line 173
    .line 174
    iget v14, v6, Ll/grg0;->g:I

    .line 175
    .line 176
    iget v15, v6, Ll/grg0;->h:I

    .line 177
    .line 178
    iget v4, v6, Ll/grg0;->i:I

    .line 179
    .line 180
    iget-boolean v7, v6, Ll/grg0;->j:Z

    .line 181
    .line 182
    iget v8, v6, Ll/grg0;->k:I

    .line 183
    .line 184
    move/from16 v16, v4

    .line 185
    .line 186
    iget-object v4, v6, Ll/grg0;->c:Ljava/util/HashMap;

    .line 187
    .line 188
    move-object/from16 v19, v4

    .line 189
    .line 190
    iget-object v4, v6, Ll/grg0;->l:Ljava/lang/String;

    .line 191
    .line 192
    move-object/from16 v20, v4

    .line 193
    .line 194
    iget-boolean v4, v6, Ll/grg0;->m:Z

    .line 195
    .line 196
    move/from16 v21, v4

    .line 197
    .line 198
    iget-object v4, v6, Ll/grg0;->n:Ljava/lang/Boolean;

    .line 199
    .line 200
    move-object/from16 v22, v4

    .line 201
    .line 202
    iget-object v4, v6, Ll/grg0;->o:Ljava/lang/Integer;

    .line 203
    .line 204
    iget-object v6, v6, Ll/grg0;->d:Ljava/util/HashMap;

    .line 205
    .line 206
    move-object/from16 v23, v4

    .line 207
    .line 208
    move-object/from16 v24, v6

    .line 209
    .line 210
    move/from16 v17, v7

    .line 211
    .line 212
    move/from16 v18, v8

    .line 213
    .line 214
    invoke-direct/range {v9 .. v24}, Ll/aug0;-><init>(Ljava/lang/String;Landroid/net/Uri;IIIIIZILjava/util/HashMap;Ljava/lang/String;ZLjava/lang/Boolean;Ljava/lang/Integer;Ljava/util/HashMap;)V

    .line 215
    .line 216
    .line 217
    iput-object v9, v0, Ll/sgg0;->a:Ll/aug0;

    .line 218
    .line 219
    iget-object v4, v1, Ll/oqg0;->b:LSudabstract/Sudfor;

    .line 220
    .line 221
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    iget-wide v4, v1, Ll/oqg0;->c:J

    .line 225
    .line 226
    iput-wide v4, v0, Ll/sgg0;->b:J

    .line 227
    .line 228
    move-wide/from16 v4, p2

    .line 229
    .line 230
    iput-wide v4, v0, Ll/sgg0;->c:J

    .line 231
    .line 232
    iput-object v2, v0, Ll/sgg0;->d:Ljava/lang/String;

    .line 233
    .line 234
    iput-object v3, v0, Ll/sgg0;->e:Ljava/lang/String;

    .line 235
    .line 236
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 237
    .line 238
    move-object/from16 v2, p6

    .line 239
    .line 240
    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 241
    .line 242
    .line 243
    iput-object v1, v0, Ll/sgg0;->k:Ljava/lang/ref/WeakReference;

    .line 244
    .line 245
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, v0, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/sgg0;->k:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/keg0;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast v0, Ll/dzg0;

    .line 29
    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "onTaskEnd:"

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-wide v4, p0, Ll/sgg0;->b:J

    .line 38
    .line 39
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v4, "SudDownloadManager"

    .line 47
    .line 48
    invoke-static {v4, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object v2, Ll/bhg0;->d:Ljava/lang/String;

    .line 52
    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-wide v5, p0, Ll/sgg0;->b:J

    .line 59
    .line 60
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-static {v2, v3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, v0, Ll/dzg0;->a:Ll/bhg0;

    .line 71
    .line 72
    iget-object v2, v2, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-object v0, v0, Ll/dzg0;->a:Ll/bhg0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/bhg0;->c()V

    .line 80
    .line 81
    .line 82
    :cond_1
    iput-object v1, p0, Ll/sgg0;->i:Ll/prg0;

    .line 83
    .line 84
    iget-object p0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final b(ILjava/lang/String;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onDownloadFailure mgId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Ll/sgg0;->b:J

    .line 9
    .line 10
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " listenerSize:"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v3, "SudDownloadTask"

    .line 32
    .line 33
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-wide v4, p0, Ll/sgg0;->b:J

    .line 44
    .line 45
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v2, 0x0

    .line 74
    :goto_0
    if-ge v2, v1, :cond_0

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    add-int/lit8 v2, v2, 0x1

    .line 81
    .line 82
    check-cast v3, Ll/wfg0;

    .line 83
    .line 84
    iget-object v4, p0, Ll/sgg0;->o:Ll/bxg0;

    .line 85
    .line 86
    invoke-interface {v3, p1, p2, v4}, Ll/wfg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {p0}, Ll/sgg0;->a()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final c(Ll/wfg0;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-interface {p1}, Ll/wfg0;->b()LSudabstract/Sudfor;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 26
    .line 27
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 28
    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 32
    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-interface {p1}, Ll/wfg0;->a()V

    .line 36
    .line 37
    .line 38
    iget-wide v3, p0, Ll/sgg0;->q:J

    .line 39
    .line 40
    iget-wide v5, p0, Ll/sgg0;->p:J

    .line 41
    .line 42
    iget-object v7, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 43
    .line 44
    move-object v2, p1

    .line 45
    invoke-interface/range {v2 .. v7}, Ll/wfg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 46
    .line 47
    .line 48
    iget-wide v0, p0, Ll/sgg0;->q:J

    .line 49
    .line 50
    iget-wide p0, p0, Ll/sgg0;->p:J

    .line 51
    .line 52
    invoke-interface {v2, v0, v1, p0, p1}, Ll/wfg0;->d(JJ)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final d(Ltech/sud/gip/core/PkgDownloadStatus;)V
    .locals 8

    .line 1
    iget-wide v1, p0, Ll/sgg0;->q:J

    .line 2
    .line 3
    iget-wide v3, p0, Ll/sgg0;->p:J

    .line 4
    .line 5
    iget-object p0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-ge v0, v6, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    add-int/lit8 v7, v0, 0x1

    .line 19
    .line 20
    move-object v0, v5

    .line 21
    check-cast v0, Ll/wfg0;

    .line 22
    .line 23
    move-object v5, p1

    .line 24
    invoke-interface/range {v0 .. v5}, Ll/wfg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 25
    .line 26
    .line 27
    move v0, v7

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/sgg0;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "download:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, "  mgId:"

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-wide v3, p0, Ll/sgg0;->b:J

    .line 26
    .line 27
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, "  url:"

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v3, p0, Ll/sgg0;->g:Ll/oqg0;

    .line 36
    .line 37
    iget-object v3, v3, Ll/oqg0;->d:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v3, "  parentPath:"

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Ll/sgg0;->d:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, "  fileName:"

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Ll/sgg0;->e:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v3, "SudDownloadTask"

    .line 67
    .line 68
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 72
    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 79
    .line 80
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-wide v1, p0, Ll/sgg0;->b:J

    .line 87
    .line 88
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const/4 v0, 0x1

    .line 99
    iput v0, p0, Ll/sgg0;->f:I

    .line 100
    .line 101
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 102
    .line 103
    iput-object v0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 104
    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    iput-wide v1, p0, Ll/sgg0;->r:J

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/sgg0;->m:Ll/ryg0;

    .line 115
    .line 116
    if-eqz v0, :cond_1

    .line 117
    .line 118
    iget-object v0, v0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 121
    .line 122
    .line 123
    :cond_1
    new-instance v0, Ll/ryg0;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/ryg0;-><init>(Ll/sgg0;)V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Ll/sgg0;->m:Ll/ryg0;

    .line 129
    .line 130
    iget-object v1, p0, Ll/sgg0;->a:Ll/aug0;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Ll/aug0;->m(Ll/eog0;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 136
    .line 137
    if-eqz v0, :cond_2

    .line 138
    .line 139
    iget-object v0, v0, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 145
    .line 146
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 147
    .line 148
    .line 149
    const/4 v0, 0x0

    .line 150
    iput-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 151
    .line 152
    :cond_2
    new-instance v0, Ll/e0h0;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Ll/e0h0;-><init>(Ll/sgg0;)V

    .line 155
    .line 156
    .line 157
    iput-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->start()Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-class v3, Ll/sgg0;

    .line 13
    .line 14
    if-eq v3, v2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/sgg0;

    .line 18
    .line 19
    iget-wide v2, p0, Ll/sgg0;->c:J

    .line 20
    .line 21
    iget-wide p0, p1, Ll/sgg0;->c:J

    .line 22
    .line 23
    cmp-long p0, v2, p0

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    :goto_0
    return v1
.end method

.method public final f()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "cancelDownload mgId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Ll/sgg0;->b:J

    .line 9
    .line 10
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "  status:"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v3, "SudDownloadTask"

    .line 28
    .line 29
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v4, p0, Ll/sgg0;->b:J

    .line 40
    .line 41
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 48
    .line 49
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 60
    .line 61
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 62
    .line 63
    const/4 v2, 0x2

    .line 64
    if-ne v0, v1, :cond_0

    .line 65
    .line 66
    iput v2, p0, Ll/sgg0;->f:I

    .line 67
    .line 68
    iget-object v0, p0, Ll/sgg0;->a:Ll/aug0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/aug0;->n()V

    .line 71
    .line 72
    .line 73
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Ll/sgg0;->h()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    iput v2, p0, Ll/sgg0;->f:I

    .line 91
    .line 92
    iget-object v0, p0, Ll/sgg0;->a:Ll/aug0;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/aug0;->n()V

    .line 95
    .line 96
    .line 97
    :cond_1
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 98
    .line 99
    iput-object v0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 100
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v1

    .line 105
    iput-wide v1, p0, Ll/sgg0;->r:J

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/sgg0;->a()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final g()Z
    .locals 5

    .line 1
    iget-object p0, p0, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :cond_0
    if-ge v2, v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    check-cast v3, LSudabstract/Sudfor;

    .line 18
    .line 19
    sget-object v4, LSudabstract/Sudfor;->Suddo:LSudabstract/Sudfor;

    .line 20
    .line 21
    if-eq v3, v4, :cond_1

    .line 22
    .line 23
    sget-object v4, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 24
    .line 25
    if-ne v3, v4, :cond_0

    .line 26
    .line 27
    :cond_1
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_2
    return v1
.end method

.method public final h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/sgg0;->c:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
