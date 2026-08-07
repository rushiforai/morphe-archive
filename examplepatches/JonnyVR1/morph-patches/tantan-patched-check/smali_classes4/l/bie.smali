.class public Ll/bie;
.super Ll/mdk;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mdk<",
        "Ll/fzq;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/mdk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bie;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bie;->f:Ljava/util/Set;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/bie;->g:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 22
    .line 23
    new-instance p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/bie;->d:Ljava/util/List;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic G(Ll/bie;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bie;->f0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Ll/bie;Ll/fzq;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bie;->d0(Ll/fzq;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic J(Ll/bie;Ll/fzq;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bie;->c0(Ll/fzq;IILandroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/fzq;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 6
    .line 7
    const-string v0, "instant_chat"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic L([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic M(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N(Ll/mdk;Ll/fzq;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/mdk;->F(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic O(Ll/mdk;Ll/fzq;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/mdk;->F(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic P(Ll/fzq;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0x9c6a

    .line 10
    .line 11
    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const v0, 0x9c6c

    .line 15
    .line 16
    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const v0, 0x9c6d

    .line 20
    .line 21
    .line 22
    if-ne p1, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const v0, 0x9c6e

    .line 26
    .line 27
    .line 28
    if-ne p1, v0, :cond_4

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 45
    .line 46
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 51
    .line 52
    if-eqz p0, :cond_4

    .line 53
    .line 54
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 55
    .line 56
    invoke-static {p1}, Ll/g39;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    const-string p0, "\u5bf9\u65b9\u540c\u610f\u914d\u5bf9\u540e\u53ef\u53d1\u9001\u6d88\u606f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 63
    .line 64
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-static {p1}, Ll/g39;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_4
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Ll/bie;->X(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p0, p1, p2}, Ll/bie;->Y(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const/4 p0, 0x0

    .line 15
    aget-object p0, p3, p0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/data/Message;Ll/fzq;Ll/mdk;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string p3, "coin"

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p3, "privilege"

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gm()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p2, p0}, Ll/mdk;->F(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static synthetic S(Ll/fzq;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 6
    .line 7
    const-string v0, "instant_chat"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic T(Ll/bie;Ll/fzq;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bie;->e0(Ll/fzq;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ljava/lang/String;Ll/fzq;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static X(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;",
            "Ll/fzq;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/j;->B6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/qhe;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2}, Ll/qhe;-><init>(Ll/mdk;Ll/fzq;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/rhe;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/rhe;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static Y(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;",
            "Ll/fzq;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/j;->j5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/ohe;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2}, Ll/ohe;-><init>(Ll/mdk;Ll/fzq;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/phe;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/phe;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static h0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;II)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "meet"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "undefined"

    .line 15
    .line 16
    :goto_0
    invoke-static {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/d;->i(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget p2, Ll/y7c0;->e:I

    .line 20
    .line 21
    sget v0, Ll/y7c0;->d:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v0, Ll/pf60;

    .line 31
    .line 32
    const-string v1, "user_id"

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/pf60;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/fzq;->o()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x0

    .line 48
    if-lez v2, :cond_1

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v2, v3

    .line 53
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v4, "is_red_dot"

    .line 58
    .line 59
    invoke-direct {v1, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/pf60;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    const-string v4, "fake"

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    const-string v4, "good"

    .line 74
    .line 75
    :goto_2
    const-string v5, "identify"

    .line 76
    .line 77
    invoke-direct {v2, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    new-instance v4, Ll/pf60;

    .line 81
    .line 82
    const/16 v5, 0x14

    .line 83
    .line 84
    if-ne p3, v5, :cond_3

    .line 85
    .line 86
    const-string p3, "receive"

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_3
    const-string p3, "call"

    .line 90
    .line 91
    :goto_3
    const-string v5, "greeting_type"

    .line 92
    .line 93
    invoke-direct {v4, v5, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    filled-new-array {v0, v1, v2, v4}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    const-string v0, "e_kankan_stranger_message_item"

    .line 101
    .line 102
    invoke-static {v0, p2, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v3}, Ll/fzq;->M(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->d2()Ll/wj2;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Ll/wj2;->d()V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static i0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;Ll/mdk;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;",
            "Ll/fzq;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->d:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    new-array v2, v1, [Ll/w30;

    .line 17
    .line 18
    new-instance v3, Ll/w30$b;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 28
    .line 29
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v3, v4}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    new-instance v5, Ll/whe;

    .line 38
    .line 39
    invoke-direct {v5, v2}, Ll/whe;-><init>([Ll/w30;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v4, Ll/xhe;

    .line 51
    .line 52
    invoke-direct {v4, p0, p2, p1, v2}, Ll/xhe;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v4}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ll/w30$b;->F()Ll/w30;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 p1, 0x0

    .line 63
    aput-object p0, v2, p1

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 66
    .line 67
    .line 68
    return v1
.end method

.method public static j0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;Ll/mdk;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;",
            "Ll/fzq;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "to_uid"

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "e_greeting_new_reply"

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const-string p0, "\u7f51\u7edc\u5f02\u5e38"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "two_sides_different_tip"

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 47
    .line 48
    invoke-static {p0, p1, v0, p2}, Ll/bie;->k0(Lcom/p1/mobile/android/app/Act;Ll/fzq;Lcom/p1/mobile/putong/core/data/Message;Ll/mdk;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static k0(Lcom/p1/mobile/android/app/Act;Ll/fzq;Lcom/p1/mobile/putong/core/data/Message;Ll/mdk;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/fzq;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1, p0}, Ll/r97;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string p0, "greeting"

    .line 58
    .line 59
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-string v4, ""

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    move-object v3, p2

    .line 67
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 p2, 0x1

    .line 72
    invoke-virtual {p0, p2}, Lrx/c;->take(I)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance p2, Ll/uhe;

    .line 77
    .line 78
    invoke-direct {p2, v3, p1, p3}, Ll/uhe;-><init>(Lcom/p1/mobile/putong/core/data/Message;Ll/fzq;Ll/mdk;)V

    .line 79
    .line 80
    .line 81
    new-instance p3, Ll/vhe;

    .line 82
    .line 83
    invoke-direct {p3, p1}, Ll/vhe;-><init>(Ll/fzq;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method


# virtual methods
.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->b2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bie;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/bie;->d:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget v0, Ll/qec0;->Y3:I

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0, p2}, Ll/bie;->b0(I)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object p0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Ll/qec0;->Z3:I

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v0, Ll/qec0;->x:I

    .line 43
    .line 44
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :goto_0
    instance-of p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    move-object p1, p0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->e(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-object p0
.end method

.method public bridge synthetic E(Landroid/view/View;Ljava/lang/Object;Ljava/util/List;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/fzq;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/bie;->V(Landroid/view/View;Ll/fzq;Ljava/util/List;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 9
    .line 10
    new-instance v1, Ll/yhe;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/yhe;-><init>(Ll/bie;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x64

    .line 16
    .line 17
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public V(Landroid/view/View;Ll/fzq;Ljava/util/List;II)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/fzq;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;II)V"
        }
    .end annotation

    .line 1
    const/16 p3, 0xa

    .line 2
    .line 3
    if-ne p4, p3, :cond_4

    .line 4
    .line 5
    sget p2, Ll/edc0;->X4:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lv/VText;

    .line 12
    .line 13
    iget-boolean p4, p0, Ll/bie;->g:Z

    .line 14
    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    const-string p4, "\u4f60\u8fd8\u6ca1\u6709\u53d1\u51fa\u4efb\u4f55"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p4, "\u4f60\u8fd8\u6ca1\u6709\u6536\u5230\u4efb\u4f55"

    .line 21
    .line 22
    :goto_0
    iget-object v0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const-string v0, "\u6d88\u606f"

    .line 31
    .line 32
    invoke-virtual {p4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    const-string v0, "\u62db\u547c"

    .line 65
    .line 66
    invoke-virtual {p4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    goto :goto_2

    .line 71
    :cond_3
    :goto_1
    const-string v0, "\u544a\u767d"

    .line 72
    .line 73
    invoke-virtual {p4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    :goto_2
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    sget p4, Ll/edc0;->y1:I

    .line 83
    .line 84
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 89
    .line 90
    sget p4, Ll/ibc0;->o1:I

    .line 91
    .line 92
    invoke-virtual {p2, p1, p4}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 93
    .line 94
    .line 95
    move-object v2, p0

    .line 96
    goto/16 :goto_6

    .line 97
    .line 98
    :cond_4
    invoke-virtual {p0, p4}, Ll/bie;->b0(I)Z

    .line 99
    .line 100
    .line 101
    move-result p4

    .line 102
    if-eqz p4, :cond_9

    .line 103
    .line 104
    invoke-virtual {p0, p5}, Ll/bie;->getItemViewType(I)I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    iget-object p4, p0, Ll/bie;->f:Ljava/util/Set;

    .line 109
    .line 110
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-interface {p4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p4

    .line 118
    if-nez p4, :cond_8

    .line 119
    .line 120
    iget-object p4, p0, Ll/bie;->f:Ljava/util/Set;

    .line 121
    .line 122
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {p4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    iget-object p4, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 130
    .line 131
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->pageId()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p4

    .line 135
    new-instance v0, Ll/pf60;

    .line 136
    .line 137
    const-string v1, "user_id"

    .line 138
    .line 139
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    new-instance v1, Ll/pf60;

    .line 147
    .line 148
    invoke-virtual {p2}, Ll/fzq;->o()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-lez v2, :cond_5

    .line 153
    .line 154
    const/4 v2, 0x1

    .line 155
    goto :goto_3

    .line 156
    :cond_5
    const/4 v2, 0x0

    .line 157
    :goto_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    const-string v3, "is_red_dot"

    .line 162
    .line 163
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    new-instance v2, Ll/pf60;

    .line 167
    .line 168
    iget-object v3, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 169
    .line 170
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_6

    .line 175
    .line 176
    const-string v3, "fake"

    .line 177
    .line 178
    goto :goto_4

    .line 179
    :cond_6
    const-string v3, "good"

    .line 180
    .line 181
    :goto_4
    const-string v5, "identify"

    .line 182
    .line 183
    invoke-direct {v2, v5, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    new-instance v3, Ll/pf60;

    .line 187
    .line 188
    const/16 v5, 0x14

    .line 189
    .line 190
    if-ne v4, v5, :cond_7

    .line 191
    .line 192
    const-string v5, "receive"

    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_7
    const-string v5, "call"

    .line 196
    .line 197
    :goto_5
    const-string v6, "greeting_type"

    .line 198
    .line 199
    invoke-direct {v3, v6, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    const-string v1, "e_kankan_stranger_message_item"

    .line 207
    .line 208
    invoke-static {v1, p4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 209
    .line 210
    .line 211
    :cond_8
    move-object v0, p1

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;

    .line 213
    .line 214
    iget-object v1, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 215
    .line 216
    new-instance v5, Ll/khe;

    .line 217
    .line 218
    invoke-direct {v5, p0, p2, p5, v4}, Ll/khe;-><init>(Ll/bie;Ll/fzq;II)V

    .line 219
    .line 220
    .line 221
    new-instance v6, Ll/she;

    .line 222
    .line 223
    invoke-direct {v6, p0, p2}, Ll/she;-><init>(Ll/bie;Ll/fzq;)V

    .line 224
    .line 225
    .line 226
    new-instance v7, Ll/the;

    .line 227
    .line 228
    invoke-direct {v7, p0, p2}, Ll/the;-><init>(Ll/bie;Ll/fzq;)V

    .line 229
    .line 230
    .line 231
    move-object v2, p0

    .line 232
    move-object v3, p2

    .line 233
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/greet/NewDynamicGreetListItemView;->j(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/bie;Ll/fzq;ILandroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Landroid/view/View$OnClickListener;)V

    .line 234
    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_9
    move-object v2, p0

    .line 238
    move-object v3, p2

    .line 239
    check-cast p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;

    .line 240
    .line 241
    iget-object p0, v2, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 242
    .line 243
    invoke-virtual {v2, p5}, Ll/bie;->getItemViewType(I)I

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    invoke-virtual {p1, p0, v3, p2, p5}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->j(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;II)V

    .line 248
    .line 249
    .line 250
    :goto_6
    iget-object p0, v2, Ll/bie;->d:Ljava/util/List;

    .line 251
    .line 252
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    add-int/lit8 p0, p0, -0x3

    .line 257
    .line 258
    if-lt p5, p0, :cond_a

    .line 259
    .line 260
    iget-object p0, v2, Ll/bie;->d:Ljava/util/List;

    .line 261
    .line 262
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 263
    .line 264
    .line 265
    move-result p0

    .line 266
    if-le p0, p3, :cond_a

    .line 267
    .line 268
    iget-object p0, v2, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 269
    .line 270
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->c2()Ll/vj2;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ll/vj2;->C0()V

    .line 275
    .line 276
    .line 277
    :cond_a
    return-void
.end method

.method public final W(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/fzq;

    .line 16
    .line 17
    const-string v1, "default"

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/fzq;->m()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Ll/bie;->e:Ljava/util/HashMap;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/bie;->e:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    iget-object v2, p0, Ll/bie;->e:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ll/fzq;

    .line 81
    .line 82
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iget-boolean p0, p0, Ll/bie;->g:Z

    .line 87
    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    return-object p1

    .line 94
    :cond_3
    new-instance p0, Ll/lhe;

    .line 95
    .line 96
    invoke-direct {p0}, Ll/lhe;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance v0, Ll/mhe;

    .line 104
    .line 105
    invoke-direct {v0}, Ll/mhe;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p0, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/nhe;

    .line 112
    .line 113
    invoke-direct {v0}, Ll/nhe;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/mhe;

    .line 121
    .line 122
    invoke-direct {v1}, Ll/mhe;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v0, v1}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 129
    .line 130
    .line 131
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 132
    .line 133
    .line 134
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    return-object p1
.end method

.method public Z()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bie;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public a0(I)Ll/fzq;
    .locals 2

    .line 1
    new-instance v0, Ll/fzq;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fzq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/bie;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/bie;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/fzq;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    return-object v0
.end method

.method public final b0(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x14

    .line 2
    .line 3
    if-eq p1, p0, :cond_1

    .line 4
    .line 5
    const/16 p0, 0x1e

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final synthetic c0(Ll/fzq;IILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Ll/bie;->h0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d0(Ll/fzq;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p2, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-static {p2, p1, p0}, Ll/bie;->i0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;Ll/mdk;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e0(Ll/fzq;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-static {p2, p1, p0}, Ll/bie;->j0(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Ll/fzq;Ll/mdk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bie;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/aie;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/aie;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-ltz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/bie;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/fzq;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/bie;->e:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public g0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bie;->a0(I)Ll/fzq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->b2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/bie;->d:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/16 p0, 0xa

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    iget-boolean p0, p0, Ll/bie;->g:Z

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/16 p0, 0x1e

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const/16 p0, 0x14

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ll/fzq;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    if-eqz p0, :cond_6

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/4 p0, 0x5

    .line 69
    return p0

    .line 70
    :cond_4
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-lez v0, :cond_5

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 89
    .line 90
    if-eqz p1, :cond_5

    .line 91
    .line 92
    const/4 p0, 0x6

    .line 93
    return p0

    .line 94
    :cond_5
    invoke-virtual {p0}, Ll/fzq;->h()Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    const/4 p1, 0x4

    .line 103
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    return p0

    .line 108
    :cond_6
    :goto_0
    return p1
.end method

.method public l0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zhe;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zhe;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->h(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/bie;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/bie;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/bie;->W(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ll/bie;->d:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Ll/bie;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->d2()Ll/wj2;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/wj2;->e()V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
