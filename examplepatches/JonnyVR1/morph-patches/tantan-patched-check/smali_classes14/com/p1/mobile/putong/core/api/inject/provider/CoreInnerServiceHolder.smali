.class public Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public coreBusinessService:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_business/service"
        required = true
    .end annotation
.end field

.field public coreBuzzInnerService:Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/buzz_service/service"
        required = true
    .end annotation
.end field

.field public coreCardInnerService:Lcom/p1/mobile/putong/core/card/service/CoreCardInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/card_service/service"
        required = true
    .end annotation
.end field

.field public coreMemberInnerService:Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/member_service/service"
        required = true
    .end annotation
.end field

.field public coreMessageInnerService:Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/message_service/service"
        required = true
    .end annotation
.end field

.field public corePayInnerService:Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/pay_service/service"
        required = true
    .end annotation
.end field

.field public coreProfileInnerService:Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/profile_service/service"
        required = true
    .end annotation
.end field

.field public innovationInnerService:Lcom/p1/mobile/putong/core/innovation/service/CoreInnovationInnerService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/innovation_service/service"
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/mum;->g(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
