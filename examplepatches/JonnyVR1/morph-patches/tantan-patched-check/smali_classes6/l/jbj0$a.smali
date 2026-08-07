.class public Ll/jbj0$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jbj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ljava/lang/String;

.field public f:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/jbj0;


# direct methods
.method public constructor <init>(Ll/jbj0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbj0$a;->g:Ll/jbj0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/jbj0$a;->c:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ll/jbj0$a$a;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/jbj0$a$a;-><init>(Ll/jbj0$a;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/jbj0$a;->f:Ll/h80;

    .line 19
    .line 20
    iput-object p2, p0, Ll/jbj0$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Ll/jbj0$a;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jbj0$a;->H(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/jbj0$a;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, "topic_attribute"

    .line 22
    .line 23
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "p_add_topic_pop"

    .line 28
    .line 29
    invoke-virtual {p2, p1, v2, v0}, Ll/er60;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/jbj0$a;->g:Ll/jbj0;

    .line 33
    .line 34
    invoke-static {p0, p1, v1}, Ll/jbj0;->h(Ll/jbj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jbj0$a;->F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbj0$a;->c:Ljava/util/List;

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
    iget-object p0, p0, Ll/jbj0$a;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/tec0;->H3:I

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

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/jbj0$a;->f:Ll/h80;

    .line 2
    .line 3
    invoke-virtual {p3, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    move-object p3, p1

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/mediapicker/buildtopic/TopicSearchAssociationItemView;

    .line 8
    .line 9
    invoke-virtual {p3, p4, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/buildtopic/TopicSearchAssociationItemView;->b(ILcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    iget-object p4, p0, Ll/jbj0$a;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-eqz p4, :cond_0

    .line 23
    .line 24
    const/4 p4, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p4, 0x2

    .line 27
    :goto_0
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    const-string v0, "topic_attribute"

    .line 32
    .line 33
    invoke-static {v0, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    const-string v0, "p_add_topic_pop"

    .line 38
    .line 39
    invoke-virtual {p3, p2, v0, p4}, Ll/er60;->d(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    new-instance p3, Ll/ibj0;

    .line 43
    .line 44
    invoke-direct {p3, p0, p2}, Ll/ibj0;-><init>(Ll/jbj0$a;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbj0$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbj0$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    new-instance p2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Ll/jbj0$a;->c:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/jbj0$a;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbj0$a;->G(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;

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
    iget-object p0, p0, Ll/jbj0$a;->f:Ll/h80;

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
    iget-object p0, p0, Ll/jbj0$a;->f:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
