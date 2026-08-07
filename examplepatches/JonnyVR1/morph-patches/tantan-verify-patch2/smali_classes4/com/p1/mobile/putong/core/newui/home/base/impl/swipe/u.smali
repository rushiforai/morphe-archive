.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public final g:Ll/byd0;

.field public final h:Ll/byd0;

.field public final i:Ll/byd0;

.field public final j:Ll/vxd0;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 5
    .line 6
    iget-object v0, v0, Ll/vwa;->b:Ll/byd0;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->g:Ll/byd0;

    .line 9
    .line 10
    new-instance v0, Ll/byd0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "gp_swipe_count_"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-wide/16 v2, 0x1

    .line 35
    .line 36
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->h:Ll/byd0;

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 46
    .line 47
    iget-object v0, v0, Ll/vwa;->e:Ll/byd0;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->i:Ll/byd0;

    .line 50
    .line 51
    new-instance v0, Ll/vxd0;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v2, "intl_live_card_dlg_count_"

    .line 56
    .line 57
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->j:Ll/vxd0;

    .line 80
    .line 81
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->k:Z

    .line 82
    .line 83
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->l:Z

    .line 84
    .line 85
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/VoiceLiveState;)Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/VoiceLiveState;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "anchorId"

    .line 7
    .line 8
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v0, "liveId"

    .line 14
    .line 15
    iget-object v1, p2, Lcom/p1/mobile/putong/data/VoiceLiveState;->voiceLiveId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string v0, "audio_card_type"

    .line 21
    .line 22
    const-string v1, "swipe_card"

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "index"

    .line 33
    .line 34
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VoiceLiveState;->anchorId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    const-string p1, "anchor"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-string p1, "audience_voicechat"

    .line 51
    .line 52
    :goto_0
    const-string p2, "user_type"

    .line 53
    .line 54
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    .line 1
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isLivingCard()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->t7()Ll/n2t;

    move-result-object v1

    invoke-interface {v1}, Ll/n2t;->a()Z

    move-result v1

    if-nez v1, :cond_1

    .line 4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->V6()Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    const-string v1, "swipe_final_step_1"

    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0

    .line 7
    :cond_1
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    const-string v11, "p_suggest_users_home_view"

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v1, :cond_c

    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 8
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 9
    invoke-static {}, Ll/d79;->n0()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 10
    invoke-virtual {v1}, Ll/ik4;->a()Ll/q7m;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 11
    invoke-virtual {v1}, Ll/ik4;->a()Ll/q7m;

    move-result-object v1

    instance-of v1, v1, Ll/r7m;

    if-eqz v1, :cond_2

    iget-boolean v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    if-nez v1, :cond_2

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_2

    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->k:Z

    if-nez v1, :cond_2

    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->l:Z

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->j:Ll/vxd0;

    .line 12
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {}, Ll/d79;->o0()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 13
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->a()Ll/q7m;

    move-result-object v1

    check-cast v1, Ll/r7m;

    invoke-interface {v1}, Ll/q7m;->s()V

    .line 14
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v1

    iget-object v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 16
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    new-instance v3, Ll/dgh0;

    invoke-direct {v3, v0, v10}, Ll/dgh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    new-instance v4, Ll/egh0;

    invoke-direct {v4, v0, v10}, Ll/egh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 17
    invoke-static {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->V1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;)V

    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0

    .line 19
    :cond_2
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->T2()V

    .line 20
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_6

    .line 21
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->l:Z

    if-nez v1, :cond_3

    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->j:Ll/vxd0;

    .line 22
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {}, Ll/d79;->o0()I

    move-result v2

    if-lt v1, v2, :cond_4

    .line 23
    :cond_3
    invoke-static {}, Ll/d79;->n0()Z

    move-result v1

    if-nez v1, :cond_8

    .line 24
    :cond_4
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    .line 25
    iget-boolean v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    if-eqz v2, :cond_5

    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->k:Z

    if-eqz v2, :cond_8

    .line 26
    :cond_5
    invoke-static {v11, v1}, Ll/tvn;->a(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    goto :goto_0

    .line 27
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_8

    .line 28
    iget-boolean v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    if-nez v1, :cond_7

    invoke-static {}, Ll/d79;->n0()Z

    move-result v1

    if-nez v1, :cond_8

    .line 29
    :cond_7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c8(Ljava/lang/String;)Lrx/c;

    .line 30
    :cond_8
    :goto_0
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/b;->M:Lcom/p1/mobile/putong/core/newui/home/c;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 31
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/b;->M:Lcom/p1/mobile/putong/core/newui/home/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/c;->c:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_9

    .line 32
    sget-object v1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    const-wide/32 v2, 0x2bf20

    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/location/a;->u(J)V

    goto :goto_1

    :cond_9
    const/4 v2, 0x5

    if-eq v1, v2, :cond_a

    const/4 v2, 0x3

    if-eq v1, v2, :cond_a

    if-eq v1, v12, :cond_a

    if-nez v1, :cond_b

    .line 33
    :cond_a
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v1, v13}, Ll/b240;->L8(Z)V

    .line 34
    :cond_b
    :goto_1
    iput-boolean v13, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->k:Z

    .line 35
    iput-boolean v13, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->l:Z

    .line 36
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_c

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0

    .line 38
    :cond_c
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v2

    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->M6(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 39
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 40
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_d

    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i9(Ljava/lang/String;)Lrx/c;

    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0

    .line 43
    :cond_d
    invoke-static {}, Ll/uih0;->m0()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 44
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    move-result-object v1

    invoke-virtual {v10}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a()Z

    move-result v2

    invoke-virtual {v1, v2}, Ll/uih0;->W0(Z)V

    .line 45
    :cond_e
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->n()Lcom/p1/mobile/putong/data/User;

    move-result-object v3

    .line 47
    invoke-static {}, Ll/gra;->E1()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 48
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 49
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    iget-object v1, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object v2, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f

    move v1, v12

    goto :goto_2

    :cond_f
    move v1, v13

    .line 51
    :goto_2
    iget-object v2, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v14, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v2, v14, :cond_10

    move v2, v12

    goto :goto_3

    :cond_10
    move v2, v13

    .line 52
    :goto_3
    invoke-static {}, Ll/s7a;->w()Z

    move-result v5

    if-eqz v5, :cond_12

    if-nez v1, :cond_12

    iget-boolean v5, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    if-eqz v5, :cond_12

    if-eqz v2, :cond_12

    iget-object v5, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    invoke-virtual {v5, v6}, Ll/b240;->j6(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_12

    .line 54
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v5

    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ll/z5h0;->l(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_12

    .line 55
    iget-object v5, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v5}, Ll/ik4;->a()Ll/q7m;

    move-result-object v5

    .line 56
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 57
    invoke-interface {v5}, Ll/q7m;->i()Z

    move-result v5

    goto :goto_4

    :cond_11
    move v5, v13

    :goto_4
    if-eqz v5, :cond_12

    .line 58
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v0

    iget-object v1, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ll/z5h0;->w(Ljava/lang/String;)V

    .line 59
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v0

    new-instance v1, Ll/fgh0;

    invoke-direct {v1, v10}, Ll/fgh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    const-wide/16 v2, 0x15e

    .line 61
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0

    .line 63
    :cond_12
    invoke-static {}, Ll/s7a;->w()Z

    move-result v5

    if-eqz v5, :cond_14

    .line 64
    iget-object v5, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v5}, Ll/ik4;->a()Ll/q7m;

    move-result-object v5

    .line 65
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 66
    invoke-interface {v5}, Ll/q7m;->n()V

    .line 67
    :cond_13
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ll/z5h0;->w(Ljava/lang/String;)V

    .line 68
    :cond_14
    sget-object v5, Ll/b240;->W0:Ll/jxd0;

    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_15

    sget-object v5, Ll/b240;->Y0:Ljava/lang/String;

    .line 69
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_15

    sget-object v5, Ll/b240;->Y0:Ljava/lang/String;

    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 71
    sget-object v5, Ll/b240;->W0:Ll/jxd0;

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v6}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 72
    :cond_15
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    move-result-object v5

    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ll/bpe0;->d(Ljava/lang/String;)I

    .line 73
    invoke-static {}, Ll/d79;->j0()Z

    move-result v5

    if-eqz v5, :cond_16

    iget-object v5, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    invoke-virtual {v5, v6}, Ll/b240;->j6(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 75
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->k(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    move-result v5

    if-eqz v5, :cond_16

    if-nez v1, :cond_16

    .line 76
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Y2:I

    invoke-static {v1}, Ll/o1j0;->h(I)V

    .line 77
    :cond_16
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 78
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-boolean v1, v1, Ll/b240;->g:Z

    if-eqz v1, :cond_17

    .line 79
    sget-object v1, Ll/b240;->R0:Ljava/lang/String;

    goto :goto_5

    .line 80
    :cond_17
    sget-object v1, Ll/b240;->S0:Ljava/lang/String;

    .line 81
    :goto_5
    const-string v6, "sourcepage"

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-boolean v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    if-eqz v1, :cond_18

    .line 83
    sget-object v1, Ll/b240;->T0:Ljava/lang/String;

    goto :goto_6

    .line 84
    :cond_18
    sget-object v1, Ll/b240;->U0:Ljava/lang/String;

    .line 85
    :goto_6
    const-string v6, "actiontype"

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v15, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v15, :cond_1a

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 87
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 88
    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    if-eqz v1, :cond_1a

    .line 89
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-boolean v1, v1, Ll/b240;->g:Z

    if-eqz v1, :cond_19

    .line 90
    const-string v1, "p_suggest_user_profile_info_view"

    goto :goto_7

    :cond_19
    move-object v1, v11

    .line 91
    :goto_7
    invoke-static {v1}, Ll/gp5;->i(Ljava/lang/String;)V

    .line 92
    :cond_1a
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->k(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    move-result v1

    iget-boolean v8, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->e:Z

    iget-object v6, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-boolean v9, v6, Ll/b240;->g:Z

    const/4 v7, 0x1

    move-object v6, v3

    .line 93
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->i(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 94
    invoke-static {}, Ll/vq8;->b()Z

    move-result v1

    const-string v3, ""

    if-eqz v1, :cond_1c

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v1

    iget-object v4, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 98
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v4

    invoke-interface {v4}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v4

    invoke-virtual {v4}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v1, v4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 99
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v4

    iget-object v5, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->lt(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;

    move-result-object v4

    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v5

    iget-object v6, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1b

    move-object v5, v3

    .line 102
    :cond_1b
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v4, v1, v5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->y(Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    :cond_1c
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v1

    iget-object v4, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 106
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v4

    invoke-interface {v4}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v4

    invoke-virtual {v4}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    invoke-interface {v1, v4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserVirtualVoiceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1e

    .line 108
    invoke-static {}, Ll/gra;->x1()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 109
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    move-result-object v1

    invoke-interface {v1}, Ll/f1g0;->o()Ll/ik4;

    move-result-object v1

    invoke-virtual {v1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v4

    iget-object v5, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zl(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;

    move-result-object v4

    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v5

    iget-object v6, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1d

    move-object v5, v3

    .line 112
    :cond_1d
    invoke-virtual {v0, v4, v1, v5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->z(Lcom/p1/mobile/putong/data/VoiceLiveState;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 113
    :cond_1e
    invoke-static {}, Ll/d79;->V()Z

    move-result v1

    const-wide/16 v4, 0x0

    if-eqz v1, :cond_1f

    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/a;->s()Ll/byd0;

    move-result-object v1

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v1, v6, v4

    if-gez v1, :cond_1f

    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/a;->s()Ll/byd0;

    move-result-object v1

    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->h:Ll/byd0;

    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v1, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 116
    :cond_1f
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->X:Ll/byd0;

    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->h:Ll/byd0;

    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v1, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 117
    invoke-static {}, Ll/pgj;->c()Z

    move-result v1

    if-nez v1, :cond_22

    .line 118
    invoke-static {}, Ll/nmp;->e()Z

    move-result v1

    if-eqz v1, :cond_20

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->D2()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_20

    .line 120
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->d2()V

    .line 121
    :cond_20
    invoke-static {}, Ll/nmp;->a()Z

    move-result v1

    if-eqz v1, :cond_21

    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->h2()Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    move-result-object v1

    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 124
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->f2()V

    .line 125
    :cond_21
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v1}, Ll/b240;->N8()Z

    move-result v1

    if-nez v1, :cond_22

    .line 126
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 127
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v1, v12}, Ll/b240;->T8(Z)V

    .line 128
    :cond_22
    invoke-static {}, Ll/d79;->j0()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 129
    sget-object v1, Ll/fcp;->f:Lrx/subjects/a;

    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_23

    .line 130
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-ne v1, v6, :cond_24

    .line 131
    :cond_23
    invoke-static {}, Ll/nmp;->f()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 132
    invoke-static {}, Ll/fcp;->y()Z

    .line 133
    :cond_24
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->g:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 134
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->h:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 135
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->b1:Lrx/subjects/a;

    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v6, v12

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 136
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->N0:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v1, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 137
    invoke-static {}, Ll/v83;->d()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 138
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->g6()V

    :cond_25
    if-eqz v2, :cond_26

    .line 139
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v1

    invoke-virtual {v1}, Ll/z5h0;->I()Z

    move-result v1

    if-nez v1, :cond_26

    .line 140
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v1

    iget-object v1, v1, Ll/z5h0;->f:Ll/jxd0;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 141
    :cond_26
    invoke-static {}, Ll/z5h0;->p()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 142
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->j6()V

    .line 143
    :cond_27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->O0:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 144
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->P0:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    goto :goto_8

    .line 145
    :cond_28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->O0:Ll/byd0;

    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 146
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->P0:Ll/byd0;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 147
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->Q0:Ll/byd0;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 148
    :goto_8
    iget-object v1, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v1, v2, :cond_29

    .line 149
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->Q0:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v4}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 150
    :cond_29
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->i:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v8

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v4}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 151
    sget-object v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    invoke-virtual {v1}, Ll/tl9;->a()Ll/ikh0;

    move-result-object v1

    iget-object v1, v1, Ll/ikh0;->i:Ll/byd0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->g:Ll/byd0;

    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v1, v4}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 152
    sget-object v1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    invoke-virtual {v1}, Ll/tl9;->a()Ll/ikh0;

    move-result-object v1

    iget v4, v1, Ll/ikh0;->d:I

    add-int/2addr v4, v12

    iput v4, v1, Ll/ikh0;->d:I

    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->w()V

    .line 154
    invoke-static {}, Ll/rxf;->b()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 155
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    move-result-object v0

    invoke-virtual {v0}, Ll/hlh0;->b()Z

    move-result v0

    if-nez v0, :cond_2a

    .line 156
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v0

    invoke-static {v0}, Ll/rxf;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 157
    :cond_2a
    invoke-static {}, Ll/spl0;->G()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->q()Lcom/p1/mobile/putong/core/ui/match/b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/b;->k()V

    .line 159
    :cond_2b
    invoke-static {}, Ll/s7a;->k()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 160
    invoke-static {}, Ll/xei;->c()Ll/xei;

    move-result-object v0

    invoke-virtual {v0}, Ll/xei;->d()V

    .line 161
    :cond_2c
    invoke-static {}, Ll/gra;->N3()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 162
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v0, v15, :cond_2d

    .line 163
    const-string v3, "dislike"

    goto :goto_9

    :cond_2d
    if-ne v0, v14, :cond_2e

    .line 164
    const-string v3, "superlike"

    goto :goto_9

    :cond_2e
    if-ne v0, v2, :cond_2f

    .line 165
    const-string v3, "like"

    .line 166
    :cond_2f
    :goto_9
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    move-result v0

    if-eqz v0, :cond_30

    const-string v0, "profile"

    goto :goto_a

    :cond_30
    const-string v0, "card"

    .line 168
    :goto_a
    const-string v1, "clone_swipe_scene"

    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v0

    const-string v1, "actionname"

    .line 169
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    move-result-object v1

    filled-new-array {v0, v1}, [Ll/sfj0$a;

    move-result-object v0

    .line 170
    const-string v1, "e_clone_ui_swipe"

    invoke-static {v1, v11, v0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 171
    :cond_31
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->t()V

    .line 172
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v0, v13}, Ll/b240;->Y8(Z)V

    .line 173
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v0, v13}, Ll/b240;->X8(Z)V

    .line 174
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v0, v13}, Ll/b240;->V8(Z)V

    .line 175
    iget-object v0, v10, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v0, v13}, Ll/b240;->U8(Z)V

    .line 176
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    return-object v0
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->k:Z

    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->j:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    add-int/2addr v1, v2

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->l:Z

    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->c8(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p0, p0, Ll/dkb;->P0:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    sget p0, Ll/m7k;->a:I

    .line 24
    .line 25
    int-to-long v2, p0

    .line 26
    cmp-long p0, v0, v2

    .line 27
    .line 28
    if-ltz p0, :cond_0

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dkb;->Q0:Ll/byd0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    sget p0, Ll/m7k;->b:I

    .line 47
    .line 48
    int-to-long v2, p0

    .line 49
    cmp-long p0, v0, v2

    .line 50
    .line 51
    if-ltz p0, :cond_0

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_0

    .line 66
    .line 67
    invoke-static {}, Ll/rbb0;->q()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    iget-object p0, p0, Ll/dkb;->S0:Ll/jxd0;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_0

    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    iget-object p0, p0, Ll/dkb;->S0:Ll/jxd0;

    .line 96
    .line 97
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/dkb;->S7()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    :cond_0
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final y(Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->ongoingCall:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    const-string v0, "liveId"

    .line 13
    .line 14
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string p3, "anchorId"

    .line 19
    .line 20
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string p2, "index"

    .line 25
    .line 26
    const-string p3, "NA"

    .line 27
    .line 28
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string p2, ""

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    move-object p0, p2

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const-string p0, "\u8fde\u7ebf"

    .line 39
    .line 40
    :goto_1
    const-string p3, "show_label"

    .line 41
    .line 42
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/UserLiveState;->isLiveOpened()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    const-string p0, "on"

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    :goto_2
    const-string p0, "off"

    .line 59
    .line 60
    :goto_3
    const-string p1, "live_status"

    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const-string p0, "module"

    .line 67
    .line 68
    const-string p1, "page"

    .line 69
    .line 70
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    const-string p0, "trace_id"

    .line 75
    .line 76
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    const-string p0, "right_recommend_type"

    .line 81
    .line 82
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    const-string p0, "liveRecommendCategory"

    .line 91
    .line 92
    const-string p1, "basic"

    .line 93
    .line 94
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    filled-new-array/range {v1 .. v10}, [Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "e_live_room_enter"

    .line 103
    .line 104
    const-string p2, "p_suggest_users_home_view"

    .line 105
    .line 106
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/data/VoiceLiveState;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p3, "p_suggest_users_home_view"

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;->s(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/VoiceLiveState;)Ljava/util/HashMap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "e_live_audio_room_enter"

    .line 8
    .line 9
    invoke-static {p1, p3, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
