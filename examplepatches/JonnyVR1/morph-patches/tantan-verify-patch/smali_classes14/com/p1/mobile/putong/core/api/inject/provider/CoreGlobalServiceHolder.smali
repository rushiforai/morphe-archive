.class public Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;
.super Ll/b17;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/b17<",
        "Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;",
        ">;"
    }
.end annotation


# instance fields
.field public coreBuzzProviderInterface:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBuzzProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_buzz/service"
        required = true
    .end annotation
.end field

.field public coreCardProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreCardProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_card/service"
        required = true
    .end annotation
.end field

.field public coreGlobalProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_global/service"
        required = true
    .end annotation
.end field

.field public coreInnovationProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnovationProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_innovation/service"
        required = true
    .end annotation
.end field

.field public coreMemberProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_member/service"
        required = true
    .end annotation
.end field

.field public coreMessageProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_message/service"
        required = true
    .end annotation
.end field

.field public corePayProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CorePayProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_pay/service"
        required = true
    .end annotation
.end field

.field public coreProfileProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProfileProviderInterface;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_profile/service"
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b17;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnovationProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->coreInnovationProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnovationProviderInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->coreMemberProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->coreMessageProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->coreGlobalProvider:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 2
    .line 3
    return-object p0
.end method
