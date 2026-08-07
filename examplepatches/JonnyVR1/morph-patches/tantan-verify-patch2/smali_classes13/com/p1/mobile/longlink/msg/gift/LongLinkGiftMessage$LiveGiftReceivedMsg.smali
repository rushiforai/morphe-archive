.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveGiftReceivedMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsgOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORID_FIELD_NUMBER:I = 0x4

.field public static final ANCHORUSERNAME_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

.field public static final GIFTITEMBRIEF_FIELD_NUMBER:I = 0x5

.field public static final GUILDCALL_FIELD_NUMBER:I = 0x8

.field public static final ID_FIELD_NUMBER:I = 0x2

.field public static final LIVEID_FIELD_NUMBER:I = 0x1

.field public static final MULTICALL_FIELD_NUMBER:I = 0x7

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERID_FIELD_NUMBER:I = 0x3

.field public static final VIDEOCHAT_FIELD_NUMBER:I = 0x9


# instance fields
.field private anchorId_:Ljava/lang/String;

.field private anchorUserName_:Ljava/lang/String;

.field private giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

.field private guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

.field private id_:Ljava/lang/String;

.field private liveId_:Ljava/lang/String;

.field private multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

.field private userId_:Ljava/lang/String;

.field private videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V

    return-void
.end method

.method public static bridge synthetic F()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearAnchorId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearAnchorUserName()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearGiftItemBrief()V

    return-void
.end method

.method private clearAnchorId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftItemBrief()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 3
    .line 4
    return-void
.end method

.method private clearGuildCall()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 3
    .line 4
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMultiCall()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearVideoChat()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearGuildCall()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearMultiCall()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->clearVideoChat()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->mergeGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->mergeGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->mergeMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->mergeVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V

    return-void
.end method

.method private mergeGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 33
    .line 34
    return-void
.end method

.method private mergeGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 33
    .line 34
    return-void
.end method

.method private mergeMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 33
    .line 34
    return-void
.end method

