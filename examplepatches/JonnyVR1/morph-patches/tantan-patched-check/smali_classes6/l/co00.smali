.class public Ll/co00;
.super Ll/fo00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fo00<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fo00;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/co00;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/co00;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V

    return-void
.end method

.method private i(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "activity_id"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "activity_name"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "moment_show_type"

    .line 35
    .line 36
    const-string v2, "text_and_url"

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "moments_user_id"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p0, v0, v1, p1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_activity_moment"

    .line 55
    .line 56
    const-string v0, "p_user_moment_interactions_details_view"

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/co00;->j(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fo00;->c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v0, Ll/tec0;->i5:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    instance-of v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 26
    .line 27
    new-instance v0, Ll/bo00;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2}, Ll/bo00;-><init>(Ll/co00;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->setInterceptClickAction(Ll/z20;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->z:Z

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/fo00;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->setFrom(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 48
    .line 49
    iget-object p1, p0, Ll/fo00;->b:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 50
    .line 51
    iput-object p1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 52
    .line 53
    new-instance p1, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    const/16 v1, 0xc

    .line 59
    .line 60
    invoke-virtual {p2, v0, p3, p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->l0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Ll/fo00;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0, p3}, Ll/co00;->i(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->W()V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-boolean v0, p0, Ll/fo00;->c:Z

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/fo00;->d:Z

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g0(Lcom/p1/mobile/putong/feed/data/Moment;IZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
