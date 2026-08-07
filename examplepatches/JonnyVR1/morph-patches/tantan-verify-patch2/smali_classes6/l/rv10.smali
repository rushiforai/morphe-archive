.class public Ll/rv10;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/data/Music;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:Ll/qw10;

.field public j:Ll/epr;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/qw10;)V
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
    iput-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/rv10;->e:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/rv10;->h:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/rv10;->c:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p2, p0, Ll/rv10;->i:Ll/qw10;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic F(Ll/rv10;Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rv10;->M(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic G(Ll/rv10;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10;->e:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rv10;->I(Landroid/view/View;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x2

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/tec0;->U4:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x3

    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/tec0;->e:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Ll/tec0;->V4:I

    .line 47
    .line 48
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10;->c:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)V
    .locals 1

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p3, p2, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;

    .line 5
    .line 6
    iget-object p2, p0, Ll/rv10;->g:Ll/y20;

    .line 7
    .line 8
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->i:Ll/y20;

    .line 9
    .line 10
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->h:Ll/rv10;

    .line 11
    .line 12
    iget-object p0, p0, Ll/rv10;->f:Lcom/p1/mobile/putong/data/Music;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateHeader;->r(Lcom/p1/mobile/putong/data/Music;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p4}, Ll/rv10;->getItemViewType(I)I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 v0, 0x3

    .line 23
    if-ne p3, v0, :cond_1

    .line 24
    .line 25
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 26
    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/rv10;->O(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    if-lez p4, :cond_2

    .line 36
    .line 37
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;

    .line 38
    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;

    .line 42
    .line 43
    iget-object p0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 44
    .line 45
    sub-int/2addr p4, p2

    .line 46
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->e(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/qv10;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/qv10;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/data/Music;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Music;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/api/a;->b2(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/pv10;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/pv10;-><init>(Ll/rv10;Lcom/p1/mobile/putong/data/Music;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->A2(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public N()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rv10;->h:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 5

    .line 1
    sget v0, Ll/lbc0;->h6:I

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/rv10;->h:Z

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    const/16 v3, 0x78

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->X0:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v1, p0, Ll/rv10;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->l4:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget v0, Ll/lbc0;->l6:I

    .line 42
    .line 43
    const/16 v2, 0x3c

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    move v3, v4

    .line 47
    move v4, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {p0}, Ll/rv10;->H()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->w1:I

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 60
    .line 61
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    int-to-float p0, v2

    .line 77
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-static {p1, p0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    int-to-float p0, v3

    .line 85
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-static {p1, p0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public P(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 13
    .line 14
    iput-object v0, p0, Ll/rv10;->e:Ljava/util/List;

    .line 15
    .line 16
    new-instance v0, Ll/rv10$a;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1}, Ll/rv10$a;-><init>(Ll/rv10;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Landroidx/recyclerview/widget/g;->c(Landroidx/recyclerview/widget/g$b;Z)Landroidx/recyclerview/widget/g$e;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/rv10;->j:Ll/epr;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Ll/rv10$b;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/rv10$b;-><init>(Ll/rv10;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Ll/rv10;->j:Ll/epr;

    .line 36
    .line 37
    :cond_1
    iget-object v1, p0, Ll/rv10;->j:Ll/epr;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/g$e;->c(Ll/epr;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/Music;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rv10;->f:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Ll/rv10;->f:Lcom/p1/mobile/putong/data/Music;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public R(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rv10;->g:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rv10;->f:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput v1, v0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rv10;->d:Ljava/util/List;

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
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x5

    .line 14
    .line 15
    if-le p1, v0, :cond_0

    .line 16
    .line 17
    iget-boolean p1, p0, Ll/rv10;->h:Z

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/rv10;->i:Ll/qw10;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/qw10;->u0()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rv10;->L(I)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/rv10;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr p0, v0

    .line 12
    if-lt p1, p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x3

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x2

    .line 17
    return p0
.end method
