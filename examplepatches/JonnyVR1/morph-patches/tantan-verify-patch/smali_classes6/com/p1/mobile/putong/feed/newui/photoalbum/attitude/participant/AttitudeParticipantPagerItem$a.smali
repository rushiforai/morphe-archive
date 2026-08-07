.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->f:Ll/h80;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->E(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->F:I

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

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/data/User;II)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->f:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p3, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr v0, p1

    .line 16
    const/4 p1, 0x3

    .line 17
    if-ge v0, p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;

    .line 20
    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;->b()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;->c()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->F(I)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->f:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->f:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
