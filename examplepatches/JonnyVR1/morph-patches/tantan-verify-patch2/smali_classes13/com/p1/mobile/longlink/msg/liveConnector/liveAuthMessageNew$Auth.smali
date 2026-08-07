.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AuthOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Auth"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AuthOrBuilder;"
    }
.end annotation


# static fields
.field public static final CURRENTSTARTLINKTIME_FIELD_NUMBER:I = 0x18

.field public static final CURRENTTIME_FIELD_NUMBER:I = 0x15

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

.field public static final ENTERSOURCE_FIELD_NUMBER:I = 0x10

.field public static final EXT_FIELD_NUMBER:I = 0xb

.field public static final FIRSTLINKTIME_FIELD_NUMBER:I = 0x13

.field public static final FLAG_FIELD_NUMBER:I = 0xa

.field public static final INTERRUPTLINKTIME_FIELD_NUMBER:I = 0x14

.field public static final IOSVERIFY_FIELD_NUMBER:I = 0xd

.field public static final IPHOST_FIELD_NUMBER:I = 0x16

.field public static final LINKSTATE_FIELD_NUMBER:I = 0x12

.field public static final LIVEID_FIELD_NUMBER:I = 0xf

.field public static final LIVEMODE_FIELD_NUMBER:I = 0xe

.field public static final LOCALE_FIELD_NUMBER:I = 0x6

.field public static final LOC_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;",
            ">;"
        }
    .end annotation
.end field

.field public static final RETRYCOUNT_FIELD_NUMBER:I = 0x17

.field public static final ROOMID_FIELD_NUMBER:I = 0x7

.field public static final ROOMTYPE_FIELD_NUMBER:I = 0xc

.field public static final SESSIONID_FIELD_NUMBER:I = 0x11

.field public static final SOURCE_FIELD_NUMBER:I = 0x2

.field public static final STAYSIDE_FIELD_NUMBER:I = 0x4

.field public static final UA_FIELD_NUMBER:I = 0x5

.field public static final USERID_FIELD_NUMBER:I = 0x1

.field public static final XTESTINGGROUP_FIELD_NUMBER:I = 0x8

.field public static final XTTCLIENTINFO_FIELD_NUMBER:I = 0x9


# instance fields
.field private currentStartLinkTime_:J

.field private currentTime_:J

.field private enterSource_:Ljava/lang/String;

.field private ext_:Ljava/lang/String;

.field private firstLinkTime_:J

.field private flag_:Lcom/google/protobuf/ByteString;

.field private interruptLinkTime_:J

.field private iosVerify_:Z

.field private ipHost_:Ljava/lang/String;

.field private linkState_:I

.field private liveId_:Ljava/lang/String;

.field private liveMode_:Ljava/lang/String;

.field private loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

.field private locale_:Ljava/lang/String;

.field private retryCount_:I

.field private roomId_:Ljava/lang/String;

.field private roomType_:Ljava/lang/String;

.field private sessionId_:Ljava/lang/String;

.field private source_:I

.field private staySide_:I

.field private ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

.field private userId_:Ljava/lang/String;

.field private xTTClientInfo_:Lcom/google/protobuf/ByteString;

