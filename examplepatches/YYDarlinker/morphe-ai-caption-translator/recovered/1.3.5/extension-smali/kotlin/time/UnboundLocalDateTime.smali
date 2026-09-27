.class final Lkotlin/time/UnboundLocalDateTime;
.super Ljava/lang/Object;
.source "Instant.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/UnboundLocalDateTime$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0002\u0018\u0000 !2\u00020\u0001:\u0001!BA\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJX\u0010\u0014\u001a\u0002H\u0015\"\u0004\u0008\u0000\u0010\u00152\u0006\u0010\u0016\u001a\u00020\u000326\u0010\u0017\u001a2\u0012\u0013\u0012\u00110\u0019\u00a2\u0006\u000c\u0008\u001a\u0012\u0008\u0008\u001b\u0012\u0004\u0008\u0008(\u001c\u0012\u0013\u0012\u00110\u0003\u00a2\u0006\u000c\u0008\u001a\u0012\u0008\u0008\u001b\u0012\u0004\u0008\u0008(\u001d\u0012\u0004\u0012\u0002H\u00150\u0018H\u0086\u0088\u0004\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u001eJ\n\u0010\u001f\u001a\u00020 H\u0096\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0015\u0010\u0004\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\rR\u0015\u0010\u0005\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\rR\u0015\u0010\u0006\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\rR\u0015\u0010\u0007\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\rR\u0015\u0010\u0008\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\rR\u0015\u0010\t\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\r\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\""
    }
    d2 = {
        "Lkotlin/time/UnboundLocalDateTime;",
        "",
        "year",
        "",
        "month",
        "day",
        "hour",
        "minute",
        "second",
        "nanosecond",
        "<init>",
        "(IIIIIII)V",
        "getYear",
        "()I",
        "getMonth",
        "getDay",
        "getHour",
        "getMinute",
        "getSecond",
        "getNanosecond",
        "toInstant",
        "T",
        "offsetSeconds",
        "buildInstant",
        "Lkotlin/Function2;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "epochSeconds",
        "nanosecondOfSecond",
        "(ILkotlin/jvm/functions/Function2;)Ljava/lang/Object;",
        "toString",
        "",
        "Companion",
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


# static fields
.field public static final Companion:Lkotlin/time/UnboundLocalDateTime$Companion;


# instance fields
.field private final day:I

.field private final hour:I

.field private final minute:I

.field private final month:I

.field private final nanosecond:I

.field private final second:I

.field private final year:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/time/UnboundLocalDateTime$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/time/UnboundLocalDateTime$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/time/UnboundLocalDateTime;->Companion:Lkotlin/time/UnboundLocalDateTime$Companion;

    return-void
.end method

.method public constructor <init>(IIIIIII)V
    .registers 8

    .line 481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 482
    iput p1, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    .line 483
    iput p2, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    .line 484
    iput p3, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    .line 485
    iput p4, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    .line 486
    iput p5, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    .line 487
    iput p6, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    .line 488
    iput p7, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    return-void
.end method


# virtual methods
.method public final getDay()I
    .registers 1

    .line 484
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    return p0
.end method

.method public final getHour()I
    .registers 1

    .line 485
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    return p0
.end method

.method public final getMinute()I
    .registers 1

    .line 486
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    return p0
.end method

.method public final getMonth()I
    .registers 1

    .line 483
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    return p0
.end method

.method public final getNanosecond()I
    .registers 1

    .line 488
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    return p0
.end method

.method public final getSecond()I
    .registers 1

    .line 487
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    return p0
.end method

.method public final getYear()I
    .registers 1

    .line 482
    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    return p0
.end method

.method public final toInstant(ILkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/Long;",
            "-",
            "Ljava/lang/Integer;",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "buildInstant"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 491
    move-object v0, p0

    check-cast v0, Lkotlin/time/UnboundLocalDateTime;

    .line 494
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getYear()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x16d

    mul-long/2addr v2, v0

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-ltz v4, :cond_2c

    const-wide/16 v4, 0x3

    add-long/2addr v4, v0

    const-wide/16 v6, 0x4

    .line 498
    div-long/2addr v4, v6

    const-wide/16 v6, 0x63

    add-long/2addr v6, v0

    const-wide/16 v8, 0x64

    div-long/2addr v6, v8

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x18f

    add-long/2addr v0, v6

    const-wide/16 v6, 0x190

    div-long/2addr v0, v6

    add-long/2addr v4, v0

    add-long/2addr v2, v4

    goto :goto_3a

    :cond_2c
    const-wide/16 v4, -0x4

    .line 501
    div-long v4, v0, v4

    const-wide/16 v6, -0x64

    div-long v6, v0, v6

    sub-long/2addr v4, v6

    const-wide/16 v6, -0x190

    div-long/2addr v0, v6

    add-long/2addr v4, v0

    sub-long/2addr v2, v4

    .line 505
    :goto_3a
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getMonth()I

    move-result v0

    mul-int/lit16 v0, v0, 0x16f

    add-int/lit16 v0, v0, -0x16a

    div-int/lit8 v0, v0, 0xc

    int-to-long v0, v0

    add-long/2addr v2, v0

    .line 506
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getDay()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    int-to-long v0, v0

    add-long/2addr v2, v0

    .line 507
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getMonth()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_67

    const-wide/16 v0, -0x1

    add-long/2addr v0, v2

    .line 509
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getYear()I

    move-result v4

    invoke-static {v4}, Lkotlin/time/InstantKt;->isLeapYear(I)Z

    move-result v4

    if-nez v4, :cond_66

    const-wide/16 v0, -0x2

    add-long/2addr v2, v0

    goto :goto_67

    :cond_66
    move-wide v2, v0

    :cond_67
    :goto_67
    const-wide/32 v0, 0xafaa8

    sub-long/2addr v2, v0

    .line 515
    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getHour()I

    move-result v0

    mul-int/lit16 v0, v0, 0xe10

    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getMinute()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3c

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getSecond()I

    move-result v1

    add-int/2addr v0, v1

    const-wide/32 v4, 0x15180

    mul-long/2addr v2, v4

    int-to-long v0, v0

    add-long/2addr v2, v0

    int-to-long v0, p1

    sub-long/2addr v2, v0

    .line 518
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0}, Lkotlin/time/UnboundLocalDateTime;->getNanosecond()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p2, p1, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 521
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UnboundLocalDateTime("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v2, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v2, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
