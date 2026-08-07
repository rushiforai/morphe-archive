.class public Ll/gky;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/nsv<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/bly;

.field public final e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;>;"
        }
    .end annotation
.end field

.field public final g:I

.field public final h:I

.field public i:Ll/p7o0;


# direct methods
.method public constructor <init>(Ll/bly;Ll/y20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bly;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/gky;->g:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput v0, p0, Ll/gky;->h:I

    .line 16
    .line 17
    iput-object p1, p0, Ll/gky;->d:Ll/bly;

    .line 18
    .line 19
    iput-object p2, p0, Ll/gky;->c:Ll/y20;

    .line 20
    .line 21
    iput-object p3, p0, Ll/gky;->f:Ll/y20;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic E(Ljava/lang/String;Ll/nsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/gky;->F(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gky;->d:Ll/bly;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/yec0;->ja:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p2, Ll/yec0;->M9:I

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public F(Landroid/view/View;Ll/nsv;II)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;II)V"
        }
    .end annotation

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleInHeaderItemIView;

    .line 4
    .line 5
    iget-object p2, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->size()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 p3, 0x0

    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/lit8 p0, p0, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p0, p3

    .line 24
    :goto_0
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleInHeaderItemIView;->l(II)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    move-object v0, p1

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;

    .line 30
    .line 31
    iget-object p1, p0, Ll/gky;->d:Ll/bly;

    .line 32
    .line 33
    invoke-static {p1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object p1, p0, Ll/gky;->d:Ll/bly;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Ll/gky;->d:Ll/bly;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 64
    .line 65
    :goto_1
    move-object v2, p1

    .line 66
    goto :goto_2

    .line 67
    :cond_2
    const/4 p1, 0x0

    .line 68
    goto :goto_1

    .line 69
    :goto_2
    iget-object v3, p0, Ll/gky;->c:Ll/y20;

    .line 70
    .line 71
    iget-object v4, p0, Ll/gky;->f:Ll/y20;

    .line 72
    .line 73
    iget-object p0, p0, Ll/gky;->i:Ll/p7o0;

    .line 74
    .line 75
    iget-object p0, p0, Ll/p7o0;->b:Ljava/util/HashMap;

    .line 76
    .line 77
    iget-object p1, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    move-object v6, p0

    .line 88
    check-cast v6, Ljava/lang/String;

    .line 89
    .line 90
    move-object v5, p2

    .line 91
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLineItemView;->l0(Ljava/lang/Boolean;Ljava/lang/String;Ll/y20;Ll/y20;Ll/nsv;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public G(I)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    return-object p0
.end method

.method public final H(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-le p0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/nsv;

    .line 20
    .line 21
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ll/nsv;

    .line 32
    .line 33
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    return v1

    .line 46
    :cond_0
    return v0
.end method

.method public I(Ll/p7o0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    iput-object p1, p0, Ll/gky;->i:Ll/p7o0;

    .line 4
    .line 5
    iget-object p1, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->clear()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Ll/gky;->H(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {v0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/nsv;

    .line 29
    .line 30
    invoke-virtual {v0, p1, v1}, Ljava/util/AbstractList;->add(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public J(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    new-instance v1, Ll/fky;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/fky;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/nsv;

    .line 21
    .line 22
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;->state:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInviteState;

    .line 27
    .line 28
    const-string v1, "not-invited"

    .line 29
    .line 30
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    const-string p2, "canInvite"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p2, "invited"

    .line 40
    .line 41
    :goto_0
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p2, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Ljava/util/AbstractList;->indexOf(Ljava/lang/Object;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-lez p1, :cond_1

    .line 50
    .line 51
    iget-object p2, p0, Ll/gky;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->size()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-ge p1, p2, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gky;->G(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method
