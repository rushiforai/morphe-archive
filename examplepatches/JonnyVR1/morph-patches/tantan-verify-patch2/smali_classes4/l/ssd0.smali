.class public Ll/ssd0;
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

.method public static a(Lorg/json/JSONObject;Ll/q4f;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/q4f;->a:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-string v2, "rt"

    .line 5
    .line 6
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 10
    .line 11
    const-string v1, "tt"

    .line 12
    .line 13
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-wide v0, p1, Ll/q4f;->f:J

    .line 17
    .line 18
    const-string v2, "cttm"

    .line 19
    .line 20
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-wide v0, p1, Ll/q4f;->g:J

    .line 24
    .line 25
    const-string v2, "sttm"

    .line 26
    .line 27
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p1, Ll/q4f;->h:Z

    .line 31
    .line 32
    const-string v1, "ntpok"

    .line 33
    .line 34
    invoke-static {p0, v0, v1}, Ll/s1d0;->a(Lorg/json/JSONObject;ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-wide v0, p1, Ll/q4f;->i:J

    .line 38
    .line 39
    const-string v2, "sdtm"

    .line 40
    .line 41
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "seq"

    .line 45
    .line 46
    iget-wide v1, p1, Ll/q4f;->j:J

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const-string v0, "gseq"

    .line 52
    .line 53
    iget-wide v1, p1, Ll/q4f;->k:J

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    const-string v0, "state"

    .line 59
    .line 60
    iget v1, p1, Ll/q4f;->l:I

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v0, "euuid"

    .line 66
    .line 67
    iget-object v1, p1, Ll/q4f;->m:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    iget-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 73
    .line 74
    const-string v1, "pid"

    .line 75
    .line 76
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 80
    .line 81
    const-string v1, "eid"

    .line 82
    .line 83
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p1, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 87
    .line 88
    const-string v0, "exts"

    .line 89
    .line 90
    invoke-static {p0, p1, v0}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static b(Ll/q4f;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m4g0;->d()Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v3, "app"

    .line 20
    .line 21
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v3, "ch"

    .line 25
    .line 26
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v3, "intl"

    .line 30
    .line 31
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v3, "adtk"

    .line 35
    .line 36
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "mode"

    .line 40
    .line 41
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v4, "unionid"

    .line 50
    .line 51
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const-string v4, "os"

    .line 55
    .line 56
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v4, "osv"

    .line 60
    .line 61
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v4, "brand"

    .line 65
    .line 66
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v4, "dm"

    .line 70
    .line 71
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string v4, "sc"

    .line 75
    .line 76
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-string v4, "ct"

    .line 80
    .line 81
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v4, "aad"

    .line 85
    .line 86
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v4, "localid"

    .line 90
    .line 91
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v4, "net"

    .line 95
    .line 96
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-string v4, "mno"

    .line 100
    .line 101
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    const-string v4, "odevs"

    .line 105
    .line 106
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v4, Lorg/json/JSONObject;

    .line 110
    .line 111
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v5, "uid"

    .line 115
    .line 116
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const-string v5, "lgtp"

    .line 120
    .line 121
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v5, "sets.arg"

    .line 125
    .line 126
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string v5, "sets.locset"

    .line 130
    .line 131
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v5, "sets.locuse"

    .line 135
    .line 136
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v5, "sets.grg"

    .line 140
    .line 141
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-string v5, "sets.sex"

    .line 145
    .line 146
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const-string v5, "sets.pvc"

    .line 150
    .line 151
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    const-string v5, "sets.nt"

    .line 155
    .line 156
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string v5, "sets.osets"

    .line 160
    .line 161
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    const-string v5, "upf"

    .line 165
    .line 166
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    new-instance v5, Lorg/json/JSONObject;

    .line 170
    .line 171
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 172
    .line 173
    .line 174
    const-string v6, "appv"

    .line 175
    .line 176
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const-string v6, "sdkv"

    .line 180
    .line 181
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    const-string v6, "build"

    .line 185
    .line 186
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    const-string v6, "pkg"

    .line 190
    .line 191
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const-string v6, "source"

    .line 195
    .line 196
    invoke-virtual {v1, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    const-string v2, "device"

    .line 200
    .line 201
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    const-string v2, "sysext"

    .line 205
    .line 206
    invoke-virtual {v0, v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    const-string v3, "sys_extras"

    .line 211
    .line 212
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    .line 214
    .line 215
    const-string v2, "versions"

    .line 216
    .line 217
    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 218
    .line 219
    .line 220
    const-string v2, "tss"

    .line 221
    .line 222
    iget-object p0, p0, Ll/q4f;->v:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    .line 226
    .line 227
    const-string p0, "user"

    .line 228
    .line 229
    invoke-virtual {v1, p0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 230
    .line 231
    .line 232
    const-string p0, "ab"

    .line 233
    .line 234
    invoke-static {v1, v0, p0}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    return-object v1
.end method

.method public static c(Ll/q4f;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/ssd0;->a(Lorg/json/JSONObject;Ll/q4f;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
