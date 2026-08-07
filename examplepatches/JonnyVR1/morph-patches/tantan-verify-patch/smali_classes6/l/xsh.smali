.class public Ll/xsh;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
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
    iput-object v0, p0, Ll/xsh;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/xsh;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/xsh;Lcom/p1/mobile/putong/feed/data/NotifyUsers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xsh;->I(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xsh;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/NotifyUsers;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsh;->c:Ljava/util/List;

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
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xsh;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/NotifyUsers;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;->d(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/dth;->b()Z

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;->b()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/xsh;->H(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/feed/data/NotifyUsers;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsh;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 8
    .line 9
    return-object p0
.end method

.method public final H(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostAtDialogItem;Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 1

    .line 1
    new-instance v0, Ll/wsh;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/wsh;-><init>(Ll/xsh;Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/dth;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p2, p0, Ll/xsh;->e:Ll/y20;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/xsh;->e:Ll/y20;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "robotname"

    .line 22
    .line 23
    invoke-static {}, Ll/dth;->g()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_at_robot"

    .line 36
    .line 37
    const-string p2, "p_at_list"

    .line 38
    .line 39
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xsh;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xsh;->e:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xsh;->G(I)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
