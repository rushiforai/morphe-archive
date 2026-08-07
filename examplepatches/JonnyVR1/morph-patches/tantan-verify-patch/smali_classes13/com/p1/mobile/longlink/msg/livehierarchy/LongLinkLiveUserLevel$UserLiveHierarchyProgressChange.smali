.class public final Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserLiveHierarchyProgressChange"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChangeOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

.field public static final GRADE_FIELD_NUMBER:I = 0x1

.field public static final JUMPSCHEMA_FIELD_NUMBER:I = 0x6

.field public static final JUMPTEXT_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREGRADE_FIELD_NUMBER:I = 0x7

.field public static final PREWEALTH_FIELD_NUMBER:I = 0x8

.field public static final PROGRESSTEXTS_FIELD_NUMBER:I = 0xc

.field public static final PROGRESSTEXT_FIELD_NUMBER:I = 0x4

.field public static final SERVERTS_FIELD_NUMBER:I = 0x9

.field public static final STYLE_FIELD_NUMBER:I = 0xb

.field public static final SUPERGRADE_FIELD_NUMBER:I = 0xa

.field public static final WEALTHRATIO_FIELD_NUMBER:I = 0x3

.field public static final WEALTH_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private grade_:J

.field private jumpSchema_:Ljava/lang/String;

.field private jumpText_:Ljava/lang/String;

.field private preGrade_:J

.field private preWealth_:J

.field private progressText_:Ljava/lang/String;

.field private progressTexts_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private serverTs_:J

.field private style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

.field private superGrade_:J

.field private wealthRatio_:D

.field private wealth_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setServerTs(J)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setSuperGrade(J)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setWealth(J)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;D)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setWealthRatio(D)V

    return-void
.end method

