.class public Ll/grn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/arn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VFrame;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VPullUpRecyclerView;

.field public h:Lv/VText_NoTopPadding;

.field public final i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

.field public j:Ll/arn;

.field public k:Ll/wfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/grn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/grn;->i(Landroid/view/View;)V

    return-void
.end method

.method private f()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x2

    .line 10
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/grn$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/grn$a;-><init>(Ll/grn;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/grn;->g:Lv/VPullUpRecyclerView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/grn;->g:Lv/VPullUpRecyclerView;

    .line 27
    .line 28
    iget-object p0, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->P4()Ll/vqn;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/grn;->h:Lv/VText_NoTopPadding;

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hrn;->b(Ll/grn;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/grn;->j:Ll/arn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Ll/grn;->k:Ll/wfo;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    new-instance v1, Ll/wfo;

    .line 12
    .line 13
    iget-object v2, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 14
    .line 15
    invoke-direct {v1, v2, v0}, Ll/wfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;Ll/arn;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/grn;->k:Ll/wfo;

    .line 19
    .line 20
    iget-object p0, p0, Ll/grn;->b:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ll/wfo;->g(Landroid/widget/FrameLayout;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public d(Ll/arn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grn;->j:Ll/arn;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/grn;->k:Ll/wfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wfo;->i()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/grn;->k:Ll/wfo;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/grn;->h:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    new-instance v1, Ll/frn;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/frn;-><init>(Ll/grn;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/fwl;->d(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/grn;->j:Ll/arn;

    .line 11
    .line 12
    const-string p1, "p_intl_meet_view,e_intl_meet_like_i_sent_unlock_btn_click,click"

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/arn;->d1(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/arn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/grn;->d(Ll/arn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/grn;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/grn;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/grn;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grn;->k:Ll/wfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wfo;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grn;->k:Ll/wfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wfo;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v2, p0, Ll/grn;->i:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->P4()Ll/vqn;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, p1}, Ll/vqn;->R(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/grn;->d:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/grn;->g:Lv/VPullUpRecyclerView;

    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/grn;->d:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/grn;->g:Lv/VPullUpRecyclerView;

    .line 38
    .line 39
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-direct {p0}, Ll/grn;->m()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/grn;->k()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/grn;->h:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    invoke-static {}, Ll/joa;->z4()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v1, Ll/gbc0;->K:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Ll/gbc0;->J:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/grn;->h:Lv/VText_NoTopPadding;

    .line 18
    .line 19
    invoke-static {}, Ll/joa;->z4()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-string v1, "#F9E7FF"

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string v1, "#000000"

    .line 29
    .line 30
    :goto_1
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Ll/grn;->m()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
