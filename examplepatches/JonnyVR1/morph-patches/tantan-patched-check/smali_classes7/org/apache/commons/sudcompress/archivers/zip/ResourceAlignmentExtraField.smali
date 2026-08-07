.class public Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# static fields
.field private static final ALLOW_METHOD_MESSAGE_CHANGE_FLAG:I = 0x8000

.field public static final BASE_SIZE:I = 0x2

.field public static final ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;


# instance fields
.field private alignment:S

.field private allowMethodChange:Z

.field private padding:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const v1, 0xa11e

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 48
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 1

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;-><init>(IZI)V

    return-void
.end method

.method public constructor <init>(IZI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    .line 6
    .line 7
    if-ltz p1, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x7fff

    .line 10
    .line 11
    if-gt p1, v0, :cond_1

    .line 12
    .line 13
    if-ltz p3, :cond_0

    .line 14
    .line 15
    int-to-short p1, p1

    .line 16
    iput-short p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->alignment:S

    .line 17
    .line 18
    iput-boolean p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange:Z

    .line 19
    .line 20
    iput p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "Padding must not be negative, was: "

    .line 24
    .line 25
    invoke-static {p3, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0

    .line 34
    :cond_1
    const-string p0, "Alignment must be between 0 and 0x7fff, was: "

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    throw p0
.end method


# virtual methods
.method public allowMethodChange()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAlignment()S
    .locals 0

    .line 1
    iget-short p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->alignment:S

    .line 2
    .line 3
    return p0
.end method

.method public getCentralDirectoryData()[B
    .locals 1

    .line 1
    iget-short v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->alignment:S

    .line 2
    .line 3
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const p0, 0x8000

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    or-int/2addr p0, v0

    .line 13
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes(I)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 3

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iget-short v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->alignment:S

    .line 8
    .line 9
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const p0, 0x8000

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p0, v2

    .line 19
    :goto_0
    or-int/2addr p0, v1

    .line 20
    invoke-static {p0, v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    .line 4
    .line 5
    add-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-lt p3, v0, :cond_1

    .line 3
    .line 4
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    and-int/lit16 p2, p1, 0x7fff

    .line 9
    .line 10
    int-to-short p2, p2

    .line 11
    iput-short p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->alignment:S

    .line 12
    .line 13
    const p2, 0x8000

    .line 14
    .line 15
    .line 16
    and-int/2addr p1, p2

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->allowMethodChange:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    new-instance p0, Ljava/util/zip/ZipException;

    .line 26
    .line 27
    const-string p1, "Too short content for ResourceAlignmentExtraField (0xa11e): "

    .line 28
    .line 29
    invoke-static {p3, p1}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0
.end method

.method public parseFromLocalFileData([BII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->parseFromCentralDirectoryData([BII)V

    .line 2
    .line 3
    .line 4
    add-int/lit8 p3, p3, -0x2

    .line 5
    .line 6
    iput p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ResourceAlignmentExtraField;->padding:I

    .line 7
    .line 8
    return-void
.end method
