.class public Ll/bqh;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bqh$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/cqh;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/data/MessageLocation;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cqh;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/bqh$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
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
    iput-object v0, p0, Ll/bqh;->g:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/bqh;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/bqh;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Ll/bqh;->f:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E(Ll/g90;Ll/cqh;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/cqh;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/g90;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic F(Ll/bqh;Ll/cqh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bqh;->M(Ll/cqh;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/bqh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bqh;->L(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bqh;->P()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bqh;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Ll/fph;->K:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/bqh;->d:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget v0, Ll/a8c0;->i:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/cqh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bqh;->H(Landroid/view/View;Ll/cqh;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqh;->g:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    new-instance p1, Landroid/view/View;

    .line 5
    .line 6
    iget-object p0, p0, Ll/bqh;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 12
    .line 13
    sget p2, Ll/qa00;->y:I

    .line 14
    .line 15
    sget v0, Ll/qa00;->a:I

    .line 16
    .line 17
    invoke-direct {p0, p2, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-object p1

    .line 24
    :cond_0
    iget-object p0, p0, Ll/bqh;->d:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Ll/tec0;->k2:I

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public H(Landroid/view/View;Ll/cqh;II)V
    .locals 0

    .line 1
    const/4 p4, 0x2

    .line 2
    if-ne p3, p4, :cond_1

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogLocationItem;

    .line 5
    .line 6
    iget p3, p2, Ll/cqh;->b:I

    .line 7
    .line 8
    const/4 p4, 0x5

    .line 9
    if-ne p3, p4, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogLocationItem;->Q()V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/zph;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Ll/zph;-><init>(Ll/bqh;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p3, p2, Ll/cqh;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 24
    .line 25
    iget-object p4, p3, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p3}, Ll/bqh;->K(Lcom/p1/mobile/putong/data/MessageLocation;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    invoke-virtual {p1, p4, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogLocationItem;->R(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    new-instance p3, Ll/aqh;

    .line 35
    .line 36
    invoke-direct {p3, p0, p2}, Ll/aqh;-><init>(Ll/bqh;Ll/cqh;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public I(I)Ll/cqh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqh;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/cqh;

    .line 8
    .line 9
    return-object p0
.end method

.method public J(Ll/g90;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Ll/bqh;->g:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-gt v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Ll/bqh;->g:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/yph;

    .line 18
    .line 19
    invoke-direct {v2, p1}, Ll/yph;-><init>(Ll/g90;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/cqh;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget-object p1, v0, Ll/cqh;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/bqh;->Q(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-static {p1}, Ll/vh80;->d(Ll/g90;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/cqh;

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-direct {v0, p1, v2}, Ll/cqh;-><init>(Lcom/p1/mobile/putong/data/MessageLocation;I)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/bqh;->g:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Ll/cqh;

    .line 57
    .line 58
    iget v3, v3, Ll/cqh;->b:I

    .line 59
    .line 60
    iget-object v4, p0, Ll/bqh;->g:Ljava/util/List;

    .line 61
    .line 62
    if-ne v3, v2, :cond_2

    .line 63
    .line 64
    invoke-interface {v4, v1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-interface {v4, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    invoke-virtual {p0, p1}, Ll/bqh;->Q(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/data/MessageLocation;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqh;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic M(Ll/cqh;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/cqh;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p0, p1, p2}, Ll/bqh;->R(Lcom/p1/mobile/putong/data/MessageLocation;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N(Ljava/util/List;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/cqh;",
            ">;",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bqh;->g:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bqh;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O(Ll/bqh$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bqh;->h:Ll/bqh$a;

    .line 2
    .line 3
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/bqh;->R(Lcom/p1/mobile/putong/data/MessageLocation;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/data/MessageLocation;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/bqh;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    :cond_1
    iput-object p1, p0, Ll/bqh;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/bqh;->h:Ll/bqh$a;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Ll/bqh;->h:Ll/bqh$a;

    .line 32
    .line 33
    iget-object v0, p0, Ll/bqh;->c:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 34
    .line 35
    invoke-interface {p1, v0}, Ll/bqh$a;->l(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    if-eqz p2, :cond_3

    .line 39
    .line 40
    const-string p1, "e_poi_tag"

    .line 41
    .line 42
    iget-object p0, p0, Ll/bqh;->e:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bqh;->I(I)Ll/cqh;

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
    invoke-virtual {p0, p1}, Ll/bqh;->I(I)Ll/cqh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Ll/cqh;->b:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    if-ne p0, p1, :cond_0

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    const/4 p0, 0x2

    .line 12
    return p0
.end method
