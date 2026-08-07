.class public Ll/jlt;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/data/User;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/jlt;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jlt;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 11
    .line 12
    iput-object p5, p0, Ll/jlt;->e:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic H(Ll/jlt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jlt;->J(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public I(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 8
    .line 9
    const-string v2, "matched"

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance p0, Ll/ek20;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/ek20;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->followedButNotMatched()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    xor-int/lit8 v2, v0, 0x1

    .line 32
    .line 33
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v3, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    const-string v3, ""

    .line 42
    .line 43
    :goto_0
    move-object v4, v3

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :goto_1
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    move-object v3, p1

    .line 53
    move-object v6, p2

    .line 54
    invoke-static/range {v0 .. v6}, Ll/mbs;->k(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jlt;->f:Ll/y20;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jlt;->e:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/jlt;->e:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->c(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Ll/jlt;->O(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/jlt;->N(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    instance-of v0, p2, Ll/ngk0;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast p2, Ll/ngk0;

    .line 20
    .line 21
    iget-object p2, p2, Ll/ngk0;->a:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iput-object p2, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/jlt;->N(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->onlive:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v3

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    move v0, v2

    .line 25
    :goto_1
    iget-object v1, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 26
    .line 27
    invoke-static {v1}, Ll/u9t;->e(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->b:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 34
    .line 35
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->c:Lv/VImage;

    .line 39
    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->b:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->c:Lv/VImage;

    .line 52
    .line 53
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->b:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 58
    .line 59
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->c:Lv/VImage;

    .line 63
    .line 64
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :goto_2
    invoke-virtual {p0, p1}, Ll/jlt;->P(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "context_common"

    .line 14
    .line 15
    invoke-static {v2, v0, v1}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->d:Lv/VText;

    .line 19
    .line 20
    iget-object v1, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->f:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Lcom/p1/mobile/putong/live/external/R$string;->i:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 42
    .line 43
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->b(Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 20
    .line 21
    xor-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 43
    .line 44
    sget v3, Lcom/p1/mobile/putong/live/external/R$string;->b:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 50
    .line 51
    sget v3, Ll/m9c0;->u:I

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 61
    .line 62
    sget v3, Ll/m9c0;->v:I

    .line 63
    .line 64
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sget v3, Ll/qa00;->j:I

    .line 69
    .line 70
    int-to-float v3, v3

    .line 71
    invoke-static {v0, v3, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 80
    .line 81
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->x:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 87
    .line 88
    const/4 v1, -0x1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 93
    .line 94
    sget v1, Ll/nbc0;->b:I

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 100
    .line 101
    new-instance v0, Ll/ilt;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Ll/ilt;-><init>(Ll/jlt;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public Q(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/jlt;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jlt;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/jlt;

    .line 20
    .line 21
    iget-object v2, p0, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 22
    .line 23
    iget-object v3, p1, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 32
    .line 33
    iget-object v3, p1, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v3, p1, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/jlt;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 52
    .line 53
    iget-object p1, p1, Ll/jlt;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 54
    .line 55
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    return v0

    .line 62
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jlt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jlt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    iget-object v2, p0, Ll/jlt;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Ll/jlt;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->k0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jlt;->K(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jlt;->L(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
