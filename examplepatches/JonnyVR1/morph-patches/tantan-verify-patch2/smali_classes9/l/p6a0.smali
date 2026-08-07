.class public Ll/p6a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/g6a0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VFrame;

.field public c:Lv/VProgressBar;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

.field public e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

.field public f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

.field public g:Landroid/widget/FrameLayout;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

.field public j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

.field public k:Ll/g6a0;

.field public l:Ll/lp90;

.field public m:Ll/zq90;

.field public n:Ll/lza0;

.field public o:Ll/qmj0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;Ll/zq90;Ll/lza0;Ll/qmj0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p6a0;->h:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 13
    .line 14
    iput-object p1, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 15
    .line 16
    iput-object p2, p0, Ll/p6a0;->m:Ll/zq90;

    .line 17
    .line 18
    iput-object p3, p0, Ll/p6a0;->n:Ll/lza0;

    .line 19
    .line 20
    iput-object p4, p0, Ll/p6a0;->o:Ll/qmj0;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->C()V

    return-void
.end method

.method public static synthetic b(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->z()V

    return-void
.end method

.method public static synthetic c(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->y()V

    return-void
.end method

.method public static synthetic d(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->A()V

    return-void
.end method

.method public static synthetic e()Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->tranceHash:I

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CARD_CLICK:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->endTrance()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object v0
.end method

.method public static synthetic f()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->E()V

    return-void
.end method

.method public static synthetic j(Ll/p6a0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->B()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g6a0;->t1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->N()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic B()V
    .locals 5

    .line 1
    invoke-static {}, Ll/ml70;->b()Ll/ml70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/ml70;->d(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 19
    .line 20
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    const-string v4, "profile_frag_menu"

    .line 25
    .line 26
    invoke-static {v1, p0, v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic C()V
    .locals 1

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/p6d0;->j:Ljava/util/Set;

    .line 6
    .line 7
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 8
    .line 9
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/p6d0;->l0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic E()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 2
    .line 3
    check-cast v0, Ll/ogf;

    .line 4
    .line 5
    iget-object v0, v0, Ll/ogf;->m:Lv/VFrame_FlipContainer;

    .line 6
    .line 7
    invoke-static {v0}, Ll/z5h0;->H(Lv/VFrame_FlipContainer;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/p6d0;->j:Ljava/util/Set;

    .line 15
    .line 16
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 17
    .line 18
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/p6d0;->l0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p6a0;->b:Lv/VFrame;

    .line 2
    .line 3
    new-instance v0, Ll/o6a0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/o6a0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public G(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->PRE_CREATE_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public H()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 8
    .line 9
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 10
    .line 11
    iget-object v3, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v4, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/zq90;->L()Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    instance-of v6, p0, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 24
    .line 25
    const/4 v7, 0x1

    .line 26
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZZ)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 15
    .line 16
    iget-object v1, p0, Ll/p6a0;->m:Ll/zq90;

    .line 17
    .line 18
    iget-object v2, v1, Ll/zq90;->f:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 19
    .line 20
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userState:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 21
    .line 22
    iget-object v2, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->profileContext:Ll/fr90;

    .line 27
    .line 28
    iget-object v2, v1, Ll/zq90;->j:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 29
    .line 30
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 31
    .line 32
    iget-object v2, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, v1, Ll/zq90;->c:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveRoomInfo:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 41
    .line 42
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public K()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->o()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->n()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/p6a0;->n:Ll/lza0;

    .line 19
    .line 20
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 21
    .line 22
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 23
    .line 24
    iget-boolean v2, v0, Ll/zq90$a;->f:Z

    .line 25
    .line 26
    new-instance v3, Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/p6a0;->C0()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 36
    .line 37
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->k:Lv/VText;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 44
    .line 45
    iget-object v6, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v7, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v8, 0x0

    .line 50
    const/4 v9, 0x0

    .line 51
    invoke-virtual/range {v1 .. v9}, Ll/lza0;->f(ZLandroid/widget/TextView;Landroid/widget/TextView;Ll/ner;Ljava/lang/String;Ljava/lang/String;ZLv/VText;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public L(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/p6a0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/p6a0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->u()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p0, Ll/p6a0;->m:Ll/zq90;

    .line 38
    .line 39
    iget-object v2, v2, Ll/zq90;->d:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-virtual {v1, v2, p1, v0, v3}, Ll/bpe0;->c(Ljava/lang/String;IZLjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/p6a0;->p(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->a()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/p6a0;->m:Ll/zq90;

    .line 78
    .line 79
    iget-object p1, p1, Ll/zq90;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iget-object v2, v2, Ll/z5h0;->m:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iget-object v2, p0, Ll/p6a0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 92
    .line 93
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/p6a0;->f:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 97
    .line 98
    iget-object v3, p0, Ll/p6a0;->m:Ll/zq90;

    .line 99
    .line 100
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_1

    .line 107
    .line 108
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 109
    .line 110
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    goto :goto_0

    .line 117
    :cond_1
    iget-object v3, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 118
    .line 119
    invoke-virtual {v3}, Ll/g6a0;->v2()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_2

    .line 128
    .line 129
    iget-object p0, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/g6a0;->v2()Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_2

    .line 140
    .line 141
    move v0, v1

    .line 142
    :cond_2
    :goto_0
    invoke-virtual {v2, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->r(ZZZ)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6a0;->c:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/zq90$a;->i:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ll/hbs;->a()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 24
    .line 25
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 26
    .line 27
    iget-boolean v0, v0, Ll/zq90$a;->j:Z

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Pm()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 42
    .line 43
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "photo_album_feed_from_nearby_focus"

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 54
    .line 55
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 56
    .line 57
    const-string v1, "photo_album_feed_from_nearby_falls_feed"

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 66
    .line 67
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 68
    .line 69
    const-string v1, "photo_album_feed_from_like"

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 78
    .line 79
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 80
    .line 81
    const-string v1, "from_recommend_like"

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 90
    .line 91
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 92
    .line 93
    const-string v1, "photo_album_feed_from_emotion"

    .line 94
    .line 95
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_1

    .line 100
    .line 101
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 102
    .line 103
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, "from_portrait_like_list"

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 114
    .line 115
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 116
    .line 117
    const-string v1, "form_my_pet"

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_1

    .line 124
    .line 125
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 126
    .line 127
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 128
    .line 129
    const-string v1, "chat_group"

    .line 130
    .line 131
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_1

    .line 136
    .line 137
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 138
    .line 139
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 140
    .line 141
    const-string v1, "chat_group_anonymity"

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_1

    .line 148
    .line 149
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 150
    .line 151
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 152
    .line 153
    const-string v1, "group_notification"

    .line 154
    .line 155
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_1

    .line 160
    .line 161
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 162
    .line 163
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 164
    .line 165
    const-string v1, "group_notification_anonymity"

    .line 166
    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_1

    .line 172
    .line 173
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 174
    .line 175
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 176
    .line 177
    const-string v1, "moment_visitor"

    .line 178
    .line 179
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_1

    .line 184
    .line 185
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 186
    .line 187
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 188
    .line 189
    const-string v1, "from_mew_tags"

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_1

    .line 196
    .line 197
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 198
    .line 199
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 200
    .line 201
    const-string v1, "from_literature_third"

    .line 202
    .line 203
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-nez v0, :cond_1

    .line 208
    .line 209
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 210
    .line 211
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 212
    .line 213
    const-string v1, "photo_album_feed_from_discover_discussion"

    .line 214
    .line 215
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-nez v0, :cond_1

    .line 220
    .line 221
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 222
    .line 223
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 224
    .line 225
    const-string v1, "photo_album_feed_from_activity"

    .line 226
    .line 227
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_1

    .line 232
    .line 233
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 234
    .line 235
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 236
    .line 237
    const-string v1, "photo_album_feed_viewers"

    .line 238
    .line 239
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_1

    .line 244
    .line 245
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 246
    .line 247
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 248
    .line 249
    const-string v1, "photo_album_feed_from_discover_dating"

    .line 250
    .line 251
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    if-nez v0, :cond_1

    .line 256
    .line 257
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 258
    .line 259
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 260
    .line 261
    const-string v1, "photo_album_feed_from_activity_tab_one"

    .line 262
    .line 263
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-nez v0, :cond_1

    .line 268
    .line 269
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 270
    .line 271
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 272
    .line 273
    const-string v1, "photo_album_feed_from_activity_tab_two"

    .line 274
    .line 275
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_1

    .line 280
    .line 281
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 282
    .line 283
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 284
    .line 285
    const-string v1, "photo_album_feed_from_search_result"

    .line 286
    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-nez v0, :cond_1

    .line 292
    .line 293
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 294
    .line 295
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 296
    .line 297
    const-string v1, "photo_album_feed_from_poi_aggregation"

    .line 298
    .line 299
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_2

    .line 304
    .line 305
    :cond_1
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 306
    .line 307
    invoke-virtual {p0}, Ll/zq90;->K()Z

    .line 308
    .line 309
    .line 310
    move-result p0

    .line 311
    if-nez p0, :cond_2

    .line 312
    .line 313
    const/4 p0, 0x1

    .line 314
    return p0

    .line 315
    :cond_2
    const/4 p0, 0x0

    .line 316
    return p0
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/p6a0;->c:Lv/VProgressBar;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public P(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

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
    iget-object p0, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
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
    check-cast p1, Ll/g6a0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6a0;->l(Ll/g6a0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->INFLATE_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/p6a0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q6a0;->b(Ll/p6a0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/g6a0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 2
    .line 3
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final n(Ll/zq90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6a0;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->a(Ll/zq90;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iput-object v1, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "init Button Strategy : "

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "[core][profile]"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public final p(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lp90;->e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_auto_scroll_to_question"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 14
    .line 15
    new-instance v0, Ll/h6a0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/h6a0;-><init>()V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x1f4

    .line 21
    .line 22
    invoke-static {p0, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->INIT_VIEW:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/p6a0;->m:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/zq90;->K()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Ll/p6a0;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 28
    .line 29
    sget v4, Lcom/p1/mobile/putong/core/R$string;->zi:I

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v2, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 39
    .line 40
    iget-object v3, p0, Ll/p6a0;->o:Ll/qmj0;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->setTwoFingerHelper(Ll/qmj0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/p6a0;->v()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/p6a0;->u()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/p6a0;->F()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/p6a0;->x()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/p6a0;->w()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/p6a0;->q()V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/zq90;->L()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 75
    .line 76
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 77
    .line 78
    iget-object v0, v0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6a0;->h:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/v7l;

    .line 4
    .line 5
    iget-object v2, p0, Ll/p6a0;->m:Ll/zq90;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/v7l;-><init>(Ll/zq90;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/p6a0;->h:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/gfm0;

    .line 16
    .line 17
    iget-object v2, p0, Ll/p6a0;->m:Ll/zq90;

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ll/gfm0;-><init>(Ll/zq90;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/p6a0;->h:Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ll/im5;

    .line 28
    .line 29
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/im5;-><init>(Ll/zq90;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final u()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/p6a0;->s()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/p6a0;->n(Ll/zq90;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/p6a0;->C0()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;)Ll/lp90;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "generate button layout : "

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "[core][profile]"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/lp90;->k()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Ll/p6a0;->g:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 57
    .line 58
    const/high16 v3, 0x43240000    # 164.0f

    .line 59
    .line 60
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v4, -0x1

    .line 65
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/p6a0;->j:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;

    .line 72
    .line 73
    iget-object v1, p0, Ll/p6a0;->l:Ll/lp90;

    .line 74
    .line 75
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->d(Ll/lp90;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 79
    .line 80
    iget-object v0, v0, Ll/g6a0;->b:Lrx/subjects/a;

    .line 81
    .line 82
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 88
    .line 89
    instance-of v1, v0, Ll/tu40;

    .line 90
    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    check-cast v0, Ll/tu40;

    .line 94
    .line 95
    iget-object p0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Ll/tu40;->r(Ll/zq90;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ll/eu9;->h(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/gra;->M3()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l:Lv/VImage;

    .line 47
    .line 48
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/dbc0;->V6:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->d:Landroid/widget/ImageView;

    .line 64
    .line 65
    sget v1, Ll/dbc0;->D:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 71
    .line 72
    new-instance v1, Ll/k6a0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/k6a0;-><init>(Ll/p6a0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setBackCallBack(Ll/x20;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    invoke-static {}, Ll/lik0;->a()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v1, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 93
    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    new-instance v0, Ll/l6a0;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/l6a0;-><init>(Ll/p6a0;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    new-instance v0, Ll/m6a0;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/m6a0;-><init>(Ll/p6a0;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    new-instance v0, Ll/n6a0;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Ll/n6a0;-><init>(Ll/p6a0;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setEditCallBack(Ll/x20;)V

    .line 122
    .line 123
    .line 124
    :goto_0
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->n:Landroid/view/View;

    .line 127
    .line 128
    const/4 v1, 0x0

    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 133
    .line 134
    const/high16 v1, 0x3f800000    # 1.0f

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->g(F)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 140
    .line 141
    const/4 v1, 0x0

    .line 142
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 146
    .line 147
    new-instance v1, Ll/p6a0$a;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/p6a0$a;-><init>(Ll/p6a0;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->X(Ll/atl;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 156
    .line 157
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_5

    .line 162
    .line 163
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_4

    .line 170
    .line 171
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 172
    .line 173
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 174
    .line 175
    const-string v1, "share_profile"

    .line 176
    .line 177
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_5

    .line 182
    .line 183
    :cond_4
    iget-object v0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 184
    .line 185
    sget v1, Ll/adc0;->U8:I

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lv/VImage;

    .line 192
    .line 193
    sget v1, Ll/dbc0;->Wp:I

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 196
    .line 197
    .line 198
    :cond_5
    invoke-virtual {p0}, Ll/p6a0;->K()V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public final w()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 9
    .line 10
    iget-object v1, p0, Ll/p6a0;->m:Ll/zq90;

    .line 11
    .line 12
    iget-object v2, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, v1, Ll/zq90;->f:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 17
    .line 18
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userState:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->profileContext:Ll/fr90;

    .line 21
    .line 22
    iget-object v2, v1, Ll/zq90;->j:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 23
    .line 24
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 25
    .line 26
    iget-object v2, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, v1, Ll/zq90;->c:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveRoomInfo:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 35
    .line 36
    const/high16 v2, 0x42dc0000    # 110.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->setContentPadding(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 46
    .line 47
    sget v3, Ll/qa00;->j:I

    .line 48
    .line 49
    sget v4, Ll/qa00;->h:I

    .line 50
    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v1, v3, v4, v3, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b1(IIII)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/p6a0;->m:Ll/zq90;

    .line 59
    .line 60
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    iget-object p0, p0, Ll/p6a0;->e:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final x()V
    .locals 4

    .line 1
    invoke-static {}, Ll/spl0;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/p6a0;->m:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zq90;->F()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->c8()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Ll/a5i0;->v0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-lez v0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Ll/p6d0;->j:Ljava/util/Set;

    .line 58
    .line 59
    iget-object v1, p0, Ll/p6a0;->m:Ll/zq90;

    .line 60
    .line 61
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/p6d0;->f0()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Ll/p6a0;->l:Ll/lp90;

    .line 80
    .line 81
    instance-of v1, v0, Ll/tu40;

    .line 82
    .line 83
    const-wide/16 v2, 0x3e8

    .line 84
    .line 85
    if-eqz v1, :cond_1

    .line 86
    .line 87
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/i6a0;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/i6a0;-><init>(Ll/p6a0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    instance-of v1, v0, Ll/ogf;

    .line 101
    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    check-cast v0, Ll/ogf;

    .line 105
    .line 106
    iget-object v0, v0, Ll/ogf;->o:Lv/VText;

    .line 107
    .line 108
    invoke-static {}, Ll/a5i0;->v0()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/j6a0;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/j6a0;-><init>(Ll/p6a0;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method public final synthetic y()V
    .locals 1

    .line 1
    const-string v0, "button"

    .line 2
    .line 3
    invoke-static {v0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g6a0;->y2()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6a0;->k:Ll/g6a0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g6a0;->t1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->O()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
