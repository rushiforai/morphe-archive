.class public Ll/adk;
.super Ll/yck;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/yck<",
        "Ll/tul;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

.field public d:Lcom/p1/mobile/putong/core/ui/greet/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/core/ui/greet/a;Ll/tul;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Ll/yck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/c;Ll/tul;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/adk;->d:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 5
    .line 6
    iput-object p1, p0, Ll/adk;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Ll/adk;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/adk;->f(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ldk;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ldk;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/adk;->e()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Ll/adk;->e()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->P9(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/ldk;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/zck;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/zck;-><init>(Ll/adk;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ldk;->a()Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/adk;->d:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Ll/adk;->e()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Ll/adk;->d:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/adk;->e()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0}, Ll/ldk;->a()Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->h0()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getStateId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object v0, p0, Ll/adk;->d:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p0, v0, p1}, Ll/adk;->g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yck;->b:Ll/tul;

    .line 2
    .line 3
    iget-object v1, p0, Ll/adk;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getStateId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {p0}, Ll/ldk;->a()Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    move-object v2, p1

    .line 22
    move-object v3, p2

    .line 23
    invoke-interface/range {v0 .. v5}, Ll/tul;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
