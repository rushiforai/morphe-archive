.class public Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;
    }
.end annotation


# static fields
.field public static hexDigits:[C = null

.field public static huiYanVersion:Ljava/lang/String; = ""


# instance fields
.field public final MD5_FILE_NAME:Ljava/lang/String;

.field public final TAG:Ljava/lang/String;

.field public final moduleFileMd5Map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->hexDigits:[C

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "files_md5"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->MD5_FILE_NAME:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 14
    .line 15
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method private bytesToHexString([B)Ljava/lang/String;
    .locals 7

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length p0, p1

    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    if-ne p0, v0, :cond_1

    .line 7
    .line 8
    const/16 p0, 0x20

    .line 9
    .line 10
    new-array p0, p0, [C

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v1, v0, :cond_0

    .line 15
    .line 16
    aget-byte v3, p1, v1

    .line 17
    .line 18
    add-int/lit8 v4, v2, 0x1

    .line 19
    .line 20
    sget-object v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->hexDigits:[C

    .line 21
    .line 22
    ushr-int/lit8 v6, v3, 0x4

    .line 23
    .line 24
    and-int/lit8 v6, v6, 0xf

    .line 25
    .line 26
    aget-char v6, v5, v6

    .line 27
    .line 28
    aput-char v6, p0, v2

    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    and-int/lit8 v3, v3, 0xf

    .line 33
    .line 34
    aget-char v3, v5, v3

    .line 35
    .line 36
    aput-char v3, p0, v4

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance p1, Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    .line 44
    .line 45
    .line 46
    return-object p1

    .line 47
    :cond_1
    const-string p0, ""

    .line 48
    .line 49
    return-object p0
.end method

.method private getFileMD5(Ljava/io/File;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "get file  md5 close io error:"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v2, v2, v4

    .line 20
    .line 21
    if-lez v2, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    :try_start_0
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 25
    .line 26
    new-instance v4, Ljava/io/FileInputStream;

    .line 27
    .line 28
    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    .line 33
    .line 34
    :try_start_1
    invoke-direct {p0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->getInputStreamMd5(Ljava/io/InputStream;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :catch_0
    move-exception p1

    .line 43
    goto :goto_2

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    move-object v2, v3

    .line 46
    goto :goto_3

    .line 47
    :catch_1
    move-exception p1

    .line 48
    move-object v2, v3

    .line 49
    goto :goto_0

    .line 50
    :catch_2
    move-exception p1

    .line 51
    move-object v2, v3

    .line 52
    goto :goto_1

    .line 53
    :catchall_1
    move-exception p1

    .line 54
    goto :goto_3

    .line 55
    :catch_3
    move-exception p1

    .line 56
    goto :goto_0

    .line 57
    :catch_4
    move-exception p1

    .line 58
    goto :goto_1

    .line 59
    :goto_0
    :try_start_3
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 60
    .line 61
    const-string v4, "get file  md5 error oom"

    .line 62
    .line 63
    invoke-static {v3, v4, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 64
    .line 65
    .line 66
    if-eqz v2, :cond_1

    .line 67
    .line 68
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_5

    .line 72
    :goto_1
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 76
    .line 77
    const-string v4, "get file  md5 error "

    .line 78
    .line 79
    invoke-static {v3, v4, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 80
    .line 81
    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 85
    .line 86
    .line 87
    goto :goto_5

    .line 88
    :goto_2
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    goto :goto_5

    .line 94
    :goto_3
    if-eqz v2, :cond_0

    .line 95
    .line 96
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 97
    .line 98
    .line 99
    goto :goto_4

    .line 100
    :catch_5
    move-exception v1

    .line 101
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p0, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    :cond_0
    :goto_4
    throw p1

    .line 107
    :cond_1
    :goto_5
    return-object v1
.end method

.method public static native getFrameworkVersion()Ljava/lang/String;
.end method

.method private getInputStreamMd5(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 9

    .line 1
    const-string v0, "get input stream  md5 error "

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    const-string v2, "MD5"

    .line 6
    .line 7
    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/16 v3, 0x1064

    .line 12
    .line 13
    new-array v4, v3, [B

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    move v6, v5

    .line 17
    :cond_0
    :goto_0
    invoke-virtual {p1, v4, v5, v3}, Ljava/io/InputStream;->read([BII)I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v8, -0x1

    .line 22
    if-eq v7, v8, :cond_1

    .line 23
    .line 24
    if-lez v7, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2, v4, v5, v7}, Ljava/security/MessageDigest;->update([BII)V

    .line 27
    .line 28
    .line 29
    add-int/2addr v6, v7

    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :catch_1
    move-exception p1

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    if-nez v6, :cond_2

    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_2
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->bytesToHexString([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    return-object p0

    .line 47
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-object v1

    .line 56
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-object v1
.end method

.method private getModleMd5ToMap(Ljava/io/File;)I
    .locals 9

    .line 1
    const-string v0, "get modle md5 to map close io error:"

    .line 2
    .line 3
    const-string v1, "get modle md5 to map close io  error:"

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    :try_start_0
    new-instance v4, Ljava/io/InputStreamReader;

    .line 8
    .line 9
    new-instance v5, Ljava/io/FileInputStream;

    .line 10
    .line 11
    invoke-direct {v5, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 15
    .line 16
    .line 17
    :try_start_1
    new-instance p1, Ljava/io/BufferedReader;

    .line 18
    .line 19
    invoke-direct {p1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 20
    .line 21
    .line 22
    :goto_0
    :try_start_2
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const/4 v5, 0x0

    .line 27
    if-eqz v3, :cond_3

    .line 28
    .line 29
    const-string v6, ":"

    .line 30
    .line 31
    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    array-length v6, v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 36
    const/4 v7, 0x2

    .line 37
    if-ge v6, v7, :cond_0

    .line 38
    .line 39
    :try_start_3
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 40
    .line 41
    .line 42
    const/4 p1, -0x2

    .line 43
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 44
    .line 45
    .line 46
    return p1

    .line 47
    :catch_0
    move-exception p1

    .line 48
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :catch_1
    move-exception p1

    .line 58
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    return v2

    .line 67
    :cond_0
    :try_start_5
    aget-object v6, v3, v5

    .line 68
    .line 69
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-nez v6, :cond_2

    .line 74
    .line 75
    const/4 v6, 0x1

    .line 76
    aget-object v7, v3, v6

    .line 77
    .line 78
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-eqz v7, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget-object v7, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 86
    .line 87
    aget-object v5, v3, v5

    .line 88
    .line 89
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    aget-object v3, v3, v6

    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-interface {v7, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :catchall_0
    move-exception v3

    .line 104
    goto :goto_2

    .line 105
    :catch_2
    move-exception v3

    .line 106
    goto :goto_3

    .line 107
    :cond_2
    :goto_1
    :try_start_6
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 108
    .line 109
    .line 110
    const/4 p1, -0x3

    .line 111
    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 112
    .line 113
    .line 114
    return p1

    .line 115
    :catch_3
    move-exception p1

    .line 116
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 122
    .line 123
    .line 124
    return v2

    .line 125
    :catch_4
    move-exception p1

    .line 126
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 132
    .line 133
    .line 134
    return v2

    .line 135
    :cond_3
    :try_start_8
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 136
    .line 137
    .line 138
    :try_start_9
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 139
    .line 140
    .line 141
    return v5

    .line 142
    :catch_5
    move-exception p1

    .line 143
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 149
    .line 150
    .line 151
    return v2

    .line 152
    :catch_6
    move-exception p1

    .line 153
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 159
    .line 160
    .line 161
    return v2

    .line 162
    :goto_2
    move-object v8, v3

    .line 163
    move-object v3, p1

    .line 164
    move-object p1, v8

    .line 165
    goto :goto_9

    .line 166
    :goto_3
    move-object v8, v3

    .line 167
    move-object v3, p1

    .line 168
    move-object p1, v8

    .line 169
    goto :goto_6

    .line 170
    :catchall_1
    move-exception p1

    .line 171
    goto :goto_9

    .line 172
    :catch_7
    move-exception p1

    .line 173
    goto :goto_6

    .line 174
    :catchall_2
    move-exception p1

    .line 175
    goto :goto_4

    .line 176
    :catch_8
    move-exception p1

    .line 177
    goto :goto_5

    .line 178
    :goto_4
    move-object v4, v3

    .line 179
    goto :goto_9

    .line 180
    :goto_5
    move-object v4, v3

    .line 181
    :goto_6
    :try_start_a
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 182
    .line 183
    const-string v6, "get modle md5 to map error:"

    .line 184
    .line 185
    invoke-static {v5, v6, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 186
    .line 187
    .line 188
    if-eqz v3, :cond_4

    .line 189
    .line 190
    :try_start_b
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_9

    .line 191
    .line 192
    .line 193
    goto :goto_7

    .line 194
    :catch_9
    move-exception p1

    .line 195
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 201
    .line 202
    .line 203
    return v2

    .line 204
    :cond_4
    :goto_7
    if-eqz v4, :cond_5

    .line 205
    .line 206
    :try_start_c
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a

    .line 207
    .line 208
    .line 209
    goto :goto_8

    .line 210
    :catch_a
    move-exception p1

    .line 211
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {p0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 217
    .line 218
    .line 219
    :cond_5
    :goto_8
    return v2

    .line 220
    :goto_9
    if-eqz v3, :cond_6

    .line 221
    .line 222
    :try_start_d
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_b

    .line 223
    .line 224
    .line 225
    goto :goto_a

    .line 226
    :catch_b
    move-exception p1

    .line 227
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {p0, v0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 233
    .line 234
    .line 235
    return v2

    .line 236
    :cond_6
    :goto_a
    if-eqz v4, :cond_7

    .line 237
    .line 238
    :try_start_e
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_c

    .line 239
    .line 240
    .line 241
    goto :goto_b

    .line 242
    :catch_c
    move-exception p1

    .line 243
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 244
    .line 245
    invoke-static {p0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 249
    .line 250
    .line 251
    return v2

    .line 252
    :cond_7
    :goto_b
    throw p1
.end method

.method public static declared-synchronized openBuglyShared(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "BuglySdkInfos"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->getFrameworkVersion()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->huiYanVersion:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, "_"

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->huiYanVersion:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    const-string v2, "63a0c81546"

    .line 51
    .line 52
    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 53
    .line 54
    .line 55
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    monitor-exit v0

    .line 59
    return-void

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method public static native rotateYUVImage([BIII)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
.end method

.method private searchFiles(Ljava/io/File;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    array-length v0, p1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    array-length v0, p1

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_3

    .line 14
    .line 15
    aget-object v2, p1, v1

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-direct {p0, v2, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->searchFiles(Ljava/io/File;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v4, "files_md5"

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    return-void

    .line 51
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 52
    .line 53
    const-string p1, "dir is empty"

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    invoke-static {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static setHuiYanVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->huiYanVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method private traverseFolder(Ljava/io/File;)I
    .locals 5

    .line 1
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->searchFiles(Ljava/io/File;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 17
    .line 18
    const-string p1, "dir is empty"

    .line 19
    .line 20
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_4

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    add-int/2addr v3, v4

    .line 54
    add-int/lit8 v3, v3, 0x1

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_3

    .line 67
    .line 68
    new-instance v4, Ljava/io/File;

    .line 69
    .line 70
    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->getFileMD5(Ljava/io/File;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 84
    .line 85
    const-string p1, "create md5 by file is error,md5 is null"

    .line 86
    .line 87
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, -0x4

    .line 91
    return p0

    .line 92
    :cond_1
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 93
    .line 94
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-nez v4, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v4, "md5 validity by dir error,file name is "

    .line 111
    .line 112
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v4, "   target md5 is "

    .line 119
    .line 120
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 124
    .line 125
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    check-cast p0, Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p0, " cur md5 is "

    .line 135
    .line 136
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {p1, p0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 147
    .line 148
    .line 149
    const/4 p0, -0x2

    .line 150
    return p0

    .line 151
    :cond_2
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 152
    .line 153
    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_3
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 158
    .line 159
    const-string p1, "the file name not found md5 with md5 map\uff1a"

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {p0, p1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    const/4 p0, -0x3

    .line 169
    return p0

    .line 170
    :cond_4
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 171
    .line 172
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_6

    .line 177
    .line 178
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 179
    .line 180
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_5

    .line 193
    .line 194
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Ljava/lang/String;

    .line 199
    .line 200
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 201
    .line 202
    new-instance v3, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    const-string v4, "module file miss:"

    .line 205
    .line 206
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v4, " md5:"

    .line 213
    .line 214
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->moduleFileMd5Map:Ljava/util/Map;

    .line 218
    .line 219
    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    check-cast v0, Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v1, v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 233
    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_5
    const/4 p0, -0x5

    .line 237
    return p0

    .line 238
    :cond_6
    const/4 p0, 0x0

    .line 239
    return p0
.end method

.method public static native yuv2bgrImge([BIII)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
.end method

.method public static native yuvRotateAnd2bgrImge([BIIII)Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
.end method


# virtual methods
.method public md5ValidityByDir(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "module path :"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "md5 validity by dir error:NOT_FOUND_MODEL_DIR"

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 35
    .line 36
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 37
    .line 38
    invoke-static {p0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->NOT_FOUND_MODEL_DIR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, "files_md5"

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v1, Ljava/io/File;

    .line 62
    .line 63
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 73
    .line 74
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 75
    .line 76
    const-string p1, "md5 validity by dir error:NOT_FOUND_MODEL_MD5"

    .line 77
    .line 78
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->NOT_FOUND_MODEL_MD5:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_1
    invoke-direct {p0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->getModleMd5ToMap(Ljava/io/File;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 91
    .line 92
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 93
    .line 94
    const-string p1, "md5 validity by dir error:READ_MD5_ERROR"

    .line 95
    .line 96
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->READ_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_2
    invoke-direct {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->traverseFolder(Ljava/io/File;)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    const/4 v0, -0x1

    .line 107
    if-ne p1, v0, :cond_3

    .line 108
    .line 109
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 110
    .line 111
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 112
    .line 113
    invoke-static {p0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->NOT_FOUND_MODEL_DIR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_3
    const/4 v0, -0x2

    .line 120
    if-ne p1, v0, :cond_4

    .line 121
    .line 122
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 123
    .line 124
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 125
    .line 126
    const-string p1, "md5 validity by dir error:VALIDITY_ERROR"

    .line 127
    .line 128
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 129
    .line 130
    .line 131
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_4
    const/4 v0, -0x3

    .line 135
    if-ne p1, v0, :cond_5

    .line 136
    .line 137
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 138
    .line 139
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 140
    .line 141
    const-string p1, "md5 validity by dir error:TARGET_MD5_NOT_FOUND"

    .line 142
    .line 143
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->TARGET_MD5_NOT_FOUND:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 147
    .line 148
    return-object p0

    .line 149
    :cond_5
    const/4 v0, -0x4

    .line 150
    if-ne p1, v0, :cond_6

    .line 151
    .line 152
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 153
    .line 154
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 155
    .line 156
    const-string p1, "md5 validity by dir error:CREATE_MD5_ERROR"

    .line 157
    .line 158
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->CREATE_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 162
    .line 163
    return-object p0

    .line 164
    :cond_6
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;->TAG:Ljava/lang/String;

    .line 165
    .line 166
    const/4 v0, -0x5

    .line 167
    if-ne p1, v0, :cond_7

    .line 168
    .line 169
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 170
    .line 171
    const-string p1, "md5 validity by dir error:MODEL_FILE_MISS"

    .line 172
    .line 173
    invoke-static {p0, p1, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->MODEL_FILE_MISS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 177
    .line 178
    return-object p0

    .line 179
    :cond_7
    const-string p1, "md5 validity by dir ok"

    .line 180
    .line 181
    invoke-static {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    sget-object p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 185
    .line 186
    return-object p0
.end method
