.class public final Ll/dqr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:Lcom/google/android/gms/internal/ads/zzgaf;

.field public static final f:Lcom/google/android/gms/internal/ads/zzgaf;

.field public static final g:Lcom/google/android/gms/internal/ads/zzgaf;

.field public static final h:Lcom/google/android/gms/internal/ads/zzgaf;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "\\s+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/dqr0;->d:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "auto"

    .line 10
    .line 11
    const-string v1, "none"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzgaf;->zzp(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/dqr0;->e:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 18
    .line 19
    const-string v0, "sesame"

    .line 20
    .line 21
    const-string v1, "circle"

    .line 22
    .line 23
    const-string v2, "dot"

    .line 24
    .line 25
    invoke-static {v2, v0, v1}, Lcom/google/android/gms/internal/ads/zzgaf;->zzq(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/dqr0;->f:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 30
    .line 31
    const-string v0, "filled"

    .line 32
    .line 33
    const-string v1, "open"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzgaf;->zzp(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll/dqr0;->g:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 40
    .line 41
    const-string v0, "before"

    .line 42
    .line 43
    const-string v1, "outside"

    .line 44
    .line 45
    const-string v2, "after"

    .line 46
    .line 47
    invoke-static {v2, v0, v1}, Lcom/google/android/gms/internal/ads/zzgaf;->zzq(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Ll/dqr0;->h:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 52
    .line 53
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/dqr0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/dqr0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/dqr0;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static a(Ljava/lang/String;)Ll/dqr0;
    .locals 7
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto/16 :goto_6

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_d

    .line 18
    .line 19
    sget-object v0, Ll/dqr0;->d:Ljava/util/regex/Pattern;

    .line 20
    .line 21
    invoke-static {p0, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzgaf;->zzm([Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaf;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Ll/dqr0;->h:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/btw0;->b(Ljava/util/Set;Ljava/util/Set;)Ll/xsw0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "outside"

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/trw0;->a(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const v3, -0x41ecca5b

    .line 48
    .line 49
    .line 50
    const/4 v4, 0x1

    .line 51
    const/4 v5, 0x2

    .line 52
    if-eq v2, v3, :cond_2

    .line 53
    .line 54
    const v1, 0x58705dc

    .line 55
    .line 56
    .line 57
    if-eq v2, v1, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string v1, "after"

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    move v0, v5

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    const/4 v0, -0x2

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    :goto_0
    move v0, v4

    .line 79
    :goto_1
    sget-object v1, Ll/dqr0;->e:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 80
    .line 81
    invoke-static {v1, p0}, Ll/btw0;->b(Ljava/util/Set;Ljava/util/Set;)Ll/xsw0;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    const/4 v3, -0x1

    .line 90
    const/4 v6, 0x0

    .line 91
    if-nez v2, :cond_6

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    const v2, 0x33af38

    .line 108
    .line 109
    .line 110
    if-eq v1, v2, :cond_4

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    const-string v1, "none"

    .line 114
    .line 115
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_5

    .line 120
    .line 121
    move v4, v6

    .line 122
    goto/16 :goto_5

    .line 123
    .line 124
    :cond_5
    :goto_2
    move v4, v3

    .line 125
    goto :goto_5

    .line 126
    :cond_6
    sget-object v1, Ll/dqr0;->g:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 127
    .line 128
    invoke-static {v1, p0}, Ll/btw0;->b(Ljava/util/Set;Ljava/util/Set;)Ll/xsw0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    sget-object v2, Ll/dqr0;->f:Lcom/google/android/gms/internal/ads/zzgaf;

    .line 133
    .line 134
    invoke-static {v2, p0}, Ll/btw0;->b(Ljava/util/Set;Ljava/util/Set;)Ll/xsw0;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_7

    .line 143
    .line 144
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_7

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_7
    const-string v2, "filled"

    .line 152
    .line 153
    invoke-static {v1, v2}, Ll/trw0;->a(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    const v3, 0x34264a

    .line 164
    .line 165
    .line 166
    if-eq v2, v3, :cond_8

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_8
    const-string v2, "open"

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_9

    .line 176
    .line 177
    move v6, v5

    .line 178
    goto :goto_4

    .line 179
    :cond_9
    :goto_3
    move v6, v4

    .line 180
    :goto_4
    const-string v1, "circle"

    .line 181
    .line 182
    invoke-static {p0, v1}, Ll/trw0;->a(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    check-cast p0, Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    const v2, -0x35fdaa48    # -2135406.0f

    .line 193
    .line 194
    .line 195
    if-eq v1, v2, :cond_b

    .line 196
    .line 197
    const v2, 0x18549

    .line 198
    .line 199
    .line 200
    if-eq v1, v2, :cond_a

    .line 201
    .line 202
    goto :goto_5

    .line 203
    :cond_a
    const-string v1, "dot"

    .line 204
    .line 205
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-eqz p0, :cond_c

    .line 210
    .line 211
    move v4, v5

    .line 212
    goto :goto_5

    .line 213
    :cond_b
    const-string v1, "sesame"

    .line 214
    .line 215
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_c

    .line 220
    .line 221
    const/4 v4, 0x3

    .line 222
    :cond_c
    :goto_5
    new-instance p0, Ll/dqr0;

    .line 223
    .line 224
    invoke-direct {p0, v4, v6, v0}, Ll/dqr0;-><init>(III)V

    .line 225
    .line 226
    .line 227
    return-object p0

    .line 228
    :cond_d
    :goto_6
    const/4 p0, 0x0

    .line 229
    return-object p0
.end method
