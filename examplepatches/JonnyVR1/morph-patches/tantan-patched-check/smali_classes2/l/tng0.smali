.class public final Ll/tng0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final m:Ljava/lang/String;


# instance fields
.field public final a:Ll/aug0;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public d:Ltech/sud/gip/core/PkgDownloadStatus;

.field public final e:Ljava/util/ArrayList;

.field public f:Ll/rjg0;

.field public g:Ll/crg0;

.field public final h:Ll/bxg0;

.field public i:J

.field public j:J

.field public k:J

.field public final l:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/tng0;

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
    sput-object v0, Ll/tng0;->m:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v4, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 13
    .line 14
    iput-object v4, v0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 15
    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    iput-wide v4, v0, Ll/tng0;->i:J

    .line 19
    .line 20
    iput-wide v4, v0, Ll/tng0;->j:J

    .line 21
    .line 22
    iput-object v1, v0, Ll/tng0;->l:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v4, Ll/grg0;

    .line 25
    .line 26
    invoke-direct {v4, v1, v2, v3}, Ll/grg0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/16 v1, 0x12c

    .line 30
    .line 31
    iput v1, v4, Ll/grg0;->k:I

    .line 32
    .line 33
    const/16 v1, 0xa

    .line 34
    .line 35
    iput v1, v4, Ll/grg0;->e:I

    .line 36
    .line 37
    const/16 v1, 0x2000

    .line 38
    .line 39
    iput v1, v4, Ll/grg0;->f:I

    .line 40
    .line 41
    const v1, 0x8000

    .line 42
    .line 43
    .line 44
    iput v1, v4, Ll/grg0;->g:I

    .line 45
    .line 46
    const/high16 v1, 0x10000

    .line 47
    .line 48
    iput v1, v4, Ll/grg0;->h:I

    .line 49
    .line 50
    const/16 v1, 0x7d0

    .line 51
    .line 52
    iput v1, v4, Ll/grg0;->i:I

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    iput-object v5, v4, Ll/grg0;->o:Ljava/lang/Integer;

    .line 60
    .line 61
    iput-boolean v1, v4, Ll/grg0;->j:Z

    .line 62
    .line 63
    iput-boolean v1, v4, Ll/grg0;->m:Z

    .line 64
    .line 65
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Ll/lwg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v5, "Referer"

    .line 82
    .line 83
    invoke-virtual {v4, v5, v1}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/pqg0;->a()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v1}, Ll/opg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v5, "sud-device-brand"

    .line 95
    .line 96
    invoke-virtual {v4, v5, v1}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/pqg0;->d()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-string v5, "sud-os-version"

    .line 104
    .line 105
    invoke-virtual {v4, v5, v1}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/pqg0;->c()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    const-string v5, "sud-device-id"

    .line 113
    .line 114
    invoke-virtual {v4, v5, v1}, Ll/grg0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    new-instance v1, Ll/bxg0;

    .line 118
    .line 119
    invoke-direct {v1}, Ll/bxg0;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object v1, v0, Ll/tng0;->h:Ll/bxg0;

    .line 123
    .line 124
    iget-object v5, v4, Ll/grg0;->d:Ljava/util/HashMap;

    .line 125
    .line 126
    if-nez v5, :cond_0

    .line 127
    .line 128
    new-instance v5, Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object v5, v4, Ll/grg0;->d:Ljava/util/HashMap;

    .line 134
    .line 135
    :cond_0
    iget-object v5, v4, Ll/grg0;->d:Ljava/util/HashMap;

    .line 136
    .line 137
    const-class v6, Ll/bxg0;

    .line 138
    .line 139
    invoke-virtual {v5, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    new-instance v7, Ll/aug0;

    .line 143
    .line 144
    iget-object v8, v4, Ll/grg0;->a:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v9, v4, Ll/grg0;->b:Landroid/net/Uri;

    .line 147
    .line 148
    iget v10, v4, Ll/grg0;->e:I

    .line 149
    .line 150
    iget v11, v4, Ll/grg0;->f:I

    .line 151
    .line 152
    iget v12, v4, Ll/grg0;->g:I

    .line 153
    .line 154
    iget v13, v4, Ll/grg0;->h:I

    .line 155
    .line 156
    iget v14, v4, Ll/grg0;->i:I

    .line 157
    .line 158
    iget-boolean v15, v4, Ll/grg0;->j:Z

    .line 159
    .line 160
    iget v1, v4, Ll/grg0;->k:I

    .line 161
    .line 162
    iget-object v5, v4, Ll/grg0;->c:Ljava/util/HashMap;

    .line 163
    .line 164
    iget-object v6, v4, Ll/grg0;->l:Ljava/lang/String;

    .line 165
    .line 166
    move/from16 v16, v1

    .line 167
    .line 168
    iget-boolean v1, v4, Ll/grg0;->m:Z

    .line 169
    .line 170
    move/from16 v19, v1

    .line 171
    .line 172
    iget-object v1, v4, Ll/grg0;->n:Ljava/lang/Boolean;

    .line 173
    .line 174
    move-object/from16 v20, v1

    .line 175
    .line 176
    iget-object v1, v4, Ll/grg0;->o:Ljava/lang/Integer;

    .line 177
    .line 178
    iget-object v4, v4, Ll/grg0;->d:Ljava/util/HashMap;

    .line 179
    .line 180
    move-object/from16 v21, v1

    .line 181
    .line 182
    move-object/from16 v22, v4

    .line 183
    .line 184
    move-object/from16 v17, v5

    .line 185
    .line 186
    move-object/from16 v18, v6

    .line 187
    .line 188
    invoke-direct/range {v7 .. v22}, Ll/aug0;-><init>(Ljava/lang/String;Landroid/net/Uri;IIIIIZILjava/util/HashMap;Ljava/lang/String;ZLjava/lang/Boolean;Ljava/lang/Integer;Ljava/util/HashMap;)V

    .line 189
    .line 190
    .line 191
    iput-object v7, v0, Ll/tng0;->a:Ll/aug0;

    .line 192
    .line 193
    iput-object v2, v0, Ll/tng0;->b:Ljava/lang/String;

    .line 194
    .line 195
    iput-object v3, v0, Ll/tng0;->c:Ljava/lang/String;

    .line 196
    .line 197
    new-instance v1, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object v1, v0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 203
    .line 204
    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onDownloadFailure  listenerSize:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, "DownloadFileTask"

    .line 22
    .line 23
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/tng0;->m:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    :goto_0
    if-ge v2, v1, :cond_0

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    add-int/lit8 v2, v2, 0x1

    .line 63
    .line 64
    check-cast v3, Ll/wfg0;

    .line 65
    .line 66
    iget-object v4, p0, Ll/tng0;->h:Ll/bxg0;

    .line 67
    .line 68
    invoke-interface {v3, p1, p2, v4}, Ll/wfg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    return-void
.end method

.method public final b(Ltech/sud/gip/core/PkgDownloadStatus;)V
    .locals 8

    .line 1
    iput-object p1, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/tng0;->k:J

    .line 8
    .line 9
    iget-wide v3, p0, Ll/tng0;->j:J

    .line 10
    .line 11
    iget-wide v5, p0, Ll/tng0;->i:J

    .line 12
    .line 13
    iget-object p0, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    if-ge v1, v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    check-cast v2, Ll/wfg0;

    .line 29
    .line 30
    move-object v7, p1

    .line 31
    invoke-interface/range {v2 .. v7}, Ll/wfg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method
