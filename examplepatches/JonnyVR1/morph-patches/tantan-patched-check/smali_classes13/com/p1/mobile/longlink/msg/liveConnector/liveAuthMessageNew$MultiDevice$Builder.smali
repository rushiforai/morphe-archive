.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDeviceOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDeviceOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;->c()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/w4r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMsg()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;->a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMsg()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;->getMsg()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setMsg(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;->b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
