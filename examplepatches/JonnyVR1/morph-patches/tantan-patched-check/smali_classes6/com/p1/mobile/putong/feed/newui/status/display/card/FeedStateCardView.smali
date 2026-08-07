.class public Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;
.super Lv/VFrame;
.source "SourceFile"


# static fields
.field public static p:Z = true


# instance fields
.field public a:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

.field public e:Lv/VText;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/content/Context;

.field public m:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->V(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 17
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->V(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->V(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->K()V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->M(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;Z)V

    return-void
.end method

.method private V(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->Z(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b0()V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f0()V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->a0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b2i;->b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final K()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/TextView;->getLineHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    mul-int/2addr v1, v2

    .line 20
    if-ge v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    :goto_0
    if-lez v0, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineHeight()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    mul-int/2addr v2, v0

    .line 45
    if-lt v1, v2, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void
.end method

.method public L()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->u0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->F()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->D(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->q0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->D(Z)V

    .line 10
    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->q0(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final O()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "be_liked"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "state_id"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "owner_id"

    .line 32
    .line 33
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "e_other_state_like"

    .line 42
    .line 43
    const-string v1, "p_other_state"

    .line 44
    .line 45
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final P()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "be_liked"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "state_id"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "owner_id"

    .line 32
    .line 33
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "e_other_state_like"

    .line 42
    .line 43
    const-string v1, "p_other_state"

    .line 44
    .line 45
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final Q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v0}, Ll/jka;->W6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/x1i;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/x1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/y1i;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/y1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v1, v2, v0, v3}, Ll/jka;->Hb(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/z1i;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/z1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/y1i;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/y1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/t1i;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/t1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 5
    .line 6
    sget v1, Ll/lbc0;->l5:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/w1i;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/w1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 5
    .line 6
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget v0, Ll/lbc0;->m5:I

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v0, Ll/lbc0;->k5:I

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/a2i;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/a2i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 32
    .line 33
    new-instance v1, Ll/s1i;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/s1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->setOnClick(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public X()Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    sget p0, Ll/lbc0;->W3:I

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x8

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public Y()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return v1
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->O()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 10
    .line 11
    sget p1, Ll/lbc0;->k5:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->O()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->g:Lv/VText;

    .line 10
    .line 11
    sget p1, Ll/lbc0;->m5:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->h:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    const v2, 0x43938000    # 295.0f

    .line 15
    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    div-float/2addr v1, v2

    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    cmpl-float v2, v1, v2

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    mul-float/2addr v2, v1

    .line 33
    float-to-int v2, v2

    .line 34
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 35
    .line 36
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 37
    .line 38
    int-to-float v2, v2

    .line 39
    mul-float/2addr v2, v1

    .line 40
    float-to-int v2, v2

    .line 41
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 42
    .line 43
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->h:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 49
    .line 50
    const/high16 v2, 0x41f00000    # 30.0f

    .line 51
    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    mul-float/2addr v2, v1

    .line 58
    float-to-int v1, v2

    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f0()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->X()Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 28
    .line 29
    cmpl-double v3, v3, v5

    .line 30
    .line 31
    if-lez v3, :cond_0

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v3, -0x1

    .line 36
    :goto_0
    int-to-double v3, v3

    .line 37
    mul-double/2addr v1, v3

    .line 38
    const-wide/high16 v3, 0x4034000000000000L    # 20.0

    .line 39
    .line 40
    mul-double/2addr v1, v3

    .line 41
    double-to-int v1, v1

    .line 42
    int-to-float v1, v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 44
    .line 45
    .line 46
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 55
    .line 56
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c:I

    .line 57
    .line 58
    const/high16 v2, 0x41f00000    # 30.0f

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    sub-int/2addr v1, v2

    .line 65
    int-to-float v1, v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 70
    .line 71
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b:I

    .line 72
    .line 73
    const/high16 v2, 0x41d80000    # 27.0f

    .line 74
    .line 75
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    sub-int/2addr v1, v2

    .line 80
    int-to-float v1, v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 82
    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->d:Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l0(Landroid/view/ViewGroup;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 94
    .line 95
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 96
    .line 97
    if-nez v0, :cond_1

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->Q()V

    .line 100
    .line 101
    .line 102
    :cond_1
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->J()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final j0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->t1:Lrx/subjects/b;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    move-object p0, p1

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 18
    .line 19
    const/16 v0, 0x190

    .line 20
    .line 21
    if-ne p0, v0, :cond_0

    .line 22
    .line 23
    const-string p0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    move-object v0, p1

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 35
    .line 36
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 37
    .line 38
    const v1, 0x9d75

    .line 39
    .line 40
    .line 41
    if-ne v0, v1, :cond_1

    .line 42
    .line 43
    const-string p0, "\u5bf9\u65b9\u62c9\u9ed1\u4e86\u4f60"

    .line 44
    .line 45
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    if-eqz p0, :cond_2

    .line 50
    .line 51
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 52
    .line 53
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 54
    .line 55
    const p1, 0x9d74

    .line 56
    .line 57
    .line 58
    if-ne p0, p1, :cond_2

    .line 59
    .line 60
    const-string p0, "\u64cd\u4f5c\u5931\u8d25\uff0c\u5df2\u62c9\u9ed1\u5bf9\u65b9"

    .line 61
    .line 62
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 67
    .line 68
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 16
    .line 17
    new-instance v1, Ll/v1i;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/v1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->setSuccessAttachCallback(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->L()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->o:Z

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->P()V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public l0(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x8

    .line 24
    .line 25
    if-ne v2, v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->n:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->s0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->o0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->r0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->W()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->R()V

    .line 19
    .line 20
    .line 21
    sget-boolean p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p:Z

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->q0(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->k:Landroid/widget/TextView;

    .line 14
    .line 15
    const/16 v0, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance v0, Landroid/text/SpannableString;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "  "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/otg;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    sget v4, Ll/lbc0;->a5:I

    .line 55
    .line 56
    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-direct {v1, v2, v3}, Ll/otg;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 61
    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    const/16 v3, 0x21

    .line 65
    .line 66
    const/4 v4, 0x0

    .line 67
    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->k:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/cmg;->E()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->k:Landroid/widget/TextView;

    .line 82
    .line 83
    const-string v0, "#cc000000"

    .line 84
    .line 85
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public final p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/bgrender/FeedStateCardBgRenderCenter;->doRender(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/lbc0;->Y4:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Ll/lbc0;->Z4:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->h:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->i:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/cmg;->E()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->i:Landroid/widget/TextView;

    .line 38
    .line 39
    const-string v1, "#e6000000"

    .line 40
    .line 41
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->j:Landroid/widget/TextView;

    .line 67
    .line 68
    new-instance v1, Ll/u1i;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/u1i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public s0()V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const-string v2, "#4d000000"

    .line 36
    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Ll/cmg;->E()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 48
    .line 49
    iget-wide v4, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 50
    .line 51
    double-to-long v4, v4

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    invoke-static {v0, v4, v5, v6, v7}, Ll/ksg;->Q(Lcom/p1/mobile/putong/data/User;JJ)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v1, "\u5373\u5c06\u5728"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 83
    .line 84
    const-wide v4, 0x4194997000000000L    # 8.64E7

    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    add-double/2addr v1, v4

    .line 90
    invoke-static {v1, v2}, Ll/p6i;->o(D)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p0, "\u540e\u6d88\u5931"

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->status:Ljava/lang/String;

    .line 113
    .line 114
    const-string v1, "pending"

    .line 115
    .line 116
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 123
    .line 124
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->e5:I

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 130
    .line 131
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 139
    .line 140
    invoke-static {}, Ll/owi;->c()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->M(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;Z)V

    .line 16
    .line 17
    .line 18
    sput-boolean v1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->getChildPlayerView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->r(Ll/ie80$b;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final v0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const-string v1, "p_other_state"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/h3i;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/cmg;->A()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    move-object v0, v2

    .line 23
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 26
    .line 27
    invoke-static {v0, v3, v1}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->r2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move-object v0, v2

    .line 36
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 39
    .line 40
    invoke-static {v0, v3, v1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->r2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->l:Landroid/content/Context;

    .line 48
    .line 49
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {v0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 58
    .line 59
    const-string v0, "state_id"

    .line 60
    .line 61
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {p0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v0, "e_my_state_edit"

    .line 70
    .line 71
    const-string v1, "p_my_state"

    .line 72
    .line 73
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
