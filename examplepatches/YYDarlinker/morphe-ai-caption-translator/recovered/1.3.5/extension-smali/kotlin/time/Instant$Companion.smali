.class public final Lkotlin/time/Instant$Companion;
.super Ljava/lang/Object;
.source "Instant.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/Instant;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nInstant.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Instant.kt\nkotlin/time/Instant$Companion\n+ 2 Instant.kt\nkotlin/time/InstantKt\n*L\n1#1,871:1\n793#2,6:872\n*S KotlinDebug\n*F\n+ 1 Instant.kt\nkotlin/time/Instant$Companion\n*L\n320#1:872,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u000b\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JH\u0010\u0004\u001a\u00020\u0005H\u0087\u0080\u0004b<\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\"\u0008\t\u0012\u001e\u0008\u000bB\u001a\u0008\n\u0012\u0008\u0008\u000b\u0012\u0004\u0008\u0008(\u000c\u0012\u000c\u0008\r\u0012\u0008\u0008\u000cJ\u0004\u0008\u0008(\u000e\u0012\n\u0008\u000f\u0012\u0006\u0008\n0\u00108\u0011J\u0012\u0010\u0012\u001a\u00020\u00052\u0006\u0010\u0013\u001a\u00020\u0014H\u0086\u0080\u0004J\u001c\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u00142\u0008\u0008\u0002\u0010\u0017\u001a\u00020\u0014H\u0086\u0080\u0004J\u001a\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0018H\u0086\u0080\u0004J\u0012\u0010\u0019\u001a\u00020\u00052\u0006\u0010\u001a\u001a\u00020\u001bH\u0086\u0080\u0004J\u0014\u0010\u001c\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u001a\u001a\u00020\u001bH\u0086\u0080\u0004R\u0015\u0010\u001d\u001a\u00020\u00058FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u001e\u0010\u001fR\u0015\u0010 \u001a\u00020\u00058FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008!\u0010\u001fR\u0015\u0010\"\u001a\u00020\u0005X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\u001fR\u0015\u0010$\u001a\u00020\u0005X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\u001f\u00a8\u0006&"
    }
    d2 = {
        "Lkotlin/time/Instant$Companion;",
        "",
        "<init>",
        "()V",
        "now",
        "Lkotlin/time/Instant;",
        "Lkotlin/Deprecated;",
        "message",
        "Use Clock.System.now() instead",
        "replaceWith",
        "Lkotlin/ReplaceWith;",
        "expression",
        "Clock.System.now()",
        "imports",
        "kotlin.time.Clock",
        "level",
        "Lkotlin/DeprecationLevel;",
        "ERROR",
        "fromEpochMilliseconds",
        "epochMilliseconds",
        "",
        "fromEpochSeconds",
        "epochSeconds",
        "nanosecondAdjustment",
        "",
        "parse",
        "input",
        "",
        "parseOrNull",
        "DISTANT_PAST",
        "getDISTANT_PAST",
        "()Lkotlin/time/Instant;",
        "DISTANT_FUTURE",
        "getDISTANT_FUTURE",
        "MIN",
        "getMIN$kotlin_stdlib",
        "MAX",
        "getMAX$kotlin_stdlib",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/time/Instant$Companion;-><init>()V

    return-void
.end method

.method public static synthetic fromEpochSeconds$default(Lkotlin/time/Instant$Companion;JJILjava/lang/Object;)Lkotlin/time/Instant;
    .registers 7

    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_6

    const-wide/16 p3, 0x0

    .line 319
    :cond_6
    invoke-virtual {p0, p1, p2, p3, p4}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JJ)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final fromEpochMilliseconds(J)Lkotlin/time/Instant;
    .registers 11

    const-wide/16 v0, 0x3e8

    .line 288
    div-long v2, p1, v0

    xor-long v4, p1, v0

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_15

    mul-long v4, v2, v0

    cmp-long v4, v4, p1

    if-eqz v4, :cond_15

    const-wide/16 v4, -0x1

    add-long/2addr v2, v4

    .line 289
    :cond_15
    rem-long/2addr p1, v0

    xor-long v4, p1, v0

    neg-long v6, p1

    or-long/2addr v6, p1

    and-long/2addr v4, v6

    const/16 v6, 0x3f

    shr-long/2addr v4, v6

    and-long/2addr v0, v4

    add-long/2addr p1, v0

    const-wide/32 v0, 0xf4240

    mul-long/2addr p1, v0

    long-to-int p1, p1

    const-wide v0, -0x701cefeb9bec00L

    cmp-long p2, v2, v0

    if-gez p2, :cond_33

    .line 291
    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMIN$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    :cond_33
    const-wide v0, 0x701cd2fa9578ffL

    cmp-long p2, v2, v0

    if-lez p2, :cond_41

    .line 292
    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMAX$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    .line 293
    :cond_41
    invoke-virtual {p0, v2, v3, p1}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final fromEpochSeconds(JI)Lkotlin/time/Instant;
    .registers 6

    int-to-long v0, p3

    .line 356
    invoke-virtual {p0, p1, p2, v0, v1}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JJ)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final fromEpochSeconds(JJ)Lkotlin/time/Instant;
    .registers 15

    const-wide/32 v0, 0x3b9aca00

    .line 320
    div-long v2, p3, v0

    xor-long v4, p3, v0

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_16

    mul-long v4, v2, v0

    cmp-long v4, v4, p3

    if-eqz v4, :cond_16

    const-wide/16 v4, -0x1

    add-long/2addr v2, v4

    :cond_16
    add-long v4, p1, v2

    xor-long v8, p1, v4

    cmp-long v8, v8, v6

    if-gez v8, :cond_35

    xor-long/2addr v2, p1

    cmp-long v2, v2, v6

    if-ltz v2, :cond_35

    cmp-long p0, p1, v6

    if-lez p0, :cond_2e

    .line 321
    sget-object p0, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMAX$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    :cond_2e
    sget-object p0, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMIN$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    :cond_35
    const-wide p1, -0x701cefeb9bec00L

    cmp-long p1, v4, p1

    if-gez p1, :cond_43

    .line 324
    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMIN$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    :cond_43
    const-wide p1, 0x701cd2fa9578ffL

    cmp-long p1, v4, p1

    if-lez p1, :cond_51

    .line 325
    invoke-virtual {p0}, Lkotlin/time/Instant$Companion;->getMAX$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0

    .line 327
    :cond_51
    rem-long/2addr p3, v0

    xor-long p0, p3, v0

    neg-long v2, p3

    or-long/2addr v2, p3

    and-long/2addr p0, v2

    const/16 p2, 0x3f

    shr-long/2addr p0, p2

    and-long/2addr p0, v0

    add-long/2addr p3, p0

    long-to-int p0, p3

    .line 328
    new-instance p1, Lkotlin/time/Instant;

    invoke-direct {p1, v4, v5, p0}, Lkotlin/time/Instant;-><init>(JI)V

    return-object p1
