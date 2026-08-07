.class public final Ll/tx3$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tx3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# static fields
.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/e0l;

.field public final c:Ljava/lang/String;

.field public final d:Lokhttp3/Protocol;

.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:Ll/e0l;

.field public final h:Ll/txk;

.field public final i:J

.field public final j:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lokhttp3/internal/platform/Platform;->getPrefix()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "-Sent-Millis"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Ll/tx3$d;->k:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lokhttp3/internal/platform/Platform;->getPrefix()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, "-Received-Millis"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Ll/tx3$d;->l:Ljava/lang/String;

    .line 54
    .line 55
    return-void
.end method

.method public constructor <init>(Ll/i5d0;)V
    .locals 2

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    move-result-object v0

    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    move-result-object v0

    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 234
    invoke-static {p1}, Ll/yml;->n(Ll/i5d0;)Ll/e0l;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 235
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    move-result-object v0

    invoke-virtual {v0}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->c:Ljava/lang/String;

    .line 236
    invoke-virtual {p1}, Ll/i5d0;->S()Lokhttp3/Protocol;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->d:Lokhttp3/Protocol;

    .line 237
    invoke-virtual {p1}, Ll/i5d0;->q()I

    move-result v0

    iput v0, p0, Ll/tx3$d;->e:I

    .line 238
    invoke-virtual {p1}, Ll/i5d0;->J()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->f:Ljava/lang/String;

    .line 239
    invoke-virtual {p1}, Ll/i5d0;->F()Ll/e0l;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 240
    invoke-virtual {p1}, Ll/i5d0;->t()Ll/txk;

    move-result-object v0

    iput-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 241
    invoke-virtual {p1}, Ll/i5d0;->a0()J

    move-result-wide v0

    iput-wide v0, p0, Ll/tx3$d;->i:J

    .line 242
    invoke-virtual {p1}, Ll/i5d0;->U()J

    move-result-wide v0

    iput-wide v0, p0, Ll/tx3$d;->j:J

    return-void
.end method

