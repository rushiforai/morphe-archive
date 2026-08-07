.class public final Ll/irr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/oqr0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/irr0;->a:Ll/bgw0;

    .line 10
    .line 11
    new-instance v0, Ll/oqr0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/oqr0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/irr0;->b:Ll/oqr0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 7

    .line 1
    add-int/2addr p3, p2

    .line 2
    iget-object v0, p0, Ll/irr0;->a:Ll/bgw0;

    .line 3
    .line 4
    invoke-virtual {v0, p1, p3}, Ll/bgw0;->i([BI)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/irr0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/bgw0;->k(I)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    iget-object p2, p0, Ll/irr0;->a:Ll/bgw0;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/bgw0;->s()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_a

    .line 30
    .line 31
    const-string v2, "WEBVTT"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcc; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    if-eqz v1, :cond_a

    .line 38
    .line 39
    :cond_0
    iget-object p2, p0, Ll/irr0;->a:Ll/bgw0;

    .line 40
    .line 41
    sget-object p3, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 42
    .line 43
    invoke-virtual {p2, p3}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    new-instance p2, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    iget-object p3, p0, Ll/irr0;->a:Ll/bgw0;

    .line 59
    .line 60
    const/4 v0, -0x1

    .line 61
    const/4 v1, 0x0

    .line 62
    move v2, v0

    .line 63
    move v3, v1

    .line 64
    :goto_1
    const/4 v4, 0x1

    .line 65
    const/4 v5, 0x2

    .line 66
    if-ne v2, v0, :cond_5

    .line 67
    .line 68
    invoke-virtual {p3}, Ll/bgw0;->s()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    sget-object v2, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 73
    .line 74
    invoke-virtual {p3, v2}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    if-nez v2, :cond_2

    .line 79
    .line 80
    move v2, v1

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const-string v6, "STYLE"

    .line 83
    .line 84
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-eqz v6, :cond_3

    .line 89
    .line 90
    move v2, v5

    .line 91
    goto :goto_1

    .line 92
    :cond_3
    const-string v5, "NOTE"

    .line 93
    .line 94
    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    move v2, v4

    .line 101
    goto :goto_1

    .line 102
    :cond_4
    const/4 v2, 0x3

    .line 103
    goto :goto_1

    .line 104
    :cond_5
    invoke-virtual {p3, v3}, Ll/bgw0;->k(I)V

    .line 105
    .line 106
    .line 107
    if-eqz v2, :cond_9

    .line 108
    .line 109
    if-ne v2, v4, :cond_6

    .line 110
    .line 111
    iget-object p3, p0, Ll/irr0;->a:Ll/bgw0;

    .line 112
    .line 113
    :goto_2
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 114
    .line 115
    invoke-virtual {p3, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_6
    if-ne v2, v5, :cond_8

    .line 127
    .line 128
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    if-eqz p3, :cond_7

    .line 133
    .line 134
    iget-object p3, p0, Ll/irr0;->a:Ll/bgw0;

    .line 135
    .line 136
    sget-object v0, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 137
    .line 138
    invoke-virtual {p3, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    iget-object p3, p0, Ll/irr0;->b:Ll/oqr0;

    .line 142
    .line 143
    iget-object v0, p0, Ll/irr0;->a:Ll/bgw0;

    .line 144
    .line 145
    invoke-virtual {p3, v0}, Ll/oqr0;->b(Ll/bgw0;)Ljava/util/List;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    invoke-interface {p1, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_7
    const-string p0, "A style block was found after the first cue."

    .line 154
    .line 155
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_8
    iget-object p3, p0, Ll/irr0;->a:Ll/bgw0;

    .line 160
    .line 161
    invoke-static {p3, p1}, Ll/hrr0;->c(Ll/bgw0;Ljava/util/List;)Ll/arr0;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    if-eqz p3, :cond_1

    .line 166
    .line 167
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_9
    new-instance p0, Ll/lrr0;

    .line 172
    .line 173
    invoke-direct {p0, p2}, Ll/lrr0;-><init>(Ljava/util/List;)V

    .line 174
    .line 175
    .line 176
    invoke-static {p0, p4, p5}, Ll/sor0;->a(Ll/tor0;Ll/wor0;Ll/hkv0;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_a
    :try_start_1
    invoke-virtual {p2, p3}, Ll/bgw0;->k(I)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2, v0}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    const-string p1, "Expected WEBVTT. Got "

    .line 188
    .line 189
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    const/4 p1, 0x0

    .line 198
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    throw p0
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzcc; {:try_start_1 .. :try_end_1} :catch_0

    .line 203
    :catch_0
    move-exception p0

    .line 204
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method
