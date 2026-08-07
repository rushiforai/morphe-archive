.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;


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

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
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

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->v(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/nkh;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->b:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->c:Lv/VText;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 32
    .line 33
    iget v2, v2, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 34
    .line 35
    invoke-static {v2}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, "\u4eba\u53d1\u8868\u4e86\u6001\u5ea6"

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/krg;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/krg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->u()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/nkh;->f()Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {p1, v0, p0, v1}, Ll/x31;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->z()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private z()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->b:Lv/VDraweeView;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aget v3, v0, v2

    .line 16
    .line 17
    const/high16 v4, 0x42b80000    # 92.0f

    .line 18
    .line 19
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    sub-int/2addr v3, v4

    .line 24
    invoke-static {}, Ll/bnl0;->F0()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/high16 v5, 0x42300000    # 44.0f

    .line 29
    .line 30
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    add-int/2addr v4, v5

    .line 35
    const/high16 v5, 0x41400000    # 12.0f

    .line 36
    .line 37
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    add-int/2addr v4, v5

    .line 42
    if-ge v3, v4, :cond_0

    .line 43
    .line 44
    aget v0, v0, v2

    .line 45
    .line 46
    const/high16 v2, 0x41c00000    # 24.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    add-int v3, v0, v2

    .line 53
    .line 54
    :cond_0
    iput v3, v1, Landroid/graphics/Point;->y:I

    .line 55
    .line 56
    const/high16 v0, 0x42200000    # 40.0f

    .line 57
    .line 58
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, v1, Landroid/graphics/Point;->x:I

    .line 63
    .line 64
    new-instance v0, Ll/jrg;

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->d:Ljava/lang/String;

    .line 73
    .line 74
    invoke-direct {v0, v2, v1, v3, v4}, Ll/jrg;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->b:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Ll/jrg;->a(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->c:Lv/VText;

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lrg;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Ll/pf60;

    .line 5
    .line 6
    const-string v1, "e_attitude"

    .line 7
    .line 8
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public w(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->d:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeUsersView;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