.end method

.method public final getDISTANT_FUTURE()Lkotlin/time/Instant;
    .registers 4

    const-wide v0, 0x2d044a2eb00L

    const/4 v2, 0x0

    .line 435
    invoke-virtual {p0, v0, v1, v2}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final getDISTANT_PAST()Lkotlin/time/Instant;
    .registers 4

    const-wide v0, -0x2ed378be301L

    const v2, 0x3b9ac9ff

    .line 425
    invoke-virtual {p0, v0, v1, v2}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final getMAX$kotlin_stdlib()Lkotlin/time/Instant;
    .registers 1

    .line 438
    # getter for: Lkotlin/time/Instant;->MAX:Lkotlin/time/Instant;
    invoke-static {}, Lkotlin/time/Instant;->access$getMAX$cp()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final getMIN$kotlin_stdlib()Lkotlin/time/Instant;
    .registers 1

    .line 437
    # getter for: Lkotlin/time/Instant;->MIN:Lkotlin/time/Instant;
    invoke-static {}, Lkotlin/time/Instant;->access$getMIN$cp()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final now()Lkotlin/time/Instant;
    .registers 3
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->ERROR:Lkotlin/DeprecationLevel;
        message = "Use Clock.System.now() instead"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "Clock.System.now()"
            imports = {
                "kotlin.time.Clock"
            }
        .end subannotation
    .end annotation

    .line 275
    new-instance p0, Lkotlin/NotImplementedError;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lkotlin/NotImplementedError;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    throw p0
.end method

.method public final parse(Ljava/lang/CharSequence;)Lkotlin/time/Instant;
    .registers 2

    const-string p0, "input"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 386
    # invokes: Lkotlin/time/InstantKt;->parseIso(Ljava/lang/CharSequence;)Lkotlin/time/InstantParseResult;
    invoke-static {p1}, Lkotlin/time/InstantKt;->access$parseIso(Ljava/lang/CharSequence;)Lkotlin/time/InstantParseResult;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/time/InstantParseResult;->toInstant()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method

.method public final parseOrNull(Ljava/lang/CharSequence;)Lkotlin/time/Instant;
    .registers 2

    const-string p0, "input"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 415
    # invokes: Lkotlin/time/InstantKt;->parseIso(Ljava/lang/CharSequence;)Lkotlin/time/InstantParseResult;
    invoke-static {p1}, Lkotlin/time/InstantKt;->access$parseIso(Ljava/lang/CharSequence;)Lkotlin/time/InstantParseResult;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/time/InstantParseResult;->toInstantOrNull()Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method
