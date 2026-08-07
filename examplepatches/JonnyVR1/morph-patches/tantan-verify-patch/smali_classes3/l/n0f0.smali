.class public final synthetic Ll/n0f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n0f0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;

    iput-object p2, p0, Ll/n0f0;->b:Ll/aqq;

    iput-object p3, p0, Ll/n0f0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n0f0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;

    iget-object v1, p0, Ll/n0f0;->b:Ll/aqq;

    iget-object p0, p0, Ll/n0f0;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;->f(Lcom/p1/mobile/putong/ui/jsbridge/implement/ShareBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
