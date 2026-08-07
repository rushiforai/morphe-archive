.class public final synthetic Ll/f260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f260;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    iput-object p2, p0, Ll/f260;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/f260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f260;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    iget-object v1, p0, Ll/f260;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/f260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->k0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
