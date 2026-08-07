.class public final synthetic Ll/hbk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iput-object p2, p0, Ll/hbk0;->b:Ll/xc00;

    iput-object p3, p0, Ll/hbk0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/hbk0;->d:Z

    iput-object p5, p0, Ll/hbk0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hbk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iget-object v1, p0, Ll/hbk0;->b:Ll/xc00;

    iget-object v2, p0, Ll/hbk0;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/hbk0;->d:Z

    iget-object p0, p0, Ll/hbk0;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->G(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
