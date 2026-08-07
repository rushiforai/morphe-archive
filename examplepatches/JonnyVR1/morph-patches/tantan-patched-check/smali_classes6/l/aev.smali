.class public final synthetic Ll/aev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aev;->a:Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aev;->a:Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->a2(Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
