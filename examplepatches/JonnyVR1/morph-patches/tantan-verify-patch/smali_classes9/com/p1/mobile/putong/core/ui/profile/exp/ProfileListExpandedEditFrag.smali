.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListBaseFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;,
        Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;
    }
.end annotation


# static fields
.field public static L0:Lcom/p1/mobile/putong/core/data/CategorySuggestions;


# instance fields
.field public A:Lv/navigationbar/VNavigationBar;

.field public B:Lv/VFrame;

.field public C:Lv/VProgressBar;

.field public D:Lv/VLinear;

.field public E:Lcom/google/android/material/tabs/TabLayout;

.field public E0:Ll/taf;

.field public F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

.field public F0:Ll/kcg0;

.field public G:Landroidx/recyclerview/widget/RecyclerView;

.field public G0:Ll/kcg0;

.field public H:Lv/VText;

.field public H0:Z

.field public I:Landroid/view/View;

.field public final I0:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;",
            ">;"
        }
    .end annotation
.end field

.field public J:Ll/snf;

.field public J0:Ll/l4g0;

.field public K:Ll/lnf;

.field public K0:Ll/l4g0;

.field public L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

.field public M:Lcom/p1/mobile/putong/data/User;

.field public final N:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public O:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;>;"
        }
    .end annotation
.end field

.field public P:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Ll/ghf;

.field public R:Landroid/animation/Animator;

.field public S:Z

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Ljava/lang/String;

.field public W:Z

.field public final X:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;"
        }
    .end annotation
.end field

.field public Y:Ll/wdf;

.field public Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

.field public k0:Z

.field public p0:Ll/zyh0;

.field public z:Lv/VFrame;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->N:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->P:Ljava/util/HashMap;

    .line 16
    .line 17
    new-instance v0, Ll/ghf;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/ghf;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->S:Z

    .line 26
    .line 27
    const-string v0, ""

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->U:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->W:Z

    .line 33
    .line 34
    new-instance v1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/l3a0;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/l3a0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H0:Z

    .line 58
    .line 59
    new-instance v0, Ll/w3a0;

    .line 60
    .line 61
    invoke-direct {v0}, Ll/w3a0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ljava/util/HashMap;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 73
    .line 74
    return-void
.end method

