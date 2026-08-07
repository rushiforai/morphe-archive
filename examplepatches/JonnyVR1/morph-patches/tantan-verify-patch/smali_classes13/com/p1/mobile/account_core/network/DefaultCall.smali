.class public Lcom/p1/mobile/account_core/network/DefaultCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sy3;


# static fields
.field public static final TAG:Ljava/lang/String; = "DefaultCall"


# instance fields
.field protected apiCallBack:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lcom/p1/mobile/account_core/network/ApiCallBack;",
            ">;"
        }
    .end annotation
.end field

.field protected errorHandler:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field protected okHttpClient:Ll/rg50;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->apiCallBack:Ll/pcj;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/pcj;Ll/rg50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Lcom/p1/mobile/account_core/network/ApiCallBack;",
            ">;",
            "Ll/rg50;",
            ")V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->apiCallBack:Ll/pcj;

    .line 12
    iput-object p2, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    return-void
.end method

.method public static synthetic a(Ll/rg50;Ll/x1d0;)Ll/rg50;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ll/x1d0;)Ll/x1d0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/account_core/network/DefaultCall;Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->errorHandler:Ll/qcj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Throwable;

    .line 10
    .line 11
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p1}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private executeRequest(Ll/x1d0;Ll/rg50;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            "Ll/rg50;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/rg50;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/rg50;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 13
    .line 14
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 15
    .line 16
    :cond_1
    sget-boolean v0, Ll/tv;->a:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "DefaultCall"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    :cond_2
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/p1/mobile/account_core/network/NetReqObs;

    .line 38
    .line 39
    new-instance v2, Ll/ymd;

    .line 40
    .line 41
    invoke-direct {v2, p1}, Ll/ymd;-><init>(Ll/x1d0;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->apiCallBack:Ll/pcj;

    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/account_core/network/ApiCallBack;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 p1, 0x0

    .line 56
    :goto_0
    new-instance v3, Ll/zmd;

    .line 57
    .line 58
    invoke-direct {v3, p2}, Ll/zmd;-><init>(Ll/rg50;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v1, v2, p1, v3}, Lcom/p1/mobile/account_core/network/NetReqObs;-><init>(Ll/pcj;Lcom/p1/mobile/account_core/network/ApiCallBack;Ll/qcj;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ll/and;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/and;-><init>(Lcom/p1/mobile/account_core/network/DefaultCall;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    new-instance p0, Ll/bnd;

    .line 85
    .line 86
    invoke-direct {p0}, Ll/bnd;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method


# virtual methods
.method public execute(Ll/x1d0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/account_core/network/DefaultCall;->executeRequest(Ll/x1d0;Ll/rg50;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public executeWithTimeout(Ll/x1d0;J)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            "J)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ll/rg50;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/rg50;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-virtual {v0, p2, p3, v1}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/rg50$b;->c()Ll/rg50;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/account_core/network/DefaultCall;->executeRequest(Ll/x1d0;Ll/rg50;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public interceptRequest(Ll/x1d0;)Ll/x1d0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    return-object p1
.end method
