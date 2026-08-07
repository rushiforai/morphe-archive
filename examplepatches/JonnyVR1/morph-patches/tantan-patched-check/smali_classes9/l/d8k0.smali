.class public Ll/d8k0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/tak0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

.field public B:Lv/VText;

.field public C:Landroid/widget/LinearLayout;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VText;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Landroid/view/View;

.field public L:Lv/VImage;

.field public M:Lv/VText;

.field public N:Lv/VText;

.field public O:Lv/VText;

.field public P:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

.field public Q:Lcom/p1/mobile/putong/data/User;

.field public R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

.field public S:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public T:Ll/vak0;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public o:Lv/VImage;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

.field public s:Lv/VLinear;

.field public t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

.field public u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

.field public z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;


# direct methods
.method public constructor <init>(Ll/tak0;)V
    .locals 3
    .param p1    # Ll/tak0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tak0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    sget v0, Ll/yec0;->z6:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/d8k0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->n0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L(Ll/d8k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d8k0;->f0()V

    return-void
.end method

.method public static synthetic M(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/d8k0;Ll/vak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->h0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic O(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic Q(Ll/d8k0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->j0(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "user"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic S(ILandroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v1, 0x42600000    # 56.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, p0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private S0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8k0;->l:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/h7k0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h7k0;-><init>(Ll/d8k0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/d8k0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 12
    .line 13
    new-instance v1, Ll/s7k0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/s7k0;-><init>(Ll/d8k0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/d8k0;->H:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/v7k0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/v7k0;-><init>(Ll/d8k0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/d8k0;->D:Lv/VText;

    .line 32
    .line 33
    new-instance v1, Ll/w7k0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/w7k0;-><init>(Ll/d8k0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/d8k0;->F:Lv/VText;

    .line 42
    .line 43
    new-instance v1, Ll/x7k0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/x7k0;-><init>(Ll/d8k0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 52
    .line 53
    new-instance v1, Ll/y7k0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/y7k0;-><init>(Ll/d8k0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/d8k0;->y:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 62
    .line 63
    new-instance v1, Ll/z7k0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/z7k0;-><init>(Ll/d8k0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/d8k0;->z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 72
    .line 73
    new-instance v1, Ll/a8k0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/a8k0;-><init>(Ll/d8k0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 84
    .line 85
    check-cast p0, Ll/tak0;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->f(Ll/tak0;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static synthetic T(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v1, 0x42d40000    # 106.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x42600000    # 56.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic X(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d8k0;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Ll/d8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z(Ll/d8k0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->g0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic a0(Ll/d8k0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->o0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private e0()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/d8k0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/d8k0;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->b()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iput-object v0, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 15
    .line 16
    iget-object v0, p0, Ll/d8k0;->G:Lv/VText;

    .line 17
    .line 18
    iget-object v1, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iget-object v2, p0, Ll/d8k0;->s:Lv/VLinear;

    .line 21
    .line 22
    iget-object v3, p0, Ll/d8k0;->C:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    const/4 v4, 0x4

    .line 25
    new-array v5, v4, [Landroid/view/View;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    aput-object v0, v5, v6

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    aput-object v1, v5, v0

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    aput-object v2, v5, v1

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    aput-object v3, v5, v2

    .line 38
    .line 39
    invoke-static {v6, v5}, Ll/ynp0;->w(Z[Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Ll/d8k0;->L:Lv/VImage;

    .line 43
    .line 44
    iget-object v5, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 45
    .line 46
    iget-object v7, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 47
    .line 48
    iget-object v8, p0, Ll/d8k0;->v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 49
    .line 50
    iget-object v9, p0, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 51
    .line 52
    const/4 v10, 0x5

    .line 53
    new-array v11, v10, [Landroid/view/View;

    .line 54
    .line 55
    aput-object v3, v11, v6

    .line 56
    .line 57
    aput-object v5, v11, v0

    .line 58
    .line 59
    aput-object v7, v11, v1

    .line 60
    .line 61
    aput-object v8, v11, v2

    .line 62
    .line 63
    aput-object v9, v11, v4

    .line 64
    .line 65
    invoke-static {v6, v11}, Ll/ynp0;->w(Z[Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 69
    .line 70
    iget-object v5, p0, Ll/d8k0;->o:Lv/VImage;

    .line 71
    .line 72
    iget-object v7, p0, Ll/d8k0;->D:Lv/VText;

    .line 73
    .line 74
    iget-object v8, p0, Ll/d8k0;->F:Lv/VText;

    .line 75
    .line 76
    iget-object v9, p0, Ll/d8k0;->H:Lv/VText;

    .line 77
    .line 78
    new-array v10, v10, [Landroid/view/View;

    .line 79
    .line 80
    aput-object v3, v10, v6

    .line 81
    .line 82
    aput-object v5, v10, v0

    .line 83
    .line 84
    aput-object v7, v10, v1

    .line 85
    .line 86
    aput-object v8, v10, v2

    .line 87
    .line 88
    aput-object v9, v10, v4

    .line 89
    .line 90
    invoke-static {v6, v10}, Ll/ynp0;->w(Z[Landroid/view/View;)V

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Ll/d8k0;->J:Lv/VText;

    .line 94
    .line 95
    iget-object v5, p0, Ll/d8k0;->x:Landroid/widget/LinearLayout;

    .line 96
    .line 97
    iget-object v7, p0, Ll/d8k0;->B:Lv/VText;

    .line 98
    .line 99
    iget-object v8, p0, Ll/d8k0;->M:Lv/VText;

    .line 100
    .line 101
    new-array v4, v4, [Landroid/view/View;

    .line 102
    .line 103
    aput-object v3, v4, v6

    .line 104
    .line 105
    aput-object v5, v4, v0

    .line 106
    .line 107
    aput-object v7, v4, v1

    .line 108
    .line 109
    aput-object v8, v4, v2

    .line 110
    .line 111
    invoke-static {v6, v4}, Ll/ynp0;->w(Z[Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/d8k0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/d8k0;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->e()V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/d8k0;->P:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->n0()V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->i0()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method private synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/tak0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/tak0;->a5(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final A0(Ll/vak0;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/d8k0;->v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    new-instance v9, Ll/l7k0;

    .line 8
    .line 9
    invoke-direct {v9, p0}, Ll/l7k0;-><init>(Ll/d8k0;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/vak0;->k()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p5, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->shadingBackUrl:Ljava/lang/String;

    .line 26
    .line 27
    move-object v5, p1

    .line 28
    move-object v4, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    const-string v0, ""

    .line 31
    .line 32
    move-object v4, v0

    .line 33
    move-object v5, v4

    .line 34
    :goto_1
    iget-object v2, p0, Ll/d8k0;->v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 35
    .line 36
    move v6, p2

    .line 37
    move v7, p3

    .line 38
    move-object v8, p4

    .line 39
    move-object v3, p5

    .line 40
    invoke-virtual/range {v2 .. v9}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->L(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final B0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    move-object v3, p1

    .line 16
    move-object v2, p2

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v1, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->shadingBackUrl:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v6, Ll/t7k0;

    .line 33
    .line 34
    invoke-direct {v6, p0, p1, p2}, Ll/t7k0;-><init>(Ll/d8k0;Ll/vak0;Lcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    move-object v3, p1

    .line 38
    move-object v2, p2

    .line 39
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->L(Lcom/p1/mobile/putong/data/User;Ll/vak0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :goto_0
    iget-object v7, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 44
    .line 45
    new-instance v12, Ll/r7k0;

    .line 46
    .line 47
    invoke-direct {v12, p0, v2}, Ll/r7k0;-><init>(Ll/d8k0;Lcom/p1/mobile/putong/data/User;)V

    .line 48
    .line 49
    .line 50
    const-string v10, ""

    .line 51
    .line 52
    const-string v11, ""

    .line 53
    .line 54
    move-object v8, v2

    .line 55
    move-object v9, v3

    .line 56
    invoke-virtual/range {v7 .. v12}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->L(Lcom/p1/mobile/putong/data/User;Ll/vak0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final D0(Ll/vak0;ZZLjava/lang/String;)V
    .locals 8

    .line 1
    iput-object p1, p0, Ll/d8k0;->T:Ll/vak0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p1, Ll/vak0;->c:Ll/nsv;

    .line 9
    .line 10
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    :goto_0
    iput-object v1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    move-object v1, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    invoke-virtual {p1}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    :goto_1
    iput-object v1, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 25
    .line 26
    iget-object v7, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    iget-object v0, p1, Ll/vak0;->c:Ll/nsv;

    .line 32
    .line 33
    :goto_2
    iput-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 34
    .line 35
    iget-object v0, p0, Ll/d8k0;->O:Lv/VText;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-nez v7, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    const/16 v2, 0x8

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/d8k0;->L0()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 53
    .line 54
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/d8k0;->P0()V

    .line 65
    .line 66
    .line 67
    move-object v2, p0

    .line 68
    goto/16 :goto_4

    .line 69
    .line 70
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 71
    .line 72
    check-cast v0, Ll/tak0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/tak0;->I4()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const-wide/16 v2, 0x0

    .line 79
    .line 80
    if-nez v0, :cond_5

    .line 81
    .line 82
    iget-object v0, v7, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 83
    .line 84
    iget-wide v4, v0, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->wealth:J

    .line 85
    .line 86
    cmp-long v0, v4, v2

    .line 87
    .line 88
    if-lez v0, :cond_6

    .line 89
    .line 90
    :cond_5
    iget-object v0, p0, Ll/d8k0;->s:Lv/VLinear;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 101
    .line 102
    check-cast v4, Ll/tak0;

    .line 103
    .line 104
    invoke-virtual {v4}, Ll/tak0;->I4()Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_7

    .line 109
    .line 110
    iget-object v4, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 111
    .line 112
    iget-boolean v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 113
    .line 114
    if-nez v4, :cond_7

    .line 115
    .line 116
    invoke-virtual {p0, p1, v7}, Ll/d8k0;->B0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V

    .line 117
    .line 118
    .line 119
    iget-object v4, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 120
    .line 121
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_7
    iget-object v4, v7, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 125
    .line 126
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 127
    .line 128
    cmp-long v2, v4, v2

    .line 129
    .line 130
    if-lez v2, :cond_8

    .line 131
    .line 132
    iget-object v2, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 133
    .line 134
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 135
    .line 136
    if-nez v2, :cond_8

    .line 137
    .line 138
    invoke-virtual {p0, p1, v7}, Ll/d8k0;->z0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 142
    .line 143
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object v2, v7, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 147
    .line 148
    iget-object v2, v2, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->title:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    if-nez v2, :cond_9

    .line 155
    .line 156
    move-object v2, p0

    .line 157
    move-object v3, p1

    .line 158
    move v4, p2

    .line 159
    move v5, p3

    .line 160
    move-object v6, p4

    .line 161
    invoke-virtual/range {v2 .. v7}, Ll/d8k0;->A0(Ll/vak0;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, v2, Ll/d8k0;->v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 165
    .line 166
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_9
    move-object v2, p0

    .line 171
    move-object v3, p1

    .line 172
    :goto_3
    invoke-virtual {v3}, Ll/vak0;->h()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    if-eqz p0, :cond_a

    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->schema:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-nez p1, :cond_a

    .line 185
    .line 186
    iget-object p1, v2, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 187
    .line 188
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, v2, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 192
    .line 193
    new-instance p2, Ll/j7k0;

    .line 194
    .line 195
    invoke-direct {p2, v2, p0}, Ll/j7k0;-><init>(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 196
    .line 197
    .line 198
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 199
    .line 200
    .line 201
    iget-object p0, v2, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 202
    .line 203
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    :cond_a
    invoke-virtual {v2, v0}, Ll/d8k0;->d0(Ljava/util/List;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v2}, Ll/d8k0;->I0()V

    .line 210
    .line 211
    .line 212
    :goto_4
    invoke-virtual {v2}, Ll/d8k0;->H0()V

    .line 213
    .line 214
    .line 215
    iget-object p0, v2, Ll/d8k0;->P:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 216
    .line 217
    iget-object p1, v2, Ll/d8k0;->S:Ll/nsv;

    .line 218
    .line 219
    iget-object p2, v2, Ll/d8k0;->l:Landroid/view/View;

    .line 220
    .line 221
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->y0(Ll/nsv;Landroid/view/View;)V

    .line 222
    .line 223
    .line 224
    iget-object p0, v2, Ll/d8k0;->P:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 225
    .line 226
    iget-object p1, v2, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 227
    .line 228
    iget-object p2, v2, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 229
    .line 230
    if-eqz p2, :cond_b

    .line 231
    .line 232
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 233
    .line 234
    if-eqz p2, :cond_b

    .line 235
    .line 236
    const/4 v1, 0x1

    .line 237
    :cond_b
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->D0(Landroid/view/View;Z)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public final E0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/d8k0;->D:Lv/VText;

    .line 14
    .line 15
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 16
    .line 17
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Re:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Ll/d8k0;->D:Lv/VText;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 38
    .line 39
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Se:I

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 50
    .line 51
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qe:I

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Ll/d8k0;->D:Lv/VText;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final G0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/d8k0;->G:Lv/VText;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 21
    .line 22
    check-cast v0, Ll/tak0;

    .line 23
    .line 24
    iget-object v1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    invoke-virtual {v0, v1, p1}, Ll/ms2;->W3(Lcom/p1/mobile/putong/data/User;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 30
    .line 31
    move-object v0, p1

    .line 32
    check-cast v0, Ll/tak0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/tak0;->g4()Ll/vak0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 39
    .line 40
    check-cast v1, Ll/tak0;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 47
    .line 48
    check-cast p0, Ll/tak0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p1, v0, v1, p0}, Ll/jlk0;->n(Ll/i6t;Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public H0()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_5

    .line 6
    .line 7
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/d8k0;->C:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/d8k0;->K:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/d8k0;->J:Lv/VText;

    .line 29
    .line 30
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-object v0, p0, Ll/d8k0;->K:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/d8k0;->C:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/d8k0;->J:Lv/VText;

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/d8k0;->I:Lv/VText;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    move v0, v2

    .line 60
    :goto_0
    iget-object v1, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const-string v3, "gift"

    .line 69
    .line 70
    const-string v4, "at"

    .line 71
    .line 72
    const/4 v5, 0x2

    .line 73
    const-string v6, "follow"

    .line 74
    .line 75
    const-string v7, "jumpOtherRoom"

    .line 76
    .line 77
    const/4 v8, 0x3

    .line 78
    if-ge v0, v1, :cond_9

    .line 79
    .line 80
    iget-object v1, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    const/4 v10, -0x1

    .line 98
    sparse-switch v9, :sswitch_data_0

    .line 99
    .line 100
    .line 101
    :goto_1
    move v5, v10

    .line 102
    goto :goto_2

    .line 103
    :sswitch_0
    const-string v3, "fanbaseGroup"

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_2

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    const/4 v5, 0x6

    .line 113
    goto :goto_2

    .line 114
    :sswitch_1
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_3

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_3
    const/4 v5, 0x5

    .line 122
    goto :goto_2

    .line 123
    :sswitch_2
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_4

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_4
    const/4 v5, 0x4

    .line 131
    goto :goto_2

    .line 132
    :sswitch_3
    const-string v3, "multiCall"

    .line 133
    .line 134
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_5

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    move v5, v8

    .line 142
    goto :goto_2

    .line 143
    :sswitch_4
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-nez v1, :cond_8

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :sswitch_5
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_6

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_6
    const/4 v5, 0x1

    .line 158
    goto :goto_2

    .line 159
    :sswitch_6
    const-string v3, "maskSwitch"

    .line 160
    .line 161
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-nez v1, :cond_7

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_7
    move v5, v2

    .line 169
    :cond_8
    :goto_2
    packed-switch v5, :pswitch_data_0

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :pswitch_0
    invoke-virtual {p0}, Ll/d8k0;->J0()V

    .line 174
    .line 175
    .line 176
    goto :goto_3

    .line 177
    :pswitch_1
    invoke-virtual {p0}, Ll/d8k0;->Q0()V

    .line 178
    .line 179
    .line 180
    goto :goto_3

    .line 181
    :pswitch_2
    invoke-virtual {p0}, Ll/d8k0;->E0()V

    .line 182
    .line 183
    .line 184
    goto :goto_3

    .line 185
    :pswitch_3
    invoke-virtual {p0}, Ll/d8k0;->N0()V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :pswitch_4
    iget-object v1, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 190
    .line 191
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-virtual {p0, v1}, Ll/d8k0;->G0(I)V

    .line 198
    .line 199
    .line 200
    goto :goto_3

    .line 201
    :pswitch_5
    invoke-virtual {p0}, Ll/d8k0;->K0()V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :pswitch_6
    invoke-virtual {p0}, Ll/d8k0;->O0()V

    .line 206
    .line 207
    .line 208
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    iget-object v1, p0, Ll/d8k0;->D:Lv/VText;

    .line 218
    .line 219
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_a

    .line 224
    .line 225
    iget-object v1, p0, Ll/d8k0;->D:Lv/VText;

    .line 226
    .line 227
    invoke-static {v4, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    :cond_a
    iget-object v1, p0, Ll/d8k0;->F:Lv/VText;

    .line 235
    .line 236
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-eqz v1, :cond_b

    .line 241
    .line 242
    iget-object v1, p0, Ll/d8k0;->F:Lv/VText;

    .line 243
    .line 244
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    :cond_b
    iget-object v1, p0, Ll/d8k0;->G:Lv/VText;

    .line 252
    .line 253
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_c

    .line 258
    .line 259
    iget-object v1, p0, Ll/d8k0;->G:Lv/VText;

    .line 260
    .line 261
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    :cond_c
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    iget-object v3, p0, Ll/d8k0;->H:Lv/VText;

    .line 273
    .line 274
    if-ne v1, v8, :cond_d

    .line 275
    .line 276
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    iget-object p0, p0, Ll/d8k0;->I:Lv/VText;

    .line 280
    .line 281
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_d
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-eqz v1, :cond_f

    .line 290
    .line 291
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-lt v1, v5, :cond_e

    .line 296
    .line 297
    iget-object v1, p0, Ll/d8k0;->G:Lv/VText;

    .line 298
    .line 299
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-eqz v1, :cond_e

    .line 304
    .line 305
    iget-object v1, p0, Ll/d8k0;->I:Lv/VText;

    .line 306
    .line 307
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_e

    .line 312
    .line 313
    iget-object v1, p0, Ll/d8k0;->H:Lv/VText;

    .line 314
    .line 315
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 316
    .line 317
    .line 318
    goto :goto_4

    .line 319
    :cond_e
    iget-object v1, p0, Ll/d8k0;->H:Lv/VText;

    .line 320
    .line 321
    invoke-static {v7, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    :cond_f
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-ne v0, v8, :cond_10

    .line 333
    .line 334
    iget-object p0, p0, Ll/d8k0;->I:Lv/VText;

    .line 335
    .line 336
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 337
    .line 338
    .line 339
    :cond_10
    :goto_5
    return-void

    .line 340
    nop

    .line 341
    :sswitch_data_0
    .sparse-switch
        -0x740a36c0 -> :sswitch_6
        -0x70979483 -> :sswitch_5
        -0x4ba2c44f -> :sswitch_4
        -0x47f880c9 -> :sswitch_3
        0xc33 -> :sswitch_2
        0x306930 -> :sswitch_1
        0x566d47b -> :sswitch_0
    .end sparse-switch

    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 11
    .line 12
    check-cast v0, Ll/tak0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/tak0;->h5()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 25
    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final J0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d8k0;->I:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/d8k0;->T:Ll/vak0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 10
    .line 11
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 18
    .line 19
    check-cast v2, Ll/tak0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 44
    .line 45
    check-cast v2, Ll/tak0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    move v0, v1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const/4 v0, 0x0

    .line 66
    :goto_0
    iget-object v2, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 67
    .line 68
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 69
    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v2, p0, Ll/d8k0;->I:Lv/VText;

    .line 75
    .line 76
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->p3:I

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v1}, Ll/rgg;->b(ZZ)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    iget-object v1, p0, Ll/d8k0;->I:Lv/VText;

    .line 86
    .line 87
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->x3:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 90
    .line 91
    .line 92
    :goto_1
    iget-object v1, p0, Ll/d8k0;->I:Lv/VText;

    .line 93
    .line 94
    new-instance v2, Ll/c8k0;

    .line 95
    .line 96
    invoke-direct {v2, p0, v0}, Ll/c8k0;-><init>(Ll/d8k0;Z)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final K0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/d8k0;->H:Lv/VText;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/d8k0;->H:Lv/VText;

    .line 25
    .line 26
    iget-object v1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->A5:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->B5:I

    .line 38
    .line 39
    :goto_0
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/d8k0;->H:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 52
    .line 53
    check-cast p0, Ll/tak0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/tak0;->l5()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final L0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/d8k0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/high16 v1, 0x42c80000    # 100.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/d8k0;->S:Ll/nsv;

    .line 10
    .line 11
    new-instance v3, Ll/o7k0;

    .line 12
    .line 13
    invoke-direct {v3}, Ll/o7k0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vwt;->b7()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const-string v1, ""

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x1

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 46
    .line 47
    check-cast v4, Ll/tak0;

    .line 48
    .line 49
    invoke-virtual {v4}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Ll/d8k0;->T:Ll/vak0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/vak0;->s()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    iget-object v0, p0, Ll/d8k0;->T:Ll/vak0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/vak0;->s()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->userImage:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_0

    .line 90
    .line 91
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 92
    .line 93
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 97
    .line 98
    const/high16 v4, 0x42300000    # 44.0f

    .line 99
    .line 100
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    iget-object v5, p0, Ll/d8k0;->T:Ll/vak0;

    .line 105
    .line 106
    invoke-virtual {v5}, Ll/vak0;->s()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->userImage:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v6, p0, Ll/d8k0;->T:Ll/vak0;

    .line 113
    .line 114
    invoke-virtual {v6}, Ll/vak0;->s()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->avatar:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0, v4, v5, v1, v6}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 124
    .line 125
    new-instance v4, Ll/p7k0;

    .line 126
    .line 127
    invoke-direct {v4, p0}, Ll/p7k0;-><init>(Ll/d8k0;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const v4, 0x3f59999a    # 0.85f

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;->u(F)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_0
    iget-object v0, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 147
    .line 148
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object v0, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 152
    .line 153
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/d8k0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k0()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    iget-object v4, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 163
    .line 164
    const/4 v5, 0x0

    .line 165
    if-eqz v0, :cond_1

    .line 166
    .line 167
    const/high16 v0, 0x40000000    # 2.0f

    .line 168
    .line 169
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-static {v4, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 177
    .line 178
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/d8k0;->o:Lv/VImage;

    .line 182
    .line 183
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_1
    const/high16 v0, -0x3f400000    # -6.0f

    .line 188
    .line 189
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    invoke-static {v4, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 197
    .line 198
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    iget-object v4, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 207
    .line 208
    if-nez v0, :cond_2

    .line 209
    .line 210
    sget v0, Ll/obc0;->C8:I

    .line 211
    .line 212
    invoke-virtual {v4, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/d8k0;->o:Lv/VImage;

    .line 216
    .line 217
    iget-object v4, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 218
    .line 219
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    xor-int/2addr v4, v3

    .line 224
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 228
    .line 229
    iget-object v4, p0, Ll/d8k0;->o:Lv/VImage;

    .line 230
    .line 231
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    iget-object v5, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 236
    .line 237
    iget-object v6, p0, Ll/d8k0;->o:Lv/VImage;

    .line 238
    .line 239
    invoke-virtual {v0, v4, v5, v6}, Ll/wrv;->s0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 240
    .line 241
    .line 242
    goto :goto_1

    .line 243
    :cond_2
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Ll/d8k0;->o:Lv/VImage;

    .line 247
    .line 248
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 249
    .line 250
    .line 251
    :goto_1
    iget-object v0, p0, Ll/d8k0;->T:Ll/vak0;

    .line 252
    .line 253
    invoke-virtual {v0}, Ll/vak0;->f()Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iget-object v4, p0, Ll/d8k0;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 258
    .line 259
    if-eqz v0, :cond_3

    .line 260
    .line 261
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 262
    .line 263
    .line 264
    iget-object v2, p0, Ll/d8k0;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 265
    .line 266
    const/high16 v3, 0x42400000    # 48.0f

    .line 267
    .line 268
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->userAvatar:Ljava/lang/String;

    .line 273
    .line 274
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->userAvatarFrame:Ljava/lang/String;

    .line 275
    .line 276
    invoke-static {v2, v3, v4, v5, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iget-object v1, p0, Ll/d8k0;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 280
    .line 281
    new-instance v2, Ll/q7k0;

    .line 282
    .line 283
    invoke-direct {v2, p0, v0}, Ll/q7k0;-><init>(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;)V

    .line 284
    .line 285
    .line 286
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :cond_3
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    return-void
.end method

.method public M0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->w8:I

    .line 4
    .line 5
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/n9c0;->k1:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/d8k0;->E:Lv/VText;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final N0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->D8:I

    .line 10
    .line 11
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/d8k0;->C0()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/n9c0;->e1:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/d8k0;->E:Lv/VText;

    .line 43
    .line 44
    new-instance v1, Ll/i7k0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/i7k0;-><init>(Ll/d8k0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final O0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Ll/d8k0;->J:Lv/VText;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final P0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8k0;->B:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast v0, Ll/tak0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v2, Ll/k7k0;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/k7k0;-><init>(Ll/d8k0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/tak0;->G4(Ljava/lang/String;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final Q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8k0;->S:Ll/nsv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/d8k0;->F:Lv/VText;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Ll/xak0;->i()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/d8k0;->F:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public R0(Landroid/view/View;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->P0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Ll/b8k0;

    .line 16
    .line 17
    invoke-direct {v0, p0, p2}, Ll/b8k0;-><init>(Ll/d8k0;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public T0(ZLl/vak0;ZZLjava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/vak0;->o()Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/d8k0;->e0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/d8k0;->D0(Ll/vak0;ZZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/d8k0;->N:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/vak0;->o()Ll/nsv;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Ll/d8k0;->R0(Landroid/view/View;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final b0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e8k0;->a(Ll/d8k0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c0(Ll/tak0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tak0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final d0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x3

    .line 6
    const/high16 v1, 0x41100000    # 9.0f

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 v0, 0x42680000    # 58.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr p0, v0

    .line 22
    int-to-float p0, p0

    .line 23
    const/high16 v0, 0x40400000    # 3.0f

    .line 24
    .line 25
    div-float/2addr p0, v0

    .line 26
    float-to-int p0, p0

    .line 27
    new-instance v0, Ll/m7k0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/m7k0;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Landroid/view/View;

    .line 40
    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Landroid/view/View;

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    new-instance p0, Ll/n7k0;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/n7k0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-le p0, v2, :cond_1

    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Landroid/view/View;

    .line 82
    .line 83
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method

.method public final synthetic f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->S(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic h0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 6
    .line 7
    new-instance v1, Ll/u7k0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/u7k0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 43
    .line 44
    check-cast p0, Ll/tak0;

    .line 45
    .line 46
    const/16 p1, 0xed8

    .line 47
    .line 48
    iget-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->jumpScheme:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1, p2}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object p0, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;->S(Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p2, Ll/tak0;

    .line 4
    .line 5
    const/16 v0, 0xed8

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->schema:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, v0, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 13
    .line 14
    check-cast p0, Ll/tak0;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Ll/tak0;->D4(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tak0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d8k0;->c0(Ll/tak0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic j0(ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/d8k0;->R:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    check-cast p0, Ll/tak0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showFansGroupPanel()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    check-cast p0, Ll/tak0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/tak0;->C4()V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    invoke-static {p0, p0}, Ll/rgg;->a(ZZ)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    iget-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    check-cast p2, Ll/tak0;

    .line 53
    .line 54
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showFansGroupPanel()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    check-cast p2, Ll/tak0;

    .line 71
    .line 72
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showApplyDialog()Ll/v3f$d;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p0, p0, Ll/d8k0;->T:Ll/vak0;

    .line 83
    .line 84
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 85
    .line 86
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->r3:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/tak0;->j5()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    const/16 p2, 0xed8

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->schema:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/d8k0;->b0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->M7:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 11
    .line 12
    iput-object p1, p0, Ll/d8k0;->P:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->setDialogHost(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/d8k0;->S0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/tak0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    sget-object v0, Ll/cd10;->D:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0}, Ll/tak0;->e5(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tak0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d8k0;->c0(Ll/tak0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d8k0;->B:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/tak0;->i5(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ms2;->Y3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/d8k0;->S:Ll/nsv;

    .line 6
    .line 7
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/e3t;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 19
    .line 20
    check-cast p1, Ll/tak0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/d8k0;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/d8k0;->S:Ll/nsv;

    .line 27
    .line 28
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1, p0}, Ll/tak0;->c5(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tak0;->Y4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d8k0;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/tak0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/tak0;->f5(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tak0;->Z4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/tak0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/tak0;->b5(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x0(Ll/d36;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j(Ll/d36;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "@"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/d8k0;->Q:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, " "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sget v2, Ll/ix4;->E:I

    .line 34
    .line 35
    if-le v1, v2, :cond_1

    .line 36
    .line 37
    add-int/lit8 v2, v2, -0x4

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "... "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 51
    .line 52
    check-cast p0, Ll/tak0;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/tak0;->X4(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final z0(Ll/vak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->shadingBackUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 35
    .line 36
    const-string p1, ""

    .line 37
    .line 38
    invoke-virtual {p0, p2, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;->O(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