.field private xTestingGroup_:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setCurrentStartLinkTime(J)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setCurrentTime(J)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setEnterSource(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setEnterSourceBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setExt(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setExtBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setFirstLinkTime(J)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setFlag(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setInterruptLinkTime(J)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setIosVerify(Z)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setIpHost(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setIpHostBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLinkState(I)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLiveMode(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLiveModeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLocale(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setLocaleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setRetryCount(I)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setRoomType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setRoomTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearCurrentStartLinkTime()V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setSessionId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearCurrentTime()V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setSessionIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearEnterSource()V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setSource(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;)V

    return-void
.end method

.method private clearCurrentStartLinkTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearCurrentTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearEnterSource()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getEnterSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearExt()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getExt()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFirstLinkTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearFlag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getFlag()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method private clearInterruptLinkTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearIosVerify()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIpHost()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getIpHost()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLinkState()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveMode()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveMode()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLoc()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 3
    .line 4
    return-void
.end method

.method private clearLocale()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLocale()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRetryCount()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSessionId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getSessionId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearStaySide()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUa()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearXTTClientInfo()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getXTTClientInfo()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method private clearXTestingGroup()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getXTestingGroup()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearExt()V

    return-void
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setSourceValue(I)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearFirstLinkTime()V

    return-void
.end method

.method public static bridge synthetic e0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setStaySide(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearFlag()V

    return-void
.end method

.method public static bridge synthetic f0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setStaySideValue(I)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearInterruptLinkTime()V

    return-void
.end method

.method public static bridge synthetic g0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearIosVerify()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearIpHost()V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearLinkState()V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setXTTClientInfo(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearLiveMode()V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->setXTestingGroup(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearLoc()V

    return-void
.end method

.method public static bridge synthetic m0()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object v0
.end method

.method private mergeLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->newBuilder(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;->newBuilder(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearLocale()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearRetryCount()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearRoomId()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearRoomType()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearSessionId()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearSource()V

    return-void
.end method

.method private setCurrentStartLinkTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setCurrentTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setEnterSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEnterSourceBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFirstLinkTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setFlag(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    return-void
.end method

.method private setInterruptLinkTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setIosVerify(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIpHost(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIpHostBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLinkState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 2
    .line 3
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveMode(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveModeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 8
    .line 9
    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-void
.end method

.method private setLocale(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRetryCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRoomType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSessionId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSessionIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSourceValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 2
    .line 3
    return-void
.end method

.method private setStaySide(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 9
    .line 10
    return-void
.end method

.method private setStaySideValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 8
    .line 9
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearStaySide()V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearUa()V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearXTTClientInfo()V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->clearXTestingGroup()V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->mergeLoc(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->mergeUa(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->PARSER:Ll/ng60;

    if-nez p0, :cond_1

    const-class p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    monitor-enter p0

    .line 4
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->PARSER:Ll/ng60;

    if-nez p1, :cond_0

    .line 5
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    sget-object p2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->PARSER:Ll/ng60;

    return-object p0

    .line 8
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 9
    check-cast p3, Lcom/google/protobuf/h;

    :cond_2
    :goto_3
    if-nez v0, :cond_5

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

    goto/16 :goto_6

    :catch_1
    move-exception v0

    move-object p1, v0

    goto/16 :goto_7

    .line 12
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    goto :goto_3

    .line 13
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    goto :goto_3

    .line 14
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    goto :goto_3

    .line 16
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    goto :goto_3

    .line 17
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    goto :goto_3

    .line 18
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    goto :goto_3

    .line 19
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    goto :goto_3

    .line 20
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    goto :goto_3

    .line 22
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    goto :goto_3

    .line 24
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    goto :goto_3

    .line 26
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    goto :goto_3

    .line 28
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    goto :goto_3

    .line 29
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    goto :goto_3

    .line 31
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    goto :goto_3

    .line 33
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    goto/16 :goto_3

    .line 34
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    goto/16 :goto_3

    .line 35
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->n()Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    goto/16 :goto_3

    .line 36
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 38
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    goto/16 :goto_3

    .line 40
    :sswitch_14
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    if-eqz p1, :cond_3

    .line 41
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent$Builder;

    goto :goto_4

    :cond_3
    move-object p1, v1

    .line 42
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    if-eqz p1, :cond_2

    .line 43
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 44
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    goto/16 :goto_3

    .line 45
    :sswitch_15
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    move-result p1

    .line 46
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    goto/16 :goto_3

    .line 47
    :sswitch_16
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    if-eqz p1, :cond_4

    .line 48
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    goto :goto_5

    :cond_4
    move-object p1, v1

    .line 49
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    if-eqz p1, :cond_2

    .line 50
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 51
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    goto/16 :goto_3

    .line 52
    :sswitch_17
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    move-result p1

    .line 53
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    goto/16 :goto_3

    .line 54
    :sswitch_18
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    move-object p0, v0

    .line 56
    throw p0

    .line 57
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 58
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 59
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 60
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0

    .line 61
    :pswitch_3
    move-object v3, p2

    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 62
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    .line 63
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 65
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 66
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    if-eqz p1, :cond_6

    move p2, v2

    goto :goto_8

    :cond_6
    move p2, v0

    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    if-eqz v1, :cond_7

    move v4, v2

    goto :goto_9

    :cond_7
    move v4, v0

    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 67
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 68
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    if-eqz p1, :cond_8

    move p2, v2

    goto :goto_a

    :cond_8
    move p2, v0

    :goto_a
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    if-eqz v1, :cond_9

    move v4, v2

    goto :goto_b

    :cond_9
    move v4, v0

    :goto_b
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 69
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 70
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 71
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 72
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 73
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 75
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 76
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    sget-object p2, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    if-eq p1, p2, :cond_a

    move v1, v2

    goto :goto_c

    :cond_a
    move v1, v0

    :goto_c
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    if-eq v4, p2, :cond_b

    move v5, v2

    goto :goto_d

    :cond_b
    move v5, v0

    :goto_d
    invoke-interface {v3, v1, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 77
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    if-eq p1, p2, :cond_c

    move v1, v2

    goto :goto_e

    :cond_c
    move v1, v0

    :goto_e
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    if-eq v4, p2, :cond_d

    move v5, v2

    goto :goto_f

    :cond_d
    move v5, v0

    :goto_f
    invoke-interface {v3, v1, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 78
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    if-eq p1, p2, :cond_e

    move v1, v2

    goto :goto_10

    :cond_e
    move v1, v0

    :goto_10
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    if-eq v4, p2, :cond_f

    move p2, v2

    goto :goto_11

    :cond_f
    move p2, v0

    :goto_11
    invoke-interface {v3, v1, p1, p2, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 79
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 81
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 82
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 83
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 84
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 85
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 86
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 88
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 89
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 91
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 92
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 94
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 95
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 97
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 98
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    if-eqz p1, :cond_10

    move p2, v2

    goto :goto_12

    :cond_10
    move p2, v0

    :goto_12
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    if-eqz v1, :cond_11

    move v4, v2

    goto :goto_13

    :cond_11
    move v4, v0

    :goto_13
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 99
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    const-wide/16 p1, 0x0

    cmp-long v1, v5, p1

    if-eqz v1, :cond_12

    move v4, v2

    goto :goto_14

    :cond_12
    move v4, v0

    :goto_14
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_13

    move v7, v2

    goto :goto_15

    :cond_13
    move v7, v0

    :goto_15
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 100
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_14

    move v4, v2

    goto :goto_16

    :cond_14
    move v4, v0

    :goto_16
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_15

    move v7, v2

    goto :goto_17

    :cond_15
    move v7, v0

    :goto_17
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 101
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_16

    move v4, v2

    goto :goto_18

    :cond_16
    move v4, v0

    :goto_18
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_17

    move v7, v2

    goto :goto_19

    :cond_17
    move v7, v0

    :goto_19
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 102
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 103
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 104
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 105
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    if-eqz v1, :cond_18

    move v4, v2

    goto :goto_1a

    :cond_18
    move v4, v0

    :goto_1a
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    if-eqz v5, :cond_19

    move v6, v2

    goto :goto_1b

    :cond_19
    move v6, v0

    :goto_1b
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result v1

    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    move v1, v0

    move v4, v2

    move-object v0, v3

    .line 106
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    cmp-long v5, v2, p1

    if-eqz v5, :cond_1a

    move v5, v1

    move v1, v4

    goto :goto_1c

    :cond_1a
    move v5, v1

    :goto_1c
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    cmp-long p1, v6, p1

    if-eqz p1, :cond_1b

    :goto_1d
    move-wide v5, v6

    goto :goto_1e

    :cond_1b
    move v4, v5

    goto :goto_1d

    :goto_1e
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 107
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    return-object p0

    .line 108
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;

    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth$Builder;-><init>(Ll/w4r0;)V

    return-object p0

    :pswitch_5
    return-object v1

    .line 109
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    return-object p0

    .line 110
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;

    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;-><init>()V

    return-object p0

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
        0xa -> :sswitch_18
        0x10 -> :sswitch_17
        0x1a -> :sswitch_16
        0x20 -> :sswitch_15
        0x2a -> :sswitch_14
        0x32 -> :sswitch_13
        0x3a -> :sswitch_12
        0x42 -> :sswitch_11
        0x4a -> :sswitch_10
        0x52 -> :sswitch_f
        0x5a -> :sswitch_e
        0x62 -> :sswitch_d
        0x68 -> :sswitch_c
        0x72 -> :sswitch_b
        0x7a -> :sswitch_a
        0x82 -> :sswitch_9
        0x8a -> :sswitch_8
        0x90 -> :sswitch_7
        0x98 -> :sswitch_6
        0xa0 -> :sswitch_5
        0xa8 -> :sswitch_4
        0xb2 -> :sswitch_3
        0xb8 -> :sswitch_2
        0xc0 -> :sswitch_1
    .end sparse-switch
.end method

.method public getCurrentStartLinkTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCurrentTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEnterSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEnterSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

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

.method public getFirstLinkTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFlag()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInterruptLinkTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getIosVerify()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIpHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIpHostBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

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

.method public getLinkState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

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

.method public getLiveMode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveModeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

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

.method public getLoc()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocaleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

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

.method public getRetryCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

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

.method public getRoomType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getUserId()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->getNumber()I

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
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLoc()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 59
    .line 60
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->getNumber()I

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
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getUa()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLocale()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-nez v1, :cond_b

    .line 184
    .line 185
    const/16 v1, 0xb

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getExt()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    add-int/2addr v0, v1

    .line 196
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-nez v1, :cond_c

    .line 203
    .line 204
    const/16 v1, 0xc

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomType()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    add-int/2addr v0, v1

    .line 215
    :cond_c
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 216
    .line 217
    if-eqz v1, :cond_d

    .line 218
    .line 219
    const/16 v2, 0xd

    .line 220
    .line 221
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    add-int/2addr v0, v1

    .line 226
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-nez v1, :cond_e

    .line 233
    .line 234
    const/16 v1, 0xe

    .line 235
    .line 236
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveMode()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    add-int/2addr v0, v1

    .line 245
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_f

    .line 252
    .line 253
    const/16 v1, 0xf

    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveId()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    add-int/2addr v0, v1

    .line 264
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-nez v1, :cond_10

    .line 271
    .line 272
    const/16 v1, 0x10

    .line 273
    .line 274
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getEnterSource()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    add-int/2addr v0, v1

    .line 283
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-nez v1, :cond_11

    .line 290
    .line 291
    const/16 v1, 0x11

    .line 292
    .line 293
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getSessionId()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    add-int/2addr v0, v1

    .line 302
    :cond_11
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 303
    .line 304
    if-eqz v1, :cond_12

    .line 305
    .line 306
    const/16 v2, 0x12

    .line 307
    .line 308
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    add-int/2addr v0, v1

    .line 313
    :cond_12
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 314
    .line 315
    const-wide/16 v3, 0x0

    .line 316
    .line 317
    cmp-long v5, v1, v3

    .line 318
    .line 319
    if-eqz v5, :cond_13

    .line 320
    .line 321
    const/16 v5, 0x13

    .line 322
    .line 323
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    add-int/2addr v0, v1

    .line 328
    :cond_13
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 329
    .line 330
    cmp-long v5, v1, v3

    .line 331
    .line 332
    if-eqz v5, :cond_14

    .line 333
    .line 334
    const/16 v5, 0x14

    .line 335
    .line 336
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    add-int/2addr v0, v1

    .line 341
    :cond_14
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 342
    .line 343
    cmp-long v5, v1, v3

    .line 344
    .line 345
    if-eqz v5, :cond_15

    .line 346
    .line 347
    const/16 v5, 0x15

    .line 348
    .line 349
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    add-int/2addr v0, v1

    .line 354
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-nez v1, :cond_16

    .line 361
    .line 362
    const/16 v1, 0x16

    .line 363
    .line 364
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getIpHost()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    add-int/2addr v0, v1

    .line 373
    :cond_16
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    .line 374
    .line 375
    if-eqz v1, :cond_17

    .line 376
    .line 377
    const/16 v2, 0x17

    .line 378
    .line 379
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    add-int/2addr v0, v1

    .line 384
    :cond_17
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 385
    .line 386
    cmp-long v3, v1, v3

    .line 387
    .line 388
    if-eqz v3, :cond_18

    .line 389
    .line 390
    const/16 v3, 0x18

    .line 391
    .line 392
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    add-int/2addr v0, v1

    .line 397
    :cond_18
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 398
    .line 399
    return v0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSessionIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

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

.method public getSource()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 2
    .line 3
    return p0
.end method

.method public getStaySide()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getStaySideValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUa()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXTestingGroup()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasLoc()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getUserId()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ClientSourceEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->source_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->loc_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLoc()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->staySide_:I

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ua_:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getUa()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$UserAgent;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->locale_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLocale()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTestingGroup_:Lcom/google/protobuf/ByteString;

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->xTTClientInfo_:Lcom/google/protobuf/ByteString;

    .line 131
    .line 132
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 133
    .line 134
    .line 135
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->flag_:Lcom/google/protobuf/ByteString;

    .line 146
    .line 147
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->e0(ILcom/google/protobuf/ByteString;)V

    .line 148
    .line 149
    .line 150
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ext_:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-nez v0, :cond_a

    .line 157
    .line 158
    const/16 v0, 0xb

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getExt()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->roomType_:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_b

    .line 174
    .line 175
    const/16 v0, 0xc

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getRoomType()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    :cond_b
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->iosVerify_:Z

    .line 185
    .line 186
    if-eqz v0, :cond_c

    .line 187
    .line 188
    const/16 v1, 0xd

    .line 189
    .line 190
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 191
    .line 192
    .line 193
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveMode_:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_d

    .line 200
    .line 201
    const/16 v0, 0xe

    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveMode()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->liveId_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_e

    .line 217
    .line 218
    const/16 v0, 0xf

    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getLiveId()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 225
    .line 226
    .line 227
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->enterSource_:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-nez v0, :cond_f

    .line 234
    .line 235
    const/16 v0, 0x10

    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getEnterSource()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->sessionId_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-nez v0, :cond_10

    .line 251
    .line 252
    const/16 v0, 0x11

    .line 253
    .line 254
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getSessionId()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 259
    .line 260
    .line 261
    :cond_10
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->linkState_:I

    .line 262
    .line 263
    if-eqz v0, :cond_11

    .line 264
    .line 265
    const/16 v1, 0x12

    .line 266
    .line 267
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 268
    .line 269
    .line 270
    :cond_11
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->firstLinkTime_:J

    .line 271
    .line 272
    const-wide/16 v2, 0x0

    .line 273
    .line 274
    cmp-long v4, v0, v2

    .line 275
    .line 276
    if-eqz v4, :cond_12

    .line 277
    .line 278
    const/16 v4, 0x13

    .line 279
    .line 280
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 281
    .line 282
    .line 283
    :cond_12
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->interruptLinkTime_:J

    .line 284
    .line 285
    cmp-long v4, v0, v2

    .line 286
    .line 287
    if-eqz v4, :cond_13

    .line 288
    .line 289
    const/16 v4, 0x14

    .line 290
    .line 291
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 292
    .line 293
    .line 294
    :cond_13
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentTime_:J

    .line 295
    .line 296
    cmp-long v4, v0, v2

    .line 297
    .line 298
    if-eqz v4, :cond_14

    .line 299
    .line 300
    const/16 v4, 0x15

    .line 301
    .line 302
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 303
    .line 304
    .line 305
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->ipHost_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-nez v0, :cond_15

    .line 312
    .line 313
    const/16 v0, 0x16

    .line 314
    .line 315
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->getIpHost()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 320
    .line 321
    .line 322
    :cond_15
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->retryCount_:I

    .line 323
    .line 324
    if-eqz v0, :cond_16

    .line 325
    .line 326
    const/16 v1, 0x17

    .line 327
    .line 328
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 329
    .line 330
    .line 331
    :cond_16
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Auth;->currentStartLinkTime_:J

    .line 332
    .line 333
    cmp-long p0, v0, v2

    .line 334
    .line 335
    if-eqz p0, :cond_17

    .line 336
    .line 337
    const/16 p0, 0x18

    .line 338
    .line 339
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 340
    .line 341
    .line 342
    :cond_17
    return-void
.end method
