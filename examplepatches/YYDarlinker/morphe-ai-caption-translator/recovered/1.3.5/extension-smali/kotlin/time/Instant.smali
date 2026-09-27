.class public final Lkotlin/time/Instant;
.super Ljava/lang/Object;
.source "Instant.kt"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/Instant$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lkotlin/time/Instant;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nInstant.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Instant.kt\nkotlin/time/Instant\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 Instant.kt\nkotlin/time/InstantKt\n+ 4 Duration.kt\nkotlin/time/Duration\n*L\n1#1,871:1\n1#2:872\n810#3,14:873\n793#3,6:887\n810#3,14:893\n793#3,6:907\n793#3,6:914\n620#4:913\n*S KotlinDebug\n*F\n+ 1 Instant.kt\nkotlin/time/Instant\n*L\n150#1:873,14\n153#1:887,6\n161#1:893,14\n164#1:907,6\n188#1:914,6\n184#1:913\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0007\u0018\u0000 \'2\u0008\u0012\u0004\u0012\u00020\u00000\u00012\u00060\u0002j\u0002`\u0003:\u0001\'B\u0019\u0008@\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\n\u0010\u000e\u001a\u00020\u0005H\u0086\u0080\u0004J\u0019\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0011H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0019\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0011H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u0015\u0010\u0013J\u0019\u0010\u0014\u001a\u00020\u00112\u0006\u0010\u0016\u001a\u00020\u0000H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0012\u0010\u0019\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u0000H\u0096\u0082\u0004J\u0014\u0010\u001a\u001a\u00020\u001b2\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u001cH\u0096\u0082\u0004J\n\u0010\u001d\u001a\u00020\u0007H\u0096\u0080\u0004J\n\u0010\u001e\u001a\u00020\u001fH\u0096\u0080\u0004J\n\u0010 \u001a\u00020\u001cH\u0082\u0080\u0004J\u001b\u0010!\u001a\u00020\"2\n\u0010#\u001a\u00060$j\u0002`%H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010&R\u0015\u0010\u0004\u001a\u00020\u0005X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0015\u0010\u0006\u001a\u00020\u0007X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00ca\u0001\u000c\u0008)\u0012\u0008\u0008*\u0012\u0004\u0008\u0008(+\u00ca\u0001\u0010\u0008,\u0012\u000c\u0008-\u0012\u0008\u0008\u000cJ\u0004\u0008\t0.\u00a8\u0006("
    }
    d2 = {
        "Lkotlin/time/Instant;",
        "",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "epochSeconds",
        "",
        "nanosecondsOfSecond",
        "",
        "<init>",
        "(JI)V",
        "getEpochSeconds",
        "()J",
        "getNanosecondsOfSecond",
        "()I",
        "toEpochMilliseconds",
        "plus",
        "duration",
        "Lkotlin/time/Duration;",
        "plus-LRDsOJo",
        "(J)Lkotlin/time/Instant;",
        "minus",
        "minus-LRDsOJo",
        "other",
        "minus-UwyO8pc",
        "(Lkotlin/time/Instant;)J",
        "compareTo",
        "equals",
        "",
        "",
        "hashCode",
        "toString",
        "",
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
        "2.3",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/time/ExperimentalTime;"
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
.field public static final Companion:Lkotlin/time/Instant$Companion;

.field private static final MAX:Lkotlin/time/Instant;

.field private static final MIN:Lkotlin/time/Instant;


# instance fields
.field private final epochSeconds:J

.field private final nanosecondsOfSecond:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkotlin/time/Instant$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/time/Instant$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    .line 437
    new-instance v0, Lkotlin/time/Instant;

    const-wide v1, -0x701cefeb9bec00L

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lkotlin/time/Instant;-><init>(JI)V

    sput-object v0, Lkotlin/time/Instant;->MIN:Lkotlin/time/Instant;

    .line 438
    new-instance v0, Lkotlin/time/Instant;

    const-wide v1, 0x701cd2fa9578ffL

    const v3, 0x3b9ac9ff

    invoke-direct {v0, v1, v2, v3}, Lkotlin/time/Instant;-><init>(JI)V

    sput-object v0, Lkotlin/time/Instant;->MAX:Lkotlin/time/Instant;

    return-void
.end method

.method public constructor <init>(JI)V
    .registers 6

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-wide p1, p0, Lkotlin/time/Instant;->epochSeconds:J

    .line 130
    iput p3, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    const-wide v0, -0x701cefeb9bec00L

    cmp-long p0, v0, p1

    if-gtz p0, :cond_1a

    const-wide v0, 0x701cd2fa957900L

    cmp-long p0, p1, v0

    if-gez p0, :cond_1a

    return-void

    .line 134
    :cond_1a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Instant exceeds minimum or maximum instant"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final synthetic access$getMAX$cp()Lkotlin/time/Instant;
    .registers 1

    .line 105
    sget-object v0, Lkotlin/time/Instant;->MAX:Lkotlin/time/Instant;

    return-object v0
.end method

.method public static final synthetic access$getMIN$cp()Lkotlin/time/Instant;
    .registers 1

    .line 105
    sget-object v0, Lkotlin/time/Instant;->MIN:Lkotlin/time/Instant;

    return-object v0
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 2

    .line 271
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Deserialization is supported via proxy only"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 1

    .line 269
    invoke-static {p0}, Lkotlin/time/InstantJvmKt;->serializedInstant(Lkotlin/time/Instant;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 105
    check-cast p1, Lkotlin/time/Instant;

    invoke-virtual {p0, p1}, Lkotlin/time/Instant;->compareTo(Lkotlin/time/Instant;)I

    move-result p0

    return p0
.end method

.method public compareTo(Lkotlin/time/Instant;)I
    .registers 6

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 242
    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    iget-wide v2, p1, Lkotlin/time/Instant;->epochSeconds:J

    invoke-static {v0, v1, v2, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result v0

    if-eqz v0, :cond_10

    return v0

    .line 246
    :cond_10
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    iget p1, p1, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_19

    .line 250
    instance-of v0, p1, Lkotlin/time/Instant;

    if-eqz v0, :cond_17

    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    check-cast p1, Lkotlin/time/Instant;

    iget-wide v2, p1, Lkotlin/time/Instant;->epochSeconds:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_17

    .line 251
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    iget p1, p1, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    if-ne p0, p1, :cond_17

    goto :goto_19

    :cond_17
    const/4 p0, 0x0

    return p0

    :cond_19
    :goto_19
    const/4 p0, 0x1

    return p0
.end method

.method public final getEpochSeconds()J
    .registers 3

    .line 120
    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    return-wide v0
.end method

.method public final getNanosecondsOfSecond()I
    .registers 1

    .line 130
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    .line 254
    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    invoke-static {v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result v0

    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    mul-int/lit8 p0, p0, 0x33

    add-int/2addr v0, p0

    return v0
.end method

.method public final minus-LRDsOJo(J)Lkotlin/time/Instant;
    .registers 3

    .line 210
    invoke-static {p1, p2}, Lkotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lkotlin/time/Instant;->plus-LRDsOJo(J)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final minus-UwyO8pc(Lkotlin/time/Instant;)J
    .registers 6

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 229
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    iget-wide v2, p1, Lkotlin/time/Instant;->epochSeconds:J

    sub-long/2addr v0, v2

    sget-object v2, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1, v2}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide v0

    .line 230
    sget-object v2, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    iget p1, p1, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    sub-int/2addr p0, p1

    sget-object p1, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    .line 229
    invoke-static {v0, v1, p0, p1}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public final plus-LRDsOJo(J)Lkotlin/time/Instant;
    .registers 14

    .line 913
    invoke-static {p1, p2}, Lkotlin/time/Duration;->getInWholeSeconds-impl(J)J

    move-result-wide v0

    invoke-static {p1, p2}, Lkotlin/time/Duration;->getNanosecondsComponent-impl(J)I

    move-result v2

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_11

    if-nez v2, :cond_11

    return-object p0

    .line 188
    :cond_11
    iget-wide v5, p0, Lkotlin/time/Instant;->epochSeconds:J

    add-long v7, v5, v0

    xor-long v9, v5, v7

    cmp-long v9, v9, v3

    if-gez v9, :cond_2c

    xor-long/2addr v0, v5

    cmp-long v0, v0, v3

    if-ltz v0, :cond_2c

    .line 189
    invoke-static {p1, p2}, Lkotlin/time/Duration;->isPositive-impl(J)Z

    move-result p0

    if-eqz p0, :cond_29

    sget-object p0, Lkotlin/time/Instant;->MAX:Lkotlin/time/Instant;

    return-object p0

    :cond_29
    sget-object p0, Lkotlin/time/Instant;->MIN:Lkotlin/time/Instant;

    return-object p0

    .line 192
    :cond_2c
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    add-int/2addr p0, v2

    .line 193
    sget-object p1, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-virtual {p1, v7, v8, p0}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final toEpochMilliseconds()J
    .registers 13

    .line 149
    iget-wide v0, p0, Lkotlin/time/Instant;->epochSeconds:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const v5, 0xf4240

    const-wide/16 v6, 0x3e8

    const-wide/16 v8, 0x1

    if-ltz v4, :cond_3c

    cmp-long v4, v0, v8

    const-wide v8, 0x7fffffffffffffffL

    if-nez v4, :cond_19

    goto :goto_29

    :cond_19
    cmp-long v4, v0, v2

    if-eqz v4, :cond_28

    mul-long v10, v0, v6

    .line 883
    div-long v6, v10, v6

    cmp-long v0, v6, v0

    if-nez v0, :cond_27

    move-wide v6, v10

    goto :goto_29

    :cond_27
    return-wide v8

    :cond_28
    move-wide v6, v2

    .line 153
    :goto_29
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    div-int/2addr p0, v5

    int-to-long v0, p0

    add-long v4, v6, v0

    xor-long v10, v6, v4

    cmp-long p0, v10, v2

    if-gez p0, :cond_3b

    xor-long/2addr v0, v6

    cmp-long p0, v0, v2

    if-ltz p0, :cond_3b

    return-wide v8

    :cond_3b
    return-wide v4

    :cond_3c
    add-long/2addr v0, v8

    cmp-long v4, v0, v8

    const-wide/high16 v8, -0x8000000000000000L

    if-nez v4, :cond_44

    goto :goto_54

    :cond_44
    cmp-long v4, v0, v2

    if-eqz v4, :cond_53

    mul-long v10, v0, v6

    .line 903
    div-long v6, v10, v6

    cmp-long v0, v6, v0

    if-nez v0, :cond_52

    move-wide v6, v10

    goto :goto_54

    :cond_52
    return-wide v8

    :cond_53
    move-wide v6, v2

    .line 164
    :goto_54
    iget p0, p0, Lkotlin/time/Instant;->nanosecondsOfSecond:I

    div-int/2addr p0, v5

    add-int/lit16 p0, p0, -0x3e8

    int-to-long v0, p0

    add-long v4, v6, v0

    xor-long v10, v6, v4

    cmp-long p0, v10, v2

    if-gez p0, :cond_68

    xor-long/2addr v0, v6

    cmp-long p0, v0, v2

    if-ltz p0, :cond_68

    return-wide v8

    :cond_68
    return-wide v4
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 267
    # invokes: Lkotlin/time/InstantKt;->formatIso(Lkotlin/time/Instant;)Ljava/lang/String;
    invoke-static {p0}, Lkotlin/time/InstantKt;->access$formatIso(Lkotlin/time/Instant;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
