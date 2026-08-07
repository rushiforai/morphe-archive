.class public final synthetic Ll/m67;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m67;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/m67;->b:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m67;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object p0, p0, Ll/m67;->b:Ll/aqq;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->g(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;)V

    return-void
.end method
