.class public Ll/d0n0;
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

.field public final d:Lcom/p1/mobile/android/app/Act;

.field public e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
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

.field public g:Ll/cm0;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
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
    iput-object v0, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    iput-object p1, p0, Ll/d0n0;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/d0n0;->c:Ll/y20;

    .line 14
    .line 15
    iput-object p3, p0, Ll/d0n0;->f:Ll/y20;

    .line 16
    .line 17
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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/d0n0;->F(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    iget-object p0, p0, Ll/d0n0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->b8:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F(Landroid/view/View;Ll/nsv;II)V
    .locals 6
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
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;

    .line 3
    .line 4
    iget-object v1, p0, Ll/d0n0;->c:Ll/y20;

    .line 5
    .line 6
    iget-object v2, p0, Ll/d0n0;->f:Ll/y20;

    .line 7
    .line 8
    iget-object v4, p0, Ll/d0n0;->g:Ll/cm0;

    .line 9
    .line 10
    iget-object v5, p0, Ll/d0n0;->h:Ljava/lang/String;

    .line 11
    .line 12
    move-object v3, p2

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->h(Ll/y20;Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
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
    iget-object p0, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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

.method public H(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V
    .locals 0
    .param p2    # Ll/cm0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/d0n0;->g:Ll/cm0;

    .line 2
    .line 3
    iget-object p2, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Ll/d0n0;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public I(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    iget-object v0, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    new-instance v1, Ll/c0n0;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/c0n0;-><init>(Ljava/lang/String;)V

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
    iget-object p2, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Ljava/util/AbstractList;->indexOf(Ljava/lang/Object;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-ltz p1, :cond_1

    .line 50
    .line 51
    iget-object p2, p0, Ll/d0n0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    invoke-virtual {p0, p1}, Ll/d0n0;->G(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
