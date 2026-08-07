.class public Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Feature"
.end annotation


# static fields
.field public static final DATA_DESCRIPTOR:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

.field public static final ENCRYPTION:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

.field public static final METHOD:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

.field public static final SPLITTING:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

.field public static final UNKNOWN_COMPRESSED_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

.field private static final serialVersionUID:J = 0x3912d4670b1661c7L


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 2
    .line 3
    const-string v1, "encryption"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->ENCRYPTION:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 9
    .line 10
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 11
    .line 12
    const-string v1, "compression method"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->METHOD:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 18
    .line 19
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 20
    .line 21
    const-string v1, "data descriptor"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->DATA_DESCRIPTOR:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 27
    .line 28
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 29
    .line 30
    const-string v1, "splitting"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->SPLITTING:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 36
    .line 37
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 38
    .line 39
    const-string v1, "unknown compressed size"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->UNKNOWN_COMPRESSED_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 45
    .line 46
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->name:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
