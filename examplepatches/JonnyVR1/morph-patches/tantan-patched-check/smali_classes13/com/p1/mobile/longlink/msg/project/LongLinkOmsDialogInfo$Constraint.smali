.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ConstraintOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Constraint"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ConstraintOrBuilder;"
    }
.end annotation


# static fields
.field public static final COUNT_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

.field public static final FREQUENCY_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRIORITY_FIELD_NUMBER:I = 0x6

.field public static final SESSIONCOUNT_FIELD_NUMBER:I = 0x2

.field public static final TIMEPERDAY_FIELD_NUMBER:I = 0x5

.field public static final TIMERANGE_FIELD_NUMBER:I = 0x4


# instance fields
.field private bitField0_:I

.field private count_:I

.field private frequency_:Lcom/google/protobuf/l$f;

.field private priority_:I

.field private sessionCount_:I

.field private timePerDay_:I

.field private timeRange_:Lcom/google/protobuf/l$g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyIntList()Lcom/google/protobuf/l$f;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->addAllFrequency(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllFrequency(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureFrequencyIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllTimeRange(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureTimeRangeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addFrequency(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureFrequencyIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$f;->U(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addTimeRange(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureTimeRangeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$g;->u(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->addAllTimeRange(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->addFrequency(I)V

    return-void
.end method

.method private clearCount()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearFrequency()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyIntList()Lcom/google/protobuf/l$f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 6
    .line 7
    return-void
.end method

.method private clearPriority()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSessionCount()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTimePerDay()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTimeRange()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->addTimeRange(J)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearCount()V

    return-void
.end method

.method private ensureFrequencyIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$f;)Lcom/google/protobuf/l$f;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureTimeRangeIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearFrequency()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearPriority()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearSessionCount()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearTimePerDay()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->clearTimeRange()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setCount(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setFrequency(II)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setPriority(I)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setSessionCount(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setTimePerDay(I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->setTimeRange(IJ)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-object v0
.end method

.method private setCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 2
    .line 3
    return-void
.end method

.method private setFrequency(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureFrequencyIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$f;->setInt(II)I

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setPriority(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSessionCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTimePerDay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTimeRange(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->ensureTimeRangeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2, p3}, Lcom/google/protobuf/l$g;->setLong(IJ)J

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->PARSER:Ll/ng60;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 50
    .line 51
    check-cast p3, Lcom/google/protobuf/h;

    .line 52
    .line 53
    :cond_2
    :goto_3
    if-nez v1, :cond_12

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/16 p3, 0x8

    .line 62
    .line 63
    if-eq p1, p3, :cond_11

    .line 64
    .line 65
    const/16 p3, 0x10

    .line 66
    .line 67
    if-eq p1, p3, :cond_10

    .line 68
    .line 69
    const/16 p3, 0x18

    .line 70
    .line 71
    if-eq p1, p3, :cond_e

    .line 72
    .line 73
    const/16 p3, 0x1a

    .line 74
    .line 75
    if-eq p1, p3, :cond_b

    .line 76
    .line 77
    const/16 p3, 0x20

    .line 78
    .line 79
    if-eq p1, p3, :cond_9

    .line 80
    .line 81
    const/16 p3, 0x22

    .line 82
    .line 83
    if-eq p1, p3, :cond_6

    .line 84
    .line 85
    const/16 p3, 0x28

    .line 86
    .line 87
    if-eq p1, p3, :cond_5

    .line 88
    .line 89
    const/16 p3, 0x30

    .line 90
    .line 91
    if-eq p1, p3, :cond_4

    .line 92
    .line 93
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_2

    .line 98
    .line 99
    :cond_3
    move v1, v2

    .line 100
    goto :goto_3

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto/16 :goto_6

    .line 103
    .line 104
    :catch_1
    move-exception p1

    .line 105
    goto/16 :goto_7

    .line 106
    .line 107
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->l(I)I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 130
    .line 131
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    if-nez p3, :cond_7

    .line 136
    .line 137
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 138
    .line 139
    .line 140
    move-result p3

    .line 141
    if-lez p3, :cond_7

    .line 142
    .line 143
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 144
    .line 145
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 150
    .line 151
    :cond_7
    :goto_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 152
    .line 153
    .line 154
    move-result p3

    .line 155
    if-lez p3, :cond_8

    .line 156
    .line 157
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 158
    .line 159
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 160
    .line 161
    .line 162
    move-result-wide v3

    .line 163
    invoke-interface {p3, v3, v4}, Lcom/google/protobuf/l$g;->u(J)V

    .line 164
    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_8
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->k(I)V

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 172
    .line 173
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-nez p1, :cond_a

    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 180
    .line 181
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 186
    .line 187
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 188
    .line 189
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 190
    .line 191
    .line 192
    move-result-wide v3

    .line 193
    invoke-interface {p1, v3, v4}, Lcom/google/protobuf/l$g;->u(J)V

    .line 194
    .line 195
    .line 196
    goto/16 :goto_3

    .line 197
    .line 198
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->l(I)I

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 207
    .line 208
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 209
    .line 210
    .line 211
    move-result p3

    .line 212
    if-nez p3, :cond_c

    .line 213
    .line 214
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 215
    .line 216
    .line 217
    move-result p3

    .line 218
    if-lez p3, :cond_c

    .line 219
    .line 220
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 221
    .line 222
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$f;)Lcom/google/protobuf/l$f;

    .line 223
    .line 224
    .line 225
    move-result-object p3

    .line 226
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 227
    .line 228
    :cond_c
    :goto_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 229
    .line 230
    .line 231
    move-result p3

    .line 232
    if-lez p3, :cond_d

    .line 233
    .line 234
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 235
    .line 236
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    invoke-interface {p3, v3}, Lcom/google/protobuf/l$f;->U(I)V

    .line 241
    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_d
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->k(I)V

    .line 245
    .line 246
    .line 247
    goto/16 :goto_3

    .line 248
    .line 249
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 250
    .line 251
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-nez p1, :cond_f

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 258
    .line 259
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$f;)Lcom/google/protobuf/l$f;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 264
    .line 265
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 266
    .line 267
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 268
    .line 269
    .line 270
    move-result p3

    .line 271
    invoke-interface {p1, p3}, Lcom/google/protobuf/l$f;->U(I)V

    .line 272
    .line 273
    .line 274
    goto/16 :goto_3

    .line 275
    .line 276
    :cond_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 277
    .line 278
    .line 279
    move-result p1

    .line 280
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 281
    .line 282
    goto/16 :goto_3

    .line 283
    .line 284
    :cond_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 289
    .line 290
    goto/16 :goto_3

    .line 291
    .line 292
    :catchall_1
    move-exception p0

    .line 293
    throw p0

    .line 294
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 295
    .line 296
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 308
    .line 309
    .line 310
    return-object v0

    .line 311
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 316
    .line 317
    .line 318
    return-object v0

    .line 319
    :cond_12
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 320
    .line 321
    return-object p0

    .line 322
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 323
    .line 324
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 325
    .line 326
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 327
    .line 328
    if-eqz p1, :cond_13

    .line 329
    .line 330
    move v0, v2

    .line 331
    goto :goto_8

    .line 332
    :cond_13
    move v0, v1

    .line 333
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 334
    .line 335
    if-eqz v3, :cond_14

    .line 336
    .line 337
    move v4, v2

    .line 338
    goto :goto_9

    .line 339
    :cond_14
    move v4, v1

    .line 340
    :goto_9
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 341
    .line 342
    .line 343
    move-result p1

    .line 344
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 345
    .line 346
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 347
    .line 348
    if-eqz p1, :cond_15

    .line 349
    .line 350
    move v0, v2

    .line 351
    goto :goto_a

    .line 352
    :cond_15
    move v0, v1

    .line 353
    :goto_a
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 354
    .line 355
    if-eqz v3, :cond_16

    .line 356
    .line 357
    move v4, v2

    .line 358
    goto :goto_b

    .line 359
    :cond_16
    move v4, v1

    .line 360
    :goto_b
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 361
    .line 362
    .line 363
    move-result p1

    .line 364
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 365
    .line 366
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 367
    .line 368
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 369
    .line 370
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->n(Lcom/google/protobuf/l$f;Lcom/google/protobuf/l$f;)Lcom/google/protobuf/l$f;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 375
    .line 376
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 377
    .line 378
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 379
    .line 380
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->q(Lcom/google/protobuf/l$g;Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 385
    .line 386
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 387
    .line 388
    if-eqz p1, :cond_17

    .line 389
    .line 390
    move v0, v2

    .line 391
    goto :goto_c

    .line 392
    :cond_17
    move v0, v1

    .line 393
    :goto_c
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 394
    .line 395
    if-eqz v3, :cond_18

    .line 396
    .line 397
    move v4, v2

    .line 398
    goto :goto_d

    .line 399
    :cond_18
    move v4, v1

    .line 400
    :goto_d
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 401
    .line 402
    .line 403
    move-result p1

    .line 404
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 405
    .line 406
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 407
    .line 408
    if-eqz p1, :cond_19

    .line 409
    .line 410
    move v0, v2

    .line 411
    goto :goto_e

    .line 412
    :cond_19
    move v0, v1

    .line 413
    :goto_e
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 414
    .line 415
    if-eqz v3, :cond_1a

    .line 416
    .line 417
    move v1, v2

    .line 418
    :cond_1a
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 423
    .line 424
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 425
    .line 426
    if-ne p2, p1, :cond_1b

    .line 427
    .line 428
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->bitField0_:I

    .line 429
    .line 430
    iget p2, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->bitField0_:I

    .line 431
    .line 432
    or-int/2addr p1, p2

    .line 433
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->bitField0_:I

    .line 434
    .line 435
    :cond_1b
    return-object p0

    .line 436
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    .line 437
    .line 438
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;-><init>(Ll/p3w;)V

    .line 439
    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 443
    .line 444
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 445
    .line 446
    .line 447
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 448
    .line 449
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 450
    .line 451
    .line 452
    return-object v0

    .line 453
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 454
    .line 455
    return-object p0

    .line 456
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 457
    .line 458
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;-><init>()V

    .line 459
    .line 460
    .line 461
    return-object p0

    .line 462
    nop

    .line 463
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrequency(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$f;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrequencyCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFrequencyList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v1

    .line 19
    :goto_0
    iget v2, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 20
    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v0, v2

    .line 29
    :cond_2
    move v2, v1

    .line 30
    move v3, v2

    .line 31
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 32
    .line 33
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ge v2, v4, :cond_3

    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 40
    .line 41
    invoke-interface {v4, v2}, Lcom/google/protobuf/l$f;->getInt(I)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-static {v4}, Lcom/google/protobuf/CodedOutputStream;->u(I)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    add-int/2addr v3, v4

    .line 50
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    add-int/2addr v0, v3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->getFrequencyList()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    move v2, v1

    .line 64
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-ge v1, v3, :cond_4

    .line 71
    .line 72
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 73
    .line 74
    invoke-interface {v3, v1}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 75
    .line 76
    .line 77
    move-result-wide v3

    .line 78
    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->w(J)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    add-int/2addr v2, v3

    .line 83
    add-int/lit8 v1, v1, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    add-int/2addr v0, v2

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->getTimeRangeList()Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    add-int/2addr v0, v1

    .line 96
    iget v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 97
    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    const/4 v2, 0x5

    .line 101
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_5
    iget v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    const/4 v2, 0x6

    .line 111
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 117
    .line 118
    return v0
.end method

.method public getSessionCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimePerDay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimeRange(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getTimeRangeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTimeRangeList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->getSerializedSize()I

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->count_:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->sessionCount_:I

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 18
    .line 19
    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    move v1, v0

    .line 22
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge v1, v2, :cond_2

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->frequency_:Lcom/google/protobuf/l$f;

    .line 31
    .line 32
    invoke-interface {v2, v1}, Lcom/google/protobuf/l$f;->getInt(I)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x3

    .line 37
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-ge v0, v1, :cond_3

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timeRange_:Lcom/google/protobuf/l$g;

    .line 52
    .line 53
    invoke-interface {v1, v0}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    const/4 v3, 0x4

    .line 58
    invoke-virtual {p1, v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->timePerDay_:I

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x5

    .line 69
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->priority_:I

    .line 73
    .line 74
    if-eqz p0, :cond_5

    .line 75
    .line 76
    const/4 v0, 0x6

    .line 77
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 78
    .line 79
    .line 80
    :cond_5
    return-void
.end method
