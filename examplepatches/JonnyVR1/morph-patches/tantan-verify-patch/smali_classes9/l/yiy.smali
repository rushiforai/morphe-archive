.class public Ll/yiy;
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
    iput-object v0, p0, Ll/yiy;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    iput-boolean p2, p0, Ll/yiy;->g:Z

    .line 12
    .line 13
    iput-object p1, p0, Ll/yiy;->d:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iput-object p3, p0, Ll/yiy;->c:Ll/y20;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/yiy;->E(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yiy;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    iget-object p0, p0, Ll/yiy;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->N3:I

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
    .locals 0
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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 2
    .line 3
    iget-object p3, p0, Ll/yiy;->c:Ll/y20;

    .line 4
    .line 5
    iget-object p4, p0, Ll/yiy;->f:Ll/cm0;

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/yiy;->g:Z

    .line 8
    .line 9
    invoke-virtual {p1, p3, p2, p4, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->t(Ll/y20;Ll/nsv;Ll/cm0;Z)V

    .line 10
    .line 11
    .line 12
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
    iget-object p0, p0, Ll/yiy;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    iput-object p2, p0, Ll/yiy;->f:Ll/cm0;

    .line 2
    .line 3
    iget-object p2, p0, Ll/yiy;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/yiy;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

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
    invoke-virtual {p0, p1}, Ll/yiy;->F(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
