.class public Ll/mk30$e;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mk30;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Z

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ll/mk30;


# direct methods
.method public constructor <init>(Ll/mk30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/mk30$e;->c:Z

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic F(Ll/mk30$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30$e;->L(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Ll/mk30$e;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30$e;->K(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic H(Ll/mk30$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mk30$e;->M(Ljava/lang/String;)V

    return-void
.end method

.method private M(Ljava/lang/String;)V
    .locals 1

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
    iget-boolean v0, p0, Ll/mk30$e;->c:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/qk30;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/qk30;-><init>(Ll/mk30$e;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/mk30$e;->I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30$e;->d:Ljava/util/List;

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
    iget-object p0, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mk30;->k(Ll/mk30;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->U7:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 8
    .line 9
    invoke-static {p1}, Ll/mk30;->n(Ll/mk30;)Lcom/p1/mobile/android/app/Frag;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v4, Ll/ok30;

    .line 16
    .line 17
    invoke-direct {v4, p0}, Ll/ok30;-><init>(Ll/mk30$e;)V

    .line 18
    .line 19
    .line 20
    new-instance v5, Ll/pk30;

    .line 21
    .line 22
    invoke-direct {v5, p0}, Ll/pk30;-><init>(Ll/mk30$e;)V

    .line 23
    .line 24
    .line 25
    move-object v2, p0

    .line 26
    move v6, p4

    .line 27
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->j(Lcom/p1/mobile/android/app/Frag;Ll/jic0;Ljava/lang/String;Ll/y20;Ll/y20;I)V

    .line 28
    .line 29
    .line 30
    iget-boolean p0, v2, Ll/mk30$e;->c:Z

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    iget-object p0, v2, Ll/mk30$e;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/lit8 p0, p0, -0x3

    .line 41
    .line 42
    if-lt v6, p0, :cond_0

    .line 43
    .line 44
    iget-object p0, v2, Ll/mk30$e;->d:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    const/16 p1, 0xa

    .line 51
    .line 52
    if-le p0, p1, :cond_0

    .line 53
    .line 54
    iget-object p0, v2, Ll/mk30$e;->e:Ll/mk30;

    .line 55
    .line 56
    invoke-static {p0}, Ll/mk30;->q(Ll/mk30;)Ll/dk30;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 p1, 0x1

    .line 61
    invoke-virtual {p0, p1}, Ll/dk30;->r0(Z)V

    .line 62
    .line 63
    .line 64
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "p_new_match"

    .line 75
    .line 76
    const/4 p3, 0x0

    .line 77
    invoke-static {p2, p0, v6, p1, p3}, Ll/dj0;->e(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;ILjava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mk30;->q(Ll/mk30;)Ll/dk30;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/dk30;->l0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic L(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/rk30;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/rk30;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 21
    .line 22
    invoke-static {v0}, Ll/mk30;->p(Ll/mk30;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 29
    .line 30
    invoke-static {p0}, Ll/mk30;->s(Ll/mk30;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-boolean p0, p0, Ll/mk30$e;->c:Z

    .line 59
    .line 60
    invoke-virtual {p1, v0, p0}, Ll/mk30;->L(Ljava/util/List;Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/mk30$e;->e:Ll/mk30;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-boolean p0, p0, Ll/mk30$e;->c:Z

    .line 22
    .line 23
    invoke-virtual {p1, v0, p0}, Ll/mk30;->L(Ljava/util/List;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public O(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/mk30$e;->c:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p2, :cond_1

    .line 7
    .line 8
    new-instance p2, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iput-object p1, p0, Ll/mk30$e;->d:Ljava/util/List;

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mk30$e;->J(I)Lcom/p1/mobile/putong/core/data/Conversation;

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
    invoke-virtual {p0, p1}, Ll/mk30$e;->J(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-long p0, p0

    .line 12
    return-wide p0
.end method
