.class public enum Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4009
    name = "ExtraFieldParsingMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;",
        ">;",
        "Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldParsingBehavior;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

.field public static final enum BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

.field public static final enum DRACONIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

.field public static final enum ONLY_PARSEABLE_LENIENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

.field public static final enum ONLY_PARSEABLE_STRICT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

.field public static final enum STRICT_FOR_KNOW_EXTRA_FIELDS:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;


# instance fields
.field private final onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;


# direct methods
.method private static synthetic $values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
    .locals 5

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->STRICT_FOR_KNOW_EXTRA_FIELDS:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 4
    .line 5
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->ONLY_PARSEABLE_LENIENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 6
    .line 7
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->ONLY_PARSEABLE_STRICT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 8
    .line 9
    sget-object v4, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->DRACONIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$1;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 4
    .line 5
    const-string v2, "BEST_EFFORT"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-direct {v0, v2, v3, v1, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$1;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;Ll/lpq0;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->BEST_EFFORT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 13
    .line 14
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 15
    .line 16
    const-string v2, "STRICT_FOR_KNOW_EXTRA_FIELDS"

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->STRICT_FOR_KNOW_EXTRA_FIELDS:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 23
    .line 24
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$2;

    .line 25
    .line 26
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->SKIP:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 27
    .line 28
    const-string v2, "ONLY_PARSEABLE_LENIENT"

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    invoke-direct {v0, v2, v3, v1, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode$2;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;Ll/lpq0;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->ONLY_PARSEABLE_LENIENT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 35
    .line 36
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 37
    .line 38
    const-string v2, "ONLY_PARSEABLE_STRICT"

    .line 39
    .line 40
    const/4 v3, 0x3

    .line 41
    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->ONLY_PARSEABLE_STRICT:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 45
    .line 46
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 47
    .line 48
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->THROW:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 49
    .line 50
    const-string v2, "DRACONIC"

    .line 51
    .line 52
    const/4 v3, 0x4

    .line 53
    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->DRACONIC:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 57
    .line 58
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->$values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 63
    .line 64
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;Ll/lpq0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;-><init>(Ljava/lang/String;ILorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)V

    return-void
.end method

.method public static bridge synthetic a(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->fillAndMakeUnrecognizedOnError(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    move-result-object p0

    return-object p0
.end method

.method private static fillAndMakeUnrecognizedOnError(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->fillExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setHeaderId(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 16
    .line 17
    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    add-int/2addr p3, p2

    .line 21
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setLocalFileDataData([B)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    add-int/2addr p3, p2

    .line 30
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnrecognizedExtraField;->setCentralDirectoryData([B)V

    .line 35
    .line 36
    .line 37
    :goto_0
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
    .locals 1

    .line 1
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->createExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public fill(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils;->fillExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;[BIIZ)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onUnparseableExtraField([BIIZI)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$ExtraFieldParsingMode;->onUnparseableData:Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lorg/apache/commons/sudcompress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->onUnparseableExtraField([BIIZI)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