.method private mergeVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setAnchorId(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setAnchorUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V

    return-void
.end method

.method private setAnchorId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 8
    .line 9
    return-void
.end method

.method private setGiftItemBrief(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-void
.end method

.method private setGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 8
    .line 9
    return-void
.end method

.method private setGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 8
    .line 9
    return-void
.end method

.method private setMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setVideoChat(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setGuildCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->setMultiCall(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->PARSER:Ll/ng60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->PARSER:Ll/ng60;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 49
    .line 50
    check-cast p3, Lcom/google/protobuf/h;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    :goto_3
    if-nez p1, :cond_11

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v2, v3, :cond_10

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_f

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_e

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_d

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_b

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq v2, v3, :cond_a

    .line 84
    .line 85
    const/16 v3, 0x3a

    .line 86
    .line 87
    if-eq v2, v3, :cond_8

    .line 88
    .line 89
    const/16 v3, 0x42

    .line 90
    .line 91
    if-eq v2, v3, :cond_6

    .line 92
    .line 93
    const/16 v3, 0x4a

    .line 94
    .line 95
    if-eq v2, v3, :cond_4

    .line 96
    .line 97
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-nez v2, :cond_2

    .line 102
    .line 103
    :cond_3
    move p1, v1

    .line 104
    goto :goto_3

    .line 105
    :catch_0
    move-exception p1

    .line 106
    goto/16 :goto_8

    .line 107
    .line 108
    :catch_1
    move-exception p1

    .line 109
    goto/16 :goto_9

    .line 110
    .line 111
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 112
    .line 113
    if-eqz v2, :cond_5

    .line 114
    .line 115
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo$Builder;

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_5
    move-object v2, v0

    .line 123
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;->parser()Ll/ng60;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 132
    .line 133
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 134
    .line 135
    if-eqz v2, :cond_2

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 145
    .line 146
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 150
    .line 151
    if-eqz v2, :cond_7

    .line 152
    .line 153
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

    .line 158
    .line 159
    goto :goto_5

    .line 160
    :cond_7
    move-object v2, v0

    .line 161
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->parser()Ll/ng60;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 170
    .line 171
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 172
    .line 173
    if-eqz v2, :cond_2

    .line 174
    .line 175
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 183
    .line 184
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 189
    .line 190
    if-eqz v2, :cond_9

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;

    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_9
    move-object v2, v0

    .line 200
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->parser()Ll/ng60;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 209
    .line 210
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 211
    .line 212
    if-eqz v2, :cond_2

    .line 213
    .line 214
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 222
    .line 223
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 224
    .line 225
    goto/16 :goto_3

    .line 226
    .line 227
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 232
    .line 233
    goto/16 :goto_3

    .line 234
    .line 235
    :cond_b
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 236
    .line 237
    if-eqz v2, :cond_c

    .line 238
    .line 239
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    .line 244
    .line 245
    goto :goto_7

    .line 246
    :cond_c
    move-object v2, v0

    .line 247
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->parser()Ll/ng60;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 256
    .line 257
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 258
    .line 259
    if-eqz v2, :cond_2

    .line 260
    .line 261
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 269
    .line 270
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 271
    .line 272
    goto/16 :goto_3

    .line 273
    .line 274
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 279
    .line 280
    goto/16 :goto_3

    .line 281
    .line 282
    :cond_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 287
    .line 288
    goto/16 :goto_3

    .line 289
    .line 290
    :cond_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 295
    .line 296
    goto/16 :goto_3

    .line 297
    .line 298
    :cond_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 303
    .line 304
    goto/16 :goto_3

    .line 305
    .line 306
    :catchall_1
    move-exception p0

    .line 307
    throw p0

    .line 308
    :goto_8
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 309
    .line 310
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 322
    .line 323
    .line 324
    return-object v0

    .line 325
    :goto_9
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 330
    .line 331
    .line 332
    return-object v0

    .line 333
    :cond_11
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 334
    .line 335
    return-object p0

    .line 336
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 337
    .line 338
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 339
    .line 340
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    xor-int/2addr p1, v1

    .line 347
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 348
    .line 349
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    xor-int/2addr v2, v1

    .line 356
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 357
    .line 358
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 363
    .line 364
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    xor-int/2addr p1, v1

    .line 371
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 372
    .line 373
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result v2

    .line 379
    xor-int/2addr v2, v1

    .line 380
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 381
    .line 382
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 387
    .line 388
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 389
    .line 390
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 391
    .line 392
    .line 393
    move-result p1

    .line 394
    xor-int/2addr p1, v1

    .line 395
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 396
    .line 397
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 400
    .line 401
    .line 402
    move-result v2

    .line 403
    xor-int/2addr v2, v1

    .line 404
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 405
    .line 406
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object p1

    .line 410
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 411
    .line 412
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 413
    .line 414
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 415
    .line 416
    .line 417
    move-result p1

    .line 418
    xor-int/2addr p1, v1

    .line 419
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 420
    .line 421
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 422
    .line 423
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    xor-int/2addr v2, v1

    .line 428
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 429
    .line 430
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object p1

    .line 434
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 435
    .line 436
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 437
    .line 438
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 439
    .line 440
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 441
    .line 442
    .line 443
    move-result-object p1

    .line 444
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 445
    .line 446
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 447
    .line 448
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 451
    .line 452
    .line 453
    move-result p1

    .line 454
    xor-int/2addr p1, v1

    .line 455
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 456
    .line 457
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    xor-int/2addr v1, v2

    .line 464
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 465
    .line 466
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object p1

    .line 470
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 471
    .line 472
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 473
    .line 474
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 475
    .line 476
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 477
    .line 478
    .line 479
    move-result-object p1

    .line 480
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 481
    .line 482
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 483
    .line 484
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 485
    .line 486
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 487
    .line 488
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 489
    .line 490
    .line 491
    move-result-object p1

    .line 492
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 493
    .line 494
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 495
    .line 496
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 497
    .line 498
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 499
    .line 500
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 501
    .line 502
    .line 503
    move-result-object p1

    .line 504
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 505
    .line 506
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 507
    .line 508
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 509
    .line 510
    return-object p0

    .line 511
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;

    .line 512
    .line 513
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg$Builder;-><init>(Ll/o2w;)V

    .line 514
    .line 515
    .line 516
    return-object p0

    .line 517
    :pswitch_5
    return-object v0

    .line 518
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 519
    .line 520
    return-object p0

    .line 521
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;

    .line 522
    .line 523
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;-><init>()V

    .line 524
    .line 525
    .line 526
    return-object p0

    .line 527
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

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

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

.method public getAnchorUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

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

.method public getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getGuildCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

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

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

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

.method public getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getLiveId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorUserName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 113
    .line 114
    if-eqz v1, :cond_7

    .line 115
    .line 116
    const/4 v1, 0x7

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    add-int/2addr v0, v1

    .line 126
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x8

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGuildCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    add-int/2addr v0, v1

    .line 141
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    const/16 v1, 0x9

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getVideoChat()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    add-int/2addr v0, v1

    .line 156
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 157
    .line 158
    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

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

.method public getVideoChat()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasGiftItemBrief()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

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

.method public hasGuildCall()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

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

.method public hasMultiCall()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

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

.method public hasVideoChat()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->giftItemBrief_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 66
    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->anchorUserName_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorUserName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->multiCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 94
    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    const/4 v0, 0x7

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->guildCall_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 106
    .line 107
    if-eqz v0, :cond_7

    .line 108
    .line 109
    const/16 v0, 0x8

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGuildCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 116
    .line 117
    .line 118
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->videoChat_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 119
    .line 120
    if-eqz v0, :cond_8

    .line 121
    .line 122
    const/16 v0, 0x9

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getVideoChat()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 129
    .line 130
    .line 131
    :cond_8
    return-void
.end method
