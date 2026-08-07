.class public Ll/upk;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Ll/ner;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/GroupTab;",
        ">;",
        "Ll/ner;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupTab;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/hpk;

.field public final f:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/hpk;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Ll/upk;->d:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/upk;->f:Ljava/util/HashSet;

    .line 14
    .line 15
    iput-object p1, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iput-object p2, p0, Ll/upk;->e:Ll/hpk;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/upk;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/GroupTab;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upk;->d:Ljava/util/List;

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
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->k:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/GroupTab;II)V
    .locals 0

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/core/newui/group/GroupTabItemView;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/group/GroupTabItemView;

    .line 6
    .line 7
    invoke-virtual {p0, p4}, Ll/upk;->F(I)Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/group/GroupTabItemView;->d(Lcom/p1/mobile/putong/core/data/GroupTab;Ll/ner;)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Ll/upk;->e:Ll/hpk;

    .line 15
    .line 16
    invoke-virtual {p3, p1, p2}, Ll/hpk;->Q0(Lcom/p1/mobile/putong/core/newui/group/GroupTabItemView;Lcom/p1/mobile/putong/core/data/GroupTab;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/upk;->f:Ljava/util/HashSet;

    .line 20
    .line 21
    iget p3, p2, Lcom/p1/mobile/putong/core/data/GroupTab;->id:I

    .line 22
    .line 23
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p1, p3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Ll/upk;->e:Ll/hpk;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/hpk;->pageId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string p3, "group_chat_type"

    .line 40
    .line 41
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/GroupTab;->name:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p3, p4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    filled-new-array {p3}, [Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const-string p4, "e_group_chat_type_tab"

    .line 52
    .line 53
    invoke-static {p4, p1, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/upk;->f:Ljava/util/HashSet;

    .line 57
    .line 58
    iget p1, p2, Lcom/p1/mobile/putong/core/data/GroupTab;->id:I

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/data/GroupTab;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upk;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/upk;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public creates(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 7
    iget-object p0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrx/c;

    invoke-virtual {p0, v0, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lrx/c;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1, p2}, Ll/jic0;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 15
    iget-object v0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    invoke-super {p0, v0, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/upk;->F(I)Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public lifecycle()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
