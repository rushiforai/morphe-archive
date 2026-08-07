.class public final synthetic Ll/bdk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bdk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iput-object p2, p0, Ll/bdk0;->b:Ll/xc00;

    iput-object p3, p0, Ll/bdk0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/bdk0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bdk0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    iget-object v1, p0, Ll/bdk0;->b:Ll/xc00;

    iget-object v2, p0, Ll/bdk0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/bdk0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->S(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;Ll/xc00;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
