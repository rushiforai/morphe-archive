.class public Ll/x150;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/l050;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VFrame;

.field public C:Lv/VFrame;

.field public D:Lv/VFrame;

.field public E:Lv/VFrame;

.field public F:Lv/VFrame;

.field public G:Ll/l050;

.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VScroll;

.field public e:Lv/VText;

.field public f:Lv/VFrame;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VFrame;

.field public j:Lv/VFrame;

.field public k:Lv/VFrame;

.field public l:Lv/VText;

.field public m:Lv/VFrame;

.field public n:Lv/VFrame;

.field public o:Lv/VFrame;

.field public p:Lv/VFrame;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VFrame;

.field public t:Lv/VText;

.field public u:Lv/VFrame;

.field public v:Lv/VText;

.field public w:Lv/VFrame;

.field public x:Lv/VText;

.field public y:Lv/VFrame;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "other"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic C(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->c0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->Z(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "push_switch"

    .line 2
    .line 3
    const-string v0, "on_off"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_beep_switch"

    .line 14
    .line 15
    const-string v1, "p_message_push_settings"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/iz40;->A()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic G(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "push_switch"

    .line 2
    .line 3
    const-string v0, "on_off"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_push_buzz_swicth"

    .line 14
    .line 15
    const-string v1, "p_message_push_settings"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/iz40;->A()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic I()Ljava/util/List;
    .locals 2

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "match"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic J(Ll/x150;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->m0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x150;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "off"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "on"

    .line 13
    .line 14
    :goto_0
    const-string v1, "push_status"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "e_receive_push_switch"

    .line 25
    .line 26
    const-string v2, "p_message_push_settings"

    .line 27
    .line 28
    invoke-static {v1, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-ne p0, v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/iz40;->A()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static synthetic P(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x150;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static S()Ljava/util/Map;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/g150;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/g150;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "\u6240\u6709\u4eba"

    .line 12
    .line 13
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/h150;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/h150;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 22
    .line 23
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/j150;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/j150;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 32
    .line 33
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/k150;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/k150;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v2, "\u914d\u5bf9\u597d\u53cb"

    .line 42
    .line 43
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/l150;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/l150;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v2, "\u964c\u751f\u4eba"

    .line 52
    .line 53
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/m150;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/m150;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v2, "\u5173\u95ed"

    .line 62
    .line 63
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public static W()Ljava/util/Map;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/g150;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/g150;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 12
    .line 13
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/n150;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/n150;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 22
    .line 23
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/o150;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/o150;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "\u914d\u5bf9\u597d\u53cb"

    .line 32
    .line 33
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/p150;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/p150;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v2, "\u5173\u95ed"

    .line 42
    .line 43
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/x150;->F:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p1, Ll/qt4;->e:Ll/jxd0;

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Ll/x150;Ljava/util/ArrayList;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/x150;->o0(Ljava/util/ArrayList;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic b()Ljava/util/List;
    .locals 1

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static synthetic c()Ljava/util/List;
    .locals 1

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static synthetic d(Ll/x150;Ljava/util/Map;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/x150;->n0(Ljava/util/Map;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic e(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f()Ljava/util/List;
    .locals 2

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "other"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic i(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->e0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->i:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_detail_switch"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->i:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->m0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic j(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->f0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->m:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_new_match_swicth"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->m:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->G0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic k(Ll/x150;Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x150;->q0(Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V

    return-void
.end method

.method public static synthetic l(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x150;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->a0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n()Ljava/util/List;
    .locals 3

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "match"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "other"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic s(Ll/x150;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x150;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->b0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v()Ljava/util/List;
    .locals 1

    .line 1
    const-string v0, "other"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/data/MomentNotifyBlockType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic x()Ljava/util/List;
    .locals 2

    .line 1
    const-string v0, "like"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "match"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic y()Ljava/util/List;
    .locals 2

    .line 1
    const-string v0, "other"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "like"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic z(Ll/x150;Ljava/util/List;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/x150;->p0(Ljava/util/List;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/y150;->b(Ll/x150;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R(Ll/l050;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    return-void
.end method

.method public final T(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u6240\u6709\u4eba"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v0, 0x2

    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    new-instance p0, Ll/c150;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/c150;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const-string p0, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-ne p0, v0, :cond_2

    .line 36
    .line 37
    new-instance p0, Ll/d150;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/d150;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    const-string p0, "\u914d\u5bf9\u597d\u53cb"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-ne p0, v0, :cond_3

    .line 56
    .line 57
    new-instance p0, Ll/e150;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/e150;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    if-nez p0, :cond_3

    .line 67
    .line 68
    const-string p0, "\u964c\u751f\u4eba"

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/4 v0, 0x1

    .line 76
    if-ne p0, v0, :cond_4

    .line 77
    .line 78
    const-string p0, "other"

    .line 79
    .line 80
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/data/MomentNotifyBlockType;

    .line 90
    .line 91
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_4

    .line 96
    .line 97
    const-string p0, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    const/4 p1, 0x3

    .line 105
    if-ne p0, p1, :cond_5

    .line 106
    .line 107
    const-string p0, "\u5173\u95ed"

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_5
    const-string p0, ""

    .line 111
    .line 112
    return-object p0
.end method

.method public final U(Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MomentNotifyBlockType;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ll/y050;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/y050;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-string p0, "\u914d\u5bf9\u597d\u53cb"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    new-instance p0, Ll/z050;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/z050;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    const-string p0, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    const-string p0, "\u5173\u95ed"

    .line 39
    .line 40
    return-object p0
.end method

.method public final V(Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u6240\u6709\u8d26\u53f7\u6d88\u606f"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "all"

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p0, "\u5173\u95ed"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "\u90e8\u5206\u8d26\u53f7\u6d88\u606f"

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x150;->x0(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x150;->U(Ljava/util/List;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/x150;->w0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x150;->T(Ljava/util/List;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/x150;->u0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/NotificationSetting;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x150;->T(Ljava/util/List;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/x150;->v0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->y:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_like_by_moment"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->y:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->F0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->B:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_choose_four"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->B:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->C0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->C:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_state"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->C:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->H0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->D:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_chatting_partner_signal"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->D:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->z0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic h0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->E:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_group"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->E:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->E0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l050;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x150;->R(Ll/l050;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x150;->Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/x150;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->n:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_dialog_message_swicth"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->n:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->A0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p1, p1, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/x150;->o:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "on_off"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "off_on"

    .line 21
    .line 22
    :goto_0
    const-string v1, "push_switch"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_push_greetings_swicth"

    .line 33
    .line 34
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/x150;->G:Ll/l050;

    .line 38
    .line 39
    iget-object p0, p0, Ll/x150;->o:Lv/VFrame;

    .line 40
    .line 41
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Ll/l050;->D0(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic m0(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l050;->n0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic n0(Ljava/util/Map;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/pcj;

    .line 6
    .line 7
    iget-object p3, p0, Ll/x150;->G:Ll/l050;

    .line 8
    .line 9
    iget-object p3, p3, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 10
    .line 11
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Ljava/lang/String;

    .line 20
    .line 21
    const-string p4, "push_scope_choose"

    .line 22
    .line 23
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    filled-new-array {p2}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string p4, "e_push_moment_comment"

    .line 32
    .line 33
    invoke-static {p4, p3, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/l050;->t0(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic o0(Ljava/util/ArrayList;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p3, p3, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    const-string p4, "push_scope_choose"

    .line 16
    .line 17
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p4, "e_push_moment_like"

    .line 26
    .line 27
    invoke-static {p4, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p2, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/pcj;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/l050;->u0(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic p0(Ljava/util/List;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/x150;->G:Ll/l050;

    .line 2
    .line 3
    iget-object p3, p3, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-interface {p1, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    const-string p4, "push_scope_choose"

    .line 16
    .line 17
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p4, "e_push_moment_renew"

    .line 26
    .line 27
    invoke-static {p4, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p2, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/pcj;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/l050;->x0(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;->getSelectBlockingIds()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/x150;->G:Ll/l050;

    .line 6
    .line 7
    iget-object v0, v0, Ll/l050;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/notification/NotificationOptAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const-string v2, "all"

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const-string v2, "none"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string v2, "designated"

    .line 32
    .line 33
    :goto_0
    const-string v1, "push_scope_choose"

    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    filled-new-array {v1}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "e_push_official_accounts"

    .line 44
    .line 45
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/x150;->G:Ll/l050;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/l050;->y0(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x150;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u6d88\u606f\u63d0\u9192\u4e0e\u901a\u77e5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x150;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/m050;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/m050;-><init>(Ll/x150;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/x150;->f:Lv/VFrame;

    .line 19
    .line 20
    new-instance v1, Ll/x050;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/x050;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/x150;->j:Lv/VFrame;

    .line 29
    .line 30
    new-instance v1, Ll/i150;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/i150;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/x150;->k:Lv/VFrame;

    .line 39
    .line 40
    new-instance v1, Ll/q150;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/q150;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/x150;->F:Lv/VFrame;

    .line 49
    .line 50
    sget-object v1, Ll/qt4;->e:Ll/jxd0;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/x150;->F:Lv/VFrame;

    .line 66
    .line 67
    new-instance v1, Ll/r150;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/r150;-><init>(Ll/x150;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/Settings;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/data/NotificationSetting;->new_()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    iget-object v1, p0, Ll/x150;->i:Lv/VFrame;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {v1, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/x150;->i:Lv/VFrame;

    .line 27
    .line 28
    new-instance v1, Ll/s150;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/s150;-><init>(Ll/x150;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/x150;->m:Lv/VFrame;

    .line 37
    .line 38
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->match:Z

    .line 39
    .line 40
    xor-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/x150;->m:Lv/VFrame;

    .line 46
    .line 47
    new-instance v1, Ll/w150;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/w150;-><init>(Ll/x150;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/x150;->n:Lv/VFrame;

    .line 56
    .line 57
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->conversation:Z

    .line 58
    .line 59
    xor-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/x150;->n:Lv/VFrame;

    .line 65
    .line 66
    new-instance v1, Ll/n050;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/n050;-><init>(Ll/x150;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/x150;->o:Lv/VFrame;

    .line 75
    .line 76
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->greeting:Z

    .line 77
    .line 78
    xor-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/x150;->o:Lv/VFrame;

    .line 84
    .line 85
    new-instance v1, Ll/o050;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/o050;-><init>(Ll/x150;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/x150;->q:Lv/VText;

    .line 94
    .line 95
    iget-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->teamAccount:Ljava/util/List;

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Ll/x150;->V(Ljava/util/List;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/x150;->p:Lv/VFrame;

    .line 105
    .line 106
    new-instance v1, Ll/p050;

    .line 107
    .line 108
    invoke-direct {v1, p0, v0}, Ll/p050;-><init>(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/x150;->t:Lv/VText;

    .line 115
    .line 116
    iget-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentUpdate:Ljava/util/List;

    .line 117
    .line 118
    invoke-virtual {p0, v1}, Ll/x150;->U(Ljava/util/List;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/x150;->s:Lv/VFrame;

    .line 126
    .line 127
    new-instance v1, Ll/q050;

    .line 128
    .line 129
    invoke-direct {v1, p0, v0}, Ll/q050;-><init>(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/x150;->v:Lv/VText;

    .line 136
    .line 137
    iget-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentComment:Ljava/util/List;

    .line 138
    .line 139
    invoke-virtual {p0, v1}, Ll/x150;->T(Ljava/util/List;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Ll/x150;->u:Lv/VFrame;

    .line 147
    .line 148
    new-instance v1, Ll/r050;

    .line 149
    .line 150
    invoke-direct {v1, p0, v0}, Ll/r050;-><init>(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/x150;->x:Lv/VText;

    .line 157
    .line 158
    iget-object v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLike:Ljava/util/List;

    .line 159
    .line 160
    invoke-virtual {p0, v1}, Ll/x150;->T(Ljava/util/List;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Ll/x150;->w:Lv/VFrame;

    .line 168
    .line 169
    new-instance v1, Ll/s050;

    .line 170
    .line 171
    invoke-direct {v1, p0, v0}, Ll/s050;-><init>(Ll/x150;Lcom/p1/mobile/putong/data/NotificationSetting;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/x150;->y:Lv/VFrame;

    .line 178
    .line 179
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->momentLiked:Z

    .line 180
    .line 181
    xor-int/lit8 v1, v1, 0x1

    .line 182
    .line 183
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/x150;->y:Lv/VFrame;

    .line 187
    .line 188
    new-instance v1, Ll/t050;

    .line 189
    .line 190
    invoke-direct {v1, p0}, Ll/t050;-><init>(Ll/x150;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Ll/x150;->B:Lv/VFrame;

    .line 197
    .line 198
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->extremePick:Z

    .line 199
    .line 200
    xor-int/lit8 v1, v1, 0x1

    .line 201
    .line 202
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Ll/x150;->B:Lv/VFrame;

    .line 206
    .line 207
    new-instance v1, Ll/u050;

    .line 208
    .line 209
    invoke-direct {v1, p0}, Ll/u050;-><init>(Ll/x150;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 213
    .line 214
    .line 215
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 216
    .line 217
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 218
    .line 219
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    iget-object v1, p0, Ll/x150;->C:Lv/VFrame;

    .line 228
    .line 229
    if-nez p1, :cond_1

    .line 230
    .line 231
    iget-boolean p1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->status:Z

    .line 232
    .line 233
    xor-int/lit8 p1, p1, 0x1

    .line 234
    .line 235
    invoke-static {v1, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Ll/x150;->C:Lv/VFrame;

    .line 239
    .line 240
    new-instance v1, Ll/t150;

    .line 241
    .line 242
    invoke-direct {v1, p0}, Ll/t150;-><init>(Ll/x150;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 246
    .line 247
    .line 248
    goto :goto_0

    .line 249
    :cond_1
    const/4 p1, 0x0

    .line 250
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    :goto_0
    iget-object p1, p0, Ll/x150;->D:Lv/VFrame;

    .line 254
    .line 255
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->chatPartners:Z

    .line 256
    .line 257
    xor-int/lit8 v1, v1, 0x1

    .line 258
    .line 259
    invoke-static {p1, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 260
    .line 261
    .line 262
    iget-object p1, p0, Ll/x150;->D:Lv/VFrame;

    .line 263
    .line 264
    new-instance v1, Ll/u150;

    .line 265
    .line 266
    invoke-direct {v1, p0}, Ll/u150;-><init>(Ll/x150;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0, p1, v1}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Ll/x150;->E:Lv/VFrame;

    .line 273
    .line 274
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/NotificationSetting;->group:Z

    .line 275
    .line 276
    xor-int/lit8 v0, v0, 0x1

    .line 277
    .line 278
    invoke-static {p1, v0}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Ll/x150;->E:Lv/VFrame;

    .line 282
    .line 283
    new-instance v0, Ll/v150;

    .line 284
    .line 285
    invoke-direct {v0, p0}, Ll/v150;-><init>(Ll/x150;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, p1, v0}, Ll/x150;->t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method public s0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    iget-object p0, p0, Ll/x150;->h:Lv/VText;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const-string v0, "\u5173\u95ed"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "\u5f00\u542f"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final t0(Landroid/view/View;Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    new-instance v0, Ll/f150;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/f150;-><init>(Ll/x150;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u0(Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v4, "\u964c\u751f\u4eba"

    .line 2
    .line 3
    const-string v5, "\u5173\u95ed"

    .line 4
    .line 5
    const-string v0, "\u6240\u6709\u4eba"

    .line 6
    .line 7
    const-string v1, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 8
    .line 9
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 10
    .line 11
    const-string v3, "\u914d\u5bf9\u597d\u53cb"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v5, "strangers"

    .line 22
    .line 23
    const-string v6, "none"

    .line 24
    .line 25
    const-string v1, "all"

    .line 26
    .line 27
    const-string v2, "like_friends"

    .line 28
    .line 29
    const-string v3, "like"

    .line 30
    .line 31
    const-string v4, "friends"

    .line 32
    .line 33
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {}, Ll/x150;->S()Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "\u8bc4\u8bba\u901a\u77e5"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "\u6211\u5c06\u6536\u5230\u8fd9\u4e9b\u4eba\u8bc4\u8bba\u6211\u52a8\u6001\u7684\u901a\u77e5"

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->C0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    new-instance v0, Ll/w050;

    .line 79
    .line 80
    invoke-direct {v0, p0, v2, v1}, Ll/w050;-><init>(Ll/x150;Ljava/util/Map;Ljava/util/ArrayList;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->h0(ILcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final v0(Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v4, "\u964c\u751f\u4eba"

    .line 2
    .line 3
    const-string v5, "\u5173\u95ed"

    .line 4
    .line 5
    const-string v0, "\u6240\u6709\u4eba"

    .line 6
    .line 7
    const-string v1, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 8
    .line 9
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 10
    .line 11
    const-string v3, "\u914d\u5bf9\u597d\u53cb"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v5, "strangers"

    .line 22
    .line 23
    const-string v6, "none"

    .line 24
    .line 25
    const-string v1, "all"

    .line 26
    .line 27
    const-string v2, "like_friends"

    .line 28
    .line 29
    const-string v3, "like"

    .line 30
    .line 31
    const-string v4, "friends"

    .line 32
    .line 33
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {}, Ll/x150;->S()Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "\u70b9\u8d5e\u901a\u77e5"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    const-string v4, "\u6211\u5c06\u6536\u5230\u8fd9\u4e9b\u4eba\u70b9\u8d5e\u6211\u52a8\u6001\u7684\u901a\u77e5"

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->C0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    new-instance v0, Ll/a150;

    .line 79
    .line 80
    invoke-direct {v0, p0, v1, v2}, Ll/a150;-><init>(Ll/x150;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->h0(ILcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final w0(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "\u914d\u5bf9\u597d\u53cb"

    .line 2
    .line 3
    const-string v1, "\u5173\u95ed"

    .line 4
    .line 5
    const-string v2, "\u6211\u559c\u6b22\u7684\u4eba\u53ca\u914d\u5bf9\u597d\u53cb"

    .line 6
    .line 7
    const-string v3, "\u6211\u559c\u6b22\u7684\u4eba"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "friends"

    .line 18
    .line 19
    const-string v2, "none"

    .line 20
    .line 21
    const-string v3, "all"

    .line 22
    .line 23
    const-string v4, "like"

    .line 24
    .line 25
    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {}, Ll/x150;->W()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-string v4, "\u52a8\u6001\u66f4\u65b0\u901a\u77e5"

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "\u6211\u5c06\u6536\u5230\u8fd9\u4e9b\u4eba\u7684\u52a8\u6001\u66f4\u65b0\u901a\u77e5"

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->C0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const/4 v4, 0x0

    .line 62
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    new-instance v0, Ll/b150;

    .line 71
    .line 72
    invoke-direct {v0, p0, v1, v2}, Ll/b150;-><init>(Ll/x150;Ljava/util/List;Ljava/util/Map;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->h0(ILcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public x0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->Lc:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;->k(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Lv/VScroll;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/x150;->C0()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {p1, v1}, Lv/VScroll;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "\u5b98\u65b9\u53f7\u901a\u77e5"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "\u6211\u5c06\u6536\u5230\u8fd9\u4e9b\u5b98\u65b9\u53f7\u7684\u6d88\u606f\u901a\u77e5"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->C0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v2, 0x1

    .line 58
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget v1, Lcom/p1/mobile/putong/core/R$string;->k:I

    .line 74
    .line 75
    new-instance v2, Ll/v050;

    .line 76
    .line 77
    invoke-direct {v2, p0, v0}, Ll/v050;-><init>(Ll/x150;Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 85
    .line 86
    .line 87
    return-void
.end method
