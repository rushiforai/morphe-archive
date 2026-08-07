.class public final synthetic Ll/w6i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w6i0;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w6i0;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ks(Lcom/p1/mobile/putong/core/data/Privilege;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
