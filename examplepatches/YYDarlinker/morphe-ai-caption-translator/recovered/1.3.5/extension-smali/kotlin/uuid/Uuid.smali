.class public final Lkotlin/uuid/Uuid;
.super Ljava/lang/Object;
.source "Uuid.kt"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/uuid/Uuid$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lkotlin/uuid/Uuid;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0007\u0018\u0000 32\u0008\u0012\u0004\u0012\u00020\u00000\u00012\u00060\u0002j\u0002`\u0003:\u00013B\u0019\u0008B\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008Ja\u0010\u0010\u001a\u0002H\u0011\"\u0004\u0008\u0000\u0010\u001126\u0010\u0012\u001a2\u0012\u0013\u0012\u00110\u0005\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0004\u0012\u0013\u0012\u00110\u0005\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0006\u0012\u0004\u0012\u0002H\u00110\u0013H\u0087\u0088\u0004b\u0002\u0008\u0017\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u0016Ja\u0010\u0018\u001a\u0002H\u0011\"\u0004\u0008\u0000\u0010\u001126\u0010\u0012\u001a2\u0012\u0013\u0012\u00110\u0019\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0004\u0012\u0013\u0012\u00110\u0019\u00a2\u0006\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0006\u0012\u0004\u0012\u0002H\u00110\u0013H\u0087\u0088\u0004b\u0002\u0008\u0017\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u0016J\n\u0010\u001a\u001a\u00020\u001bH\u0096\u0080\u0004J\n\u0010\u001c\u001a\u00020\u001bH\u0086\u0080\u0004J\n\u0010\u001d\u001a\u00020\u001bH\u0086\u0080\u0004J\n\u0010\u001e\u001a\u00020\u001fH\u0086\u0080\u0004J\u0015\u0010 \u001a\u00020!H\u0087\u0080\u0004b\u0002\u0008$\u00a2\u0006\u0004\u0008\"\u0010#J\u0014\u0010%\u001a\u00020&2\u0008\u0010\'\u001a\u0004\u0018\u00010(H\u0096\u0082\u0004J\u0012\u0010)\u001a\u00020*2\u0006\u0010\'\u001a\u00020\u0000H\u0096\u0082\u0004J\n\u0010+\u001a\u00020*H\u0096\u0080\u0004J\n\u0010,\u001a\u00020(H\u0082\u0080\u0004J\u001b\u0010-\u001a\u00020.2\n\u0010/\u001a\u000600j\u0002`1H\u0082\u0080\u0004\u00a2\u0006\u0002\u00102R!\u0010\u0004\u001a\u00020\u00058\u0000X\u0081\u0084\u0008r\u0002\u0008\r\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\t\u0010\n\u001a\u0004\u0008\u000b\u0010\u000cR!\u0010\u0006\u001a\u00020\u00058\u0000X\u0081\u0084\u0008r\u0002\u0008\r\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u000e\u0010\n\u001a\u0004\u0008\u000f\u0010\u000c\u00ca\u0001\u000c\u00085\u0012\u0008\u00086\u0012\u0004\u0008\u0008(7\u00ca\u0001\u0010\u00088\u0012\u000c\u00089\u0012\u0008\u0008\u000cJ\u0004\u0008\t0:\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u00064"
    }
    d2 = {
        "Lkotlin/uuid/Uuid;",
        "",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "mostSignificantBits",
        "",
        "leastSignificantBits",
        "<init>",
        "(JJ)V",
        "getMostSignificantBits$annotations",
        "()V",
        "getMostSignificantBits",
        "()J",
        "Lkotlin/PublishedApi;",
        "getLeastSignificantBits$annotations",
        "getLeastSignificantBits",
        "toLongs",
        "T",
        "action",
        "Lkotlin/Function2;",
        "Lkotlin/ParameterName;",
        "name",
        "(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;",
        "Lkotlin/internal/InlineOnly;",
        "toULongs",
        "Lkotlin/ULong;",
        "toString",
        "",
        "toHexDashString",
        "toHexString",
        "toByteArray",
        "",
        "toUByteArray",
        "Lkotlin/UByteArray;",
        "toUByteArray-TcUX1vc",
        "()[B",
        "Lkotlin/ExperimentalUnsignedTypes;",
        "equals",
        "",
        "other",
        "",
        "compareTo",
        "",
        "hashCode",
        "writeReplace",
        "readObject",
        "",
        "input",
        "Ljava/io/ObjectInputStream;",
        "Lkotlin/internal/ReadObjectParameterType;",
        "(Ljava/io/ObjectInputStream;)V",
        "Companion",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.4",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/uuid/ExperimentalUuidApi;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lkotlin/uuid/Uuid$Companion;

.field private static final NIL:Lkotlin/uuid/Uuid;

.field public static final SIZE_BITS:I = 0x80

.field public static final SIZE_BYTES:I = 0x10


# instance fields
.field private final leastSignificantBits:J

.field private final mostSignificantBits:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/uuid/Uuid$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/uuid/Uuid$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/uuid/Uuid;->Companion:Lkotlin/uuid/Uuid$Companion;

    .line 294
    new-instance v0, Lkotlin/uuid/Uuid;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2, v1, v2}, Lkotlin/uuid/Uuid;-><init>(JJ)V

    sput-object v0, Lkotlin/uuid/Uuid;->NIL:Lkotlin/uuid/Uuid;

    return-void
