.class public Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;
.super Ll/pr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pr2<",
        "Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;",
        "Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;",
        ">;"
    }
.end annotation


# instance fields
.field public accountCommonService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/account_common_service/service"
        required = true
    .end annotation
.end field

.field public accountService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/account_service/service"
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->d()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->accountCommonService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->accountService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    return-object p0
.end method
