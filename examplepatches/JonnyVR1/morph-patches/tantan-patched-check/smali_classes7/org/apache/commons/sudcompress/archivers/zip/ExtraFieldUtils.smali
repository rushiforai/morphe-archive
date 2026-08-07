.class public Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;
    }
.end annotation


# static fields
.field private static final WORD:I = 0x4

.field private static final implementations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    .line 7
    .line 8
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/AsiExtraField;

    .line 9
    .line 10
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 11
    .line 12
    .line 13
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;

    .line 14
    .line 15
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 16
    .line 17
    .line 18
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;

    .line 19
    .line 20
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 21
    .line 22
    .line 23
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/JarMarker;

    .line 24
    .line 25
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 26
    .line 27
    .line 28
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;

    .line 29
    .line 30
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;

    .line 34
    .line 35
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 36
    .line 37
    .line 38
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;

    .line 39
    .line 40
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 41
    .line 42
    .line 43
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;

    .line 44
    .line 45
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 46
    .line 47
    .line 48
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X0014_X509Certificates;

    .line 49
    .line 50
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 51
    .line 52
    .line 53
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X0015_CertificateIdForFile;

    .line 54
    .line 55
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 56
    .line 57
    .line 58
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X0016_CertificateIdForCentralDirectory;

    .line 59
    .line 60
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 61
    .line 62
    .line 63
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;

    .line 64
    .line 65
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 66
    .line 67
    .line 68
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/X0019_EncryptionRecipientCertificateList;

    .line 69
    .line 70
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 71
    .line 72
    .line 73
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;

    .line 74
    .line 75
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->register(Ljava/lang/Class;)V

    .line 76
    .line 77
    .line 78
    return-void
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

