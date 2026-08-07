.class public final synthetic Ll/i37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i37;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/i37;->b:Ll/aqq;

    iput-object p3, p0, Ll/i37;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i37;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/i37;->b:Ll/aqq;

    iget-object p0, p0, Ll/i37;->c:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->l0(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
