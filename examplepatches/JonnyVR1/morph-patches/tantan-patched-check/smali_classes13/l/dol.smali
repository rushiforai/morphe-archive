.class public Ll/dol;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dol$b;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/dol;->a:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/dol$b;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, v1}, Ll/dol$b;-><init>(Ll/dol$a;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :array_0
    .array-data 1
        0x78t
        0x12t
        0x45t
        0x47t
        0x34t
        0x12t
        0x59t
        0xat
        0x42t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x5

    .line 11
    new-array v1, v1, [B

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    sget-object p0, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljavax/net/ssl/HttpsURLConnection;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object p0, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/net/HttpURLConnection;

    .line 42
    .line 43
    :goto_0
    const/16 v0, 0xa

    .line 44
    .line 45
    new-array v0, v0, [B

    .line 46
    .line 47
    fill-array-data v0, :array_1

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Ll/dol;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p0, v0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    nop

    .line 63
    :array_0
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x12t
    .end array-data

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    nop

    .line 71
    :array_1
    .array-data 1
        0x65t
        0x15t
        0x54t
        0x45t
        0x4ct
        0x27t
        0x57t
        0x3t
        0x5ft
        0x43t
    .end array-data
.end method

.method public static b()Ljava/lang/String;
    .locals 6

    .line 1
    :try_start_0
    invoke-static {}, Ll/fiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    const/16 v0, 0xa

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    new-instance v1, Ljava/lang/StringBuffer;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    :goto_1
    if-ge v3, v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/16 v5, 0x1f

    .line 42
    .line 43
    if-le v4, v5, :cond_1

    .line 44
    .line 45
    const/16 v5, 0x7f

    .line 46
    .line 47
    if-lt v4, v5, :cond_0

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_0
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 51
    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_1
    :goto_2
    const/4 v5, 0x6

    .line 55
    new-array v5, v5, [B

    .line 56
    .line 57
    fill-array-data v5, :array_1

    .line 58
    .line 59
    .line 60
    invoke-static {v5}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    .line 78
    .line 79
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    return-object v0

    .line 87
    :array_0
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x4ft
        0x7t
        0x57t
        0x3t
        0x5ft
        0x43t
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    nop

    .line 97
    :array_1
    .array-data 1
        0x6ct
        0x13t
        0x14t
        0x7t
        0x55t
        0x1et
    .end array-data
.end method

.method private static c(Ljava/util/Map;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/util/Map$Entry;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 39
    .line 40
    .line 41
    new-array v4, v3, [B

    .line 42
    .line 43
    const/16 v5, 0xd

    .line 44
    .line 45
    aput-byte v5, v4, v2

    .line 46
    .line 47
    invoke-static {v4}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 52
    .line 53
    .line 54
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    .line 62
    .line 63
    new-array v1, v3, [B

    .line 64
    .line 65
    const/16 v3, 0x16

    .line 66
    .line 67
    aput-byte v3, v1, v2

    .line 68
    .line 69
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    sub-int/2addr v0, v3

    .line 86
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)[B
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    add-int/lit8 v4, v3, 0x1

    .line 8
    .line 9
    const/4 v5, 0x3

    .line 10
    if-gt v3, v5, :cond_8

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    :try_start_0
    invoke-static {p0, p1, p2}, Ll/dol;->e(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    const/16 v7, 0xc8

    .line 22
    .line 23
    if-lt v6, v7, :cond_1

    .line 24
    .line 25
    const/16 v7, 0x12b

    .line 26
    .line 27
    if-ge v6, v7, :cond_1

    .line 28
    .line 29
    new-instance v6, Ljava/io/BufferedInputStream;

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    invoke-direct {v6, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 36
    .line 37
    .line 38
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    .line 39
    .line 40
    const/16 v8, 0x800

    .line 41
    .line 42
    invoke-direct {v7, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 43
    .line 44
    .line 45
    new-array v8, v8, [B

    .line 46
    .line 47
    :goto_1
    invoke-virtual {v6, v8}, Ljava/io/InputStream;->read([B)I

    .line 48
    .line 49
    .line 50
    move-result v9

    .line 51
    const/4 v10, -0x1

    .line 52
    if-eq v9, v10, :cond_0

    .line 53
    .line 54
    invoke-virtual {v7, v8, v2, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_5

    .line 60
    :catch_0
    move-exception v6

    .line 61
    goto :goto_2

    .line 62
    :catch_1
    move-exception p0

    .line 63
    goto :goto_4

    .line 64
    :cond_0
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 65
    .line 66
    .line 67
    move-result-object p0
    :try_end_0
    .catch Lcom/momosec/mmuid/network/exception/NetworkUnavailableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_1
    :try_start_1
    new-instance v7, Lcom/momosec/mmuid/network/exception/HttpResponseStatusErrorException;

    .line 73
    .line 74
    invoke-direct {v7, v6}, Lcom/momosec/mmuid/network/exception/HttpResponseStatusErrorException;-><init>(I)V

    .line 75
    .line 76
    .line 77
    throw v7
    :try_end_1
    .catch Lcom/momosec/mmuid/network/exception/NetworkUnavailableException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    :goto_2
    :try_start_2
    instance-of v7, v6, Lcom/momosec/mmuid/network/exception/HttpResponseStatusErrorException;

    .line 79
    .line 80
    if-eqz v7, :cond_3

    .line 81
    .line 82
    move-object v7, v6

    .line 83
    check-cast v7, Lcom/momosec/mmuid/network/exception/HttpResponseStatusErrorException;

    .line 84
    .line 85
    iget v7, v7, Lcom/momosec/mmuid/network/exception/HttpResponseStatusErrorException;->statusCode:I

    .line 86
    .line 87
    if-lez v7, :cond_3

    .line 88
    .line 89
    const/16 v8, 0x1f4

    .line 90
    .line 91
    if-lt v7, v8, :cond_2

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_2
    throw v6

    .line 95
    :cond_3
    :goto_3
    if-ge v4, v5, :cond_6

    .line 96
    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 98
    .line 99
    .line 100
    move-result-wide v7

    .line 101
    sub-long/2addr v7, v0

    .line 102
    const-wide/16 v9, 0x4e20

    .line 103
    .line 104
    cmp-long v5, v7, v9

    .line 105
    .line 106
    if-gtz v5, :cond_6

    .line 107
    .line 108
    invoke-static {}, Ll/tl20;->b()Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-eqz v5, :cond_5

    .line 113
    .line 114
    const-wide/16 v5, 0x1f4

    .line 115
    .line 116
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 117
    .line 118
    .line 119
    if-eqz v3, :cond_4

    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 122
    .line 123
    .line 124
    :cond_4
    move v3, v4

    .line 125
    goto :goto_0

    .line 126
    :cond_5
    :try_start_3
    throw v6

    .line 127
    :cond_6
    throw v6

    .line 128
    :goto_4
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 129
    :goto_5
    if-eqz v3, :cond_7

    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 132
    .line 133
    .line 134
    :cond_7
    throw p0

    .line 135
    :cond_8
    new-instance p0, Lcom/momosec/mmuid/network/exception/HttpBaseException;

    .line 136
    .line 137
    invoke-static {}, Ll/fiw;->a()Landroid/content/Context;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    sget p2, Lcom/momosec/mmuid/R$string;->b:I

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-direct {p0, p1}, Lcom/momosec/mmuid/network/exception/HttpBaseException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/net/HttpURLConnection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/tl20;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {p2}, Ll/dol;->c(Ljava/util/Map;)[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v1, v0

    .line 12
    int-to-long v1, v1

    .line 13
    invoke-static {p0}, Ll/dol;->a(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 22
    .line 23
    .line 24
    const/16 v3, 0x1388

    .line 25
    .line 26
    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 27
    .line 28
    .line 29
    const/16 v3, 0x3a98

    .line 30
    .line 31
    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x4

    .line 35
    new-array v3, v3, [B

    .line 36
    .line 37
    fill-array-data v3, :array_0

    .line 38
    .line 39
    .line 40
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x7

    .line 48
    new-array v3, v3, [B

    .line 49
    .line 50
    fill-array-data v3, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const/4 v4, 0x5

    .line 58
    new-array v5, v4, [B

    .line 59
    .line 60
    fill-array-data v5, :array_2

    .line 61
    .line 62
    .line 63
    invoke-static {v5}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual {p0, v3, v5}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/16 v3, 0xa

    .line 71
    .line 72
    new-array v5, v3, [B

    .line 73
    .line 74
    fill-array-data v5, :array_3

    .line 75
    .line 76
    .line 77
    invoke-static {v5}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    new-array v6, v4, [B

    .line 82
    .line 83
    fill-array-data v6, :array_4

    .line 84
    .line 85
    .line 86
    invoke-static {v6}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-virtual {p0, v5, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/16 v5, 0xe

    .line 94
    .line 95
    new-array v5, v5, [B

    .line 96
    .line 97
    fill-array-data v5, :array_5

    .line 98
    .line 99
    .line 100
    invoke-static {v5}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    new-instance v6, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, ""

    .line 113
    .line 114
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {p0, v5, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const/16 v1, 0xf

    .line 125
    .line 126
    new-array v1, v1, [B

    .line 127
    .line 128
    fill-array-data v1, :array_6

    .line 129
    .line 130
    .line 131
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    new-array v2, v4, [B

    .line 136
    .line 137
    fill-array-data v2, :array_7

    .line 138
    .line 139
    .line 140
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    const/16 v1, 0xc

    .line 148
    .line 149
    new-array v1, v1, [B

    .line 150
    .line 151
    fill-array-data v1, :array_8

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    const/16 v2, 0x21

    .line 159
    .line 160
    new-array v2, v2, [B

    .line 161
    .line 162
    fill-array-data v2, :array_9

    .line 163
    .line 164
    .line 165
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    const/4 v1, 0x6

    .line 173
    new-array v1, v1, [B

    .line 174
    .line 175
    fill-array-data v1, :array_a

    .line 176
    .line 177
    .line 178
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    new-instance v2, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    new-array v3, v3, [B

    .line 188
    .line 189
    fill-array-data v3, :array_b

    .line 190
    .line 191
    .line 192
    invoke-static {v3}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p0, v1, p1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    if-eqz p2, :cond_2

    .line 210
    .line 211
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-nez p1, :cond_2

    .line 216
    .line 217
    const/4 p1, 0x0

    .line 218
    :try_start_0
    new-instance p2, Ljava/io/BufferedOutputStream;

    .line 219
    .line 220
    invoke-virtual {p0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-direct {p2, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 225
    .line 226
    .line 227
    :try_start_1
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 231
    .line 232
    .line 233
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    .line 234
    .line 235
    .line 236
    return-object p0

    .line 237
    :catchall_0
    move-exception p0

    .line 238
    move-object p1, p2

    .line 239
    goto :goto_1

    .line 240
    :catch_0
    move-exception p0

    .line 241
    move-object p1, p2

    .line 242
    goto :goto_0

    .line 243
    :catchall_1
    move-exception p0

    .line 244
    goto :goto_1

    .line 245
    :catch_1
    move-exception p0

    .line 246
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    const/16 v0, 0x10

    .line 251
    .line 252
    new-array v0, v0, [B

    .line 253
    .line 254
    fill-array-data v0, :array_c

    .line 255
    .line 256
    .line 257
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    if-eqz p2, :cond_0

    .line 266
    .line 267
    new-instance p2, Ljavax/net/ssl/SSLException;

    .line 268
    .line 269
    invoke-direct {p2, p0}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    throw p2

    .line 273
    :cond_0
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 274
    :goto_1
    if-eqz p1, :cond_1

    .line 275
    .line 276
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 277
    .line 278
    .line 279
    :cond_1
    throw p0

    .line 280
    :cond_2
    return-object p0

    .line 281
    :cond_3
    new-instance p0, Lcom/momosec/mmuid/network/exception/NetworkUnavailableException;

    .line 282
    .line 283
    invoke-direct {p0}, Lcom/momosec/mmuid/network/exception/NetworkUnavailableException;-><init>()V

    .line 284
    .line 285
    .line 286
    throw p0

    .line 287
    :array_0
    .array-data 1
        0x60t
        0x29t
        0x62t
        0x63t
    .end array-data

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    :array_1
    .array-data 1
        0x73t
        0xet
        0x50t
        0x45t
        0x12t
        0x3t
        0x44t
    .end array-data

    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    :array_2
    .array-data 1
        0x65t
        0x32t
        0x77t
        0x1at
        0x59t
    .end array-data

    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    nop

    .line 309
    :array_3
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    nop

    .line 319
    :array_4
    .array-data 1
        0x53t
        0xat
        0x5et
        0x44t
        0x4t
    .end array-data

    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    nop

    .line 327
    :array_5
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x4bt
        0x7dt
        0x52t
        0xft
        0x1t
        0x44t
        0xet
    .end array-data

    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    nop

    .line 339
    :array_6
    .array-data 1
        0x71t
        0x5t
        0x52t
        0x52t
        0x11t
        0x12t
        0x1dt
        0x2at
        0x50t
        0x59t
        0x6t
        0x13t
        0x51t
        0x1t
        0x54t
    .end array-data

    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    :array_7
    .array-data 1
        0x4at
        0xet
        0x1ct
        0x74t
        0x2ft
    .end array-data

    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    nop

    .line 359
    :array_8
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x4bt
        0x65t
        0x4et
        0x11t
        0x3t
    .end array-data

    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    :array_9
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x5bt
        0x8t
        0x5t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
        0x49t
        0x48t
        0x4bt
        0x46t
        0x40t
        0x16t
        0x4bt
        0x56t
        0x9t
        0x43t
        0x5at
        0x4ct
        0x13t
        0x42t
        0xat
        0x54t
        0x59t
        0x2t
        0x9t
        0x54t
        0x3t
        0x55t
    .end array-data

    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    nop

    .line 391
    :array_a
    .array-data 1
        0x53t
        0x9t
        0x5et
        0x5ct
        0x8t
        0x3t
    .end array-data

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    nop

    .line 399
    :array_b
    .array-data 1
        0x63t
        0x23t
        0x62t
        0x64t
        0x28t
        0x29t
        0x7et
        0x2ft
        0x75t
        0xat
    .end array-data

    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    nop

    .line 409
    :array_c
    .array-data 1
        0x47t
        0x7t
        0x42t
        0x17t
        0xft
        0x9t
        0x44t
        0x46t
        0x47t
        0x52t
        0x13t
        0xft
        0x56t
        0xft
        0x54t
        0x53t
    .end array-data
.end method
