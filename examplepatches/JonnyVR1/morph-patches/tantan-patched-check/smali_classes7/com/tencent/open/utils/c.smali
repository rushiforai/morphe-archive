.class public final Lcom/tencent/open/utils/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/open/utils/c$a;
    }
.end annotation


# static fields
.field private static final a:Lcom/tencent/open/utils/o;

.field private static final b:Lcom/tencent/open/utils/p;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/open/utils/o;

    .line 2
    .line 3
    const-wide/32 v1, 0x6054b50

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1, v2}, Lcom/tencent/open/utils/o;-><init>(J)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/tencent/open/utils/c;->a:Lcom/tencent/open/utils/o;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/open/utils/p;

    .line 12
    .line 13
    const v1, 0x96fb

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/tencent/open/utils/p;-><init>(I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/tencent/open/utils/c;->b:Lcom/tencent/open/utils/p;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a()Lcom/tencent/open/utils/p;
    .locals 1

    .line 114
    sget-object v0, Lcom/tencent/open/utils/c;->b:Lcom/tencent/open/utils/p;

    return-object v0
.end method

.method public static a(Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    const-string v0, "channelNo"

    invoke-static {p0, v0}, Lcom/tencent/open/utils/c;->a(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 105
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 106
    :try_start_1
    invoke-static {v1}, Lcom/tencent/open/utils/c;->a(Ljava/io/RandomAccessFile;)[B

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p0, :cond_0

    .line 107
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    return-object v0

    .line 108
    :cond_0
    :try_start_2
    new-instance v2, Lcom/tencent/open/utils/c$a;

    invoke-direct {v2, v0}, Lcom/tencent/open/utils/c$a;-><init>(Lcom/tencent/open/utils/c$1;)V

    .line 109
    invoke-virtual {v2, p0}, Lcom/tencent/open/utils/c$a;->a([B)V

    .line 110
    iget-object p0, v2, Lcom/tencent/open/utils/c$a;->a:Ljava/util/Properties;

    invoke-virtual {p0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    return-object p0

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 112
    :cond_1
    throw p0
.end method

.method private static a(Ljava/io/RandomAccessFile;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->length()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x16

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 9
    .line 10
    .line 11
    sget-object v2, Lcom/tencent/open/utils/c;->a:Lcom/tencent/open/utils/o;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/tencent/open/utils/o;->a()[B

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->read()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    :goto_0
    const/4 v4, -0x1

    .line 22
    if-eq v3, v4, :cond_2

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aget-byte v4, v2, v4

    .line 26
    .line 27
    if-ne v3, v4, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->read()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x1

    .line 34
    aget-byte v4, v2, v4

    .line 35
    .line 36
    if-ne v3, v4, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->read()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const/4 v4, 0x2

    .line 43
    aget-byte v5, v2, v4

    .line 44
    .line 45
    if-ne v3, v5, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->read()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const/4 v5, 0x3

    .line 52
    aget-byte v5, v2, v5

    .line 53
    .line 54
    if-ne v3, v5, :cond_1

    .line 55
    .line 56
    const-wide/16 v2, 0x14

    .line 57
    .line 58
    add-long/2addr v0, v2

    .line 59
    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 60
    .line 61
    .line 62
    new-array v0, v4, [B

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Lcom/tencent/open/utils/p;

    .line 68
    .line 69
    invoke-direct {v1, v0}, Lcom/tencent/open/utils/p;-><init>([B)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tencent/open/utils/p;->b()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_0

    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    return-object p0

    .line 80
    :cond_0
    new-array v0, v0, [B

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ljava/io/RandomAccessFile;->read([B)I

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_1
    const-wide/16 v3, 0x1

    .line 87
    .line 88
    sub-long/2addr v0, v3

    .line 89
    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->read()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    new-instance p0, Ljava/util/zip/ZipException;

    .line 98
    .line 99
    const-string v0, "archive is not a ZIP archive"

    .line 100
    .line 101
    invoke-direct {p0, v0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p0
.end method
