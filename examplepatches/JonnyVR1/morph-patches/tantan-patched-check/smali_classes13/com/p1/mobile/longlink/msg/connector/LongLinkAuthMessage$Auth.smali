.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Auth"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AuthOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACCESSTOKEN_FIELD_NUMBER:I = 0x1

.field public static final APPID_FIELD_NUMBER:I = 0xe

.field public static final CHANNEL_FIELD_NUMBER:I = 0xd

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

.field public static final DEVICEIDENTIFER_FIELD_NUMBER:I = 0x10

.field public static final EXT_FIELD_NUMBER:I = 0x11

.field public static final FLAG_FIELD_NUMBER:I = 0xa

.field public static final LOCALE_FIELD_NUMBER:I = 0x6

.field public static final LOC_FIELD_NUMBER:I = 0x3

.field public static final MCC_FIELD_NUMBER:I = 0xc

.field public static final MUTE_FIELD_NUMBER:I = 0xb

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x7

.field public static final SOURCE_FIELD_NUMBER:I = 0x2

.field public static final STAYSIDE_FIELD_NUMBER:I = 0x4

.field public static final UA_FIELD_NUMBER:I = 0x5

.field public static final USERID_FIELD_NUMBER:I = 0xf

.field public static final XTESTINGGROUP_FIELD_NUMBER:I = 0x8

.field public static final XTTCLIENTINFO_FIELD_NUMBER:I = 0x9


# instance fields
.field private accessToken_:Ljava/lang/String;

.field private appID_:Ljava/lang/String;

.field private channel_:Ljava/lang/String;

.field private deviceIdentifer_:Ljava/lang/String;

.field private ext_:Ljava/lang/String;

.field private flag_:Lcom/google/protobuf/ByteString;

.field private loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

.field private locale_:Ljava/lang/String;

.field private mCC_:I

.field private mute_:Z

.field private roomId_:Ljava/lang/String;

.field private source_:I

.field private staySide_:I

.field private ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

.field private userID_:Ljava/lang/String;

.field private xTTClientInfo_:Lcom/google/protobuf/ByteString;

