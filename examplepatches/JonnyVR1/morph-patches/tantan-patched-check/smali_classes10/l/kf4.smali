.class public final synthetic Ll/kf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qf4;


# direct methods
.method public synthetic constructor <init>(Ll/qf4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kf4;->a:Ll/qf4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf4;->a:Ll/qf4;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;

    invoke-static {p0, p1}, Ll/qf4;->M3(Ll/qf4;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
