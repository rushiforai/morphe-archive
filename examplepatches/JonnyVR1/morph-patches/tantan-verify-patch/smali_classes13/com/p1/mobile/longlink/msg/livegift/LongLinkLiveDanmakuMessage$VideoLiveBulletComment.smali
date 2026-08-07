.class public final Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletCommentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoLiveBulletComment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletCommentOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORID_FIELD_NUMBER:I = 0x5

.field public static final CONTENT_FIELD_NUMBER:I = 0xe

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

.field public static final ICONURL_FIELD_NUMBER:I = 0x7

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final LIVEID_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;",
            ">;"
        }
    .end annotation
.end field

.field public static final PAYAMOUNT_FIELD_NUMBER:I = 0xd

.field public static final PAYASSETID_FIELD_NUMBER:I = 0xc

.field public static final PAYASSETTYPE_FIELD_NUMBER:I = 0xb

.field public static final PRIORITY_FIELD_NUMBER:I = 0xf

.field public static final ROOMID_FIELD_NUMBER:I = 0x4

.field public static final SCENARIO_FIELD_NUMBER:I = 0x2

.field public static final STYLE_FIELD_NUMBER:I = 0x10

.field public static final SUBTYPE_FIELD_NUMBER:I = 0xa

.field public static final TYPEID_FIELD_NUMBER:I = 0x8

.field public static final TYPE_FIELD_NUMBER:I = 0x9

.field public static final USERHIERARCHY_FIELD_NUMBER:I = 0x6


# instance fields
.field private anchorId_:Ljava/lang/String;

.field private content_:Ljava/lang/String;

.field private iconUrl_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private liveId_:Ljava/lang/String;

.field private payAmount_:J

.field private payAssetId_:Ljava/lang/String;

.field private payAssetType_:Ljava/lang/String;

.field private priority_:J

.field private roomId_:Ljava/lang/String;

.field private scenario_:Ljava/lang/String;

.field private style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

.field private subType_:Ljava/lang/String;

.field private typeId_:Ljava/lang/String;

.field private type_:Ljava/lang/String;

