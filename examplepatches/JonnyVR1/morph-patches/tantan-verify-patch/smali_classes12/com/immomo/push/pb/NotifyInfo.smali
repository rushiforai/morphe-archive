.class public final Lcom/immomo/push/pb/NotifyInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/push/pb/NotifyInfo$b;,
        Lcom/immomo/push/pb/NotifyInfo$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/immomo/push/pb/NotifyInfo;",
        "Lcom/immomo/push/pb/NotifyInfo$b;",
        ">;",
        "Ll/lfz;"
    }
.end annotation


# static fields
.field public static final ACTIONTYPE_FIELD_NUMBER:I = 0x4

.field public static final ACTION_FIELD_NUMBER:I = 0x5

.field public static final AUTOCANCEL_FIELD_NUMBER:I = 0x10

.field public static final BACKGROUNDSHOW_FIELD_NUMBER:I = 0xb

.field public static final DATA_FIELD_NUMBER:I = 0xc

.field private static final DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

.field public static final DESC_FIELD_NUMBER:I = 0x3

.field public static final ICON_FIELD_NUMBER:I = 0x6

.field public static final LIGHT_FIELD_NUMBER:I = 0xa

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/immomo/push/pb/NotifyInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final POPNOTIFY_FIELD_NUMBER:I = 0xf

.field public static final SHOWEXPIRE_FIELD_NUMBER:I = 0xe

.field public static final SHOWTIME_FIELD_NUMBER:I = 0xd

.field public static final SOUNDTYPE_FIELD_NUMBER:I = 0x8

.field public static final SOUND_FIELD_NUMBER:I = 0x7

.field public static final TITLE_FIELD_NUMBER:I = 0x2

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final VIBRATE_FIELD_NUMBER:I = 0x9


# instance fields
.field private actionType_:I

.field private action_:Ljava/lang/String;

.field private autoCancel_:Z

.field private backgroundShow_:I

.field private bitField0_:I

.field private data_:Lcom/google/protobuf/MapFieldLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private desc_:Ljava/lang/String;

.field private icon_:Ljava/lang/String;

.field private light_:I

.field private popNotify_:Z

.field private showExpire_:J

.field private showTime_:J

.field private soundType_:Ljava/lang/String;

.field private sound_:I

.field private title_:Ljava/lang/String;

.field private type_:Ljava/lang/String;

