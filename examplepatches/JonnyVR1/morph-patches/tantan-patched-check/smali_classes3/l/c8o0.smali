.class public Ll/c8o0;
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

.field public f:Ll/cm0;

.field public g:Z

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
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
    iput-object v0, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Ll/c8o0;->h:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p2, p0, Ll/c8o0;->g:Z

    .line 16
    .line 17
    iput-object p1, p0, Ll/c8o0;->d:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iput-object p3, p0, Ll/c8o0;->c:Ll/y20;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 23
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    iput-object v0, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 24
    iput-boolean p2, p0, Ll/c8o0;->g:Z

    .line 25
    iput-object p1, p0, Ll/c8o0;->d:Lcom/p1/mobile/android/app/Act;

    .line 26
    iput-object p3, p0, Ll/c8o0;->c:Ll/y20;

    .line 27
    iput-object p4, p0, Ll/c8o0;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c8o0;->E(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    iget-object p0, p0, Ll/c8o0;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->G9:I

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

.method public E(Landroid/view/View;Ll/nsv;II)V
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
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;

    .line 3
    .line 4
    iget-object v1, p0, Ll/c8o0;->c:Ll/y20;

    .line 5
    .line 6
    iget-object v3, p0, Ll/c8o0;->f:Ll/cm0;

    .line 7
    .line 8
    iget-boolean v4, p0, Ll/c8o0;->g:Z

    .line 9
    .line 10
    iget-object v5, p0, Ll/c8o0;->h:Ljava/lang/String;

    .line 11
    .line 12
    move-object v2, p2

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->g(Ll/y20;Ll/nsv;Ll/cm0;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public F(I)Ll/nsv;
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
    iget-object p0, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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

.method public G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V
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
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/c8o0;->f:Ll/cm0;

    .line 2
    .line 3
    iget-object p2, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/c8o0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c8o0;->F(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
