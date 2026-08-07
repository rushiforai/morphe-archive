.class public Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Lv/VRelative;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Z

.field public i:Ll/tfg;

.field public j:Ll/zzk;

.field public k:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

.field public l:Ll/ntl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->v(Landroid/view/View;)V

    return-void
.end method

.method private w()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/rgg;->b(ZZ)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->k:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->a:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->b:Lv/VRelative;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->f:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ll/vfg;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/vfg;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->c:Lv/VImage;

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    sget v1, Ll/mbc0;->a0:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget v1, Ll/mbc0;->j0:I

    .line 44
    .line 45
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->d:Lv/VText;

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 51
    .line 52
    const-string v2, "#4d323232"

    .line 53
    .line 54
    const-string v3, "#4dffffff"

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->g:Lv/VText;

    .line 71
    .line 72
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 73
    .line 74
    if-eqz p0, :cond_2

    .line 75
    .line 76
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    :goto_2
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wfg;->a(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(ZLl/ntl;)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->l:Ll/ntl;

    .line 4
    .line 5
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->a:Lv/VRecyclerView;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->a:Lv/VRecyclerView;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView$a;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/tfg;

    .line 32
    .line 33
    invoke-direct {v0, p1, p2}, Ll/tfg;-><init>(ZLl/ntl;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->i:Ll/tfg;

    .line 37
    .line 38
    new-instance p2, Ll/zzk;

    .line 39
    .line 40
    invoke-direct {p2, v0}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->j:Ll/zzk;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    sget v0, Ll/vec0;->F:I

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-static {p2, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 57
    .line 58
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->k:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->j:Ll/zzk;

    .line 61
    .line 62
    invoke-virtual {v0, p2}, Ll/zzk;->F(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->k:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->F:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p2, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;->Q(ZLjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->a:Lv/VRecyclerView;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->j:Ll/zzk;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->l:Ll/ntl;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->h:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Ll/rgg;->a(ZZ)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->l:Ll/ntl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ntl;->c()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public z(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->getFanbaseGroups()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->getFanbaseGroups()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->k:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 21
    .line 22
    const/16 v1, 0x8

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    move p1, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move p1, v1

    .line 30
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->a:Lv/VRecyclerView;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->b:Lv/VRelative;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->i:Ll/tfg;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;->getFanbaseGroups()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/tfg;->E(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->w()V

    .line 54
    .line 55
    .line 56
    return-void
.end method
