.class public Ll/ogh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/yqg;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Z

.field public d:Lv/VEditText;

.field public e:I

.field public f:I

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/feed/data/Moment;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ixh;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_moment_preview"

    .line 5
    .line 6
    iput-object v0, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ll/kgh;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/kgh;-><init>(Ll/ogh;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ogh;->m:Ll/y20;

    .line 14
    .line 15
    iput-object p1, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const-string p1, "p_video_recommend"

    .line 22
    .line 23
    iput-object p1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    iget p1, p2, Ll/ixh;->a:I

    .line 26
    .line 27
    iput p1, p0, Ll/ogh;->f:I

    .line 28
    .line 29
    iget-boolean p1, p2, Ll/ixh;->d:Z

    .line 30
    .line 31
    iput-boolean p1, p0, Ll/ogh;->g:Z

    .line 32
    .line 33
    iget-object p1, p2, Ll/ixh;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iput-object p1, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    iput-object p1, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 48
    .line 49
    :cond_1
    iget-object p1, p2, Ll/ixh;->e:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p1, p0, Ll/ogh;->l:Ljava/lang/String;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->O(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic b(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ogh;->J(Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Ll/ogh;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ogh;->S(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/ogh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->R(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Ll/ogh;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->U(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/ogh;Ll/yqg;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogh;->N(Ll/yqg;Ll/pf60;)V

    return-void
.end method

.method public static synthetic j(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ogh;->K(Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k(Ll/ogh;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->P(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l(Ll/ogh;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->I(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic m(Ll/ogh;Lv/VEditText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogh;->G(Lv/VEditText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/ogh;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogh;->T(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic o(Ll/ogh;Ll/yqg;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogh;->L(Ll/yqg;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic p(Ll/ogh;Lv/VEditText;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ogh;->F(Lv/VEditText;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic q(Ll/ogh;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ogh;->Q(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic r(Ll/ogh;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogh;->H(Lv/VEditText;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t(Lv/VEditText;Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic u()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v(Ll/ogh;Ll/yqg;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogh;->M(Ll/yqg;Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ogh;->B(Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-boolean v4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 22
    .line 23
    xor-int/lit8 v4, v4, 0x1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getMomentShowFrom()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {v1, v2, v3, v4, v5}, Ll/jka;->Fb(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    new-instance v1, Ll/yfh;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1, v0}, Ll/yfh;-><init>(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/zfh;

    .line 43
    .line 44
    invoke-direct {v2, p0, p1, v0}, Ll/zfh;-><init>(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final C(ZLjava/lang/Throwable;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, "moment_id"

    .line 9
    .line 10
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    iget-object p0, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "owner_id"

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "comment_user_id"

    .line 35
    .line 36
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    const-string p0, "success"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p0, "fail"

    .line 46
    .line 47
    :goto_0
    const-string p1, "comment_state"

    .line 48
    .line 49
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    const-string p0, "comment_detail"

    .line 54
    .line 55
    const-string p1, "comment"

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    :goto_1
    move-object v8, p0

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    const-string p0, "error"

    .line 67
    .line 68
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    goto :goto_1

    .line 77
    :goto_2
    filled-new-array/range {v3 .. v8}, [Ll/tfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "e_comment_send"

    .line 82
    .line 83
    invoke-static {p1, v1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public D(Ll/yqg;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/ogh;->a:Ll/yqg;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/ogh;->b:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/ogh;->b:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/yqg;->q0(Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    iget-object v1, v1, Ll/jka;->l0:Lrx/subjects/b;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/sfh;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/sfh;-><init>(Ll/ogh;Ll/yqg;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 59
    .line 60
    iget-object v1, v1, Ll/jka;->Q0:Lrx/subjects/b;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/dgh;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1}, Ll/dgh;-><init>(Ll/ogh;Ll/yqg;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ll/ggh;

    .line 72
    .line 73
    invoke-direct {v2}, Ll/ggh;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 86
    .line 87
    iget-object v1, v1, Ll/jka;->S0:Lrx/subjects/b;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/hgh;

    .line 94
    .line 95
    invoke-direct {v1, p0, p1}, Ll/hgh;-><init>(Ll/ogh;Ll/yqg;)V

    .line 96
    .line 97
    .line 98
    new-instance p1, Ll/igh;

    .line 99
    .line 100
    invoke-direct {p1}, Ll/igh;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 113
    .line 114
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v0, Ll/jgh;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/jgh;-><init>(Ll/ogh;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final E()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->i:Z

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->f:Z

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic F(Lv/VEditText;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 p3, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-ne p2, p3, :cond_1

    .line 8
    .line 9
    iget-boolean p2, p0, Ll/ogh;->g:Z

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    iget-object p2, p0, Ll/ogh;->d:Lv/VEditText;

    .line 20
    .line 21
    const-string p3, ""

    .line 22
    .line 23
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-boolean p2, p0, Ll/ogh;->c:Z

    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/owi;->a()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    new-instance p2, Ll/vfh;

    .line 37
    .line 38
    invoke-direct {p2, p0, p1}, Ll/vfh;-><init>(Ll/ogh;Lv/VEditText;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p2}, Ll/ogh;->x(Ll/x20;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return v0
.end method

.method public final synthetic G(Lv/VEditText;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean p2, p0, Ll/ogh;->g:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/wfh;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/wfh;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2, v0, v1}, Ll/ogh;->W(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic H(Lv/VEditText;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/ogh;->e:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setInputType(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 4
    .line 5
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    iget-object p0, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1, v2, p0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 7

    .line 1
    iget-object p3, p0, Ll/ogh;->a:Ll/yqg;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p3, v0}, Ll/yqg;->i0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p3, p0, Ll/ogh;->a:Ll/yqg;

    .line 19
    .line 20
    iget-object v3, p3, Ll/yqg;->E:Ljava/lang/String;

    .line 21
    .line 22
    const/16 v4, 0xc9

    .line 23
    .line 24
    iget-object v6, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 25
    .line 26
    move-object v2, p1

    .line 27
    move v5, p2

    .line 28
    invoke-virtual/range {v1 .. v6}, Ll/er60;->q(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/Throwable;)V
    .locals 6

    .line 1
    invoke-static {p3}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Ll/ogh;->a:Ll/yqg;

    .line 9
    .line 10
    iget-object v2, v1, Ll/yqg;->E:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 13
    .line 14
    move-object v1, p1

    .line 15
    move v4, p2

    .line 16
    move-object v3, p3

    .line 17
    invoke-virtual/range {v0 .. v5}, Ll/er60;->r(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic L(Ll/yqg;Ljava/util/Map;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p2, p2, Ll/jka;->i0:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object p2, p2, Ll/jka;->i0:Ljava/util/Map;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/yqg;->p0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic M(Ll/yqg;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogh;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/yqg;->g0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic N(Ll/yqg;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogh;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/yqg;->g0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic P(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/ogh;->c:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/ogh;->d:Lv/VEditText;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic Q(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->J3:I

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sget p3, Ll/lbc0;->Z1:I

    .line 35
    .line 36
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {p1, p2}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ogh;->a:Ll/yqg;

    .line 44
    .line 45
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object p3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, p3}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 56
    .line 57
    iget p2, p2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ll/yqg;->h0(I)V

    .line 60
    .line 61
    .line 62
    const/4 p1, 0x1

    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-virtual {p0, p1, p2}, Ll/ogh;->C(ZLjava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic R(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/ogh;->C(ZLjava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v1, p1, p2}, Ll/jka;->N6(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/egh;

    .line 14
    .line 15
    invoke-direct {v0, p0, p3, p2}, Ll/egh;-><init>(Ll/ogh;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/fgh;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/fgh;-><init>(Ll/ogh;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public final synthetic T(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1, p2}, Ll/ogh;->V(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ogh;->a:Ll/yqg;

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
    iget-object p0, p0, Ll/ogh;->a:Ll/yqg;

    .line 10
    .line 11
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    move-object v1, p1

    .line 18
    check-cast v1, Ll/pf60;

    .line 19
    .line 20
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 23
    .line 24
    check-cast p1, Ll/pf60;

    .line 25
    .line 26
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, p1}, Ll/yqg;->m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public V(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "comment"

    .line 6
    .line 7
    invoke-static {v2}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v4, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v5, Ll/cgh;

    .line 14
    .line 15
    invoke-direct {v5, p0, p1, p2, p3}, Ll/cgh;-><init>(Ll/ogh;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    const-string v3, "comment"

    .line 19
    .line 20
    invoke-static/range {v0 .. v5}, Ll/ksg;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final W(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v1, ""

    .line 17
    .line 18
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 21
    .line 22
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p2, Ll/bgh;

    .line 35
    .line 36
    invoke-direct {p2, p0, v0, p3}, Ll/bgh;-><init>(Ll/ogh;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    invoke-static {p1, p2, p0}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p1, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0, p3}, Ll/ogh;->V(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public X()V
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "e_likeButton"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "e_follow"

    .line 11
    .line 12
    :goto_0
    iget-object v1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Ll/ogh;->a:Ll/yqg;

    .line 15
    .line 16
    iget-object v2, v2, Ll/yqg;->x:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ogh;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {v2, v3, p0}, Ll/er60;->B(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v0, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public Y()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 7
    .line 8
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v1, v2, v0, v3}, Ll/jka;->Tb(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/lgh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/lgh;-><init>(Ll/ogh;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/mgh;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/mgh;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public w()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final x(Ll/x20;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/agh;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/agh;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    sget-object v2, Ll/l3h;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, v1, p1, v2}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public y(Lv/VEditText;Landroid/widget/TextView;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iput-object p3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ogh;->d:Lv/VEditText;

    .line 4
    .line 5
    invoke-static {}, Ll/owi;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    iget-boolean p3, p0, Ll/ogh;->g:Z

    .line 12
    .line 13
    if-eqz p3, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getInputType()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    iput p3, p0, Ll/ogh;->e:I

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setInputType(I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    new-instance p3, Ll/ngh;

    .line 26
    .line 27
    invoke-direct {p3, p0, p1}, Ll/ngh;-><init>(Ll/ogh;Lv/VEditText;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p1, v0}, Lv/VEditText;->i(Z)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    new-instance v0, Ll/tfh;

    .line 53
    .line 54
    invoke-direct {v0, p1, p2}, Ll/tfh;-><init>(Lv/VEditText;Landroid/widget/TextView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    :cond_2
    new-instance p3, Ll/ufh;

    .line 65
    .line 66
    invoke-direct {p3, p0, p1}, Ll/ufh;-><init>(Ll/ogh;Lv/VEditText;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {p2}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object p0, p0, Ll/ogh;->m:Ll/y20;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    const-string v3, "matched"

    .line 6
    .line 7
    const/4 v4, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v5, "p_moment_preview"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    invoke-virtual {v1, v3, v5, v6, v6}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0, v2, v6, v6}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    invoke-virtual {v1, v3, v5, v4, v6}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 65
    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 68
    .line 69
    move-object v3, v1

    .line 70
    iget-object v1, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    move-object v4, v3

    .line 73
    iget-object v3, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 74
    .line 75
    move-object v0, v4

    .line 76
    const-string v4, "p_moment_preview"

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    move-object v2, p1

    .line 80
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    invoke-static {}, Ll/cmg;->K()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    iget-object v1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 91
    .line 92
    const-string v3, "moments_user_id"

    .line 93
    .line 94
    iget-object v5, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const-string v5, "moment_id"

    .line 101
    .line 102
    iget-object v6, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    filled-new-array {v3, v5}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    const-string v5, "e_likeButton"

    .line 113
    .line 114
    invoke-static {v5, v1, v3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    move-object v3, v1

    .line 122
    iget-object v1, p0, Ll/ogh;->j:Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/ogh;->E()Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    xor-int/2addr v4, v5

    .line 129
    const-string v5, "moment"

    .line 130
    .line 131
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    iget-object v6, p0, Ll/ogh;->k:Ljava/lang/String;

    .line 136
    .line 137
    const/4 v7, 0x0

    .line 138
    const/4 v8, 0x0

    .line 139
    move-object v0, v3

    .line 140
    move v3, v4

    .line 141
    const/4 v4, 0x0

    .line 142
    move-object v2, p1

    .line 143
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 148
    .line 149
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-eqz v5, :cond_4

    .line 154
    .line 155
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 156
    .line 157
    const-string v6, "following"

    .line 158
    .line 159
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    if-nez v5, :cond_3

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_4

    .line 172
    .line 173
    :cond_3
    iget-object v1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p0, Ll/ogh;->a:Ll/yqg;

    .line 176
    .line 177
    iget-object v3, v3, Ll/yqg;->x:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v4, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 180
    .line 181
    invoke-static {v3, v4, p1}, Ll/er60;->B(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    const-string v4, "e_cancelfollow"

    .line 186
    .line 187
    invoke-static {v4, v1, v3}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {p0}, Ll/ogh;->w()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 203
    .line 204
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    new-instance v4, Ll/xfh;

    .line 209
    .line 210
    invoke-direct {v4, p0, p1}, Ll/xfh;-><init>(Ll/ogh;Lcom/p1/mobile/putong/data/User;)V

    .line 211
    .line 212
    .line 213
    invoke-static {v1, v3, v4}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_4
    iget-object v1, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v3, p0, Ll/ogh;->a:Ll/yqg;

    .line 220
    .line 221
    iget-object v3, v3, Ll/yqg;->x:Ljava/lang/String;

    .line 222
    .line 223
    iget-object v5, p0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 224
    .line 225
    invoke-static {v3, v5, p1}, Ll/er60;->B(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    const-string v5, "e_follow"

    .line 230
    .line 231
    invoke-static {v5, v1, v3}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 235
    .line 236
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 237
    .line 238
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 239
    .line 240
    if-eqz v1, :cond_5

    .line 241
    .line 242
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-nez v1, :cond_5

    .line 247
    .line 248
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 249
    .line 250
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 255
    .line 256
    sget-object v3, Ll/uqb0;->b0:Ll/sre0;

    .line 257
    .line 258
    iget-object v3, v3, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 259
    .line 260
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    iget-object v0, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v1, v3, p1, v4, v0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 267
    .line 268
    .line 269
    return-void
.end method