.field private vibrate_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/push/pb/NotifyInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

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
    invoke-static {}, Lcom/google/protobuf/MapFieldLite;->emptyMapField()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic access$000()Lcom/immomo/push/pb/NotifyInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setType(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/immomo/push/pb/NotifyInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setActionType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearActionType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setAction(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearAction()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setActionBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setIcon(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearIcon()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/immomo/push/pb/NotifyInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setSound(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearSound()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2000(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setSoundType(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2100(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearSoundType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2200(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setSoundTypeBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300(Lcom/immomo/push/pb/NotifyInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setVibrate(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2400(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearVibrate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2500(Lcom/immomo/push/pb/NotifyInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setLight(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2600(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearLight()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lcom/immomo/push/pb/NotifyInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setBackgroundShow(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2800(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearBackgroundShow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2900(Lcom/immomo/push/pb/NotifyInfo;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->getMutableDataMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$300(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3000(Lcom/immomo/push/pb/NotifyInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/push/pb/NotifyInfo;->setShowTime(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3100(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearShowTime()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3200(Lcom/immomo/push/pb/NotifyInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/push/pb/NotifyInfo;->setShowExpire(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3300(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearShowExpire()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3400(Lcom/immomo/push/pb/NotifyInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setPopNotify(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3500(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearPopNotify()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3600(Lcom/immomo/push/pb/NotifyInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setAutoCancel(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3700(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearAutoCancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setTitle(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearTitle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/immomo/push/pb/NotifyInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setDesc(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->clearDesc()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/immomo/push/pb/NotifyInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/NotifyInfo;->setDescBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearAction()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getAction()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearActionType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearAutoCancel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearBackgroundShow()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearDesc()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getDesc()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLight()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearPopNotify()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearShowExpire()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearShowTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSound()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSoundType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getSoundType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/NotifyInfo;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearVibrate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 3
    .line 4
    return-void
.end method

.method public static getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method private getMutableDataMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetMutableData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private internalGetData()Lcom/google/protobuf/MapFieldLite;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    return-object p0
.end method

.method private internalGetMutableData()Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 18
    .line 19
    return-object p0
.end method

.method public static newBuilder()Lcom/immomo/push/pb/NotifyInfo$b;
    .locals 1

    .line 16
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/immomo/push/pb/NotifyInfo$b;

    return-object v0
.end method

.method public static newBuilder(Lcom/immomo/push/pb/NotifyInfo;)Lcom/immomo/push/pb/NotifyInfo$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/immomo/push/pb/NotifyInfo$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/immomo/push/pb/NotifyInfo$b;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/immomo/push/pb/NotifyInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/NotifyInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/immomo/push/pb/NotifyInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

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

.method private setAction(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setActionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setActionType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setAutoCancel(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setBackgroundShow(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 2
    .line 3
    return-void
.end method

.method private setDesc(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDescBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 2
    .line 3
    return-void
.end method

.method private setPopNotify(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setShowExpire(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 2
    .line 3
    return-void
.end method

.method private setShowTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSound(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSoundType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSoundTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setVibrate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public containsData(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/immomo/push/pb/NotifyInfo$a;->a:[I

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
    sget-object p0, Lcom/immomo/push/pb/NotifyInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/immomo/push/pb/NotifyInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/immomo/push/pb/NotifyInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/immomo/push/pb/NotifyInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/immomo/push/pb/NotifyInfo;->PARSER:Ll/ng60;

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
    goto/16 :goto_4

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_5

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    iput-wide v3, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 122
    .line 123
    :cond_3
    sget-object p1, Lcom/immomo/push/pb/NotifyInfo$c;->a:Lcom/google/protobuf/p;

    .line 124
    .line 125
    iget-object v3, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 126
    .line 127
    invoke-virtual {p1, v3, p2, p3}, Lcom/google/protobuf/p;->e(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)V

    .line 128
    .line 129
    .line 130
    goto :goto_3

    .line 131
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_3

    .line 203
    .line 204
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :catchall_1
    move-exception v0

    .line 213
    move-object p0, v0

    .line 214
    throw p0

    .line 215
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 216
    .line 217
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    return-object v1

    .line 232
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 237
    .line 238
    .line 239
    return-object v1

    .line 240
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 241
    .line 242
    return-object p0

    .line 243
    :pswitch_3
    move-object v3, p2

    .line 244
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 245
    .line 246
    check-cast p3, Lcom/immomo/push/pb/NotifyInfo;

    .line 247
    .line 248
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    xor-int/2addr p1, v2

    .line 255
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 256
    .line 257
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    xor-int/2addr v1, v2

    .line 264
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 271
    .line 272
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    xor-int/2addr p1, v2

    .line 279
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    xor-int/2addr v1, v2

    .line 288
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 289
    .line 290
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 295
    .line 296
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    xor-int/2addr v1, v2

    .line 312
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 319
    .line 320
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 321
    .line 322
    if-eqz p1, :cond_5

    .line 323
    .line 324
    move p2, v2

    .line 325
    goto :goto_6

    .line 326
    :cond_5
    move p2, v0

    .line 327
    :goto_6
    iget v1, p3, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 328
    .line 329
    if-eqz v1, :cond_6

    .line 330
    .line 331
    move v4, v2

    .line 332
    goto :goto_7

    .line 333
    :cond_6
    move v4, v0

    .line 334
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 339
    .line 340
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    xor-int/2addr p1, v2

    .line 347
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 348
    .line 349
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    xor-int/2addr v1, v2

    .line 356
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 357
    .line 358
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 363
    .line 364
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result p1

    .line 370
    xor-int/2addr p1, v2

    .line 371
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 372
    .line 373
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    xor-int/2addr v1, v2

    .line 380
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 381
    .line 382
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 387
    .line 388
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 389
    .line 390
    if-eqz p1, :cond_7

    .line 391
    .line 392
    move p2, v2

    .line 393
    goto :goto_8

    .line 394
    :cond_7
    move p2, v0

    .line 395
    :goto_8
    iget v1, p3, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 396
    .line 397
    if-eqz v1, :cond_8

    .line 398
    .line 399
    move v4, v2

    .line 400
    goto :goto_9

    .line 401
    :cond_8
    move v4, v0

    .line 402
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 403
    .line 404
    .line 405
    move-result p1

    .line 406
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 407
    .line 408
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 416
    .line 417
    iget-object v1, p3, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    xor-int/2addr v1, v2

    .line 424
    iget-object v4, p3, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 425
    .line 426
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 431
    .line 432
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 433
    .line 434
    if-eqz p1, :cond_9

    .line 435
    .line 436
    move p2, v2

    .line 437
    goto :goto_a

    .line 438
    :cond_9
    move p2, v0

    .line 439
    :goto_a
    iget v1, p3, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 440
    .line 441
    if-eqz v1, :cond_a

    .line 442
    .line 443
    move v4, v2

    .line 444
    goto :goto_b

    .line 445
    :cond_a
    move v4, v0

    .line 446
    :goto_b
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 447
    .line 448
    .line 449
    move-result p1

    .line 450
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 451
    .line 452
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 453
    .line 454
    if-eqz p1, :cond_b

    .line 455
    .line 456
    move p2, v2

    .line 457
    goto :goto_c

    .line 458
    :cond_b
    move p2, v0

    .line 459
    :goto_c
    iget v1, p3, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 460
    .line 461
    if-eqz v1, :cond_c

    .line 462
    .line 463
    move v4, v2

    .line 464
    goto :goto_d

    .line 465
    :cond_c
    move v4, v0

    .line 466
    :goto_d
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 467
    .line 468
    .line 469
    move-result p1

    .line 470
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 471
    .line 472
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 473
    .line 474
    if-eqz p1, :cond_d

    .line 475
    .line 476
    move p2, v2

    .line 477
    goto :goto_e

    .line 478
    :cond_d
    move p2, v0

    .line 479
    :goto_e
    iget v1, p3, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 480
    .line 481
    if-eqz v1, :cond_e

    .line 482
    .line 483
    move v4, v2

    .line 484
    goto :goto_f

    .line 485
    :cond_e
    move v4, v0

    .line 486
    :goto_f
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 491
    .line 492
    iget-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 493
    .line 494
    invoke-direct {p3}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 495
    .line 496
    .line 497
    move-result-object p2

    .line 498
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->l(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/MapFieldLite;)Lcom/google/protobuf/MapFieldLite;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    iput-object p1, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 503
    .line 504
    iget-wide v5, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 505
    .line 506
    const-wide/16 p1, 0x0

    .line 507
    .line 508
    cmp-long v1, v5, p1

    .line 509
    .line 510
    if-eqz v1, :cond_f

    .line 511
    .line 512
    move v4, v2

    .line 513
    goto :goto_10

    .line 514
    :cond_f
    move v4, v0

    .line 515
    :goto_10
    iget-wide v8, p3, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 516
    .line 517
    cmp-long v1, v8, p1

    .line 518
    .line 519
    if-eqz v1, :cond_10

    .line 520
    .line 521
    move v7, v2

    .line 522
    goto :goto_11

    .line 523
    :cond_10
    move v7, v0

    .line 524
    :goto_11
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 525
    .line 526
    .line 527
    move-result-wide v4

    .line 528
    iput-wide v4, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 529
    .line 530
    move v1, v0

    .line 531
    move v4, v2

    .line 532
    move-object v0, v3

    .line 533
    iget-wide v2, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 534
    .line 535
    cmp-long v5, v2, p1

    .line 536
    .line 537
    if-eqz v5, :cond_11

    .line 538
    .line 539
    move v5, v1

    .line 540
    move v1, v4

    .line 541
    goto :goto_12

    .line 542
    :cond_11
    move v5, v1

    .line 543
    :goto_12
    iget-wide v6, p3, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 544
    .line 545
    cmp-long p1, v6, p1

    .line 546
    .line 547
    if-eqz p1, :cond_12

    .line 548
    .line 549
    :goto_13
    move-wide v5, v6

    .line 550
    goto :goto_14

    .line 551
    :cond_12
    move v4, v5

    .line 552
    goto :goto_13

    .line 553
    :goto_14
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 554
    .line 555
    .line 556
    move-result-wide p1

    .line 557
    iput-wide p1, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 558
    .line 559
    iget-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 560
    .line 561
    iget-boolean p2, p3, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 562
    .line 563
    invoke-interface {v0, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 564
    .line 565
    .line 566
    move-result p1

    .line 567
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 568
    .line 569
    iget-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 570
    .line 571
    iget-boolean p2, p3, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 572
    .line 573
    invoke-interface {v0, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 574
    .line 575
    .line 576
    move-result p1

    .line 577
    iput-boolean p1, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 578
    .line 579
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 580
    .line 581
    if-ne v0, p1, :cond_13

    .line 582
    .line 583
    iget p1, p0, Lcom/immomo/push/pb/NotifyInfo;->bitField0_:I

    .line 584
    .line 585
    iget p2, p3, Lcom/immomo/push/pb/NotifyInfo;->bitField0_:I

    .line 586
    .line 587
    or-int/2addr p1, p2

    .line 588
    iput p1, p0, Lcom/immomo/push/pb/NotifyInfo;->bitField0_:I

    .line 589
    .line 590
    :cond_13
    return-object p0

    .line 591
    :pswitch_4
    new-instance p0, Lcom/immomo/push/pb/NotifyInfo$b;

    .line 592
    .line 593
    invoke-direct {p0, v1}, Lcom/immomo/push/pb/NotifyInfo$b;-><init>(Lcom/immomo/push/pb/NotifyInfo$a;)V

    .line 594
    .line 595
    .line 596
    return-object p0

    .line 597
    :pswitch_5
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 598
    .line 599
    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->makeImmutable()V

    .line 600
    .line 601
    .line 602
    return-object v1

    .line 603
    :pswitch_6
    sget-object p0, Lcom/immomo/push/pb/NotifyInfo;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/NotifyInfo;

    .line 604
    .line 605
    return-object p0

    .line 606
    :pswitch_7
    new-instance p0, Lcom/immomo/push/pb/NotifyInfo;

    .line 607
    .line 608
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;-><init>()V

    .line 609
    .line 610
    .line 611
    return-object p0

    .line 612
    nop

    .line 613
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

    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x20 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x38 -> :sswitch_a
        0x42 -> :sswitch_9
        0x48 -> :sswitch_8
        0x50 -> :sswitch_7
        0x58 -> :sswitch_6
        0x62 -> :sswitch_5
        0x68 -> :sswitch_4
        0x70 -> :sswitch_3
        0x78 -> :sswitch_2
        0x80 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getActionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

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

.method public getActionType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getAutoCancel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getBackgroundShow()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getDataMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDataCount()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDataMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDataOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    return-object p2
.end method

.method public getDataOrThrow(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public getDesc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDescBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

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

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

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

.method public getLight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 2
    .line 3
    return p0
.end method

.method public getPopNotify()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 2
    .line 3
    return p0
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
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getType()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getTitle()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getDesc()Ljava/lang/String;

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
    iget v1, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getAction()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getIcon()Ljava/lang/String;

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
    iget v1, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    const/4 v2, 0x7

    .line 113
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    add-int/2addr v0, v1

    .line 118
    :cond_7
    iget-object v1, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-nez v1, :cond_8

    .line 125
    .line 126
    const/16 v1, 0x8

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getSoundType()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    add-int/2addr v0, v1

    .line 137
    :cond_8
    iget v1, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 138
    .line 139
    if-eqz v1, :cond_9

    .line 140
    .line 141
    const/16 v2, 0x9

    .line 142
    .line 143
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    add-int/2addr v0, v1

    .line 148
    :cond_9
    iget v1, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 149
    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    const/16 v2, 0xa

    .line 153
    .line 154
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    add-int/2addr v0, v1

    .line 159
    :cond_a
    iget v1, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 160
    .line 161
    if-eqz v1, :cond_b

    .line 162
    .line 163
    const/16 v2, 0xb

    .line 164
    .line 165
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    add-int/2addr v0, v1

    .line 170
    :cond_b
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_c

    .line 187
    .line 188
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Ljava/util/Map$Entry;

    .line 193
    .line 194
    sget-object v3, Lcom/immomo/push/pb/NotifyInfo$c;->a:Lcom/google/protobuf/p;

    .line 195
    .line 196
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const/16 v5, 0xc

    .line 205
    .line 206
    invoke-virtual {v3, v5, v4, v2}, Lcom/google/protobuf/p;->a(ILjava/lang/Object;Ljava/lang/Object;)I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    add-int/2addr v0, v2

    .line 211
    goto :goto_1

    .line 212
    :cond_c
    iget-wide v1, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 213
    .line 214
    const-wide/16 v3, 0x0

    .line 215
    .line 216
    cmp-long v5, v1, v3

    .line 217
    .line 218
    if-eqz v5, :cond_d

    .line 219
    .line 220
    const/16 v5, 0xd

    .line 221
    .line 222
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    add-int/2addr v0, v1

    .line 227
    :cond_d
    iget-wide v1, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 228
    .line 229
    cmp-long v3, v1, v3

    .line 230
    .line 231
    if-eqz v3, :cond_e

    .line 232
    .line 233
    const/16 v3, 0xe

    .line 234
    .line 235
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    add-int/2addr v0, v1

    .line 240
    :cond_e
    iget-boolean v1, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 241
    .line 242
    if-eqz v1, :cond_f

    .line 243
    .line 244
    const/16 v2, 0xf

    .line 245
    .line 246
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    add-int/2addr v0, v1

    .line 251
    :cond_f
    iget-boolean v1, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 252
    .line 253
    if-eqz v1, :cond_10

    .line 254
    .line 255
    const/16 v2, 0x10

    .line 256
    .line 257
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    add-int/2addr v0, v1

    .line 262
    :cond_10
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 263
    .line 264
    return v0
.end method

.method public getShowExpire()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getShowTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSound()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSoundType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoundTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

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

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

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

.method public getVibrate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 2
    .line 3
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
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->type_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getType()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->desc_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getDesc()Ljava/lang/String;

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
    iget v0, p0, Lcom/immomo/push/pb/NotifyInfo;->actionType_:I

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->action_:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getAction()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getIcon()Ljava/lang/String;

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
    iget v0, p0, Lcom/immomo/push/pb/NotifyInfo;->sound_:I

    .line 90
    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    const/4 v1, 0x7

    .line 94
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget-object v0, p0, Lcom/immomo/push/pb/NotifyInfo;->soundType_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_7

    .line 104
    .line 105
    const/16 v0, 0x8

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/immomo/push/pb/NotifyInfo;->getSoundType()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_7
    iget v0, p0, Lcom/immomo/push/pb/NotifyInfo;->vibrate_:I

    .line 115
    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    const/16 v1, 0x9

    .line 119
    .line 120
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 121
    .line 122
    .line 123
    :cond_8
    iget v0, p0, Lcom/immomo/push/pb/NotifyInfo;->light_:I

    .line 124
    .line 125
    if-eqz v0, :cond_9

    .line 126
    .line 127
    const/16 v1, 0xa

    .line 128
    .line 129
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 130
    .line 131
    .line 132
    :cond_9
    iget v0, p0, Lcom/immomo/push/pb/NotifyInfo;->backgroundShow_:I

    .line 133
    .line 134
    if-eqz v0, :cond_a

    .line 135
    .line 136
    const/16 v1, 0xb

    .line 137
    .line 138
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 139
    .line 140
    .line 141
    :cond_a
    invoke-direct {p0}, Lcom/immomo/push/pb/NotifyInfo;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    check-cast v1, Ljava/util/Map$Entry;

    .line 164
    .line 165
    sget-object v2, Lcom/immomo/push/pb/NotifyInfo$c;->a:Lcom/google/protobuf/p;

    .line 166
    .line 167
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/16 v4, 0xc

    .line 176
    .line 177
    invoke-virtual {v2, p1, v4, v3, v1}, Lcom/google/protobuf/p;->f(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_b
    iget-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showTime_:J

    .line 182
    .line 183
    const-wide/16 v2, 0x0

    .line 184
    .line 185
    cmp-long v4, v0, v2

    .line 186
    .line 187
    if-eqz v4, :cond_c

    .line 188
    .line 189
    const/16 v4, 0xd

    .line 190
    .line 191
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 192
    .line 193
    .line 194
    :cond_c
    iget-wide v0, p0, Lcom/immomo/push/pb/NotifyInfo;->showExpire_:J

    .line 195
    .line 196
    cmp-long v2, v0, v2

    .line 197
    .line 198
    if-eqz v2, :cond_d

    .line 199
    .line 200
    const/16 v2, 0xe

    .line 201
    .line 202
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 203
    .line 204
    .line 205
    :cond_d
    iget-boolean v0, p0, Lcom/immomo/push/pb/NotifyInfo;->popNotify_:Z

    .line 206
    .line 207
    if-eqz v0, :cond_e

    .line 208
    .line 209
    const/16 v1, 0xf

    .line 210
    .line 211
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 212
    .line 213
    .line 214
    :cond_e
    iget-boolean p0, p0, Lcom/immomo/push/pb/NotifyInfo;->autoCancel_:Z

    .line 215
    .line 216
    if-eqz p0, :cond_f

    .line 217
    .line 218
    const/16 v0, 0x10

    .line 219
    .line 220
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 221
    .line 222
    .line 223
    :cond_f
    return-void
.end method
