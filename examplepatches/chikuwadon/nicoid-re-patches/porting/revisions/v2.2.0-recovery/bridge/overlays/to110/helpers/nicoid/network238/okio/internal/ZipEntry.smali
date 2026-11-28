.class public final Lnicoid/network238/okio/internal/ZipEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008$\n\u0002\u0010!\n\u0002\u0008\u000c\u0008\u0000\u0018\u00002\u00020\u0001B\u00b1\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r\u0012\u0008\u0008\u0002\u0010\u000e\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\u000f\u001a\u00020\r\u0012\u0008\u0008\u0002\u0010\u0010\u001a\u00020\r\u0012\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u0012\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u0013\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\r\u0012\n\u0008\u0002\u0010\u0015\u001a\u0004\u0018\u00010\r\u0012\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J-\u00105\u001a\u00020\u00002\u0008\u0010\u0014\u001a\u0004\u0018\u00010\r2\u0008\u0010\u0015\u001a\u0004\u0018\u00010\r2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\rH\u0000\u00a2\u0006\u0004\u00086\u00107R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u001bR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u001fR\u0011\u0010\n\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010\u001fR\u0011\u0010\u000b\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\u001fR\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010#R\u0011\u0010\u000e\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010\u001fR\u0011\u0010\u000f\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010#R\u0011\u0010\u0010\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008&\u0010#R\u0015\u0010\u0011\u001a\u0004\u0018\u00010\t\u00a2\u0006\n\n\u0002\u0010)\u001a\u0004\u0008\'\u0010(R\u0015\u0010\u0012\u001a\u0004\u0018\u00010\t\u00a2\u0006\n\n\u0002\u0010)\u001a\u0004\u0008*\u0010(R\u0015\u0010\u0013\u001a\u0004\u0018\u00010\t\u00a2\u0006\n\n\u0002\u0010)\u001a\u0004\u0008+\u0010(R\u0015\u0010\u0014\u001a\u0004\u0018\u00010\r\u00a2\u0006\n\n\u0002\u0010.\u001a\u0004\u0008,\u0010-R\u0015\u0010\u0015\u001a\u0004\u0018\u00010\r\u00a2\u0006\n\n\u0002\u0010.\u001a\u0004\u0008/\u0010-R\u0015\u0010\u0016\u001a\u0004\u0018\u00010\r\u00a2\u0006\n\n\u0002\u0010.\u001a\u0004\u00080\u0010-R\u0017\u00101\u001a\u0008\u0012\u0004\u0012\u00020\u000302\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00083\u00104R\u0016\u00108\u001a\u0004\u0018\u00010\t8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u00089\u0010(R\u0016\u0010:\u001a\u0004\u0018\u00010\t8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008;\u0010(R\u0016\u0010<\u001a\u0004\u0018\u00010\t8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008=\u0010(\u00a8\u0006>"
    }
    d2 = {
        "Lnicoid/network238/okio/internal/ZipEntry;",
        "",
        "canonicalPath",
        "Lnicoid/network238/okio/Path;",
        "isDirectory",
        "",
        "comment",
        "",
        "crc",
        "",
        "compressedSize",
        "size",
        "compressionMethod",
        "",
        "offset",
        "dosLastModifiedAtDate",
        "dosLastModifiedAtTime",
        "ntfsLastModifiedAtFiletime",
        "ntfsLastAccessedAtFiletime",
        "ntfsCreatedAtFiletime",
        "extendedLastModifiedAtSeconds",
        "extendedLastAccessedAtSeconds",
        "extendedCreatedAtSeconds",
        "<init>",
        "(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V",
        "getCanonicalPath",
        "()Lnicoid/network238/okio/Path;",
        "()Z",
        "getComment",
        "()Ljava/lang/String;",
        "getCrc",
        "()J",
        "getCompressedSize",
        "getSize",
        "getCompressionMethod",
        "()I",
        "getOffset",
        "getDosLastModifiedAtDate",
        "getDosLastModifiedAtTime",
        "getNtfsLastModifiedAtFiletime",
        "()Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "getNtfsLastAccessedAtFiletime",
        "getNtfsCreatedAtFiletime",
        "getExtendedLastModifiedAtSeconds",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "getExtendedLastAccessedAtSeconds",
        "getExtendedCreatedAtSeconds",
        "children",
        "",
        "getChildren",
        "()Ljava/util/List;",
        "copy",
        "copy$okio",
        "(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lnicoid/network238/okio/internal/ZipEntry;",
        "lastAccessedAtMillis",
        "getLastAccessedAtMillis$okio",
        "lastModifiedAtMillis",
        "getLastModifiedAtMillis$okio",
        "createdAtMillis",
        "getCreatedAtMillis$okio",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final canonicalPath:Lnicoid/network238/okio/Path;

.field private final children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation
.end field

.field private final comment:Ljava/lang/String;

.field private final compressedSize:J

.field private final compressionMethod:I

.field private final crc:J

.field private final dosLastModifiedAtDate:I

.field private final dosLastModifiedAtTime:I

.field private final extendedCreatedAtSeconds:Ljava/lang/Integer;

.field private final extendedLastAccessedAtSeconds:Ljava/lang/Integer;

.field private final extendedLastModifiedAtSeconds:Ljava/lang/Integer;

.field private final isDirectory:Z

.field private final ntfsCreatedAtFiletime:Ljava/lang/Long;

.field private final ntfsLastAccessedAtFiletime:Ljava/lang/Long;

.field private final ntfsLastModifiedAtFiletime:Ljava/lang/Long;

.field private final offset:J

.field private final size:J


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 21

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->canonicalPath:Lnicoid/network238/okio/Path;

    .line 33
    iput-boolean p2, p0, Lnicoid/network238/okio/internal/ZipEntry;->isDirectory:Z

    .line 36
    iput-object p3, p0, Lnicoid/network238/okio/internal/ZipEntry;->comment:Ljava/lang/String;

    .line 39
    iput-wide p4, p0, Lnicoid/network238/okio/internal/ZipEntry;->crc:J

    .line 42
    iput-wide p6, p0, Lnicoid/network238/okio/internal/ZipEntry;->compressedSize:J

    .line 45
    iput-wide p8, p0, Lnicoid/network238/okio/internal/ZipEntry;->size:J

    .line 48
    iput p10, p0, Lnicoid/network238/okio/internal/ZipEntry;->compressionMethod:I

    .line 50
    iput-wide p11, p0, Lnicoid/network238/okio/internal/ZipEntry;->offset:J

    .line 70
    iput p13, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtDate:I

    .line 71
    iput p14, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtTime:I

    .line 77
    iput-object p15, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastModifiedAtFiletime:Ljava/lang/Long;

    .line 78
    move-object/from16 p1, p16

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastAccessedAtFiletime:Ljava/lang/Long;

    .line 79
    move-object/from16 p1, p17

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsCreatedAtFiletime:Ljava/lang/Long;

    .line 85
    move-object/from16 p1, p18

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastModifiedAtSeconds:Ljava/lang/Integer;

    .line 86
    move-object/from16 p1, p19

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastAccessedAtSeconds:Ljava/lang/Integer;

    .line 87
    move-object/from16 p1, p20

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedCreatedAtSeconds:Ljava/lang/Integer;

    .line 89
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/internal/ZipEntry;->children:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 40

    move/from16 v0, p21

    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move/from16 v1, p2

    :goto_0
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_1

    .line 36
    const-string v2, ""

    goto :goto_1

    .line 0
    :cond_1
    move-object/from16 v2, p3

    .line 36
    :goto_1
    and-int/lit8 v3, v0, 0x8

    const-wide/16 v4, -0x1

    if-eqz v3, :cond_2

    move-wide v6, v4

    goto :goto_2

    :cond_2
    move-wide/from16 v6, p4

    :goto_2
    and-int/lit8 v3, v0, 0x10

    if-eqz v3, :cond_3

    move-wide v8, v4

    goto :goto_3

    :cond_3
    move-wide/from16 v8, p6

    :goto_3
    and-int/lit8 v3, v0, 0x20

    if-eqz v3, :cond_4

    move-wide v10, v4

    goto :goto_4

    :cond_4
    move-wide/from16 v10, p8

    :goto_4
    and-int/lit8 v3, v0, 0x40

    const/4 v12, -0x1

    if-eqz v3, :cond_5

    move v3, v12

    goto :goto_5

    :cond_5
    move/from16 v3, p10

    :goto_5
    and-int/lit16 v13, v0, 0x80

    if-nez v13, :cond_6

    move-wide/from16 v4, p11

    :cond_6
    and-int/lit16 v13, v0, 0x100

    if-eqz v13, :cond_7

    move v13, v12

    goto :goto_6

    :cond_7
    move/from16 v13, p13

    :goto_6
    and-int/lit16 v14, v0, 0x200

    if-nez v14, :cond_8

    move/from16 v12, p14

    :cond_8
    and-int/lit16 v14, v0, 0x400

    if-eqz v14, :cond_9

    const/4 v14, 0x0

    goto :goto_7

    :cond_9
    move-object/from16 v14, p15

    :goto_7
    and-int/lit16 v15, v0, 0x800

    if-eqz v15, :cond_a

    const/4 v15, 0x0

    goto :goto_8

    :cond_a
    move-object/from16 v15, p16

    :goto_8
    move/from16 p22, v1

    and-int/lit16 v1, v0, 0x1000

    if-eqz v1, :cond_b

    const/4 v1, 0x0

    goto :goto_9

    :cond_b
    move-object/from16 v1, p17

    :goto_9
    move-object/from16 p3, v1

    and-int/lit16 v1, v0, 0x2000

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    goto :goto_a

    :cond_c
    move-object/from16 v1, p18

    :goto_a
    move-object/from16 p4, v1

    and-int/lit16 v1, v0, 0x4000

    if-eqz v1, :cond_d

    const/4 v1, 0x0

    goto :goto_b

    :cond_d
    move-object/from16 v1, p19

    :goto_b
    const v16, 0x8000

    and-int v0, v0, v16

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    goto :goto_c

    :cond_e
    move-object/from16 v0, p20

    .line 25
    :goto_c
    move-object/from16 p2, p0

    move-object/from16 p19, p3

    move-object/from16 p20, p4

    move/from16 p4, p22

    move-object/from16 p22, v0

    move-object/from16 p21, v1

    move-object/from16 p5, v2

    move/from16 p12, v3

    move-wide/from16 p13, v4

    move-wide/from16 p6, v6

    move-wide/from16 p8, v8

    move-wide/from16 p10, v10

    move/from16 p16, v12

    move/from16 p15, v13

    move-object/from16 p17, v14

    move-object/from16 p18, v15

    move-object/from16 p3, p1

    invoke-direct/range {p2 .. p22}, Lnicoid/network238/okio/internal/ZipEntry;-><init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public final copy$okio(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lnicoid/network238/okio/internal/ZipEntry;
    .registers 26

    .line 95
    move-object/from16 v0, p0

    new-instance v1, Lnicoid/network238/okio/internal/ZipEntry;

    .line 96
    iget-object v2, v0, Lnicoid/network238/okio/internal/ZipEntry;->canonicalPath:Lnicoid/network238/okio/Path;

    .line 97
    iget-boolean v3, v0, Lnicoid/network238/okio/internal/ZipEntry;->isDirectory:Z

    .line 98
    iget-object v4, v0, Lnicoid/network238/okio/internal/ZipEntry;->comment:Ljava/lang/String;

    .line 99
    iget-wide v5, v0, Lnicoid/network238/okio/internal/ZipEntry;->crc:J

    .line 100
    iget-wide v7, v0, Lnicoid/network238/okio/internal/ZipEntry;->compressedSize:J

    .line 101
    iget-wide v9, v0, Lnicoid/network238/okio/internal/ZipEntry;->size:J

    .line 102
    iget v11, v0, Lnicoid/network238/okio/internal/ZipEntry;->compressionMethod:I

    .line 103
    iget-wide v12, v0, Lnicoid/network238/okio/internal/ZipEntry;->offset:J

    .line 104
    iget v14, v0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtDate:I

    .line 105
    iget v15, v0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtTime:I

    .line 106
    move-object/from16 v16, v1

    iget-object v1, v0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastModifiedAtFiletime:Ljava/lang/Long;

    .line 107
    move-object/from16 v17, v1

    iget-object v1, v0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastAccessedAtFiletime:Ljava/lang/Long;

    .line 108
    move-object/from16 v18, v1

    iget-object v1, v0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsCreatedAtFiletime:Ljava/lang/Long;

    .line 95
    move-object/from16 v19, v18

    move-object/from16 v18, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v19

    move-object/from16 v19, p1

    move-object/from16 v20, p2

    move-object/from16 v21, p3

    invoke-direct/range {v1 .. v21}, Lnicoid/network238/okio/internal/ZipEntry;-><init>(Lnicoid/network238/okio/Path;ZLjava/lang/String;JJJIJIILjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    move-object/from16 v16, v1

    return-object v16
.end method

.method public final getCanonicalPath()Lnicoid/network238/okio/Path;
    .registers 2

    .line 30
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->canonicalPath:Lnicoid/network238/okio/Path;

    return-object v0
.end method

.method public final getChildren()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->children:Ljava/util/List;

    return-object v0
.end method

.method public final getComment()Ljava/lang/String;
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public final getCompressedSize()J
    .registers 3

    .line 42
    iget-wide v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->compressedSize:J

    return-wide v0
.end method

.method public final getCompressionMethod()I
    .registers 2

    .line 48
    iget v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->compressionMethod:I

    return v0
.end method

.method public final getCrc()J
    .registers 3

    .line 39
    iget-wide v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->crc:J

    return-wide v0
.end method

.method public final getCreatedAtMillis$okio()Ljava/lang/Long;
    .registers 5

    .line 133
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsCreatedAtFiletime:Ljava/lang/Long;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->filetimeToEpochMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 134
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedCreatedAtSeconds:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getDosLastModifiedAtDate()I
    .registers 2

    .line 70
    iget v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtDate:I

    return v0
.end method

.method public final getDosLastModifiedAtTime()I
    .registers 2

    .line 71
    iget v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtTime:I

    return v0
.end method

.method public final getExtendedCreatedAtSeconds()Ljava/lang/Integer;
    .registers 2

    .line 87
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedCreatedAtSeconds:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getExtendedLastAccessedAtSeconds()Ljava/lang/Integer;
    .registers 2

    .line 86
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastAccessedAtSeconds:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getExtendedLastModifiedAtSeconds()Ljava/lang/Integer;
    .registers 2

    .line 85
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastModifiedAtSeconds:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getLastAccessedAtMillis$okio()Ljava/lang/Long;
    .registers 5

    .line 116
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastAccessedAtFiletime:Ljava/lang/Long;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->filetimeToEpochMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 117
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastAccessedAtSeconds:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getLastModifiedAtMillis$okio()Ljava/lang/Long;
    .registers 5

    .line 123
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastModifiedAtFiletime:Ljava/lang/Long;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/okio/internal/ZipFilesKt;->filetimeToEpochMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 124
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->extendedLastModifiedAtSeconds:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    .line 125
    :cond_1
    iget v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtTime:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 126
    iget v1, p0, Lnicoid/network238/okio/internal/ZipEntry;->dosLastModifiedAtDate:I

    invoke-static {v1, v0}, Lnicoid/network238/okio/internal/ZipFilesKt;->dosDateTimeToEpochMillis(II)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getNtfsCreatedAtFiletime()Ljava/lang/Long;
    .registers 2

    .line 79
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsCreatedAtFiletime:Ljava/lang/Long;

    return-object v0
.end method

.method public final getNtfsLastAccessedAtFiletime()Ljava/lang/Long;
    .registers 2

    .line 78
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastAccessedAtFiletime:Ljava/lang/Long;

    return-object v0
.end method

.method public final getNtfsLastModifiedAtFiletime()Ljava/lang/Long;
    .registers 2

    .line 77
    iget-object v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->ntfsLastModifiedAtFiletime:Ljava/lang/Long;

    return-object v0
.end method

.method public final getOffset()J
    .registers 3

    .line 50
    iget-wide v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->offset:J

    return-wide v0
.end method

.method public final getSize()J
    .registers 3

    .line 45
    iget-wide v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->size:J

    return-wide v0
.end method

.method public final isDirectory()Z
    .registers 2

    .line 33
    iget-boolean v0, p0, Lnicoid/network238/okio/internal/ZipEntry;->isDirectory:Z

    return v0
.end method
