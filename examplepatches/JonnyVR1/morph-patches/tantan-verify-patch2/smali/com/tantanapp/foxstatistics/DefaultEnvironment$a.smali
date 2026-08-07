.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/foxstatistics/DefaultEnvironment;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# direct methods
.method public constructor <init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "os"

    .line 8
    .line 9
    invoke-static {}, Ll/l0e;->i()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "osv"

    .line 23
    .line 24
    invoke-static {}, Ll/l0e;->j()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "brand"

    .line 38
    .line 39
    invoke-static {}, Ll/l0e;->b()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "dm"

    .line 53
    .line 54
    invoke-static {}, Ll/l0e;->e()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "sc"

    .line 68
    .line 69
    iget-object v2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 70
    .line 71
    invoke-static {v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Ll/l0e;->f(Landroid/content/Context;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "ct"

    .line 89
    .line 90
    invoke-static {}, Ll/l0e;->c()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "chrg"

    .line 104
    .line 105
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-static {v2}, Ll/cu2;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 117
    .line 118
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "btry"

    .line 123
    .line 124
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v2}, Ll/cu2;->a(Landroid/content/Context;)F

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "ps"

    .line 146
    .line 147
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v2}, Ll/wx0;->d(Landroid/content/Context;)I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 163
    .line 164
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "localid"

    .line 169
    .line 170
    iget-object v2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 171
    .line 172
    invoke-static {v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-static {v2}, Ll/tvv;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 184
    .line 185
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    const-string v1, "locale"

    .line 190
    .line 191
    invoke-static {}, Ll/l0e;->h()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 199
    .line 200
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    const-string v1, "lang"

    .line 205
    .line 206
    invoke-static {}, Ll/l0e;->k()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 214
    .line 215
    invoke-static {p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    const-string v0, "tz"

    .line 220
    .line 221
    invoke-static {}, Ll/l0e;->d()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .line 227
    .line 228
    goto :goto_0

    .line 229
    :catch_0
    move-exception p0

    .line 230
    invoke-static {p0}, Ll/i6f;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {p0}, Ll/i4g0;->C(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    :goto_0
    invoke-static {}, Ll/c350;->b()V

    .line 238
    .line 239
    .line 240
    return-void
.end method
