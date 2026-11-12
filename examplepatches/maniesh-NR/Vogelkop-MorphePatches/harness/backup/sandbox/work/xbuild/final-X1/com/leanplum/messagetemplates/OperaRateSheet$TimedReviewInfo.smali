.class final Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/OperaRateSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TimedReviewInfo"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\n\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0008\u0082\u0008\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0010\u0010\u000f\u001a\u00020\u0004H\u00c6\u0003\u00a2\u0006\u0004\u0008\r\u0010\u000eJ$\u0010\u0012\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004H\u00c6\u0001\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0010\u0010\u0014\u001a\u00020\u0013H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u00172\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u000cR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u000e\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;",
        "",
        "Lz1i;",
        "reviewInfo",
        "Lpn7;",
        "fetchTime",
        "<init>",
        "(Lz1i;JLkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "component1",
        "()Lz1i;",
        "component2-UwyO8pc",
        "()J",
        "component2",
        "copy-HG0u8IE",
        "(Lz1i;J)Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;",
        "copy",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Lz1i;",
        "getReviewInfo",
        "J",
        "getFetchTime-UwyO8pc",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final fetchTime:J

.field private final reviewInfo:Lz1i;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lz1i;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    iput-wide p2, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    return-void
.end method

.method public synthetic constructor <init>(Lz1i;JLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    .line 8
    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;-><init>(Lz1i;J)V

    return-void
.end method

.method public static synthetic copy-HG0u8IE$default(Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lz1i;JILjava/lang/Object;)Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_6

    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    :cond_6
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_c

    iget-wide p2, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    :cond_c
    invoke-virtual {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->copy-HG0u8IE(Lz1i;J)Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lz1i;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    return-object p0
.end method

.method public final component2-UwyO8pc()J
    .registers 3

    iget-wide v0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    return-wide v0
.end method

.method public final copy-HG0u8IE(Lz1i;J)Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;
    .registers 5
    .param p1    # Lz1i;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;-><init>(Lz1i;JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    iget-object v3, p1, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-wide v3, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    iget-wide p0, p1, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    invoke-static {v3, v4, p0, p1}, Lpn7;->e(JJ)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final getFetchTime-UwyO8pc()J
    .registers 3

    iget-wide v0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    return-wide v0
.end method

.method public final getReviewInfo()Lz1i;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    return-object p0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->reviewInfo:Lz1i;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->fetchTime:J

    sget-object p0, Lpn7;->b:Lon7;

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, ""

    return-object p0
.end method
