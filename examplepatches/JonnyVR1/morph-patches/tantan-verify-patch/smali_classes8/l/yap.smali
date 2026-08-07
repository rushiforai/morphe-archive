.class public Ll/yap;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ll/yap;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

.field public b:Ll/wyd0;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "intl_renew_contract_dlg_show"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, ""

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/yap;->b:Ll/wyd0;

    .line 34
    .line 35
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/yap;->c:Lrx/subjects/a;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/yap;Ll/x20;Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yap;->f(Ll/x20;Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static d()Ll/yap;
    .locals 2

    .line 1
    sget-object v0, Ll/yap;->d:Ll/yap;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/yap;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/yap;->d:Ll/yap;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/yap;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/yap;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/yap;->d:Ll/yap;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/yap;->d:Ll/yap;

    .line 27
    .line 28
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.VIEW"

    .line 4
    .line 5
    const-string v2, "https://play.google.com/store/account/subscriptions"

    .line 6
    .line 7
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    return-void
.end method

.method public static i()V
    .locals 2

    .line 1
    const-string v0, "e_intl_membership_callback_banner"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j()V
    .locals 2

    .line 1
    const-string v0, "e_intl_membership_callback_banner"

    .line 2
    .line 3
    const-string v1, "p_privileges_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l()V
    .locals 1

    .line 1
    sget-object v0, Ll/yap;->d:Ll/yap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-object v0, Ll/yap;->d:Ll/yap;

    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yap;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/yap;->b:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/CharSequence;

    .line 24
    .line 25
    iget-object p0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlContractdData;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractdData;->contract:Lcom/p1/mobile/putong/core/data/IntlContractInfo;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfo;->contractId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final synthetic f(Ll/x20;Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/yap;->c:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g(Ll/ner;Ll/x20;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z1:Ll/ta9;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ta9;->c3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/wap;

    .line 14
    .line 15
    invoke-direct {v0, p0, p2}, Ll/wap;-><init>(Ll/yap;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/xap;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/xap;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public h(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlContractdData;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractdData;->contract:Lcom/p1/mobile/putong/core/data/IntlContractInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfo;->membershipType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public k()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yap;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yap;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlContractdData;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractdData;->contract:Lcom/p1/mobile/putong/core/data/IntlContractInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfo;->contractStatus:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "canceled"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public n()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yap;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/vap;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/vap;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vap;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yap;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/yap;->b:Ll/wyd0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/yap;->a:Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfosEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlContractdData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractdData;->contract:Lcom/p1/mobile/putong/core/data/IntlContractInfo;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlContractInfo;->contractId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
