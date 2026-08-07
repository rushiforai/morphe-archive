.class public Ll/pei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;

.field public c:Lv/VText;

.field public d:Ljava/lang/Boolean;

.field public e:I

.field public f:Ll/kcg0;

.field public g:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/pei;->d:Ljava/lang/Boolean;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/pei;->e:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/pei;->f:Ll/kcg0;

    .line 13
    .line 14
    iput-object v0, p0, Ll/pei;->g:Ll/kcg0;

    .line 15
    .line 16
    iput-object p1, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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

.method public static synthetic i(Ll/pei;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pei;->q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    return-void
.end method

.method public static synthetic j(Ll/pei;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pei;->o()V

    return-void
.end method

.method public static synthetic k(Ll/pei;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pei;->p(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 1

    .line 1
    sget p3, Ll/kec0;->p3:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->ac:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/VText;

    .line 15
    .line 16
    iput-object p2, p0, Ll/pei;->c:Lv/VText;

    .line 17
    .line 18
    return-object p1
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p3, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    iget-object p3, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 24
    .line 25
    .line 26
    instance-of p3, p1, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;

    .line 27
    .line 28
    if-eqz p3, :cond_0

    .line 29
    .line 30
    iput p2, p0, Ll/pei;->e:I

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;

    .line 33
    .line 34
    iput-object p1, p0, Ll/pei;->b:Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;

    .line 35
    .line 36
    iget-object p2, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 37
    .line 38
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 41
    .line 42
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->l3()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p1, p2, p0, p3}, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->h(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/pei;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Ll/pei;->r()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eq p1, p2, :cond_1

    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p1, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 14
    :goto_1
    invoke-static {}, Ll/joa;->M3()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-static {}, Ll/of7;->u()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    iget-object p2, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v1, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "button"

    .line 41
    .line 42
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    if-eqz p1, :cond_3

    .line 50
    .line 51
    const-string p1, "right"

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    const-string p1, "left"

    .line 55
    .line 56
    :goto_2
    const-string p2, "swipe_direction"

    .line 57
    .line 58
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    filled-new-array {p1}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string p2, "e_trial_end_card"

    .line 67
    .line 68
    const-string v0, "p_suggest_users_home_view"

    .line 69
    .line 70
    invoke-static {p2, v0, p1}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/pei;->f:Ll/kcg0;

    .line 74
    .line 75
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/pei;->g:Ll/kcg0;

    .line 79
    .line 80
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 84
    .line 85
    new-instance p2, Ll/jei;

    .line 86
    .line 87
    invoke-direct {p2, p0}, Ll/jei;-><init>(Ll/pei;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v0, 0x190

    .line 91
    .line 92
    invoke-static {p1, p2, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 93
    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 96
    .line 97
    return-object p0
.end method

.method public final n()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o6()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pei;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p(Ljava/lang/Boolean;)V
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
    iget p1, p0, Ll/pei;->e:I

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/pei;->e:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v0, "prePending"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    const-string v0, "pending"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p1, p0, Ll/pei;->c:Lv/VText;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    iget-object p0, p0, Ll/pei;->c:Lv/VText;

    .line 47
    .line 48
    const-string p1, "\u53bb\u8ba4\u8bc1"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/pei;->c:Lv/VText;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/pei;->c:Lv/VText;

    .line 63
    .line 64
    const-string p1, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/pei;->f:Ll/kcg0;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 21
    .line 22
    const-string v2, "svip"

    .line 23
    .line 24
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/kei;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/kei;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/lei;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/lei;-><init>(Ll/pei;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/pei;->f:Ll/kcg0;

    .line 72
    .line 73
    :cond_2
    iget-object v0, p0, Ll/pei;->g:Ll/kcg0;

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    :goto_0
    return-void

    .line 85
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/pei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 86
    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/mei;

    .line 104
    .line 105
    invoke-direct {v1}, Ll/mei;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/nei;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/nei;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/oei;

    .line 122
    .line 123
    invoke-direct {v1, p0}, Ll/oei;-><init>(Ll/pei;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Ll/pei;->g:Ll/kcg0;

    .line 135
    .line 136
    return-void
.end method
