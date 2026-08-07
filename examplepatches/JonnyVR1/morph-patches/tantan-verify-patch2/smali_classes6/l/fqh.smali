.class public Ll/fqh;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fqh$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/Emotion;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/data/Emotion;

.field public h:Ll/fqh$b;

.field public i:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;"
        }
    .end annotation
.end field


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
    iput-object v0, p0, Ll/fqh;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/fqh$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/fqh$a;-><init>(Ll/fqh;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fqh;->i:Ll/h80;

    .line 17
    .line 18
    iput-object p1, p0, Ll/fqh;->c:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iput-object p2, p0, Ll/fqh;->d:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p3, p0, Ll/fqh;->e:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic E(Ll/fqh;Lcom/p1/mobile/putong/data/Emotion;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fqh;->J(Lcom/p1/mobile/putong/data/Emotion;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic F(Ll/fqh;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fqh;->d:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fqh;->G(Landroid/view/View;Lcom/p1/mobile/putong/data/Emotion;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fqh;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/fqh;->f:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
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
    iget-object p0, p0, Ll/fqh;->c:Lcom/p1/mobile/android/app/Act;

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
    iget-object p0, p0, Ll/fqh;->c:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Ll/tec0;->l2:I

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

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/data/Emotion;II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    move-object p3, p1

    .line 5
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/fqh;->I(Lcom/p1/mobile/putong/data/Emotion;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p3, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiDialogStateItem;->Q(Lcom/p1/mobile/putong/data/Emotion;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/eqh;

    .line 15
    .line 16
    invoke-direct {v0, p0, p2}, Ll/eqh;-><init>(Ll/fqh;Lcom/p1/mobile/putong/data/Emotion;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/fqh;->i:Ll/h80;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/data/Emotion;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/fqh;->f:Ljava/util/List;

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/Emotion;

    .line 14
    .line 15
    return-object p0
.end method

.method public final I(Lcom/p1/mobile/putong/data/Emotion;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fqh;->g:Lcom/p1/mobile/putong/data/Emotion;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

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

.method public final synthetic J(Lcom/p1/mobile/putong/data/Emotion;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fqh;->M(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ljava/util/List;Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fqh;->f:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fqh;->g:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L(Ll/fqh$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqh;->h:Ll/fqh$b;

    .line 2
    .line 3
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/fqh;->g:Lcom/p1/mobile/putong/data/Emotion;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    return-void

    .line 20
    :cond_2
    :goto_1
    iput-object p1, p0, Ll/fqh;->g:Lcom/p1/mobile/putong/data/Emotion;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/fqh;->h:Ll/fqh$b;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Ll/fqh;->h:Ll/fqh$b;

    .line 34
    .line 35
    iget-object v1, p0, Ll/fqh;->g:Lcom/p1/mobile/putong/data/Emotion;

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ll/fqh$b;->e(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    iget-object p0, p0, Ll/fqh;->d:Ljava/lang/String;

    .line 41
    .line 42
    const-string v0, "state_type_id"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v0, "e_set_my_state_type"

    .line 55
    .line 56
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fqh;->H(I)Lcom/p1/mobile/putong/data/Emotion;

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
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x2

    .line 6
    return p0
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
    iget-object p0, p0, Ll/fqh;->i:Ll/h80;

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
    iget-object p0, p0, Ll/fqh;->i:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
