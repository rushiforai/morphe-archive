.class public final Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotificationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserWithBgColorSocketNotification"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotificationOrBuilder;"
    }
.end annotation


# static fields
.field public static final BGSTYLE_FIELD_NUMBER:I = 0x3

.field public static final CONTENT_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

.field public static final ICON_FIELD_NUMBER:I = 0x2

.field public static final ISCOUNTDOWN_FIELD_NUMBER:I = 0xb

.field public static final ISFIXED_FIELD_NUMBER:I = 0xc

.field public static final JUMP_FIELD_NUMBER:I = 0x5

.field public static final MOVEUP_FIELD_NUMBER:I = 0xa

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final ROTATIONINTERVAL_FIELD_NUMBER:I = 0x8

.field public static final SHOWSECONDS_FIELD_NUMBER:I = 0x7

.field public static final SHOWTIMES_FIELD_NUMBER:I = 0x6

.field public static final TYPE_FIELD_NUMBER:I = 0x9


# instance fields
.field private bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

.field private content_:Ljava/lang/String;

.field private icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

.field private isCountdown_:Z

.field private isFixed_:Z

.field private jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

.field private moveUp_:Z

.field private roomId_:Ljava/lang/String;

.field private rotationInterval_:J

.field private showSeconds_:J

.field private showTimes_:J

.field private type_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setRotationInterval(J)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setShowSeconds(J)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setShowTimes(J)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearBgStyle()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearContent()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearIcon()V

    return-void
.end method

.method private clearBgStyle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearIsCountdown()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsFixed()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearJump()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearMoveUp()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRotationInterval()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearShowSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearShowTimes()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearIsCountdown()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearIsFixed()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearJump()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearMoveUp()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearRotationInterval()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearShowSeconds()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearShowTimes()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->clearType()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->mergeBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V

    return-void
.end method

.method private mergeBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 33
    .line 34
    return-void
.end method

.method private mergeIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 33
    .line 34
    return-void
.end method

