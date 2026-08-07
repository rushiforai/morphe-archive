.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public A:Z

.field public a:Landroid/view/View;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/feed/data/Moment;

.field public j:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:I

.field public p:Z

.field public q:I

.field public r:I

.field public s:Ll/n570;

.field public t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public u:I

.field public v:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public w:Landroid/widget/LinearLayout;

.field public x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

.field public y:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->o:I

    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z:Z

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 28
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    const/4 p2, -0x1

    .line 30
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->o:I

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 36
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    const/4 p2, -0x1

    .line 38
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->o:I

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z:Z

    return-void
.end method

.method private L(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/pug;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a0()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->L(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->S(Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Q(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->O(Z)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->P(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->getTextFoldPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "activity_id"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "activity_name"

    .line 42
    .line 43
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "moment_show_type"

    .line 48
    .line 49
    const-string v4, "text_and_url"

    .line 50
    .line 51
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 58
    .line 59
    const-string v4, "moments_user_id"

    .line 60
    .line 61
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {v1, v2, v3, p0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v1, "e_activity_moment"

    .line 70
    .line 71
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public C()V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/zuf0;->a(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/tec0;->j3:I

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 30
    .line 31
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 32
    .line 33
    const/4 v1, -0x1

    .line 34
    sget v2, Ll/qa00;->I:I

    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/qa00;->h:I

    .line 40
    .line 41
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 46
    .line 47
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 51
    .line 52
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    new-instance v1, Ll/rug;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public M()Z
    .locals 4

    .line 1
    const-string v0, "from_discover_discussion"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "from_discover_dating"

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v0, "from_nearby_falls_feed"

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v0, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    move v0, v1

    .line 37
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    instance-of v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 42
    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 52
    .line 53
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->d:Z

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    return v1

    .line 58
    :cond_2
    return v2

    .line 59
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v1, "NewMainAct"

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_4

    .line 78
    .line 79
    return v0

    .line 80
    :cond_4
    return v2
.end method

.method public final N()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_5

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    if-eqz v0, :cond_9

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_4

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    new-array p0, v1, [Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    new-array p0, v1, [Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 87
    .line 88
    const/16 v3, 0x9

    .line 89
    .line 90
    if-gt v0, v3, :cond_4

    .line 91
    .line 92
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v0, v1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    :goto_0
    new-array v2, v1, [Ljava/lang/Integer;

    .line 102
    .line 103
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    move v3, v1

    .line 108
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 109
    .line 110
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    if-ge v3, v4, :cond_8

    .line 117
    .line 118
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 119
    .line 120
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/RawFeed;->duplicateImgs:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    check-cast v4, Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    if-eqz v5, :cond_5

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    move v5, v1

    .line 136
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    if-ge v5, v6, :cond_7

    .line 141
    .line 142
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    check-cast v6, Lcom/p1/mobile/putong/data/Media;

    .line 147
    .line 148
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    if-nez v7, :cond_6

    .line 155
    .line 156
    const-string v7, "/"

    .line 157
    .line 158
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    array-length v7, v6

    .line 163
    const/4 v8, 0x1

    .line 164
    if-lt v7, v8, :cond_6

    .line 165
    .line 166
    array-length v7, v6

    .line 167
    sub-int/2addr v7, v8

    .line 168
    aget-object v6, v6, v7

    .line 169
    .line 170
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v6

    .line 174
    if-eqz v6, :cond_6

    .line 175
    .line 176
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_7
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_8
    return-object v2

    .line 190
    :cond_9
    :goto_4
    new-array p0, v1, [Ljava/lang/Integer;

    .line 191
    .line 192
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :cond_a
    :goto_5
    new-array p0, v1, [Ljava/lang/Integer;

    .line 198
    .line 199
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0
.end method

.method public final synthetic O(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e0(IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic S(Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    aget-object p2, p2, v1

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {v0, p1, p2}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p4, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->B()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->getTextFoldPageId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "moment_id"

    .line 45
    .line 46
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2, p3}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const-string p4, "moment_type"

    .line 61
    .line 62
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    const-string p4, "actor_user_id"

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    filled-new-array {p1, p2, p3}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string p2, "e_campaign_quiz"

    .line 79
    .line 80
    invoke-static {p2, p0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public T(Ll/n570;ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/util/HashMap;IZILjava/util/HashMap;ZZLcom/p1/mobile/putong/feed/data/RawFeed;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n570;",
            "I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;IZI",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;ZZ",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            "Z)Z"
        }
    .end annotation

    .line 1
    iput-boolean p11, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 2
    iput-boolean p10, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 3
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 4
    iput-boolean p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 5
    iput p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->s:Ll/n570;

    .line 7
    iput p8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r:I

    .line 8
    iput-object p9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->v:Ljava/util/HashMap;

    .line 9
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->o:I

    .line 10
    iput-object p12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 11
    iput-boolean p13, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->A:Z

    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    const-string p6, "fake_id_"

    if-nez p1, :cond_0

    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    invoke-virtual {p1, p6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 16
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    iget-object p7, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    invoke-virtual {p1, p6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 19
    :goto_0
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    invoke-virtual {p0, p2, p3, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 21
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z(Ljava/lang/String;)V

    return p1
.end method

.method public final V()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/k9c0;->z:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/k9c0;->n:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->K(I)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x2

    .line 60
    const/high16 v2, 0x41700000    # 15.0f

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 66
    .line 67
    const/high16 v0, 0x40000000    # 2.0f

    .line 68
    .line 69
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    int-to-float v0, v0

    .line 74
    const/high16 v1, 0x3f800000    # 1.0f

    .line 75
    .line 76
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->P(FF)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    xor-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedMediaRepeatHintView;->Q()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public X(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    invoke-direct {v2, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-class v3, Landroid/text/style/URLSpan;

    .line 30
    .line 31
    invoke-virtual {v2, v1, v0, v3}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, [Landroid/text/style/URLSpan;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    array-length v1, v0

    .line 47
    if-lez v1, :cond_0

    .line 48
    .line 49
    new-instance v1, Ll/qug;

    .line 50
    .line 51
    invoke-direct {v1, p0, v2, v0, p2}, Ll/qug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void

    .line 58
    :cond_1
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p1, :cond_2

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->isMomentShareEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->getTextFoldPageId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1, p0, v2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cmg;->C0()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->N()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 24
    .line 25
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-virtual {p3, v0}, Ll/jka;->wd(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    const-string v0, "from_profile_album"

    .line 39
    .line 40
    const-string v1, "from_mine_tab_album"

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-nez p3, :cond_6

    .line 44
    .line 45
    const/4 p3, 0x2

    .line 46
    if-ne p1, p3, :cond_6

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_6

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 57
    .line 58
    const/4 p3, 0x1

    .line 59
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 63
    .line 64
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 65
    .line 66
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 77
    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 84
    .line 85
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 91
    .line 92
    const/high16 v3, 0x42480000    # 50.0f

    .line 93
    .line 94
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 99
    .line 100
    const/high16 v4, 0x41900000    # 18.0f

    .line 101
    .line 102
    invoke-static {p1, v3, p2, v4}, Ll/cai;->f(Landroid/widget/TextView;ILjava/lang/String;F)F

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    if-eqz p1, :cond_2

    .line 116
    .line 117
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_1
    invoke-static {v3, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 125
    .line 126
    const-string p2, "/"

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 133
    .line 134
    const/high16 v3, 0x41d00000    # 26.0f

    .line 135
    .line 136
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 137
    .line 138
    .line 139
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 140
    .line 141
    aget-object v3, p1, v2

    .line 142
    .line 143
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 147
    .line 148
    aget-object p1, p1, p3

    .line 149
    .line 150
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    if-eqz p1, :cond_2

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 162
    .line 163
    .line 164
    :cond_2
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r:I

    .line 165
    .line 166
    if-nez p1, :cond_5

    .line 167
    .line 168
    const/high16 p1, 0x41e00000    # 28.0f

    .line 169
    .line 170
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    invoke-static {}, Ll/cmg;->W()Z

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-eqz p2, :cond_3

    .line 179
    .line 180
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    if-eqz p2, :cond_3

    .line 187
    .line 188
    const/high16 p1, 0x41400000    # 12.0f

    .line 189
    .line 190
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    if-eqz p2, :cond_4

    .line 201
    .line 202
    const/high16 p1, 0x41b00000    # 22.0f

    .line 203
    .line 204
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 209
    .line 210
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 211
    .line 212
    .line 213
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 214
    .line 215
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 216
    .line 217
    .line 218
    goto :goto_1

    .line 219
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 220
    .line 221
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->u:I

    .line 222
    .line 223
    const/high16 p3, 0x40c00000    # 6.0f

    .line 224
    .line 225
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    add-int/2addr p2, v0

    .line 230
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 234
    .line 235
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->u:I

    .line 236
    .line 237
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 238
    .line 239
    .line 240
    move-result p3

    .line 241
    add-int/2addr p2, p3

    .line 242
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 243
    .line 244
    .line 245
    goto :goto_1

    .line 246
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 247
    .line 248
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->u:I

    .line 249
    .line 250
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 254
    .line 255
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_8

    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 266
    .line 267
    if-nez p1, :cond_7

    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-nez p1, :cond_7

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    if-eqz p1, :cond_8

    .line 284
    .line 285
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 286
    .line 287
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 291
    .line 292
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->u:I

    .line 293
    .line 294
    const/high16 p3, 0x41100000    # 9.0f

    .line 295
    .line 296
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 297
    .line 298
    .line 299
    move-result p3

    .line 300
    add-int/2addr p2, p3

    .line 301
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 302
    .line 303
    .line 304
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 309
    .line 310
    if-eqz p1, :cond_9

    .line 311
    .line 312
    const/high16 p1, 0x41000000    # 8.0f

    .line 313
    .line 314
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    :cond_9
    invoke-static {p0, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->K()V

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public final a0()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_5

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

    .line 38
    .line 39
    if-eqz v0, :cond_5

    .line 40
    .line 41
    :cond_0
    const/4 v0, 0x2

    .line 42
    new-array v1, v0, [I

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 45
    .line 46
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 47
    .line 48
    .line 49
    new-instance v5, Landroid/graphics/Point;

    .line 50
    .line 51
    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    aget v3, v1, v2

    .line 56
    .line 57
    const/high16 v4, 0x42680000    # 58.0f

    .line 58
    .line 59
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    sub-int/2addr v3, v4

    .line 64
    const/high16 v4, 0x40000000    # 2.0f

    .line 65
    .line 66
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    add-int/2addr v3, v6

    .line 71
    invoke-static {}, Ll/bnl0;->F0()I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    invoke-static {v7}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    add-int/2addr v6, v7

    .line 84
    const/high16 v7, 0x42580000    # 54.0f

    .line 85
    .line 86
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    add-int/2addr v6, v7

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    instance-of v7, v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

    .line 96
    .line 97
    if-eqz v7, :cond_1

    .line 98
    .line 99
    invoke-static {}, Ll/bnl0;->F0()I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    const/high16 v7, 0x42300000    # 44.0f

    .line 104
    .line 105
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    add-int/2addr v6, v7

    .line 110
    :cond_1
    aget v1, v1, v2

    .line 111
    .line 112
    const/4 v7, 0x0

    .line 113
    if-ge v1, v6, :cond_2

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    add-int/2addr v1, v3

    .line 122
    iput v1, v5, Landroid/graphics/Point;->y:I

    .line 123
    .line 124
    move v8, v7

    .line 125
    goto :goto_0

    .line 126
    :cond_2
    iput v3, v5, Landroid/graphics/Point;->y:I

    .line 127
    .line 128
    move v8, v2

    .line 129
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    instance-of v1, v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 134
    .line 135
    if-eqz v1, :cond_3

    .line 136
    .line 137
    const/high16 v1, 0x42500000    # 52.0f

    .line 138
    .line 139
    :goto_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    goto :goto_2

    .line 144
    :cond_3
    const/high16 v1, 0x42800000    # 64.0f

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 148
    .line 149
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 154
    .line 155
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 158
    .line 159
    .line 160
    move-result v9

    .line 161
    div-int/2addr v9, v0

    .line 162
    add-int/2addr v9, v1

    .line 163
    const/high16 v0, 0x420c0000    # 35.0f

    .line 164
    .line 165
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v10

    .line 169
    sub-int/2addr v9, v10

    .line 170
    iput v9, v5, Landroid/graphics/Point;->x:I

    .line 171
    .line 172
    invoke-virtual {v3}, Landroid/widget/TextView;->getLineCount()I

    .line 173
    .line 174
    .line 175
    move-result v9

    .line 176
    if-ne v9, v2, :cond_4

    .line 177
    .line 178
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    invoke-static {v6, v7, v3, v2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    int-to-float v1, v1

    .line 191
    div-float/2addr v2, v4

    .line 192
    add-float/2addr v1, v2

    .line 193
    float-to-int v1, v1

    .line 194
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    sub-int/2addr v1, v0

    .line 199
    iput v1, v5, Landroid/graphics/Point;->x:I

    .line 200
    .line 201
    :cond_4
    invoke-static {}, Ll/bwg;->a()Ll/bwg;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 210
    .line 211
    move-object v7, v6

    .line 212
    move-object v6, p0

    .line 213
    invoke-virtual/range {v3 .. v8}, Ll/bwg;->b(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Landroid/view/View;Ljava/lang/String;Z)V

    .line 214
    .line 215
    .line 216
    :cond_5
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public b0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/high16 v2, 0x41a00000    # 20.0f

    .line 23
    .line 24
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p1, v0, v1, p0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public c0(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e0(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e0(IZ)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 16
    .line 17
    iget-boolean v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 18
    .line 19
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->s:Ll/n570;

    .line 20
    .line 21
    invoke-static/range {v3 .. v8}, Ll/rtg;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 26
    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v4}, Ll/o7i;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "content"

    .line 48
    .line 49
    invoke-static {v1, v2, v3, v4, v5}, Ll/dug;->k(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 59
    .line 60
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 61
    .line 62
    iget-boolean v10, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 63
    .line 64
    iget-object v11, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->s:Ll/n570;

    .line 65
    .line 66
    invoke-static/range {v6 .. v11}, Ll/rtg;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    move-object v2, v1

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 76
    .line 77
    move-object v3, v2

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 79
    .line 80
    move-object v4, v3

    .line 81
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 82
    .line 83
    move-object v5, v4

    .line 84
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 85
    .line 86
    move-object v6, v5

    .line 87
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->s:Ll/n570;

    .line 88
    .line 89
    move-object v0, v6

    .line 90
    invoke-static/range {v0 .. v5}, Ll/rtg;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    if-eqz p2, :cond_4

    .line 95
    .line 96
    invoke-static {}, Ll/cmg;->P()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_3

    .line 101
    .line 102
    instance-of v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 103
    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->M()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_3

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h0()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 117
    .line 118
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 119
    .line 120
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 121
    .line 122
    invoke-virtual {p0, v1, p1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g0(Lcom/p1/mobile/putong/feed/data/Moment;IZZ)V

    .line 123
    .line 124
    .line 125
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->A:Z

    .line 126
    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 138
    .line 139
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 142
    .line 143
    const-string v7, "preview"

    .line 144
    .line 145
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 146
    .line 147
    invoke-virtual/range {v2 .. v8}, Ll/qvm;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f0(I)V

    .line 152
    .line 153
    .line 154
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->A:Z

    .line 155
    .line 156
    if-eqz v1, :cond_5

    .line 157
    .line 158
    invoke-static {}, Ll/qvm;->d()Ll/qvm;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 167
    .line 168
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 169
    .line 170
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 171
    .line 172
    const-string v7, "click"

    .line 173
    .line 174
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 175
    .line 176
    invoke-virtual/range {v2 .. v8}, Ll/qvm;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 177
    .line 178
    .line 179
    :cond_5
    return-void
.end method

.method public f0(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->c(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->j(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->g(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 48
    .line 49
    const-string v1, ""

    .line 50
    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v2, "keyOriginFrom"

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move-object v0, v1

    .line 73
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const/4 v0, 0x1

    .line 78
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 83
    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-string v1, "keyHideNeedMatchUid"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    :cond_1
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v1, "NewMainAct"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->h(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->s(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    if-nez p1, :cond_2

    .line 149
    .line 150
    return-void

    .line 151
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/feed/data/Moment;IZZ)V
    .locals 9

    .line 1
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 10
    .line 11
    :goto_0
    move-object v2, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :goto_1
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 17
    .line 18
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    iget-object v0, v0, Ll/jka;->i0:Ljava/util/Map;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    iget-object v0, v0, Ll/jka;->i0:Ljava/util/Map;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 50
    .line 51
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->o:I

    .line 52
    .line 53
    const/4 v4, 0x1

    .line 54
    move v3, p2

    .line 55
    move v6, p3

    .line 56
    move v7, p4

    .line 57
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->a2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;ZZI)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    new-instance p3, Ll/gg70;

    .line 62
    .line 63
    invoke-direct {p3}, Ll/gg70;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 70
    .line 71
    iget-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 72
    .line 73
    iget-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 74
    .line 75
    invoke-static {p0, p1, p2, p3, p4}, Ll/dug;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public getTextFoldPageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "p_user_moment_interactions_details_view"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    return-object v0
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->d(Z)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->b()Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v2, Ll/pai;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/pai;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 59
    .line 60
    invoke-static {p0, p1, v0, v1, v2}, Ll/dug;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public k0(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "show_state"

    .line 7
    .line 8
    const-string v1, "owner_id"

    .line 9
    .line 10
    const-string v2, "moment_id"

    .line 11
    .line 12
    const-string v3, "e_text_fold"

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->getTextFoldPageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v1, "show_more"

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {v2, p0, v0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v4, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v3, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->getTextFoldPageId()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v2, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v1, "show_less"

    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    filled-new-array {v2, p0, v0}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {v4, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v3, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->C()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->G()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/nug;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/nug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 36
    .line 37
    const/4 v3, 0x3

    .line 38
    new-array v3, v3, [Landroid/view/View;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aput-object v0, v3, v4

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    aput-object v1, v3, v0

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    aput-object v2, v3, v0

    .line 48
    .line 49
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/oug;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/oug;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 68
    .line 69
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 70
    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->u:I

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->V()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public setCurrentFrag(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->t:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "from_moment_detail_album"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const p0, 0x7fffffff

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x4

    .line 24
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->setLineLimit(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
