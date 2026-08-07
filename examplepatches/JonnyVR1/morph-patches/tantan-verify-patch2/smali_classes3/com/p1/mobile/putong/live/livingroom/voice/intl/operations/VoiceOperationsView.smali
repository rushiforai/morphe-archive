.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/qfo0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Ll/qfo0;

.field public c:Ll/jfo0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->e(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;Landroid/view/View;)V

    return-void
.end method

.method private d()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/jfo0;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/jfo0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/widget/FrameLayout;I)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x40a00000    # 5.0f

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 v0, 0x40c00000    # 6.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    add-int/2addr p0, p2

    .line 23
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public c(Ll/qfo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->b:Ll/qfo0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/jfo0;->f0(Ll/qfo0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jfo0;->e0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->b:Ll/qfo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qfo0;->S3(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p3}, Ll/efo0;->K(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public f(Ljava/util/List;Landroid/widget/FrameLayout;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;",
            ">;",
            "Landroid/widget/FrameLayout;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/jfo0;->e0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->b(Landroid/widget/FrameLayout;I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->setData(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v0, 0x3

    .line 30
    const/4 v2, 0x1

    .line 31
    if-le p1, v0, :cond_2

    .line 32
    .line 33
    const/high16 p1, 0x42f00000    # 120.0f

    .line 34
    .line 35
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    new-array v3, v2, [Landroid/view/View;

    .line 42
    .line 43
    aput-object v0, v3, v1

    .line 44
    .line 45
    invoke-static {p1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/high16 p1, 0x43040000    # 132.0f

    .line 50
    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    new-array v3, v2, [Landroid/view/View;

    .line 58
    .line 59
    aput-object v0, v3, v1

    .line 60
    .line 61
    invoke-static {p1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->b(Landroid/widget/FrameLayout;I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qfo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c(Ll/qfo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->W4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->d()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jfo0;->e0()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;

    .line 38
    .line 39
    new-instance v2, Ll/efo0;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 42
    .line 43
    invoke-direct {v2, v3, v1}, Ll/efo0;-><init>(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 44
    .line 45
    .line 46
    new-instance v3, Ll/rfo0;

    .line 47
    .line 48
    invoke-direct {v3, p0, v1, v2}, Ll/rfo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ll/efo0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->c:Ll/jfo0;

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
