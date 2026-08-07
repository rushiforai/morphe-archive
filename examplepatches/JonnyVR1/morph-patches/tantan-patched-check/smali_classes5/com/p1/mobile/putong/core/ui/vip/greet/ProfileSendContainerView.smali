.class public Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/v3m;


# instance fields
.field public a:Landroid/view/ViewStub;

.field public b:Landroid/view/ViewStub;

.field public c:Ll/v3m;

.field public d:Landroid/view/View;

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x2

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->e:I

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->f:Z

    .line 9
    .line 10
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->v()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->B(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/pcj;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/pcj;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final synthetic B(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pcj;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->e:I

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    move-object v5, p3

    .line 12
    move-object p3, p2

    .line 13
    move-object p2, v5

    .line 14
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pcj;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    move-object v5, p3

    .line 19
    move-object p3, p2

    .line 20
    move-object p2, v5

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 32
    .line 33
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;

    .line 34
    .line 35
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->a:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGrentAndLetterView;->b:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;

    .line 42
    .line 43
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->f:Z

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->f:Z

    .line 51
    .line 52
    const-string v0, "is_reply"

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v2, "is_match"

    .line 59
    .line 60
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const-string v2, "owner_id"

    .line 65
    .line 66
    invoke-static {v2, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "e_send_message"

    .line 75
    .line 76
    const-string v2, "p_suggest_user_profile_info_view"

    .line 77
    .line 78
    invoke-static {v1, v2, v0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pcj;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Ll/v3m;->H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v3m;->I(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getEnvelopSayHai()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v3m;->getEnvelopSayHai()Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Ll/v3m;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setViewLayoutType(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->e:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->a:Landroid/view/ViewStub;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->d:Landroid/view/View;

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->b:Landroid/view/ViewStub;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->d:Landroid/view/View;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->d:Landroid/view/View;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->d:Landroid/view/View;

    .line 31
    .line 32
    check-cast p1, Ll/v3m;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yza0;->b(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->a:Landroid/view/ViewStub;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget v0, Ll/kec0;->Za:I

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget v0, Ll/kec0;->ab:I

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->a:Landroid/view/ViewStub;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/v3m;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pcj;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->userObsById(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p2, v0}, Lrx/c;->take(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/wza0;

    .line 19
    .line 20
    move-object v1, p0

    .line 21
    move-object v2, p1

    .line 22
    move-object v3, p3

    .line 23
    move-object v4, p4

    .line 24
    move-object v5, p5

    .line 25
    invoke-direct/range {v0 .. v5}, Ll/wza0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/pcj;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/xza0;

    .line 29
    .line 30
    invoke-direct {p0, v1}, Ll/xza0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/pcj;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;->c:Ll/v3m;

    .line 6
    .line 7
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    :goto_0
    move-object v1, p4

    .line 14
    move-object p4, p3

    .line 15
    move-object p3, p5

    .line 16
    move-object p5, v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const-string p4, ""

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    invoke-interface/range {p0 .. p5}, Ll/v3m;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
