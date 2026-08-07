.class public final Lcom/immomo/push/pb/PbPacketBody;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/push/pb/PbPacketBody$b;,
        Lcom/immomo/push/pb/PbPacketBody$DataCase;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/immomo/push/pb/PbPacketBody;",
        "Lcom/immomo/push/pb/PbPacketBody$b;",
        ">;",
        "Ll/lfz;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

.field public static final DISCONN_FIELD_NUMBER:I = 0x9

.field public static final MSGACK_FIELD_NUMBER:I = 0x7

.field public static final MSGFIN_FIELD_NUMBER:I = 0x8

.field public static final MSGPSH_FIELD_NUMBER:I = 0x5

.field public static final MSGSYN_FIELD_NUMBER:I = 0x6

.field public static final MSGV2_FIELD_NUMBER:I = 0xc

.field public static final MSG_FIELD_NUMBER:I = 0xa

.field public static final NOTIFYV2_FIELD_NUMBER:I = 0xd

.field public static final NOTIFY_FIELD_NUMBER:I = 0xb

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/immomo/push/pb/PbPacketBody;",
            ">;"
        }
    .end annotation
.end field

.field public static final RET_FIELD_NUMBER:I = 0x2

.field public static final SAUTHRET_FIELD_NUMBER:I = 0x4

.field public static final SAUTH_FIELD_NUMBER:I = 0x3

.field public static final TYPE_FIELD_NUMBER:I = 0x1


# instance fields
.field private dataCase_:I

