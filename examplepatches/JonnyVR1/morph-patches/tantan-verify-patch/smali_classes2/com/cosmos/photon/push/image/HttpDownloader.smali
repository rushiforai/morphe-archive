.class public Lcom/cosmos/photon/push/image/HttpDownloader;
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


# virtual methods
.method public downloadUrlToStream(Ljava/lang/String;Ljava/io/OutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 3
    .line 4
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 12
    .line 13
    const/16 v0, 0x3a98

    .line 14
    .line 15
    :try_start_1
    invoke-virtual {p1, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x4e20

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 30
    .line 31
    .line 32
    :try_start_2
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 33
    .line 34
    invoke-direct {v1, p2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 35
    .line 36
    .line 37
    :goto_0
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->read()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const/4 p2, -0x1

    .line 42
    if-eq p0, p2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Ljava/io/BufferedOutputStream;->write(I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_4

    .line 50
    :catch_0
    move-exception p0

    .line 51
    goto :goto_3

    .line 52
    :cond_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 53
    .line 54
    .line 55
    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 56
    .line 57
    .line 58
    :catch_1
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 59
    .line 60
    .line 61
    :catch_2
    return-void

    .line 62
    :catchall_1
    move-exception p2

    .line 63
    move-object v1, p0

    .line 64
    :goto_1
    move-object p0, p2

    .line 65
    goto :goto_4

    .line 66
    :catch_3
    move-exception p2

    .line 67
    move-object v1, p0

    .line 68
    :goto_2
    move-object p0, p2

    .line 69
    goto :goto_3

    .line 70
    :catchall_2
    move-exception p2

    .line 71
    move-object v0, p0

    .line 72
    move-object v1, v0

    .line 73
    goto :goto_1

    .line 74
    :catch_4
    move-exception p2

    .line 75
    move-object v0, p0

    .line 76
    move-object v1, v0

    .line 77
    goto :goto_2

    .line 78
    :catchall_3
    move-exception p1

    .line 79
    move-object v0, p0

    .line 80
    move-object v1, v0

    .line 81
    move-object p0, p1

    .line 82
    move-object p1, v1

    .line 83
    goto :goto_4

    .line 84
    :catch_5
    move-exception p1

    .line 85
    move-object v0, p0

    .line 86
    move-object v1, v0

    .line 87
    move-object p0, p1

    .line 88
    move-object p1, v1

    .line 89
    :goto_3
    :try_start_6
    const-string p2, "MoPush-IMAGE"

    .line 90
    .line 91
    new-instance v2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v3, "Error in downloadBitmap - "

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {p2, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 112
    :goto_4
    if-eqz p1, :cond_1

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 115
    .line 116
    .line 117
    :cond_1
    if-eqz v1, :cond_2

    .line 118
    .line 119
    :try_start_7
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 120
    .line 121
    .line 122
    :catch_6
    :cond_2
    if-eqz v0, :cond_3

    .line 123
    .line 124
    :try_start_8
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7

    .line 125
    .line 126
    .line 127
    :catch_7
    :cond_3
    throw p0
.end method
