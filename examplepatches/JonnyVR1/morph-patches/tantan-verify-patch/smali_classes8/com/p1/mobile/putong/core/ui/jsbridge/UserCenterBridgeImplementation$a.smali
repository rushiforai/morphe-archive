.class public Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->z0(Ll/xc00;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Ll/uxj0;",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation$a;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation$a;->a(Ll/uxj0;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
