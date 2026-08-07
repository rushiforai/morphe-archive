.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$DialogOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Dialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$DialogOrBuilder;"
    }
.end annotation


# static fields
.field public static final BLOCKCARD_FIELD_NUMBER:I = 0x6

.field public static final CANCELABLE_FIELD_NUMBER:I = 0x5

.field public static final CONSTRAINT_FIELD_NUMBER:I = 0x7

.field public static final CONTENTTYPE_FIELD_NUMBER:I = 0xa

.field public static final CONTENT_FIELD_NUMBER:I = 0xb

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

.field public static final IDENTIFIER_FIELD_NUMBER:I = 0x2

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final MERCURY_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x8

.field public static final REMOTE_FIELD_NUMBER:I = 0x4

.field public static final VERSION_FIELD_NUMBER:I = 0x3


# instance fields
.field private blockCard_:Z

.field private cancelAble_:Z

.field private constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

.field private contentType_:Ljava/lang/String;

.field private content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

.field private id_:Ljava/lang/String;

.field private identifier_:Ljava/lang/String;

.field private mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

.field private position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

.field private remote_:Z

.field private version_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setIdentifierBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setPosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setPosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setRemote(Z)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setVersion(I)V

    return-void
.end method

.method public static bridge synthetic H()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearBlockCard()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearCancelAble()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearConstraint()V

    return-void
.end method

.method private clearBlockCard()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearCancelAble()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearConstraint()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 3
    .line 4
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 3
    .line 4
    return-void
.end method

.method private clearContentType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getContentType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIdentifier()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getIdentifier()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMercury()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 3
    .line 4
    return-void
.end method

.method private clearPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 3
    .line 4
    return-void
.end method

.method private clearRemote()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearVersion()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearContent()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearContentType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearIdentifier()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearMercury()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearPosition()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearRemote()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->clearVersion()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mergeConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mergeContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V

    return-void
.end method

.method private mergeConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 33
    .line 34
    return-void
.end method

.method private mergeContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 33
    .line 34
    return-void
.end method

.method private mergeMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;->newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 33
    .line 34
    return-void
.end method

.method private mergePosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;->newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mergeMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mergePosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setBlockCard(Z)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setCancelAble(Z)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V

    return-void
.end method

