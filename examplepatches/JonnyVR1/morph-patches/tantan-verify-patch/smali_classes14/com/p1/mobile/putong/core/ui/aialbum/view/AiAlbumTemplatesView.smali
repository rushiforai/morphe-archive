.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Ll/pg0;

.field public i:Ll/ye0;

.field public j:Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->T(Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;I)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->W(Landroid/view/View;)V

    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    const-string p1, "e_intl_ai_photo_upload_btn"

    .line 10
    .line 11
    const-string v0, "p_intl_ai_photo_homepopup"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ye0;->l0()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/core/R$string;->k9:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ll/ye0;->h0(Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_ai_photo_change_btn"

    .line 2
    .line 3
    const-string v0, "p_intl_ai_photo_homepopup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ye0;->a0()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private r()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pg0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pg0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->e:Lv/VRecyclerView;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->e:Lv/VRecyclerView;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 33
    .line 34
    new-instance v1, Ll/sg0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/sg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/pg0;->I(Ll/pg0$a;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->f:Lv/VText;

    .line 43
    .line 44
    new-instance v1, Ll/tg0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/tg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->g:Lv/VText;

    .line 53
    .line 54
    new-instance v1, Ll/ug0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/ug0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vg0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/pg0;->K(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->f:Lv/VText;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 19
    .line 20
    .line 21
    add-int/2addr p2, p1

    .line 22
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "intl_ai_photo_no"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {p0}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "e_intl_ai_photo_choose_scenario"

    .line 37
    .line 38
    const-string p2, "p_intl_ai_photo_homepopup"

    .line 39
    .line 40
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/pg0;->K(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->f:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;->data:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;->data:Ljava/util/List;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->j:Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/pg0;->K(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->h:Ll/pg0;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplatesEnvelope;->data:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/pg0;->J(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    const-string p0, "e_intl_ai_photo_upload_btn"

    .line 54
    .line 55
    const-string p1, "p_intl_ai_photo_homepopup"

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPresenter(Ll/ye0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->i:Ll/ye0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesView;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
