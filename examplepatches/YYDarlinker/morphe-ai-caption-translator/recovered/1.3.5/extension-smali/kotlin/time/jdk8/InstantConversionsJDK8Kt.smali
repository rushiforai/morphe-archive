.class public final Lkotlin/time/jdk8/InstantConversionsJDK8Kt;
.super Ljava/lang/Object;
.source "InstantConversions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a.\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0010\u0008\u0006\u0012\u000c\u0008\u0007\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0008\u001a.\u0010\t\u001a\u00020\u0002*\u00020\u0001H\u0087\u0080\u0004b\u000c\u0008\u0003\u0012\u0008\u0008\u0004\u0012\u0004\u0008\u0008(\u0005b\u0010\u0008\u0006\u0012\u000c\u0008\u0007\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0008\u00a8\u0006\n"
    }
    d2 = {
        "toJavaInstant",
        "Ljava/time/Instant;",
        "Lkotlin/time/Instant;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.3",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/time/ExperimentalTime;",
        "toKotlinInstant",
        "kotlin-stdlib-jdk8"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    pn = "kotlin.time"
    xi = 0x30
.end annotation


# direct methods
.method public static final toJavaInstant(Lkotlin/time/Instant;)Ljava/time/Instant;
    .registers 5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0}, Lkotlin/time/Instant;->getEpochSeconds()J

    move-result-wide v0

    invoke-virtual {p0}, Lkotlin/time/Instant;->getNanosecondsOfSecond()I

    move-result p0

    int-to-long v2, p0

    invoke-static {v0, v1, v2, v3}, Lkotlin/streams/jdk8/StreamsKt$$ExternalSyntheticApiModelOutline0;->m(JJ)Ljava/time/Instant;

    move-result-object p0

    const-string v0, "ofEpochSecond(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final toKotlinInstant(Ljava/time/Instant;)Lkotlin/time/Instant;
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    sget-object v0, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-static {p0}, Lkotlin/streams/jdk8/StreamsKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/time/Instant;)J

    move-result-wide v1

    invoke-static {p0}, Lkotlin/streams/jdk8/StreamsKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/time/Instant;)I

    move-result p0

    invoke-virtual {v0, v1, v2, p0}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object p0

    return-object p0
.end method
