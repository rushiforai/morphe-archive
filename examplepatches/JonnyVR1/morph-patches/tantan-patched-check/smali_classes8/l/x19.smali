.class public Ll/x19;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile d:Ll/x19;


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/PushMessage;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Landroid/widget/PopupWindow;

.field public c:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/PushMessage;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/RecallMatch;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    const-string v1, "reject"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/d19;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ll/x19;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x19;->C(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f()V
    .locals 1

    .line 1
    const-string v0, "\u62db\u547c\u53d1\u9001\u6210\u529f"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x19;->z(Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/x19;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x19;->E(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V

    return-void
.end method

.method public static synthetic i(Ll/pf60;Lcom/p1/mobile/putong/data/User;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    const-string v1, "reject"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/d19;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l(Ll/pf60;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/u19;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/u19;-><init>(Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    const-string v1, "back_show"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/d19;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/RecallMatch;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RecallMatch;->matched:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic o(Ljava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    const-string v0, "back_online"

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/d19;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-static {p1, p0, p2, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic q(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x19;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    return-void
.end method

.method public static synthetic r(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x19;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/x19;->B(Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x19;->I(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V

    return-void
.end method

.method public static w()Ll/x19;
    .locals 2

    .line 1
    sget-object v0, Ll/x19;->d:Ll/x19;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/x19;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/x19;->d:Ll/x19;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/x19;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/x19;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/x19;->d:Ll/x19;

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
    sget-object v0, Ll/x19;->d:Ll/x19;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_recall_match_big_cancel"

    .line 2
    .line 3
    const-string v0, "p_recall_match_popup_big"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p3, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/widget/PopupWindow;->dismiss()V

    .line 11
    .line 12
    .line 13
    new-instance p3, Ll/n19;

    .line 14
    .line 15
    invoke-direct {p3, p2}, Ll/n19;-><init>(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p3}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 23
    .line 24
    return-void
.end method

.method public final synthetic B(Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_1

    .line 6
    .line 7
    iget-object p4, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 8
    .line 9
    invoke-virtual {p4}, Landroid/widget/PopupWindow;->dismiss()V

    .line 10
    .line 11
    .line 12
    iget-boolean p4, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 13
    .line 14
    if-eqz p4, :cond_0

    .line 15
    .line 16
    const-string p3, "match_uid"

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    filled-new-array {p2}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string p3, "e_recall_match_confirm"

    .line 29
    .line 30
    const-string p4, "p_recall_match_popup"

    .line 31
    .line 32
    invoke-static {p3, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance p4, Ll/l19;

    .line 37
    .line 38
    invoke-direct {p4}, Ll/l19;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {p3, p4}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    const-string p3, "match_invitation_confirm_type"

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    filled-new-array {p2}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string p3, "e_match_invitation_confirm"

    .line 57
    .line 58
    const-string p4, "p_match_invitation_popup"

    .line 59
    .line 60
    invoke-static {p3, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 64
    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    iput-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p3, p1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string p3, "e_recall_match_cancel"

    .line 6
    .line 7
    const-string v0, "p_recall_match_popup"

    .line 8
    .line 9
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p3, "e_match_invitation_cancel"

    .line 14
    .line 15
    const-string v0, "p_match_invitation_popup"

    .line 16
    .line 17
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    const/4 p3, 0x0

    .line 21
    iput-object p3, p0, Ll/x19;->c:Ll/pf60;

    .line 22
    .line 23
    iget-object v0, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/m19;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/m19;-><init>(Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    iput-object p3, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 37
    .line 38
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, p2}, Ll/x19;->J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 5

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/data/PushMessage;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 17
    .line 18
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 19
    .line 20
    const-wide/16 v3, 0x0

    .line 21
    .line 22
    cmpl-double v1, v1, v3

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 31
    .line 32
    double-to-long v3, v3

    .line 33
    cmp-long v1, v1, v3

    .line 34
    .line 35
    if-lez v1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    new-instance v1, Ll/s19;

    .line 44
    .line 45
    invoke-direct {v1, v0}, Ll/s19;-><init>(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    invoke-static {}, Ll/gra;->n3()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    const/4 v0, 0x0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    const-string p2, ""

    .line 67
    .line 68
    invoke-static {p1, p0, v0, p2}, Ll/pdi;->b0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    invoke-virtual {p0, p1, p2, v0}, Ll/wgx;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_7

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->new_()Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 103
    .line 104
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 107
    .line 108
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 109
    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 125
    .line 126
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 131
    .line 132
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 133
    .line 134
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 135
    .line 136
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 137
    .line 138
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 145
    .line 146
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 147
    .line 148
    iput v0, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 149
    .line 150
    :cond_5
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 151
    .line 152
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_6

    .line 157
    .line 158
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_6

    .line 167
    .line 168
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 169
    .line 170
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 171
    .line 172
    invoke-static {p2}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 177
    .line 178
    :cond_6
    new-instance p2, Ll/t19;

    .line 179
    .line 180
    invoke-direct {p2, p0, p1, v1}, Ll/t19;-><init>(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0, p1, v1, p2}, Ll/x19;->H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V

    .line 184
    .line 185
    .line 186
    :cond_7
    :goto_0
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    invoke-direct {v1, p1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/x19;->c:Ll/pf60;

    .line 22
    .line 23
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 28
    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/dkb;->a8()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object p1, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 43
    .line 44
    iget-object p0, p0, Ll/x19;->c:Ll/pf60;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public G(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 5
    .line 6
    new-instance v1, Ll/p19;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/p19;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/q19;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/q19;-><init>(Ll/x19;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/r19;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/r19;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->tracker:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    new-instance v1, Ll/x19$a;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1, p2, p3}, Ll/x19$a;-><init>(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 64
    .line 65
    .line 66
    :cond_3
    :goto_0
    return-void
.end method

.method public final I(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x19;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    const-string v0, "accept"

    .line 6
    .line 7
    invoke-virtual {p0, v0, p2}, Ll/d19;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p2, Ll/v19;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/v19;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p2, 0x1

    .line 21
    invoke-virtual {p0, p2}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p2, Ll/w19;

    .line 26
    .line 27
    invoke-direct {p2, p3}, Ll/w19;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p2, Ll/f19;

    .line 39
    .line 40
    invoke-direct {p2, p3, p1}, Ll/f19;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/g19;

    .line 44
    .line 45
    invoke-direct {p1}, Ll/g19;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public K(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d19;->E3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/e19;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/e19;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/o19;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/o19;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ll/psd0;->F()Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Ll/x19;->c:Ll/pf60;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 37
    .line 38
    iget-object p0, p0, Ll/x19;->c:Ll/pf60;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-virtual {p0}, Lrx/subjects/b;->onCompleted()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/x19;->d:Ll/x19;

    .line 18
    .line 19
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/x19;->c:Ll/pf60;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/x19;->a:Lrx/subjects/b;

    .line 18
    .line 19
    iget-object p0, p0, Ll/x19;->c:Ll/pf60;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/dkb;->a8()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

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
    iget-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Ll/x20;)V
    .locals 12

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x13

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/lit8 v0, v0, 0x50

    .line 13
    .line 14
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/x19;->y(Lcom/p1/mobile/putong/data/Gender;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const-string v1, "\u5979"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string v1, "\u4ed6"

    .line 26
    .line 27
    :goto_0
    invoke-static {}, Ll/d09;->j()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/16 v3, 0x14

    .line 32
    .line 33
    const-string v4, ""

    .line 34
    .line 35
    const/16 v5, 0x3e8

    .line 36
    .line 37
    if-eqz v2, :cond_4

    .line 38
    .line 39
    iget-boolean v2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 40
    .line 41
    if-eqz v2, :cond_4

    .line 42
    .line 43
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v6, "%s\u559c\u6b22\u4e86\u4f60\uff0c\u4f60\u4eec\u7684\u5339\u914d\u5ea6\u9ad8\u8fbe%d%%"

    .line 54
    .line 55
    invoke-static {v2, v6, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v6, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 60
    .line 61
    if-lez v6, :cond_1

    .line 62
    .line 63
    if-ge v6, v5, :cond_1

    .line 64
    .line 65
    sget-object v3, Ll/q8g0;->b:Ljava/text/DecimalFormat;

    .line 66
    .line 67
    int-to-float v4, v6

    .line 68
    const/high16 v5, 0x447a0000    # 1000.0f

    .line 69
    .line 70
    div-float/2addr v4, v5

    .line 71
    float-to-double v4, v4

    .line 72
    invoke-virtual {v3, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v3, "%s\u5f53\u524d\u5728\u7ebf \u00b7 \u76f8\u8ddd%skm"

    .line 81
    .line 82
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    if-lez v6, :cond_2

    .line 88
    .line 89
    div-int/lit16 v7, v6, 0x3e8

    .line 90
    .line 91
    if-ge v7, v3, :cond_2

    .line 92
    .line 93
    div-int/2addr v6, v5

    .line 94
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v3, "%s\u5f53\u524d\u5728\u7ebf \u00b7 \u76f8\u8ddd%dkm"

    .line 103
    .line 104
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    goto :goto_2

    .line 109
    :cond_2
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_3

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->zodiac:Ljava/lang/String;

    .line 119
    .line 120
    :goto_1
    filled-new-array {v1, v4}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const-string v2, "%s\u5f53\u524d\u5728\u7ebf \u00b7 %s"

    .line 125
    .line 126
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    goto :goto_2

    .line 131
    :cond_4
    iget-boolean v2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 132
    .line 133
    if-eqz v2, :cond_5

    .line 134
    .line 135
    const-string v0, "%s\u559c\u6b22\u4e86\u4f60\uff0c\u671f\u5f85\u56de\u590d"

    .line 136
    .line 137
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    goto :goto_2

    .line 146
    :cond_5
    iget v1, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->distance:I

    .line 147
    .line 148
    if-lez v1, :cond_6

    .line 149
    .line 150
    div-int/2addr v1, v5

    .line 151
    if-ge v1, v3, :cond_6

    .line 152
    .line 153
    const-string v0, "\u4f60\u4eec\u8ddd\u79bb\u5f88\u8fd1\uff0c\u7acb\u5373\u804a\u5929\u8ba4\u8bc6"

    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_6
    const/16 v1, 0x5a

    .line 157
    .line 158
    if-le v0, v1, :cond_7

    .line 159
    .line 160
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 161
    .line 162
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    const-string v2, "\u5339\u914d\u5ea6%d%%\uff0c\u7acb\u5373\u804a\u5929\u8ba4\u8bc6"

    .line 171
    .line 172
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    goto :goto_2

    .line 177
    :cond_7
    const-string v0, "\u6b63\u7b49\u4f60\u804a\u5929\uff0c\u5feb\u6253\u4e2a\u62db\u547c"

    .line 178
    .line 179
    :goto_2
    iget-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 180
    .line 181
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_8

    .line 186
    .line 187
    iget-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 188
    .line 189
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_8

    .line 194
    .line 195
    iget-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 196
    .line 197
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 198
    .line 199
    .line 200
    :cond_8
    invoke-static {}, Ll/d09;->j()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    const-string v2, "match_uid"

    .line 205
    .line 206
    const/16 v3, 0xa

    .line 207
    .line 208
    const/4 v5, 0x2

    .line 209
    const/16 v6, 0x31

    .line 210
    .line 211
    const/4 v7, 0x0

    .line 212
    const/4 v8, 0x3

    .line 213
    const/4 v9, 0x0

    .line 214
    if-eqz v1, :cond_a

    .line 215
    .line 216
    iget-boolean v1, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 217
    .line 218
    if-eqz v1, :cond_a

    .line 219
    .line 220
    new-instance v1, Landroid/widget/PopupWindow;

    .line 221
    .line 222
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 223
    .line 224
    .line 225
    move-result-object v10

    .line 226
    sget v11, Ll/kec0;->N3:I

    .line 227
    .line 228
    invoke-virtual {v10, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    invoke-static {}, Ll/bnl0;->y0()I

    .line 233
    .line 234
    .line 235
    move-result v10

    .line 236
    const/high16 v11, 0x436c0000    # 236.0f

    .line 237
    .line 238
    invoke-static {v11}, Ll/qa00;->d(F)I

    .line 239
    .line 240
    .line 241
    move-result v11

    .line 242
    invoke-direct {v1, v7, v10, v11, v9}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 243
    .line 244
    .line 245
    iput-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 246
    .line 247
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    invoke-virtual {v7}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    invoke-static {p1}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 256
    .line 257
    .line 258
    move-result v10

    .line 259
    invoke-virtual {v1, v7, v6, v9, v10}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 263
    .line 264
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    sget v6, Ll/adc0;->L6:I

    .line 269
    .line 270
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    check-cast v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;

    .line 275
    .line 276
    iget-object v6, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 277
    .line 278
    if-eqz v6, :cond_e

    .line 279
    .line 280
    if-eqz v1, :cond_e

    .line 281
    .line 282
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->a0()Z

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    if-eqz v6, :cond_9

    .line 287
    .line 288
    goto/16 :goto_4

    .line 289
    .line 290
    :cond_9
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->g:Lv/VText;

    .line 291
    .line 292
    invoke-static {v8}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 293
    .line 294
    .line 295
    move-result-object v7

    .line 296
    const/4 v9, 0x1

    .line 297
    invoke-virtual {v6, v7, v9}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 298
    .line 299
    .line 300
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->i:Lv/VButton;

    .line 301
    .line 302
    invoke-static {v8}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 303
    .line 304
    .line 305
    move-result-object v7

    .line 306
    invoke-virtual {v6, v7, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 307
    .line 308
    .line 309
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->g:Lv/VText;

    .line 310
    .line 311
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    .line 313
    .line 314
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 315
    .line 316
    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->k:Lv/VDraweeView;

    .line 317
    .line 318
    iget-object v7, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v4, v6, v7, v5, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 321
    .line 322
    .line 323
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->h:Lv/VText;

    .line 324
    .line 325
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    .line 327
    .line 328
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->i:Lv/VButton;

    .line 329
    .line 330
    new-instance v3, Ll/h19;

    .line 331
    .line 332
    invoke-direct {v3, p0, p3, p2}, Ll/h19;-><init>(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    .line 333
    .line 334
    .line 335
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 336
    .line 337
    .line 338
    iget-object p3, v1, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthPushPopView;->f:Lv/VImage;

    .line 339
    .line 340
    new-instance v0, Ll/i19;

    .line 341
    .line 342
    invoke-direct {v0, p0, p1, p2}, Ll/i19;-><init>(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    .line 343
    .line 344
    .line 345
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 346
    .line 347
    .line 348
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 349
    .line 350
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    filled-new-array {p0}, [Ll/pf60;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    const-string p1, "e_recall_match_big_confirm"

    .line 359
    .line 360
    const-string p2, "p_recall_match_popup_big"

    .line 361
    .line 362
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 363
    .line 364
    .line 365
    const-string p0, "e_recall_match_big_cancel"

    .line 366
    .line 367
    invoke-static {p0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    return-void

    .line 371
    :cond_a
    new-instance v1, Landroid/widget/PopupWindow;

    .line 372
    .line 373
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    sget v10, Ll/kec0;->O3:I

    .line 378
    .line 379
    invoke-virtual {v4, v10, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    invoke-static {}, Ll/bnl0;->y0()I

    .line 384
    .line 385
    .line 386
    move-result v7

    .line 387
    const/high16 v10, 0x41800000    # 16.0f

    .line 388
    .line 389
    invoke-static {v10}, Ll/bnl0;->w(F)I

    .line 390
    .line 391
    .line 392
    move-result v10

    .line 393
    sub-int/2addr v7, v10

    .line 394
    const/high16 v10, 0x42900000    # 72.0f

    .line 395
    .line 396
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 397
    .line 398
    .line 399
    move-result v10

    .line 400
    invoke-direct {v1, v4, v7, v10, v9}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 401
    .line 402
    .line 403
    iput-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 404
    .line 405
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 410
    .line 411
    .line 412
    move-result-object v4

    .line 413
    invoke-static {p1}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 414
    .line 415
    .line 416
    move-result v7

    .line 417
    const/high16 v10, 0x41200000    # 10.0f

    .line 418
    .line 419
    invoke-static {v10}, Ll/bnl0;->w(F)I

    .line 420
    .line 421
    .line 422
    move-result v10

    .line 423
    add-int/2addr v7, v10

    .line 424
    invoke-virtual {v1, v4, v6, v9, v7}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 425
    .line 426
    .line 427
    iget-object v1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 428
    .line 429
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    sget v4, Ll/adc0;->Jb:I

    .line 434
    .line 435
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 436
    .line 437
    .line 438
    move-result-object v1

    .line 439
    check-cast v1, Lv/VRelative;

    .line 440
    .line 441
    iget-object v4, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 442
    .line 443
    if-eqz v4, :cond_e

    .line 444
    .line 445
    if-nez v1, :cond_b

    .line 446
    .line 447
    goto/16 :goto_4

    .line 448
    .line 449
    :cond_b
    sget v4, Ll/adc0;->k3:I

    .line 450
    .line 451
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v4

    .line 455
    check-cast v4, Lv/VDraweeView;

    .line 456
    .line 457
    sget v6, Ll/adc0;->Ge:I

    .line 458
    .line 459
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 460
    .line 461
    .line 462
    move-result-object v6

    .line 463
    check-cast v6, Lv/VText;

    .line 464
    .line 465
    sget v7, Ll/adc0;->Fe:I

    .line 466
    .line 467
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 468
    .line 469
    .line 470
    move-result-object v7

    .line 471
    check-cast v7, Lv/VText;

    .line 472
    .line 473
    sget v9, Ll/adc0;->A1:I

    .line 474
    .line 475
    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 476
    .line 477
    .line 478
    move-result-object v9

    .line 479
    check-cast v9, Lv/VImage;

    .line 480
    .line 481
    sget v10, Ll/adc0;->C0:I

    .line 482
    .line 483
    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    check-cast v1, Lv/VText;

    .line 488
    .line 489
    invoke-static {v8}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 490
    .line 491
    .line 492
    move-result-object v8

    .line 493
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 494
    .line 495
    .line 496
    iget-object v8, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->name:Ljava/lang/String;

    .line 497
    .line 498
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 502
    .line 503
    .line 504
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 505
    .line 506
    if-eqz v0, :cond_c

    .line 507
    .line 508
    const-string v0, "#ffffff"

    .line 509
    .line 510
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 515
    .line 516
    .line 517
    sget v0, Ll/dbc0;->u:I

    .line 518
    .line 519
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 520
    .line 521
    .line 522
    const-string v0, "\u7acb\u5373\u804a\u5929"

    .line 523
    .line 524
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 525
    .line 526
    .line 527
    goto :goto_3

    .line 528
    :cond_c
    const-string v0, "#4C000000"

    .line 529
    .line 530
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 531
    .line 532
    .line 533
    move-result v0

    .line 534
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 535
    .line 536
    .line 537
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 538
    .line 539
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 540
    .line 541
    .line 542
    sget v0, Ll/dbc0;->f0:I

    .line 543
    .line 544
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 545
    .line 546
    .line 547
    :goto_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 548
    .line 549
    iget-object v6, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->url:Ljava/lang/String;

    .line 550
    .line 551
    invoke-virtual {v0, v4, v6, v5, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 552
    .line 553
    .line 554
    new-instance v0, Ll/j19;

    .line 555
    .line 556
    invoke-direct {v0, p0, p3, p2, p1}, Ll/j19;-><init>(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;)V

    .line 557
    .line 558
    .line 559
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 560
    .line 561
    .line 562
    new-instance p3, Ll/k19;

    .line 563
    .line 564
    invoke-direct {p3, p0, p2, p1}, Ll/k19;-><init>(Ll/x19;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;)V

    .line 565
    .line 566
    .line 567
    invoke-static {v9, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 568
    .line 569
    .line 570
    iget-boolean p0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->isPassive:Z

    .line 571
    .line 572
    if-eqz p0, :cond_d

    .line 573
    .line 574
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 575
    .line 576
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 577
    .line 578
    .line 579
    move-result-object p0

    .line 580
    filled-new-array {p0}, [Ll/pf60;

    .line 581
    .line 582
    .line 583
    move-result-object p0

    .line 584
    const-string p1, "e_recall_match_confirm"

    .line 585
    .line 586
    const-string p2, "p_recall_match_popup"

    .line 587
    .line 588
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 589
    .line 590
    .line 591
    const-string p0, "e_recall_match_cancel"

    .line 592
    .line 593
    invoke-static {p0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    return-void

    .line 597
    :cond_d
    const-string p0, "match_invitation_confirm_type"

    .line 598
    .line 599
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->buttonText:Ljava/lang/String;

    .line 600
    .line 601
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 602
    .line 603
    .line 604
    move-result-object p0

    .line 605
    filled-new-array {p0}, [Ll/pf60;

    .line 606
    .line 607
    .line 608
    move-result-object p0

    .line 609
    const-string p1, "e_match_invitation_confirm"

    .line 610
    .line 611
    const-string p2, "p_match_invitation_popup"

    .line 612
    .line 613
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 614
    .line 615
    .line 616
    const-string p0, "e_match_invitation_cancel"

    .line 617
    .line 618
    invoke-static {p0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    .line 620
    .line 621
    :cond_e
    :goto_4
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/data/Gender;)Z
    .locals 0

    .line 1
    const-string p0, "female"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic z(Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V
    .locals 1

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
    iget-object p3, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 8
    .line 9
    invoke-virtual {p3}, Landroid/widget/PopupWindow;->dismiss()V

    .line 10
    .line 11
    .line 12
    const-string p3, "match_uid"

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GrowthPushConfig;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    filled-new-array {p2}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const-string p3, "e_recall_match_big_confirm"

    .line 25
    .line 26
    const-string v0, "p_recall_match_popup_big"

    .line 27
    .line 28
    invoke-static {p3, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ll/x20;->call()V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-object p1, p0, Ll/x19;->b:Landroid/widget/PopupWindow;

    .line 36
    .line 37
    :cond_0
    return-void
.end method
