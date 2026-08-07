.class public final synthetic Ll/nf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nf4;->a:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nf4;->a:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Ll/qf4;->L3(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;Lcom/p1/mobile/putong/data/AuthData;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;

    move-result-object p0

    return-object p0
.end method
