.class public Ll/m2i;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/BubbleInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
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
    iput-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/m2i$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/m2i$a;-><init>(Ll/m2i;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/m2i;->h:Ll/h80;

    .line 17
    .line 18
    iput-object p1, p0, Ll/m2i;->d:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iput-object p2, p0, Ll/m2i;->g:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Ll/m2i;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m2i;->M(Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/m2i;ILcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m2i;->N(ILcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic G(Ll/m2i;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static I(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 2
    .line 3
    const-wide v2, 0x4194997000000000L    # 8.64E7

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    add-double/2addr v0, v2

    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    long-to-double v2, v2

    .line 14
    sub-double/2addr v0, v2

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmpl-double p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private K()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m2i;->g:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/m2i;->H(Landroid/view/View;Lcom/p1/mobile/putong/data/BubbleInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2i;->c:Ljava/util/List;

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
    const/4 p1, 0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;

    .line 5
    .line 6
    iget-object p0, p0, Ll/m2i;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;

    .line 13
    .line 14
    iget-object p0, p0, Ll/m2i;->d:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/data/BubbleInfo;II)V
    .locals 0

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;

    .line 2
    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p4}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->u(Lcom/p1/mobile/putong/data/BubbleInfo;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p4, p1}, Ll/m2i;->L(ILcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;)V

    .line 11
    .line 12
    .line 13
    if-nez p4, :cond_0

    .line 14
    .line 15
    instance-of p1, p2, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    invoke-virtual {p0, p2, p1}, Ll/m2i;->P(Lcom/p1/mobile/putong/data/BubbleInfo;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;

    .line 27
    .line 28
    if-eqz p3, :cond_2

    .line 29
    .line 30
    iget-object p3, p0, Ll/m2i;->h:Ll/h80;

    .line 31
    .line 32
    invoke-virtual {p3, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 33
    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;

    .line 36
    .line 37
    new-instance p3, Ll/k2i;

    .line 38
    .line 39
    invoke-direct {p3, p0, p2}, Ll/k2i;-><init>(Ll/m2i;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderSelectItem;->k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public L(ILcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 8
    .line 9
    new-instance v1, Ll/l2i;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, v0}, Ll/l2i;-><init>(Ll/m2i;ILcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fast_state_post"

    .line 2
    .line 3
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/m2i;->R(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic N(ILcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 2
    .line 3
    if-nez p1, :cond_2

    .line 4
    .line 5
    instance-of p1, p2, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Ll/m2i;->I(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {p3}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/m2i;->T()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/m2i;->Y()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Ll/m2i;->O(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/m2i;->Z()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/m2i;->Q(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-static {p2}, Ll/m2i;->I(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_3

    .line 41
    .line 42
    invoke-static {p3}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/m2i;->S(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {p0, p1}, Ll/m2i;->X(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ll/m2i;->O(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "state_id"

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "owner_id"

    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "e_other_state_avartar"

    .line 28
    .line 29
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/data/BubbleInfo;Z)V
    .locals 3

    .line 1
    const-string v0, "owner_id"

    .line 2
    .line 3
    const-string v1, "state_id"

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "source_page"

    .line 26
    .line 27
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {v1, p1, p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "e_set_my_state"

    .line 40
    .line 41
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget-object p2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p2, "e_other_state_avartar"

    .line 68
    .line 69
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "state_id"

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "owner_id"

    .line 18
    .line 19
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v2, "source_page"

    .line 24
    .line 25
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {v1, p1, p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "e_set_my_state"

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/data/TextTheme;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 22
    .line 23
    iput-object p1, v0, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 28
    .line 29
    const-string v0, "follow_top_state"

    .line 30
    .line 31
    invoke-virtual {p1, p0, v0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final S(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 8
    .line 9
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/jka;->lc(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public U(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m2i;->e:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m2i;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final X(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    sub-int/2addr p1, v1

    .line 9
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0, v1, v0, p1, v2}, Ll/m2i;->a0(IIILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final Y()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p0, v2, v0, v2, v1}, Ll/m2i;->a0(IIILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m2i;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/m2i;->K()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ll/h3i;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a0(IIILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m2i;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/m2i;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/m2i;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p1, p3, p0, p4}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e(I)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m2i;->e:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m2i;->J(I)Lcom/p1/mobile/putong/data/BubbleInfo;

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
    iget-object p0, p0, Ll/m2i;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->isPostSelectBubble:Z

    .line 10
    .line 11
    return p0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/m2i;->h:Ll/h80;

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

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/m2i;->h:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