.method private mergeJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->mergeIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->mergeJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setBgStyle(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    return-void
.end method

.method private setIsCountdown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsFixed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    return-void
.end method

.method private setMoveUp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRotationInterval(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 2
    .line 3
    return-void
.end method

.method private setShowSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method private setShowTimes(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 2
    .line 3
    return-void
.end method

.method private setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setIcon(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setIsCountdown(Z)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setIsFixed(Z)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setJump(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->setMoveUp(Z)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_6

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
    goto/16 :goto_7

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_8

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

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
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 115
    .line 116
    .line 117
    move-result-wide v3

    .line 118
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 122
    .line 123
    .line 124
    move-result-wide v3

    .line 125
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :sswitch_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 129
    .line 130
    if-eqz p1, :cond_3

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_3
    move-object p1, v1

    .line 140
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->parser()Ll/ng60;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 149
    .line 150
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 151
    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 162
    .line 163
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 174
    .line 175
    if-eqz p1, :cond_4

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_4
    move-object p1, v1

    .line 185
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->parser()Ll/ng60;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 194
    .line 195
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 196
    .line 197
    if-eqz p1, :cond_2

    .line 198
    .line 199
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 213
    .line 214
    if-eqz p1, :cond_5

    .line 215
    .line 216
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;

    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_5
    move-object p1, v1

    .line 224
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->parser()Ll/ng60;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 233
    .line 234
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 235
    .line 236
    if-eqz p1, :cond_2

    .line 237
    .line 238
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 246
    .line 247
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 248
    .line 249
    goto/16 :goto_3

    .line 250
    .line 251
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 256
    .line 257
    goto/16 :goto_3

    .line 258
    .line 259
    :catchall_1
    move-exception v0

    .line 260
    move-object p0, v0

    .line 261
    throw p0

    .line 262
    :goto_7
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 263
    .line 264
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 276
    .line 277
    .line 278
    return-object v1

    .line 279
    :goto_8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 284
    .line 285
    .line 286
    return-object v1

    .line 287
    :cond_6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 288
    .line 289
    return-object p0

    .line 290
    :pswitch_3
    move-object v3, p2

    .line 291
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 292
    .line 293
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    xor-int/2addr p1, v2

    .line 302
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    xor-int/2addr v1, v2

    .line 311
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 320
    .line 321
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 322
    .line 323
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 328
    .line 329
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 330
    .line 331
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 332
    .line 333
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 334
    .line 335
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 340
    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    xor-int/2addr v1, v2

    .line 359
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 368
    .line 369
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 370
    .line 371
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 376
    .line 377
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 378
    .line 379
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 380
    .line 381
    const-wide/16 p1, 0x0

    .line 382
    .line 383
    cmp-long v1, v5, p1

    .line 384
    .line 385
    if-eqz v1, :cond_7

    .line 386
    .line 387
    move v4, v2

    .line 388
    goto :goto_9

    .line 389
    :cond_7
    move v4, v0

    .line 390
    :goto_9
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 391
    .line 392
    cmp-long v1, v8, p1

    .line 393
    .line 394
    if-eqz v1, :cond_8

    .line 395
    .line 396
    move v7, v2

    .line 397
    goto :goto_a

    .line 398
    :cond_8
    move v7, v0

    .line 399
    :goto_a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 400
    .line 401
    .line 402
    move-result-wide v4

    .line 403
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 404
    .line 405
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 406
    .line 407
    cmp-long v1, v5, p1

    .line 408
    .line 409
    if-eqz v1, :cond_9

    .line 410
    .line 411
    move v4, v2

    .line 412
    goto :goto_b

    .line 413
    :cond_9
    move v4, v0

    .line 414
    :goto_b
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 415
    .line 416
    cmp-long v1, v8, p1

    .line 417
    .line 418
    if-eqz v1, :cond_a

    .line 419
    .line 420
    move v7, v2

    .line 421
    goto :goto_c

    .line 422
    :cond_a
    move v7, v0

    .line 423
    :goto_c
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 424
    .line 425
    .line 426
    move-result-wide v4

    .line 427
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 428
    .line 429
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 430
    .line 431
    cmp-long v1, v5, p1

    .line 432
    .line 433
    if-eqz v1, :cond_b

    .line 434
    .line 435
    move v4, v2

    .line 436
    goto :goto_d

    .line 437
    :cond_b
    move v4, v0

    .line 438
    :goto_d
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 439
    .line 440
    cmp-long p1, v8, p1

    .line 441
    .line 442
    if-eqz p1, :cond_c

    .line 443
    .line 444
    move v7, v2

    .line 445
    goto :goto_e

    .line 446
    :cond_c
    move v7, v0

    .line 447
    :goto_e
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 448
    .line 449
    .line 450
    move-result-wide p1

    .line 451
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 452
    .line 453
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 454
    .line 455
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    xor-int/2addr p1, v2

    .line 460
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 461
    .line 462
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 463
    .line 464
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    xor-int/2addr v0, v2

    .line 469
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 470
    .line 471
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 476
    .line 477
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 478
    .line 479
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 480
    .line 481
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 486
    .line 487
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 488
    .line 489
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 490
    .line 491
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 496
    .line 497
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 498
    .line 499
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 500
    .line 501
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 502
    .line 503
    .line 504
    move-result p1

    .line 505
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 506
    .line 507
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 508
    .line 509
    return-object p0

    .line 510
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;

    .line 511
    .line 512
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification$Builder;-><init>(Ll/q1w;)V

    .line 513
    .line 514
    .line 515
    return-object p0

    .line 516
    :pswitch_5
    return-object v1

    .line 517
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 518
    .line 519
    return-object p0

    .line 520
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 521
    .line 522
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;-><init>()V

    .line 523
    .line 524
    .line 525
    return-object p0

    .line 526
    nop

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

    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x30 -> :sswitch_7
        0x38 -> :sswitch_6
        0x40 -> :sswitch_5
        0x4a -> :sswitch_4
        0x50 -> :sswitch_3
        0x58 -> :sswitch_2
        0x60 -> :sswitch_1
    .end sparse-switch
.end method

.method public getBgStyle()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

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

.method public getIcon()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getIsCountdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsFixed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getJump()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getMoveUp()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

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

.method public getRotationInterval()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getIcon()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 41
    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getBgStyle()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getContent()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getJump()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 87
    .line 88
    const-wide/16 v3, 0x0

    .line 89
    .line 90
    cmp-long v5, v1, v3

    .line 91
    .line 92
    if-eqz v5, :cond_6

    .line 93
    .line 94
    const/4 v5, 0x6

    .line 95
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 101
    .line 102
    cmp-long v5, v1, v3

    .line 103
    .line 104
    if-eqz v5, :cond_7

    .line 105
    .line 106
    const/4 v5, 0x7

    .line 107
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_7
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 113
    .line 114
    cmp-long v3, v1, v3

    .line 115
    .line 116
    if-eqz v3, :cond_8

    .line 117
    .line 118
    const/16 v3, 0x8

    .line 119
    .line 120
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    add-int/2addr v0, v1

    .line 125
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-nez v1, :cond_9

    .line 132
    .line 133
    const/16 v1, 0x9

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getType()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    add-int/2addr v0, v1

    .line 144
    :cond_9
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 145
    .line 146
    if-eqz v1, :cond_a

    .line 147
    .line 148
    const/16 v2, 0xa

    .line 149
    .line 150
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    add-int/2addr v0, v1

    .line 155
    :cond_a
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 156
    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    const/16 v2, 0xb

    .line 160
    .line 161
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    add-int/2addr v0, v1

    .line 166
    :cond_b
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 167
    .line 168
    if-eqz v1, :cond_c

    .line 169
    .line 170
    const/16 v2, 0xc

    .line 171
    .line 172
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    add-int/2addr v0, v1

    .line 177
    :cond_c
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 178
    .line 179
    return v0
.end method

.method public getShowSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getShowTimes()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

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

.method public hasBgStyle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

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

.method public hasIcon()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

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

.method public hasJump()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->icon_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getIcon()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getBgStyle()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->content_:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getContent()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->jump_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getJump()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showTimes_:J

    .line 70
    .line 71
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    cmp-long v4, v0, v2

    .line 74
    .line 75
    if-eqz v4, :cond_5

    .line 76
    .line 77
    const/4 v4, 0x6

    .line 78
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->showSeconds_:J

    .line 82
    .line 83
    cmp-long v4, v0, v2

    .line 84
    .line 85
    if-eqz v4, :cond_6

    .line 86
    .line 87
    const/4 v4, 0x7

    .line 88
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 89
    .line 90
    .line 91
    :cond_6
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->rotationInterval_:J

    .line 92
    .line 93
    cmp-long v2, v0, v2

    .line 94
    .line 95
    if-eqz v2, :cond_7

    .line 96
    .line 97
    const/16 v2, 0x8

    .line 98
    .line 99
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 100
    .line 101
    .line 102
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->type_:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_8

    .line 109
    .line 110
    const/16 v0, 0x9

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getType()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_8
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->moveUp_:Z

    .line 120
    .line 121
    if-eqz v0, :cond_9

    .line 122
    .line 123
    const/16 v1, 0xa

    .line 124
    .line 125
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 126
    .line 127
    .line 128
    :cond_9
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isCountdown_:Z

    .line 129
    .line 130
    if-eqz v0, :cond_a

    .line 131
    .line 132
    const/16 v1, 0xb

    .line 133
    .line 134
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 135
    .line 136
    .line 137
    :cond_a
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->isFixed_:Z

    .line 138
    .line 139
    if-eqz p0, :cond_b

    .line 140
    .line 141
    const/16 v0, 0xc

    .line 142
    .line 143
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 144
    .line 145
    .line 146
    :cond_b
    return-void
.end method
