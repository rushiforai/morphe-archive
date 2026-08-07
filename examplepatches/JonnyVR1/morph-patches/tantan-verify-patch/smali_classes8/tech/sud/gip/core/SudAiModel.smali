.class public Ltech/sud/gip/core/SudAiModel;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static aiCommon(Ljava/lang/String;Ltech/sud/gip/core/ai/ISudListenerAiCommon;)V
    .locals 2

    .line 1
    sget-object v0, Ll/pyg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "SudAiModelImpl"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p0, "aiCommon listener is null"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    sget-object p0, Ll/pyg0;->a:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "Please call on UI or Main thread"

    .line 22
    .line 23
    invoke-static {p0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "aiCommon Please call on UI or Main thread"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, -0x1

    .line 32
    invoke-static {p0, v1}, Ll/pyg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p1, p0}, Ltech/sud/gip/core/ai/ISudListenerAiCommon;->onCompleted(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 41
    .line 42
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    const-string p0, "aiCommon Please call initSDK first successfully"

    .line 47
    .line 48
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    const/16 p0, -0x2777

    .line 52
    .line 53
    const-string v0, "Please call initSDK first successfully"

    .line 54
    .line 55
    invoke-static {p0, v0}, Ll/pyg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p1, p0}, Ltech/sud/gip/core/ai/ISudListenerAiCommon;->onCompleted(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    new-instance v0, Ll/omg0;

    .line 64
    .line 65
    invoke-direct {v0, p0, p1}, Ll/omg0;-><init>(Ljava/lang/String;Ltech/sud/gip/core/ai/ISudListenerAiCommon;)V

    .line 66
    .line 67
    .line 68
    sget-object p1, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :cond_3
    invoke-static {p0, v0}, Ll/nhg0;->b(Ljava/lang/String;Ll/qtg0;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static aiSse(Ljava/lang/String;Ltech/sud/gip/core/ai/ISudListenerAiSse;)V
    .locals 2

    .line 1
    sget-object v0, Ll/pyg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "SudAiModelImpl"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p0, "aiSse listener is null"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    sget-object p0, Ll/pyg0;->a:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "aiSse Please call on UI or Main thread"

    .line 22
    .line 23
    invoke-static {p0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, -0x1

    .line 30
    const-string v0, "Please call on UI or Main thread"

    .line 31
    .line 32
    invoke-interface {p1, p0, v0}, Ltech/sud/gip/core/ai/ISudListenerAiSse;->onFailure(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 37
    .line 38
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    const-string p0, "aiSse Please call initSDK first successfully"

    .line 43
    .line 44
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    const/16 p0, -0x2777

    .line 48
    .line 49
    const-string v0, "Please call initSDK first successfully"

    .line 50
    .line 51
    invoke-interface {p1, p0, v0}, Ltech/sud/gip/core/ai/ISudListenerAiSse;->onFailure(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    new-instance v0, Ll/qpg0;

    .line 56
    .line 57
    invoke-direct {v0, p1}, Ll/qpg0;-><init>(Ltech/sud/gip/core/ai/ISudListenerAiSse;)V

    .line 58
    .line 59
    .line 60
    sget-object p1, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-static {p0, v0}, Ll/nhg0;->c(Ljava/lang/String;Ll/cwg0;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static clearAllCache(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Ll/pyg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/pyg0;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "clearAllCache Cannot be called in the main thread"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "SudAiModelImpl"

    .line 17
    .line 18
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-nez p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    new-instance v0, Ljava/io/File;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v1, "sud/mgp/ai"

    .line 33
    .line 34
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-static {p0}, Ll/ofg0;->c(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static getCachePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/pyg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "sud/mgp/ai"

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static loadModel(Ljava/lang/String;Ltech/sud/gip/core/ai/ISudListenerLoadModel;)V
    .locals 6

    .line 1
    sget-object v0, Ll/pyg0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "SudAiModelImpl"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p0, "loadModel listener is null"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, -0x1

    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    sget-object p0, Ll/pyg0;->a:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "loadModel Please call on UI or Main thread"

    .line 23
    .line 24
    invoke-static {p0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "Please call on UI or Main thread"

    .line 31
    .line 32
    invoke-interface {p1, v2, p0}, Ltech/sud/gip/core/ai/ISudListenerLoadModel;->onFailure(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 37
    .line 38
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 39
    .line 40
    const-string v3, "Please call initSDK first successfully"

    .line 41
    .line 42
    const/16 v4, -0x2777

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    const-string p0, "loadModel Please call initSDK first successfully"

    .line 47
    .line 48
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p1, v4, v3}, Ltech/sud/gip/core/ai/ISudListenerLoadModel;->onFailure(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    new-instance v0, Ll/nng0;

    .line 56
    .line 57
    new-instance v1, Ll/mvg0;

    .line 58
    .line 59
    invoke-direct {v1, p1}, Ll/mvg0;-><init>(Ltech/sud/gip/core/ai/ISudListenerLoadModel;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {v0, p0, v1}, Ll/nng0;-><init>(Ljava/lang/String;Ll/mvg0;)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Ll/pyg0;->b:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    :cond_3
    new-instance p1, Ll/jjg0;

    .line 77
    .line 78
    invoke-direct {p1, v0}, Ll/jjg0;-><init>(Ll/nng0;)V

    .line 79
    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const-string v5, "request_id"

    .line 88
    .line 89
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    goto :goto_0

    .line 94
    :catch_0
    move-exception v1

    .line 95
    invoke-static {v1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v5, "SudAiManager"

    .line 100
    .line 101
    invoke-static {v5, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    move-object v1, v0

    .line 105
    :goto_0
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 106
    .line 107
    invoke-direct {v5, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    new-instance p1, Ll/lgg0;

    .line 111
    .line 112
    invoke-direct {p1, v5, v1}, Ll/lgg0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 116
    .line 117
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 118
    .line 119
    if-nez v1, :cond_4

    .line 120
    .line 121
    invoke-virtual {p1, v4, v3}, Ll/lgg0;->onFailure(ILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_4
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 126
    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 130
    .line 131
    if-eqz v1, :cond_5

    .line 132
    .line 133
    iget-object v1, v1, Ll/gvg0;->m:Ll/tfg0;

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    move-object v1, v0

    .line 137
    :goto_1
    if-eqz v1, :cond_6

    .line 138
    .line 139
    iget-object v1, v1, Ll/tfg0;->c:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_6
    move-object v1, v0

    .line 143
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_7

    .line 148
    .line 149
    const-string p0, "model_api_cfg ai_normal url is null"

    .line 150
    .line 151
    invoke-virtual {p1, v2, p0}, Ll/lgg0;->onFailure(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_7
    const-string v2, "application/json; charset=utf-8"

    .line 156
    .line 157
    invoke-static {v2}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v2, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-static {v2}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    new-instance v3, Ll/bxg0;

    .line 178
    .line 179
    invoke-direct {v3}, Ll/bxg0;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-static {v2, v3, v0}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {p0}, Ll/tsg0;->a(Ll/x1d0$a;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget-object v0, Ll/tsg0;->b:Ll/rg50;

    .line 202
    .line 203
    invoke-virtual {v0, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    new-instance v0, Ll/ulg0;

    .line 208
    .line 209
    invoke-direct {v0, p1}, Ll/ulg0;-><init>(Ll/apg0;)V

    .line 210
    .line 211
    .line 212
    invoke-interface {p0, v0}, Ll/ry3;->h(Ll/w84;)V

    .line 213
    .line 214
    .line 215
    :goto_3
    return-void
.end method
