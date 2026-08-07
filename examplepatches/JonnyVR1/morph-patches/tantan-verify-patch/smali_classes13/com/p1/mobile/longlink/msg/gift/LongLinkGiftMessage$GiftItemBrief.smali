.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GiftItemBrief"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefOrBuilder;"
    }
.end annotation


# static fields
.field public static final AVATARTAG_FIELD_NUMBER:I = 0x14

.field public static final COMBOID_FIELD_NUMBER:I = 0x4

.field public static final COMBOS_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

.field public static final EXTRAINFO_FIELD_NUMBER:I = 0xb

.field public static final FLYMICINFO_FIELD_NUMBER:I = 0x12

.field public static final GIFTBOTTOMTAG_FIELD_NUMBER:I = 0x15

.field public static final GIFTNUM_FIELD_NUMBER:I = 0xc

.field public static final GIFTSOURCE_FIELD_NUMBER:I = 0xa

.field public static final GIFTTYPE_FIELD_NUMBER:I = 0x2

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final ISGEAR_FIELD_NUMBER:I = 0xd

.field public static final ISNAMED_FIELD_NUMBER:I = 0x10

.field public static final LOTTERYGIFTID_FIELD_NUMBER:I = 0x13

.field public static final LUCKYPRIZEGIFTINFOITEMID_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;",
            ">;"
        }
    .end annotation
.end field

.field public static final STEP_FIELD_NUMBER:I = 0xf

.field public static final STICKFACEPOSITIONTYPE_FIELD_NUMBER:I = 0x8

.field public static final THRESHOLD_FIELD_NUMBER:I = 0xe

.field public static final TRAY_FIELD_NUMBER:I = 0x11

.field public static final USERNAME_FIELD_NUMBER:I = 0x6

.field public static final USERURL_FIELD_NUMBER:I = 0x7

.field public static final VERSION_FIELD_NUMBER:I = 0x5


# instance fields
.field private avatarTag_:Ljava/lang/String;

.field private comboId_:Ljava/lang/String;

.field private combos_:J

.field private extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

.field private flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

.field private giftBottomTag_:Ljava/lang/String;

.field private giftNum_:J

.field private giftSource_:J

.field private giftType_:Ljava/lang/String;

.field private id_:J

.field private isGear_:Z

.field private isNamed_:Z

.field private lotteryGiftId_:J

.field private luckyPrizeGiftInfoItemId_:J

.field private step_:J

.field private stickFacePositionType_:J

.field private threshold_:J

.field private tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

.field private userName_:Ljava/lang/String;

.field private userUrl_:Ljava/lang/String;

