.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MultiCallInvite"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInviteOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final OWNERLIVEID_FIELD_NUMBER:I = 0x5

.field public static final OWNERMULTICALLORDER_FIELD_NUMBER:I = 0xb

.field public static final OWNERUSERAVATAR_FIELD_NUMBER:I = 0x4

.field public static final OWNERUSERID_FIELD_NUMBER:I = 0x2

.field public static final OWNERUSERNAME_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public static final SHOWSECONDS_FIELD_NUMBER:I = 0xa

.field public static final TOLIVEID_FIELD_NUMBER:I = 0x7

.field public static final TOUSERAVATAR_FIELD_NUMBER:I = 0x9

.field public static final TOUSERID_FIELD_NUMBER:I = 0x6

.field public static final TOUSERNAME_FIELD_NUMBER:I = 0x8


# instance fields
.field private id_:Ljava/lang/String;

.field private ownerLiveId_:Ljava/lang/String;

.field private ownerMultiCallOrder_:Ljava/lang/String;

.field private ownerUserAvatar_:Ljava/lang/String;

.field private ownerUserId_:Ljava/lang/String;

.field private ownerUserName_:Ljava/lang/String;

.field private showSeconds_:I

.field private toLiveId_:Ljava/lang/String;

.field private toUserAvatar_:Ljava/lang/String;

.field private toUserId_:Ljava/lang/String;

.field private toUserName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic G()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearOwnerLiveId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearOwnerMultiCallOrder()V

    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOwnerLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOwnerMultiCallOrder()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerMultiCallOrder()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOwnerUserAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOwnerUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOwnerUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearShowSeconds()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearToLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUserAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearOwnerUserAvatar()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearOwnerUserId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearOwnerUserName()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearShowSeconds()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearToLiveId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearToUserAvatar()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearToUserId()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->clearToUserName()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerMultiCallOrder(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerMultiCallOrderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOwnerLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOwnerLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOwnerMultiCallOrder(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOwnerMultiCallOrderBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOwnerUserAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOwnerUserAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOwnerUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOwnerUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOwnerUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOwnerUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setShowSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 2
    .line 3
    return-void
.end method

.method private setToLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUserAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToUserAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setOwnerUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setShowSeconds(I)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->setToLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_3

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
    move v1, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto :goto_4

    .line 72
    :catch_1
    move-exception p1

    .line 73
    goto :goto_5

    .line 74
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :catchall_1
    move-exception p0

    .line 152
    throw p0

    .line 153
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v0

    .line 170
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 175
    .line 176
    .line 177
    return-object v0

    .line 178
    :cond_3
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 179
    .line 180
    return-object p0

    .line 181
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 182
    .line 183
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    xor-int/2addr p1, v2

    .line 192
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 193
    .line 194
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    xor-int/2addr v3, v2

    .line 201
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 202
    .line 203
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    xor-int/2addr p1, v2

    .line 216
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    xor-int/2addr v3, v2

    .line 225
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    xor-int/2addr p1, v2

    .line 240
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 241
    .line 242
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 245
    .line 246
    .line 247
    move-result v3

    .line 248
    xor-int/2addr v3, v2

    .line 249
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 250
    .line 251
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    xor-int/2addr p1, v2

    .line 264
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 265
    .line 266
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    xor-int/2addr v3, v2

    .line 273
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 280
    .line 281
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    xor-int/2addr p1, v2

    .line 288
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    xor-int/2addr v3, v2

    .line 297
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 298
    .line 299
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    xor-int/2addr p1, v2

    .line 312
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 313
    .line 314
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 315
    .line 316
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    xor-int/2addr v3, v2

    .line 321
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 322
    .line 323
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    xor-int/2addr p1, v2

    .line 336
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 337
    .line 338
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    xor-int/2addr v3, v2

    .line 345
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 346
    .line 347
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 352
    .line 353
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    xor-int/2addr p1, v2

    .line 360
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 361
    .line 362
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 363
    .line 364
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    xor-int/2addr v3, v2

    .line 369
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 370
    .line 371
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 376
    .line 377
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    xor-int/2addr p1, v2

    .line 384
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 385
    .line 386
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 387
    .line 388
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 389
    .line 390
    .line 391
    move-result v3

    .line 392
    xor-int/2addr v3, v2

    .line 393
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 394
    .line 395
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 400
    .line 401
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 402
    .line 403
    if-eqz p1, :cond_4

    .line 404
    .line 405
    move v0, v2

    .line 406
    goto :goto_6

    .line 407
    :cond_4
    move v0, v1

    .line 408
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 409
    .line 410
    if-eqz v3, :cond_5

    .line 411
    .line 412
    move v1, v2

    .line 413
    :cond_5
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 414
    .line 415
    .line 416
    move-result p1

    .line 417
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 418
    .line 419
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    xor-int/2addr p1, v2

    .line 426
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 427
    .line 428
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 431
    .line 432
    .line 433
    move-result v1

    .line 434
    xor-int/2addr v1, v2

    .line 435
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 436
    .line 437
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p1

    .line 441
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 442
    .line 443
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 444
    .line 445
    return-object p0

    .line 446
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;

    .line 447
    .line 448
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite$Builder;-><init>(Ll/m3w;)V

    .line 449
    .line 450
    .line 451
    return-object p0

    .line 452
    :pswitch_5
    return-object v0

    .line 453
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 454
    .line 455
    return-object p0

    .line 456
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;

    .line 457
    .line 458
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;-><init>()V

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

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x50 -> :sswitch_2
        0x5a -> :sswitch_1
    .end sparse-switch
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

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

.method public getOwnerLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

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

.method public getOwnerMultiCallOrder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerMultiCallOrderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

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

.method public getOwnerUserAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerUserAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

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

.method public getOwnerUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

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

.method public getOwnerUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOwnerUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserAvatar()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerLiveId()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_6

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserId()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_7

    .line 123
    .line 124
    const/4 v1, 0x7

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToLiveId()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    add-int/2addr v0, v1

    .line 134
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_8

    .line 141
    .line 142
    const/16 v1, 0x8

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserName()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    add-int/2addr v0, v1

    .line 153
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_9

    .line 160
    .line 161
    const/16 v1, 0x9

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserAvatar()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    add-int/2addr v0, v1

    .line 172
    :cond_9
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 173
    .line 174
    if-eqz v1, :cond_a

    .line 175
    .line 176
    const/16 v2, 0xa

    .line 177
    .line 178
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v0, v1

    .line 183
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-nez v1, :cond_b

    .line 190
    .line 191
    const/16 v1, 0xb

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerMultiCallOrder()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_b
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 203
    .line 204
    return v0
.end method

.method public getShowSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 2
    .line 3
    return p0
.end method

.method public getToLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

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

.method public getToUserAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToUserAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

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

.method public getToUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

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

.method public getToUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserName_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerUserAvatar_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerUserAvatar()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerLiveId_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerLiveId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserId_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toLiveId_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    const/4 v0, 0x7

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToLiveId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserName_:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    const/16 v0, 0x8

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->toUserAvatar_:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_8

    .line 137
    .line 138
    const/16 v0, 0x9

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getToUserAvatar()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_8
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->showSeconds_:I

    .line 148
    .line 149
    if-eqz v0, :cond_9

    .line 150
    .line 151
    const/16 v1, 0xa

    .line 152
    .line 153
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->ownerMultiCallOrder_:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    const/16 v0, 0xb

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallInvite;->getOwnerMultiCallOrder()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_a
    return-void
.end method