.method public static synthetic A5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->C6(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic B5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q6()V

    return-void
.end method

.method public static synthetic C5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X6(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic D5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V6(ZLjava/util/List;)V

    return-void
.end method

.method public static synthetic E5()Ljava/lang/Boolean;
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

.method private E7()V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bl:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Zk:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v2, Lcom/p1/mobile/putong/core/R$string;->al:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/i2a0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/i2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Yk:I

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/j2a0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/j2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic F5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/qcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->d7(Ll/qcj;Landroid/view/View;)V

    return-void
.end method

.method private F7(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A7(I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n7()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic G5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->z6(Landroid/view/View;)V

    return-void
.end method

.method private synthetic G6(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->r7(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic H5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->f7(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic I5(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic J5(Ljava/util/Map$Entry;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->b:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic K5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->e7(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic L5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L6(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M5(Lcom/p1/mobile/putong/core/data/FakeGuideData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->changeAvatar:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "mainAvatar"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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

.method public static synthetic N5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->c7(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic O4(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic O5(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L0:Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/t2a0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/t2a0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 16
    .line 17
    iget-object p0, p0, Ll/kua;->R:Ll/mof0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic P5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->v6(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->h7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K6()V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w6(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic R5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z6(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic S4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->g7(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic S5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->P6()V

    return-void
.end method

.method public static synthetic T4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T5(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 6
    .line 7
    const-string v1, "normal"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const-string v0, "WITH_REPEAT_MAIN_PICTURE"

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    const-string v0, "WITH_NET_MAIN_PICTURE"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    return-object p0
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D6(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    return-void
.end method

.method public static synthetic U5(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logSingle(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F6(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic V5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->O6(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->j7(ILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static bridge synthetic X5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->q7(Z)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B6(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method

.method public static synthetic Z4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->i7(Landroid/view/View;)V

    return-void
.end method

.method private Z5()V
    .locals 7
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

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
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->AFTER_GET_USER_INFO:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->t7()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->W:Z

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v3, v3, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 44
    .line 45
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 48
    .line 49
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_0

    .line 54
    .line 55
    iget-object v4, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 56
    .line 57
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 62
    .line 63
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 64
    .line 65
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    iput-object v5, v4, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iget-object v4, v4, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v5, v4, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 88
    .line 89
    iput-object v5, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 90
    .line 91
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 92
    .line 93
    iput-object v5, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 94
    .line 95
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 96
    .line 97
    iput-object v5, v4, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 98
    .line 99
    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v5, v4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v5, v4, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 104
    .line 105
    iget-object v6, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 106
    .line 107
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 108
    .line 109
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 110
    .line 111
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    iget-object v5, v5, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 116
    .line 117
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 126
    .line 127
    iput-object v3, v5, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 128
    .line 129
    iget-object v3, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 130
    .line 131
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 132
    .line 133
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 134
    .line 135
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 138
    .line 139
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 140
    .line 141
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 142
    .line 143
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 144
    .line 145
    iput-object v6, v4, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 146
    .line 147
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 148
    .line 149
    iget-object v6, v5, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 150
    .line 151
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 152
    .line 153
    iput-object v6, v4, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 154
    .line 155
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 156
    .line 157
    iget-object v4, v5, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 158
    .line 159
    iget-object v5, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->idealType:Ljava/util/List;

    .line 160
    .line 161
    iput-object v5, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->idealType:Ljava/util/List;

    .line 162
    .line 163
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 164
    .line 165
    iput-object v4, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_1
    const/4 v3, 0x1

    .line 169
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->W:Z

    .line 170
    .line 171
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    iput-object v4, v3, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 182
    .line 183
    :goto_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    iget-object v3, v3, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 188
    .line 189
    invoke-direct {p0, v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->v7(Lcom/p1/mobile/putong/data/User;Z)V

    .line 190
    .line 191
    .line 192
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K:Ll/lnf;

    .line 193
    .line 194
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v3, v4}, Ll/lnf;->a(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K:Ll/lnf;

    .line 200
    .line 201
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->P:Ljava/util/HashMap;

    .line 202
    .line 203
    const-string v5, "action"

    .line 204
    .line 205
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    check-cast v4, Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v3, v4}, Ll/lnf;->b(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 215
    .line 216
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 217
    .line 218
    .line 219
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K:Ll/lnf;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v0, p0}, Ll/lnf;->c(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method public static synthetic a5()V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/xfc0;->a:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L0:Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic b5(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    const-string v0, "normal"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G6(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->y6(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I6(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R6(Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method private g6()Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H6(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->b7(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private i6(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->r()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-object p0
.end method

.method public static synthetic j5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->a7(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->T6(Ljava/util/List;Z)V

    return-void
.end method

.method private l7()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->z:Lv/VFrame;

    .line 2
    .line 3
    new-instance v0, Ll/g3a0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/g3a0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->N6()V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M6(Ll/uxj0;)V

    return-void
.end method

.method private n7()V
    .locals 8

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->b4()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "\u4f60\u7684\u4e2a\u4eba\u8d44\u6599\u9875\u9700\u8981\u81f3\u5c11\u4e00\u5f20\u7167\u7247"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Q:I

    .line 26
    .line 27
    new-instance v2, Ll/v2a0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/v2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->f6()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->g6()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    invoke-virtual {v5, v0}, Lcom/p1/mobile/putong/data/User;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H0:Z

    .line 74
    .line 75
    :cond_1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 103
    .line 104
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 113
    .line 114
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_2

    .line 119
    .line 120
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_2

    .line 131
    .line 132
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_2

    .line 139
    .line 140
    const-string v1, "about_me"

    .line 141
    .line 142
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    const/4 v7, 0x0

    .line 159
    if-eqz v6, :cond_4

    .line 160
    .line 161
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    check-cast v6, Ljava/lang/String;

    .line 166
    .line 167
    if-nez v2, :cond_3

    .line 168
    .line 169
    const-string v2, ","

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    :cond_3
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    move v2, v7

    .line 178
    goto :goto_0

    .line 179
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->pageId()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    const-string v2, "edit_profile_content_modified"

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    const-string v2, "e_profile_save_button"

    .line 198
    .line 199
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 200
    .line 201
    .line 202
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_7

    .line 207
    .line 208
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->o4(I)Landroid/app/Dialog;

    .line 211
    .line 212
    .line 213
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 218
    .line 219
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 220
    .line 221
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_5

    .line 226
    .line 227
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 230
    .line 231
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_5

    .line 236
    .line 237
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 240
    .line 241
    const/4 v2, 0x0

    .line 242
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 243
    .line 244
    :cond_5
    invoke-static {}, Ll/gra;->e2()Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    if-eqz v1, :cond_6

    .line 249
    .line 250
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-eqz v1, :cond_6

    .line 255
    .line 256
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 257
    .line 258
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-eqz v1, :cond_6

    .line 263
    .line 264
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 265
    .line 266
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 267
    .line 268
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_6

    .line 273
    .line 274
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 275
    .line 276
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 277
    .line 278
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 279
    .line 280
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-eqz v1, :cond_6

    .line 285
    .line 286
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 287
    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 289
    .line 290
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 291
    .line 292
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 293
    .line 294
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-nez v1, :cond_6

    .line 299
    .line 300
    iget-object v1, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 301
    .line 302
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 303
    .line 304
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 305
    .line 306
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 307
    .line 308
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    check-cast v1, Lcom/p1/mobile/putong/data/Purpose;

    .line 313
    .line 314
    const-string v2, "marriage"

    .line 315
    .line 316
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    move v2, v1

    .line 321
    goto :goto_1

    .line 322
    :cond_6
    move v2, v7

    .line 323
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 324
    .line 325
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 326
    .line 327
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    new-instance v1, Ll/w2a0;

    .line 332
    .line 333
    invoke-direct {v1}, Ll/w2a0;-><init>()V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    new-instance v1, Ll/x2a0;

    .line 341
    .line 342
    invoke-direct {v1, p0, v5}, Ll/x2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/User;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 350
    .line 351
    .line 352
    move-result-object v6

    .line 353
    new-instance v0, Ll/y2a0;

    .line 354
    .line 355
    move-object v1, p0

    .line 356
    invoke-direct/range {v0 .. v5}, Ll/y2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 357
    .line 358
    .line 359
    new-instance p0, Ll/z2a0;

    .line 360
    .line 361
    invoke-direct {p0, v1, v4, v5}, Ll/z2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 362
    .line 363
    .line 364
    invoke-static {v0, p0, v7}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    invoke-virtual {v6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 369
    .line 370
    .line 371
    return-void

    .line 372
    :cond_7
    move-object v1, p0

    .line 373
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 374
    .line 375
    .line 376
    return-void
.end method

.method public static synthetic o5(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/p;->s3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private o6()V
    .locals 2

    .line 1
    new-instance v0, Ll/wdf;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/wdf;-><init>(Ll/u3m;Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y:Ll/wdf;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/wdf;->g()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y:Ll/wdf;

    .line 18
    .line 19
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/wdf;->h(Ljava/lang/Class;)Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 28
    .line 29
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$b;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->e0(Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic p5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A6(Landroid/view/View;)V

    return-void
.end method

.method private p6()V
    .locals 4

    .line 1
    invoke-static {}, Ll/ml70;->b()Ll/ml70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/ml70;->e(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    sget v1, Ll/dbc0;->D:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Ll/c9c0;->P0:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/c9c0;->P0:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    sget v3, Ll/c9c0;->P0:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget v1, Ll/kec0;->I9:I

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget v1, Ll/adc0;->o4:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Lv/VButton;

    .line 103
    .line 104
    sget v2, Ll/dbc0;->E:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 107
    .line 108
    .line 109
    sget v2, Ll/qa00;->e:I

    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/r2a0;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/r2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 123
    .line 124
    filled-new-array {v0}, [Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 132
    .line 133
    new-instance v1, Ll/s2a0;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/s2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_0

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 164
    .line 165
    .line 166
    :cond_0
    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->U6(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method private q6()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/nrb0;->b()Z

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
    const-string v0, "pic_cert_guide"

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H7(Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F0:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/p2a0;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/p2a0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/a3a0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/a3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F0:Ll/kcg0;

    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic r5(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    return-void
.end method

.method private r6()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/n2a0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/n2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic s5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->W6(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y6(Landroid/view/View;)V

    return-void
.end method

.method private t7()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->i6(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/ghf;->L(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y:Ll/wdf;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->p0:Ll/zyh0;

    .line 17
    .line 18
    invoke-virtual {v1, v2, v0, v3}, Ll/wdf;->k(Lcom/google/android/material/tabs/TabLayout;Ljava/util/List;Ll/zyh0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->t6()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic u5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->u6()V

    return-void
.end method

.method private u7(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/o2a0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1, p2}, Ll/o2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/util/List;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->b(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ll/q2a0;

    .line 19
    .line 20
    invoke-direct {v0, p0, p2, p1}, Ll/q2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ZLjava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->b(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic v5()V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/xfc0;->a:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I4:Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private v7(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->t7()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 5
    .line 6
    invoke-direct {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->u7(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/snf;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic w5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->S6(Ll/pf60;)V

    return-void
.end method

.method private w7(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z5()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic x5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->x6()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J6(Ljava/lang/Throwable;)V

    return-void
.end method

.method private y7(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "fake_risk_audit_default_"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->T:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic z5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E6(Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public final synthetic A6(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->p7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public A7(I)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/core/R$string;->jr:I

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ir:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->hr:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/h2a0;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/h2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic B6(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    const-string v0, "pic_cert_guide"

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H7(Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public B7(ZLjava/lang/String;Ljava/lang/String;Ll/qcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l4g0;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_lowqualityphoto_save_popup"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 19
    .line 20
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p2, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2, p3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    const-string p3, "\u4fdd\u5b58\u5176\u4ed6\u8d44\u6599"

    .line 43
    .line 44
    invoke-virtual {p2, p3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    new-instance p3, Ll/k3a0;

    .line 49
    .line 50
    invoke-direct {p3, p0, p4}, Ll/k3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/qcj;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    const-string p3, "\u4e0d\u4fdd\u5b58"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const-string p3, "\u7ee7\u7eed\u7f16\u8f91"

    .line 63
    .line 64
    :goto_0
    invoke-virtual {p2, p3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    new-instance p3, Ll/m3a0;

    .line 69
    .line 70
    invoke-direct {p3, p0, p1}, Ll/m3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, p3}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/n3a0;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/n3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ll/th0$a;->n(Landroid/content/DialogInterface$OnShowListener;)Ll/th0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ll/o3a0;

    .line 87
    .line 88
    invoke-direct {p2, p0}, Ll/o3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public C2()Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L0:Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic C6(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->y7(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->N:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final C7()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/dkb;->e8()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/ey0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ln()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    return v2

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Ll/ey0;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    return v1

    .line 84
    :cond_3
    return v2
.end method

.method public D2()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic D6(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 1

    .line 1
    const-string p1, "stock_fake_guide"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H7(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final D7(Z)V
    .locals 3

    .line 1
    new-instance v0, Ll/u1a0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u1a0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u68c0\u6d4b\u5230\u4e0d\u7b26\u5408\u8981\u6c42\u7684\u7167\u7247"

    .line 7
    .line 8
    const-string v2, "\u82e5\u7ee7\u7eed\u4fdd\u5b58\uff0c\u4e0d\u7b26\u5408\u8981\u6c42\u7684\u7167\u7247(\u91cd\u590d\u56fe\u3001\u7f51\u56fe\u3001\u4e94\u5b98\u4e0d\u6e05\u6670\u7684\u7167\u7247\u7b49\uff09\u5c06\u88ab\u5220\u9664"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B7(ZLjava/lang/String;Ljava/lang/String;Ll/qcj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 2
    .line 3
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/snf;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic E6(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->h3()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I4:Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Ll/t3a0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/t3a0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 19
    .line 20
    iget-object p0, p0, Ll/kua;->R:Ll/mof0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public F1(Z)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/lang/NullPointerException;

    .line 16
    .line 17
    const-string p1, "ProfileListFrag editingUser is null when refresh"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    :cond_1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    return-object p0
.end method

.method public final synthetic F6(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->h3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public varargs G([Landroid/view/View;)V
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListBaseFrag;->N4(Lcom/p1/mobile/putong/data/User;)Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public G7()V
    .locals 0

    .line 1
    const-string p0, "android_back"

    .line 2
    .line 3
    invoke-static {p0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H3()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->O:Ll/pf60;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic H6(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 2

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->isHit:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    iput-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->v7(Lcom/p1/mobile/putong/data/User;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 53
    .line 54
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 55
    .line 56
    invoke-direct {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->v7(Lcom/p1/mobile/putong/data/User;Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;

    .line 60
    .line 61
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_2
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/dkb;->E9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public H7(Ljava/lang/String;Z)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->a:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    iput-boolean p2, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->b:Z

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p2, Ll/t1a0;

    .line 38
    .line 39
    invoke-direct {p2}, Ll/t1a0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 60
    .line 61
    sget p2, Ll/qa00;->A:I

    .line 62
    .line 63
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 67
    .line 68
    const-string p2, "stock_fake_guide"

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->b:Z

    .line 79
    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 83
    .line 84
    const-string p1, "\u8bf7\u7acb\u5373\u66f4\u6362\u771f\u5b9e\u5934\u50cf\uff0c\u4ee5\u514d\u5f71\u54cd\u4f60\u5728\u5212\u5361\u7684\u66dd\u5149"

    .line 85
    .line 86
    sget p2, Ll/dbc0;->Z6:I

    .line 87
    .line 88
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;->c(Ljava/lang/String;II)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 93
    .line 94
    const-string p2, "audit_guide"

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 101
    .line 102
    if-eqz p1, :cond_4

    .line 103
    .line 104
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->b:Z

    .line 105
    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 109
    .line 110
    const-string p1, "\u6709\u8d44\u6599\u5728\u5ba1\u6838\u4e2d"

    .line 111
    .line 112
    sget p2, Ll/dbc0;->Y6:I

    .line 113
    .line 114
    invoke-virtual {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;->c(Ljava/lang/String;II)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I0:Ljava/util/HashMap;

    .line 119
    .line 120
    const-string p2, "pic_cert_guide"

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;

    .line 127
    .line 128
    if-eqz p1, :cond_6

    .line 129
    .line 130
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->b:Z

    .line 131
    .line 132
    if-eqz p2, :cond_6

    .line 133
    .line 134
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 135
    .line 136
    sget v1, Ll/dbc0;->a7:I

    .line 137
    .line 138
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IjM0RVZJN1JITFNWNVdHUUtFUVBNRzdRRjVORFVGNDE0IiwidyI6MTA3NywiaCI6MTYyLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE1Nzk0MDc5MzcwMzQ2ODM2NX0.png"

    .line 139
    .line 140
    const-string v3, "\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1\u4f1a\u88ab\u4f18\u5148\u63a8\u8350"

    .line 141
    .line 142
    const-string v4, "\u8ba4\u8bc1"

    .line 143
    .line 144
    invoke-virtual {p2, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 148
    .line 149
    new-instance v1, Ll/e2a0;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/e2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->c:Z

    .line 158
    .line 159
    if-nez p2, :cond_5

    .line 160
    .line 161
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$d;->c:Z

    .line 162
    .line 163
    const-string p1, "e_edit_profile_view_edit_verification"

    .line 164
    .line 165
    const-string p2, "p_edit_profile_view"

    .line 166
    .line 167
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditTopWarnView;

    .line 171
    .line 172
    sget p1, Ll/qa00;->C:I

    .line 173
    .line 174
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 175
    .line 176
    .line 177
    :cond_6
    return-void
.end method

.method public final synthetic I6(ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object p1, p1, Ll/dkb;->g4:Lrx/subjects/b;

    .line 8
    .line 9
    const-string p5, ""

    .line 10
    .line 11
    invoke-virtual {p1, p5}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p5, p3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p5

    .line 26
    sub-int/2addr p1, p5

    .line 27
    if-lez p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->pageId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p5, "upload_page_name"

    .line 34
    .line 35
    const-string v0, "edit_profile_page"

    .line 36
    .line 37
    invoke-static {p5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p5

    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    sub-int/2addr p2, p3

    .line 54
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const-string p3, "upload_photos_count"

    .line 59
    .line 60
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    filled-new-array {p5, p2}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const-string p3, "e_upload_photos_success"

    .line 69
    .line 70
    invoke-static {p3, p1, p2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 74
    .line 75
    .line 76
    iget-object p1, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    iget-object p1, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-lez p1, :cond_2

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/dkb;->H7()V

    .line 97
    .line 98
    .line 99
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 100
    .line 101
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H0:Z

    .line 104
    .line 105
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->i0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public J1()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    return-object p0
.end method

.method public J3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 16
    .line 17
    const-string v2, "reRenderPage!!!"

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->N:Lrx/subjects/a;

    .line 23
    .line 24
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic J6(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/R$string;->c0:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->M7:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public K2()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic K6()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L6(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$ProfileEditInfoException;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/u3a0;

    .line 23
    .line 24
    invoke-direct {p2, p0, p3}, Ll/u3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-eqz p3, :cond_7

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bl:I

    .line 49
    .line 50
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    const-wide/16 v0, 0x0

    .line 82
    .line 83
    :goto_0
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 84
    .line 85
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_3

    .line 100
    .line 101
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    :cond_3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    double-to-long v0, v0

    .line 114
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 124
    .line 125
    .line 126
    move-result-wide v3

    .line 127
    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 128
    .line 129
    .line 130
    invoke-static {v2, v0}, Ll/yab;->T(Ljava/util/Calendar;Ljava/util/Calendar;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    const/16 v2, 0x78

    .line 141
    .line 142
    if-eqz v1, :cond_4

    .line 143
    .line 144
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_4

    .line 151
    .line 152
    if-le v0, v2, :cond_4

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    sget p2, Lcom/p1/mobile/putong/core/R$string;->V3:I

    .line 159
    .line 160
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    goto :goto_1

    .line 165
    :cond_4
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-eqz p2, :cond_5

    .line 172
    .line 173
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_5

    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    sget p2, Lcom/p1/mobile/putong/core/R$string;->W3:I

    .line 186
    .line 187
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p3

    .line 191
    goto :goto_1

    .line 192
    :cond_5
    if-le v0, v2, :cond_6

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    sget p2, Lcom/p1/mobile/putong/core/R$string;->X3:I

    .line 199
    .line 200
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->b4()Lcom/p1/mobile/android/app/Dialog$e;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Q:I

    .line 213
    .line 214
    new-instance p3, Ll/v3a0;

    .line 215
    .line 216
    invoke-direct {p3, p0}, Ll/v3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 224
    .line 225
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 230
    .line 231
    .line 232
    :cond_7
    return-void
.end method

.method public final synthetic M6(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N6()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O6(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Jl:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Q:I

    .line 57
    .line 58
    new-instance v1, Ll/u2a0;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/u2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method

.method public P1()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic P6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Q6()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D:Lv/VLinear;

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public R()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->x0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public R0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 6
    .line 7
    return p0
.end method

.method public R3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R6(Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->userId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public S()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic S6(Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->O:Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic T6(Ljava/util/List;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;->setMedia(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setIllegalVisible(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic U6(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z2()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V6(ZLjava/util/List;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 4
    .line 5
    const-string v1, "p_edit_profile_view"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v2, v3, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-ge v2, v4, :cond_0

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    move v4, v1

    .line 35
    :goto_1
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setIllegalPicture(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 43
    .line 44
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setStyle(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-ge v2, v4, :cond_1

    .line 58
    .line 59
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_1
    const/4 v4, 0x0

    .line 67
    :goto_2
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->d1(Lcom/p1/mobile/putong/data/Media;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 75
    .line 76
    new-instance v4, Ll/p3a0;

    .line 77
    .line 78
    invoke-direct {v4, p0}, Ll/p3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setChangeAction(Ll/a30;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 89
    .line 90
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->x0(I)V

    .line 91
    .line 92
    .line 93
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    return-void
.end method

.method public final synthetic W6(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2, p0, p1}, Ll/eu4;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic X6(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Y0()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e4a0;->b(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Y6(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$c;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 33
    .line 34
    :cond_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 35
    .line 36
    const-string p1, "e_delete_photo_saveothers"

    .line 37
    .line 38
    const-string v0, "p_lowqualityphoto_save_popup"

    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n7()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public Z2()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->C0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic Z6(ZLandroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "p_lowqualityphoto_save_popup"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "e_not_save"

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "e_ontinue_editing"

    .line 15
    .line 16
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final a6()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->s1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 27
    .line 28
    instance-of v1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->isAiFakePic()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    return v0
.end method

.method public final synthetic a7(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b6()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->m6()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v0, v1, v2, v3}, Ll/aw90;->C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "edit_data_button"

    .line 32
    .line 33
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    const/16 v1, 0x32

    .line 40
    .line 41
    if-lt v0, v1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E0:Ll/taf;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/taf;->q()V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic b7(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c6()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->C7()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->b6()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic c7(ILandroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-ne p1, p2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 24
    .line 25
    iput-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 41
    .line 42
    new-instance v0, Ll/j3a0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/j3a0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    iput-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 52
    .line 53
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n7()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->N:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/a4a0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/a4a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/b4a0;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/b4a0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/c4a0;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/c4a0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/d4a0;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/d4a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final d6()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/gra;->H2()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    instance-of v1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    const-string v0, "WITH_NET_MAIN_PICTURE"

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_1
    return v0
.end method

.method public final synthetic d7(Ll/qcj;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/x3a0;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/x3a0;-><init>(Ll/qcj;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    const-string p1, "e_delete_photo_saveothers"

    .line 40
    .line 41
    const-string p2, "p_lowqualityphoto_save_popup"

    .line 42
    .line 43
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n7()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final e6()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/gra;->H2()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    instance-of v1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    const-string v0, "WITH_REPEAT_MAIN_PICTURE"

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_1
    return v0
.end method

.method public final synthetic e7(ZLandroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "p_lowqualityphoto_save_popup"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "e_not_save"

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "e_ontinue_editing"

    .line 15
    .line 16
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/k2a0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/k2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->f0:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/l2a0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/l2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->g0:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/m2a0;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/m2a0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/kua;->j3()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n6()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public f6()Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->j6(Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final synthetic f7(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public from()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 14

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
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->p6()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->l7()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    const/high16 v3, 0x20000

    .line 33
    .line 34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    new-instance v3, Ll/dhl;

    .line 45
    .line 46
    const/high16 v4, 0x41000000    # 8.0f

    .line 47
    .line 48
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-direct {v3, v4}, Ll/dhl;-><init>(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 56
    .line 57
    .line 58
    new-instance p1, Ll/snf;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B:Lv/VFrame;

    .line 65
    .line 66
    invoke-direct {p1, p0, v3, v4}, Ll/snf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/Context;Lv/VFrame;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 70
    .line 71
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-direct {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 91
    .line 92
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 98
    .line 99
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 103
    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;

    .line 109
    .line 110
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 111
    .line 112
    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 114
    .line 115
    invoke-virtual {v4, p1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 116
    .line 117
    .line 118
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 119
    .line 120
    invoke-virtual {v4, p1}, Ll/snf;->n(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Ll/zyh0;

    .line 124
    .line 125
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y:Ll/wdf;

    .line 126
    .line 127
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E:Lcom/google/android/material/tabs/TabLayout;

    .line 128
    .line 129
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 130
    .line 131
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 132
    .line 133
    invoke-direct {p1, v4, v5, v6, v7}, Ll/zyh0;-><init>(Ll/wdf;Lcom/google/android/material/tabs/TabLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;)V

    .line 134
    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->p0:Ll/zyh0;

    .line 137
    .line 138
    new-instance v8, Ll/taf;

    .line 139
    .line 140
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object v9

    .line 144
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 145
    .line 146
    iget-object v11, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 147
    .line 148
    iget-object v12, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 149
    .line 150
    iget-object v13, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->I:Landroid/view/View;

    .line 151
    .line 152
    invoke-direct/range {v8 .. v13}, Ll/taf;-><init>(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;Ll/ghf;Landroid/view/View;)V

    .line 153
    .line 154
    .line 155
    iput-object v8, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E0:Ll/taf;

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 158
    .line 159
    new-instance v4, Ll/y1a0;

    .line 160
    .line 161
    invoke-direct {v4, p0}, Ll/y1a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 162
    .line 163
    .line 164
    invoke-static {p1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    const-string v4, "preview_type"

    .line 172
    .line 173
    invoke-virtual {p1, v4, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-ne p1, v2, :cond_0

    .line 178
    .line 179
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->r7(Z)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->C7()Z

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->c6()V

    .line 187
    .line 188
    .line 189
    :goto_0
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final synthetic g7(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K0:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h3()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/b3a0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/b3a0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/c3a0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/c3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/d3a0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/d3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/e3a0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/e3a0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public h6(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
    .locals 2

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    return-object v1

    .line 23
    :cond_2
    if-eqz p0, :cond_4

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 26
    .line 27
    if-nez p0, :cond_3

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_4
    :goto_1
    return-object v1
.end method

.method public final synthetic h7(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->n7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic i7(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 2
    .line 3
    .line 4
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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public j3(I)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final j6(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 13
    .line 14
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic j7(ILcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->h6(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 17
    .line 18
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->a1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z2()I

    .line 24
    .line 25
    .line 26
    :cond_2
    :goto_0
    return-void
.end method

.method public k6()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "user_id"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->T:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "from"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->T:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Ljava/lang/NullPointerException;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "profilelistFrag_initArguments_userid_null,from:"

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0x3e8

    .line 55
    .line 56
    invoke-static {v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "input_type"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->U:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v1, "params_extra_map_data"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    instance-of v1, v0, Ljava/util/HashMap;

    .line 90
    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    check-cast v0, Ljava/util/HashMap;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->P:Ljava/util/HashMap;

    .line 96
    .line 97
    :cond_1
    return-void
.end method

.method public final synthetic k7(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v1, "verified"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string p0, "\u5df2\u8ba4\u8bc1"

    .line 28
    .line 29
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    const-string v0, "pending"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const-string p0, "\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 52
    .line 53
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    const-string p0, "e_edit_profile_view_edit_verification"

    .line 65
    .line 66
    const-string p1, "p_edit_profile_view"

    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final l6()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "audit_guide"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H7(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final m6()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_auto_scroll_to_question"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "p_tantanx_card"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    new-instance v0, Ll/f3a0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/f3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 v1, 0x1f4

    .line 30
    .line 31
    invoke-static {p0, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public m7(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Y:Ll/wdf;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wdf;->l(Ljava/util/List;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 3

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
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k6()V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o6()V

    .line 23
    .line 24
    .line 25
    const-string v1, "my_tab_profile_like"

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v2, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v2, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/report/f;->f(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->r6()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v1}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 72
    .line 73
    .line 74
    new-instance p1, Ll/lnf;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/lnf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K:Ll/lnf;

    .line 80
    .line 81
    return-void
.end method

.method public n6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/eu4;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 19
    .line 20
    iget-object v1, v1, Ll/fg7;->S:Lrx/subjects/b;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/h3a0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/h3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/i3a0;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/i3a0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "about_me_pop_ups"

    .line 26
    .line 27
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "about_me_banner"

    .line 37
    .line 38
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "edit_data_button"

    .line 48
    .line 49
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 57
    .line 58
    const-string v2, "edit_home_page"

    .line 59
    .line 60
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const-string v2, "other"

    .line 68
    .line 69
    :goto_0
    if-eqz v0, :cond_4

    .line 70
    .line 71
    const-string v0, "no"

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    const-string v0, "yes"

    .line 75
    .line 76
    :goto_1
    const-string v1, "about_me_is_modified"

    .line 77
    .line 78
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "previous_page"

    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    filled-new-array {v0, v1}, [Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "e_edit_personal_profile_finish"

    .line 93
    .line 94
    const-string v2, "p_edit_profile_view"

    .line 95
    .line 96
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 97
    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_9

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_9

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z2()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->a6()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_5

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->z7(Z)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->e6()Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_6

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D7(Z)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->d6()Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-eqz v2, :cond_7

    .line 156
    .line 157
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D7(Z)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_7
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_8

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_8
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F7(I)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public o7()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K2()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eq v1, v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 48
    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ll/dkb;->D9(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/v1a0;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/v1a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/w1a0;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/w1a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    const/16 v0, 0x312

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    if-ne p2, v1, :cond_3

    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0, p1}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v0, 0x1

    .line 25
    if-ne v0, p1, :cond_1

    .line 26
    .line 27
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string p1, "about_me"

    .line 34
    .line 35
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-static {p1}, Ll/jyb;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w7(Lcom/p1/mobile/putong/data/User;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    if-ne p2, v1, :cond_2

    .line 75
    .line 76
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    invoke-static {p1, v0, p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->N(ILcom/p1/mobile/putong/data/User;Landroid/content/Intent;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w7(Lcom/p1/mobile/putong/data/User;)V

    .line 98
    .line 99
    .line 100
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HIDDEN_SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 101
    .line 102
    iget p2, p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 103
    .line 104
    if-ne p1, p2, :cond_3

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o7()V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    const/16 v0, 0xdac

    .line 111
    .line 112
    if-ne p1, v0, :cond_4

    .line 113
    .line 114
    if-ne p2, v1, :cond_4

    .line 115
    .line 116
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_3

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->j(Lcom/p1/mobile/android/app/Act;)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 148
    .line 149
    const/4 p2, 0x0

    .line 150
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->u7(Ljava/util/List;Z)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 154
    .line 155
    .line 156
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 161
    .line 162
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w7(Lcom/p1/mobile/putong/data/User;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    return-void

    .line 166
    :cond_4
    const/16 v0, 0xbb9

    .line 167
    .line 168
    if-ne p1, v0, :cond_5

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 171
    .line 172
    .line 173
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w7(Lcom/p1/mobile/putong/data/User;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_5
    const/16 v0, 0xbbb

    .line 184
    .line 185
    if-ne p1, v0, :cond_6

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J3()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_6
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/app/AutoReleaseVideoFrag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->instance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->endTrance()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->F1(Z)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z2()I

    .line 16
    .line 17
    .line 18
    const-string p0, "saveInstanceKey"

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public p3(ILcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 2
    .line 3
    new-instance v1, Ll/x1a0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/x1a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ILcom/p1/mobile/putong/data/Media;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->b(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p7()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isDetached()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->s7()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->a6()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->z7(Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->e6()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D7(Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->d6()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D7(Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    if-lez v0, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->A7(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->f6()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E7()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R3()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_profile_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->z:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q7(Z)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->S:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->S:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R:Landroid/animation/Animator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 24
    .line 25
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    const/high16 v1, 0x42960000    # 75.0f

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    move v2, v0

    .line 39
    :goto_0
    if-eqz p1, :cond_3

    .line 40
    .line 41
    move p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_3
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 48
    .line 49
    move v3, v2

    .line 50
    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 51
    .line 52
    int-to-float v3, v3

    .line 53
    int-to-float p1, p1

    .line 54
    const/4 v4, 0x2

    .line 55
    new-array v8, v4, [F

    .line 56
    .line 57
    aput v3, v8, v0

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    aput p1, v8, v0

    .line 61
    .line 62
    const-wide/16 v3, 0x0

    .line 63
    .line 64
    const-wide/16 v5, 0x12c

    .line 65
    .line 66
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->R:Landroid/animation/Animator;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final r7(Z)V
    .locals 14

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 4
    .line 5
    const-string v1, "p_edit_profile_view"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "e_edit_profile_button"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "e_preview_button"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 21
    .line 22
    xor-int/lit8 v1, v0, 0x1

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-eqz p1, :cond_4

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    move v0, p1

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    neg-int v0, v0

    .line 40
    int-to-float v0, v0

    .line 41
    :goto_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 42
    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    invoke-static {}, Ll/bnl0;->y0()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    neg-int p1, p1

    .line 50
    int-to-float p1, p1

    .line 51
    :cond_3
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 52
    .line 53
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/bnl0;->y0()I

    .line 57
    .line 58
    .line 59
    move-result v11

    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D:Lv/VLinear;

    .line 61
    .line 62
    const/4 v12, 0x2

    .line 63
    new-array v10, v12, [F

    .line 64
    .line 65
    aput v0, v10, v2

    .line 66
    .line 67
    aput p1, v10, v1

    .line 68
    .line 69
    const-string v4, "translationX"

    .line 70
    .line 71
    const-wide/16 v5, 0x0

    .line 72
    .line 73
    const-wide/16 v7, 0xc8

    .line 74
    .line 75
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v13

    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B:Lv/VFrame;

    .line 80
    .line 81
    int-to-float v5, v11

    .line 82
    add-float/2addr v0, v5

    .line 83
    add-float/2addr p1, v5

    .line 84
    new-array v10, v12, [F

    .line 85
    .line 86
    aput v0, v10, v2

    .line 87
    .line 88
    aput p1, v10, v1

    .line 89
    .line 90
    const-wide/16 v5, 0x0

    .line 91
    .line 92
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    filled-new-array {v13, p1}, [Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v0, Ll/r3a0;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/r3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 107
    .line 108
    .line 109
    invoke-static {p1, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    new-instance v0, Ll/s3a0;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Ll/s3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 121
    .line 122
    .line 123
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 124
    .line 125
    if-eqz p1, :cond_5

    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E0:Ll/taf;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/taf;->m()V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->D:Lv/VLinear;

    .line 134
    .line 135
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->B:Lv/VFrame;

    .line 139
    .line 140
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    :cond_5
    :goto_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->k0:Z

    .line 144
    .line 145
    if-eqz p1, :cond_7

    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 148
    .line 149
    const-string v0, "\u7f16\u8f91\u8d44\u6599"

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 155
    .line 156
    sget v0, Ll/dbc0;->Et:I

    .line 157
    .line 158
    invoke-virtual {p1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_6

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z2()I

    .line 174
    .line 175
    .line 176
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 188
    .line 189
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_9

    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 196
    .line 197
    invoke-virtual {p1}, Ll/snf;->h()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    if-eqz p1, :cond_8

    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J:Ll/snf;

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/snf;->h()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->s()V

    .line 210
    .line 211
    .line 212
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 213
    .line 214
    const-string v0, "\u9884\u89c8\u8d44\u6599"

    .line 215
    .line 216
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H:Lv/VText;

    .line 220
    .line 221
    sget v0, Ll/dbc0;->Ft:I

    .line 222
    .line 223
    invoke-virtual {p1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->E()V

    .line 227
    .line 228
    .line 229
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 234
    .line 235
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->w7(Lcom/p1/mobile/putong/data/User;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->c6()V

    .line 239
    .line 240
    .line 241
    :cond_9
    return-void
.end method

.method public final s6()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->i8()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G0:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dkb;->xa()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/d2a0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/d2a0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/f2a0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/f2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Ll/g2a0;

    .line 44
    .line 45
    invoke-direct {v2}, Ll/g2a0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G0:Ll/kcg0;

    .line 57
    .line 58
    return-void
.end method

.method public s7()I
    .locals 4

    .line 1
    invoke-static {}, Ll/xra;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 6
    .line 7
    const-string v1, "normal"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->w:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    move v0, v2

    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge v2, v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 50
    .line 51
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_0

    .line 56
    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return v0

    .line 63
    :cond_2
    return v2

    .line 64
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->v:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    move v0, v2

    .line 73
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-ge v2, v3, :cond_5

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 84
    .line 85
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-nez v3, :cond_5

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->I:Lcom/p1/mobile/putong/data/Media;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 100
    .line 101
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_4

    .line 106
    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 108
    .line 109
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_5
    return v0

    .line 113
    :cond_6
    return v2
.end method

.method public final t6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->s6()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->q6()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->l6()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->H7(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic u6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "from_auto_scroll_to_question"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ghf;->J()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->V:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "p_tantanx_card"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/ghf;->H()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v0, -0x1

    .line 41
    :goto_0
    if-ltz v0, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Q:Ll/ghf;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/ghf;->C()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-ge v0, v1, :cond_3

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->G:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->L:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_1
    return-void
.end method

.method public userId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->T:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic v6(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {v0, p1}, Ll/eu4;->j(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic w6(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x6()Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->U:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->K:Ll/lnf;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->U:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/lnf;->e(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0
.end method

.method public final x7()V
    .locals 4

    .line 1
    const-string v0, "button"

    .line 2
    .line 3
    invoke-static {v0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->Z:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->f0(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->M:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ll/eu4;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, v0}, Ll/eu4;->i(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 48
    .line 49
    const-string v3, "profile"

    .line 50
    .line 51
    invoke-virtual {v2, v3, v0}, Ll/fg7;->i3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ll/y3a0;

    .line 60
    .line 61
    invoke-direct {v2, p0, v0}, Ll/y3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/z3a0;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/z3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->o()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic y6(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->y7(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->v7(Lcom/p1/mobile/putong/data/User;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J3()V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const v0, 0x1020002

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/q3a0;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/q3a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic z6(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->x7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final z7(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l4g0;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_lowqualityphoto_save_popup"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->J0:Ll/l4g0;

    .line 19
    .line 20
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    const-string v1, "\u68c0\u6d4b\u5230\u4e0d\u7b26\u5408\u8981\u6c42\u7684\u7167\u7247"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "\u82e5\u7ee7\u7eed\u4fdd\u5b58\uff0c\u4e0d\u7b26\u5408\u8981\u6c42\u7684\u7167\u7247(\u91cd\u590d\u56fe\u3001\u7f51\u56fe\u3001\u4e94\u5b98\u4e0d\u6e05\u6670\u6216\u6709\u906e\u6321\u7684\u7167\u7247\u7b49\uff09\u5c06\u88ab\u5220\u9664"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "\u4fdd\u5b58\u5176\u4ed6\u8d44\u6599"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/z1a0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/z1a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    const-string v1, "\u4e0d\u4fdd\u5b58"

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const-string v1, "\u7ee7\u7eed\u7f16\u8f91"

    .line 67
    .line 68
    :goto_0
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/a2a0;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1}, Ll/a2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance v0, Ll/b2a0;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/b2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ll/th0$a;->n(Landroid/content/DialogInterface$OnShowListener;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v0, Ll/c2a0;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/c2a0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 104
    .line 105
    .line 106
    return-void
.end method
