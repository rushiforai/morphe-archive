.class public final synthetic Ll/wqv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/xqv0;


# direct methods
.method public synthetic constructor <init>(Ll/xqv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wqv0;->a:Ll/xqv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/ebt0;->i()Ll/grw0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/grw0;->zzg()Ll/f8s0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/ebt0;->i()Ll/grw0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Ll/grw0;->zzN()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/ebt0;->i()Ll/grw0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Ll/grw0;->zzO()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    goto/16 :goto_2

    .line 50
    .line 51
    :cond_1
    invoke-virtual {p0}, Ll/f8s0;->h()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/f8s0;->g()V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-virtual {p0}, Ll/f8s0;->a()Ll/v7s0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_4

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/v7s0;->d()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p0}, Ll/v7s0;->e()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {p0}, Ll/v7s0;->f()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Ll/ebt0;->i()Ll/grw0;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface {v3, v1}, Ll/grw0;->s(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    if-eqz p0, :cond_5

    .line 92
    .line 93
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v3}, Ll/ebt0;->i()Ll/grw0;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-interface {v3, p0}, Ll/grw0;->w(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/ebt0;->i()Ll/grw0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-interface {p0}, Ll/grw0;->zzj()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ll/ebt0;->i()Ll/grw0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-interface {p0}, Ll/grw0;->zzk()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    move-object v2, v0

    .line 130
    :cond_5
    :goto_0
    new-instance v3, Landroid/os/Bundle;

    .line 131
    .line 132
    const/4 v4, 0x1

    .line 133
    invoke-direct {v3, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v4}, Ll/ebt0;->i()Ll/grw0;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-interface {v4}, Ll/grw0;->zzO()Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-nez v4, :cond_7

    .line 149
    .line 150
    const-string v4, "v_fp_vertical"

    .line 151
    .line 152
    if-eqz p0, :cond_6

    .line 153
    .line 154
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-nez v5, :cond_6

    .line 159
    .line 160
    invoke-virtual {v3, v4, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_6
    const-string p0, "no_hash"

    .line 165
    .line 166
    invoke-virtual {v3, v4, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    :cond_7
    :goto_1
    if-eqz v1, :cond_8

    .line 170
    .line 171
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p0}, Ll/ebt0;->i()Ll/grw0;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-interface {p0}, Ll/grw0;->zzN()Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-nez p0, :cond_8

    .line 184
    .line 185
    const-string p0, "fingerprint"

    .line 186
    .line 187
    invoke-virtual {v3, p0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-nez p0, :cond_8

    .line 195
    .line 196
    const-string p0, "v_fp"

    .line 197
    .line 198
    invoke-virtual {v3, p0, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_8
    invoke-virtual {v3}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-nez p0, :cond_9

    .line 206
    .line 207
    move-object v0, v3

    .line 208
    :cond_9
    :goto_2
    new-instance p0, Ll/yqv0;

    .line 209
    .line 210
    invoke-direct {p0, v0}, Ll/yqv0;-><init>(Landroid/os/Bundle;)V

    .line 211
    .line 212
    .line 213
    return-object p0
.end method