.method public static bridge synthetic G()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->addAllProgressTexts(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllProgressTexts(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->ensureProgressTextsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addProgressTexts(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->ensureProgressTextsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addProgressTextsBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->ensureProgressTextsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->addProgressTexts(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->addProgressTextsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearJumpSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPreGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearPreWealth()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearProgressText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearProgressTexts()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearServerTs()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearStyle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearSuperGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearWealth()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearWealthRatio()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearGrade()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearJumpSchema()V

    return-void
.end method

.method private ensureProgressTextsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearJumpText()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearPreGrade()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearPreWealth()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearProgressText()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearProgressTexts()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearServerTs()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearStyle()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearSuperGrade()V

    return-void
.end method

.method private mergeStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearWealth()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->clearWealthRatio()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->mergeStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setGrade(J)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setJumpSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setJumpSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpTextBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPreGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setPreWealth(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 2
    .line 3
    return-void
.end method

.method private setProgressText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setProgressTextBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setProgressTexts(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->ensureProgressTextsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setServerTs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 2
    .line 3
    return-void
.end method

.method private setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    return-void
.end method

.method private setSuperGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setWealth(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 2
    .line 3
    return-void
.end method

.method private setWealthRatio(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setJumpText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setJumpTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setPreGrade(J)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setPreWealth(J)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setProgressText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setProgressTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->setProgressTexts(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

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
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_5

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto/16 :goto_5

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_6

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 84
    .line 85
    invoke-interface {v3}, Lcom/google/protobuf/l$h;->q()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_3

    .line 90
    .line 91
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 92
    .line 93
    invoke-static {v3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 98
    .line 99
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 100
    .line 101
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :sswitch_2
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 106
    .line 107
    if-eqz p1, :cond_4

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;

    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_4
    move-object p1, v1

    .line 117
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->parser()Ll/ng60;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 126
    .line 127
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 128
    .line 129
    if-eqz p1, :cond_2

    .line 130
    .line 131
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 144
    .line 145
    .line 146
    move-result-wide v3

    .line 147
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 151
    .line 152
    .line 153
    move-result-wide v3

    .line 154
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 158
    .line 159
    .line 160
    move-result-wide v3

    .line 161
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 165
    .line 166
    .line 167
    move-result-wide v3

    .line 168
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_3

    .line 185
    .line 186
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 191
    .line 192
    goto/16 :goto_3

    .line 193
    .line 194
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->o()D

    .line 195
    .line 196
    .line 197
    move-result-wide v3

    .line 198
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 199
    .line 200
    goto/16 :goto_3

    .line 201
    .line 202
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 203
    .line 204
    .line 205
    move-result-wide v3

    .line 206
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 207
    .line 208
    goto/16 :goto_3

    .line 209
    .line 210
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 211
    .line 212
    .line 213
    move-result-wide v3

    .line 214
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 215
    .line 216
    goto/16 :goto_3

    .line 217
    .line 218
    :catchall_1
    move-exception v0

    .line 219
    move-object p0, v0

    .line 220
    throw p0

    .line 221
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 222
    .line 223
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 235
    .line 236
    .line 237
    return-object v1

    .line 238
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 243
    .line 244
    .line 245
    return-object v1

    .line 246
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 247
    .line 248
    return-object p0

    .line 249
    :pswitch_3
    move-object v3, p2

    .line 250
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 251
    .line 252
    check-cast p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 253
    .line 254
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 255
    .line 256
    const-wide/16 p1, 0x0

    .line 257
    .line 258
    cmp-long v1, v5, p1

    .line 259
    .line 260
    if-eqz v1, :cond_6

    .line 261
    .line 262
    move v4, v2

    .line 263
    goto :goto_7

    .line 264
    :cond_6
    move v4, v0

    .line 265
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 266
    .line 267
    cmp-long v1, v8, p1

    .line 268
    .line 269
    if-eqz v1, :cond_7

    .line 270
    .line 271
    move v7, v2

    .line 272
    goto :goto_8

    .line 273
    :cond_7
    move v7, v0

    .line 274
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 275
    .line 276
    .line 277
    move-result-wide v4

    .line 278
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 279
    .line 280
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 281
    .line 282
    cmp-long v1, v5, p1

    .line 283
    .line 284
    if-eqz v1, :cond_8

    .line 285
    .line 286
    move v4, v2

    .line 287
    goto :goto_9

    .line 288
    :cond_8
    move v4, v0

    .line 289
    :goto_9
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 290
    .line 291
    cmp-long v1, v8, p1

    .line 292
    .line 293
    if-eqz v1, :cond_9

    .line 294
    .line 295
    move v7, v2

    .line 296
    goto :goto_a

    .line 297
    :cond_9
    move v7, v0

    .line 298
    :goto_a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 299
    .line 300
    .line 301
    move-result-wide v4

    .line 302
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 303
    .line 304
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 305
    .line 306
    const-wide/16 v7, 0x0

    .line 307
    .line 308
    cmpl-double v1, v5, v7

    .line 309
    .line 310
    if-eqz v1, :cond_a

    .line 311
    .line 312
    move v4, v2

    .line 313
    :goto_b
    move-wide v10, v7

    .line 314
    goto :goto_c

    .line 315
    :cond_a
    move v4, v0

    .line 316
    goto :goto_b

    .line 317
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 318
    .line 319
    cmpl-double v1, v8, v10

    .line 320
    .line 321
    if-eqz v1, :cond_b

    .line 322
    .line 323
    move v7, v2

    .line 324
    goto :goto_d

    .line 325
    :cond_b
    move v7, v0

    .line 326
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->j(ZDZD)D

    .line 327
    .line 328
    .line 329
    move-result-wide v4

    .line 330
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 331
    .line 332
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 335
    .line 336
    .line 337
    move-result v1

    .line 338
    xor-int/2addr v1, v2

    .line 339
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 340
    .line 341
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    xor-int/2addr v5, v2

    .line 348
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 349
    .line 350
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 355
    .line 356
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 359
    .line 360
    .line 361
    move-result v1

    .line 362
    xor-int/2addr v1, v2

    .line 363
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 364
    .line 365
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 368
    .line 369
    .line 370
    move-result v5

    .line 371
    xor-int/2addr v5, v2

    .line 372
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 373
    .line 374
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 379
    .line 380
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 381
    .line 382
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 383
    .line 384
    .line 385
    move-result v1

    .line 386
    xor-int/2addr v1, v2

    .line 387
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 388
    .line 389
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 392
    .line 393
    .line 394
    move-result v5

    .line 395
    xor-int/2addr v5, v2

    .line 396
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 397
    .line 398
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 403
    .line 404
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 405
    .line 406
    cmp-long v1, v5, p1

    .line 407
    .line 408
    if-eqz v1, :cond_c

    .line 409
    .line 410
    move v4, v2

    .line 411
    goto :goto_e

    .line 412
    :cond_c
    move v4, v0

    .line 413
    :goto_e
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 414
    .line 415
    cmp-long v1, v8, p1

    .line 416
    .line 417
    if-eqz v1, :cond_d

    .line 418
    .line 419
    move v7, v2

    .line 420
    goto :goto_f

    .line 421
    :cond_d
    move v7, v0

    .line 422
    :goto_f
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 423
    .line 424
    .line 425
    move-result-wide v4

    .line 426
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 427
    .line 428
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 429
    .line 430
    cmp-long v1, v5, p1

    .line 431
    .line 432
    if-eqz v1, :cond_e

    .line 433
    .line 434
    move v4, v2

    .line 435
    goto :goto_10

    .line 436
    :cond_e
    move v4, v0

    .line 437
    :goto_10
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 438
    .line 439
    cmp-long v1, v8, p1

    .line 440
    .line 441
    if-eqz v1, :cond_f

    .line 442
    .line 443
    move v7, v2

    .line 444
    goto :goto_11

    .line 445
    :cond_f
    move v7, v0

    .line 446
    :goto_11
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 447
    .line 448
    .line 449
    move-result-wide v4

    .line 450
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 451
    .line 452
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 453
    .line 454
    cmp-long v1, v5, p1

    .line 455
    .line 456
    if-eqz v1, :cond_10

    .line 457
    .line 458
    move v4, v2

    .line 459
    goto :goto_12

    .line 460
    :cond_10
    move v4, v0

    .line 461
    :goto_12
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 462
    .line 463
    cmp-long v1, v8, p1

    .line 464
    .line 465
    if-eqz v1, :cond_11

    .line 466
    .line 467
    move v7, v2

    .line 468
    goto :goto_13

    .line 469
    :cond_11
    move v7, v0

    .line 470
    :goto_13
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 471
    .line 472
    .line 473
    move-result-wide v4

    .line 474
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 475
    .line 476
    move v1, v0

    .line 477
    move v4, v2

    .line 478
    move-object v0, v3

    .line 479
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 480
    .line 481
    cmp-long v5, v2, p1

    .line 482
    .line 483
    if-eqz v5, :cond_12

    .line 484
    .line 485
    move v5, v1

    .line 486
    move v1, v4

    .line 487
    goto :goto_14

    .line 488
    :cond_12
    move v5, v1

    .line 489
    :goto_14
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 490
    .line 491
    cmp-long p1, v6, p1

    .line 492
    .line 493
    if-eqz p1, :cond_13

    .line 494
    .line 495
    :goto_15
    move-wide v5, v6

    .line 496
    goto :goto_16

    .line 497
    :cond_13
    move v4, v5

    .line 498
    goto :goto_15

    .line 499
    :goto_16
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 500
    .line 501
    .line 502
    move-result-wide p1

    .line 503
    move-object v3, v0

    .line 504
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 505
    .line 506
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 507
    .line 508
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 509
    .line 510
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 511
    .line 512
    .line 513
    move-result-object p1

    .line 514
    check-cast p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 515
    .line 516
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 517
    .line 518
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 519
    .line 520
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 521
    .line 522
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 527
    .line 528
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 529
    .line 530
    if-ne v3, p1, :cond_14

    .line 531
    .line 532
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->bitField0_:I

    .line 533
    .line 534
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->bitField0_:I

    .line 535
    .line 536
    or-int/2addr p1, p2

    .line 537
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->bitField0_:I

    .line 538
    .line 539
    :cond_14
    return-object p0

    .line 540
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;

    .line 541
    .line 542
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;-><init>(Ll/h3w;)V

    .line 543
    .line 544
    .line 545
    return-object p0

    .line 546
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 547
    .line 548
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 549
    .line 550
    .line 551
    return-object v1

    .line 552
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 553
    .line 554
    return-object p0

    .line 555
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 556
    .line 557
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;-><init>()V

    .line 558
    .line 559
    .line 560
    return-object p0

    .line 561
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

    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_c
        0x10 -> :sswitch_b
        0x19 -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x38 -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x50 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
    .end sparse-switch
.end method

.method public getGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getJumpSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getJumpText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPreGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPreWealth()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getProgressText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProgressTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getProgressTexts(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getProgressTextsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getProgressTextsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

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

.method public getProgressTextsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 10

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v4, v0, v2

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-static {v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v5

    .line 23
    :goto_0
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 24
    .line 25
    cmp-long v1, v6, v2

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    add-int/2addr v0, v1

    .line 35
    :cond_2
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 36
    .line 37
    const-wide/16 v8, 0x0

    .line 38
    .line 39
    cmpl-double v1, v6, v8

    .line 40
    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->k(ID)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr v0, v1

    .line 49
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_4

    .line 56
    .line 57
    const/4 v1, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressText()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/2addr v0, v1

    .line 67
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_5

    .line 74
    .line 75
    const/4 v1, 0x5

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpText()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    add-int/2addr v0, v1

    .line 85
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_6

    .line 92
    .line 93
    const/4 v1, 0x6

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpSchema()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    add-int/2addr v0, v1

    .line 103
    :cond_6
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 104
    .line 105
    cmp-long v1, v6, v2

    .line 106
    .line 107
    if-eqz v1, :cond_7

    .line 108
    .line 109
    const/4 v1, 0x7

    .line 110
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    add-int/2addr v0, v1

    .line 115
    :cond_7
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 116
    .line 117
    cmp-long v1, v6, v2

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    const/16 v1, 0x8

    .line 122
    .line 123
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    add-int/2addr v0, v1

    .line 128
    :cond_8
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 129
    .line 130
    cmp-long v1, v6, v2

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    const/16 v1, 0x9

    .line 135
    .line 136
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    add-int/2addr v0, v1

    .line 141
    :cond_9
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 142
    .line 143
    cmp-long v1, v6, v2

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    const/16 v1, 0xa

    .line 148
    .line 149
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    add-int/2addr v0, v1

    .line 154
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 155
    .line 156
    if-eqz v1, :cond_b

    .line 157
    .line 158
    const/16 v1, 0xb

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    add-int/2addr v0, v1

    .line 169
    :cond_b
    move v1, v5

    .line 170
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 171
    .line 172
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-ge v5, v2, :cond_c

    .line 177
    .line 178
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 179
    .line 180
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v2}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    add-int/2addr v1, v2

    .line 191
    add-int/lit8 v5, v5, 0x1

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_c
    add-int/2addr v0, v1

    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextsList()Ljava/util/List;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    add-int/2addr v0, v1

    .line 204
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 205
    .line 206
    return v0
.end method

.method public getServerTs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSuperGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getWealth()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getWealthRatio()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasStyle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->grade_:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealth_:J

    .line 14
    .line 15
    cmp-long v4, v0, v2

    .line 16
    .line 17
    if-eqz v4, :cond_1

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->wealthRatio_:D

    .line 24
    .line 25
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    cmpl-double v4, v0, v4

    .line 28
    .line 29
    if-eqz v4, :cond_2

    .line 30
    .line 31
    const/4 v4, 0x3

    .line 32
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->g0(ID)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressText_:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x4

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressText()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpText_:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    const/4 v0, 0x5

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpText()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->jumpSchema_:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    const/4 v0, 0x6

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpSchema()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preGrade_:J

    .line 84
    .line 85
    cmp-long v4, v0, v2

    .line 86
    .line 87
    if-eqz v4, :cond_6

    .line 88
    .line 89
    const/4 v4, 0x7

    .line 90
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 91
    .line 92
    .line 93
    :cond_6
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->preWealth_:J

    .line 94
    .line 95
    cmp-long v4, v0, v2

    .line 96
    .line 97
    if-eqz v4, :cond_7

    .line 98
    .line 99
    const/16 v4, 0x8

    .line 100
    .line 101
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 102
    .line 103
    .line 104
    :cond_7
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->serverTs_:J

    .line 105
    .line 106
    cmp-long v4, v0, v2

    .line 107
    .line 108
    if-eqz v4, :cond_8

    .line 109
    .line 110
    const/16 v4, 0x9

    .line 111
    .line 112
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 113
    .line 114
    .line 115
    :cond_8
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->superGrade_:J

    .line 116
    .line 117
    cmp-long v2, v0, v2

    .line 118
    .line 119
    if-eqz v2, :cond_9

    .line 120
    .line 121
    const/16 v2, 0xa

    .line 122
    .line 123
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 124
    .line 125
    .line 126
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->style_:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 127
    .line 128
    if-eqz v0, :cond_a

    .line 129
    .line 130
    const/16 v0, 0xb

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 137
    .line 138
    .line 139
    :cond_a
    const/4 v0, 0x0

    .line 140
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 141
    .line 142
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-ge v0, v1, :cond_b

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->progressTexts_:Lcom/google/protobuf/l$h;

    .line 149
    .line 150
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Ljava/lang/String;

    .line 155
    .line 156
    const/16 v2, 0xc

    .line 157
    .line 158
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    add-int/lit8 v0, v0, 0x1

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_b
    return-void
.end method
