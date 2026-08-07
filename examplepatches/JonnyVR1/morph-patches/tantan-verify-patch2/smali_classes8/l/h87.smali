.class public final synthetic Ll/h87;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ljava/lang/String;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h87;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/h87;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/h87;->c:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h87;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/h87;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/h87;->c:Ll/aqq;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->B1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ljava/lang/String;Ll/aqq;Ljava/util/List;)V

    return-void
.end method
