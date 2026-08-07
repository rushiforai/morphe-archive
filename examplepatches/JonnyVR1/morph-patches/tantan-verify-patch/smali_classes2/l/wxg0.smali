.class public final Ll/wxg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudGamePkgPreload;


# static fields
.field public static volatile c:Ll/wxg0;


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ll/qxg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ll/qxg0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qxg0;-><init>(Ll/wxg0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/wxg0;->b:Ll/qxg0;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ll/dlg0;->c:Ll/dlg0;

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    new-instance p1, Ll/dlg0;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ll/dlg0;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    sput-object p1, Ll/dlg0;->c:Ll/dlg0;

    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public final cancelPreloadMGPkgList(Ljava/util/List;)V
    .locals 17

    .line 1
    if-eqz p1, :cond_c

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_c

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Long;

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    move-object/from16 v4, p0

    .line 35
    .line 36
    iget-object v5, v4, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ll/dng0;

    .line 43
    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    iget-wide v8, v1, Ll/dng0;->f:J

    .line 47
    .line 48
    iget-wide v10, v1, Ll/dng0;->g:J

    .line 49
    .line 50
    sget-object v12, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 51
    .line 52
    iput-wide v8, v1, Ll/dng0;->f:J

    .line 53
    .line 54
    iput-wide v10, v1, Ll/dng0;->g:J

    .line 55
    .line 56
    iget-object v13, v1, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result v14

    .line 62
    const/4 v15, 0x0

    .line 63
    move v5, v15

    .line 64
    :goto_1
    if-ge v5, v14, :cond_3

    .line 65
    .line 66
    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    add-int/lit8 v16, v5, 0x1

    .line 71
    .line 72
    move-object v5, v6

    .line 73
    check-cast v5, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;

    .line 74
    .line 75
    iget-wide v6, v1, Ll/dng0;->a:J

    .line 76
    .line 77
    invoke-interface/range {v5 .. v12}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadStatus(JJJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 78
    .line 79
    .line 80
    move/from16 v5, v16

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    iput-boolean v15, v1, Ll/dng0;->c:Z

    .line 84
    .line 85
    iget-object v5, v1, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 88
    .line 89
    .line 90
    iget-object v5, v1, Ll/dng0;->h:Ll/qxg0;

    .line 91
    .line 92
    if-eqz v5, :cond_4

    .line 93
    .line 94
    iget-wide v6, v1, Ll/dng0;->a:J

    .line 95
    .line 96
    iget-object v1, v5, Ll/qxg0;->a:Ll/wxg0;

    .line 97
    .line 98
    iget-object v1, v1, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 99
    .line 100
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    :cond_4
    sget-object v1, Ll/bhg0;->d:Ljava/lang/String;

    .line 108
    .line 109
    sget-object v1, Ll/weg0;->a:Ll/bhg0;

    .line 110
    .line 111
    invoke-virtual {v1, v2, v3}, Ll/bhg0;->b(J)Ll/sgg0;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    if-eqz v2, :cond_1

    .line 116
    .line 117
    iget-object v3, v2, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    :cond_5
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-eqz v5, :cond_7

    .line 128
    .line 129
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    move-object v6, v5

    .line 134
    check-cast v6, Ll/wfg0;

    .line 135
    .line 136
    invoke-interface {v6}, Ll/wfg0;->b()LSudabstract/Sudfor;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    sget-object v7, LSudabstract/Sudfor;->Sudfor:LSudabstract/Sudfor;

    .line 141
    .line 142
    if-eq v5, v7, :cond_6

    .line 143
    .line 144
    sget-object v7, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 145
    .line 146
    if-ne v5, v7, :cond_5

    .line 147
    .line 148
    :cond_6
    iget-wide v7, v2, Ll/sgg0;->q:J

    .line 149
    .line 150
    iget-wide v9, v2, Ll/sgg0;->p:J

    .line 151
    .line 152
    sget-object v11, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 153
    .line 154
    invoke-interface/range {v6 .. v11}, Ll/wfg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 155
    .line 156
    .line 157
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_7
    iget-object v3, v2, Ll/sgg0;->j:Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    :cond_8
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    if-eqz v5, :cond_a

    .line 172
    .line 173
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    check-cast v5, LSudabstract/Sudfor;

    .line 178
    .line 179
    sget-object v6, LSudabstract/Sudfor;->Sudfor:LSudabstract/Sudfor;

    .line 180
    .line 181
    if-eq v5, v6, :cond_9

    .line 182
    .line 183
    sget-object v6, LSudabstract/Sudfor;->Sudint:LSudabstract/Sudfor;

    .line 184
    .line 185
    if-ne v5, v6, :cond_8

    .line 186
    .line 187
    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_a
    iget-object v3, v2, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    if-nez v3, :cond_b

    .line 198
    .line 199
    invoke-virtual {v2}, Ll/sgg0;->f()V

    .line 200
    .line 201
    .line 202
    :cond_b
    invoke-virtual {v1}, Ll/bhg0;->c()V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_c
    :goto_4
    return-void
.end method

.method public final pausePreloadMGPkgList(Ljava/util/List;)V
    .locals 7

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_5

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljava/lang/Long;

    .line 26
    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    sget-object p1, Ll/bhg0;->d:Ljava/lang/String;

    .line 35
    .line 36
    sget-object p1, Ll/weg0;->a:Ll/bhg0;

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Ll/bhg0;->b(J)Ll/sgg0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/sgg0;->g()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "pauseDownload mgId:"

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-wide v3, v0, Ll/sgg0;->b:J

    .line 58
    .line 59
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v3, "  status:"

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-object v4, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 68
    .line 69
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v4, "SudDownloadTask"

    .line 77
    .line 78
    invoke-static {v4, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    sget-object v1, Ll/sgg0;->u:Ljava/lang/String;

    .line 82
    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-wide v5, v0, Ll/sgg0;->b:J

    .line 89
    .line 90
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v2, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 97
    .line 98
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, v0, Ll/sgg0;->n:Ll/e0h0;

    .line 109
    .line 110
    if-eqz v1, :cond_3

    .line 111
    .line 112
    iget-object v1, v1, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    .line 115
    .line 116
    .line 117
    iget-object v1, v0, Ll/sgg0;->n:Ll/e0h0;

    .line 118
    .line 119
    invoke-virtual {v1}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 120
    .line 121
    .line 122
    const/4 v1, 0x0

    .line 123
    iput-object v1, v0, Ll/sgg0;->n:Ll/e0h0;

    .line 124
    .line 125
    :cond_3
    invoke-virtual {v0}, Ll/sgg0;->h()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_4

    .line 130
    .line 131
    const/4 v1, 0x3

    .line 132
    iput v1, v0, Ll/sgg0;->f:I

    .line 133
    .line 134
    iget-object v0, v0, Ll/sgg0;->a:Ll/aug0;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/aug0;->n()V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 141
    .line 142
    iput-object v1, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 143
    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 145
    .line 146
    .line 147
    move-result-wide v2

    .line 148
    iput-wide v2, v0, Ll/sgg0;->r:J

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 151
    .line 152
    .line 153
    :goto_1
    invoke-virtual {p1}, Ll/bhg0;->c()V

    .line 154
    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_5
    :goto_2
    return-void
.end method

.method public final preloadMGPkgList(Landroid/content/Context;Ljava/util/List;Ltech/sud/gip/core/ISudListenerPreloadMGPkg;)V
    .locals 11

    .line 1
    if-eqz p2, :cond_12

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_8

    .line 10
    .line 11
    :cond_0
    sget-object p1, Ll/bhg0;->d:Ljava/lang/String;

    .line 12
    .line 13
    sget-object p1, Ll/weg0;->a:Ll/bhg0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x1

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    goto :goto_3

    .line 26
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sub-int/2addr v0, v1

    .line 38
    :goto_0
    if-ltz v0, :cond_7

    .line 39
    .line 40
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/lang/Long;

    .line 45
    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    iget-object v4, p1, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const/4 v6, 0x0

    .line 60
    move v7, v6

    .line 61
    :cond_4
    if-ge v7, v5, :cond_5

    .line 62
    .line 63
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    add-int/lit8 v7, v7, 0x1

    .line 68
    .line 69
    check-cast v8, Ll/sgg0;

    .line 70
    .line 71
    iget-wide v9, v8, Ll/sgg0;->b:J

    .line 72
    .line 73
    cmp-long v9, v9, v2

    .line 74
    .line 75
    if-nez v9, :cond_4

    .line 76
    .line 77
    invoke-virtual {v8}, Ll/sgg0;->g()Z

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    if-nez v9, :cond_4

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_5
    const/4 v8, 0x0

    .line 85
    :goto_1
    if-eqz v8, :cond_6

    .line 86
    .line 87
    iget-object v2, p1, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_6

    .line 94
    .line 95
    iget-object v2, p1, Ll/bhg0;->a:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {v2, v6, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_6
    :goto_2
    add-int/lit8 v0, v0, -0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    :goto_3
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_12

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Ljava/lang/Long;

    .line 118
    .line 119
    if-nez p2, :cond_8

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 123
    .line 124
    .line 125
    move-result-wide v2

    .line 126
    iget-object v0, p0, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 127
    .line 128
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Ll/dng0;

    .line 133
    .line 134
    if-nez v0, :cond_a

    .line 135
    .line 136
    new-instance v0, Ll/dng0;

    .line 137
    .line 138
    invoke-direct {v0, v2, v3}, Ll/dng0;-><init>(J)V

    .line 139
    .line 140
    .line 141
    if-eqz p3, :cond_9

    .line 142
    .line 143
    iget-object v2, v0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-nez v2, :cond_9

    .line 150
    .line 151
    iget-object v2, v0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v2, p0, Ll/wxg0;->b:Ll/qxg0;

    .line 157
    .line 158
    iput-object v2, v0, Ll/dng0;->h:Ll/qxg0;

    .line 159
    .line 160
    iget-object v2, p0, Ll/wxg0;->a:Ljava/util/HashMap;

    .line 161
    .line 162
    invoke-virtual {v2, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_a
    if-eqz p3, :cond_b

    .line 167
    .line 168
    iget-object p2, v0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-nez p2, :cond_b

    .line 175
    .line 176
    iget-object p2, v0, Ll/dng0;->b:Ljava/util/ArrayList;

    .line 177
    .line 178
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    :cond_b
    :goto_5
    iget-boolean p2, v0, Ll/dng0;->c:Z

    .line 182
    .line 183
    if-eqz p2, :cond_c

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_c
    iput-boolean v1, v0, Ll/dng0;->c:Z

    .line 187
    .line 188
    iget-wide v4, v0, Ll/dng0;->a:J

    .line 189
    .line 190
    new-instance v10, Ll/shg0;

    .line 191
    .line 192
    invoke-direct {v10, v0}, Ll/shg0;-><init>(Ll/dng0;)V

    .line 193
    .line 194
    .line 195
    sget-object p2, Ll/utg0;->a:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    if-ne p2, v0, :cond_11

    .line 206
    .line 207
    sget-object v3, Ll/utg0;->b:Ll/uyg0;

    .line 208
    .line 209
    iget-boolean p2, v3, Ll/uyg0;->a:Z

    .line 210
    .line 211
    const-string v0, "Please call initSDK first successfully"

    .line 212
    .line 213
    const/16 v2, -0x2777

    .line 214
    .line 215
    if-nez p2, :cond_d

    .line 216
    .line 217
    invoke-virtual {v10, v2, v0}, Ll/shg0;->onFailure(ILjava/lang/String;)V

    .line 218
    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_d
    iget-object p2, v3, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 222
    .line 223
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    invoke-virtual {p2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    check-cast p2, Ltech/sud/gip/core/GameInfo;

    .line 232
    .line 233
    if-eqz p2, :cond_e

    .line 234
    .line 235
    invoke-virtual {v10, p2}, Ll/shg0;->onSuccess(Ltech/sud/gip/core/GameInfo;)V

    .line 236
    .line 237
    .line 238
    goto/16 :goto_4

    .line 239
    .line 240
    :cond_e
    iget-boolean p2, v3, Ll/uyg0;->a:Z

    .line 241
    .line 242
    if-nez p2, :cond_f

    .line 243
    .line 244
    invoke-virtual {v10, v2, v0}, Ll/shg0;->onFailure(ILjava/lang/String;)V

    .line 245
    .line 246
    .line 247
    goto/16 :goto_4

    .line 248
    .line 249
    :cond_f
    iget-object p2, v3, Ll/uyg0;->o:Ljava/util/HashMap;

    .line 250
    .line 251
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    check-cast p2, Ltech/sud/gip/core/GameInfo;

    .line 260
    .line 261
    if-eqz p2, :cond_10

    .line 262
    .line 263
    iget-wide v6, p2, Ltech/sud/gip/core/GameInfo;->clientVersion:J

    .line 264
    .line 265
    :goto_6
    move-wide v7, v6

    .line 266
    goto :goto_7

    .line 267
    :cond_10
    const-wide/16 v6, 0x0

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :goto_7
    iget-object v6, v3, Ll/uyg0;->i:Ljava/lang/String;

    .line 271
    .line 272
    new-instance v2, Ll/hhg0;

    .line 273
    .line 274
    const/4 v9, 0x0

    .line 275
    invoke-direct/range {v2 .. v10}, Ll/hhg0;-><init>(Ll/uyg0;JLjava/lang/String;JLjava/lang/String;Ltech/sud/gip/core/ISudListenerGetMGInfo;)V

    .line 276
    .line 277
    .line 278
    sget-object p2, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 279
    .line 280
    invoke-virtual {p2, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 281
    .line 282
    .line 283
    goto/16 :goto_4

    .line 284
    .line 285
    :cond_11
    const-string p2, "Please call on UI or Main thread"

    .line 286
    .line 287
    const/4 v0, -0x1

    .line 288
    invoke-virtual {v10, v0, p2}, Ll/shg0;->onFailure(ILjava/lang/String;)V

    .line 289
    .line 290
    .line 291
    goto/16 :goto_4

    .line 292
    .line 293
    :cond_12
    :goto_8
    return-void
.end method

.method public final resumePreloadMGPkgList(Ljava/util/List;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/Long;

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    sget-object p1, Ll/bhg0;->d:Ljava/lang/String;

    .line 34
    .line 35
    sget-object p1, Ll/weg0;->a:Ll/bhg0;

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Ll/bhg0;->b(J)Ll/sgg0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v1, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 44
    .line 45
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 46
    .line 47
    if-ne v1, v2, :cond_1

    .line 48
    .line 49
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 50
    .line 51
    iput-object v1, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    iput-wide v2, v0, Ll/sgg0;->r:J

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/bhg0;->c()V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    :goto_1
    return-void
.end method
