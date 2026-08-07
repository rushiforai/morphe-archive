.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;
.super Ll/kic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kic0<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public d:I

.field public e:Landroid/content/Context;

.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->e:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/kic0;->E(Ll/h80;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;Lcom/p1/mobile/putong/feed/data/TopicMoment;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->I(Lcom/p1/mobile/putong/feed/data/TopicMoment;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->c()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListItemView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->e:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListItemView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 2

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListItemView;

    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 5
    .line 6
    if-ne v0, p4, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-virtual {p3, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/TopicListItemView;->c(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->a()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 31
    .line 32
    const/4 v1, -0x2

    .line 33
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    const/high16 v1, 0x41200000    # 10.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 43
    .line 44
    invoke-virtual {p3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    new-instance p3, Ll/c9j0;

    .line 48
    .line 49
    invoke-direct {p3, p0, p2, p4}, Ll/c9j0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->c()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/feed/data/TopicMoment;ILandroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "topic_id"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    filled-new-array {p3}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const-string v0, "e_profile_moment_tag"

    .line 14
    .line 15
    const-string v1, "p_suggest_user_profile_info_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 21
    .line 22
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->b()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->b()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 35
    .line 36
    invoke-interface {p3, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 40
    .line 41
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 42
    .line 43
    if-ne p1, p2, :cond_1

    .line 44
    .line 45
    const/4 p2, -0x1

    .line 46
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 47
    .line 48
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 49
    .line 50
    .line 51
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->d:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c;->H(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
