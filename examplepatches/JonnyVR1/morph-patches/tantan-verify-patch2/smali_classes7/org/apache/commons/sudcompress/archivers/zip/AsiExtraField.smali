.class public Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
.implements Lorg/apache/commons/sudcompress/archivers/zip/UnixStat;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final WORD:I = 0x4


# instance fields
.field private crc:Ljava/util/zip/CRC32;

.field private dirFlag:Z

.field private gid:I

.field private link:Ljava/lang/String;

.field private mode:I

.field private uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0x756e

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 6
    .line 7
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->uid:I

    .line 8
    .line 9
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->gid:I

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->dirFlag:Z

    .line 16
    .line 17
    new-instance v0, Ljava/util/zip/CRC32;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;

    .line 6
    .line 7
    new-instance v0, Ljava/util/zip/CRC32;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-object p0

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public getCentralDirectoryData()[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLocalFileDataData()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getGroupId()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->gid:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLinkedFile()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 9

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v1, v0, -0x4

    .line 10
    .line 11
    new-array v2, v1, [B

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getMode()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x2

    .line 23
    invoke-static {v3, v4, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    array-length v6, v3

    .line 35
    int-to-long v6, v6

    .line 36
    invoke-static {v6, v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    const/4 v7, 0x4

    .line 41
    invoke-static {v6, v4, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getUserId()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    invoke-static {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    const/4 v8, 0x6

    .line 53
    invoke-static {v6, v4, v2, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getGroupId()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-static {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const/16 v8, 0x8

    .line 65
    .line 66
    invoke-static {v6, v4, v2, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    array-length v5, v3

    .line 70
    const/16 v6, 0xa

    .line 71
    .line 72
    invoke-static {v3, v4, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 81
    .line 82
    invoke-virtual {v3, v2}, Ljava/util/zip/CRC32;->update([B)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/util/zip/CRC32;->getValue()J

    .line 88
    .line 89
    .line 90
    move-result-wide v5

    .line 91
    new-array p0, v0, [B

    .line 92
    .line 93
    invoke-static {v5, v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0, v4, p0, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    .line 99
    .line 100
    invoke-static {v2, v4, p0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    .line 102
    .line 103
    return-object p0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    array-length p0, p0

    .line 12
    add-int/lit8 p0, p0, 0xe

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public getMode()I
    .locals 0

    .line 27
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    return p0
.end method

.method public getMode(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->isLink()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const p0, 0xa000

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->isDirectory()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/16 p0, 0x4000

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const p0, 0x8000

    .line 21
    .line 22
    .line 23
    :goto_0
    and-int/lit16 p1, p1, 0xfff

    .line 24
    .line 25
    or-int/2addr p0, p1

    .line 26
    return p0
.end method

.method public getUserId()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->uid:I

    .line 2
    .line 3
    return p0
.end method

.method public isDirectory()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->dirFlag:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->isLink()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isLink()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getLinkedFile()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->parseFromLocalFileData([BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 5

    .line 1
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-int/lit8 v2, p3, -0x4

    .line 6
    .line 7
    new-array v3, v2, [B

    .line 8
    .line 9
    add-int/lit8 p2, p2, 0x4

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-static {p1, p2, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/zip/CRC32;->reset()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 21
    .line 22
    invoke-virtual {p1, v3}, Ljava/util/zip/CRC32;->update([B)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->crc:Ljava/util/zip/CRC32;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/zip/CRC32;->getValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide p1

    .line 31
    cmp-long v2, v0, p1

    .line 32
    .line 33
    if-nez v2, :cond_3

    .line 34
    .line 35
    invoke-static {v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/4 p2, 0x2

    .line 40
    invoke-static {v3, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    long-to-int p2, v0

    .line 45
    new-array v0, p2, [B

    .line 46
    .line 47
    const/4 v1, 0x6

    .line 48
    invoke-static {v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->uid:I

    .line 53
    .line 54
    const/16 v1, 0x8

    .line 55
    .line 56
    invoke-static {v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->gid:I

    .line 61
    .line 62
    if-nez p2, :cond_0

    .line 63
    .line 64
    const-string p2, ""

    .line 65
    .line 66
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    add-int/lit8 p3, p3, -0xe

    .line 70
    .line 71
    if-gt p2, p3, :cond_2

    .line 72
    .line 73
    const/16 p3, 0xa

    .line 74
    .line 75
    invoke-static {v3, p3, v0, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    new-instance p2, Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {p2, v0}, Ljava/lang/String;-><init>([B)V

    .line 81
    .line 82
    .line 83
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 84
    .line 85
    :goto_0
    and-int/lit16 p2, p1, 0x4000

    .line 86
    .line 87
    if-eqz p2, :cond_1

    .line 88
    .line 89
    const/4 v4, 0x1

    .line 90
    :cond_1
    invoke-virtual {p0, v4}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->setDirectory(Z)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->setMode(I)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    const-string p0, "Bad symbolic link name length "

    .line 98
    .line 99
    const-string p1, " in ASI extra field"

    .line 100
    .line 101
    invoke-static {p0, p2, p1}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    new-instance p0, Ljava/util/zip/ZipException;

    .line 106
    .line 107
    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance p2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v0, "Bad CRC checksum, expected "

    .line 118
    .line 119
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p3, " instead of "

    .line 126
    .line 127
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p0
.end method

.method public setDirectory(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->dirFlag:Z

    .line 2
    .line 3
    iget p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 10
    .line 11
    return-void
.end method

.method public setGroupId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->gid:I

    .line 2
    .line 3
    return-void
.end method

.method public setLinkedFile(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->link:Ljava/lang/String;

    .line 2
    .line 3
    iget p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 10
    .line 11
    return-void
.end method

.method public setMode(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->mode:I

    .line 6
    .line 7
    return-void
.end method

.method public setUserId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;->uid:I

    .line 2
    .line 3
    return-void
.end method
