.class public Ll/pp00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bp00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Lv/VLinear;

.field public l:Lv/VDraweeView;

.field public m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

.field public p:Ll/bp00;

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Landroid/view/animation/Interpolator;

.field public u:Landroid/animation/Animator;

.field public v:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pp00;->q:Z

    .line 6
    .line 7
    new-instance v0, Ll/xjg;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/pp00;->t:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/pp00;->u:Landroid/animation/Animator;

    .line 16
    .line 17
    iput-object p1, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 18
    .line 19
    return-void
.end method

.method private synthetic B(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Ll/pp00;->N(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic E(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_emoji"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "\ud83d\udd25"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic F(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_emoji"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "\ud83d\ude04"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic G(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_emoji"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "\ud83d\udc4f"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic H(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_emoji"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "\ud83c\udf89"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic I(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_send"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Ll/pp00;->p:Ll/bp00;

    .line 58
    .line 59
    invoke-virtual {p2}, Ll/bp00;->j0()Ll/v500;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    if-eqz p2, :cond_0

    .line 64
    .line 65
    iget-object p0, p0, Ll/pp00;->p:Ll/bp00;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0, p1}, Ll/v500;->h(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic K()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pp00;->P()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pp00;->E(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pp00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pp00;->K()V

    return-void
.end method

.method public static synthetic c(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_user_passive_show_chat:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, p0, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/ep00;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/ep00;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Ll/fp00;

    .line 60
    .line 61
    invoke-direct {p0}, Ll/fp00;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic d(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pp00;->G(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pp00;->F(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/pp00;Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pp00;->L(Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method

.method public static synthetic j(Ll/pp00;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/pp00;->B(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic k(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pp00;->I(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/pp00;->H(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/pp00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pp00;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/pp00;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pp00;->C(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->W1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private u()V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/widget/PopupWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/kec0;->Ae:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/pp00;->r:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pp00;->s:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 23
    .line 24
    sget v4, Lcom/p1/mobile/putong/core/R$string;->pj:I

    .line 25
    .line 26
    new-instance v5, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/pp00;->n:Landroid/widget/TextView;

    .line 65
    .line 66
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 69
    .line 70
    .line 71
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/pp00;->l:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    iput-boolean v0, p0, Ll/pp00;->q:Z

    .line 96
    .line 97
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 98
    .line 99
    new-instance v1, Ll/pp00$a;

    .line 100
    .line 101
    invoke-direct {v1, p0, p2}, Ll/pp00$a;-><init>(Ll/pp00;Lcom/p1/mobile/putong/data/User;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Ll/pp00;->e:Lv/VText;

    .line 108
    .line 109
    new-instance v0, Ll/gp00;

    .line 110
    .line 111
    invoke-direct {v0, p0, p1}, Ll/gp00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Ll/pp00;->f:Lv/VText;

    .line 118
    .line 119
    new-instance v0, Ll/hp00;

    .line 120
    .line 121
    invoke-direct {v0, p0, p1}, Ll/hp00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Ll/pp00;->g:Lv/VText;

    .line 128
    .line 129
    new-instance v0, Ll/ip00;

    .line 130
    .line 131
    invoke-direct {v0, p0, p1}, Ll/ip00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Ll/pp00;->h:Lv/VText;

    .line 138
    .line 139
    new-instance v0, Ll/jp00;

    .line 140
    .line 141
    invoke-direct {v0, p0, p1}, Ll/jp00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    iget-object p2, p0, Ll/pp00;->i:Lv/VText;

    .line 148
    .line 149
    new-instance v0, Ll/kp00;

    .line 150
    .line 151
    invoke-direct {v0, p0, p1}, Ll/kp00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ll/pp00;->n:Landroid/widget/TextView;

    .line 158
    .line 159
    new-instance v0, Ll/lp00;

    .line 160
    .line 161
    invoke-direct {v0, p0, p1}, Ll/lp00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    iget-object p2, p0, Ll/pp00;->a:Landroid/widget/RelativeLayout;

    .line 168
    .line 169
    new-instance v0, Ll/mp00;

    .line 170
    .line 171
    invoke-direct {v0, p0}, Ll/mp00;-><init>(Ll/pp00;)V

    .line 172
    .line 173
    .line 174
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    iget-object p2, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 178
    .line 179
    new-instance v0, Ll/np00;

    .line 180
    .line 181
    invoke-direct {v0, p0}, Ll/np00;-><init>(Ll/pp00;)V

    .line 182
    .line 183
    .line 184
    const-wide/16 v1, 0xc8

    .line 185
    .line 186
    invoke-static {p2, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 187
    .line 188
    .line 189
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 190
    .line 191
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 192
    .line 193
    iget-object p2, p2, Ll/dkb;->P6:Ljava/util/Map;

    .line 194
    .line 195
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    if-eqz p2, :cond_0

    .line 200
    .line 201
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 202
    .line 203
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 204
    .line 205
    iget-object p2, p2, Ll/dkb;->P6:Ljava/util/Map;

    .line 206
    .line 207
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Ljava/lang/String;

    .line 212
    .line 213
    iget-object p2, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 214
    .line 215
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    iget-object p2, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 219
    .line 220
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 225
    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_0
    iget-object p1, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 229
    .line 230
    const-string p2, ""

    .line 231
    .line 232
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    :goto_0
    iget-object p1, p0, Ll/pp00;->p:Ll/bp00;

    .line 236
    .line 237
    invoke-virtual {p1}, Ll/bp00;->j0()Ll/v500;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    if-eqz p1, :cond_1

    .line 242
    .line 243
    iget-object p1, p0, Ll/pp00;->p:Ll/bp00;

    .line 244
    .line 245
    invoke-virtual {p1}, Ll/bp00;->j0()Ll/v500;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-interface {p1, p0}, Ll/v500;->c(Ll/pp00;)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_1
    iget-object p1, p0, Ll/pp00;->e:Lv/VText;

    .line 254
    .line 255
    const-string p2, "\u2764\ufe0f"

    .line 256
    .line 257
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p0, Ll/pp00;->f:Lv/VText;

    .line 261
    .line 262
    const-string p2, "\ud83d\udd25\ufe0f"

    .line 263
    .line 264
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    .line 266
    .line 267
    iget-object p1, p0, Ll/pp00;->g:Lv/VText;

    .line 268
    .line 269
    const-string p2, "\ud83d\ude04"

    .line 270
    .line 271
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Ll/pp00;->h:Lv/VText;

    .line 275
    .line 276
    const-string p2, "\ud83d\udc4f\ufe0f"

    .line 277
    .line 278
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    .line 280
    .line 281
    iget-object p0, p0, Ll/pp00;->i:Lv/VText;

    .line 282
    .line 283
    const-string p1, "\ud83c\udf89\ufe0f"

    .line 284
    .line 285
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method public final synthetic C(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "moment_id"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "moment_chat_send_from"

    .line 8
    .line 9
    const-string v1, "moment_chat_emoji"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ur(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "moment_type"

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "e_profile_moment_chat_send"

    .line 34
    .line 35
    const-string v0, "p_moment_chat"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "\u2764\ufe0f"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/pp00;->M(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic L(Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/pp00;->p:Ll/bp00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bp00;->z0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->a(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->c0:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public M(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/a4j;->M(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/pp00;->y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/pp00;->p:Ll/bp00;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bp00;->j0()Ll/v500;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/pp00;->p:Ll/bp00;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/bp00;->z0(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 47
    .line 48
    new-instance v2, Ll/op00;

    .line 49
    .line 50
    invoke-direct {v2, p0, p1}, Ll/op00;-><init>(Ll/pp00;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->po(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/pp00;->p:Ll/bp00;

    .line 63
    .line 64
    const/4 v0, 0x4

    .line 65
    invoke-virtual {p1, v0}, Ll/bp00;->y0(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;->finish()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public N(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/pp00;->q:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;->finish()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-lez p1, :cond_3

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/pp00;->q:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/pp00;->Q(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v0, p0, Ll/pp00;->u:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ll/pp00;->u:Landroid/animation/Animator;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 36
    .line 37
    .line 38
    :cond_2
    invoke-virtual {p0, p1}, Ll/pp00;->Q(I)V

    .line 39
    .line 40
    .line 41
    :goto_0
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Ll/pp00;->q:Z

    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method public O(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/ln7;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 26
    .line 27
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 37
    .line 38
    iget-object p0, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setFocusableInTouchMode(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 18
    .line 19
    iget-object p0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final Q(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pp00;->t:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pp00;->b:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    neg-int p1, p1

    .line 6
    int-to-float p1, p1

    .line 7
    const/4 v2, 0x1

    .line 8
    new-array v3, v2, [F

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput p1, v3, v4

    .line 12
    .line 13
    const-string p1, "translationY"

    .line 14
    .line 15
    invoke-static {v1, p1, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-wide/16 v3, 0x186

    .line 24
    .line 25
    invoke-static {v2, v0, v3, v4, p1}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/pp00;->u:Landroid/animation/Animator;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pp00;->s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bp00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pp00;->v(Ll/bp00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pp00;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 6
    .line 7
    new-instance v0, Landroid/view/View;

    .line 8
    .line 9
    iget-object v1, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/cp00;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/cp00;-><init>(Ll/pp00;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/ln7;->b()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Ll/pp00;->u()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-object p1
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qp00;->b(Ll/pp00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ll/bp00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pp00;->p:Ll/bp00;

    .line 2
    .line 3
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/pp00;->v:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public x()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final y(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v0, Ll/dp00;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/dp00;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x1f4

    .line 9
    .line 10
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public z()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pp00;->q:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/pp00;->t:Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    iget-object p0, p0, Ll/pp00;->b:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    aput v4, v3, v0

    .line 13
    .line 14
    const-string v0, "translationY"

    .line 15
    .line 16
    invoke-static {p0, v0, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-wide/16 v3, 0x186

    .line 25
    .line 26
    invoke-static {v2, v1, v3, v4, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
