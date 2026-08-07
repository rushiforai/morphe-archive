.class public final Ll/hqr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# static fields
.field public static final b:Ljava/util/regex/Pattern;

.field public static final c:Ljava/util/regex/Pattern;

.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:Ljava/util/regex/Pattern;

.field public static final f:Ljava/util/regex/Pattern;

.field public static final g:Ljava/util/regex/Pattern;

.field public static final h:Ljava/util/regex/Pattern;

.field public static final i:Ll/fqr0;


# instance fields
.field public final a:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "^([0-9][0-9]+):([0-9][0-9]):([0-9][0-9])(?:(\\.[0-9]+)|:([0-9][0-9])(?:\\.([0-9]+))?)?$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/hqr0;->b:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "^([0-9]+(?:\\.[0-9]+)?)(h|m|s|ms|f|t)$"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/hqr0;->c:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    const-string v0, "^(([0-9]*.)?[0-9]+)(px|em|%)$"

    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/hqr0;->d:Ljava/util/regex/Pattern;

    .line 24
    .line 25
    const-string v0, "^([-+]?\\d+\\.?\\d*?)%$"

    .line 26
    .line 27
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/hqr0;->e:Ljava/util/regex/Pattern;

    .line 32
    .line 33
    const-string v0, "^(\\d+\\.?\\d*?)% (\\d+\\.?\\d*?)%$"

    .line 34
    .line 35
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll/hqr0;->f:Ljava/util/regex/Pattern;

    .line 40
    .line 41
    const-string v0, "^(\\d+\\.?\\d*?)px (\\d+\\.?\\d*?)px$"

    .line 42
    .line 43
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/hqr0;->g:Ljava/util/regex/Pattern;

    .line 48
    .line 49
    const-string v0, "^(\\d+) (\\d+)$"

    .line 50
    .line 51
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Ll/hqr0;->h:Ljava/util/regex/Pattern;

    .line 56
    .line 57
    new-instance v0, Ll/fqr0;

    .line 58
    .line 59
    const/high16 v1, 0x41f00000    # 30.0f

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-direct {v0, v1, v2, v2}, Ll/fqr0;-><init>(FII)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Ll/hqr0;->i:Ll/fqr0;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/hqr0;->a:Lorg/xmlpull/v1/XmlPullParserFactory;

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-virtual {v0, p0}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string v0, "Couldn\'t create XmlPullParserFactory instance"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    throw p0
.end method

.method public static c(Ljava/lang/String;Ll/fqr0;)J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzakn;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/hqr0;->b:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-wide v2, 0x412e848000000000L    # 1000000.0

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    const/4 v5, 0x1

    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v5

    .line 31
    const-wide/16 v7, 0xe10

    .line 32
    .line 33
    mul-long/2addr v5, v7

    .line 34
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    long-to-double v4, v5

    .line 42
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    const-wide/16 v8, 0x3c

    .line 47
    .line 48
    mul-long/2addr v6, v8

    .line 49
    const/4 p0, 0x3

    .line 50
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    long-to-double v6, v6

    .line 58
    add-double/2addr v4, v6

    .line 59
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v6

    .line 63
    long-to-double v6, v6

    .line 64
    const/4 p0, 0x4

    .line 65
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-wide/16 v8, 0x0

    .line 70
    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 74
    .line 75
    .line 76
    move-result-wide v10

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    move-wide v10, v8

    .line 79
    :goto_0
    add-double/2addr v4, v6

    .line 80
    const/4 p0, 0x5

    .line 81
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v6

    .line 91
    long-to-float p0, v6

    .line 92
    iget v1, p1, Ll/fqr0;->a:F

    .line 93
    .line 94
    div-float/2addr p0, v1

    .line 95
    float-to-double v6, p0

    .line 96
    goto :goto_1

    .line 97
    :cond_1
    move-wide v6, v8

    .line 98
    :goto_1
    add-double/2addr v4, v10

    .line 99
    const/4 p0, 0x6

    .line 100
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-eqz p0, :cond_2

    .line 105
    .line 106
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    long-to-double v0, v0

    .line 111
    iget p0, p1, Ll/fqr0;->b:I

    .line 112
    .line 113
    int-to-double v8, p0

    .line 114
    iget p0, p1, Ll/fqr0;->a:F

    .line 115
    .line 116
    float-to-double p0, p0

    .line 117
    div-double/2addr v0, v8

    .line 118
    div-double v8, v0, p0

    .line 119
    .line 120
    :cond_2
    add-double/2addr v4, v6

    .line 121
    add-double/2addr v4, v8

    .line 122
    mul-double/2addr v4, v2

    .line 123
    double-to-long p0, v4

    .line 124
    return-wide p0

    .line 125
    :cond_3
    sget-object v0, Ll/hqr0;->c:Ljava/util/regex/Pattern;

    .line 126
    .line 127
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_b

    .line 136
    .line 137
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 145
    .line 146
    .line 147
    move-result-wide v5

    .line 148
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    const/16 v1, 0x66

    .line 160
    .line 161
    if-eq v0, v1, :cond_9

    .line 162
    .line 163
    const/16 v1, 0x68

    .line 164
    .line 165
    if-eq v0, v1, :cond_8

    .line 166
    .line 167
    const/16 v1, 0x6d

    .line 168
    .line 169
    if-eq v0, v1, :cond_7

    .line 170
    .line 171
    const/16 v1, 0xda6

    .line 172
    .line 173
    if-eq v0, v1, :cond_6

    .line 174
    .line 175
    const/16 v1, 0x73

    .line 176
    .line 177
    if-eq v0, v1, :cond_5

    .line 178
    .line 179
    const/16 v1, 0x74

    .line 180
    .line 181
    if-eq v0, v1, :cond_4

    .line 182
    .line 183
    goto :goto_4

    .line 184
    :cond_4
    const-string v0, "t"

    .line 185
    .line 186
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_a

    .line 191
    .line 192
    iget p0, p1, Ll/fqr0;->c:I

    .line 193
    .line 194
    int-to-double p0, p0

    .line 195
    :goto_2
    div-double/2addr v5, p0

    .line 196
    goto :goto_4

    .line 197
    :cond_5
    const-string p1, "s"

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    goto :goto_4

    .line 204
    :cond_6
    const-string p1, "ms"

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-eqz p0, :cond_a

    .line 211
    .line 212
    const-wide p0, 0x408f400000000000L    # 1000.0

    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_7
    const-string p1, "m"

    .line 219
    .line 220
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    if-eqz p0, :cond_a

    .line 225
    .line 226
    const-wide/high16 p0, 0x404e000000000000L    # 60.0

    .line 227
    .line 228
    :goto_3
    mul-double/2addr v5, p0

    .line 229
    goto :goto_4

    .line 230
    :cond_8
    const-string p1, "h"

    .line 231
    .line 232
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    if-eqz p0, :cond_a

    .line 237
    .line 238
    const-wide p0, 0x40ac200000000000L    # 3600.0

    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_9
    const-string v0, "f"

    .line 245
    .line 246
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    if-eqz p0, :cond_a

    .line 251
    .line 252
    iget p0, p1, Ll/fqr0;->a:F

    .line 253
    .line 254
    float-to-double p0, p0

    .line 255
    goto :goto_2

    .line 256
    :cond_a
    :goto_4
    mul-double/2addr v5, v2

    .line 257
    double-to-long p0, v5

    .line 258
    return-wide p0

    .line 259
    :cond_b
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    new-instance p1, Lcom/google/android/gms/internal/ads/zzakn;

    .line 264
    .line 265
    const-string v0, "Malformed time expression: "

    .line 266
    .line 267
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzakn;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    throw p1
.end method

.method public static d(Ljava/lang/String;)Landroid/text/Layout$Alignment;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_2

    .line 13
    :sswitch_0
    const-string v0, "start"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :sswitch_1
    const-string v0, "right"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :sswitch_2
    const-string v0, "left"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    :goto_0
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 40
    .line 41
    return-object p0

    .line 42
    :sswitch_3
    const-string v0, "end"

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    :goto_1
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 51
    .line 52
    return-object p0

    .line 53
    :sswitch_4
    const-string v0, "center"

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_0
    :goto_2
    const/4 p0, 0x0

    .line 65
    return-object p0

    .line 66
    nop

    .line 67
    :sswitch_data_0
    .sparse-switch
        -0x514d33ab -> :sswitch_4
        0x188db -> :sswitch_3
        0x32a007 -> :sswitch_2
        0x677c21c -> :sswitch_1
        0x68ac462 -> :sswitch_0
    .end sparse-switch
.end method

