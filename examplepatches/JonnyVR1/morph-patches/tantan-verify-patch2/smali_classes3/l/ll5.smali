.class public final synthetic Ll/ll5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ll5;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    iput-object p2, p0, Ll/ll5;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ll5;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    iget-object p0, p0, Ll/ll5;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->K(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;Lorg/json/JSONObject;)V

    return-void
.end method
