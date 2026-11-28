.class public final Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0000\u0018\u00002\u00020\u0001B!\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0016\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011J\u0010\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J \u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0015\u001a\u00020\u000fH\u0002R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\t\u00a8\u0006\u0016"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;",
        "",
        "sections",
        "",
        "ranges",
        "mappings",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "getSections",
        "()Ljava/lang/String;",
        "getRanges",
        "getMappings",
        "map",
        "",
        "codePoint",
        "",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "findSectionsIndex",
        "findRangesOffset",
        "position",
        "limit",
        "okhttp"
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
.field private final mappings:Ljava/lang/String;

.field private final ranges:Ljava/lang/String;

.field private final sections:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    .line 110
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    .line 111
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->mappings:Ljava/lang/String;

    return-void
.end method

.method private final findRangesOffset(III)I
    .registers 7

    and-int/lit8 p1, p1, 0x7f

    add-int/lit8 p3, p3, -0x1

    :goto_0
    if-gt p2, p3, :cond_1

    add-int v0, p2, p3

    .line 321
    div-int/lit8 v0, v0, 0x2

    shl-int/lit8 v1, v0, 0x2

    .line 258
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 259
    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v1

    if-gez v1, :cond_0

    add-int/lit8 p3, v0, -0x1

    goto :goto_0

    :cond_0
    if-lez v1, :cond_2

    add-int/lit8 p2, v0, 0x1

    goto :goto_0

    :cond_1
    neg-int p1, p2

    add-int/lit8 v0, p1, -0x1

    :cond_2
    if-ltz v0, :cond_3

    shl-int/lit8 v0, v0, 0x2

    return v0

    :cond_3
    neg-int p1, v0

    add-int/lit8 p1, p1, -0x2

    shl-int/lit8 p1, p1, 0x2

    return p1
.end method

.method private final findSectionsIndex(I)I
    .registers 7

    const v0, 0x1fff80

    and-int/2addr p1, v0

    shr-int/lit8 p1, p1, 0x7

    .line 225
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-gt v1, v0, :cond_1

    add-int v2, v1, v0

    .line 308
    div-int/lit8 v2, v2, 0x2

    shl-int/lit8 v3, v2, 0x2

    .line 228
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    invoke-static {v4, v3}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTableKt;->read14BitInt(Ljava/lang/String;I)I

    move-result v3

    .line 229
    invoke-static {p1, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    if-gez v3, :cond_0

    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    :cond_0
    if-lez v3, :cond_2

    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    :cond_1
    neg-int p1, v1

    add-int/lit8 v2, p1, -0x1

    :cond_2
    if-ltz v2, :cond_3

    shl-int/lit8 v2, v2, 0x2

    return v2

    :cond_3
    neg-int p1, v2

    add-int/lit8 p1, p1, -0x2

    shl-int/lit8 p1, p1, 0x2

    return p1
.end method


# virtual methods
.method public final getMappings()Ljava/lang/String;
    .registers 2

    .line 111
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->mappings:Ljava/lang/String;

    return-object v0
.end method

.method public final getRanges()Ljava/lang/String;
    .registers 2

    .line 110
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    return-object v0
.end method

.method public final getSections()Ljava/lang/String;
    .registers 2

    .line 109
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    return-object v0
.end method

.method public final map(ILnicoid/network238/okio/BufferedSink;)Z
    .registers 7

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->findSectionsIndex(I)I

    move-result v0

    .line 122
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x2

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTableKt;->read14BitInt(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v2, v0, 0x4

    .line 126
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->sections:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x6

    invoke-static {v2, v0}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTableKt;->read14BitInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    .line 127
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    .line 130
    :goto_0
    invoke-direct {p0, p1, v1, v0}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->findRangesOffset(III)I

    move-result v0

    .line 132
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x40

    if-ltz v1, :cond_1

    if-ge v1, v2, :cond_1

    .line 135
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x2

    invoke-static {p1, v0}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTableKt;->read14BitInt(Ljava/lang/String;I)I

    move-result p1

    .line 136
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->mappings:Ljava/lang/String;

    add-int/2addr v1, p1

    invoke-interface {p2, v0, p1, v1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_1
    const/16 v3, 0x50

    if-gt v2, v1, :cond_2

    if-ge v1, v3, :cond_2

    .line 141
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 142
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    and-int/lit8 v1, v1, 0xf

    shl-int/lit8 v1, v1, 0xe

    shl-int/lit8 v2, v2, 0x7

    or-int/2addr v1, v2

    or-int/2addr v1, v0

    sub-int/2addr p1, v1

    .line 145
    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_2
    if-gt v3, v1, :cond_3

    const/16 v2, 0x60

    if-ge v1, v2, :cond_3

    .line 150
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 151
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    and-int/lit8 v1, v1, 0xf

    shl-int/lit8 v1, v1, 0xe

    shl-int/lit8 v2, v2, 0x7

    or-int/2addr v1, v2

    or-int/2addr v1, v0

    add-int/2addr p1, v1

    .line 154
    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_3
    const/16 v2, 0x77

    if-ne v1, v2, :cond_4

    .line 157
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto/16 :goto_1

    :cond_4
    const/16 v2, 0x78

    if-ne v1, v2, :cond_5

    .line 163
    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_5
    const/16 v2, 0x79

    if-ne v1, v2, :cond_6

    .line 168
    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;

    const/4 p1, 0x0

    return p1

    :cond_6
    const/16 v2, 0x7a

    if-ne v1, v2, :cond_7

    .line 174
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_7
    const/16 v2, 0x7b

    if-ne v1, v2, :cond_8

    .line 179
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    or-int/lit16 p1, p1, 0x80

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto/16 :goto_1

    :cond_8
    const/16 v2, 0x7c

    if-ne v1, v2, :cond_9

    .line 184
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 185
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto :goto_1

    :cond_9
    const/16 v2, 0x7d

    if-ne v1, v2, :cond_a

    .line 190
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    or-int/lit16 p1, p1, 0x80

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 191
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto :goto_1

    :cond_a
    const/16 v2, 0x7e

    if-ne v1, v2, :cond_b

    .line 196
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 197
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    or-int/lit16 p1, p1, 0x80

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    goto :goto_1

    :cond_b
    const/16 v2, 0x7f

    if-ne v1, v2, :cond_c

    .line 202
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    or-int/lit16 p1, p1, 0x80

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    .line 203
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->ranges:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    or-int/lit16 p1, p1, 0x80

    invoke-interface {p2, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    :goto_1
    const/4 p1, 0x1

    return p1

    :cond_c
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected rangesIndex for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
