.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Landroid/widget/FrameLayout;

.field public F:Ll/qmo;

.field public G:Ll/qam;

.field public H:I

.field public I:I

.field public J:Lcom/p1/mobile/putong/core/data/Conversation;

.field public K:Z

.field public final L:Ljava/lang/Runnable;

.field public z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->C:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->D:Z

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->H:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->K:Z

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->L:Ljava/lang/Runnable;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic M4(Ll/vg60;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    sput-object p0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    :goto_0
    const-string p0, ""

    .line 37
    .line 38
    sput-object p0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/android/app/c;Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->q5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic P4(Ll/mge$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "conversation"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/mge;->k(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic Q4(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->gr()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->s5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    sput-object p0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic V4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->p5(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->o5()V

    return-void
.end method

.method public static synthetic Y4()Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/qam;->f()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static synthetic Z4(Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Ze()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic a5(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic b5(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->n5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->r5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->t5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    return p0
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->K:Z

    return-void
.end method

.method public static i5(Z)Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "isMatchList"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private synthetic n5(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/bem;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {v0, p0}, Ll/bem;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "conversation"

    .line 25
    .line 26
    invoke-virtual {v0, p1, p0}, Ll/bem;->U(Ljava/util/List;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ll/bem;->show()V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 35
    .line 36
    iget-object p0, p0, Ll/mk8;->Z:Ll/vxd0;

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-virtual {p0, p1}, Ll/vxd0;->a(I)V

    .line 40
    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 45
    .line 46
    iget-object p0, p0, Ll/mk8;->Y:Ll/byd0;

    .line 47
    .line 48
    invoke-static {}, Ll/pzi0;->o()J

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method private synthetic o5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->E2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p5(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->F:Ll/qmo;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/qmo;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->F:Ll/qmo;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/qmo;->b()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_5

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p1, v0, :cond_5

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_4

    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->S:Ll/yk30;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {v1, v0, v2}, Ll/p560;->e(Ll/w1m;Z)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/gra;->Y1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->y5()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 63
    .line 64
    const-string v1, "message"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/mk8;->p3(Ljava/lang/String;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/mg6;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/mg6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/ng6;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/ng6;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    :cond_2
    invoke-static {}, Ll/gra;->u3()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    iget-object v0, v0, Ll/dkb;->l1:Ll/byd0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/Long;

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    const-wide/16 v2, 0x0

    .line 122
    .line 123
    cmp-long v0, v0, v2

    .line 124
    .line 125
    if-ltz v0, :cond_3

    .line 126
    .line 127
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 130
    .line 131
    iget-object v0, v0, Ll/dkb;->l1:Ll/byd0;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ljava/lang/Long;

    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 140
    .line 141
    .line 142
    move-result-wide v0

    .line 143
    invoke-static {}, Ll/pzi0;->o()J

    .line 144
    .line 145
    .line 146
    move-result-wide v2

    .line 147
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_3

    .line 152
    .line 153
    new-instance v0, Ll/og6;

    .line 154
    .line 155
    invoke-direct {v0, p0}, Ll/og6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 156
    .line 157
    .line 158
    const-wide/16 v1, 0x3e8

    .line 159
    .line 160
    invoke-static {p0, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 161
    .line 162
    .line 163
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-interface {v0}, Ll/ftn0;->c()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_5

    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-interface {v0, p0}, Ll/ftn0;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_4
    throw v0

    .line 194
    :cond_5
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-eqz p0, :cond_6

    .line 203
    .line 204
    sget-object p0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 205
    .line 206
    if-ne p1, p0, :cond_6

    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ea()V

    .line 213
    .line 214
    .line 215
    :cond_6
    return-void
.end method

.method private synthetic q5(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->B:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "p_messages_view"

    .line 16
    .line 17
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xa(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->D:Z

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private synthetic r5(Ll/pf60;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->B:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "p_messages_view"

    .line 22
    .line 23
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xa(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Ll/bkj0;

    .line 32
    .line 33
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Lcom/p1/mobile/putong/data/Counter;

    .line 36
    .line 37
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 40
    .line 41
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p1, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-static {v0, v2, p1}, Ll/dsc0;->b(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 58
    .line 59
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E7(Lcom/p1/mobile/putong/data/CounterConversations;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    sub-int/2addr p1, v0

    .line 64
    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->D:Z

    .line 66
    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/4 p1, 0x0

    .line 81
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->D:Z

    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method private synthetic s5(Ljava/lang/Boolean;)V
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
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->l5(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public I4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->I4()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->u5(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "isMatchList"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->A:Z

    .line 16
    .line 17
    new-instance v0, Ll/qmo;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/qmo;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->F:Ll/qmo;

    .line 23
    .line 24
    return-void
.end method

.method public f4()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/eg6;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/eg6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "p_messages_view"

    .line 35
    .line 36
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xa(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->W1:Lrx/subjects/b;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/ug6;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/ug6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/vg6;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/vg6;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/g;->Qe()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v3, v3, Ll/mge;->a:Lrx/subjects/a;

    .line 92
    .line 93
    new-instance v4, Ll/wg6;

    .line 94
    .line 95
    invoke-direct {v4}, Ll/wg6;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    new-instance v4, Ll/xg6;

    .line 107
    .line 108
    invoke-direct {v4}, Ll/xg6;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {v0, v1, v2, v3, v4}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/fg6;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/fg6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 122
    .line 123
    .line 124
    new-instance v2, Ll/gg6;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/gg6;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_1

    .line 149
    .line 150
    invoke-static {}, Ll/joa;->M3()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_1

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    new-instance v2, Ll/rg6;

    .line 169
    .line 170
    invoke-direct {v2}, Ll/rg6;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    new-instance v1, Ll/hg6;

    .line 178
    .line 179
    invoke-direct {v1}, Ll/hg6;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    new-instance v1, Ll/ig6;

    .line 187
    .line 188
    invoke-direct {v1}, Ll/ig6;-><init>()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v1, Ll/pg6;

    .line 200
    .line 201
    invoke-direct {v1}, Ll/pg6;-><init>()V

    .line 202
    .line 203
    .line 204
    new-instance v2, Ll/qg6;

    .line 205
    .line 206
    invoke-direct {v2}, Ll/qg6;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 214
    .line 215
    .line 216
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Sj()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_2

    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    new-instance v2, Ll/rg6;

    .line 243
    .line 244
    invoke-direct {v2}, Ll/rg6;-><init>()V

    .line 245
    .line 246
    .line 247
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-instance v1, Ll/sg6;

    .line 252
    .line 253
    invoke-direct {v1}, Ll/sg6;-><init>()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    new-instance v0, Ll/tg6;

    .line 265
    .line 266
    invoke-direct {v0}, Ll/tg6;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 274
    .line 275
    .line 276
    :cond_2
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x3

    .line 9
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ei(I)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->Q1()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Ll/jg6;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/jg6;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/kg6;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/kg6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/lg6;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/lg6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Ll/hbs;->c()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Ll/hbs;->d()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    :goto_0
    return-void

    .line 80
    :cond_3
    :goto_1
    const/4 p1, 0x1

    .line 81
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->l5(Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MsgTabInflate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {p1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->h5()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget v0, Ll/kec0;->oe:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 41
    .line 42
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->p1(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->A:Z

    .line 48
    .line 49
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->g1:Z

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MsgTabDataInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 60
    .line 61
    filled-new-array {p1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->s1(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    return-object p0
.end method

.method public j5()Ll/qmo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->F:Ll/qmo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k5()V
    .locals 0

    .line 1
    return-void
.end method

.method public final l5(Z)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->G:Ll/qam;

    .line 10
    .line 11
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    sget v1, Ll/bnl0;->f:I

    .line 14
    .line 15
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    sget v1, Ll/qa00;->m:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget v1, Ll/qa00;->h:I

    .line 24
    .line 25
    :goto_0
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 27
    .line 28
    .line 29
    const v1, 0x800055

    .line 30
    .line 31
    .line 32
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->G:Ll/qam;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-interface {v1, p0, p1, v0}, Ll/qam;->i(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->E:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-interface {v1, p0, p1, v0}, Ll/qam;->e(Lcom/p1/mobile/android/app/Frag;Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public m5()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic t5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->k5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u5(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-gez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p1}, Landroid/widget/AbsListView;->smoothScrollToPositionFromTop(II)V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method public v5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_4

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->getConversationsAdapter()Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->A()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->H:I

    .line 40
    .line 41
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->K:Z

    .line 42
    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->H:I

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    :cond_0
    const/4 v2, -0x1

    .line 56
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->J:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 60
    .line 61
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->J:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->C(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/4 v3, 0x0

    .line 72
    if-nez v0, :cond_3

    .line 73
    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->H:I

    .line 77
    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    :cond_2
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    .line 81
    .line 82
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->J:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 101
    .line 102
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->C(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    :cond_3
    if-ltz v2, :cond_4

    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->x5(IZ)V

    .line 110
    .line 111
    .line 112
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->K:Z

    .line 113
    .line 114
    :cond_4
    return-void
.end method

.method public w5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->B:Z

    .line 2
    .line 3
    return-void
.end method

.method public final x5(IZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {}, Ll/gra;->G0()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 18
    .line 19
    add-int/2addr v0, p1

    .line 20
    const/high16 v2, 0x42300000    # 44.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v1, v0, v2}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 31
    .line 32
    add-int/2addr v0, p1

    .line 33
    invoke-virtual {v1, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->I:I

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->getConversationsAdapter()Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;->getItem(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->J:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 51
    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->L:Ljava/lang/Runnable;

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public y5()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 24
    .line 25
    double-to-long v0, v0

    .line 26
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/tr90;->s(Lcom/p1/mobile/putong/data/User;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 49
    .line 50
    iget-wide v0, p0, Ll/mk8;->m0:J

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_0

    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 61
    .line 62
    iget p0, p0, Ll/mk8;->l0:I

    .line 63
    .line 64
    invoke-static {}, Ll/gra;->i0()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-lt p0, v0, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/aw90;->S()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_0

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 83
    .line 84
    const/4 v0, 0x4

    .line 85
    invoke-virtual {p0, v0}, Ll/mk8;->r3(I)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_0

    .line 90
    .line 91
    const/4 p0, 0x1

    .line 92
    return p0

    .line 93
    :cond_0
    const/4 p0, 0x0

    .line 94
    return p0
.end method

.method public z5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->G2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
