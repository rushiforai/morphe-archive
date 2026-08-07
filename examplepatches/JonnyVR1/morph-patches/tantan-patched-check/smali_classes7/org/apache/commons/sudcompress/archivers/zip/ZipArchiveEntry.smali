.class public Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
.super Ljava/util/zip/ZipEntry;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;,
        Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
    }
.end annotation


# static fields
.field public static final CRC_UNKNOWN:I = -0x1

.field private static final EMPTY:[B

.field public static final PLATFORM_FAT:I = 0x0

.field public static final PLATFORM_UNIX:I = 0x3

.field private static final SHORT_MASK:I = 0xffff

.field private static final SHORT_SHIFT:I = 0x10

.field private static final noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# instance fields
.field private alignment:I

.field private commentSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

.field private dataOffset:J

.field private diskNumberStart:J

.field private externalAttributes:J

.field private extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

.field private gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

.field private internalAttributes:I

.field private isStreamContiguous:Z

.field private localHeaderOffset:J

.field private method:I

.field private name:Ljava/lang/String;

.field private nameSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

.field private platform:I

.field private rawFlag:I

.field private rawName:[B

.field private size:J

.field private unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

.field private versionMadeBy:I

.field private versionRequired:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    sput-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->EMPTY:[B

    .line 5
    .line 6
    new-array v0, v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 116
    const-string v0, ""

    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 2

    .line 117
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 118
    invoke-virtual {p2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 119
    :cond_0
    invoke-direct {p0, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 121
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 122
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/util/zip/ZipEntry;->setTime(J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 91
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 92
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->method:I

    const-wide/16 v0, -0x1

    .line 93
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->size:J

    const/4 v2, 0x0

    .line 94
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 95
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    const-wide/16 v3, 0x0

    .line 96
    iput-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 97
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->alignment:I

    const/4 v3, 0x0

    .line 98
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 99
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 100
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 101
    new-instance v3, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    invoke-direct {v3}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 102
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 103
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 104
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isStreamContiguous:Z

    .line 105
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;->NAME:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->nameSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 106
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;->COMMENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->commentSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 107
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/zip/ZipEntry;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->method:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->size:J

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 13
    .line 14
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 15
    .line 16
    const-wide/16 v3, 0x0

    .line 17
    .line 18
    iput-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 19
    .line 20
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->alignment:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 24
    .line 25
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 28
    .line 29
    new-instance v3, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 30
    .line 31
    invoke-direct {v3}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 35
    .line 36
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 37
    .line 38
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 39
    .line 40
    iput-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isStreamContiguous:Z

    .line 41
    .line 42
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;->NAME:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 43
    .line 44
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->nameSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 45
    .line 46
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;->COMMENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 47
    .line 48
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->commentSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getExtra()[B

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-static {v0, v2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->size:J

    .line 89
    .line 90
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 2

    .line 108
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 109
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setInternalAttributes(I)V

    .line 110
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 111
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 112
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 113
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 115
    :goto_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;)V

    return-void
.end method

.method private copyOf([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 1
    new-array p0, p2, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, v0, p0, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method private findMatching(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;Ljava/util/List;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;",
            "Ljava/util/List<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;",
            ">;)",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 16
    .line 17
    invoke-interface {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    return-object p2

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method private findUnparseable(Ljava/util/List;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;",
            ">;)",
            "Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 16
    .line 17
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method private getAllExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    return-object v0
.end method

.method private getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getUnparseableOnly()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMergedFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    return-object v0
.end method

.method private getMergedFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    add-int/lit8 v1, v1, 0x1

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 11
    .line 12
    array-length v1, v1

    .line 13
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 14
    .line 15
    aput-object p0, v0, v1

    .line 16
    .line 17
    return-object v0
.end method

.method private getParseableExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getParseableExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    return-object v0
.end method

.method private getParseableExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method private getUnparseableOnly()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    new-array v0, v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aput-object p0, v0, v1

    .line 13
    .line 14
    return-object v0
.end method

.method private mergeExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    array-length v0, p1

    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    if-ge v2, v0, :cond_6

    .line 13
    .line 14
    aget-object v3, p1, v2

    .line 15
    .line 16
    instance-of v4, v3, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-interface {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {p0, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    :goto_1
    if-nez v4, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 34
    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_2
    if-eqz p2, :cond_3

    .line 38
    .line 39
    invoke-interface {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    goto :goto_2

    .line 44
    :cond_3
    invoke-interface {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    :goto_2
    if-eqz p2, :cond_4

    .line 49
    .line 50
    :try_start_0
    array-length v5, v3

    .line 51
    invoke-interface {v4, v3, v1, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    .line 52
    .line 53
    .line 54
    goto :goto_4

    .line 55
    :cond_4
    array-length v5, v3

    .line 56
    invoke-interface {v4, v3, v1, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->parseFromCentralDirectoryData([BII)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    goto :goto_4

    .line 60
    :catch_0
    new-instance v5, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;

    .line 61
    .line 62
    invoke-direct {v5}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-interface {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v5, v6}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 70
    .line 71
    .line 72
    if-eqz p2, :cond_5

    .line 73
    .line 74
    invoke-virtual {v5, v3}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setLocalFileDataData([B)V

    .line 75
    .line 76
    .line 77
    invoke-interface {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v5, v3}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setCentralDirectoryData([B)V

    .line 82
    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_5
    invoke-interface {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v5, v6}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setLocalFileDataData([B)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, v3}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setCentralDirectoryData([B)V

    .line 93
    .line 94
    .line 95
    :goto_3
    invoke-interface {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 103
    .line 104
    .line 105
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 109
    .line 110
    .line 111
    return-void
.end method


# virtual methods
.method public addAsFirstExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V
    .locals 5

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 6
    .line 7
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    array-length v2, v0

    .line 33
    add-int/2addr v2, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    move v2, v1

    .line 36
    :goto_0
    new-array v3, v2, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 37
    .line 38
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aput-object p1, v3, v4

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    sub-int/2addr v2, v1

    .line 46
    invoke-static {v0, v4, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public addExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 6
    .line 7
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-array v0, v1, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    aput-object p1, v0, v1

    .line 19
    .line 20
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-interface {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 41
    .line 42
    array-length v2, v0

    .line 43
    add-int/2addr v2, v1

    .line 44
    invoke-direct {p0, v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    array-length v2, v0

    .line 49
    sub-int/2addr v2, v1

    .line 50
    aput-object p1, v0, v2

    .line 51
    .line 52
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 53
    .line 54
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setInternalAttributes(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_6

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_1
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-nez v2, :cond_2

    .line 31
    .line 32
    if-eqz v3, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_3

    .line 40
    .line 41
    return v1

    .line 42
    :cond_3
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-string v4, ""

    .line 51
    .line 52
    if-nez v2, :cond_4

    .line 53
    .line 54
    move-object v2, v4

    .line 55
    :cond_4
    if-nez v3, :cond_5

    .line 56
    .line 57
    move-object v3, v4

    .line 58
    :cond_5
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v4

    .line 62
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 63
    .line 64
    .line 65
    move-result-wide v6

    .line 66
    cmp-long v4, v4, v6

    .line 67
    .line 68
    if-nez v4, :cond_6

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_6

    .line 75
    .line 76
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-ne v2, v3, :cond_6

    .line 85
    .line 86
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-ne v2, v3, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    cmp-long v2, v2, v4

    .line 105
    .line 106
    if-nez v2, :cond_6

    .line 107
    .line 108
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-ne v2, v3, :cond_6

    .line 117
    .line 118
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getSize()J

    .line 123
    .line 124
    .line 125
    move-result-wide v4

    .line 126
    cmp-long v2, v2, v4

    .line 127
    .line 128
    if-nez v2, :cond_6

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 131
    .line 132
    .line 133
    move-result-wide v2

    .line 134
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCrc()J

    .line 135
    .line 136
    .line 137
    move-result-wide v4

    .line 138
    cmp-long v2, v2, v4

    .line 139
    .line 140
    if-nez v2, :cond_6

    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 143
    .line 144
    .line 145
    move-result-wide v2

    .line 146
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    .line 147
    .line 148
    .line 149
    move-result-wide v4

    .line 150
    cmp-long v2, v2, v4

    .line 151
    .line 152
    if-nez v2, :cond_6

    .line 153
    .line 154
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_6

    .line 167
    .line 168
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-eqz v2, :cond_6

    .line 181
    .line 182
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 183
    .line 184
    iget-wide v4, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 185
    .line 186
    cmp-long v2, v2, v4

    .line 187
    .line 188
    if-nez v2, :cond_6

    .line 189
    .line 190
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 191
    .line 192
    iget-wide v4, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 193
    .line 194
    cmp-long v2, v2, v4

    .line 195
    .line 196
    if-nez v2, :cond_6

    .line 197
    .line 198
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 199
    .line 200
    iget-object p1, p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 201
    .line 202
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    if-eqz p0, :cond_6

    .line 207
    .line 208
    return v0

    .line 209
    :cond_6
    :goto_0
    return v1
.end method

.method public getAlignment()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->alignment:I

    .line 2
    .line 3
    return p0
.end method

.method public getCentralDirectoryExtra()[B
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->mergeCentralDirectoryData([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCommentSource()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->commentSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataOffset()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDiskNumberStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->diskNumberStart:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getExternalAttributes()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 4

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_1

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    invoke-interface {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    return-object v2

    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public getExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 128
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getParseableExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method public getExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 9

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraFields(Z)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->ONLY_PARSEABLE_LENIENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraFields(Z)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getExtra()[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-static {v0, v1, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-static {v0, v2, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 53
    .line 54
    .line 55
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    move v4, v2

    .line 65
    :goto_0
    if-ge v4, v0, :cond_5

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    add-int/lit8 v4, v4, 0x1

    .line 72
    .line 73
    check-cast v5, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 74
    .line 75
    instance-of v6, v5, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 76
    .line 77
    if-eqz v6, :cond_2

    .line 78
    .line 79
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->findUnparseable(Ljava/util/List;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-interface {v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-direct {p0, v6, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->findMatching(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;Ljava/util/List;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    :goto_1
    if-eqz v6, :cond_4

    .line 93
    .line 94
    invoke-interface {v6}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    if-eqz v7, :cond_3

    .line 99
    .line 100
    array-length v8, v7

    .line 101
    if-lez v8, :cond_3

    .line 102
    .line 103
    array-length v8, v7

    .line 104
    invoke-interface {v5, v7, v2, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->parseFromCentralDirectoryData([BII)V

    .line 105
    .line 106
    .line 107
    :cond_3
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_4
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 118
    .line 119
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 124
    .line 125
    return-object p0
.end method

.method public getExtraFields(Z)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    if-eqz p1, :cond_0

    .line 126
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0

    .line 127
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getParseableExtraFields()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method public getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInternalAttributes()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 2
    .line 3
    return p0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getLocalFileDataExtra()[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getExtra()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->EMPTY:[B

    .line 9
    .line 10
    return-object p0
.end method

.method public getLocalHeaderOffset()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMethod()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->method:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object v0
.end method

.method public getNameSource()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->nameSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlatform()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 2
    .line 3
    return p0
.end method

.method public getRawFlag()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawFlag:I

    .line 2
    .line 3
    return p0
.end method

.method public getRawName()[B
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public getSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUnixMode()I
    .locals 4

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const/16 p0, 0x10

    .line 13
    .line 14
    shr-long/2addr v0, p0

    .line 15
    const-wide/32 v2, 0xffff

    .line 16
    .line 17
    .line 18
    and-long/2addr v0, v2

    .line 19
    long-to-int p0, v0

    .line 20
    return p0
.end method

.method public getUnparseableExtraFieldData()Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersionMadeBy()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->versionMadeBy:I

    .line 2
    .line 3
    return p0
.end method

.method public getVersionRequired()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->versionRequired:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isDirectory()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string v0, "/"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public isStreamContiguous()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isStreamContiguous:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUnixSymlink()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getUnixMode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, 0xf000

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, v0

    .line 9
    const v0, 0xa000

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public removeExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 11
    .line 12
    array-length v2, v1

    .line 13
    const/4 v3, 0x0

    .line 14
    :goto_0
    if-ge v3, v2, :cond_1

    .line 15
    .line 16
    aget-object v4, v1, v3

    .line 17
    .line 18
    invoke-interface {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-virtual {p1, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    if-nez v5, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 35
    .line 36
    array-length p1, p1

    .line 37
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eq p1, v1, :cond_2

    .line 42
    .line 43
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 50
    .line 51
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 52
    .line 53
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    invoke-static {}, Ll/mor;->a()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    invoke-static {}, Ll/mor;->a()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public removeUnparseableExtraFieldData()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setAlignment(I)V
    .locals 1

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    and-int/2addr v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const v0, 0xffff

    .line 7
    .line 8
    .line 9
    if-gt p1, v0, :cond_0

    .line 10
    .line 11
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->alignment:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Invalid value for alignment, must be power of two and no bigger than 65535 but is "

    .line 15
    .line 16
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setCentralDirectoryExtra([B)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p1, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0, p1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->mergeExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;Z)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setCommentSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->commentSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 2
    .line 3
    return-void
.end method

.method public setDataOffset(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->dataOffset:J

    .line 2
    .line 3
    return-void
.end method

.method public setDiskNumberStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->diskNumberStart:J

    .line 2
    .line 3
    return-void
.end method

.method public setExternalAttributes(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 2
    .line 3
    return-void
.end method

.method public setExtra()V
    .locals 1

    .line 49
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->mergeLocalFileDataData([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)[B

    move-result-object v0

    invoke-super {p0, v0}, Ljava/util/zip/ZipEntry;->setExtra([B)V

    return-void
.end method

.method public setExtra([B)V
    .locals 4

    .line 1
    :try_start_0
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {p1, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;)[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0, p1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->mergeExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;Z)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p1

    .line 13
    new-instance v0, Ljava/lang/RuntimeException;

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v3, "Error parsing extra fields for entry: "

    .line 26
    .line 27
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, " - "

    .line 34
    .line 35
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-direct {v0, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    throw v0
.end method

.method public setExtraFields([Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_1

    .line 14
    .line 15
    aget-object v3, p1, v2

    .line 16
    .line 17
    instance-of v4, v3, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 18
    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    check-cast v3, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 22
    .line 23
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, [Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 39
    .line 40
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 41
    .line 42
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setGeneralPurposeBit(Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    return-void
.end method

.method public setInternalAttributes(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 2
    .line 3
    return-void
.end method

.method public setLocalHeaderOffset(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->localHeaderOffset:J

    .line 2
    .line 3
    return-void
.end method

.method public setMethod(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->method:I

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "ZIP compression method can not be negative: "

    .line 7
    .line 8
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "/"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/16 v0, 0x5c

    .line 18
    .line 19
    const/16 v1, 0x2f

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public setName(Ljava/lang/String;[B)V
    .locals 0

    .line 28
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 29
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawName:[B

    return-void
.end method

.method public setNameSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->nameSource:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 2
    .line 3
    return-void
.end method

.method public setPlatform(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 2
    .line 3
    return-void
.end method

.method public setRawFlag(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->rawFlag:I

    .line 2
    .line 3
    return-void
.end method

.method public setSize(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->size:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "Invalid entry size"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setStreamContiguous(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isStreamContiguous:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUnixMode(I)V
    .locals 2

    .line 1
    shl-int/lit8 v0, p1, 0x10

    .line 2
    .line 3
    and-int/lit16 p1, p1, 0x80

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p1, v1

    .line 11
    :goto_0
    or-int/2addr p1, v0

    .line 12
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->isDirectory()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    :cond_1
    or-int/2addr p1, v1

    .line 21
    int-to-long v0, p1

    .line 22
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 27
    .line 28
    return-void
.end method

.method public setVersionMadeBy(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->versionMadeBy:I

    .line 2
    .line 3
    return-void
.end method

.method public setVersionRequired(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->versionRequired:I

    .line 2
    .line 3
    return-void
.end method
