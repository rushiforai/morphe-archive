.class public final Ll/xkg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rog0;


# direct methods
.method public constructor <init>(Ll/rog0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xkg0;->a:Ll/rog0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xkg0;->a:Ll/rog0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/rog0;->g:Ljava/lang/String;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v3, "startASR:"

    .line 9
    .line 10
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v3, " currentIsRunning:"

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v3, v0, Ll/rog0;->f:Z

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "AiAgentImpl"

    .line 31
    .line 32
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object v3, v0, Ll/rog0;->a:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v2, v0, Ll/rog0;->f:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    monitor-exit v0

    .line 46
    goto/16 :goto_2

    .line 47
    .line 48
    :cond_0
    const/4 v2, 0x1

    .line 49
    :try_start_1
    iput-boolean v2, v0, Ll/rog0;->f:Z

    .line 50
    .line 51
    sget-object v2, Ll/utg0;->e:Ll/i0h0;

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    iget-object v2, v2, Ll/i0h0;->c:Ll/gvg0;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    .line 60
    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    goto/16 :goto_3

    .line 68
    .line 69
    :cond_1
    move-object v2, v3

    .line 70
    :goto_0
    if-nez v2, :cond_2

    .line 71
    .line 72
    const-string v1, "AiAgentImpl"

    .line 73
    .line 74
    const-string v2, "\u65e0\u6cd5\u5f00\u542fasr\u8bc6\u522b\uff0c\u56e0\u4e3a\u540e\u53f0\u6ca1\u6709\u7ed9volcCfg\u914d\u7f6e"

    .line 75
    .line 76
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :cond_2
    invoke-virtual {v2, v1}, Ltech/sud/gip/core/model/VolcCfg;->canRecognitionLanguage(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-nez v4, :cond_3

    .line 86
    .line 87
    const-string v1, "AiAgentImpl"

    .line 88
    .line 89
    const-string v2, "\u65e0\u6cd5\u5f00\u542fasr\u8bc6\u522b\uff0c\u56e0\u4e3a\u5f53\u524d\u8bed\u8a00\u4e0d\u5728\u4e8e\u540e\u53f0\u7ed9\u7684\u8bed\u8a00\u914d\u7f6e\u5217\u8868\u5f53\u4e2d"

    .line 90
    .line 91
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iget-object v4, v0, Ll/rog0;->h:Ll/uwg0;

    .line 96
    .line 97
    if-eqz v4, :cond_4

    .line 98
    .line 99
    invoke-virtual {v4}, Ll/uwg0;->l()V

    .line 100
    .line 101
    .line 102
    :cond_4
    new-instance v4, Ltech/sud/gip/asr/base/Sudif;

    .line 103
    .line 104
    sget-object v5, Ll/utg0;->g:Ljava/lang/String;

    .line 105
    .line 106
    invoke-direct {v4, v5}, Ltech/sud/gip/asr/base/Sudif;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v5, Ll/uwg0;

    .line 110
    .line 111
    invoke-direct {v5, v4}, Ll/uwg0;-><init>(Ltech/sud/gip/asr/base/Sudif;)V

    .line 112
    .line 113
    .line 114
    iput-object v5, v0, Ll/rog0;->h:Ll/uwg0;

    .line 115
    .line 116
    new-instance v4, Ll/hfg0;

    .line 117
    .line 118
    invoke-direct {v4}, Ll/hfg0;-><init>()V

    .line 119
    .line 120
    .line 121
    iget-object v5, v2, Ltech/sud/gip/core/model/VolcCfg;->async_url:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v5, v4, Ll/hfg0;->a:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v5, v2, Ltech/sud/gip/core/model/VolcCfg;->app_key:Ljava/lang/String;

    .line 126
    .line 127
    iput-object v5, v4, Ll/hfg0;->b:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v5, v2, Ltech/sud/gip/core/model/VolcCfg;->access_key:Ljava/lang/String;

    .line 130
    .line 131
    iput-object v5, v4, Ll/hfg0;->c:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v5, v2, Ltech/sud/gip/core/model/VolcCfg;->resource_id:Ljava/lang/String;

    .line 134
    .line 135
    iput-object v5, v4, Ll/hfg0;->d:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v5, v2, Ltech/sud/gip/core/model/VolcCfg;->model_name:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v5, v4, Ll/hfg0;->h:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v2, v2, Ltech/sud/gip/core/model/VolcCfg;->request_config:Lorg/json/JSONObject;

    .line 142
    .line 143
    iput-object v2, v4, Ll/hfg0;->k:Lorg/json/JSONObject;

    .line 144
    .line 145
    iget-object v2, v0, Ll/rog0;->d:Ljava/lang/String;

    .line 146
    .line 147
    iput-object v2, v4, Ll/hfg0;->e:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v2, v0, Ll/rog0;->i:Ll/pkg0;

    .line 150
    .line 151
    if-eqz v2, :cond_6

    .line 152
    .line 153
    iget-object v5, v2, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 154
    .line 155
    if-eqz v5, :cond_5

    .line 156
    .line 157
    const/4 v6, 0x0

    .line 158
    invoke-virtual {v5, v6}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 159
    .line 160
    .line 161
    iput-object v3, v2, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 162
    .line 163
    :cond_5
    iput-object v3, v0, Ll/rog0;->i:Ll/pkg0;

    .line 164
    .line 165
    :cond_6
    new-instance v2, Ll/pkg0;

    .line 166
    .line 167
    invoke-direct {v2}, Ll/pkg0;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object v2, v0, Ll/rog0;->i:Ll/pkg0;

    .line 171
    .line 172
    iput-object v2, v4, Ll/hfg0;->f:Ll/pkg0;

    .line 173
    .line 174
    iput-object v1, v4, Ll/hfg0;->g:Ljava/lang/String;

    .line 175
    .line 176
    iget-wide v1, v0, Ll/rog0;->b:J

    .line 177
    .line 178
    iput-wide v1, v4, Ll/hfg0;->i:J

    .line 179
    .line 180
    iget-object v1, v0, Ll/rog0;->c:Ljava/lang/String;

    .line 181
    .line 182
    iput-object v1, v4, Ll/hfg0;->j:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v1, v0, Ll/rog0;->h:Ll/uwg0;

    .line 185
    .line 186
    new-instance v2, Ll/cgg0;

    .line 187
    .line 188
    invoke-direct {v2, v4}, Ll/cgg0;-><init>(Ll/hfg0;)V

    .line 189
    .line 190
    .line 191
    new-instance v4, Ll/esg0;

    .line 192
    .line 193
    invoke-direct {v4, v0}, Ll/esg0;-><init>(Ll/rog0;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, v2, v4}, Ll/uwg0;->c(Ll/cgg0;Ll/nzg0;)V

    .line 197
    .line 198
    .line 199
    const-string v1, "AiAgentImpl"

    .line 200
    .line 201
    const-string v2, "startAudioRecognize success "

    .line 202
    .line 203
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    iget-object v1, v0, Ll/rog0;->a:Ljava/lang/String;

    .line 207
    .line 208
    const-string v2, "startAudioRecognize success "

    .line 209
    .line 210
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 214
    :goto_2
    iget-object p0, p0, Ll/xkg0;->a:Ll/rog0;

    .line 215
    .line 216
    iput-object v3, p0, Ll/rog0;->l:Ll/xkg0;

    .line 217
    .line 218
    return-void

    .line 219
    :goto_3
    monitor-exit v0

    .line 220
    throw p0
.end method