.method public static createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->createExtraFieldNoDefault(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static createExtraFieldNoDefault(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Class;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public static fillExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    .line 4
    .line 5
    .line 6
    return-object p0

    .line 7
    :catch_0
    move-exception p1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->parseFromCentralDirectoryData([BII)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :goto_0
    new-instance p2, Ljava/util/zip/ZipException;

    .line 14
    .line 15
    new-instance p3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p4, "Failed to parse corrupt ZIP extra field of type "

    .line 18
    .line 19
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {p2, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Ljava/util/zip/ZipException;

    .line 49
    .line 50
    throw p0
.end method

.method public static mergeCentralDirectoryData([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)[B
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    sub-int/2addr v0, v1

    .line 8
    aget-object v0, p0, v0

    .line 9
    .line 10
    instance-of v0, v0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    if-eqz v0, :cond_1

    .line 18
    .line 19
    array-length v3, p0

    .line 20
    sub-int/2addr v3, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    array-length v3, p0

    .line 23
    :goto_1
    mul-int/lit8 v4, v3, 0x4

    .line 24
    .line 25
    array-length v5, p0

    .line 26
    move v6, v2

    .line 27
    :goto_2
    if-ge v6, v5, :cond_2

    .line 28
    .line 29
    aget-object v7, p0, v6

    .line 30
    .line 31
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    add-int/2addr v4, v7

    .line 40
    add-int/lit8 v6, v6, 0x1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    new-array v4, v4, [B

    .line 44
    .line 45
    move v5, v2

    .line 46
    move v6, v5

    .line 47
    :goto_3
    if-ge v5, v3, :cond_4

    .line 48
    .line 49
    aget-object v7, p0, v5

    .line 50
    .line 51
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const/4 v8, 0x2

    .line 60
    invoke-static {v7, v2, v4, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    aget-object v7, p0, v5

    .line 64
    .line 65
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    add-int/lit8 v9, v6, 0x2

    .line 74
    .line 75
    invoke-static {v7, v2, v4, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v6, v6, 0x4

    .line 79
    .line 80
    aget-object v7, p0, v5

    .line 81
    .line 82
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    if-eqz v7, :cond_3

    .line 87
    .line 88
    array-length v8, v7

    .line 89
    invoke-static {v7, v2, v4, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    .line 91
    .line 92
    array-length v7, v7

    .line 93
    add-int/2addr v6, v7

    .line 94
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    if-eqz v0, :cond_5

    .line 98
    .line 99
    array-length v0, p0

    .line 100
    sub-int/2addr v0, v1

    .line 101
    aget-object p0, p0, v0

    .line 102
    .line 103
    invoke-interface {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    if-eqz p0, :cond_5

    .line 108
    .line 109
    array-length v0, p0

    .line 110
    invoke-static {p0, v2, v4, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    .line 112
    .line 113
    :cond_5
    return-object v4
.end method

.method public static mergeLocalFileDataData([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)[B
    .locals 10

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    sub-int/2addr v0, v1

    .line 8
    aget-object v0, p0, v0

    .line 9
    .line 10
    instance-of v0, v0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    if-eqz v0, :cond_1

    .line 18
    .line 19
    array-length v3, p0

    .line 20
    sub-int/2addr v3, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    array-length v3, p0

    .line 23
    :goto_1
    mul-int/lit8 v4, v3, 0x4

    .line 24
    .line 25
    array-length v5, p0

    .line 26
    move v6, v2

    .line 27
    :goto_2
    if-ge v6, v5, :cond_2

    .line 28
    .line 29
    aget-object v7, p0, v6

    .line 30
    .line 31
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    add-int/2addr v4, v7

    .line 40
    add-int/lit8 v6, v6, 0x1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    new-array v4, v4, [B

    .line 44
    .line 45
    move v5, v2

    .line 46
    move v6, v5

    .line 47
    :goto_3
    if-ge v5, v3, :cond_4

    .line 48
    .line 49
    aget-object v7, p0, v5

    .line 50
    .line 51
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const/4 v8, 0x2

    .line 60
    invoke-static {v7, v2, v4, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    aget-object v7, p0, v5

    .line 64
    .line 65
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-virtual {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    add-int/lit8 v9, v6, 0x2

    .line 74
    .line 75
    invoke-static {v7, v2, v4, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v6, v6, 0x4

    .line 79
    .line 80
    aget-object v7, p0, v5

    .line 81
    .line 82
    invoke-interface {v7}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    if-eqz v7, :cond_3

    .line 87
    .line 88
    array-length v8, v7

    .line 89
    invoke-static {v7, v2, v4, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    .line 91
    .line 92
    array-length v7, v7

    .line 93
    add-int/2addr v6, v7

    .line 94
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    if-eqz v0, :cond_5

    .line 98
    .line 99
    array-length v0, p0

    .line 100
    sub-int/2addr v0, v1

    .line 101
    aget-object p0, p0, v0

    .line 102
    .line 103
    invoke-interface {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    if-eqz p0, :cond_5

    .line 108
    .line 109
    array-length v0, p0

    .line 110
    invoke-static {p0, v2, v4, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    .line 112
    .line 113
    :cond_5
    return-object v4
.end method

.method public static parse([B)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 132
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method public static parse([BZ)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 130
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method public static parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 11

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v4, v1

    .line 8
    :goto_0
    array-length v1, p0

    .line 9
    add-int/lit8 v1, v1, -0x4

    .line 10
    .line 11
    if-gt v4, v1, :cond_1

    .line 12
    .line 13
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 14
    .line 15
    invoke-direct {v1, p0, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>([BI)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 19
    .line 20
    add-int/lit8 v3, v4, 0x2

    .line 21
    .line 22
    invoke-direct {v2, p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>([BI)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    add-int/lit8 v8, v4, 0x4

    .line 30
    .line 31
    add-int v2, v8, v7

    .line 32
    .line 33
    array-length v3, p0

    .line 34
    if-le v2, v3, :cond_0

    .line 35
    .line 36
    array-length v1, p0

    .line 37
    sub-int v5, v1, v4

    .line 38
    .line 39
    move-object v3, p0

    .line 40
    move v6, p1

    .line 41
    move-object v2, p2

    .line 42
    invoke-interface/range {v2 .. v7}, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldBehavior;->onUnparseableExtraField([BIIZI)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_0
    move-object v3, p0

    .line 53
    move v6, p1

    .line 54
    move-object v2, p2

    .line 55
    :try_start_0
    invoke-interface {v2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;->createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "createExtraField must not return null"

    .line 60
    .line 61
    invoke-static {p0, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 65
    .line 66
    move-object v5, v2

    .line 67
    move v10, v6

    .line 68
    move v9, v7

    .line 69
    move-object v6, p0

    .line 70
    move-object v7, v3

    .line 71
    invoke-interface/range {v5 .. v10}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;->fill(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    move-object v2, v5

    .line 76
    move-object v3, v7

    .line 77
    move v7, v9

    .line 78
    move v6, v10

    .line 79
    const-string p1, "fill must not return null"

    .line 80
    .line 81
    invoke-static {p0, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    add-int/lit8 v7, v7, 0x4

    .line 90
    .line 91
    add-int/2addr v4, v7

    .line 92
    move-object p2, v2

    .line 93
    move-object p0, v3

    .line 94
    move p1, v6

    .line 95
    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    :goto_1
    move-object p0, v0

    .line 98
    goto :goto_2

    .line 99
    :catch_1
    move-exception v0

    .line 100
    goto :goto_1

    .line 101
    :goto_2
    new-instance p1, Ljava/util/zip/ZipException;

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-direct {p1, p2}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    check-cast p0, Ljava/util/zip/ZipException;

    .line 115
    .line 116
    throw p0

    .line 117
    :cond_1
    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    new-array p0, p0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 122
    .line 123
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 128
    .line 129
    return-object p0
.end method

.method public static parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 131
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$1;

    invoke-direct {v0, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$1;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    invoke-static {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method public static register(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->implementations:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "\'s no-arg constructor is not public"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw v0

    .line 40
    :catch_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 41
    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, " is not a concrete class"

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw v0

    .line 63
    :catch_2
    new-instance v0, Ljava/lang/RuntimeException;

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p0, " doesn\'t implement ZipExtraField"

    .line 74
    .line 75
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw v0
.end method
