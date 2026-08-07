.class public final synthetic Ll/k0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0s;->a:Ll/aqq;

    iput-object p2, p0, Ll/k0s;->b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k0s;->a:Ll/aqq;

    iget-object p0, p0, Ll/k0s;->b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->o(Ll/aqq;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    return-void
.end method