.method private setBlockCard(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setCancelAble(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 8
    .line 9
    return-void
.end method

.method private setConstraint(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    return-void
.end method

.method private setContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 8
    .line 9
    return-void
.end method

.method private setContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    return-void
.end method

.method private setContentType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setContentTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIdentifier(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdentifierBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 8
    .line 9
    return-void
.end method

.method private setMercury(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    return-void
.end method

.method private setPosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 8
    .line 9
    return-void
.end method

.method private setPosition(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    return-void
.end method

.method private setRemote(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setContent(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setContentType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setContentTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->setIdentifier(Ljava/lang/String;)V

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
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_7

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sparse-switch p1, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    :sswitch_0
    move v0, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto/16 :goto_8

    .line 72
    .line 73
    :catch_1
    move-exception p1

    .line 74
    goto/16 :goto_9

    .line 75
    .line 76
    :sswitch_1
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_3
    move-object p1, v1

    .line 88
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->parser()Ll/ng60;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 97
    .line 98
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 99
    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 122
    .line 123
    if-eqz p1, :cond_4

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury$Builder;

    .line 130
    .line 131
    goto :goto_5

    .line 132
    :cond_4
    move-object p1, v1

    .line 133
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;->parser()Ll/ng60;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 142
    .line 143
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 144
    .line 145
    if-eqz p1, :cond_2

    .line 146
    .line 147
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 160
    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position$Builder;

    .line 168
    .line 169
    goto :goto_6

    .line 170
    :cond_5
    move-object p1, v1

    .line 171
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;->parser()Ll/ng60;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 180
    .line 181
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 182
    .line 183
    if-eqz p1, :cond_2

    .line 184
    .line 185
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 195
    .line 196
    goto/16 :goto_3

    .line 197
    .line 198
    :sswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 199
    .line 200
    if-eqz p1, :cond_6

    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint$Builder;

    .line 207
    .line 208
    goto :goto_7

    .line 209
    :cond_6
    move-object p1, v1

    .line 210
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->parser()Ll/ng60;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    check-cast v3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 219
    .line 220
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 221
    .line 222
    if-eqz p1, :cond_2

    .line 223
    .line 224
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 232
    .line 233
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 234
    .line 235
    goto/16 :goto_3

    .line 236
    .line 237
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 242
    .line 243
    goto/16 :goto_3

    .line 244
    .line 245
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 250
    .line 251
    goto/16 :goto_3

    .line 252
    .line 253
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 258
    .line 259
    goto/16 :goto_3

    .line 260
    .line 261
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 266
    .line 267
    goto/16 :goto_3

    .line 268
    .line 269
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 274
    .line 275
    goto/16 :goto_3

    .line 276
    .line 277
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 282
    .line 283
    goto/16 :goto_3

    .line 284
    .line 285
    :catchall_1
    move-exception p0

    .line 286
    throw p0

    .line 287
    :goto_8
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 288
    .line 289
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 301
    .line 302
    .line 303
    return-object v1

    .line 304
    :goto_9
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 309
    .line 310
    .line 311
    return-object v1

    .line 312
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 313
    .line 314
    return-object p0

    .line 315
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 316
    .line 317
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    xor-int/2addr p1, v2

    .line 326
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    xor-int/2addr v3, v2

    .line 335
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    xor-int/2addr p1, v2

    .line 350
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result v3

    .line 358
    xor-int/2addr v3, v2

    .line 359
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 366
    .line 367
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 368
    .line 369
    if-eqz p1, :cond_8

    .line 370
    .line 371
    move v1, v2

    .line 372
    goto :goto_a

    .line 373
    :cond_8
    move v1, v0

    .line 374
    :goto_a
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 375
    .line 376
    if-eqz v3, :cond_9

    .line 377
    .line 378
    move v0, v2

    .line 379
    :cond_9
    invoke-interface {p2, v1, p1, v0, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 384
    .line 385
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 386
    .line 387
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 388
    .line 389
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 390
    .line 391
    .line 392
    move-result p1

    .line 393
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 394
    .line 395
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 396
    .line 397
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 398
    .line 399
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 404
    .line 405
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 406
    .line 407
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 408
    .line 409
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 410
    .line 411
    .line 412
    move-result p1

    .line 413
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 414
    .line 415
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 416
    .line 417
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 418
    .line 419
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 424
    .line 425
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 426
    .line 427
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 428
    .line 429
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 430
    .line 431
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 436
    .line 437
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 438
    .line 439
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 440
    .line 441
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 442
    .line 443
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 444
    .line 445
    .line 446
    move-result-object p1

    .line 447
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 448
    .line 449
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 450
    .line 451
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 452
    .line 453
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 454
    .line 455
    .line 456
    move-result p1

    .line 457
    xor-int/2addr p1, v2

    .line 458
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 459
    .line 460
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 461
    .line 462
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 463
    .line 464
    .line 465
    move-result v1

    .line 466
    xor-int/2addr v1, v2

    .line 467
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 468
    .line 469
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object p1

    .line 473
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 474
    .line 475
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 476
    .line 477
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 478
    .line 479
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 484
    .line 485
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 486
    .line 487
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 488
    .line 489
    return-object p0

    .line 490
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;

    .line 491
    .line 492
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;-><init>(Ll/p3w;)V

    .line 493
    .line 494
    .line 495
    return-object p0

    .line 496
    :pswitch_5
    return-object v1

    .line 497
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 498
    .line 499
    return-object p0

    .line 500
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 501
    .line 502
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;-><init>()V

    .line 503
    .line 504
    .line 505
    return-object p0

    .line 506
    nop

    .line 507
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

    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x18 -> :sswitch_9
        0x20 -> :sswitch_8
        0x28 -> :sswitch_7
        0x30 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
    .end sparse-switch
.end method

.method public getBlockCard()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getCancelAble()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getConstraint()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getContent()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

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

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

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

.method public getIdentifier()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdentifierBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

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

.method public getMercury()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getPosition()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getRemote()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getIdentifier()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v2, 0x3

    .line 49
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 55
    .line 56
    if-eqz v1, :cond_4

    .line 57
    .line 58
    const/4 v2, 0x4

    .line 59
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    add-int/2addr v0, v1

    .line 64
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 65
    .line 66
    if-eqz v1, :cond_5

    .line 67
    .line 68
    const/4 v2, 0x5

    .line 69
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    add-int/2addr v0, v1

    .line 74
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 75
    .line 76
    if-eqz v1, :cond_6

    .line 77
    .line 78
    const/4 v2, 0x6

    .line 79
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 85
    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    const/4 v1, 0x7

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getConstraint()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 99
    .line 100
    if-eqz v1, :cond_8

    .line 101
    .line 102
    const/16 v1, 0x8

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getPosition()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    add-int/2addr v0, v1

    .line 113
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 114
    .line 115
    if-eqz v1, :cond_9

    .line 116
    .line 117
    const/16 v1, 0x9

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getMercury()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    add-int/2addr v0, v1

    .line 128
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_a

    .line 135
    .line 136
    const/16 v1, 0xa

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getContentType()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    add-int/2addr v0, v1

    .line 147
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 148
    .line 149
    if-eqz v1, :cond_b

    .line 150
    .line 151
    const/16 v1, 0xb

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getContent()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    add-int/2addr v0, v1

    .line 162
    :cond_b
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 163
    .line 164
    return v0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 2
    .line 3
    return p0
.end method

.method public hasConstraint()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

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

.method public hasContent()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

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

.method public hasMercury()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

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

.method public hasPosition()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->id_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->identifier_:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getIdentifier()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->version_:I

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v1, 0x3

    .line 38
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->remote_:Z

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->cancelAble_:Z

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    const/4 v1, 0x5

    .line 54
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->blockCard_:Z

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    const/4 v1, 0x6

    .line 62
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 63
    .line 64
    .line 65
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->constraint_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 66
    .line 67
    if-eqz v0, :cond_6

    .line 68
    .line 69
    const/4 v0, 0x7

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getConstraint()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Constraint;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 75
    .line 76
    .line 77
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->position_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 78
    .line 79
    if-eqz v0, :cond_7

    .line 80
    .line 81
    const/16 v0, 0x8

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getPosition()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Position;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->mercury_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 91
    .line 92
    if-eqz v0, :cond_8

    .line 93
    .line 94
    const/16 v0, 0x9

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getMercury()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Mercury;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->contentType_:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_9

    .line 110
    .line 111
    const/16 v0, 0xa

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getContentType()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->content_:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 121
    .line 122
    if-eqz v0, :cond_a

    .line 123
    .line 124
    const/16 v0, 0xb

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;->getContent()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 131
    .line 132
    .line 133
    :cond_a
    return-void
.end method