.field private version_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setComboId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setComboIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setCombos(J)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftBottomTag(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftBottomTagBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftNum(J)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftSource(J)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setGiftTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setId(J)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setIsGear(Z)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setIsNamed(Z)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setLotteryGiftId(J)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setLuckyPrizeGiftInfoItemId(J)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setStep(J)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setStickFacePositionType(J)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setThreshold(J)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setUserUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearAvatarTag()V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setUserUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearComboId()V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearCombos()V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearAvatarTag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getAvatarTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearComboId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getComboId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCombos()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearExtraInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearFlyMicInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearGiftBottomTag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftBottomTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftNum()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGiftSource()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGiftType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearIsGear()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsNamed()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearLotteryGiftId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLuckyPrizeGiftInfoItemId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearStep()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearStickFacePositionType()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearThreshold()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearTray()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearExtraInfo()V

    return-void
.end method

.method public static bridge synthetic d0()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object v0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearFlyMicInfo()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearGiftBottomTag()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearGiftNum()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearGiftSource()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearGiftType()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearId()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearIsGear()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearIsNamed()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearLotteryGiftId()V

    return-void
.end method

.method private mergeExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 33
    .line 34
    return-void
.end method

.method private mergeFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearLuckyPrizeGiftInfoItemId()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearStep()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearStickFacePositionType()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearThreshold()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearTray()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearUserName()V

    return-void
.end method

.method private setAvatarTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarTagBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setComboId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setComboIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCombos(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 2
    .line 3
    return-void
.end method

.method private setExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-void
.end method

.method private setFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    return-void
.end method

.method private setGiftBottomTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGiftBottomTagBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftNum(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGiftSource(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGiftType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGiftTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    .line 2
    .line 3
    return-void
.end method

.method private setIsGear(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsNamed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setLotteryGiftId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 2
    .line 3
    return-void
.end method

.method private setLuckyPrizeGiftInfoItemId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 2
    .line 3
    return-void
.end method

.method private setStep(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 2
    .line 3
    return-void
.end method

.method private setStickFacePositionType(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 2
    .line 3
    return-void
.end method

.method private setThreshold(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 2
    .line 3
    return-void
.end method

.method private setTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 8
    .line 9
    return-void
.end method

.method private setTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearUserUrl()V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->clearVersion()V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->mergeExtraInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->mergeFlyMicInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->mergeTray(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setAvatarTag(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->setAvatarTagBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v1, 0x0

    const/4 v0, 0x0

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    .line 2
    invoke-static {}, Ll/l710;->a()V

    return-object v1

    .line 3
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->PARSER:Ll/ng60;

    if-nez p0, :cond_1

    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    monitor-enter p0

    .line 4
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->PARSER:Ll/ng60;

    if-nez p1, :cond_0

    .line 5
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->PARSER:Ll/ng60;

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_1

    .line 6
    :cond_0
    :goto_0
    monitor-exit p0

    goto :goto_2

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 7
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->PARSER:Ll/ng60;

    return-object p0

    .line 8
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 9
    check-cast p3, Lcom/google/protobuf/h;

    :cond_2
    :goto_3
    if-nez v0, :cond_6

    .line 10
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    move-result p1

    sparse-switch p1, :sswitch_data_0

    .line 11
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    move-result p1

    if-nez p1, :cond_2

    :sswitch_0
    move v0, v2

    goto :goto_3

    :catch_0
    move-exception v0

    move-object p1, v0

    goto/16 :goto_7

    :catch_1
    move-exception v0

    move-object p1, v0

    goto/16 :goto_8

    .line 12
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    goto :goto_3

    .line 14
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    goto :goto_3

    .line 16
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    goto :goto_3

    .line 17
    :sswitch_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    if-eqz p1, :cond_3

    .line 18
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;

    goto :goto_4

    :cond_3
    move-object p1, v1

    .line 19
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    if-eqz p1, :cond_2

    .line 20
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    goto :goto_3

    .line 22
    :sswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    if-eqz p1, :cond_4

    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;

    goto :goto_5

    :cond_4
    move-object p1, v1

    .line 24
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    if-eqz p1, :cond_2

    .line 25
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 26
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    goto :goto_3

    .line 27
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    goto/16 :goto_3

    .line 28
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    goto/16 :goto_3

    .line 29
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    goto/16 :goto_3

    .line 30
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    goto/16 :goto_3

    .line 31
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    goto/16 :goto_3

    .line 32
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    if-eqz p1, :cond_5

    .line 33
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    goto :goto_6

    :cond_5
    move-object p1, v1

    .line 34
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    if-eqz p1, :cond_2

    .line 35
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 36
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    goto/16 :goto_3

    .line 37
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    goto/16 :goto_3

    .line 38
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    goto/16 :goto_3

    .line 39
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    goto/16 :goto_3

    .line 40
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    goto/16 :goto_3

    .line 42
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    goto/16 :goto_3

    .line 44
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    goto/16 :goto_3

    .line 46
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 48
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    goto/16 :goto_3

    .line 49
    :sswitch_14
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    goto/16 :goto_3

    .line 51
    :sswitch_15
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    move-object p0, v0

    .line 52
    throw p0

    .line 53
    :goto_7
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 54
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 55
    :goto_8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 56
    :cond_6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0

    .line 57
    :pswitch_3
    move-object v3, p2

    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 58
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 59
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    const-wide/16 p1, 0x0

    cmp-long v1, v5, p1

    if-eqz v1, :cond_7

    move v4, v2

    goto :goto_9

    :cond_7
    move v4, v0

    :goto_9
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_8

    move v7, v2

    goto :goto_a

    :cond_8
    move v7, v0

    :goto_a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 61
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 62
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 63
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_9

    move v4, v2

    goto :goto_b

    :cond_9
    move v4, v0

    :goto_b
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_a

    move v7, v2

    goto :goto_c

    :cond_a
    move v7, v0

    :goto_c
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 65
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 66
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 68
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 69
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 71
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 72
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 74
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 75
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 76
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_b

    move v4, v2

    goto :goto_d

    :cond_b
    move v4, v0

    :goto_d
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_c

    move v7, v2

    goto :goto_e

    :cond_c
    move v7, v0

    :goto_e
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 77
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_d

    move v4, v2

    goto :goto_f

    :cond_d
    move v4, v0

    :goto_f
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_e

    move v7, v2

    goto :goto_10

    :cond_e
    move v7, v0

    :goto_10
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 78
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_f

    move v4, v2

    goto :goto_11

    :cond_f
    move v4, v0

    :goto_11
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_10

    move v7, v2

    goto :goto_12

    :cond_10
    move v7, v0

    :goto_12
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 80
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_11

    move v4, v2

    goto :goto_13

    :cond_11
    move v4, v0

    :goto_13
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_12

    move v7, v2

    goto :goto_14

    :cond_12
    move v7, v0

    :goto_14
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 82
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_13

    move v4, v2

    goto :goto_15

    :cond_13
    move v4, v0

    :goto_15
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_14

    move v7, v2

    goto :goto_16

    :cond_14
    move v7, v0

    :goto_16
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 83
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_15

    move v4, v2

    goto :goto_17

    :cond_15
    move v4, v0

    :goto_17
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_16

    move v7, v2

    goto :goto_18

    :cond_16
    move v7, v0

    :goto_18
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 87
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_17

    move v4, v2

    goto :goto_19

    :cond_17
    move v4, v0

    :goto_19
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    cmp-long p1, v8, p1

    if-eqz p1, :cond_18

    move v7, v2

    goto :goto_1a

    :cond_18
    move v7, v0

    :goto_1a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 88
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 89
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 90
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 91
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 92
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 93
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 94
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    return-object p0

    .line 95
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;

    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief$Builder;-><init>(Ll/o2w;)V

    return-object p0

    :pswitch_5
    return-object v1

    .line 96
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    return-object p0

    .line 97
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;-><init>()V

    return-object p0

    nop

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

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_15
        0x12 -> :sswitch_14
        0x18 -> :sswitch_13
        0x22 -> :sswitch_12
        0x2a -> :sswitch_11
        0x32 -> :sswitch_10
        0x3a -> :sswitch_f
        0x40 -> :sswitch_e
        0x48 -> :sswitch_d
        0x50 -> :sswitch_c
        0x5a -> :sswitch_b
        0x60 -> :sswitch_a
        0x68 -> :sswitch_9
        0x70 -> :sswitch_8
        0x78 -> :sswitch_7
        0x80 -> :sswitch_6
        0x8a -> :sswitch_5
        0x92 -> :sswitch_4
        0x98 -> :sswitch_3
        0xa2 -> :sswitch_2
        0xaa -> :sswitch_1
    .end sparse-switch
.end method

.method public getAvatarTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarTagBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

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

.method public getComboId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getComboIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

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

.method public getCombos()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getFlyMicInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getGiftBottomTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftBottomTagBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

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

.method public getGiftNum()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGiftSource()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGiftType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

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

.method public getId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getIsGear()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsNamed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLotteryGiftId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLuckyPrizeGiftInfoItemId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 2
    .line 3
    return-wide v0
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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v4, v0, v2

    .line 12
    .line 13
    if-eqz v4, :cond_1

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-static {v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftType()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 41
    .line 42
    cmp-long v1, v4, v2

    .line 43
    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getComboId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    add-int/2addr v0, v1

    .line 70
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_5

    .line 77
    .line 78
    const/4 v1, 0x5

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getVersion()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    add-int/2addr v0, v1

    .line 88
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_6

    .line 95
    .line 96
    const/4 v1, 0x6

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    const/4 v1, 0x7

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserUrl()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    add-int/2addr v0, v1

    .line 124
    :cond_7
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 125
    .line 126
    cmp-long v1, v4, v2

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x8

    .line 131
    .line 132
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    add-int/2addr v0, v1

    .line 137
    :cond_8
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 138
    .line 139
    cmp-long v1, v4, v2

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    const/16 v1, 0x9

    .line 144
    .line 145
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v0, v1

    .line 150
    :cond_9
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 151
    .line 152
    cmp-long v1, v4, v2

    .line 153
    .line 154
    if-eqz v1, :cond_a

    .line 155
    .line 156
    const/16 v1, 0xa

    .line 157
    .line 158
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    add-int/2addr v0, v1

    .line 163
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 164
    .line 165
    if-eqz v1, :cond_b

    .line 166
    .line 167
    const/16 v1, 0xb

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    add-int/2addr v0, v1

    .line 178
    :cond_b
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 179
    .line 180
    cmp-long v1, v4, v2

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    const/16 v1, 0xc

    .line 185
    .line 186
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    add-int/2addr v0, v1

    .line 191
    :cond_c
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 192
    .line 193
    if-eqz v1, :cond_d

    .line 194
    .line 195
    const/16 v4, 0xd

    .line 196
    .line 197
    invoke-static {v4, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_d
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 203
    .line 204
    cmp-long v1, v4, v2

    .line 205
    .line 206
    if-eqz v1, :cond_e

    .line 207
    .line 208
    const/16 v1, 0xe

    .line 209
    .line 210
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    add-int/2addr v0, v1

    .line 215
    :cond_e
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 216
    .line 217
    cmp-long v1, v4, v2

    .line 218
    .line 219
    if-eqz v1, :cond_f

    .line 220
    .line 221
    const/16 v1, 0xf

    .line 222
    .line 223
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    add-int/2addr v0, v1

    .line 228
    :cond_f
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 229
    .line 230
    if-eqz v1, :cond_10

    .line 231
    .line 232
    const/16 v4, 0x10

    .line 233
    .line 234
    invoke-static {v4, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    add-int/2addr v0, v1

    .line 239
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 240
    .line 241
    if-eqz v1, :cond_11

    .line 242
    .line 243
    const/16 v1, 0x11

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 246
    .line 247
    .line 248
    move-result-object v4

    .line 249
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    add-int/2addr v0, v1

    .line 254
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 255
    .line 256
    if-eqz v1, :cond_12

    .line 257
    .line 258
    const/16 v1, 0x12

    .line 259
    .line 260
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getFlyMicInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    add-int/2addr v0, v1

    .line 269
    :cond_12
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 270
    .line 271
    cmp-long v1, v4, v2

    .line 272
    .line 273
    if-eqz v1, :cond_13

    .line 274
    .line 275
    const/16 v1, 0x13

    .line 276
    .line 277
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    add-int/2addr v0, v1

    .line 282
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    if-nez v1, :cond_14

    .line 289
    .line 290
    const/16 v1, 0x14

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getAvatarTag()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    add-int/2addr v0, v1

    .line 301
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    if-nez v1, :cond_15

    .line 308
    .line 309
    const/16 v1, 0x15

    .line 310
    .line 311
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftBottomTag()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    add-int/2addr v0, v1

    .line 320
    :cond_15
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 321
    .line 322
    return v0
.end method

.method public getStep()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getStickFacePositionType()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getThreshold()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

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

.method public getUserUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

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

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

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

.method public hasExtraInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

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

.method public hasFlyMicInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

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

.method public hasTray()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->id_:J

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftType_:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftType()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->combos_:J

    .line 30
    .line 31
    cmp-long v4, v0, v2

    .line 32
    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->comboId_:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getComboId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->version_:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_4

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getVersion()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userName_:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    const/4 v0, 0x6

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->userUrl_:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_6

    .line 94
    .line 95
    const/4 v0, 0x7

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserUrl()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_6
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->stickFacePositionType_:J

    .line 104
    .line 105
    cmp-long v4, v0, v2

    .line 106
    .line 107
    if-eqz v4, :cond_7

    .line 108
    .line 109
    const/16 v4, 0x8

    .line 110
    .line 111
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 112
    .line 113
    .line 114
    :cond_7
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->luckyPrizeGiftInfoItemId_:J

    .line 115
    .line 116
    cmp-long v4, v0, v2

    .line 117
    .line 118
    if-eqz v4, :cond_8

    .line 119
    .line 120
    const/16 v4, 0x9

    .line 121
    .line 122
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 123
    .line 124
    .line 125
    :cond_8
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftSource_:J

    .line 126
    .line 127
    cmp-long v4, v0, v2

    .line 128
    .line 129
    if-eqz v4, :cond_9

    .line 130
    .line 131
    const/16 v4, 0xa

    .line 132
    .line 133
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 134
    .line 135
    .line 136
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->extraInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 137
    .line 138
    if-eqz v0, :cond_a

    .line 139
    .line 140
    const/16 v0, 0xb

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 147
    .line 148
    .line 149
    :cond_a
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftNum_:J

    .line 150
    .line 151
    cmp-long v4, v0, v2

    .line 152
    .line 153
    if-eqz v4, :cond_b

    .line 154
    .line 155
    const/16 v4, 0xc

    .line 156
    .line 157
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 158
    .line 159
    .line 160
    :cond_b
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isGear_:Z

    .line 161
    .line 162
    if-eqz v0, :cond_c

    .line 163
    .line 164
    const/16 v1, 0xd

    .line 165
    .line 166
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 167
    .line 168
    .line 169
    :cond_c
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->threshold_:J

    .line 170
    .line 171
    cmp-long v4, v0, v2

    .line 172
    .line 173
    if-eqz v4, :cond_d

    .line 174
    .line 175
    const/16 v4, 0xe

    .line 176
    .line 177
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 178
    .line 179
    .line 180
    :cond_d
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->step_:J

    .line 181
    .line 182
    cmp-long v4, v0, v2

    .line 183
    .line 184
    if-eqz v4, :cond_e

    .line 185
    .line 186
    const/16 v4, 0xf

    .line 187
    .line 188
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 189
    .line 190
    .line 191
    :cond_e
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->isNamed_:Z

    .line 192
    .line 193
    if-eqz v0, :cond_f

    .line 194
    .line 195
    const/16 v1, 0x10

    .line 196
    .line 197
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 198
    .line 199
    .line 200
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->tray_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 201
    .line 202
    if-eqz v0, :cond_10

    .line 203
    .line 204
    const/16 v0, 0x11

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 211
    .line 212
    .line 213
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->flyMicInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 214
    .line 215
    if-eqz v0, :cond_11

    .line 216
    .line 217
    const/16 v0, 0x12

    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getFlyMicInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 224
    .line 225
    .line 226
    :cond_11
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->lotteryGiftId_:J

    .line 227
    .line 228
    cmp-long v2, v0, v2

    .line 229
    .line 230
    if-eqz v2, :cond_12

    .line 231
    .line 232
    const/16 v2, 0x13

    .line 233
    .line 234
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 235
    .line 236
    .line 237
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->avatarTag_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_13

    .line 244
    .line 245
    const/16 v0, 0x14

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getAvatarTag()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 252
    .line 253
    .line 254
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->giftBottomTag_:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-nez v0, :cond_14

    .line 261
    .line 262
    const/16 v0, 0x15

    .line 263
    .line 264
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftBottomTag()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :cond_14
    return-void
.end method
