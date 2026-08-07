.class public final Ll/mjq0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mjq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u000c\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003Je\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\n8\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u0018\u001a\u00020\u00178\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R,\u0010\u001e\u001a\u001a\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001c0\u001b\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001d0\u001b0\u001a8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "Ll/mjq0$a;",
        "",
        "<init>",
        "()V",
        "",
        "isBackedOff",
        "",
        "runAttemptCount",
        "Landroidx/work/BackoffPolicy;",
        "backoffPolicy",
        "",
        "backoffDelayDuration",
        "lastEnqueueTime",
        "periodCount",
        "isPeriodic",
        "initialDelay",
        "flexDuration",
        "intervalDuration",
        "nextScheduleTimeOverride",
        "a",
        "(ZILandroidx/work/BackoffPolicy;JJIZJJJJ)J",
        "SCHEDULE_NOT_REQUESTED_YET",
        "J",
        "",
        "TAG",
        "Ljava/lang/String;",
        "Ll/cdj;",
        "",
        "Ll/mjq0$c;",
        "Landroidx/work/WorkInfo;",
        "WORK_INFO_MAPPER",
        "Ll/cdj;",
        "work-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mjq0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(ZILandroidx/work/BackoffPolicy;JJIZJJJJ)J
    .locals 4
    .param p3    # Landroidx/work/BackoffPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-wide/from16 v0, p16

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-wide v2, 0x7fffffffffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    cmp-long p0, v0, v2

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    if-eqz p9, :cond_1

    .line 16
    .line 17
    if-nez p8, :cond_0

    .line 18
    .line 19
    return-wide v0

    .line 20
    :cond_0
    const-wide/32 p0, 0xdbba0

    .line 21
    .line 22
    .line 23
    add-long/2addr p6, p0

    .line 24
    invoke-static {v0, v1, p6, p7}, Lkotlin/ranges/a;->c(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    return-wide p0

    .line 29
    :cond_1
    if-eqz p1, :cond_3

    .line 30
    .line 31
    sget-object p0, Landroidx/work/BackoffPolicy;->LINEAR:Landroidx/work/BackoffPolicy;

    .line 32
    .line 33
    if-ne p3, p0, :cond_2

    .line 34
    .line 35
    int-to-long p0, p2

    .line 36
    mul-long/2addr p4, p0

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    long-to-float p0, p4

    .line 39
    add-int/lit8 p2, p2, -0x1

    .line 40
    .line 41
    invoke-static {p0, p2}, Ljava/lang/Math;->scalb(FI)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    float-to-long p4, p0

    .line 46
    :goto_0
    const-wide/32 p0, 0x112a880

    .line 47
    .line 48
    .line 49
    invoke-static {p4, p5, p0, p1}, Lkotlin/ranges/a;->f(JJ)J

    .line 50
    .line 51
    .line 52
    move-result-wide p0

    .line 53
    :goto_1
    add-long/2addr p6, p0

    .line 54
    return-wide p6

    .line 55
    :cond_3
    if-eqz p9, :cond_6

    .line 56
    .line 57
    if-nez p8, :cond_4

    .line 58
    .line 59
    add-long/2addr p6, p10

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    add-long p6, p6, p14

    .line 62
    .line 63
    :goto_2
    cmp-long p0, p12, p14

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    if-nez p8, :cond_5

    .line 68
    .line 69
    sub-long p0, p14, p12

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    return-wide p6

    .line 73
    :cond_6
    const-wide/16 p0, -0x1

    .line 74
    .line 75
    cmp-long p0, p6, p0

    .line 76
    .line 77
    if-nez p0, :cond_7

    .line 78
    .line 79
    return-wide v2

    .line 80
    :cond_7
    add-long/2addr p6, p10

    .line 81
    return-wide p6
.end method
