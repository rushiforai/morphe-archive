.class public final Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final DATA_DESCRIPTOR_FLAG:I = 0x8

.field private static final ENCRYPTION_FLAG:I = 0x1

.field private static final NUMBER_OF_SHANNON_FANO_TREES_FLAG:I = 0x4

.field private static final SLIDING_DICTIONARY_SIZE_FLAG:I = 0x2

.field private static final STRONG_ENCRYPTION_FLAG:I = 0x40

.field public static final UFT8_NAMES_FLAG:I = 0x800


# instance fields
.field private dataDescriptorFlag:Z

.field private encryptionFlag:Z

.field private languageEncodingFlag:Z

.field private numberOfShannonFanoTrees:I

.field private slidingDictionarySize:I

.field private strongEncryptionFlag:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 12
    .line 13
    return-void
.end method

.method public static parse([BI)Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;
    .locals 3

    .line 1
    invoke-static {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 6
    .line 7
    invoke-direct {p1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;-><init>()V

    .line 8
    .line 9
    .line 10
    and-int/lit8 v0, p0, 0x8

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    move v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v1

    .line 19
    :goto_0
    invoke-virtual {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useDataDescriptor(Z)V

    .line 20
    .line 21
    .line 22
    and-int/lit16 v0, p0, 0x800

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move v0, v2

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v0, v1

    .line 29
    :goto_1
    invoke-virtual {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useUTF8ForNames(Z)V

    .line 30
    .line 31
    .line 32
    and-int/lit8 v0, p0, 0x40

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    move v0, v2

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v0, v1

    .line 39
    :goto_2
    invoke-virtual {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useStrongEncryption(Z)V

    .line 40
    .line 41
    .line 42
    and-int/lit8 v0, p0, 0x1

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    move v1, v2

    .line 47
    :cond_3
    invoke-virtual {p1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useEncryption(Z)V

    .line 48
    .line 49
    .line 50
    and-int/lit8 v0, p0, 0x2

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/16 v0, 0x2000

    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_4
    const/16 v0, 0x1000

    .line 58
    .line 59
    :goto_3
    iput v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->slidingDictionarySize:I

    .line 60
    .line 61
    and-int/lit8 p0, p0, 0x4

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/4 p0, 0x3

    .line 66
    goto :goto_4

    .line 67
    :cond_5
    const/4 p0, 0x2

    .line 68
    :goto_4
    iput p0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->numberOfShannonFanoTrees:I

    .line 69
    .line 70
    return-object p1
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
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    const-string v0, "GeneralPurposeBit is not Cloneable?"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public encode([BI)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    const/16 v2, 0x800

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v2, v1

    .line 18
    :goto_1
    or-int/2addr v0, v2

    .line 19
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 20
    .line 21
    or-int/2addr v0, v2

    .line 22
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    const/16 v1, 0x40

    .line 27
    .line 28
    :cond_2
    or-int p0, v0, v1

    .line 29
    .line 30
    invoke-static {p0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public encode()[B
    .locals 2

    const/4 v0, 0x2

    .line 34
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 35
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 8
    .line 9
    iget-boolean v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 10
    .line 11
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 16
    .line 17
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 22
    .line 23
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 24
    .line 25
    if-ne v0, v2, :cond_1

    .line 26
    .line 27
    iget-boolean p1, p1, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 28
    .line 29
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 30
    .line 31
    if-ne p1, p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    return v1
.end method

.method public getNumberOfShannonFanoTrees()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->numberOfShannonFanoTrees:I

    .line 2
    .line 3
    return p0
.end method

.method public getSlidingDictionarySize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->slidingDictionarySize:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x11

    .line 4
    .line 5
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0xd

    .line 9
    .line 10
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x7

    .line 14
    .line 15
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 16
    .line 17
    add-int/2addr v0, p0

    .line 18
    mul-int/lit8 v0, v0, 0x3

    .line 19
    .line 20
    return v0
.end method

.method public useDataDescriptor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 2
    .line 3
    return-void
.end method

.method public useEncryption(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 2
    .line 3
    return-void
.end method

.method public useStrongEncryption(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->useEncryption(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public useUTF8ForNames(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 2
    .line 3
    return-void
.end method

.method public usesDataDescriptor()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public usesEncryption()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public usesStrongEncryption()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public usesUTF8ForNames()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 2
    .line 3
    return p0
.end method
