.class public Ll/fhp;
.super Ll/q27;
.source "SourceFile"


# instance fields
.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VImage;

.field public i:Lv/VText_NoTopPadding;

.field public j:Lv/VText_NoTopPadding;

.field public k:Lv/VRecyclerView;

.field public l:Lv/VText_NoTopPadding;

.field public final m:Lcom/p1/mobile/android/app/Act;

.field public n:Ll/khn;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fhp;->m:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Ll/fhp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fhp;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/fhp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fhp;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/fhp;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fhp;->Q(Z)V

    return-void
.end method

.method public static synthetic M(Ll/fhp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fhp;->T(Ll/uxj0;)V

    return-void
.end method

.method private O()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0
.end method

.method private P()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fhp;->m:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/fhp;->N(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/lhn;->c()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0}, Ll/fhp;->O()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ll/lhn$a;

    .line 40
    .line 41
    invoke-virtual {v3}, Ll/lhn$a;->c()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {v3, v4}, Ll/lhn$a;->g(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    new-instance v1, Ll/khn;

    .line 54
    .line 55
    iget-object v2, p0, Ll/fhp;->m:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-direct {v1, v2, v0}, Ll/khn;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Ll/fhp;->n:Ll/khn;

    .line 61
    .line 62
    new-instance v0, Ll/ahp;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/ahp;-><init>(Ll/fhp;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ll/khn;->Q(Ll/khn$a;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/fhp;->k:Lv/VRecyclerView;

    .line 71
    .line 72
    iget-object v1, p0, Ll/fhp;->n:Ll/khn;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/fhp;->h:Lv/VImage;

    .line 78
    .line 79
    new-instance v1, Ll/bhp;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/bhp;-><init>(Ll/fhp;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/fhp;->l:Lv/VText_NoTopPadding;

    .line 88
    .line 89
    new-instance v1, Ll/chp;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/chp;-><init>(Ll/fhp;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/fhp;->l:Lv/VText_NoTopPadding;

    .line 98
    .line 99
    iget-object p0, p0, Ll/fhp;->n:Ll/khn;

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/khn;->N()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_1

    .line 110
    .line 111
    sget p0, Ll/dbc0;->N:I

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    sget p0, Ll/dbc0;->O:I

    .line 115
    .line 116
    :goto_1
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fhp;->n:Ll/khn;

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
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/fhp;->U(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public C()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_tribe_verification_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fhp;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public N(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ghp;->b(Ll/fhp;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fhp;->l:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/dbc0;->N:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget p1, Ll/dbc0;->O:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic T(Ll/uxj0;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ro:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final U(Ljava/lang/String;)V
    .locals 3

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
    iget-object v0, p0, Ll/fhp;->m:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    const-string v2, "updateIntlInterval"

    .line 56
    .line 57
    invoke-virtual {v1, p1, v2}, Ll/dkb;->v9(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/dhp;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/dhp;-><init>(Ll/fhp;)V

    .line 68
    .line 69
    .line 70
    new-instance p0, Ll/ehp;

    .line 71
    .line 72
    invoke-direct {p0}, Ll/ehp;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q27;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/fhp;->P()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
