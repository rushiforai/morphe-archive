.class public abstract Ll/nhg0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "request_id"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p1, "ret_code"

    .line 12
    .line 13
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "ret_msg"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ll/qtg0;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v2, "request_id"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 13
    :try_start_1
    const-string v3, "event"

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 19
    goto :goto_1

    .line 20
    :catch_0
    move-exception v1

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception v1

    .line 23
    move-object v2, v0

    .line 24
    :goto_0
    invoke-static {v1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v3, "SudAiManager"

    .line 29
    .line 30
    invoke-static {v3, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    move-object v1, v0

    .line 34
    :goto_1
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ll/zzg0;

    .line 40
    .line 41
    invoke-direct {p1, v3, v2, v1}, Ll/zzg0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 45
    .line 46
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 47
    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    const/16 p0, -0x2777

    .line 51
    .line 52
    const-string v0, "Please call initSDK first successfully"

    .line 53
    .line 54
    invoke-virtual {p1, p0, v0}, Ll/zzg0;->onFailure(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_4

    .line 58
    :cond_0
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    iget-object v1, v1, Ll/gvg0;->m:Ll/tfg0;

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_1
    move-object v1, v0

    .line 70
    :goto_2
    if-eqz v1, :cond_2

    .line 71
    .line 72
    iget-object v1, v1, Ll/tfg0;->a:Ljava/lang/String;

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_2
    move-object v1, v0

    .line 76
    :goto_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    const/4 p0, -0x1

    .line 83
    const-string v0, "model_api_cfg ai_normal url is null"

    .line 84
    .line 85
    invoke-virtual {p1, p0, v0}, Ll/zzg0;->onFailure(ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_3
    const-string v2, "application/json; charset=utf-8"

    .line 90
    .line 91
    invoke-static {v2}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v2, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v2}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    new-instance v3, Ll/bxg0;

    .line 112
    .line 113
    invoke-direct {v3}, Ll/bxg0;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v2, v3, v0}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {p0}, Ll/tsg0;->a(Ll/x1d0$a;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget-object v0, Ll/tsg0;->b:Ll/rg50;

    .line 136
    .line 137
    invoke-virtual {v0, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    new-instance v0, Ll/ulg0;

    .line 142
    .line 143
    invoke-direct {v0, p1}, Ll/ulg0;-><init>(Ll/apg0;)V

    .line 144
    .line 145
    .line 146
    invoke-interface {p0, v0}, Ll/ry3;->h(Ll/w84;)V

    .line 147
    .line 148
    .line 149
    :goto_4
    return-void
.end method

.method public static c(Ljava/lang/String;Ll/cwg0;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v2, "request_id"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 13
    :try_start_1
    const-string v3, "event"

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 19
    goto :goto_1

    .line 20
    :catch_0
    move-exception v1

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception v1

    .line 23
    move-object v2, v0

    .line 24
    :goto_0
    invoke-static {v1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v3, "SudAiManager"

    .line 29
    .line 30
    invoke-static {v3, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    move-object v1, v0

    .line 34
    :goto_1
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ll/sfg0;

    .line 40
    .line 41
    invoke-direct {p1, v3, v2, v1}, Ll/sfg0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 45
    .line 46
    iget-boolean v1, v1, Ll/uyg0;->a:Z

    .line 47
    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ll/cwg0;

    .line 55
    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    const/16 p1, -0x2777

    .line 59
    .line 60
    const-string v0, "Please call initSDK first successfully"

    .line 61
    .line 62
    invoke-static {p1, v2, v0}, Ll/nhg0;->a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p0, p1}, Ll/cwg0;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_4

    .line 70
    .line 71
    :cond_0
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 72
    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 76
    .line 77
    if-eqz v1, :cond_1

    .line 78
    .line 79
    iget-object v1, v1, Ll/gvg0;->m:Ll/tfg0;

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_1
    move-object v1, v0

    .line 83
    :goto_2
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, v1, Ll/tfg0;->b:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_2
    move-object v1, v0

    .line 89
    :goto_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_3

    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Ll/cwg0;

    .line 100
    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    const/4 p1, -0x1

    .line 104
    const-string v0, "model_api_cfg sse url is null"

    .line 105
    .line 106
    invoke-static {p1, v2, v0}, Ll/nhg0;->a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {p0, p1}, Ll/cwg0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_3
    const-string v2, "application/json; charset=utf-8"

    .line 115
    .line 116
    invoke-static {v2}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-static {v2, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v2}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    new-instance v3, Ll/bxg0;

    .line 137
    .line 138
    invoke-direct {v3}, Ll/bxg0;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {v2, v3, v0}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string v0, "sud_log_level_key"

    .line 154
    .line 155
    const-string v1, "sud_log_level_value_headers"

    .line 156
    .line 157
    invoke-virtual {p0, v0, v1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 158
    .line 159
    .line 160
    invoke-static {p0}, Ll/tsg0;->a(Ll/x1d0$a;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    sget-object v0, Ll/tsg0;->b:Ll/rg50;

    .line 168
    .line 169
    invoke-virtual {v0, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    new-instance v0, Ll/usg0;

    .line 174
    .line 175
    invoke-direct {v0, p1}, Ll/usg0;-><init>(Ll/sfg0;)V

    .line 176
    .line 177
    .line 178
    invoke-interface {p0, v0}, Ll/ry3;->h(Ll/w84;)V

    .line 179
    .line 180
    .line 181
    :cond_4
    :goto_4
    return-void
.end method
