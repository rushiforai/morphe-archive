.class public Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VText_NoTopPadding;

.field public g:Ll/khn;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->h2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->l2(Z)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->lambda$initSubscription$2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->i2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->k2(Ll/uxj0;)V

    return-void
.end method

.method public static e2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->g2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static g2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "intl_friend_purpose"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "is_patch"

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "extra_from"

    .line 21
    .line 22
    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private synthetic h2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i2(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->g:Ll/khn;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/khn;->N()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "intl_purpose"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_intl_popup_relation_goals_button"

    .line 24
    .line 25
    const-string v2, "p_intl_popup_relation_goals"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "is_patch"

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->m2(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->o2(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method private synthetic k2(Ll/uxj0;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ro:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$initSubscription$2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->L6:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p1, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/lhn;->b()Lrx/subjects/b;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "intl_friend_purpose"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->n2(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->d:Lv/VImage;

    .line 37
    .line 38
    new-instance v0, Ll/qle;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/qle;-><init>(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->f:Lv/VText_NoTopPadding;

    .line 47
    .line 48
    new-instance v0, Ll/rle;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/rle;-><init>(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private m2(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 26
    .line 27
    iput-object v1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 28
    .line 29
    iput-object v1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Ll/tle;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/tle;-><init>(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;)V

    .line 66
    .line 67
    .line 68
    new-instance p0, Ll/ule;

    .line 69
    .line 70
    invoke-direct {p0}, Ll/ule;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 82
    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public d2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vle;->b(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->d2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ple;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ple;-><init>(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l2(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->f:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->f:Lv/VText_NoTopPadding;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget p1, Ll/dbc0;->N:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget p1, Ll/dbc0;->O:I

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final n2(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lhn;->c()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/lhn$a;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/lhn$a;->c()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Ll/lhn$a;->g(Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p1, Ll/khn;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-direct {p1, v1, v0}, Ll/khn;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->g:Ll/khn;

    .line 43
    .line 44
    new-instance v0, Ll/sle;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/sle;-><init>(Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ll/khn;->Q(Ll/khn$a;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->e:Lv/VRecyclerView;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->g:Ll/khn;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->f:Lv/VText_NoTopPadding;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/intlfriendpurpose/EditIntlFriendPurposeAct;->g:Ll/khn;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/khn;->N()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_1

    .line 72
    .line 73
    sget p0, Ll/dbc0;->N:I

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    sget p0, Ll/dbc0;->O:I

    .line 77
    .line 78
    :goto_1
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final o2(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "intl_friend_purpose"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v1, -0x1

    .line 16
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_popup_relation_goals"

    .line 2
    .line 3
    return-object p0
.end method