.field private data_:Ljava/lang/Object;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/push/pb/PbPacketBody;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

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
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic access$000()Lcom/immomo/push/pb/PbPacketBody;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearData()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuth$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setSauth(Lcom/immomo/push/pb/SAuth$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuth;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeSauth(Lcom/immomo/push/pb/SAuth;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearSauth()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuthRet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setSauthRet(Lcom/immomo/push/pb/SAuthRet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuthRet$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setSauthRet(Lcom/immomo/push/pb/SAuthRet$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuthRet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeSauthRet(Lcom/immomo/push/pb/SAuthRet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearSauthRet()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgPsh;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgPsh(Lcom/immomo/push/pb/MsgPsh;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgPsh$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgPsh(Lcom/immomo/push/pb/MsgPsh$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgPsh;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsgPsh(Lcom/immomo/push/pb/MsgPsh;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/immomo/push/pb/PbPacketBody;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setTypeValue(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2000(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsgPsh()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2100(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgSyn;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgSyn(Lcom/immomo/push/pb/MsgSyn;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2200(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgSyn$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgSyn(Lcom/immomo/push/pb/MsgSyn$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgSyn;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsgSyn(Lcom/immomo/push/pb/MsgSyn;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2400(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsgSyn()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2500(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgAck;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgAck(Lcom/immomo/push/pb/MsgAck;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2600(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgAck$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgAck(Lcom/immomo/push/pb/MsgAck$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgAck;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsgAck(Lcom/immomo/push/pb/MsgAck;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2800(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsgAck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2900(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgFin;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgFin(Lcom/immomo/push/pb/MsgFin;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/BodyType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setType(Lcom/immomo/push/pb/BodyType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3000(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgFin$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgFin(Lcom/immomo/push/pb/MsgFin$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3100(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgFin;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsgFin(Lcom/immomo/push/pb/MsgFin;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3200(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsgFin()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3300(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Disconnect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setDisconn(Lcom/immomo/push/pb/Disconnect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3400(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Disconnect$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setDisconn(Lcom/immomo/push/pb/Disconnect$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3500(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Disconnect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeDisconn(Lcom/immomo/push/pb/Disconnect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3600(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearDisconn()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3700(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsg(Lcom/immomo/push/pb/Msg;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3800(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Msg$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsg(Lcom/immomo/push/pb/Msg$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3900(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsg(Lcom/immomo/push/pb/Msg;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4000(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4100(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setNotify(Lcom/immomo/push/pb/Notify;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4200(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Notify$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setNotify(Lcom/immomo/push/pb/Notify$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4300(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeNotify(Lcom/immomo/push/pb/Notify;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4400(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearNotify()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4500(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgV2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgV2(Lcom/immomo/push/pb/MsgV2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4600(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgV2$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setMsgV2(Lcom/immomo/push/pb/MsgV2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4700(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/MsgV2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeMsgV2(Lcom/immomo/push/pb/MsgV2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4800(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearMsgV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4900(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/NotifyV2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setNotifyV2(Lcom/immomo/push/pb/NotifyV2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Ret;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setRet(Lcom/immomo/push/pb/Ret;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5000(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/NotifyV2$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setNotifyV2(Lcom/immomo/push/pb/NotifyV2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5100(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/NotifyV2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeNotifyV2(Lcom/immomo/push/pb/NotifyV2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5200(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearNotifyV2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Ret$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setRet(Lcom/immomo/push/pb/Ret$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/Ret;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->mergeRet(Lcom/immomo/push/pb/Ret;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/immomo/push/pb/PbPacketBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/PbPacketBody;->clearRet()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/immomo/push/pb/PbPacketBody;Lcom/immomo/push/pb/SAuth;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/PbPacketBody;->setSauth(Lcom/immomo/push/pb/SAuth;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearData()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    return-void
.end method

.method private clearDisconn()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearMsg()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearMsgAck()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearMsgFin()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearMsgPsh()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearMsgSyn()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearMsgV2()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearNotify()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearNotifyV2()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private clearRet()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearSauth()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearSauthRet()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static getDefaultInstance()Lcom/immomo/push/pb/PbPacketBody;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    return-object v0
.end method

.method private mergeDisconn(Lcom/immomo/push/pb/Disconnect;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/Disconnect;->getDefaultInstance()Lcom/immomo/push/pb/Disconnect;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/Disconnect;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/Disconnect;->newBuilder(Lcom/immomo/push/pb/Disconnect;)Lcom/immomo/push/pb/Disconnect$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/Disconnect$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeMsg(Lcom/immomo/push/pb/Msg;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/Msg;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/Msg;->newBuilder(Lcom/immomo/push/pb/Msg;)Lcom/immomo/push/pb/Msg$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/Msg$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeMsgAck(Lcom/immomo/push/pb/MsgAck;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/MsgAck;->getDefaultInstance()Lcom/immomo/push/pb/MsgAck;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/MsgAck;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/MsgAck;->newBuilder(Lcom/immomo/push/pb/MsgAck;)Lcom/immomo/push/pb/MsgAck$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/MsgAck$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeMsgFin(Lcom/immomo/push/pb/MsgFin;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/MsgFin;->getDefaultInstance()Lcom/immomo/push/pb/MsgFin;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/MsgFin;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/MsgFin;->newBuilder(Lcom/immomo/push/pb/MsgFin;)Lcom/immomo/push/pb/MsgFin$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/MsgFin$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeMsgPsh(Lcom/immomo/push/pb/MsgPsh;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/MsgPsh;->getDefaultInstance()Lcom/immomo/push/pb/MsgPsh;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/MsgPsh;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/MsgPsh;->newBuilder(Lcom/immomo/push/pb/MsgPsh;)Lcom/immomo/push/pb/MsgPsh$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/MsgPsh$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeMsgSyn(Lcom/immomo/push/pb/MsgSyn;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/MsgSyn;->getDefaultInstance()Lcom/immomo/push/pb/MsgSyn;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/MsgSyn;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/MsgSyn;->newBuilder(Lcom/immomo/push/pb/MsgSyn;)Lcom/immomo/push/pb/MsgSyn$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/MsgSyn$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeMsgV2(Lcom/immomo/push/pb/MsgV2;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/MsgV2;->getDefaultInstance()Lcom/immomo/push/pb/MsgV2;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/MsgV2;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/MsgV2;->newBuilder(Lcom/immomo/push/pb/MsgV2;)Lcom/immomo/push/pb/MsgV2$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/MsgV2$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeNotify(Lcom/immomo/push/pb/Notify;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/Notify;->getDefaultInstance()Lcom/immomo/push/pb/Notify;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/Notify;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/Notify;->newBuilder(Lcom/immomo/push/pb/Notify;)Lcom/immomo/push/pb/Notify$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/Notify$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeNotifyV2(Lcom/immomo/push/pb/NotifyV2;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/push/pb/NotifyV2;->getDefaultInstance()Lcom/immomo/push/pb/NotifyV2;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lcom/immomo/push/pb/NotifyV2;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/push/pb/NotifyV2;->newBuilder(Lcom/immomo/push/pb/NotifyV2;)Lcom/immomo/push/pb/NotifyV2$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/NotifyV2$b;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 37
    .line 38
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 39
    .line 40
    return-void
.end method

.method private mergeRet(Lcom/immomo/push/pb/Ret;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/Ret;->getDefaultInstance()Lcom/immomo/push/pb/Ret;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/Ret;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/Ret;->newBuilder(Lcom/immomo/push/pb/Ret;)Lcom/immomo/push/pb/Ret$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/Ret$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeSauth(Lcom/immomo/push/pb/SAuth;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/SAuth;->getDefaultInstance()Lcom/immomo/push/pb/SAuth;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/SAuth;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/SAuth;->newBuilder(Lcom/immomo/push/pb/SAuth;)Lcom/immomo/push/pb/SAuth$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/SAuth$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeSauthRet(Lcom/immomo/push/pb/SAuthRet;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/push/pb/SAuthRet;->getDefaultInstance()Lcom/immomo/push/pb/SAuthRet;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/immomo/push/pb/SAuthRet;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/push/pb/SAuthRet;->newBuilder(Lcom/immomo/push/pb/SAuthRet;)Lcom/immomo/push/pb/SAuthRet$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/immomo/push/pb/SAuthRet$b;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 38
    .line 39
    return-void
.end method

.method public static newBuilder()Lcom/immomo/push/pb/PbPacketBody$b;
    .locals 1

    .line 16
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/immomo/push/pb/PbPacketBody$b;

    return-object v0
.end method

.method public static newBuilder(Lcom/immomo/push/pb/PbPacketBody;)Lcom/immomo/push/pb/PbPacketBody$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/immomo/push/pb/PbPacketBody$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/immomo/push/pb/PbPacketBody$b;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/immomo/push/pb/PbPacketBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/PbPacketBody;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/immomo/push/pb/PbPacketBody;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

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

.method private setDisconn(Lcom/immomo/push/pb/Disconnect$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0x9

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setDisconn(Lcom/immomo/push/pb/Disconnect;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0x9

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsg(Lcom/immomo/push/pb/Msg$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0xa

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setMsg(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0xa

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsgAck(Lcom/immomo/push/pb/MsgAck$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x7

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setMsgAck(Lcom/immomo/push/pb/MsgAck;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x7

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsgFin(Lcom/immomo/push/pb/MsgFin$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setMsgFin(Lcom/immomo/push/pb/MsgFin;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0x8

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsgPsh(Lcom/immomo/push/pb/MsgPsh$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x5

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setMsgPsh(Lcom/immomo/push/pb/MsgPsh;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x5

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsgSyn(Lcom/immomo/push/pb/MsgSyn$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x6

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setMsgSyn(Lcom/immomo/push/pb/MsgSyn;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x6

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setMsgV2(Lcom/immomo/push/pb/MsgV2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0xc

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setMsgV2(Lcom/immomo/push/pb/MsgV2;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0xc

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setNotify(Lcom/immomo/push/pb/Notify$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0xb

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setNotify(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0xb

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setNotifyV2(Lcom/immomo/push/pb/NotifyV2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/16 p1, 0xd

    .line 8
    .line 9
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 10
    .line 11
    return-void
.end method

.method private setNotifyV2(Lcom/immomo/push/pb/NotifyV2;)V
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/16 p1, 0xd

    .line 14
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setRet(Lcom/immomo/push/pb/Ret$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setRet(Lcom/immomo/push/pb/Ret;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x2

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setSauth(Lcom/immomo/push/pb/SAuth$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x3

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSauth(Lcom/immomo/push/pb/SAuth;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x3

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setSauthRet(Lcom/immomo/push/pb/SAuthRet$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x4

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSauthRet(Lcom/immomo/push/pb/SAuthRet;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    const/4 p1, 0x4

    .line 13
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    return-void
.end method

.method private setType(Lcom/immomo/push/pb/BodyType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 19

    move-object/from16 v1, p0

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody$a;->b:[I

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v0, v0, v2

    const/4 v3, 0x3

    const/4 v4, 0x4

    const/4 v5, 0x5

    const/4 v6, 0x6

    const/4 v7, 0x7

    const/16 v8, 0x8

    const/16 v9, 0x9

    const/16 v10, 0xa

    const/16 v11, 0xb

    const/16 v12, 0xc

    const/16 v13, 0xd

    const/4 v14, 0x0

    const/16 v16, 0x1

    packed-switch v0, :pswitch_data_0

    .line 2
    invoke-static {}, Ll/l710;->a()V

    return-object v14

    .line 3
    :pswitch_0
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->PARSER:Ll/ng60;

    if-nez v0, :cond_1

    const-class v1, Lcom/immomo/push/pb/PbPacketBody;

    monitor-enter v1

    .line 4
    :try_start_0
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->PARSER:Ll/ng60;

    if-nez v0, :cond_0

    .line 5
    new-instance v0, Lcom/google/protobuf/GeneratedMessageLite$c;

    sget-object v2, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    invoke-direct {v0, v2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object v0, Lcom/immomo/push/pb/PbPacketBody;->PARSER:Ll/ng60;

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 6
    :cond_0
    :goto_0
    monitor-exit v1

    goto :goto_2

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 7
    :cond_1
    :goto_2
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->PARSER:Ll/ng60;

    return-object v0

    .line 8
    :pswitch_1
    move-object/from16 v0, p2

    check-cast v0, Lcom/google/protobuf/e;

    .line 9
    move-object/from16 v15, p3

    check-cast v15, Lcom/google/protobuf/h;

    const/16 v17, 0x0

    :goto_3
    if-nez v17, :cond_1b

    move-object/from16 v18, v14

    .line 10
    :try_start_1
    invoke-virtual {v0}, Lcom/google/protobuf/e;->M()I

    move-result v14

    sparse-switch v14, :sswitch_data_0

    .line 11
    invoke-virtual {v0, v14}, Lcom/google/protobuf/e;->R(I)Z

    move-result v14

    if-nez v14, :cond_1a

    :sswitch_0
    move/from16 v17, v16

    goto/16 :goto_10

    :catch_0
    move-exception v0

    goto/16 :goto_11

    :catch_1
    move-exception v0

    goto/16 :goto_12

    .line 12
    :sswitch_1
    iget v14, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v14, v13, :cond_2

    .line 13
    iget-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v14, Lcom/immomo/push/pb/NotifyV2;

    invoke-virtual {v14}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v14

    check-cast v14, Lcom/immomo/push/pb/NotifyV2$b;

    goto :goto_4

    :cond_2
    move-object/from16 v14, v18

    .line 14
    :goto_4
    invoke-static {}, Lcom/immomo/push/pb/NotifyV2;->parser()Ll/ng60;

    move-result-object v2

    invoke-virtual {v0, v2, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v14, :cond_3

    .line 15
    check-cast v2, Lcom/immomo/push/pb/NotifyV2;

    invoke-virtual {v14, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 16
    invoke-virtual {v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 17
    :cond_3
    iput v13, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 18
    :sswitch_2
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v12, :cond_4

    .line 19
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/MsgV2;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/MsgV2$b;

    goto :goto_5

    :cond_4
    move-object/from16 v2, v18

    .line 20
    :goto_5
    invoke-static {}, Lcom/immomo/push/pb/MsgV2;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_5

    .line 21
    check-cast v14, Lcom/immomo/push/pb/MsgV2;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 22
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 23
    :cond_5
    iput v12, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 24
    :sswitch_3
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v11, :cond_6

    .line 25
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/Notify;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/Notify$b;

    goto :goto_6

    :cond_6
    move-object/from16 v2, v18

    .line 26
    :goto_6
    invoke-static {}, Lcom/immomo/push/pb/Notify;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_7

    .line 27
    check-cast v14, Lcom/immomo/push/pb/Notify;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 28
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 29
    :cond_7
    iput v11, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 30
    :sswitch_4
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v10, :cond_8

    .line 31
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/Msg;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/Msg$b;

    goto :goto_7

    :cond_8
    move-object/from16 v2, v18

    .line 32
    :goto_7
    invoke-static {}, Lcom/immomo/push/pb/Msg;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_9

    .line 33
    check-cast v14, Lcom/immomo/push/pb/Msg;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 34
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 35
    :cond_9
    iput v10, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 36
    :sswitch_5
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v9, :cond_a

    .line 37
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/Disconnect;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/Disconnect$b;

    goto :goto_8

    :cond_a
    move-object/from16 v2, v18

    .line 38
    :goto_8
    invoke-static {}, Lcom/immomo/push/pb/Disconnect;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_b

    .line 39
    check-cast v14, Lcom/immomo/push/pb/Disconnect;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 40
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 41
    :cond_b
    iput v9, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 42
    :sswitch_6
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v8, :cond_c

    .line 43
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/MsgFin;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/MsgFin$b;

    goto :goto_9

    :cond_c
    move-object/from16 v2, v18

    .line 44
    :goto_9
    invoke-static {}, Lcom/immomo/push/pb/MsgFin;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_d

    .line 45
    check-cast v14, Lcom/immomo/push/pb/MsgFin;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 46
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 47
    :cond_d
    iput v8, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 48
    :sswitch_7
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v7, :cond_e

    .line 49
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/MsgAck;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/MsgAck$b;

    goto :goto_a

    :cond_e
    move-object/from16 v2, v18

    .line 50
    :goto_a
    invoke-static {}, Lcom/immomo/push/pb/MsgAck;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_f

    .line 51
    check-cast v14, Lcom/immomo/push/pb/MsgAck;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 52
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 53
    :cond_f
    iput v7, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 54
    :sswitch_8
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v6, :cond_10

    .line 55
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/MsgSyn;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/MsgSyn$b;

    goto :goto_b

    :cond_10
    move-object/from16 v2, v18

    .line 56
    :goto_b
    invoke-static {}, Lcom/immomo/push/pb/MsgSyn;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_11

    .line 57
    check-cast v14, Lcom/immomo/push/pb/MsgSyn;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 58
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 59
    :cond_11
    iput v6, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 60
    :sswitch_9
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v5, :cond_12

    .line 61
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/MsgPsh;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/MsgPsh$b;

    goto :goto_c

    :cond_12
    move-object/from16 v2, v18

    .line 62
    :goto_c
    invoke-static {}, Lcom/immomo/push/pb/MsgPsh;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_13

    .line 63
    check-cast v14, Lcom/immomo/push/pb/MsgPsh;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 64
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 65
    :cond_13
    iput v5, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto/16 :goto_10

    .line 66
    :sswitch_a
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v4, :cond_14

    .line 67
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/SAuthRet;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/SAuthRet$b;

    goto :goto_d

    :cond_14
    move-object/from16 v2, v18

    .line 68
    :goto_d
    invoke-static {}, Lcom/immomo/push/pb/SAuthRet;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_15

    .line 69
    check-cast v14, Lcom/immomo/push/pb/SAuthRet;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 70
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 71
    :cond_15
    iput v4, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto :goto_10

    .line 72
    :sswitch_b
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v2, v3, :cond_16

    .line 73
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/SAuth;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/SAuth$b;

    goto :goto_e

    :cond_16
    move-object/from16 v2, v18

    .line 74
    :goto_e
    invoke-static {}, Lcom/immomo/push/pb/SAuth;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_17

    .line 75
    check-cast v14, Lcom/immomo/push/pb/SAuth;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 76
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 77
    :cond_17
    iput v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto :goto_10

    .line 78
    :sswitch_c
    iget v2, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    const/4 v14, 0x2

    if-ne v2, v14, :cond_18

    .line 79
    iget-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    check-cast v2, Lcom/immomo/push/pb/Ret;

    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v2

    check-cast v2, Lcom/immomo/push/pb/Ret$b;

    goto :goto_f

    :cond_18
    move-object/from16 v2, v18

    .line 80
    :goto_f
    invoke-static {}, Lcom/immomo/push/pb/Ret;->parser()Ll/ng60;

    move-result-object v14

    invoke-virtual {v0, v14, v15}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v14

    iput-object v14, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    if-eqz v2, :cond_19

    .line 81
    check-cast v14, Lcom/immomo/push/pb/Ret;

    invoke-virtual {v2, v14}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 82
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v2

    iput-object v2, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    :cond_19
    const/4 v14, 0x2

    .line 83
    iput v14, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    goto :goto_10

    .line 84
    :sswitch_d
    invoke-virtual {v0}, Lcom/google/protobuf/e;->p()I

    move-result v2

    .line 85
    iput v2, v1, Lcom/immomo/push/pb/PbPacketBody;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1a
    :goto_10
    move-object/from16 v14, v18

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    .line 86
    throw v0

    .line 87
    :goto_11
    new-instance v2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 88
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v18

    .line 89
    :goto_12
    invoke-virtual {v0, v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v18

    .line 90
    :cond_1b
    :pswitch_2
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    return-object v0

    .line 91
    :pswitch_3
    move-object/from16 v0, p2

    check-cast v0, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 92
    move-object/from16 v2, p3

    check-cast v2, Lcom/immomo/push/pb/PbPacketBody;

    .line 93
    iget v14, v1, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    if-eqz v14, :cond_1c

    move/from16 v15, v16

    goto :goto_13

    :cond_1c
    const/4 v15, 0x0

    :goto_13
    iget v3, v2, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    if-eqz v3, :cond_1d

    move/from16 v4, v16

    goto :goto_14

    :cond_1d
    const/4 v4, 0x0

    :goto_14
    invoke-interface {v0, v15, v14, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result v3

    iput v3, v1, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 94
    sget-object v3, Lcom/immomo/push/pb/PbPacketBody$a;->a:[I

    invoke-virtual {v2}, Lcom/immomo/push/pb/PbPacketBody;->getDataCase()Lcom/immomo/push/pb/PbPacketBody$DataCase;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_1

    goto/16 :goto_22

    .line 95
    :pswitch_4
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-eqz v3, :cond_1e

    move/from16 v15, v16

    goto :goto_15

    :cond_1e
    const/4 v15, 0x0

    :goto_15
    invoke-interface {v0, v15}, Lcom/google/protobuf/GeneratedMessageLite$h;->c(Z)V

    goto/16 :goto_22

    .line 96
    :pswitch_5
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v13, :cond_1f

    move/from16 v15, v16

    goto :goto_16

    :cond_1f
    const/4 v15, 0x0

    :goto_16
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 97
    :pswitch_6
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v12, :cond_20

    move/from16 v15, v16

    goto :goto_17

    :cond_20
    const/4 v15, 0x0

    :goto_17
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 98
    :pswitch_7
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v11, :cond_21

    move/from16 v15, v16

    goto :goto_18

    :cond_21
    const/4 v15, 0x0

    :goto_18
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 99
    :pswitch_8
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v10, :cond_22

    move/from16 v15, v16

    goto :goto_19

    :cond_22
    const/4 v15, 0x0

    :goto_19
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 100
    :pswitch_9
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v9, :cond_23

    move/from16 v15, v16

    goto :goto_1a

    :cond_23
    const/4 v15, 0x0

    :goto_1a
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 101
    :pswitch_a
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v8, :cond_24

    move/from16 v15, v16

    goto :goto_1b

    :cond_24
    const/4 v15, 0x0

    :goto_1b
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 102
    :pswitch_b
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v7, :cond_25

    move/from16 v15, v16

    goto :goto_1c

    :cond_25
    const/4 v15, 0x0

    :goto_1c
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto/16 :goto_22

    .line 103
    :pswitch_c
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v6, :cond_26

    move/from16 v15, v16

    goto :goto_1d

    :cond_26
    const/4 v15, 0x0

    :goto_1d
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto :goto_22

    .line 104
    :pswitch_d
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-ne v3, v5, :cond_27

    move/from16 v15, v16

    goto :goto_1e

    :cond_27
    const/4 v15, 0x0

    :goto_1e
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto :goto_22

    .line 105
    :pswitch_e
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_28

    move/from16 v15, v16

    goto :goto_1f

    :cond_28
    const/4 v15, 0x0

    :goto_1f
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto :goto_22

    .line 106
    :pswitch_f
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_29

    move/from16 v15, v16

    goto :goto_20

    :cond_29
    const/4 v15, 0x0

    :goto_20
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    goto :goto_22

    .line 107
    :pswitch_10
    iget v3, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    const/4 v14, 0x2

    if-ne v3, v14, :cond_2a

    move/from16 v15, v16

    goto :goto_21

    :cond_2a
    const/4 v15, 0x0

    :goto_21
    iget-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    iget-object v4, v2, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    invoke-interface {v0, v15, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v1, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 108
    :goto_22
    sget-object v3, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    if-ne v0, v3, :cond_2b

    .line 109
    iget v0, v2, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    if-eqz v0, :cond_2b

    .line 110
    iput v0, v1, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    :cond_2b
    return-object v1

    :pswitch_11
    move-object/from16 v18, v14

    .line 111
    new-instance v0, Lcom/immomo/push/pb/PbPacketBody$b;

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/immomo/push/pb/PbPacketBody$b;-><init>(Lcom/immomo/push/pb/PbPacketBody$a;)V

    return-object v0

    :pswitch_12
    move-object v1, v14

    return-object v1

    .line 112
    :pswitch_13
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/PbPacketBody;

    return-object v0

    .line 113
    :pswitch_14
    new-instance v0, Lcom/immomo/push/pb/PbPacketBody;

    invoke-direct {v0}, Lcom/immomo/push/pb/PbPacketBody;-><init>()V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_d
        0x12 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x32 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x52 -> :sswitch_4
        0x5a -> :sswitch_3
        0x62 -> :sswitch_2
        0x6a -> :sswitch_1
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public getDataCase()Lcom/immomo/push/pb/PbPacketBody$DataCase;
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/push/pb/PbPacketBody$DataCase;->forNumber(I)Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDisconn()Lcom/immomo/push/pb/Disconnect;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/Disconnect;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/Disconnect;->getDefaultInstance()Lcom/immomo/push/pb/Disconnect;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getMsg()Lcom/immomo/push/pb/Msg;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/Msg;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getMsgAck()Lcom/immomo/push/pb/MsgAck;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/MsgAck;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/MsgAck;->getDefaultInstance()Lcom/immomo/push/pb/MsgAck;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getMsgFin()Lcom/immomo/push/pb/MsgFin;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/MsgFin;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/MsgFin;->getDefaultInstance()Lcom/immomo/push/pb/MsgFin;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getMsgPsh()Lcom/immomo/push/pb/MsgPsh;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/MsgPsh;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/MsgPsh;->getDefaultInstance()Lcom/immomo/push/pb/MsgPsh;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getMsgSyn()Lcom/immomo/push/pb/MsgSyn;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/MsgSyn;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/MsgSyn;->getDefaultInstance()Lcom/immomo/push/pb/MsgSyn;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getMsgV2()Lcom/immomo/push/pb/MsgV2;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/MsgV2;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/MsgV2;->getDefaultInstance()Lcom/immomo/push/pb/MsgV2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getNotify()Lcom/immomo/push/pb/Notify;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/Notify;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/Notify;->getDefaultInstance()Lcom/immomo/push/pb/Notify;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getNotifyV2()Lcom/immomo/push/pb/NotifyV2;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Lcom/immomo/push/pb/NotifyV2;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/NotifyV2;->getDefaultInstance()Lcom/immomo/push/pb/NotifyV2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getRet()Lcom/immomo/push/pb/Ret;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/Ret;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/Ret;->getDefaultInstance()Lcom/immomo/push/pb/Ret;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getSauth()Lcom/immomo/push/pb/SAuth;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/SAuth;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/SAuth;->getDefaultInstance()Lcom/immomo/push/pb/SAuth;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getSauthRet()Lcom/immomo/push/pb/SAuthRet;
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/immomo/push/pb/SAuthRet;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/immomo/push/pb/SAuthRet;->getDefaultInstance()Lcom/immomo/push/pb/SAuthRet;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
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
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/immomo/push/pb/BodyType;->RET:Lcom/immomo/push/pb/BodyType;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

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
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    if-ne v1, v2, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Lcom/immomo/push/pb/Ret;

    .line 34
    .line 35
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 41
    .line 42
    const/4 v2, 0x3

    .line 43
    if-ne v1, v2, :cond_3

    .line 44
    .line 45
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v1, Lcom/immomo/push/pb/SAuth;

    .line 48
    .line 49
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 55
    .line 56
    const/4 v2, 0x4

    .line 57
    if-ne v1, v2, :cond_4

    .line 58
    .line 59
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v1, Lcom/immomo/push/pb/SAuthRet;

    .line 62
    .line 63
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v0, v1

    .line 68
    :cond_4
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 69
    .line 70
    const/4 v2, 0x5

    .line 71
    if-ne v1, v2, :cond_5

    .line 72
    .line 73
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v1, Lcom/immomo/push/pb/MsgPsh;

    .line 76
    .line 77
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    add-int/2addr v0, v1

    .line 82
    :cond_5
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 83
    .line 84
    const/4 v2, 0x6

    .line 85
    if-ne v1, v2, :cond_6

    .line 86
    .line 87
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v1, Lcom/immomo/push/pb/MsgSyn;

    .line 90
    .line 91
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    add-int/2addr v0, v1

    .line 96
    :cond_6
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 97
    .line 98
    const/4 v2, 0x7

    .line 99
    if-ne v1, v2, :cond_7

    .line 100
    .line 101
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v1, Lcom/immomo/push/pb/MsgAck;

    .line 104
    .line 105
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    add-int/2addr v0, v1

    .line 110
    :cond_7
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 111
    .line 112
    const/16 v2, 0x8

    .line 113
    .line 114
    if-ne v1, v2, :cond_8

    .line 115
    .line 116
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v1, Lcom/immomo/push/pb/MsgFin;

    .line 119
    .line 120
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    add-int/2addr v0, v1

    .line 125
    :cond_8
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 126
    .line 127
    const/16 v2, 0x9

    .line 128
    .line 129
    if-ne v1, v2, :cond_9

    .line 130
    .line 131
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast v1, Lcom/immomo/push/pb/Disconnect;

    .line 134
    .line 135
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    add-int/2addr v0, v1

    .line 140
    :cond_9
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 141
    .line 142
    const/16 v2, 0xa

    .line 143
    .line 144
    if-ne v1, v2, :cond_a

    .line 145
    .line 146
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v1, Lcom/immomo/push/pb/Msg;

    .line 149
    .line 150
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    add-int/2addr v0, v1

    .line 155
    :cond_a
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 156
    .line 157
    const/16 v2, 0xb

    .line 158
    .line 159
    if-ne v1, v2, :cond_b

    .line 160
    .line 161
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast v1, Lcom/immomo/push/pb/Notify;

    .line 164
    .line 165
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    add-int/2addr v0, v1

    .line 170
    :cond_b
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 171
    .line 172
    const/16 v2, 0xc

    .line 173
    .line 174
    if-ne v1, v2, :cond_c

    .line 175
    .line 176
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v1, Lcom/immomo/push/pb/MsgV2;

    .line 179
    .line 180
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    add-int/2addr v0, v1

    .line 185
    :cond_c
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 186
    .line 187
    const/16 v2, 0xd

    .line 188
    .line 189
    if-ne v1, v2, :cond_d

    .line 190
    .line 191
    iget-object v1, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast v1, Lcom/immomo/push/pb/NotifyV2;

    .line 194
    .line 195
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    add-int/2addr v0, v1

    .line 200
    :cond_d
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 201
    .line 202
    return v0
.end method

.method public getType()Lcom/immomo/push/pb/BodyType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/push/pb/BodyType;->forNumber(I)Lcom/immomo/push/pb/BodyType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/immomo/push/pb/BodyType;->UNRECOGNIZED:Lcom/immomo/push/pb/BodyType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 2
    .line 3
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
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/push/pb/BodyType;->RET:Lcom/immomo/push/pb/BodyType;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget v1, p0, Lcom/immomo/push/pb/PbPacketBody;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lcom/immomo/push/pb/Ret;

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 30
    .line 31
    const/4 v1, 0x3

    .line 32
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Lcom/immomo/push/pb/SAuth;

    .line 37
    .line 38
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 42
    .line 43
    const/4 v1, 0x4

    .line 44
    if-ne v0, v1, :cond_3

    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v0, Lcom/immomo/push/pb/SAuthRet;

    .line 49
    .line 50
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 54
    .line 55
    const/4 v1, 0x5

    .line 56
    if-ne v0, v1, :cond_4

    .line 57
    .line 58
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Lcom/immomo/push/pb/MsgPsh;

    .line 61
    .line 62
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 66
    .line 67
    const/4 v1, 0x6

    .line 68
    if-ne v0, v1, :cond_5

    .line 69
    .line 70
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v0, Lcom/immomo/push/pb/MsgSyn;

    .line 73
    .line 74
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 78
    .line 79
    const/4 v1, 0x7

    .line 80
    if-ne v0, v1, :cond_6

    .line 81
    .line 82
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v0, Lcom/immomo/push/pb/MsgAck;

    .line 85
    .line 86
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 87
    .line 88
    .line 89
    :cond_6
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 90
    .line 91
    const/16 v1, 0x8

    .line 92
    .line 93
    if-ne v0, v1, :cond_7

    .line 94
    .line 95
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v0, Lcom/immomo/push/pb/MsgFin;

    .line 98
    .line 99
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 100
    .line 101
    .line 102
    :cond_7
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 103
    .line 104
    const/16 v1, 0x9

    .line 105
    .line 106
    if-ne v0, v1, :cond_8

    .line 107
    .line 108
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v0, Lcom/immomo/push/pb/Disconnect;

    .line 111
    .line 112
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 113
    .line 114
    .line 115
    :cond_8
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 116
    .line 117
    const/16 v1, 0xa

    .line 118
    .line 119
    if-ne v0, v1, :cond_9

    .line 120
    .line 121
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast v0, Lcom/immomo/push/pb/Msg;

    .line 124
    .line 125
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 126
    .line 127
    .line 128
    :cond_9
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 129
    .line 130
    const/16 v1, 0xb

    .line 131
    .line 132
    if-ne v0, v1, :cond_a

    .line 133
    .line 134
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v0, Lcom/immomo/push/pb/Notify;

    .line 137
    .line 138
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 139
    .line 140
    .line 141
    :cond_a
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 142
    .line 143
    const/16 v1, 0xc

    .line 144
    .line 145
    if-ne v0, v1, :cond_b

    .line 146
    .line 147
    iget-object v0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 148
    .line 149
    check-cast v0, Lcom/immomo/push/pb/MsgV2;

    .line 150
    .line 151
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 152
    .line 153
    .line 154
    :cond_b
    iget v0, p0, Lcom/immomo/push/pb/PbPacketBody;->dataCase_:I

    .line 155
    .line 156
    const/16 v1, 0xd

    .line 157
    .line 158
    if-ne v0, v1, :cond_c

    .line 159
    .line 160
    iget-object p0, p0, Lcom/immomo/push/pb/PbPacketBody;->data_:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast p0, Lcom/immomo/push/pb/NotifyV2;

    .line 163
    .line 164
    invoke-virtual {p1, v1, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 165
    .line 166
    .line 167
    :cond_c
    return-void
.end method
