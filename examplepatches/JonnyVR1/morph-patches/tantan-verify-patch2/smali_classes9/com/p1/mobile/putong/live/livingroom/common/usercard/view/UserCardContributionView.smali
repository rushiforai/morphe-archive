.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    filled-new-array {p1, p1, p1}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const-string p1, ""

    filled-new-array {p1, p1, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    const-string p1, ""

    filled-new-array {p1, p1, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->h(Ll/tak0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->g(Ll/tak0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->i(Ll/tak0;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f7k0;->a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->b:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->c:Lv/VText;

    .line 20
    .line 21
    const-string v2, "0"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->e:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->f:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->h:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->i:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public f(Ll/tak0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/c7k0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/c7k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->d:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    new-instance v1, Ll/d7k0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/d7k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->a:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    new-instance v1, Ll/e7k0;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/e7k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;Ll/tak0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic g(Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 p2, 0x2

    .line 4
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/tak0;->d5(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic h(Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/tak0;->d5(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic i(Ll/tak0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/tak0;->d5(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(Ll/d36;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v4, v0

    .line 3
    :goto_0
    invoke-virtual {p1}, Ll/d36;->e()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ge v4, v0, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->b:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->c:Lv/VText;

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v1, p0

    .line 19
    move-object v6, p1

    .line 20
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->k(Lv/VDraweeView;Lv/VText;IILl/d36;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->e:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v3, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->f:Lv/VText;

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->k(Lv/VDraweeView;Lv/VText;IILl/d36;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->h:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->i:Lv/VText;

    .line 34
    .line 35
    const/4 v5, 0x2

    .line 36
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->k(Lv/VDraweeView;Lv/VText;IILl/d36;)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public final k(Lv/VDraweeView;Lv/VText;IILl/d36;)V
    .locals 0

    .line 1
    if-eq p3, p4, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p5}, Ll/d36;->e()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    .line 7
    move-result-object p4

    .line 8
    invoke-virtual {p4, p3}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    check-cast p4, Ll/nsv;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->j:Ljava/util/ArrayList;

    .line 15
    .line 16
    iget-object p5, p4, Ll/nsv;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p5, Ll/d36$b;

    .line 19
    .line 20
    iget-object p5, p5, Ll/d36$b;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p3, p5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-static {p4, p1}, Ll/jlk0;->f(Ll/nsv;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p4, Ll/nsv;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p0, Ll/d36$b;

    .line 31
    .line 32
    iget-object p0, p0, Ll/d36$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->amount:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
