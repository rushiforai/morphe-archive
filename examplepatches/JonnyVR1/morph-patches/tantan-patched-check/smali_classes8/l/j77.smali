.class public final synthetic Ll/j77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

.field public final synthetic b:Ll/aqq;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:[Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iput-object p2, p0, Ll/j77;->b:Ll/aqq;

    iput-object p3, p0, Ll/j77;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/j77;->d:[Ljava/lang/String;

    iput-object p5, p0, Ll/j77;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j77;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    iget-object v1, p0, Ll/j77;->b:Ll/aqq;

    iget-object v2, p0, Ll/j77;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/j77;->d:[Ljava/lang/String;

    iget-object p0, p0, Ll/j77;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->u(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/aqq;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
