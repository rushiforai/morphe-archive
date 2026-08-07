.class public Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private comment:Ljava/lang/String;

.field private compressionLevel:I

.field private filename:Ljava/lang/String;

.field private modificationTime:J

.field private operatingSystem:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->compressionLevel:I

    .line 6
    .line 7
    const/16 v0, 0xff

    .line 8
    .line 9
    iput v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->operatingSystem:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->comment:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCompressionLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->compressionLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModificationTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->modificationTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getOperatingSystem()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->operatingSystem:I

    .line 2
    .line 3
    return p0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->comment:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCompressionLevel(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    if-gt p1, v0, :cond_0

    .line 7
    .line 8
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->compressionLevel:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "Invalid gzip compression level: "

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setModificationTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->modificationTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setOperatingSystem(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->operatingSystem:I

    .line 2
    .line 3
    return-void
.end method
