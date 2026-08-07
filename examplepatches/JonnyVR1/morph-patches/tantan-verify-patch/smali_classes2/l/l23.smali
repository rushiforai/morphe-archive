.class public Ll/l23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mpl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0008\u0016\u0018\u00002\u00020\u0001B\'\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\'\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0012\u001a\u0004\u0008\u0016\u0010\u0014R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0015\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/l23;",
        "Ll/mpl;",
        "",
        "saveBytes",
        "saveBitmap",
        "Lcom/clevertap/android/sdk/Logger;",
        "logger",
        "<init>",
        "(ZZLcom/clevertap/android/sdk/Logger;)V",
        "Ljava/io/InputStream;",
        "inputStream",
        "Ljava/net/HttpURLConnection;",
        "connection",
        "",
        "downloadStartTimeInMilliseconds",
        "Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "a",
        "(Ljava/io/InputStream;Ljava/net/HttpURLConnection;J)Lcom/clevertap/android/sdk/network/DownloadedBitmap;",
        "Z",
        "getSaveBytes",
        "()Z",
        "b",
        "getSaveBitmap",
        "c",
        "Lcom/clevertap/android/sdk/Logger;",
        "()Lcom/clevertap/android/sdk/Logger;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final a:Z

.field private final b:Z

.field private final c:Lcom/clevertap/android/sdk/Logger;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    .line 24
    invoke-direct/range {v0 .. v5}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(ZZLcom/clevertap/android/sdk/Logger;)V
    .locals 0
    .param p3    # Lcom/clevertap/android/sdk/Logger;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean p1, p0, Ll/l23;->a:Z

    .line 22
    iput-boolean p2, p0, Ll/l23;->b:Z

    .line 23
    iput-object p3, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    return-void
.end method

.method public synthetic constructor <init>(ZZLcom/clevertap/android/sdk/Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    and-int/lit8 p5, p4, 0x2

    .line 7
    .line 8
    if-eqz p5, :cond_1

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    :cond_1
    and-int/lit8 p4, p4, 0x4

    .line 12
    .line 13
    if-eqz p4, :cond_2

    .line 14
    .line 15
    const/4 p3, 0x0

    .line 16
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Ll/l23;-><init>(ZZLcom/clevertap/android/sdk/Logger;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Ljava/io/InputStream;Ljava/net/HttpURLConnection;J)Lcom/clevertap/android/sdk/network/DownloadedBitmap;
    .locals 7
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/net/HttpURLConnection;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v1, "reading bitmap input stream in BitmapInputStreamDecoder...."

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/16 v0, 0x4000

    .line 17
    .line 18
    new-array v0, v0, [B

    .line 19
    .line 20
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    move v3, v2

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    const/4 v5, -0x1

    .line 32
    if-eq v4, v5, :cond_2

    .line 33
    .line 34
    add-int/2addr v3, v4

    .line 35
    invoke-virtual {v1, v0, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 36
    .line 37
    .line 38
    iget-object v4, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    new-instance v5, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v6, "Downloaded "

    .line 45
    .line 46
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v6, " bytes"

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v4, v5}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget-object p1, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 66
    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v4, "Total download size for bitmap = "

    .line 72
    .line 73
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p2}, Ljava/net/URLConnection;->getContentLength()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eq v0, v5, :cond_5

    .line 95
    .line 96
    if-eq v0, v3, :cond_5

    .line 97
    .line 98
    iget-object p0, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 99
    .line 100
    if-eqz p0, :cond_4

    .line 101
    .line 102
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string p3, "File not loaded completely not going forward. URL was: "

    .line 105
    .line 106
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p2, ", Reason: Incomplete Download"

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    sget-object p0, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 129
    .line 130
    sget-object p1, Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;->DOWNLOAD_FAILED:Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;

    .line 131
    .line 132
    const-string p2, "Incomplete Download"

    .line 133
    .line 134
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/a;->b(Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;Ljava/lang/String;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_5
    iget-boolean p2, p0, Ll/l23;->b:Z

    .line 140
    .line 141
    if-eqz p2, :cond_9

    .line 142
    .line 143
    array-length p2, p1

    .line 144
    invoke-static {p1, v2, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    if-eqz p2, :cond_7

    .line 149
    .line 150
    sget-object v0, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 151
    .line 152
    invoke-static {}, Lcom/clevertap/android/sdk/Utils;->r()J

    .line 153
    .line 154
    .line 155
    move-result-wide v1

    .line 156
    sub-long/2addr v1, p3

    .line 157
    iget-boolean p0, p0, Ll/l23;->a:Z

    .line 158
    .line 159
    if-eqz p0, :cond_6

    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_6
    const/4 p1, 0x0

    .line 163
    :goto_1
    invoke-virtual {v0, p2, v1, v2, p1}, Lcom/clevertap/android/sdk/network/a;->d(Landroid/graphics/Bitmap;J[B)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0

    .line 168
    :cond_7
    iget-object p0, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 169
    .line 170
    const-string p1, "DecodeByteArray error"

    .line 171
    .line 172
    if-eqz p0, :cond_8

    .line 173
    .line 174
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_8
    sget-object p0, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 178
    .line 179
    sget-object p2, Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;->DOWNLOAD_FAILED:Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;

    .line 180
    .line 181
    invoke-virtual {p0, p2, p1}, Lcom/clevertap/android/sdk/network/a;->b(Lcom/clevertap/android/sdk/network/DownloadedBitmap$Status;Ljava/lang/String;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    return-object p0

    .line 186
    :cond_9
    sget-object p0, Lcom/clevertap/android/sdk/network/a;->INSTANCE:Lcom/clevertap/android/sdk/network/a;

    .line 187
    .line 188
    invoke-static {}, Lcom/clevertap/android/sdk/Utils;->r()J

    .line 189
    .line 190
    .line 191
    move-result-wide v0

    .line 192
    sub-long/2addr v0, p3

    .line 193
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0, v0, v1, p1}, Lcom/clevertap/android/sdk/network/a;->f(J[B)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    return-object p0
.end method

.method public final b()Lcom/clevertap/android/sdk/Logger;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l23;->c:Lcom/clevertap/android/sdk/Logger;

    .line 2
    .line 3
    return-object p0
.end method