.method public static e(Ll/kqr0;)Ll/kqr0;
    .locals 0
    .param p0    # Ll/kqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/kqr0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/kqr0;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public static f(Lorg/xmlpull/v1/XmlPullParser;Ll/kqr0;)Ll/kqr0;
    .locals 14

    .line 1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_f

    .line 8
    .line 9
    invoke-interface {p0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-interface {p0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const/4 v6, 0x3

    .line 22
    const/4 v7, 0x0

    .line 23
    const/4 v8, 0x2

    .line 24
    const-string v9, "TtmlParser"

    .line 25
    .line 26
    const/4 v10, 0x1

    .line 27
    sparse-switch v5, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    goto/16 :goto_7

    .line 31
    .line 32
    :sswitch_0
    const-string v5, "multiRowAlign"

    .line 33
    .line 34
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_e

    .line 39
    .line 40
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {v3}, Ll/hqr0;->d(Ljava/lang/String;)Landroid/text/Layout$Alignment;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {p1, v3}, Ll/kqr0;->F(Landroid/text/Layout$Alignment;)Ll/kqr0;

    .line 49
    .line 50
    .line 51
    goto/16 :goto_7

    .line 52
    .line 53
    :sswitch_1
    const-string v5, "backgroundColor"

    .line 54
    .line 55
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_e

    .line 60
    .line 61
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    :try_start_0
    invoke-static {v3}, Ll/aiv0;->b(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {p1, v4}, Ll/kqr0;->w(I)Ll/kqr0;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    goto/16 :goto_7

    .line 73
    .line 74
    :catch_0
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const-string v4, "Failed parsing background value: "

    .line 79
    .line 80
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_7

    .line 88
    .line 89
    :sswitch_2
    const-string v5, "rubyPosition"

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_e

    .line 96
    .line 97
    invoke-static {v3}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    const v5, -0x5305c081

    .line 106
    .line 107
    .line 108
    if-eq v4, v5, :cond_1

    .line 109
    .line 110
    const v5, 0x58705dc

    .line 111
    .line 112
    .line 113
    if-eq v4, v5, :cond_0

    .line 114
    .line 115
    goto/16 :goto_7

    .line 116
    .line 117
    :cond_0
    const-string v4, "after"

    .line 118
    .line 119
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-eqz v3, :cond_e

    .line 124
    .line 125
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1, v8}, Ll/kqr0;->G(I)Ll/kqr0;

    .line 130
    .line 131
    .line 132
    goto/16 :goto_7

    .line 133
    .line 134
    :cond_1
    const-string v4, "before"

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_e

    .line 141
    .line 142
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, v10}, Ll/kqr0;->G(I)Ll/kqr0;

    .line 147
    .line 148
    .line 149
    goto/16 :goto_7

    .line 150
    .line 151
    :sswitch_3
    const-string v5, "textEmphasis"

    .line 152
    .line 153
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_e

    .line 158
    .line 159
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-static {v3}, Ll/dqr0;->a(Ljava/lang/String;)Ll/dqr0;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {p1, v3}, Ll/kqr0;->b(Ll/dqr0;)Ll/kqr0;

    .line 168
    .line 169
    .line 170
    goto/16 :goto_7

    .line 171
    .line 172
    :sswitch_4
    const-string v5, "fontSize"

    .line 173
    .line 174
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-eqz v4, :cond_e

    .line 179
    .line 180
    :try_start_1
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    const-string v4, "\\s+"

    .line 185
    .line 186
    sget v5, Ll/mpw0;->a:I

    .line 187
    .line 188
    const/4 v5, -0x1

    .line 189
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    array-length v5, v4

    .line 194
    if-ne v5, v10, :cond_2

    .line 195
    .line 196
    sget-object v4, Ll/hqr0;->d:Ljava/util/regex/Pattern;

    .line 197
    .line 198
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    goto :goto_1

    .line 203
    :cond_2
    if-ne v5, v8, :cond_9

    .line 204
    .line 205
    sget-object v5, Ll/hqr0;->d:Ljava/util/regex/Pattern;

    .line 206
    .line 207
    aget-object v4, v4, v10

    .line 208
    .line 209
    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    const-string v5, "Multiple values in fontSize attribute. Picking the second value for vertical font size and ignoring the first."

    .line 214
    .line 215
    invoke-static {v9, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :goto_1
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    .line 219
    .line 220
    .line 221
    move-result v5
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_1 .. :try_end_1} :catch_1

    .line 222
    const-string v11, "\'."

    .line 223
    .line 224
    if-eqz v5, :cond_8

    .line 225
    .line 226
    :try_start_2
    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    if-eqz v5, :cond_7

    .line 231
    .line 232
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v12
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_2 .. :try_end_2} :catch_1

    .line 236
    const/16 v13, 0x25

    .line 237
    .line 238
    if-eq v12, v13, :cond_4

    .line 239
    .line 240
    const/16 v6, 0xca8

    .line 241
    .line 242
    if-eq v12, v6, :cond_3

    .line 243
    .line 244
    const/16 v6, 0xe08

    .line 245
    .line 246
    if-ne v12, v6, :cond_6

    .line 247
    .line 248
    const-string v6, "px"

    .line 249
    .line 250
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v6

    .line 254
    if-eqz v6, :cond_6

    .line 255
    .line 256
    :try_start_3
    invoke-virtual {p1, v10}, Ll/kqr0;->B(I)Ll/kqr0;
    :try_end_3
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_3 .. :try_end_3} :catch_1

    .line 257
    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_3
    const-string v6, "em"

    .line 261
    .line 262
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v6

    .line 266
    if-eqz v6, :cond_6

    .line 267
    .line 268
    :try_start_4
    invoke-virtual {p1, v8}, Ll/kqr0;->B(I)Ll/kqr0;
    :try_end_4
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_4 .. :try_end_4} :catch_1

    .line 269
    .line 270
    .line 271
    goto :goto_2

    .line 272
    :cond_4
    const-string v8, "%"

    .line 273
    .line 274
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v8

    .line 278
    if-eqz v8, :cond_6

    .line 279
    .line 280
    :try_start_5
    invoke-virtual {p1, v6}, Ll/kqr0;->B(I)Ll/kqr0;

    .line 281
    .line 282
    .line 283
    :goto_2
    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    if-eqz v4, :cond_5

    .line 288
    .line 289
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    invoke-virtual {p1, v4}, Ll/kqr0;->A(F)Ll/kqr0;

    .line 294
    .line 295
    .line 296
    goto/16 :goto_7

    .line 297
    .line 298
    :cond_5
    throw v7

    .line 299
    :cond_6
    new-instance v4, Lcom/google/android/gms/internal/ads/zzakn;

    .line 300
    .line 301
    new-instance v6, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .line 305
    .line 306
    const-string v7, "Invalid unit for fontSize: \'"

    .line 307
    .line 308
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v5

    .line 321
    invoke-direct {v4, v5}, Lcom/google/android/gms/internal/ads/zzakn;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    throw v4

    .line 325
    :cond_7
    throw v7

    .line 326
    :cond_8
    new-instance v4, Lcom/google/android/gms/internal/ads/zzakn;

    .line 327
    .line 328
    new-instance v5, Ljava/lang/StringBuilder;

    .line 329
    .line 330
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 331
    .line 332
    .line 333
    const-string v6, "Invalid expression for fontSize: \'"

    .line 334
    .line 335
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v5

    .line 348
    invoke-direct {v4, v5}, Lcom/google/android/gms/internal/ads/zzakn;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    throw v4

    .line 352
    :cond_9
    new-instance v4, Lcom/google/android/gms/internal/ads/zzakn;

    .line 353
    .line 354
    new-instance v6, Ljava/lang/StringBuilder;

    .line 355
    .line 356
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 357
    .line 358
    .line 359
    const-string v7, "Invalid number of entries for fontSize: "

    .line 360
    .line 361
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v5, "."

    .line 368
    .line 369
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v5

    .line 376
    invoke-direct {v4, v5}, Lcom/google/android/gms/internal/ads/zzakn;-><init>(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    throw v4
    :try_end_5
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_5 .. :try_end_5} :catch_1

    .line 380
    :catch_1
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    const-string v4, "Failed parsing fontSize value: "

    .line 385
    .line 386
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    goto/16 :goto_7

    .line 394
    .line 395
    :sswitch_5
    const-string v5, "textCombine"

    .line 396
    .line 397
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 398
    .line 399
    .line 400
    move-result v4

    .line 401
    if-eqz v4, :cond_e

    .line 402
    .line 403
    invoke-static {v3}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v3

    .line 407
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 408
    .line 409
    .line 410
    move-result v4

    .line 411
    const v5, 0x179a1

    .line 412
    .line 413
    .line 414
    if-eq v4, v5, :cond_b

    .line 415
    .line 416
    const v5, 0x33af38

    .line 417
    .line 418
    .line 419
    if-eq v4, v5, :cond_a

    .line 420
    .line 421
    goto/16 :goto_7

    .line 422
    .line 423
    :cond_a
    const-string v4, "none"

    .line 424
    .line 425
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v3

    .line 429
    if-eqz v3, :cond_e

    .line 430
    .line 431
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    invoke-virtual {p1, v1}, Ll/kqr0;->a(Z)Ll/kqr0;

    .line 436
    .line 437
    .line 438
    goto/16 :goto_7

    .line 439
    .line 440
    :cond_b
    const-string v4, "all"

    .line 441
    .line 442
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    move-result v3

    .line 446
    if-eqz v3, :cond_e

    .line 447
    .line 448
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    invoke-virtual {p1, v10}, Ll/kqr0;->a(Z)Ll/kqr0;

    .line 453
    .line 454
    .line 455
    goto/16 :goto_7

    .line 456
    .line 457
    :sswitch_6
    const-string v5, "shear"

    .line 458
    .line 459
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    move-result v4

    .line 463
    if-eqz v4, :cond_e

    .line 464
    .line 465
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    sget-object v4, Ll/hqr0;->e:Ljava/util/regex/Pattern;

    .line 470
    .line 471
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    .line 476
    .line 477
    .line 478
    move-result v5

    .line 479
    const v6, 0x7f7fffff    # Float.MAX_VALUE

    .line 480
    .line 481
    .line 482
    if-nez v5, :cond_c

    .line 483
    .line 484
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v3

    .line 488
    const-string v4, "Invalid value for shear: "

    .line 489
    .line 490
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    .line 496
    .line 497
    goto :goto_4

    .line 498
    :cond_c
    :try_start_6
    invoke-virtual {v4, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    if-eqz v4, :cond_d

    .line 503
    .line 504
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 505
    .line 506
    .line 507
    move-result v4

    .line 508
    const/high16 v5, -0x3d380000    # -100.0f

    .line 509
    .line 510
    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    .line 511
    .line 512
    .line 513
    move-result v4

    .line 514
    const/high16 v5, 0x42c80000    # 100.0f

    .line 515
    .line 516
    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    .line 517
    .line 518
    .line 519
    move-result v6

    .line 520
    goto :goto_4

    .line 521
    :catch_2
    move-exception v4

    .line 522
    goto :goto_3

    .line 523
    :cond_d
    throw v7
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_2

    .line 524
    :goto_3
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    const-string v5, "Failed to parse shear: "

    .line 529
    .line 530
    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v3

    .line 534
    invoke-static {v9, v3, v4}, Ll/y4w0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 535
    .line 536
    .line 537
    :goto_4
    invoke-virtual {p1, v6}, Ll/kqr0;->I(F)Ll/kqr0;

    .line 538
    .line 539
    .line 540
    goto/16 :goto_7

    .line 541
    .line 542
    :sswitch_7
    const-string v5, "color"

    .line 543
    .line 544
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 545
    .line 546
    .line 547
    move-result v4

    .line 548
    if-eqz v4, :cond_e

    .line 549
    .line 550
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 551
    .line 552
    .line 553
    move-result-object p1

    .line 554
    :try_start_7
    invoke-static {v3}, Ll/aiv0;->b(Ljava/lang/String;)I

    .line 555
    .line 556
    .line 557
    move-result v4

    .line 558
    invoke-virtual {p1, v4}, Ll/kqr0;->y(I)Ll/kqr0;
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_3

    .line 559
    .line 560
    .line 561
    goto/16 :goto_7

    .line 562
    .line 563
    :catch_3
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object v3

    .line 567
    const-string v4, "Failed parsing color value: "

    .line 568
    .line 569
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v3

    .line 573
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    goto/16 :goto_7

    .line 577
    .line 578
    :sswitch_8
    const-string v5, "ruby"

    .line 579
    .line 580
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 581
    .line 582
    .line 583
    move-result v4

    .line 584
    if-eqz v4, :cond_e

    .line 585
    .line 586
    invoke-static {v3}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v3

    .line 590
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 591
    .line 592
    .line 593
    move-result v4

    .line 594
    sparse-switch v4, :sswitch_data_1

    .line 595
    .line 596
    .line 597
    goto/16 :goto_7

    .line 598
    .line 599
    :sswitch_9
    const-string v4, "text"

    .line 600
    .line 601
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 602
    .line 603
    .line 604
    move-result v3

    .line 605
    if-eqz v3, :cond_e

    .line 606
    .line 607
    goto :goto_5

    .line 608
    :sswitch_a
    const-string v4, "base"

    .line 609
    .line 610
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 611
    .line 612
    .line 613
    move-result v3

    .line 614
    if-eqz v3, :cond_e

    .line 615
    .line 616
    goto :goto_6

    .line 617
    :sswitch_b
    const-string v4, "textContainer"

    .line 618
    .line 619
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    move-result v3

    .line 623
    if-eqz v3, :cond_e

    .line 624
    .line 625
    :goto_5
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 626
    .line 627
    .line 628
    move-result-object p1

    .line 629
    invoke-virtual {p1, v6}, Ll/kqr0;->H(I)Ll/kqr0;

    .line 630
    .line 631
    .line 632
    goto/16 :goto_7

    .line 633
    .line 634
    :sswitch_c
    const-string v4, "delimiter"

    .line 635
    .line 636
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    move-result v3

    .line 640
    if-eqz v3, :cond_e

    .line 641
    .line 642
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 643
    .line 644
    .line 645
    move-result-object p1

    .line 646
    const/4 v3, 0x4

    .line 647
    invoke-virtual {p1, v3}, Ll/kqr0;->H(I)Ll/kqr0;

    .line 648
    .line 649
    .line 650
    goto/16 :goto_7

    .line 651
    .line 652
    :sswitch_d
    const-string v4, "container"

    .line 653
    .line 654
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v3

    .line 658
    if-eqz v3, :cond_e

    .line 659
    .line 660
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 661
    .line 662
    .line 663
    move-result-object p1

    .line 664
    invoke-virtual {p1, v10}, Ll/kqr0;->H(I)Ll/kqr0;

    .line 665
    .line 666
    .line 667
    goto/16 :goto_7

    .line 668
    .line 669
    :sswitch_e
    const-string v4, "baseContainer"

    .line 670
    .line 671
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 672
    .line 673
    .line 674
    move-result v3

    .line 675
    if-eqz v3, :cond_e

    .line 676
    .line 677
    :goto_6
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 678
    .line 679
    .line 680
    move-result-object p1

    .line 681
    invoke-virtual {p1, v8}, Ll/kqr0;->H(I)Ll/kqr0;

    .line 682
    .line 683
    .line 684
    goto/16 :goto_7

    .line 685
    .line 686
    :sswitch_f
    const-string v5, "id"

    .line 687
    .line 688
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    move-result v4

    .line 692
    if-eqz v4, :cond_e

    .line 693
    .line 694
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v4

    .line 698
    const-string v5, "style"

    .line 699
    .line 700
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 701
    .line 702
    .line 703
    move-result v4

    .line 704
    if-eqz v4, :cond_e

    .line 705
    .line 706
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 707
    .line 708
    .line 709
    move-result-object p1

    .line 710
    invoke-virtual {p1, v3}, Ll/kqr0;->C(Ljava/lang/String;)Ll/kqr0;

    .line 711
    .line 712
    .line 713
    goto/16 :goto_7

    .line 714
    .line 715
    :sswitch_10
    const-string v5, "fontWeight"

    .line 716
    .line 717
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 718
    .line 719
    .line 720
    move-result v4

    .line 721
    if-eqz v4, :cond_e

    .line 722
    .line 723
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 724
    .line 725
    .line 726
    move-result-object p1

    .line 727
    const-string v4, "bold"

    .line 728
    .line 729
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 730
    .line 731
    .line 732
    move-result v3

    .line 733
    invoke-virtual {p1, v3}, Ll/kqr0;->x(Z)Ll/kqr0;

    .line 734
    .line 735
    .line 736
    goto/16 :goto_7

    .line 737
    .line 738
    :sswitch_11
    const-string v5, "textDecoration"

    .line 739
    .line 740
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 741
    .line 742
    .line 743
    move-result v4

    .line 744
    if-eqz v4, :cond_e

    .line 745
    .line 746
    invoke-static {v3}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v3

    .line 750
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 751
    .line 752
    .line 753
    move-result v4

    .line 754
    sparse-switch v4, :sswitch_data_2

    .line 755
    .line 756
    .line 757
    goto/16 :goto_7

    .line 758
    .line 759
    :sswitch_12
    const-string v4, "linethrough"

    .line 760
    .line 761
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 762
    .line 763
    .line 764
    move-result v3

    .line 765
    if-eqz v3, :cond_e

    .line 766
    .line 767
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 768
    .line 769
    .line 770
    move-result-object p1

    .line 771
    invoke-virtual {p1, v10}, Ll/kqr0;->E(Z)Ll/kqr0;

    .line 772
    .line 773
    .line 774
    goto :goto_7

    .line 775
    :sswitch_13
    const-string v4, "nolinethrough"

    .line 776
    .line 777
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 778
    .line 779
    .line 780
    move-result v3

    .line 781
    if-eqz v3, :cond_e

    .line 782
    .line 783
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 784
    .line 785
    .line 786
    move-result-object p1

    .line 787
    invoke-virtual {p1, v1}, Ll/kqr0;->E(Z)Ll/kqr0;

    .line 788
    .line 789
    .line 790
    goto :goto_7

    .line 791
    :sswitch_14
    const-string v4, "underline"

    .line 792
    .line 793
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 794
    .line 795
    .line 796
    move-result v3

    .line 797
    if-eqz v3, :cond_e

    .line 798
    .line 799
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 800
    .line 801
    .line 802
    move-result-object p1

    .line 803
    invoke-virtual {p1, v10}, Ll/kqr0;->c(Z)Ll/kqr0;

    .line 804
    .line 805
    .line 806
    goto :goto_7

    .line 807
    :sswitch_15
    const-string v4, "nounderline"

    .line 808
    .line 809
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 810
    .line 811
    .line 812
    move-result v3

    .line 813
    if-eqz v3, :cond_e

    .line 814
    .line 815
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 816
    .line 817
    .line 818
    move-result-object p1

    .line 819
    invoke-virtual {p1, v1}, Ll/kqr0;->c(Z)Ll/kqr0;

    .line 820
    .line 821
    .line 822
    goto :goto_7

    .line 823
    :sswitch_16
    const-string v5, "textAlign"

    .line 824
    .line 825
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 826
    .line 827
    .line 828
    move-result v4

    .line 829
    if-eqz v4, :cond_e

    .line 830
    .line 831
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 832
    .line 833
    .line 834
    move-result-object p1

    .line 835
    invoke-static {v3}, Ll/hqr0;->d(Ljava/lang/String;)Landroid/text/Layout$Alignment;

    .line 836
    .line 837
    .line 838
    move-result-object v3

    .line 839
    invoke-virtual {p1, v3}, Ll/kqr0;->J(Landroid/text/Layout$Alignment;)Ll/kqr0;

    .line 840
    .line 841
    .line 842
    goto :goto_7

    .line 843
    :sswitch_17
    const-string v5, "fontFamily"

    .line 844
    .line 845
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 846
    .line 847
    .line 848
    move-result v4

    .line 849
    if-eqz v4, :cond_e

    .line 850
    .line 851
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 852
    .line 853
    .line 854
    move-result-object p1

    .line 855
    invoke-virtual {p1, v3}, Ll/kqr0;->z(Ljava/lang/String;)Ll/kqr0;

    .line 856
    .line 857
    .line 858
    goto :goto_7

    .line 859
    :sswitch_18
    const-string v5, "fontStyle"

    .line 860
    .line 861
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 862
    .line 863
    .line 864
    move-result v4

    .line 865
    if-eqz v4, :cond_e

    .line 866
    .line 867
    invoke-static {p1}, Ll/hqr0;->e(Ll/kqr0;)Ll/kqr0;

    .line 868
    .line 869
    .line 870
    move-result-object p1

    .line 871
    const-string v4, "italic"

    .line 872
    .line 873
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 874
    .line 875
    .line 876
    move-result v3

    .line 877
    invoke-virtual {p1, v3}, Ll/kqr0;->D(Z)Ll/kqr0;

    .line 878
    .line 879
    .line 880
    :cond_e
    :goto_7
    add-int/lit8 v2, v2, 0x1

    .line 881
    .line 882
    goto/16 :goto_0

    .line 883
    .line 884
    :cond_f
    return-object p1

    :sswitch_data_0
    .sparse-switch
        -0x5c71855e -> :sswitch_18
        -0x48ff636d -> :sswitch_17
        -0x3f826a28 -> :sswitch_16
        -0x3468fa43 -> :sswitch_11
        -0x2bc67c59 -> :sswitch_10
        0xd1b -> :sswitch_f
        0x3595da -> :sswitch_8
        0x5a72f63 -> :sswitch_7
        0x6855ce1 -> :sswitch_6
        0x6909352 -> :sswitch_5
        0x15caa0f0 -> :sswitch_4
        0x36e741c9 -> :sswitch_3
        0x42841923 -> :sswitch_2
        0x4cb7f6d5 -> :sswitch_1
        0x6899f5a4 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x24de7f50 -> :sswitch_e
        -0x187eb37f -> :sswitch_d
        -0xeee99f9 -> :sswitch_c
        -0x81c562c -> :sswitch_b
        0x2e06d1 -> :sswitch_a
        0x36452d -> :sswitch_9
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        -0x57195dd5 -> :sswitch_15
        -0x3d363934 -> :sswitch_14
        0x36723ff0 -> :sswitch_13
        0x641ec051 -> :sswitch_12
    .end sparse-switch
.end method

.method public static g(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    new-array p0, p0, [Ljava/lang/String;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    sget v0, Ll/mpw0;->a:I

    .line 16
    .line 17
    const-string v0, "\\s+"

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hqr0;->b([BII)Ll/tor0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p4, p5}, Ll/sor0;->a(Ll/tor0;Ll/wor0;Ll/hkv0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b([BII)Ll/tor0;
    .locals 40

    .line 1
    const-string v1, ""

    .line 2
    .line 3
    const-string v2, "http://www.w3.org/ns/ttml#parameter"

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    move-object/from16 v0, p0

    .line 7
    .line 8
    :try_start_0
    iget-object v0, v0, Ll/hqr0;->a:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_10
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    :try_start_1
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    new-instance v5, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v6, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v7, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v8, Ll/iqr0;

    .line 30
    .line 31
    const-string v9, ""

    .line 32
    .line 33
    const v10, -0x800001

    .line 34
    .line 35
    .line 36
    const/high16 v12, -0x80000000

    .line 37
    .line 38
    move v11, v10

    .line 39
    move v13, v12

    .line 40
    move v14, v10

    .line 41
    move v15, v10

    .line 42
    move/from16 v16, v12

    .line 43
    .line 44
    move/from16 v17, v10

    .line 45
    .line 46
    move/from16 v18, v12

    .line 47
    .line 48
    invoke-direct/range {v8 .. v18}, Ll/iqr0;-><init>(Ljava/lang/String;FFIIFFIFI)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v6, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 55
    .line 56
    move-object/from16 v8, p1

    .line 57
    .line 58
    move/from16 v9, p2

    .line 59
    .line 60
    move/from16 v10, p3

    .line 61
    .line 62
    invoke-direct {v0, v8, v9, v10}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v4, v0, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    new-instance v8, Ljava/util/ArrayDeque;

    .line 69
    .line 70
    invoke-direct {v8}, Ljava/util/ArrayDeque;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    sget-object v9, Ll/hqr0;->i:Ll/fqr0;

    .line 78
    .line 79
    move-object v12, v3

    .line 80
    move-object v14, v12

    .line 81
    const/4 v13, 0x0

    .line 82
    const/16 v15, 0xf

    .line 83
    .line 84
    :goto_0
    const/4 v10, 0x1

    .line 85
    if-eq v0, v10, :cond_4a

    .line 86
    .line 87
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v16

    .line 91
    const/16 p1, 0x0

    .line 92
    .line 93
    move-object/from16 v11, v16

    .line 94
    .line 95
    check-cast v11, Ll/eqr0;

    .line 96
    .line 97
    move-object/from16 v16, v3

    .line 98
    .line 99
    const/4 v3, 0x2

    .line 100
    if-nez v13, :cond_47

    .line 101
    .line 102
    move/from16 p3, v10

    .line 103
    .line 104
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v10
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 108
    move-object/from16 v17, v1

    .line 109
    .line 110
    const-string v1, "tt"

    .line 111
    .line 112
    if-ne v0, v3, :cond_41

    .line 113
    .line 114
    :try_start_2
    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v0
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 118
    const-string v3, "extent"

    .line 119
    .line 120
    const/high16 v19, 0x3f800000    # 1.0f

    .line 121
    .line 122
    move-object/from16 v20, v9

    .line 123
    .line 124
    const-string v9, "TtmlParser"

    .line 125
    .line 126
    if-eqz v0, :cond_f

    .line 127
    .line 128
    :try_start_3
    const-string v0, "frameRate"

    .line 129
    .line 130
    invoke-interface {v4, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eqz v0, :cond_0

    .line 135
    .line 136
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    goto :goto_1

    .line 141
    :catch_0
    move-exception v0

    .line 142
    goto/16 :goto_2f

    .line 143
    .line 144
    :catch_1
    move-exception v0

    .line 145
    goto/16 :goto_30

    .line 146
    .line 147
    :cond_0
    const/16 v0, 0x1e

    .line 148
    .line 149
    :goto_1
    const-string v14, "frameRateMultiplier"

    .line 150
    .line 151
    invoke-interface {v4, v2, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v14
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 155
    const-string v15, " "

    .line 156
    .line 157
    if-eqz v14, :cond_2

    .line 158
    .line 159
    :try_start_4
    sget v20, Ll/mpw0;->a:I

    .line 160
    .line 161
    move-object/from16 v21, v12

    .line 162
    .line 163
    const/4 v12, -0x1

    .line 164
    invoke-virtual {v14, v15, v12}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v12

    .line 168
    array-length v14, v12

    .line 169
    move-object/from16 p2, v12

    .line 170
    .line 171
    const/4 v12, 0x2

    .line 172
    if-ne v14, v12, :cond_1

    .line 173
    .line 174
    move/from16 v12, p3

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_1
    move/from16 v12, p1

    .line 178
    .line 179
    :goto_2
    const-string v14, "frameRateMultiplier doesn\'t have 2 parts"

    .line 180
    .line 181
    invoke-static {v12, v14}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    aget-object v12, p2, p1

    .line 185
    .line 186
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v12

    .line 190
    int-to-float v12, v12

    .line 191
    aget-object v14, p2, p3

    .line 192
    .line 193
    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result v14

    .line 197
    int-to-float v14, v14

    .line 198
    div-float/2addr v12, v14

    .line 199
    goto :goto_3

    .line 200
    :cond_2
    move-object/from16 v21, v12

    .line 201
    .line 202
    move/from16 v12, v19

    .line 203
    .line 204
    :goto_3
    sget-object v14, Ll/hqr0;->i:Ll/fqr0;

    .line 205
    .line 206
    move/from16 p2, v12

    .line 207
    .line 208
    iget v12, v14, Ll/fqr0;->b:I

    .line 209
    .line 210
    move/from16 v20, v12

    .line 211
    .line 212
    const-string v12, "subFrameRate"

    .line 213
    .line 214
    invoke-interface {v4, v2, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v12

    .line 218
    if-eqz v12, :cond_3

    .line 219
    .line 220
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v12

    .line 224
    goto :goto_4

    .line 225
    :cond_3
    move/from16 v12, v20

    .line 226
    .line 227
    :goto_4
    iget v14, v14, Ll/fqr0;->c:I

    .line 228
    .line 229
    move/from16 v22, v13

    .line 230
    .line 231
    const-string v13, "tickRate"

    .line 232
    .line 233
    invoke-interface {v4, v2, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v13

    .line 237
    if-eqz v13, :cond_4

    .line 238
    .line 239
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v14

    .line 243
    :cond_4
    new-instance v13, Ll/fqr0;

    .line 244
    .line 245
    int-to-float v0, v0

    .line 246
    mul-float v0, v0, p2

    .line 247
    .line 248
    invoke-direct {v13, v0, v12, v14}, Ll/fqr0;-><init>(FII)V

    .line 249
    .line 250
    .line 251
    const-string v0, "cellResolution"

    .line 252
    .line 253
    invoke-interface {v4, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    if-nez v0, :cond_5

    .line 258
    .line 259
    move-object/from16 v23, v2

    .line 260
    .line 261
    :goto_5
    move-object/from16 v24, v8

    .line 262
    .line 263
    move-object/from16 v25, v11

    .line 264
    .line 265
    move-object/from16 p2, v13

    .line 266
    .line 267
    :goto_6
    const/16 v15, 0xf

    .line 268
    .line 269
    goto/16 :goto_a

    .line 270
    .line 271
    :cond_5
    sget-object v12, Ll/hqr0;->h:Ljava/util/regex/Pattern;

    .line 272
    .line 273
    invoke-virtual {v12, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 274
    .line 275
    .line 276
    move-result-object v12

    .line 277
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->matches()Z

    .line 278
    .line 279
    .line 280
    move-result v14
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 281
    move-object/from16 v23, v2

    .line 282
    .line 283
    const-string v2, "Ignoring malformed cell resolution: "

    .line 284
    .line 285
    if-nez v14, :cond_6

    .line 286
    .line 287
    :try_start_5
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 292
    .line 293
    .line 294
    goto :goto_5

    .line 295
    :cond_6
    move/from16 v14, p3

    .line 296
    .line 297
    :try_start_6
    invoke-virtual {v12, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v20

    .line 301
    if-eqz v20, :cond_a

    .line 302
    .line 303
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result v14
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 307
    move-object/from16 p2, v13

    .line 308
    .line 309
    const/4 v13, 0x2

    .line 310
    :try_start_7
    invoke-virtual {v12, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v12

    .line 314
    if-eqz v12, :cond_9

    .line 315
    .line 316
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 317
    .line 318
    .line 319
    move-result v12
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 320
    if-eqz v14, :cond_8

    .line 321
    .line 322
    if-eqz v12, :cond_7

    .line 323
    .line 324
    move-object/from16 v24, v8

    .line 325
    .line 326
    move v13, v12

    .line 327
    const/4 v12, 0x1

    .line 328
    goto :goto_7

    .line 329
    :cond_7
    move/from16 v12, p1

    .line 330
    .line 331
    move v13, v12

    .line 332
    move-object/from16 v24, v8

    .line 333
    .line 334
    goto :goto_7

    .line 335
    :cond_8
    move-object/from16 v24, v8

    .line 336
    .line 337
    move v13, v12

    .line 338
    move/from16 v12, p1

    .line 339
    .line 340
    :goto_7
    :try_start_8
    new-instance v8, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 343
    .line 344
    .line 345
    move-object/from16 v25, v11

    .line 346
    .line 347
    :try_start_9
    const-string v11, "Invalid cell resolution "

    .line 348
    .line 349
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v8

    .line 365
    invoke-static {v12, v8}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 366
    .line 367
    .line 368
    move v15, v13

    .line 369
    goto :goto_a

    .line 370
    :catch_2
    :goto_8
    move-object/from16 v25, v11

    .line 371
    .line 372
    goto :goto_9

    .line 373
    :catch_3
    move-object/from16 v24, v8

    .line 374
    .line 375
    goto :goto_8

    .line 376
    :cond_9
    move-object/from16 v24, v8

    .line 377
    .line 378
    move-object/from16 v25, v11

    .line 379
    .line 380
    throw v16

    .line 381
    :catch_4
    move-object/from16 v24, v8

    .line 382
    .line 383
    move-object/from16 v25, v11

    .line 384
    .line 385
    move-object/from16 p2, v13

    .line 386
    .line 387
    goto :goto_9

    .line 388
    :cond_a
    move-object/from16 v24, v8

    .line 389
    .line 390
    move-object/from16 v25, v11

    .line 391
    .line 392
    move-object/from16 p2, v13

    .line 393
    .line 394
    throw v16
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .line 395
    :catch_5
    :goto_9
    :try_start_a
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    goto/16 :goto_6

    .line 403
    .line 404
    :goto_a
    invoke-static {v4, v3}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    if-nez v0, :cond_b

    .line 409
    .line 410
    :goto_b
    move-object/from16 v14, v16

    .line 411
    .line 412
    goto :goto_c

    .line 413
    :cond_b
    sget-object v2, Ll/hqr0;->g:Ljava/util/regex/Pattern;

    .line 414
    .line 415
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    .line 420
    .line 421
    .line 422
    move-result v8

    .line 423
    if-nez v8, :cond_c

    .line 424
    .line 425
    const-string v2, "Ignoring non-pixel tts extent: "

    .line 426
    .line 427
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    .line 432
    .line 433
    .line 434
    goto :goto_b

    .line 435
    :cond_c
    const/4 v14, 0x1

    .line 436
    :try_start_b
    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v8

    .line 440
    if-eqz v8, :cond_e

    .line 441
    .line 442
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 443
    .line 444
    .line 445
    move-result v8

    .line 446
    const/4 v12, 0x2

    .line 447
    invoke-virtual {v2, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    if-eqz v2, :cond_d

    .line 452
    .line 453
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 454
    .line 455
    .line 456
    move-result v2

    .line 457
    new-instance v11, Ll/gqr0;

    .line 458
    .line 459
    invoke-direct {v11, v8, v2}, Ll/gqr0;-><init>(II)V

    .line 460
    .line 461
    .line 462
    move-object v14, v11

    .line 463
    goto :goto_c

    .line 464
    :cond_d
    throw v16

    .line 465
    :cond_e
    throw v16
    :try_end_b
    .catch Ljava/lang/NumberFormatException; {:try_start_b .. :try_end_b} :catch_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0

    .line 466
    :catch_6
    :try_start_c
    const-string v2, "Ignoring malformed tts extent: "

    .line 467
    .line 468
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_c .. :try_end_c} :catch_1
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_0

    .line 473
    .line 474
    .line 475
    goto :goto_b

    .line 476
    :goto_c
    move-object/from16 v2, p2

    .line 477
    .line 478
    goto :goto_d

    .line 479
    :cond_f
    move-object/from16 v23, v2

    .line 480
    .line 481
    move-object/from16 v24, v8

    .line 482
    .line 483
    move-object/from16 v25, v11

    .line 484
    .line 485
    move-object/from16 v21, v12

    .line 486
    .line 487
    move/from16 v22, v13

    .line 488
    .line 489
    move-object/from16 v2, v20

    .line 490
    .line 491
    :goto_d
    :try_start_d
    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result v0
    :try_end_d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d .. :try_end_d} :catch_b
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_0

    .line 495
    const-string v1, "image"

    .line 496
    .line 497
    const-string v8, "metadata"

    .line 498
    .line 499
    const-string v11, "region"

    .line 500
    .line 501
    const-string v12, "head"

    .line 502
    .line 503
    const-string v13, "style"

    .line 504
    .line 505
    if-nez v0, :cond_11

    .line 506
    .line 507
    :try_start_e
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v0

    .line 511
    if-nez v0, :cond_11

    .line 512
    .line 513
    const-string v0, "body"

    .line 514
    .line 515
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 516
    .line 517
    .line 518
    move-result v0

    .line 519
    if-nez v0, :cond_11

    .line 520
    .line 521
    const-string v0, "div"

    .line 522
    .line 523
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    move-result v0

    .line 527
    if-nez v0, :cond_11

    .line 528
    .line 529
    const-string v0, "p"

    .line 530
    .line 531
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result v0

    .line 535
    if-nez v0, :cond_11

    .line 536
    .line 537
    const-string v0, "span"

    .line 538
    .line 539
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    if-nez v0, :cond_11

    .line 544
    .line 545
    const-string v0, "br"

    .line 546
    .line 547
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    if-nez v0, :cond_11

    .line 552
    .line 553
    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 554
    .line 555
    .line 556
    move-result v0

    .line 557
    if-nez v0, :cond_11

    .line 558
    .line 559
    const-string v0, "styling"

    .line 560
    .line 561
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    if-nez v0, :cond_11

    .line 566
    .line 567
    const-string v0, "layout"

    .line 568
    .line 569
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result v0

    .line 573
    if-nez v0, :cond_11

    .line 574
    .line 575
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    move-result v0

    .line 579
    if-nez v0, :cond_11

    .line 580
    .line 581
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 582
    .line 583
    .line 584
    move-result v0

    .line 585
    if-nez v0, :cond_11

    .line 586
    .line 587
    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 588
    .line 589
    .line 590
    move-result v0

    .line 591
    if-nez v0, :cond_11

    .line 592
    .line 593
    const-string v0, "data"

    .line 594
    .line 595
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 596
    .line 597
    .line 598
    move-result v0

    .line 599
    if-nez v0, :cond_11

    .line 600
    .line 601
    const-string v0, "information"

    .line 602
    .line 603
    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    if-eqz v0, :cond_10

    .line 608
    .line 609
    goto :goto_f

    .line 610
    :cond_10
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v0

    .line 614
    new-instance v1, Ljava/lang/StringBuilder;

    .line 615
    .line 616
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 617
    .line 618
    .line 619
    const-string v3, "Ignoring unsupported tag: "

    .line 620
    .line 621
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    .line 626
    .line 627
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    invoke-static {v9, v0}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e .. :try_end_e} :catch_1
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0

    .line 632
    .line 633
    .line 634
    move-object v9, v2

    .line 635
    move-object v1, v5

    .line 636
    move-object v2, v7

    .line 637
    move-object/from16 v12, v21

    .line 638
    .line 639
    move-object/from16 v3, v24

    .line 640
    .line 641
    :goto_e
    const/4 v13, 0x1

    .line 642
    goto/16 :goto_2e

    .line 643
    .line 644
    :cond_11
    :goto_f
    :try_start_f
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 645
    .line 646
    .line 647
    move-result v0
    :try_end_f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f .. :try_end_f} :catch_b
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_0

    .line 648
    if-eqz v0, :cond_33

    .line 649
    .line 650
    :goto_10
    :try_start_10
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 651
    .line 652
    .line 653
    invoke-static {v4, v13}, Ll/aqw0;->c(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    if-eqz v0, :cond_15

    .line 658
    .line 659
    invoke-static {v4, v13}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 660
    .line 661
    .line 662
    move-result-object v0

    .line 663
    new-instance v10, Ll/kqr0;

    .line 664
    .line 665
    invoke-direct {v10}, Ll/kqr0;-><init>()V

    .line 666
    .line 667
    .line 668
    invoke-static {v4, v10}, Ll/hqr0;->f(Lorg/xmlpull/v1/XmlPullParser;Ll/kqr0;)Ll/kqr0;

    .line 669
    .line 670
    .line 671
    move-result-object v10

    .line 672
    if-eqz v0, :cond_12

    .line 673
    .line 674
    invoke-static {v0}, Ll/hqr0;->g(Ljava/lang/String;)[Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    move-object/from16 v20, v2

    .line 679
    .line 680
    array-length v2, v0

    .line 681
    move-object/from16 p2, v13

    .line 682
    .line 683
    move/from16 v13, p1

    .line 684
    .line 685
    :goto_11
    if-ge v13, v2, :cond_13

    .line 686
    .line 687
    move/from16 v25, v2

    .line 688
    .line 689
    aget-object v2, v0, v13

    .line 690
    .line 691
    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    .line 693
    .line 694
    move-result-object v2

    .line 695
    check-cast v2, Ll/kqr0;

    .line 696
    .line 697
    invoke-virtual {v10, v2}, Ll/kqr0;->v(Ll/kqr0;)Ll/kqr0;

    .line 698
    .line 699
    .line 700
    add-int/lit8 v13, v13, 0x1

    .line 701
    .line 702
    move/from16 v2, v25

    .line 703
    .line 704
    goto :goto_11

    .line 705
    :cond_12
    move-object/from16 v20, v2

    .line 706
    .line 707
    move-object/from16 p2, v13

    .line 708
    .line 709
    :cond_13
    invoke-virtual {v10}, Ll/kqr0;->e()Ljava/lang/String;

    .line 710
    .line 711
    .line 712
    move-result-object v0

    .line 713
    if-eqz v0, :cond_14

    .line 714
    .line 715
    invoke-interface {v5, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    .line 717
    .line 718
    :cond_14
    :goto_12
    move-object/from16 v36, v1

    .line 719
    .line 720
    move-object/from16 v38, v5

    .line 721
    .line 722
    move-object/from16 v39, v7

    .line 723
    .line 724
    move-object/from16 v37, v8

    .line 725
    .line 726
    goto/16 :goto_1d

    .line 727
    .line 728
    :cond_15
    move-object/from16 v20, v2

    .line 729
    .line 730
    move-object/from16 p2, v13

    .line 731
    .line 732
    invoke-static {v4, v11}, Ll/aqw0;->c(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 733
    .line 734
    .line 735
    move-result v0
    :try_end_10
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_0

    .line 736
    const-string v2, "id"

    .line 737
    .line 738
    if-nez v0, :cond_18

    .line 739
    .line 740
    :try_start_11
    invoke-static {v4, v8}, Ll/aqw0;->c(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 741
    .line 742
    .line 743
    move-result v0

    .line 744
    if-eqz v0, :cond_14

    .line 745
    .line 746
    :cond_16
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 747
    .line 748
    .line 749
    invoke-static {v4, v1}, Ll/aqw0;->c(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 750
    .line 751
    .line 752
    move-result v0

    .line 753
    if-eqz v0, :cond_17

    .line 754
    .line 755
    invoke-static {v4, v2}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    if-eqz v0, :cond_17

    .line 760
    .line 761
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 762
    .line 763
    .line 764
    move-result-object v10

    .line 765
    invoke-interface {v7, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 766
    .line 767
    .line 768
    :cond_17
    invoke-static {v4, v8}, Ll/aqw0;->b(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 769
    .line 770
    .line 771
    move-result v0

    .line 772
    if-eqz v0, :cond_16

    .line 773
    .line 774
    goto :goto_12

    .line 775
    :cond_18
    invoke-static {v4, v2}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 776
    .line 777
    .line 778
    move-result-object v26

    .line 779
    if-nez v26, :cond_19

    .line 780
    .line 781
    move-object/from16 v36, v1

    .line 782
    .line 783
    move-object/from16 v38, v5

    .line 784
    .line 785
    move-object/from16 v39, v7

    .line 786
    .line 787
    move-object/from16 v37, v8

    .line 788
    .line 789
    :goto_13
    move-object/from16 v0, v16

    .line 790
    .line 791
    goto/16 :goto_1c

    .line 792
    .line 793
    :cond_19
    const-string v0, "origin"

    .line 794
    .line 795
    invoke-static {v4, v0}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v0

    .line 799
    if-eqz v0, :cond_30

    .line 800
    .line 801
    sget-object v2, Ll/hqr0;->f:Ljava/util/regex/Pattern;

    .line 802
    .line 803
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 804
    .line 805
    .line 806
    move-result-object v10

    .line 807
    sget-object v13, Ll/hqr0;->g:Ljava/util/regex/Pattern;

    .line 808
    .line 809
    move-object/from16 v36, v1

    .line 810
    .line 811
    invoke-virtual {v13, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 812
    .line 813
    .line 814
    move-result-object v1

    .line 815
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    .line 816
    .line 817
    .line 818
    move-result v25
    :try_end_11
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_11 .. :try_end_11} :catch_1
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_0

    .line 819
    move-object/from16 v37, v8

    .line 820
    .line 821
    const-string v8, "Ignoring region with missing tts:extent: "

    .line 822
    .line 823
    move-object/from16 v38, v5

    .line 824
    .line 825
    const-string v5, "Ignoring region with malformed origin: "

    .line 826
    .line 827
    const/high16 v27, 0x42c80000    # 100.0f

    .line 828
    .line 829
    if-eqz v25, :cond_1c

    .line 830
    .line 831
    move-object/from16 v39, v7

    .line 832
    .line 833
    const/4 v7, 0x1

    .line 834
    :try_start_12
    invoke-virtual {v10, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 835
    .line 836
    .line 837
    move-result-object v1

    .line 838
    if-eqz v1, :cond_1b

    .line 839
    .line 840
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 841
    .line 842
    .line 843
    move-result v1

    .line 844
    div-float v1, v1, v27

    .line 845
    .line 846
    const/4 v7, 0x2

    .line 847
    invoke-virtual {v10, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v10

    .line 851
    if-eqz v10, :cond_1a

    .line 852
    .line 853
    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 854
    .line 855
    .line 856
    move-result v5

    .line 857
    div-float v5, v5, v27

    .line 858
    .line 859
    goto :goto_14

    .line 860
    :cond_1a
    throw v16

    .line 861
    :cond_1b
    throw v16
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_12} :catch_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_0

    .line 862
    :catch_7
    :try_start_13
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 863
    .line 864
    .line 865
    move-result-object v0

    .line 866
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 867
    .line 868
    .line 869
    goto :goto_13

    .line 870
    :cond_1c
    move-object/from16 v39, v7

    .line 871
    .line 872
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 873
    .line 874
    .line 875
    move-result v7

    .line 876
    if-eqz v7, :cond_2f

    .line 877
    .line 878
    if-nez v14, :cond_1d

    .line 879
    .line 880
    invoke-virtual {v8, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 881
    .line 882
    .line 883
    move-result-object v0

    .line 884
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_13 .. :try_end_13} :catch_1
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_0

    .line 885
    .line 886
    .line 887
    goto :goto_13

    .line 888
    :cond_1d
    const/4 v7, 0x1

    .line 889
    :try_start_14
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 890
    .line 891
    .line 892
    move-result-object v10

    .line 893
    if-eqz v10, :cond_2e

    .line 894
    .line 895
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 896
    .line 897
    .line 898
    move-result v7

    .line 899
    const/4 v10, 0x2

    .line 900
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 901
    .line 902
    .line 903
    move-result-object v1

    .line 904
    if-eqz v1, :cond_2d

    .line 905
    .line 906
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 907
    .line 908
    .line 909
    move-result v1

    .line 910
    int-to-float v7, v7

    .line 911
    iget v10, v14, Ll/gqr0;->a:I

    .line 912
    .line 913
    int-to-float v10, v10

    .line 914
    div-float/2addr v7, v10

    .line 915
    int-to-float v1, v1

    .line 916
    iget v5, v14, Ll/gqr0;->b:I
    :try_end_14
    .catch Ljava/lang/NumberFormatException; {:try_start_14 .. :try_end_14} :catch_a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_14 .. :try_end_14} :catch_1
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_0

    .line 917
    .line 918
    int-to-float v5, v5

    .line 919
    div-float v5, v1, v5

    .line 920
    .line 921
    move v1, v7

    .line 922
    :goto_14
    :try_start_15
    invoke-static {v4, v3}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 923
    .line 924
    .line 925
    move-result-object v7

    .line 926
    if-eqz v7, :cond_2c

    .line 927
    .line 928
    invoke-virtual {v2, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 929
    .line 930
    .line 931
    move-result-object v2

    .line 932
    invoke-virtual {v13, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 933
    .line 934
    .line 935
    move-result-object v7

    .line 936
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    .line 937
    .line 938
    .line 939
    move-result v10
    :try_end_15
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_15 .. :try_end_15} :catch_1
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_0

    .line 940
    const-string v13, "Ignoring region with malformed extent: "

    .line 941
    .line 942
    if-eqz v10, :cond_20

    .line 943
    .line 944
    const/4 v10, 0x1

    .line 945
    :try_start_16
    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 946
    .line 947
    .line 948
    move-result-object v7

    .line 949
    if-eqz v7, :cond_1f

    .line 950
    .line 951
    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 952
    .line 953
    .line 954
    move-result v7

    .line 955
    div-float v7, v7, v27

    .line 956
    .line 957
    const/4 v10, 0x2

    .line 958
    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 959
    .line 960
    .line 961
    move-result-object v2

    .line 962
    if-eqz v2, :cond_1e

    .line 963
    .line 964
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 965
    .line 966
    .line 967
    move-result v0

    .line 968
    div-float v0, v0, v27

    .line 969
    .line 970
    move/from16 v31, v7

    .line 971
    .line 972
    :goto_15
    move/from16 v32, v0

    .line 973
    .line 974
    goto :goto_16

    .line 975
    :cond_1e
    throw v16

    .line 976
    :cond_1f
    throw v16
    :try_end_16
    .catch Ljava/lang/NumberFormatException; {:try_start_16 .. :try_end_16} :catch_8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_16 .. :try_end_16} :catch_1
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_0

    .line 977
    :catch_8
    :try_start_17
    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 978
    .line 979
    .line 980
    move-result-object v0

    .line 981
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    .line 983
    .line 984
    goto/16 :goto_13

    .line 985
    .line 986
    :cond_20
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    .line 987
    .line 988
    .line 989
    move-result v2

    .line 990
    if-eqz v2, :cond_2b

    .line 991
    .line 992
    if-nez v14, :cond_21

    .line 993
    .line 994
    invoke-virtual {v8, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 995
    .line 996
    .line 997
    move-result-object v0

    .line 998
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_17
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_17 .. :try_end_17} :catch_1
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_0

    .line 999
    .line 1000
    .line 1001
    goto/16 :goto_13

    .line 1002
    .line 1003
    :cond_21
    const/4 v10, 0x1

    .line 1004
    :try_start_18
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v2

    .line 1008
    if-eqz v2, :cond_2a

    .line 1009
    .line 1010
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1011
    .line 1012
    .line 1013
    move-result v2

    .line 1014
    const/4 v10, 0x2

    .line 1015
    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v7

    .line 1019
    if-eqz v7, :cond_29

    .line 1020
    .line 1021
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1022
    .line 1023
    .line 1024
    move-result v7

    .line 1025
    int-to-float v2, v2

    .line 1026
    iget v8, v14, Ll/gqr0;->a:I

    .line 1027
    .line 1028
    int-to-float v8, v8

    .line 1029
    div-float/2addr v2, v8

    .line 1030
    int-to-float v7, v7

    .line 1031
    iget v0, v14, Ll/gqr0;->b:I
    :try_end_18
    .catch Ljava/lang/NumberFormatException; {:try_start_18 .. :try_end_18} :catch_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_18 .. :try_end_18} :catch_1
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_0

    .line 1032
    .line 1033
    int-to-float v0, v0

    .line 1034
    div-float v0, v7, v0

    .line 1035
    .line 1036
    move/from16 v31, v2

    .line 1037
    .line 1038
    goto :goto_15

    .line 1039
    :goto_16
    :try_start_19
    const-string v0, "displayAlign"

    .line 1040
    .line 1041
    invoke-static {v4, v0}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 1042
    .line 1043
    .line 1044
    move-result-object v0

    .line 1045
    if-eqz v0, :cond_24

    .line 1046
    .line 1047
    invoke-static {v0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v0

    .line 1051
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 1052
    .line 1053
    .line 1054
    move-result v2
    :try_end_19
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_19 .. :try_end_19} :catch_1
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_0

    .line 1055
    const v7, -0x514d33ab

    .line 1056
    .line 1057
    .line 1058
    if-eq v2, v7, :cond_23

    .line 1059
    .line 1060
    const v7, 0x58705dc

    .line 1061
    .line 1062
    .line 1063
    if-eq v2, v7, :cond_22

    .line 1064
    .line 1065
    goto :goto_17

    .line 1066
    :cond_22
    const-string v2, "after"

    .line 1067
    .line 1068
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1069
    .line 1070
    .line 1071
    move-result v0

    .line 1072
    if-eqz v0, :cond_24

    .line 1073
    .line 1074
    add-float v5, v5, v32

    .line 1075
    .line 1076
    move/from16 v28, v5

    .line 1077
    .line 1078
    const/16 v30, 0x2

    .line 1079
    .line 1080
    goto :goto_18

    .line 1081
    :cond_23
    const-string v2, "center"

    .line 1082
    .line 1083
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1084
    .line 1085
    .line 1086
    move-result v0

    .line 1087
    if-eqz v0, :cond_24

    .line 1088
    .line 1089
    const/high16 v0, 0x40000000    # 2.0f

    .line 1090
    .line 1091
    div-float v0, v32, v0

    .line 1092
    .line 1093
    add-float/2addr v5, v0

    .line 1094
    move/from16 v28, v5

    .line 1095
    .line 1096
    const/16 v30, 0x1

    .line 1097
    .line 1098
    goto :goto_18

    .line 1099
    :cond_24
    :goto_17
    move/from16 v30, p1

    .line 1100
    .line 1101
    move/from16 v28, v5

    .line 1102
    .line 1103
    :goto_18
    int-to-float v0, v15

    .line 1104
    div-float v34, v19, v0

    .line 1105
    .line 1106
    :try_start_1a
    const-string v0, "writingMode"

    .line 1107
    .line 1108
    invoke-static {v4, v0}, Ll/aqw0;->a(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 1109
    .line 1110
    .line 1111
    move-result-object v0

    .line 1112
    const/high16 v2, -0x80000000

    .line 1113
    .line 1114
    if-eqz v0, :cond_28

    .line 1115
    .line 1116
    invoke-static {v0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 1117
    .line 1118
    .line 1119
    move-result-object v0

    .line 1120
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 1121
    .line 1122
    .line 1123
    move-result v5
    :try_end_1a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1a .. :try_end_1a} :catch_1
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_0

    .line 1124
    const/16 v7, 0xe6e

    .line 1125
    .line 1126
    if-eq v5, v7, :cond_27

    .line 1127
    .line 1128
    const v7, 0x363874

    .line 1129
    .line 1130
    .line 1131
    if-eq v5, v7, :cond_26

    .line 1132
    .line 1133
    const v7, 0x363928

    .line 1134
    .line 1135
    .line 1136
    if-eq v5, v7, :cond_25

    .line 1137
    .line 1138
    goto :goto_1a

    .line 1139
    :cond_25
    const-string v5, "tbrl"

    .line 1140
    .line 1141
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1142
    .line 1143
    .line 1144
    move-result v0

    .line 1145
    if-eqz v0, :cond_28

    .line 1146
    .line 1147
    const/16 v35, 0x1

    .line 1148
    .line 1149
    goto :goto_1b

    .line 1150
    :cond_26
    const-string v5, "tblr"

    .line 1151
    .line 1152
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1153
    .line 1154
    .line 1155
    move-result v0

    .line 1156
    if-eqz v0, :cond_28

    .line 1157
    .line 1158
    goto :goto_19

    .line 1159
    :cond_27
    const-string v5, "tb"

    .line 1160
    .line 1161
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1162
    .line 1163
    .line 1164
    move-result v0

    .line 1165
    if-eqz v0, :cond_28

    .line 1166
    .line 1167
    :goto_19
    const/16 v35, 0x2

    .line 1168
    .line 1169
    goto :goto_1b

    .line 1170
    :cond_28
    :goto_1a
    move/from16 v35, v2

    .line 1171
    .line 1172
    :goto_1b
    :try_start_1b
    new-instance v25, Ll/iqr0;

    .line 1173
    .line 1174
    const/16 v29, 0x0

    .line 1175
    .line 1176
    const/16 v33, 0x1

    .line 1177
    .line 1178
    move/from16 v27, v1

    .line 1179
    .line 1180
    invoke-direct/range {v25 .. v35}, Ll/iqr0;-><init>(Ljava/lang/String;FFIIFFIFI)V
    :try_end_1b
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1b .. :try_end_1b} :catch_1
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1b} :catch_0

    .line 1181
    .line 1182
    .line 1183
    move-object/from16 v0, v25

    .line 1184
    .line 1185
    goto :goto_1c

    .line 1186
    :cond_29
    :try_start_1c
    throw v16

    .line 1187
    :cond_2a
    throw v16
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_1c .. :try_end_1c} :catch_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1c .. :try_end_1c} :catch_1
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_0

    .line 1188
    :catch_9
    :try_start_1d
    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v0

    .line 1192
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1193
    .line 1194
    .line 1195
    goto/16 :goto_13

    .line 1196
    .line 1197
    :cond_2b
    const-string v1, "Ignoring region with unsupported extent: "

    .line 1198
    .line 1199
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1200
    .line 1201
    .line 1202
    move-result-object v0

    .line 1203
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1204
    .line 1205
    .line 1206
    goto/16 :goto_13

    .line 1207
    .line 1208
    :cond_2c
    const-string v0, "Ignoring region without an extent"

    .line 1209
    .line 1210
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1d .. :try_end_1d} :catch_1
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_0

    .line 1211
    .line 1212
    .line 1213
    goto/16 :goto_13

    .line 1214
    .line 1215
    :cond_2d
    :try_start_1e
    throw v16

    .line 1216
    :cond_2e
    throw v16
    :try_end_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_1e .. :try_end_1e} :catch_a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1e .. :try_end_1e} :catch_1
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_1e} :catch_0

    .line 1217
    :catch_a
    :try_start_1f
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1218
    .line 1219
    .line 1220
    move-result-object v0

    .line 1221
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1222
    .line 1223
    .line 1224
    goto/16 :goto_13

    .line 1225
    .line 1226
    :cond_2f
    const-string v1, "Ignoring region with unsupported origin: "

    .line 1227
    .line 1228
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1229
    .line 1230
    .line 1231
    move-result-object v0

    .line 1232
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1233
    .line 1234
    .line 1235
    goto/16 :goto_13

    .line 1236
    .line 1237
    :cond_30
    move-object/from16 v36, v1

    .line 1238
    .line 1239
    move-object/from16 v38, v5

    .line 1240
    .line 1241
    move-object/from16 v39, v7

    .line 1242
    .line 1243
    move-object/from16 v37, v8

    .line 1244
    .line 1245
    const-string v0, "Ignoring region without an origin"

    .line 1246
    .line 1247
    invoke-static {v9, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1248
    .line 1249
    .line 1250
    goto/16 :goto_13

    .line 1251
    .line 1252
    :goto_1c
    if-eqz v0, :cond_31

    .line 1253
    .line 1254
    iget-object v1, v0, Ll/iqr0;->a:Ljava/lang/String;

    .line 1255
    .line 1256
    invoke-interface {v6, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1257
    .line 1258
    .line 1259
    :cond_31
    :goto_1d
    invoke-static {v4, v12}, Ll/aqw0;->b(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 1260
    .line 1261
    .line 1262
    move-result v0
    :try_end_1f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1f .. :try_end_1f} :catch_1
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_1f} :catch_0

    .line 1263
    if-eqz v0, :cond_32

    .line 1264
    .line 1265
    move-object/from16 v1, v20

    .line 1266
    .line 1267
    move-object/from16 v3, v24

    .line 1268
    .line 1269
    goto/16 :goto_28

    .line 1270
    .line 1271
    :cond_32
    move-object/from16 v13, p2

    .line 1272
    .line 1273
    move-object/from16 v2, v20

    .line 1274
    .line 1275
    move-object/from16 v1, v36

    .line 1276
    .line 1277
    move-object/from16 v8, v37

    .line 1278
    .line 1279
    move-object/from16 v5, v38

    .line 1280
    .line 1281
    move-object/from16 v7, v39

    .line 1282
    .line 1283
    goto/16 :goto_10

    .line 1284
    .line 1285
    :cond_33
    move-object/from16 v20, v2

    .line 1286
    .line 1287
    move-object/from16 v38, v5

    .line 1288
    .line 1289
    move-object/from16 v39, v7

    .line 1290
    .line 1291
    move-object/from16 p2, v13

    .line 1292
    .line 1293
    :try_start_20
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 1294
    .line 1295
    .line 1296
    move-result v0

    .line 1297
    move-object/from16 v1, v16

    .line 1298
    .line 1299
    invoke-static {v4, v1}, Ll/hqr0;->f(Lorg/xmlpull/v1/XmlPullParser;Ll/kqr0;)Ll/kqr0;

    .line 1300
    .line 1301
    .line 1302
    move-result-object v31

    .line 1303
    move/from16 v3, p1

    .line 1304
    .line 1305
    move-object/from16 v33, v17

    .line 1306
    .line 1307
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 1308
    .line 1309
    .line 1310
    .line 1311
    .line 1312
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 1313
    .line 1314
    .line 1315
    .line 1316
    .line 1317
    const-wide v18, -0x7fffffffffffffffL    # -4.9E-324

    .line 1318
    .line 1319
    .line 1320
    .line 1321
    .line 1322
    const/16 v32, 0x0

    .line 1323
    .line 1324
    const/16 v34, 0x0

    .line 1325
    .line 1326
    :goto_1e
    if-ge v3, v0, :cond_38

    .line 1327
    .line 1328
    invoke-interface {v4, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v5

    .line 1332
    invoke-interface {v4, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v10

    .line 1336
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 1337
    .line 1338
    .line 1339
    move-result v26
    :try_end_20
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_20 .. :try_end_20} :catch_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_20 .. :try_end_20} :catch_b
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_20} :catch_0

    .line 1340
    sparse-switch v26, :sswitch_data_0

    .line 1341
    .line 1342
    .line 1343
    move-object/from16 v1, v20

    .line 1344
    .line 1345
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1346
    .line 1347
    .line 1348
    .line 1349
    .line 1350
    goto/16 :goto_23

    .line 1351
    .line 1352
    :sswitch_0
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1353
    .line 1354
    .line 1355
    .line 1356
    .line 1357
    const-string v1, "backgroundImage"

    .line 1358
    .line 1359
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1360
    .line 1361
    .line 1362
    move-result v1

    .line 1363
    if-eqz v1, :cond_34

    .line 1364
    .line 1365
    :try_start_21
    const-string v1, "#"

    .line 1366
    .line 1367
    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 1368
    .line 1369
    .line 1370
    move-result v1
    :try_end_21
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_21 .. :try_end_21} :catch_d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_21 .. :try_end_21} :catch_b
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_21} :catch_0

    .line 1371
    if-eqz v1, :cond_34

    .line 1372
    .line 1373
    const/4 v1, 0x1

    .line 1374
    :try_start_22
    invoke-virtual {v10, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 1375
    .line 1376
    .line 1377
    move-result-object v2
    :try_end_22
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_22 .. :try_end_22} :catch_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_22 .. :try_end_22} :catch_b
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_0

    .line 1378
    move-object/from16 v34, v2

    .line 1379
    .line 1380
    :cond_34
    :goto_1f
    move-object/from16 v1, v20

    .line 1381
    .line 1382
    goto/16 :goto_23

    .line 1383
    .line 1384
    :catch_b
    move-exception v0

    .line 1385
    const/16 v16, 0x0

    .line 1386
    .line 1387
    goto/16 :goto_30

    .line 1388
    .line 1389
    :catch_c
    move-exception v0

    .line 1390
    :goto_20
    move-object/from16 v1, v20

    .line 1391
    .line 1392
    :goto_21
    move-object/from16 v3, v24

    .line 1393
    .line 1394
    goto/16 :goto_29

    .line 1395
    .line 1396
    :catch_d
    move-exception v0

    .line 1397
    const/4 v1, 0x1

    .line 1398
    goto :goto_20

    .line 1399
    :sswitch_1
    move-object/from16 v2, p2

    .line 1400
    .line 1401
    const/4 v1, 0x1

    .line 1402
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1403
    .line 1404
    .line 1405
    .line 1406
    .line 1407
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1408
    .line 1409
    .line 1410
    move-result v5

    .line 1411
    if-eqz v5, :cond_35

    .line 1412
    .line 1413
    :try_start_23
    invoke-static {v10}, Ll/hqr0;->g(Ljava/lang/String;)[Ljava/lang/String;

    .line 1414
    .line 1415
    .line 1416
    move-result-object v5

    .line 1417
    array-length v10, v5
    :try_end_23
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_23 .. :try_end_23} :catch_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_23 .. :try_end_23} :catch_b
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_23} :catch_0

    .line 1418
    if-lez v10, :cond_35

    .line 1419
    .line 1420
    move-object/from16 p2, v2

    .line 1421
    .line 1422
    move-object/from16 v32, v5

    .line 1423
    .line 1424
    goto :goto_1f

    .line 1425
    :cond_35
    move-object/from16 p2, v2

    .line 1426
    .line 1427
    goto :goto_1f

    .line 1428
    :sswitch_2
    move-object/from16 v2, p2

    .line 1429
    .line 1430
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1431
    .line 1432
    .line 1433
    .line 1434
    .line 1435
    const-string v1, "begin"

    .line 1436
    .line 1437
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1438
    .line 1439
    .line 1440
    move-result v1

    .line 1441
    if-eqz v1, :cond_36

    .line 1442
    .line 1443
    move-object/from16 v1, v20

    .line 1444
    .line 1445
    :try_start_24
    invoke-static {v10, v1}, Ll/hqr0;->c(Ljava/lang/String;Ll/fqr0;)J

    .line 1446
    .line 1447
    .line 1448
    move-result-wide v12
    :try_end_24
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_24 .. :try_end_24} :catch_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_24 .. :try_end_24} :catch_b
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_24} :catch_0

    .line 1449
    :goto_22
    move-object/from16 p2, v2

    .line 1450
    .line 1451
    goto :goto_23

    .line 1452
    :catch_e
    move-exception v0

    .line 1453
    goto :goto_21

    .line 1454
    :cond_36
    move-object/from16 v1, v20

    .line 1455
    .line 1456
    goto :goto_22

    .line 1457
    :sswitch_3
    move-object/from16 v1, v20

    .line 1458
    .line 1459
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1460
    .line 1461
    .line 1462
    .line 1463
    .line 1464
    const-string v2, "end"

    .line 1465
    .line 1466
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1467
    .line 1468
    .line 1469
    move-result v2

    .line 1470
    if-eqz v2, :cond_37

    .line 1471
    .line 1472
    :try_start_25
    invoke-static {v10, v1}, Ll/hqr0;->c(Ljava/lang/String;Ll/fqr0;)J

    .line 1473
    .line 1474
    .line 1475
    move-result-wide v7
    :try_end_25
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_25 .. :try_end_25} :catch_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_25 .. :try_end_25} :catch_b
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_0

    .line 1476
    goto :goto_23

    .line 1477
    :sswitch_4
    move-object/from16 v1, v20

    .line 1478
    .line 1479
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1480
    .line 1481
    .line 1482
    .line 1483
    .line 1484
    const-string v2, "dur"

    .line 1485
    .line 1486
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1487
    .line 1488
    .line 1489
    move-result v2

    .line 1490
    if-eqz v2, :cond_37

    .line 1491
    .line 1492
    :try_start_26
    invoke-static {v10, v1}, Ll/hqr0;->c(Ljava/lang/String;Ll/fqr0;)J

    .line 1493
    .line 1494
    .line 1495
    move-result-wide v18
    :try_end_26
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_26 .. :try_end_26} :catch_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_26 .. :try_end_26} :catch_b
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_0

    .line 1496
    goto :goto_23

    .line 1497
    :sswitch_5
    move-object/from16 v1, v20

    .line 1498
    .line 1499
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1500
    .line 1501
    .line 1502
    .line 1503
    .line 1504
    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1505
    .line 1506
    .line 1507
    move-result v2

    .line 1508
    if-eqz v2, :cond_37

    .line 1509
    .line 1510
    :try_start_27
    invoke-interface {v6, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1511
    .line 1512
    .line 1513
    move-result v2

    .line 1514
    if-eqz v2, :cond_37

    .line 1515
    .line 1516
    move-object/from16 v33, v10

    .line 1517
    .line 1518
    :cond_37
    :goto_23
    add-int/lit8 v3, v3, 0x1

    .line 1519
    .line 1520
    move-object/from16 v20, v1

    .line 1521
    .line 1522
    goto/16 :goto_1e

    .line 1523
    .line 1524
    :cond_38
    move-object/from16 v1, v20

    .line 1525
    .line 1526
    const-wide v26, -0x7fffffffffffffffL    # -4.9E-324

    .line 1527
    .line 1528
    .line 1529
    .line 1530
    .line 1531
    if-eqz v25, :cond_3c

    .line 1532
    .line 1533
    move-object/from16 v2, v25

    .line 1534
    .line 1535
    iget-wide v10, v2, Ll/eqr0;->d:J

    .line 1536
    .line 1537
    cmp-long v0, v10, v26

    .line 1538
    .line 1539
    if-eqz v0, :cond_3a

    .line 1540
    .line 1541
    cmp-long v0, v12, v26

    .line 1542
    .line 1543
    if-eqz v0, :cond_39

    .line 1544
    .line 1545
    add-long/2addr v12, v10

    .line 1546
    goto :goto_24

    .line 1547
    :cond_39
    move-wide/from16 v12, v26

    .line 1548
    .line 1549
    :goto_24
    cmp-long v0, v7, v26

    .line 1550
    .line 1551
    if-eqz v0, :cond_3b

    .line 1552
    .line 1553
    add-long/2addr v7, v10

    .line 1554
    :cond_3a
    move-object v0, v2

    .line 1555
    goto :goto_25

    .line 1556
    :cond_3b
    move-object v0, v2

    .line 1557
    move-wide/from16 v7, v26

    .line 1558
    .line 1559
    goto :goto_25

    .line 1560
    :cond_3c
    move-object/from16 v2, v25

    .line 1561
    .line 1562
    const/4 v0, 0x0

    .line 1563
    :goto_25
    cmp-long v3, v7, v26

    .line 1564
    .line 1565
    if-nez v3, :cond_3d

    .line 1566
    .line 1567
    cmp-long v3, v18, v26

    .line 1568
    .line 1569
    if-eqz v3, :cond_3e

    .line 1570
    .line 1571
    add-long v7, v12, v18

    .line 1572
    .line 1573
    :cond_3d
    :goto_26
    move-wide/from16 v29, v7

    .line 1574
    .line 1575
    goto :goto_27

    .line 1576
    :cond_3e
    if-eqz v0, :cond_3f

    .line 1577
    .line 1578
    iget-wide v7, v0, Ll/eqr0;->e:J

    .line 1579
    .line 1580
    cmp-long v3, v7, v26

    .line 1581
    .line 1582
    if-eqz v3, :cond_3f

    .line 1583
    .line 1584
    goto :goto_26

    .line 1585
    :cond_3f
    move-wide/from16 v29, v26

    .line 1586
    .line 1587
    :goto_27
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 1588
    .line 1589
    .line 1590
    move-result-object v26

    .line 1591
    move-object/from16 v35, v0

    .line 1592
    .line 1593
    move-wide/from16 v27, v12

    .line 1594
    .line 1595
    invoke-static/range {v26 .. v35}, Ll/eqr0;->b(Ljava/lang/String;JJLl/kqr0;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/eqr0;)Ll/eqr0;

    .line 1596
    .line 1597
    .line 1598
    move-result-object v0
    :try_end_27
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_27 .. :try_end_27} :catch_e
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_27 .. :try_end_27} :catch_b
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_27} :catch_0

    .line 1599
    move-object/from16 v3, v24

    .line 1600
    .line 1601
    :try_start_28
    invoke-virtual {v3, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 1602
    .line 1603
    .line 1604
    if-eqz v2, :cond_40

    .line 1605
    .line 1606
    invoke-virtual {v2, v0}, Ll/eqr0;->f(Ll/eqr0;)V
    :try_end_28
    .catch Lcom/google/android/gms/internal/ads/zzakn; {:try_start_28 .. :try_end_28} :catch_f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_28 .. :try_end_28} :catch_b
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_0

    .line 1607
    .line 1608
    .line 1609
    goto :goto_28

    .line 1610
    :catch_f
    move-exception v0

    .line 1611
    goto :goto_29

    .line 1612
    :cond_40
    :goto_28
    move-object v9, v1

    .line 1613
    move-object/from16 v12, v21

    .line 1614
    .line 1615
    move/from16 v13, v22

    .line 1616
    .line 1617
    move-object/from16 v1, v38

    .line 1618
    .line 1619
    move-object/from16 v2, v39

    .line 1620
    .line 1621
    goto/16 :goto_2e

    .line 1622
    .line 1623
    :goto_29
    :try_start_29
    const-string v2, "Suppressing parser error"

    .line 1624
    .line 1625
    invoke-static {v9, v2, v0}, Ll/y4w0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1626
    .line 1627
    .line 1628
    move-object v9, v1

    .line 1629
    move-object/from16 v12, v21

    .line 1630
    .line 1631
    move-object/from16 v1, v38

    .line 1632
    .line 1633
    move-object/from16 v2, v39

    .line 1634
    .line 1635
    goto/16 :goto_e

    .line 1636
    .line 1637
    :cond_41
    move-object/from16 v23, v2

    .line 1638
    .line 1639
    move-object/from16 v38, v5

    .line 1640
    .line 1641
    move-object/from16 v39, v7

    .line 1642
    .line 1643
    move-object v3, v8

    .line 1644
    move-object/from16 v20, v9

    .line 1645
    .line 1646
    move-object v2, v11

    .line 1647
    move-object/from16 v21, v12

    .line 1648
    .line 1649
    move/from16 v22, v13

    .line 1650
    .line 1651
    const/4 v5, 0x4

    .line 1652
    if-ne v0, v5, :cond_44

    .line 1653
    .line 1654
    if-eqz v2, :cond_43

    .line 1655
    .line 1656
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 1657
    .line 1658
    .line 1659
    move-result-object v0

    .line 1660
    invoke-static {v0}, Ll/eqr0;->c(Ljava/lang/String;)Ll/eqr0;

    .line 1661
    .line 1662
    .line 1663
    move-result-object v0

    .line 1664
    invoke-virtual {v2, v0}, Ll/eqr0;->f(Ll/eqr0;)V

    .line 1665
    .line 1666
    .line 1667
    :cond_42
    move-object/from16 v1, v38

    .line 1668
    .line 1669
    move-object/from16 v2, v39

    .line 1670
    .line 1671
    goto :goto_2d

    .line 1672
    :cond_43
    const/16 v16, 0x0

    .line 1673
    .line 1674
    throw v16

    .line 1675
    :cond_44
    const/4 v2, 0x3

    .line 1676
    if-ne v0, v2, :cond_42

    .line 1677
    .line 1678
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 1679
    .line 1680
    .line 1681
    move-result-object v0

    .line 1682
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1683
    .line 1684
    .line 1685
    move-result v0

    .line 1686
    if-eqz v0, :cond_46

    .line 1687
    .line 1688
    new-instance v12, Ll/lqr0;

    .line 1689
    .line 1690
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v0

    .line 1694
    check-cast v0, Ll/eqr0;

    .line 1695
    .line 1696
    if-eqz v0, :cond_45

    .line 1697
    .line 1698
    move-object/from16 v1, v38

    .line 1699
    .line 1700
    move-object/from16 v2, v39

    .line 1701
    .line 1702
    invoke-direct {v12, v0, v1, v6, v2}, Ll/lqr0;-><init>(Ll/eqr0;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 1703
    .line 1704
    .line 1705
    goto :goto_2a

    .line 1706
    :cond_45
    const/16 v16, 0x0

    .line 1707
    .line 1708
    throw v16

    .line 1709
    :cond_46
    move-object/from16 v1, v38

    .line 1710
    .line 1711
    move-object/from16 v2, v39

    .line 1712
    .line 1713
    move-object/from16 v12, v21

    .line 1714
    .line 1715
    :goto_2a
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 1716
    .line 1717
    .line 1718
    move-object/from16 v9, v20

    .line 1719
    .line 1720
    :goto_2b
    move/from16 v13, v22

    .line 1721
    .line 1722
    goto :goto_2e

    .line 1723
    :cond_47
    move-object/from16 v17, v1

    .line 1724
    .line 1725
    move-object/from16 v23, v2

    .line 1726
    .line 1727
    move v10, v3

    .line 1728
    move-object v1, v5

    .line 1729
    move-object v2, v7

    .line 1730
    move-object v3, v8

    .line 1731
    move-object/from16 v20, v9

    .line 1732
    .line 1733
    move-object/from16 v21, v12

    .line 1734
    .line 1735
    move/from16 v22, v13

    .line 1736
    .line 1737
    if-ne v0, v10, :cond_48

    .line 1738
    .line 1739
    add-int/lit8 v13, v22, 0x1

    .line 1740
    .line 1741
    :goto_2c
    move-object/from16 v9, v20

    .line 1742
    .line 1743
    move-object/from16 v12, v21

    .line 1744
    .line 1745
    goto :goto_2e

    .line 1746
    :cond_48
    const/4 v5, 0x3

    .line 1747
    if-ne v0, v5, :cond_49

    .line 1748
    .line 1749
    add-int/lit8 v13, v22, -0x1

    .line 1750
    .line 1751
    goto :goto_2c

    .line 1752
    :cond_49
    :goto_2d
    move-object/from16 v9, v20

    .line 1753
    .line 1754
    move-object/from16 v12, v21

    .line 1755
    .line 1756
    goto :goto_2b

    .line 1757
    :goto_2e
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 1758
    .line 1759
    .line 1760
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 1761
    .line 1762
    .line 1763
    move-result v0

    .line 1764
    move-object v5, v1

    .line 1765
    move-object v7, v2

    .line 1766
    move-object v8, v3

    .line 1767
    move-object/from16 v1, v17

    .line 1768
    .line 1769
    move-object/from16 v2, v23

    .line 1770
    .line 1771
    const/4 v3, 0x0

    .line 1772
    goto/16 :goto_0

    .line 1773
    .line 1774
    :cond_4a
    move-object/from16 v21, v12

    .line 1775
    .line 1776
    if-eqz v21, :cond_4b

    .line 1777
    .line 1778
    return-object v21

    .line 1779
    :cond_4b
    const/16 v16, 0x0

    .line 1780
    .line 1781
    throw v16
    :try_end_29
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_29 .. :try_end_29} :catch_b
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_29} :catch_0

    .line 1782
    :goto_2f
    const-string v1, "Unexpected error when reading input."

    .line 1783
    .line 1784
    invoke-static {v1, v0}, Ll/yzv;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1785
    .line 1786
    .line 1787
    const/16 v16, 0x0

    .line 1788
    .line 1789
    return-object v16

    .line 1790
    :catch_10
    move-exception v0

    .line 1791
    move-object/from16 v16, v3

    .line 1792
    .line 1793
    :goto_30
    const-string v1, "Unable to decode source"

    .line 1794
    .line 1795
    invoke-static {v1, v0}, Ll/yzv;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1796
    .line 1797
    .line 1798
    return-object v16

    .line 1799
    :sswitch_data_0
    .sparse-switch
        -0x37b7d90c -> :sswitch_5
        0x18601 -> :sswitch_4
        0x188db -> :sswitch_3
        0x59478a9 -> :sswitch_2
        0x68b1db1 -> :sswitch_1
        0x4d0b70cd -> :sswitch_0
    .end sparse-switch
.end method
