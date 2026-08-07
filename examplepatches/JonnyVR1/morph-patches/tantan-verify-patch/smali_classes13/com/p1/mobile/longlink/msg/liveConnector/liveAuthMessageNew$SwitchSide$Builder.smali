.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSideOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSideOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->d()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearToSide()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getToSide()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->getToSide()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToSideValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->getToSideValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setToSide(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$AppStaySideEnum;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToSideValue(I)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;->c(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$SwitchSide;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
