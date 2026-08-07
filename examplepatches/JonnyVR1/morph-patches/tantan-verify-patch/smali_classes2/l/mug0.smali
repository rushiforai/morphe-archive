.class public final Ll/mug0;
.super Ltech/sud/gip/asr/base/BaseRealSudASRImpl;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Z

.field public c:Ll/uwg0;

.field public d:Ll/pkg0;

.field public final e:Ltech/sud/gip/core/model/VolcCfg;

.field public f:Z

.field public g:Ll/xrg0;

.field public h:Z


# direct methods
.method public constructor <init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;Ltech/sud/gip/core/model/VolcCfg;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;-><init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;)V

    .line 2
    .line 3
    .line 4
    const-class p1, Ll/mug0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "SudGIP "

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p2, p0, Ll/mug0;->e:Ltech/sud/gip/core/model/VolcCfg;

    .line 19
    .line 20
    const-string p0, "DoubaoRealSudASRImpl"

    .line 21
    .line 22
    const-string p2, "db asr init:"

    .line 23
    .line 24
    invoke-static {p0, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Ll/mug0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->mLanguage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 4

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-lez p2, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/mug0;->b:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isIntentRunning:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/mug0;->f:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/mug0;->g:Ll/xrg0;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/xrg0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/xrg0;-><init>(Ll/mug0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/mug0;->g:Ll/xrg0;

    .line 27
    .line 28
    iget-boolean v2, p0, Ll/mug0;->h:Z

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/mug0;->h:Z

    .line 33
    .line 34
    const-wide/16 v2, 0x1388

    .line 35
    .line 36
    invoke-static {v0, v2, v3}, Ltech/sud/gip/base/ThreadUtils;->postDelayedUITask(Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/mug0;->d:Ll/pkg0;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    :try_start_0
    new-array v0, p2, [B

    .line 48
    .line 49
    invoke-virtual {p1, v0, v1, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/mug0;->d:Ll/pkg0;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    if-nez p2, :cond_2

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iget-object p0, p0, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offerBuffer([B)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    :catch_0
    :cond_3
    :goto_1
    return-void
.end method

.method public final startASR(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->startASR(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "startASR:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " currentIsRunning:"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Ll/mug0;->b:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " isHavePcmData:"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean v1, p0, Ll/mug0;->f:Z

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "DoubaoRealSudASRImpl"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-boolean v0, p0, Ll/mug0;->b:Z

    .line 49
    .line 50
    if-nez v0, :cond_8

    .line 51
    .line 52
    iget-boolean v0, p0, Ll/mug0;->f:Z

    .line 53
    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    goto/16 :goto_2

    .line 57
    .line 58
    :cond_0
    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Ll/mug0;->b:Z

    .line 60
    .line 61
    iget-object v0, p0, Ll/mug0;->e:Ltech/sud/gip/core/model/VolcCfg;

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget-object p0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 66
    .line 67
    const-string p1, "mDoubaoRtssCfg can not be empty"

    .line 68
    .line 69
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object v0, v0, Ltech/sud/gip/core/model/VolcCfg;->url:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_7

    .line 83
    .line 84
    iget-object v0, p0, Ll/mug0;->e:Ltech/sud/gip/core/model/VolcCfg;

    .line 85
    .line 86
    iget-object v0, v0, Ltech/sud/gip/core/model/VolcCfg;->app_key:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_7

    .line 93
    .line 94
    iget-object v0, p0, Ll/mug0;->e:Ltech/sud/gip/core/model/VolcCfg;

    .line 95
    .line 96
    iget-object v0, v0, Ltech/sud/gip/core/model/VolcCfg;->access_key:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    iget-object v0, p0, Ll/mug0;->c:Ll/uwg0;

    .line 106
    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/uwg0;->l()V

    .line 110
    .line 111
    .line 112
    :cond_3
    new-instance v0, Ll/uwg0;

    .line 113
    .line 114
    const/4 v2, 0x0

    .line 115
    invoke-direct {v0, v2}, Ll/uwg0;-><init>(Ltech/sud/gip/asr/base/Sudif;)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Ll/mug0;->c:Ll/uwg0;

    .line 119
    .line 120
    new-instance v0, Ll/hfg0;

    .line 121
    .line 122
    invoke-direct {v0}, Ll/hfg0;-><init>()V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Ll/mug0;->e:Ltech/sud/gip/core/model/VolcCfg;

    .line 126
    .line 127
    if-nez v3, :cond_4

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_4
    iget-object v4, v3, Ltech/sud/gip/core/model/VolcCfg;->async_url:Ljava/lang/String;

    .line 131
    .line 132
    iput-object v4, v0, Ll/hfg0;->a:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v4, v3, Ltech/sud/gip/core/model/VolcCfg;->app_key:Ljava/lang/String;

    .line 135
    .line 136
    iput-object v4, v0, Ll/hfg0;->b:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v4, v3, Ltech/sud/gip/core/model/VolcCfg;->access_key:Ljava/lang/String;

    .line 139
    .line 140
    iput-object v4, v0, Ll/hfg0;->c:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v4, v3, Ltech/sud/gip/core/model/VolcCfg;->resource_id:Ljava/lang/String;

    .line 143
    .line 144
    iput-object v4, v0, Ll/hfg0;->d:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v4, v3, Ltech/sud/gip/core/model/VolcCfg;->model_name:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v4, v0, Ll/hfg0;->h:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v3, v3, Ltech/sud/gip/core/model/VolcCfg;->request_config:Lorg/json/JSONObject;

    .line 151
    .line 152
    iput-object v3, v0, Ll/hfg0;->k:Lorg/json/JSONObject;

    .line 153
    .line 154
    :goto_0
    iget-object v3, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 155
    .line 156
    iget-object v3, v3, Ltech/sud/gip/asr/base/model/InitASRParamModel;->userId:Ljava/lang/String;

    .line 157
    .line 158
    iput-object v3, v0, Ll/hfg0;->e:Ljava/lang/String;

    .line 159
    .line 160
    iput-object p1, v0, Ll/hfg0;->g:Ljava/lang/String;

    .line 161
    .line 162
    iget-object p1, p0, Ll/mug0;->d:Ll/pkg0;

    .line 163
    .line 164
    if-eqz p1, :cond_6

    .line 165
    .line 166
    iget-object v3, p1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 167
    .line 168
    if-eqz v3, :cond_5

    .line 169
    .line 170
    const/4 v4, 0x0

    .line 171
    invoke-virtual {v3, v4}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 172
    .line 173
    .line 174
    iput-object v2, p1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 175
    .line 176
    :cond_5
    iput-object v2, p0, Ll/mug0;->d:Ll/pkg0;

    .line 177
    .line 178
    :cond_6
    new-instance p1, Ll/pkg0;

    .line 179
    .line 180
    invoke-direct {p1}, Ll/pkg0;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object p1, p0, Ll/mug0;->d:Ll/pkg0;

    .line 184
    .line 185
    iput-object p1, v0, Ll/hfg0;->f:Ll/pkg0;

    .line 186
    .line 187
    iget-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 188
    .line 189
    iget-wide v2, p1, Ltech/sud/gip/asr/base/model/InitASRParamModel;->mgId:J

    .line 190
    .line 191
    iput-wide v2, v0, Ll/hfg0;->i:J

    .line 192
    .line 193
    iget-object p1, p1, Ltech/sud/gip/asr/base/model/InitASRParamModel;->roomId:Ljava/lang/String;

    .line 194
    .line 195
    iput-object p1, v0, Ll/hfg0;->j:Ljava/lang/String;

    .line 196
    .line 197
    iget-object p1, p0, Ll/mug0;->c:Ll/uwg0;

    .line 198
    .line 199
    new-instance v2, Ll/cgg0;

    .line 200
    .line 201
    invoke-direct {v2, v0}, Ll/cgg0;-><init>(Ll/hfg0;)V

    .line 202
    .line 203
    .line 204
    new-instance v0, Ll/jog0;

    .line 205
    .line 206
    invoke-direct {v0, p0}, Ll/jog0;-><init>(Ll/mug0;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v2, v0}, Ll/uwg0;->c(Ll/cgg0;Ll/nzg0;)V

    .line 210
    .line 211
    .line 212
    const-string p1, "startAudioRecognize success "

    .line 213
    .line 214
    invoke-static {v1, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_7
    :goto_1
    iget-object p0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 224
    .line 225
    const-string p1, "url and app_key and access_key can not be empty"

    .line 226
    .line 227
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v1, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    :cond_8
    :goto_2
    return-void
.end method

.method public final stopASR(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/mug0;->f:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "stopASR currentIsRunning:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-boolean v2, p0, Ll/mug0;->b:Z

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v2, "DoubaoRealSudASRImpl"

    .line 24
    .line 25
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v1, p0, Ll/mug0;->b:Z

    .line 36
    .line 37
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p0, Ll/mug0;->b:Z

    .line 48
    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iput-boolean p1, p0, Ll/mug0;->b:Z

    .line 53
    .line 54
    iget-object v0, p0, Ll/mug0;->c:Ll/uwg0;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p0, Ll/mug0;->d:Ll/pkg0;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v3, v0, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 64
    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    invoke-virtual {v3, p1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 68
    .line 69
    .line 70
    iput-object v1, v0, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 71
    .line 72
    :cond_1
    iput-object v1, p0, Ll/mug0;->d:Ll/pkg0;

    .line 73
    .line 74
    :cond_2
    iget-object p1, p0, Ll/mug0;->c:Ll/uwg0;

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/uwg0;->l()V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Ll/mug0;->c:Ll/uwg0;

    .line 82
    .line 83
    const-string p1, "Continuous recognition stopped."

    .line 84
    .line 85
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/mug0;->a:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_0
    return-void
.end method