.end method

.method private constructor <init>(JJ)V
    .registers 5

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-wide p1, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    .line 57
    iput-wide p3, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    return-void
.end method

.method public synthetic constructor <init>(JJLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lkotlin/uuid/Uuid;-><init>(JJ)V

    return-void
.end method

.method public static final synthetic access$getNIL$cp()Lkotlin/uuid/Uuid;
    .registers 1

    .line 53
    sget-object v0, Lkotlin/uuid/Uuid;->NIL:Lkotlin/uuid/Uuid;

    return-object v0
.end method

.method public static synthetic getLeastSignificantBits$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getMostSignificantBits$annotations()V
    .registers 0

    return-void
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 2

    .line 285
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Deserialization is supported via proxy only"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final toLongs(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Long;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->getMostSignificantBits()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->getLeastSignificantBits()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final toULongs(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lkotlin/ULong;",
            "-",
            "Lkotlin/ULong;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->getMostSignificantBits()J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/ULong;->box-impl(J)Lkotlin/ULong;

    move-result-object v0

    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->getLeastSignificantBits()J

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/ULong;->box-impl(J)Lkotlin/ULong;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 1

    .line 283
    invoke-static {p0}, Lkotlin/uuid/UuidKt;->serializedUuid(Lkotlin/uuid/Uuid;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 53
    check-cast p1, Lkotlin/uuid/Uuid;

    invoke-virtual {p0, p1}, Lkotlin/uuid/Uuid;->compareTo(Lkotlin/uuid/Uuid;)I

    move-result p0

    return p0
.end method

.method public compareTo(Lkotlin/uuid/Uuid;)I
    .registers 6

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 273
    iget-wide v0, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    iget-wide v2, p1, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1c

    .line 274
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    iget-wide p0, p1, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    invoke-static {p0, p1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result p0

    return p0

    .line 276
    :cond_1c
    iget-wide v0, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    iget-wide p0, p1, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    invoke-static {p0, p1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 246
    :cond_4
    instance-of v1, p1, Lkotlin/uuid/Uuid;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 247
    :cond_a
    iget-wide v3, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    check-cast p1, Lkotlin/uuid/Uuid;

    iget-wide v5, p1, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_1d

    .line 248
    iget-wide v3, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    iget-wide p0, p1, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    cmp-long p0, v3, p0

    if-nez p0, :cond_1d

    return v0

    :cond_1d
    return v2
.end method

.method public final getLeastSignificantBits()J
    .registers 3

    .line 57
    iget-wide v0, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    return-wide v0
.end method

.method public final getMostSignificantBits()J
    .registers 3

    .line 56
    iget-wide v0, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 5

    .line 280
    iget-wide v0, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    iget-wide v2, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    xor-long/2addr v0, v2

    invoke-static {v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result p0

    return p0
.end method

.method public final toByteArray()[B
    .registers 5

    const/16 v0, 0x10

    .line 214
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 215
    iget-wide v2, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    invoke-static {v0, v1, v2, v3}, Lkotlin/uuid/UuidKt;->setLongAt([BIJ)V

    const/16 v1, 0x8

    .line 216
    iget-wide v2, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    invoke-static {v0, v1, v2, v3}, Lkotlin/uuid/UuidKt;->setLongAt([BIJ)V

    return-object v0
.end method

.method public final toHexDashString()Ljava/lang/String;
    .registers 9

    const/16 v0, 0x24

    .line 168
    new-array v3, v0, [B

    .line 169
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    const/16 v0, 0x8

    const/16 v7, 0x2d

    .line 170
    aput-byte v7, v3, v0

    .line 171
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    const/4 v5, 0x4

    const/4 v6, 0x6

    const/16 v4, 0x9

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    const/16 v0, 0xd

    .line 172
    aput-byte v7, v3, v0

    .line 173
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    const/4 v5, 0x6

    const/16 v6, 0x8

    const/16 v4, 0xe

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    const/16 v0, 0x12

    .line 174
    aput-byte v7, v3, v0

    .line 175
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/16 v4, 0x13

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    const/16 v0, 0x17

    .line 176
    aput-byte v7, v3, v0

    .line 177
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    const/4 v5, 0x2

    const/16 v6, 0x8

    const/16 v4, 0x18

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    .line 178
    invoke-static {v3}, Lkotlin/text/StringsKt;->decodeToString([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final toHexString()Ljava/lang/String;
    .registers 8

    const/16 v0, 0x20

    .line 197
    new-array v3, v0, [B

    .line 198
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->mostSignificantBits:J

    const/4 v5, 0x0

    const/16 v6, 0x8

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    .line 199
    iget-wide v1, p0, Lkotlin/uuid/Uuid;->leastSignificantBits:J

    const/16 v4, 0x10

    invoke-static/range {v1 .. v6}, Lkotlin/uuid/UuidKt;->formatBytesInto(J[BIII)V

    .line 200
    invoke-static {v3}, Lkotlin/text/StringsKt;->decodeToString([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 148
    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->toHexDashString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final toUByteArray-TcUX1vc()[B
    .registers 1

    .line 232
    invoke-virtual {p0}, Lkotlin/uuid/Uuid;->toByteArray()[B

    move-result-object p0

    invoke-static {p0}, Lkotlin/UByteArray;->constructor-impl([B)[B

    move-result-object p0

    return-object p0
.end method
