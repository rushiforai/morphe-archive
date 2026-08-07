.class public Lcom/p1/mobile/putong/core/ui/greet/GreetAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/greet/a;

.field public d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

.field public e:Z

.field public f:Z

.field public g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->f:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->m2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_stay_meet"

    .line 2
    .line 3
    const-string v0, "p_meet_back_pop"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic Z1(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a2()Lcom/p1/mobile/putong/core/ui/greet/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/greet/a;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final b2(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public c2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public checkGradientColors()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/g9c0;->Y:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public e2()Lcom/p1/mobile/putong/core/ui/greet/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->nq()Lrx/subjects/b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 v0, 0x0

    .line 51
    sget v1, Ll/y7c0;->b:I

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public g2()Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public h2()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->J1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/r97;->e()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return v1

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    :goto_0
    if-nez p0, :cond_3

    .line 77
    .line 78
    return v1

    .line 79
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 80
    .line 81
    const-string v0, "city_c"

    .line 82
    .line 83
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    return p0
.end method

.method public i2()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "meet"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "from_meet_liked"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "from_meet_picks"

    .line 38
    .line 39
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    :cond_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "greet_param"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->a2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->b2(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->i0()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    const/4 v0, 0x1

    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e:Z

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->finish()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->a0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public k2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    :goto_0
    if-nez p0, :cond_2

    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 51
    .line 52
    const-string v0, "surprise_box"

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public l2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    :goto_0
    if-nez p0, :cond_2

    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 51
    .line 52
    const-string v0, "seekPartnerNum"

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method public final synthetic m2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->nq()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_meet_back"

    .line 15
    .line 16
    const-string v0, "p_meet_back_pop"

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n2(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->v1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o2(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p2, p1, p3, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X0(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZLjava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/a;->u1(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    invoke-static {v0, v1, v2, v3}, Ll/i39;->b(JJ)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Q:Ll/byd0;

    .line 71
    .line 72
    invoke-static {}, Ll/pzi0;->o()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    const-class v0, Landroid/app/Dialog;

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "p_meet_back_pop"

    .line 90
    .line 91
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/th0$a;

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    const-string v2, "\u9000\u51fa\u540e\uff0c\u5c31\u9519\u8fc7\u8fd9\u6b21\u5076\u9047\u4e86\uff0c\u73cd\u60dc\u7f18\u5206\u6253\u4e2a\u62db\u547c\u5427"

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 105
    .line 106
    .line 107
    const/4 v2, 0x0

    .line 108
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 109
    .line 110
    .line 111
    const-string v2, "\u518d\u770b\u770b"

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 114
    .line 115
    .line 116
    const-string v2, "\u786e\u5b9a\u9000\u51fa"

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 119
    .line 120
    .line 121
    new-instance v2, Ll/p9k;

    .line 122
    .line 123
    invoke-direct {v2, v0}, Ll/p9k;-><init>(Ll/l4g0;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 127
    .line 128
    .line 129
    new-instance v2, Ll/q9k;

    .line 130
    .line 131
    invoke-direct {v2, p0}, Ll/q9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 135
    .line 136
    .line 137
    new-instance p0, Ll/r9k;

    .line 138
    .line 139
    invoke-direct {p0}, Ll/r9k;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 150
    .line 151
    .line 152
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_2

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->c2()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_2

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->nq()Lrx/subjects/b;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public onStartLifecycle()V
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ld()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const-string v1, "to_uid"

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception v0

    .line 47
    goto/16 :goto_6

    .line 48
    .line 49
    :cond_0
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->mr()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    const-string v1, "moment_id"

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 84
    .line 85
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 94
    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 96
    .line 97
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    const-string v2, ""

    .line 101
    .line 102
    :goto_1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    const-string v1, "state_id"

    .line 106
    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    :cond_2
    const-string v1, "tooltips_trigger_mode"

    .line 115
    .line 116
    const-string v2, "active"

    .line 117
    .line 118
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    const-string v1, "greet_origin"

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 128
    .line 129
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getFrom()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    const-string v3, "meet_chat_popup"

    .line 138
    .line 139
    if-eqz v2, :cond_3

    .line 140
    .line 141
    move-object v2, v3

    .line 142
    goto :goto_2

    .line 143
    :cond_3
    :try_start_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 144
    .line 145
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getFrom()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    :goto_2
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_5

    .line 161
    .line 162
    const-string v1, "source_page"

    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 169
    .line 170
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getFrom()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-interface {v2, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eqz v2, :cond_4

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 182
    .line 183
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->getFrom()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    :goto_3
    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 195
    .line 196
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 200
    const-string v2, "1"

    .line 201
    .line 202
    const-string v3, "is_greeting_actor"

    .line 203
    .line 204
    const-string v4, "message_count"

    .line 205
    .line 206
    if-eqz v1, :cond_7

    .line 207
    .line 208
    :try_start_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 213
    .line 214
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->userMessageCount:I

    .line 215
    .line 216
    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 224
    .line 225
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_6

    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_6
    const-string v2, "0"

    .line 243
    .line 244
    :goto_4
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_7
    const/4 v1, 0x0

    .line 249
    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    .line 254
    .line 255
    :goto_5
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 256
    .line 257
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 258
    .line 259
    .line 260
    goto :goto_7

    .line 261
    :goto_6
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 262
    .line 263
    .line 264
    :goto_7
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->W0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "p_city_cover_greeting"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "p_kankan_chat_popup"

    .line 11
    .line 12
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTheme()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTheme()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/cgc0;->i:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