.field private userHierarchy_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPayAmount(J)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPayAssetId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPayAssetIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPayAssetType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPayAssetTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setPriority(J)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setScenario(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setScenarioBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setSubType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setSubTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setTypeId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setTypeIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setUserHierarchy(J)V

    return-void
.end method

.method public static bridge synthetic U()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearAnchorId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearContent()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearIconUrl()V

    return-void
.end method

.method private clearAnchorId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIconUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getIconUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPayAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearPayAssetId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPayAssetType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPriority()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearScenario()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getScenario()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStyle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearSubType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getSubType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTypeId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getTypeId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserHierarchy()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearPayAmount()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearPayAssetId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearPayAssetType()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearPriority()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearScenario()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearStyle()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearSubType()V

    return-void
.end method

.method private mergeStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearType()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearTypeId()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->clearUserHierarchy()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->mergeStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setAnchorId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setAnchorId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setContentBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPayAmount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setPayAssetId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPayAssetIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPayAssetType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPayAssetTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPriority(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setScenario(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setScenarioBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-void
.end method

.method private setSubType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSubTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTypeId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTypeIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserHierarchy(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setIconUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setIconUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->setLiveId(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_4

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
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_3
    move-object p1, v1

    .line 91
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->parser()Ll/ng60;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 100
    .line 101
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 102
    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 132
    .line 133
    .line 134
    move-result-wide v3

    .line 135
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 181
    .line 182
    .line 183
    move-result-wide v3

    .line 184
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_3

    .line 203
    .line 204
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_3

    .line 219
    .line 220
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 225
    .line 226
    goto/16 :goto_3

    .line 227
    .line 228
    :catchall_1
    move-exception v0

    .line 229
    move-object p0, v0

    .line 230
    throw p0

    .line 231
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 232
    .line 233
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 245
    .line 246
    .line 247
    return-object v1

    .line 248
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 253
    .line 254
    .line 255
    return-object v1

    .line 256
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 257
    .line 258
    return-object p0

    .line 259
    :pswitch_3
    move-object v3, p2

    .line 260
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 261
    .line 262
    check-cast p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 263
    .line 264
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    xor-int/2addr p1, v2

    .line 271
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 272
    .line 273
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    xor-int/2addr v1, v2

    .line 280
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    xor-int/2addr p1, v2

    .line 295
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    xor-int/2addr v1, v2

    .line 304
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 311
    .line 312
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    xor-int/2addr p1, v2

    .line 319
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 320
    .line 321
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    xor-int/2addr v1, v2

    .line 328
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 335
    .line 336
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    xor-int/2addr p1, v2

    .line 343
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 344
    .line 345
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    xor-int/2addr v1, v2

    .line 352
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 359
    .line 360
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 361
    .line 362
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    xor-int/2addr p1, v2

    .line 367
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 368
    .line 369
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    xor-int/2addr v1, v2

    .line 376
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 377
    .line 378
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object p1

    .line 382
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 383
    .line 384
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 385
    .line 386
    const-wide/16 p1, 0x0

    .line 387
    .line 388
    cmp-long v1, v5, p1

    .line 389
    .line 390
    if-eqz v1, :cond_5

    .line 391
    .line 392
    move v4, v2

    .line 393
    goto :goto_7

    .line 394
    :cond_5
    move v4, v0

    .line 395
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 396
    .line 397
    cmp-long v1, v8, p1

    .line 398
    .line 399
    if-eqz v1, :cond_6

    .line 400
    .line 401
    move v7, v2

    .line 402
    goto :goto_8

    .line 403
    :cond_6
    move v7, v0

    .line 404
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 405
    .line 406
    .line 407
    move-result-wide v4

    .line 408
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 409
    .line 410
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 411
    .line 412
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    xor-int/2addr v1, v2

    .line 417
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 418
    .line 419
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 422
    .line 423
    .line 424
    move-result v5

    .line 425
    xor-int/2addr v5, v2

    .line 426
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 427
    .line 428
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v1

    .line 432
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 433
    .line 434
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 435
    .line 436
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 437
    .line 438
    .line 439
    move-result v1

    .line 440
    xor-int/2addr v1, v2

    .line 441
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 442
    .line 443
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 446
    .line 447
    .line 448
    move-result v5

    .line 449
    xor-int/2addr v5, v2

    .line 450
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 451
    .line 452
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 457
    .line 458
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 459
    .line 460
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    xor-int/2addr v1, v2

    .line 465
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 466
    .line 467
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 468
    .line 469
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 470
    .line 471
    .line 472
    move-result v5

    .line 473
    xor-int/2addr v5, v2

    .line 474
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 475
    .line 476
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 481
    .line 482
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 483
    .line 484
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    xor-int/2addr v1, v2

    .line 489
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 490
    .line 491
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 492
    .line 493
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 494
    .line 495
    .line 496
    move-result v5

    .line 497
    xor-int/2addr v5, v2

    .line 498
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 499
    .line 500
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 505
    .line 506
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 507
    .line 508
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 509
    .line 510
    .line 511
    move-result v1

    .line 512
    xor-int/2addr v1, v2

    .line 513
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 514
    .line 515
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 516
    .line 517
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 518
    .line 519
    .line 520
    move-result v5

    .line 521
    xor-int/2addr v5, v2

    .line 522
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 523
    .line 524
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v1

    .line 528
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 529
    .line 530
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 531
    .line 532
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 533
    .line 534
    .line 535
    move-result v1

    .line 536
    xor-int/2addr v1, v2

    .line 537
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 538
    .line 539
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 540
    .line 541
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 542
    .line 543
    .line 544
    move-result v5

    .line 545
    xor-int/2addr v5, v2

    .line 546
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 547
    .line 548
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 553
    .line 554
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 555
    .line 556
    cmp-long v1, v5, p1

    .line 557
    .line 558
    if-eqz v1, :cond_7

    .line 559
    .line 560
    move v4, v2

    .line 561
    goto :goto_9

    .line 562
    :cond_7
    move v4, v0

    .line 563
    :goto_9
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 564
    .line 565
    cmp-long v1, v8, p1

    .line 566
    .line 567
    if-eqz v1, :cond_8

    .line 568
    .line 569
    move v7, v2

    .line 570
    goto :goto_a

    .line 571
    :cond_8
    move v7, v0

    .line 572
    :goto_a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 573
    .line 574
    .line 575
    move-result-wide v4

    .line 576
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 577
    .line 578
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 579
    .line 580
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 581
    .line 582
    .line 583
    move-result v1

    .line 584
    xor-int/2addr v1, v2

    .line 585
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 586
    .line 587
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 588
    .line 589
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 590
    .line 591
    .line 592
    move-result v5

    .line 593
    xor-int/2addr v5, v2

    .line 594
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 595
    .line 596
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 601
    .line 602
    move v1, v0

    .line 603
    move v4, v2

    .line 604
    move-object v0, v3

    .line 605
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 606
    .line 607
    cmp-long v5, v2, p1

    .line 608
    .line 609
    if-eqz v5, :cond_9

    .line 610
    .line 611
    move v5, v1

    .line 612
    move v1, v4

    .line 613
    goto :goto_b

    .line 614
    :cond_9
    move v5, v1

    .line 615
    :goto_b
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 616
    .line 617
    cmp-long p1, v6, p1

    .line 618
    .line 619
    if-eqz p1, :cond_a

    .line 620
    .line 621
    :goto_c
    move-wide v5, v6

    .line 622
    goto :goto_d

    .line 623
    :cond_a
    move v4, v5

    .line 624
    goto :goto_c

    .line 625
    :goto_d
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 626
    .line 627
    .line 628
    move-result-wide p1

    .line 629
    move-object v3, v0

    .line 630
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 631
    .line 632
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 633
    .line 634
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 635
    .line 636
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 637
    .line 638
    .line 639
    move-result-object p1

    .line 640
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 641
    .line 642
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 643
    .line 644
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 645
    .line 646
    return-object p0

    .line 647
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 648
    .line 649
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;-><init>(Ll/x2w;)V

    .line 650
    .line 651
    .line 652
    return-object p0

    .line 653
    :pswitch_5
    return-object v1

    .line 654
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 655
    .line 656
    return-object p0

    .line 657
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 658
    .line 659
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;-><init>()V

    .line 660
    .line 661
    .line 662
    return-object p0

    .line 663
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

    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x30 -> :sswitch_b
        0x3a -> :sswitch_a
        0x42 -> :sswitch_9
        0x4a -> :sswitch_8
        0x52 -> :sswitch_7
        0x5a -> :sswitch_6
        0x62 -> :sswitch_5
        0x68 -> :sswitch_4
        0x72 -> :sswitch_3
        0x78 -> :sswitch_2
        0x82 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

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

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

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

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

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

.method public getPayAmount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPayAssetId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPayAssetIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

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

.method public getPayAssetType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPayAssetTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

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

.method public getPriority()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

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

.method public getScenario()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScenarioBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

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
    .locals 6

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getScenario()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getLiveId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getAnchorId()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 99
    .line 100
    const-wide/16 v3, 0x0

    .line 101
    .line 102
    cmp-long v5, v1, v3

    .line 103
    .line 104
    if-eqz v5, :cond_6

    .line 105
    .line 106
    const/4 v5, 0x6

    .line 107
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_7

    .line 119
    .line 120
    const/4 v1, 0x7

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getIconUrl()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_8

    .line 137
    .line 138
    const/16 v1, 0x8

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getTypeId()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_9

    .line 156
    .line 157
    const/16 v1, 0x9

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getType()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    add-int/2addr v0, v1

    .line 168
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_a

    .line 175
    .line 176
    const/16 v1, 0xa

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getSubType()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    add-int/2addr v0, v1

    .line 187
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-nez v1, :cond_b

    .line 194
    .line 195
    const/16 v1, 0xb

    .line 196
    .line 197
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetType()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    add-int/2addr v0, v1

    .line 206
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-nez v1, :cond_c

    .line 213
    .line 214
    const/16 v1, 0xc

    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetId()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    add-int/2addr v0, v1

    .line 225
    :cond_c
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 226
    .line 227
    cmp-long v5, v1, v3

    .line 228
    .line 229
    if-eqz v5, :cond_d

    .line 230
    .line 231
    const/16 v5, 0xd

    .line 232
    .line 233
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    add-int/2addr v0, v1

    .line 238
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    if-nez v1, :cond_e

    .line 245
    .line 246
    const/16 v1, 0xe

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getContent()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    add-int/2addr v0, v1

    .line 257
    :cond_e
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 258
    .line 259
    cmp-long v3, v1, v3

    .line 260
    .line 261
    if-eqz v3, :cond_f

    .line 262
    .line 263
    const/16 v3, 0xf

    .line 264
    .line 265
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    add-int/2addr v0, v1

    .line 270
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 271
    .line 272
    if-eqz v1, :cond_10

    .line 273
    .line 274
    const/16 v1, 0x10

    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    add-int/2addr v0, v1

    .line 285
    :cond_10
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 286
    .line 287
    return v0
.end method

.method public getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSubType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

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

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

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

.method public getTypeId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

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

.method public getUserHierarchy()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasStyle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->scenario_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getScenario()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getAnchorId()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->userHierarchy_:J

    .line 82
    .line 83
    const-wide/16 v2, 0x0

    .line 84
    .line 85
    cmp-long v4, v0, v2

    .line 86
    .line 87
    if-eqz v4, :cond_5

    .line 88
    .line 89
    const/4 v4, 0x6

    .line 90
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->iconUrl_:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    const/4 v0, 0x7

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getIconUrl()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->typeId_:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    const/16 v0, 0x8

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getTypeId()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->type_:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_8

    .line 133
    .line 134
    const/16 v0, 0x9

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getType()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->subType_:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_9

    .line 150
    .line 151
    const/16 v0, 0xa

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getSubType()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetType_:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_a

    .line 167
    .line 168
    const/16 v0, 0xb

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetType()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAssetId_:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_b

    .line 184
    .line 185
    const/16 v0, 0xc

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAssetId()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->payAmount_:J

    .line 195
    .line 196
    cmp-long v4, v0, v2

    .line 197
    .line 198
    if-eqz v4, :cond_c

    .line 199
    .line 200
    const/16 v4, 0xd

    .line 201
    .line 202
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 203
    .line 204
    .line 205
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->content_:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_d

    .line 212
    .line 213
    const/16 v0, 0xe

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getContent()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :cond_d
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->priority_:J

    .line 223
    .line 224
    cmp-long v2, v0, v2

    .line 225
    .line 226
    if-eqz v2, :cond_e

    .line 227
    .line 228
    const/16 v2, 0xf

    .line 229
    .line 230
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 231
    .line 232
    .line 233
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->style_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 234
    .line 235
    if-eqz v0, :cond_f

    .line 236
    .line 237
    const/16 v0, 0x10

    .line 238
    .line 239
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 244
    .line 245
    .line 246
    :cond_f
    return-void
.end method
