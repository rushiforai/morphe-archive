.class Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/mm/mmfile/core/IByteDecompress;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/MMFileDecompress;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ByteDecompressImpl"
.end annotation


# instance fields
.field private index:J

.field private mFileOutputStream:Ljava/io/FileOutputStream;

.field private final mFilePath:Ljava/lang/String;

.field private final mMaxOutFileLength:J

.field private final mOutDir:Ljava/lang/String;

.field private mTraversLength:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFilePath:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mOutDir:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mMaxOutFileLength:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onDecompressError(I)V
    .locals 0

    return-void
.end method

.method public onMemoryExtension(J)V
    .locals 0

    return-void
.end method

.method public traverse([B)V
    .locals 10

    .line 1
    const-string v0, "_"

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    array-length v1, p1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_3

    .line 9
    .line 10
    :cond_0
    iget-object v1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    .line 17
    .line 18
    new-instance v4, Ljava/io/File;

    .line 19
    .line 20
    iget-object v5, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mOutDir:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v6, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v7, Ljava/io/File;

    .line 28
    .line 29
    iget-object v8, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFilePath:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-wide v7, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->index:J

    .line 42
    .line 43
    cmp-long v7, v7, v2

    .line 44
    .line 45
    if-nez v7, :cond_1

    .line 46
    .line 47
    const-string v0, ""

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-wide v8, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->index:J

    .line 58
    .line 59
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_0
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, ".log"

    .line 70
    .line 71
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-direct {v1, v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 83
    .line 84
    .line 85
    iput-object v1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 92
    .line 93
    if-nez v0, :cond_3

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_3
    :try_start_1
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 97
    .line 98
    .line 99
    iget-wide v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mTraversLength:J

    .line 100
    .line 101
    array-length p1, p1

    .line 102
    int-to-long v4, p1

    .line 103
    add-long/2addr v0, v4

    .line 104
    iput-wide v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mTraversLength:J

    .line 105
    .line 106
    iget-wide v4, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mMaxOutFileLength:J

    .line 107
    .line 108
    cmp-long p1, v4, v2

    .line 109
    .line 110
    if-lez p1, :cond_4

    .line 111
    .line 112
    cmp-long p1, v0, v4

    .line 113
    .line 114
    if-lez p1, :cond_4

    .line 115
    .line 116
    iget-object p1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 122
    .line 123
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 124
    .line 125
    .line 126
    const/4 p1, 0x0

    .line 127
    iput-object p1, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->mFileOutputStream:Ljava/io/FileOutputStream;

    .line 128
    .line 129
    iget-wide v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->index:J

    .line 130
    .line 131
    const-wide/16 v2, 0x1

    .line 132
    .line 133
    add-long/2addr v0, v2

    .line 134
    iput-wide v0, p0, Lcom/mm/mmfile/MMFileDecompress$ByteDecompressImpl;->index:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :catch_1
    move-exception p0

    .line 138
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 139
    .line 140
    .line 141
    :cond_4
    :goto_3
    return-void
.end method
