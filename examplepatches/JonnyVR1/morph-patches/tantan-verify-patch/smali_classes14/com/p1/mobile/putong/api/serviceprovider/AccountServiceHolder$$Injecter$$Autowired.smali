.class public Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder$$Injecter$$Autowired;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/ISyringe;


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
.method public inject(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;

    .line 2
    .line 3
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "/account_service/service"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->accountService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    const-string v0, "!"

    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/mum;->d()Ll/mum;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v2, "/account_common_service/service"

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/mum;->a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->navigation()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 42
    .line 43
    iput-object p0, p1, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;->accountCommonService:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 44
    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const-string p0, "The field \'accountCommonService\' is null, in class \'"

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const-string p0, "The field \'accountService\' is null, in class \'"

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p0, p1, v0}, Ll/zzq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
