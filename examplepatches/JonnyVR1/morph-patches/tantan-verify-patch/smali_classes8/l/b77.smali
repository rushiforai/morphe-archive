.class public final synthetic Ll/b77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/b77;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/b77;->c:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/b77;->b:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/b77;->c:Ll/xc00;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->y1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method
