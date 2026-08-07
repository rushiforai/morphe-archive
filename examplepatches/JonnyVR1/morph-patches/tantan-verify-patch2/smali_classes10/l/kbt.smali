.class public Ll/kbt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->parseFrom([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msgs;->getMsgs(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Msg;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    return-object p0

    .line 11
    :catch_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