.field private xTestingGroup_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setDeviceIdentiferBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setExt(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setExtBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setFlag(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setLocale(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setLocaleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setMCC(I)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setMute(Z)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setSourceValue(I)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setStaySide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setStaySideValue(I)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setUserID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setUserIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setXTTClientInfo(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setXTestingGroup(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic W()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearAccessToken()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearAppID()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearChannel()V

    return-void
.end method

.method private clearAccessToken()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAccessToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAppID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAppID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearChannel()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getChannel()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearDeviceIdentifer()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDeviceIdentifer()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearExt()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getExt()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFlag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getFlag()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method private clearLoc()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 3
    .line 4
    return-void
.end method

.method private clearLocale()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getLocale()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMCC()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearMute()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearStaySide()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUa()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getUserID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearXTTClientInfo()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getXTTClientInfo()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method private clearXTestingGroup()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getXTestingGroup()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearDeviceIdentifer()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearExt()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearFlag()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearLoc()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearLocale()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearMCC()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearMute()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearSource()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearStaySide()V

    return-void
.end method

.method private mergeLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearUa()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearUserID()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearXTTClientInfo()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->clearXTestingGroup()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mergeLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mergeUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    return-void
.end method

.method private setAccessToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAccessTokenBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAppID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAppIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setChannel(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setChannelBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setDeviceIdentifer(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDeviceIdentiferBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setExt(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setExtBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFlag(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 8
    .line 9
    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    return-void
.end method

.method private setLocale(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLocaleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMCC(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 2
    .line 3
    return-void
.end method

.method private setMute(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSourceValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 2
    .line 3
    return-void
.end method

.method private setStaySide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 9
    .line 10
    return-void
.end method

.method private setStaySideValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 8
    .line 9
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-void
.end method

.method private setUserID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setXTTClientInfo(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    return-void
.end method

.method private setXTestingGroup(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setAccessToken(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setAccessTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setAppID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setAppIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setChannel(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setChannelBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->setDeviceIdentifer(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_5

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
    goto/16 :goto_6

    .line 72
    .line 73
    :catch_1
    move-exception p1

    .line 74
    goto/16 :goto_7

    .line 75
    .line 76
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 161
    .line 162
    if-eqz p1, :cond_3

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_3
    move-object p1, v0

    .line 172
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->parser()Ll/ng60;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 181
    .line 182
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 183
    .line 184
    if-eqz p1, :cond_2

    .line 185
    .line 186
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 194
    .line 195
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 196
    .line 197
    goto/16 :goto_3

    .line 198
    .line 199
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 204
    .line 205
    goto/16 :goto_3

    .line 206
    .line 207
    :sswitch_f
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 208
    .line 209
    if-eqz p1, :cond_4

    .line 210
    .line 211
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_4
    move-object p1, v0

    .line 219
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->parser()Ll/ng60;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 228
    .line 229
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 230
    .line 231
    if-eqz p1, :cond_2

    .line 232
    .line 233
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 241
    .line 242
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 243
    .line 244
    goto/16 :goto_3

    .line 245
    .line 246
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 251
    .line 252
    goto/16 :goto_3

    .line 253
    .line 254
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 259
    .line 260
    goto/16 :goto_3

    .line 261
    .line 262
    :catchall_1
    move-exception p0

    .line 263
    throw p0

    .line 264
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 265
    .line 266
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 278
    .line 279
    .line 280
    return-object v0

    .line 281
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 286
    .line 287
    .line 288
    return-object v0

    .line 289
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 290
    .line 291
    return-object p0

    .line 292
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 293
    .line 294
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 295
    .line 296
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    xor-int/2addr p1, v2

    .line 303
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v3

    .line 311
    xor-int/2addr v3, v2

    .line 312
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 319
    .line 320
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 321
    .line 322
    if-eqz p1, :cond_6

    .line 323
    .line 324
    move v0, v2

    .line 325
    goto :goto_8

    .line 326
    :cond_6
    move v0, v1

    .line 327
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 328
    .line 329
    if-eqz v3, :cond_7

    .line 330
    .line 331
    move v4, v2

    .line 332
    goto :goto_9

    .line 333
    :cond_7
    move v4, v1

    .line 334
    :goto_9
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 339
    .line 340
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 341
    .line 342
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 343
    .line 344
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 349
    .line 350
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 351
    .line 352
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 353
    .line 354
    if-eqz p1, :cond_8

    .line 355
    .line 356
    move v0, v2

    .line 357
    goto :goto_a

    .line 358
    :cond_8
    move v0, v1

    .line 359
    :goto_a
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 360
    .line 361
    if-eqz v3, :cond_9

    .line 362
    .line 363
    move v4, v2

    .line 364
    goto :goto_b

    .line 365
    :cond_9
    move v4, v1

    .line 366
    :goto_b
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 371
    .line 372
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 373
    .line 374
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 375
    .line 376
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 381
    .line 382
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 383
    .line 384
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 385
    .line 386
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    xor-int/2addr p1, v2

    .line 391
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 392
    .line 393
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 394
    .line 395
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    xor-int/2addr v3, v2

    .line 400
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 401
    .line 402
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 407
    .line 408
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result p1

    .line 414
    xor-int/2addr p1, v2

    .line 415
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 416
    .line 417
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    xor-int/2addr v3, v2

    .line 424
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 425
    .line 426
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 431
    .line 432
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 433
    .line 434
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 435
    .line 436
    if-eq p1, v0, :cond_a

    .line 437
    .line 438
    move v3, v2

    .line 439
    goto :goto_c

    .line 440
    :cond_a
    move v3, v1

    .line 441
    :goto_c
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 442
    .line 443
    if-eq v4, v0, :cond_b

    .line 444
    .line 445
    move v5, v2

    .line 446
    goto :goto_d

    .line 447
    :cond_b
    move v5, v1

    .line 448
    :goto_d
    invoke-interface {p2, v3, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 453
    .line 454
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 455
    .line 456
    if-eq p1, v0, :cond_c

    .line 457
    .line 458
    move v3, v2

    .line 459
    goto :goto_e

    .line 460
    :cond_c
    move v3, v1

    .line 461
    :goto_e
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 462
    .line 463
    if-eq v4, v0, :cond_d

    .line 464
    .line 465
    move v5, v2

    .line 466
    goto :goto_f

    .line 467
    :cond_d
    move v5, v1

    .line 468
    :goto_f
    invoke-interface {p2, v3, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    .line 469
    .line 470
    .line 471
    move-result-object p1

    .line 472
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 473
    .line 474
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 475
    .line 476
    if-eq p1, v0, :cond_e

    .line 477
    .line 478
    move v3, v2

    .line 479
    goto :goto_10

    .line 480
    :cond_e
    move v3, v1

    .line 481
    :goto_10
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 482
    .line 483
    if-eq v4, v0, :cond_f

    .line 484
    .line 485
    move v0, v2

    .line 486
    goto :goto_11

    .line 487
    :cond_f
    move v0, v1

    .line 488
    :goto_11
    invoke-interface {p2, v3, p1, v0, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    .line 489
    .line 490
    .line 491
    move-result-object p1

    .line 492
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 493
    .line 494
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 495
    .line 496
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 497
    .line 498
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 499
    .line 500
    .line 501
    move-result p1

    .line 502
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 503
    .line 504
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 505
    .line 506
    if-eqz p1, :cond_10

    .line 507
    .line 508
    move v0, v2

    .line 509
    goto :goto_12

    .line 510
    :cond_10
    move v0, v1

    .line 511
    :goto_12
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 512
    .line 513
    if-eqz v3, :cond_11

    .line 514
    .line 515
    move v1, v2

    .line 516
    :cond_11
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 517
    .line 518
    .line 519
    move-result p1

    .line 520
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 521
    .line 522
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 523
    .line 524
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 525
    .line 526
    .line 527
    move-result p1

    .line 528
    xor-int/2addr p1, v2

    .line 529
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 530
    .line 531
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 532
    .line 533
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    xor-int/2addr v1, v2

    .line 538
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 539
    .line 540
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object p1

    .line 544
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 545
    .line 546
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 547
    .line 548
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 549
    .line 550
    .line 551
    move-result p1

    .line 552
    xor-int/2addr p1, v2

    .line 553
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 554
    .line 555
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 556
    .line 557
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 558
    .line 559
    .line 560
    move-result v1

    .line 561
    xor-int/2addr v1, v2

    .line 562
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 563
    .line 564
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object p1

    .line 568
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 569
    .line 570
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 571
    .line 572
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 573
    .line 574
    .line 575
    move-result p1

    .line 576
    xor-int/2addr p1, v2

    .line 577
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 578
    .line 579
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 580
    .line 581
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 582
    .line 583
    .line 584
    move-result v1

    .line 585
    xor-int/2addr v1, v2

    .line 586
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 587
    .line 588
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 593
    .line 594
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 595
    .line 596
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 597
    .line 598
    .line 599
    move-result p1

    .line 600
    xor-int/2addr p1, v2

    .line 601
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 602
    .line 603
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 604
    .line 605
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    xor-int/2addr v1, v2

    .line 610
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 611
    .line 612
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object p1

    .line 616
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 617
    .line 618
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 619
    .line 620
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    xor-int/2addr p1, v2

    .line 625
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 626
    .line 627
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 628
    .line 629
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 630
    .line 631
    .line 632
    move-result v1

    .line 633
    xor-int/2addr v1, v2

    .line 634
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 635
    .line 636
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object p1

    .line 640
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 641
    .line 642
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 643
    .line 644
    return-object p0

    .line 645
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 646
    .line 647
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;-><init>(Ll/a2w;)V

    .line 648
    .line 649
    .line 650
    return-object p0

    .line 651
    :pswitch_5
    return-object v0

    .line 652
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 653
    .line 654
    return-object p0

    .line 655
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 656
    .line 657
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;-><init>()V

    .line 658
    .line 659
    .line 660
    return-object p0

    .line 661
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

    .line 662
    .line 663
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
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_11
        0x10 -> :sswitch_10
        0x1a -> :sswitch_f
        0x20 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x3a -> :sswitch_b
        0x42 -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x58 -> :sswitch_7
        0x60 -> :sswitch_6
        0x6a -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x82 -> :sswitch_2
        0x8a -> :sswitch_1
    .end sparse-switch
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAccessTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

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

.method public getAppID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

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

.method public getChannel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChannelBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

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

.method public getDeviceIdentifer()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeviceIdentiferBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

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

.method public getExt()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

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

.method public getFlag()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocaleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

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

.method public getMCC()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 2
    .line 3
    return p0
.end method

.method public getMute()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAccessToken()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v1, v2, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    iget v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 59
    .line 60
    sget-object v2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eq v1, v2, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x4

    .line 69
    iget v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 70
    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_6

    .line 97
    .line 98
    const/4 v1, 0x6

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getLocale()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    add-int/2addr v0, v1

    .line 108
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_7

    .line 115
    .line 116
    const/4 v1, 0x7

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getRoomId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    add-int/2addr v0, v1

    .line 126
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x8

    .line 135
    .line 136
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 137
    .line 138
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->i(ILcom/google/protobuf/ByteString;)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    add-int/2addr v0, v1

    .line 143
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_9

    .line 150
    .line 151
    const/16 v1, 0x9

    .line 152
    .line 153
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 154
    .line 155
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->i(ILcom/google/protobuf/ByteString;)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    add-int/2addr v0, v1

    .line 160
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-nez v1, :cond_a

    .line 167
    .line 168
    const/16 v1, 0xa

    .line 169
    .line 170
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 171
    .line 172
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->i(ILcom/google/protobuf/ByteString;)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    add-int/2addr v0, v1

    .line 177
    :cond_a
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 178
    .line 179
    if-eqz v1, :cond_b

    .line 180
    .line 181
    const/16 v2, 0xb

    .line 182
    .line 183
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    add-int/2addr v0, v1

    .line 188
    :cond_b
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 189
    .line 190
    if-eqz v1, :cond_c

    .line 191
    .line 192
    const/16 v2, 0xc

    .line 193
    .line 194
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    add-int/2addr v0, v1

    .line 199
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-nez v1, :cond_d

    .line 206
    .line 207
    const/16 v1, 0xd

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getChannel()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    add-int/2addr v0, v1

    .line 218
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_e

    .line 225
    .line 226
    const/16 v1, 0xe

    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAppID()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    add-int/2addr v0, v1

    .line 237
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-nez v1, :cond_f

    .line 244
    .line 245
    const/16 v1, 0xf

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getUserID()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    add-int/2addr v0, v1

    .line 256
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-nez v1, :cond_10

    .line 263
    .line 264
    const/16 v1, 0x10

    .line 265
    .line 266
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDeviceIdentifer()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    add-int/2addr v0, v1

    .line 275
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-nez v1, :cond_11

    .line 282
    .line 283
    const/16 v1, 0x11

    .line 284
    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getExt()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    add-int/2addr v0, v1

    .line 294
    :cond_11
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 295
    .line 296
    return v0
.end method

.method public getSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 2
    .line 3
    return p0
.end method

.method public getStaySide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getStaySideValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

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

.method public getXTTClientInfo()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXTestingGroup()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasLoc()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

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

.method public hasUa()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->accessToken_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAccessToken()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->source_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eq v0, v1, :cond_3

    .line 54
    .line 55
    const/4 v0, 0x4

    .line 56
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->staySide_:I

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->locale_:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    const/4 v0, 0x6

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getLocale()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->roomId_:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_6

    .line 96
    .line 97
    const/4 v0, 0x7

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getRoomId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_7

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    const/16 v0, 0x9

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 131
    .line 132
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 133
    .line 134
    .line 135
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_9

    .line 142
    .line 143
    const/16 v0, 0xa

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 146
    .line 147
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 148
    .line 149
    .line 150
    :cond_9
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mute_:Z

    .line 151
    .line 152
    if-eqz v0, :cond_a

    .line 153
    .line 154
    const/16 v1, 0xb

    .line 155
    .line 156
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 157
    .line 158
    .line 159
    :cond_a
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->mCC_:I

    .line 160
    .line 161
    if-eqz v0, :cond_b

    .line 162
    .line 163
    const/16 v1, 0xc

    .line 164
    .line 165
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 166
    .line 167
    .line 168
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->channel_:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_c

    .line 175
    .line 176
    const/16 v0, 0xd

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getChannel()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->appID_:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_d

    .line 192
    .line 193
    const/16 v0, 0xe

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getAppID()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->userID_:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_e

    .line 209
    .line 210
    const/16 v0, 0xf

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getUserID()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->deviceIdentifer_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_f

    .line 226
    .line 227
    const/16 v0, 0x10

    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getDeviceIdentifer()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->ext_:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-nez v0, :cond_10

    .line 243
    .line 244
    const/16 v0, 0x11

    .line 245
    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->getExt()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 251
    .line 252
    .line 253
    :cond_10
    return-void
.end method