.method public constructor <init>(Lokio/Source;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Ll/tx3$d;->c:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v1, Ll/e0l$a;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/e0l$a;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/tx3;->h(Lokio/BufferedSource;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    move v4, v3

    .line 31
    :goto_0
    if-ge v4, v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v1, v5}, Ll/e0l$a;->b(Ljava/lang/String;)Ll/e0l$a;

    .line 38
    .line 39
    .line 40
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto/16 :goto_5

    .line 45
    .line 46
    :cond_0
    invoke-virtual {v1}, Ll/e0l$a;->e()Ll/e0l;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 51
    .line 52
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Ll/r4g0;->a(Ljava/lang/String;)Ll/r4g0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, v1, Ll/r4g0;->a:Lokhttp3/Protocol;

    .line 61
    .line 62
    iput-object v2, p0, Ll/tx3$d;->d:Lokhttp3/Protocol;

    .line 63
    .line 64
    iget v2, v1, Ll/r4g0;->b:I

    .line 65
    .line 66
    iput v2, p0, Ll/tx3$d;->e:I

    .line 67
    .line 68
    iget-object v1, v1, Ll/r4g0;->c:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, p0, Ll/tx3$d;->f:Ljava/lang/String;

    .line 71
    .line 72
    new-instance v1, Ll/e0l$a;

    .line 73
    .line 74
    invoke-direct {v1}, Ll/e0l$a;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v0}, Ll/tx3;->h(Lokio/BufferedSource;)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :goto_1
    if-ge v3, v2, :cond_1

    .line 82
    .line 83
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v1, v4}, Ll/e0l$a;->b(Ljava/lang/String;)Ll/e0l$a;

    .line 88
    .line 89
    .line 90
    add-int/lit8 v3, v3, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    sget-object v2, Ll/tx3$d;->k:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ll/e0l$a;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    sget-object v4, Ll/tx3$d;->l:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v1, v4}, Ll/e0l$a;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-virtual {v1, v2}, Ll/e0l$a;->g(Ljava/lang/String;)Ll/e0l$a;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v4}, Ll/e0l$a;->g(Ljava/lang/String;)Ll/e0l$a;

    .line 109
    .line 110
    .line 111
    const-wide/16 v6, 0x0

    .line 112
    .line 113
    if-eqz v3, :cond_2

    .line 114
    .line 115
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v2

    .line 119
    goto :goto_2

    .line 120
    :cond_2
    move-wide v2, v6

    .line 121
    :goto_2
    iput-wide v2, p0, Ll/tx3$d;->i:J

    .line 122
    .line 123
    if-eqz v5, :cond_3

    .line 124
    .line 125
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v6

    .line 129
    :cond_3
    iput-wide v6, p0, Ll/tx3$d;->j:J

    .line 130
    .line 131
    invoke-virtual {v1}, Ll/e0l$a;->e()Ll/e0l;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/tx3$d;->a()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_6

    .line 142
    .line 143
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-gtz v2, :cond_5

    .line 152
    .line 153
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {v1}, Ll/w45;->b(Ljava/lang/String;)Ll/w45;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {p0, v0}, Ll/tx3$d;->c(Lokio/BufferedSource;)Ljava/util/List;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {p0, v0}, Ll/tx3$d;->c(Lokio/BufferedSource;)Ljava/util/List;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-interface {v0}, Lokio/BufferedSource;->exhausted()Z

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-nez v4, :cond_4

    .line 174
    .line 175
    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-static {v0}, Lokhttp3/TlsVersion;->forJavaName(Ljava/lang/String;)Lokhttp3/TlsVersion;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    goto :goto_3

    .line 184
    :cond_4
    sget-object v0, Lokhttp3/TlsVersion;->SSL_3_0:Lokhttp3/TlsVersion;

    .line 185
    .line 186
    :goto_3
    invoke-static {v0, v1, v2, v3}, Ll/txk;->c(Lokhttp3/TlsVersion;Ll/w45;Ljava/util/List;Ljava/util/List;)Ll/txk;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_5
    new-instance p0, Ljava/io/IOException;

    .line 194
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v2, "expected \"\" but was \""

    .line 201
    .line 202
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v1, "\""

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    throw p0

    .line 221
    :cond_6
    const/4 v0, 0x0

    .line 222
    iput-object v0, p0, Ll/tx3$d;->h:Ll/txk;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    .line 224
    :goto_4
    invoke-interface {p1}, Lokio/Source;->close()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :goto_5
    invoke-interface {p1}, Lokio/Source;->close()V

    .line 229
    .line 230
    .line 231
    throw p0
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "https://"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public b(Ll/x1d0;Ll/i5d0;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/rnl;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/tx3$d;->c:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 30
    .line 31
    invoke-static {p2, p0, p1}, Ll/yml;->o(Ll/i5d0;Ll/e0l;Ll/x1d0;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final c(Lokio/BufferedSource;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokio/BufferedSource;",
            ")",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/tx3;->h(Lokio/BufferedSource;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    :try_start_0
    const-string v0, "X.509"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(I)V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    if-ge v2, p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v4, Lokio/Buffer;

    .line 30
    .line 31
    invoke-direct {v4}, Lokio/Buffer;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v3}, Lokio/ByteString;->decodeBase64(Ljava/lang/String;)Lokio/ByteString;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v4, v3}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Lokio/Buffer;->inputStream()Ljava/io/InputStream;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v0, v3}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-object v1

    .line 56
    :catch_0
    move-exception p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method public d(Ll/x4e$e;)Ll/i5d0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 2
    .line 3
    const-string v1, "Content-Type"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 10
    .line 11
    const-string v2, "Content-Length"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/x1d0$a;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/x1d0$a;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Ll/tx3$d;->c:Ljava/lang/String;

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-virtual {v2, v3, v4}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ll/x1d0$a;->i(Ll/e0l;)Ll/x1d0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ll/i5d0$a;

    .line 46
    .line 47
    invoke-direct {v3}, Ll/i5d0$a;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v2}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Ll/tx3$d;->d:Lokhttp3/Protocol;

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ll/i5d0$a;->o(Lokhttp3/Protocol;)Ll/i5d0$a;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget v3, p0, Ll/tx3$d;->e:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ll/i5d0$a;->g(I)Ll/i5d0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Ll/tx3$d;->f:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ll/i5d0$a;->l(Ljava/lang/String;)Ll/i5d0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v3, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ll/i5d0$a;->j(Ll/e0l;)Ll/i5d0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    new-instance v3, Ll/tx3$b;

    .line 79
    .line 80
    invoke-direct {v3, p1, v0, v1}, Ll/tx3$b;-><init>(Ll/x4e$e;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/i5d0$a;->h(Ll/txk;)Ll/i5d0$a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-wide v0, p0, Ll/tx3$d;->i:J

    .line 94
    .line 95
    invoke-virtual {p1, v0, v1}, Ll/i5d0$a;->r(J)Ll/i5d0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-wide v0, p0, Ll/tx3$d;->j:J

    .line 100
    .line 101
    invoke-virtual {p1, v0, v1}, Ll/i5d0$a;->p(J)Ll/i5d0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public final e(Lokio/BufferedSink;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokio/BufferedSink;",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-long v0, p0

    .line 6
    invoke-interface {p1, v0, v1}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/16 v0, 0xa

    .line 11
    .line 12
    invoke-interface {p0, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 13
    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    if-ge v1, p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/security/cert/Certificate;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/security/cert/Certificate;->getEncoded()[B

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lokio/ByteString;->base64()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {p1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public f(Ll/x4e$b;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/x4e$b;->d(I)Lokio/Sink;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v1, p0, Ll/tx3$d;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {p1, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/16 v2, 0xa

    .line 17
    .line 18
    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/tx3$d;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p1, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/e0l;->k()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-long v3, v1

    .line 37
    invoke-interface {p1, v3, v4}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/e0l;->k()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    move v3, v0

    .line 51
    :goto_0
    const-string v4, ": "

    .line 52
    .line 53
    if-ge v3, v1, :cond_0

    .line 54
    .line 55
    iget-object v5, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 56
    .line 57
    invoke-virtual {v5, v3}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-interface {p1, v5}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-interface {v5, v4}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-object v5, p0, Ll/tx3$d;->b:Ll/e0l;

    .line 70
    .line 71
    invoke-virtual {v5, v3}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-interface {v4, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 80
    .line 81
    .line 82
    add-int/lit8 v3, v3, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    new-instance v1, Ll/r4g0;

    .line 86
    .line 87
    iget-object v3, p0, Ll/tx3$d;->d:Lokhttp3/Protocol;

    .line 88
    .line 89
    iget v5, p0, Ll/tx3$d;->e:I

    .line 90
    .line 91
    iget-object v6, p0, Ll/tx3$d;->f:Ljava/lang/String;

    .line 92
    .line 93
    invoke-direct {v1, v3, v5, v6}, Ll/r4g0;-><init>(Lokhttp3/Protocol;ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ll/r4g0;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {p1, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 108
    .line 109
    invoke-virtual {v1}, Ll/e0l;->k()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    add-int/lit8 v1, v1, 0x2

    .line 114
    .line 115
    int-to-long v5, v1

    .line 116
    invoke-interface {p1, v5, v6}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 124
    .line 125
    invoke-virtual {v1}, Ll/e0l;->k()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    :goto_1
    if-ge v0, v1, :cond_1

    .line 130
    .line 131
    iget-object v3, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 132
    .line 133
    invoke-virtual {v3, v0}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-interface {p1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    iget-object v5, p0, Ll/tx3$d;->g:Ll/e0l;

    .line 146
    .line 147
    invoke-virtual {v5, v0}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-interface {v3, v5}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-interface {v3, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 156
    .line 157
    .line 158
    add-int/lit8 v0, v0, 0x1

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_1
    sget-object v0, Ll/tx3$d;->k:Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {p1, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-interface {v0, v4}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget-wide v5, p0, Ll/tx3$d;->i:J

    .line 172
    .line 173
    invoke-interface {v0, v5, v6}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-interface {v0, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 178
    .line 179
    .line 180
    sget-object v0, Ll/tx3$d;->l:Ljava/lang/String;

    .line 181
    .line 182
    invoke-interface {p1, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-interface {v0, v4}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-wide v3, p0, Ll/tx3$d;->j:J

    .line 191
    .line 192
    invoke-interface {v0, v3, v4}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-interface {v0, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Ll/tx3$d;->a()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_2

    .line 204
    .line 205
    invoke-interface {p1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/txk;->a()Ll/w45;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0}, Ll/w45;->e()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-interface {p1, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-interface {v0, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/txk;->f()Ljava/util/List;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {p0, p1, v0}, Ll/tx3$d;->e(Lokio/BufferedSink;Ljava/util/List;)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 235
    .line 236
    invoke-virtual {v0}, Ll/txk;->d()Ljava/util/List;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {p0, p1, v0}, Ll/tx3$d;->e(Lokio/BufferedSink;Ljava/util/List;)V

    .line 241
    .line 242
    .line 243
    iget-object p0, p0, Ll/tx3$d;->h:Ll/txk;

    .line 244
    .line 245
    invoke-virtual {p0}, Ll/txk;->g()Lokhttp3/TlsVersion;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {p0}, Lokhttp3/TlsVersion;->javaName()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-interface {p1, p0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-interface {p0, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 258
    .line 259
    .line 260
    :cond_2
    invoke-interface {p1}, Lokio/Sink;->close()V

    .line 261
    .line 262
    .line 263
    return-void
.end method
