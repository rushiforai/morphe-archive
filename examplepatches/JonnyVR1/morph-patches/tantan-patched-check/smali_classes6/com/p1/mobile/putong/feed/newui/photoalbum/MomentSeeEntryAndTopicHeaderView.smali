.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->P(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->P(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->P(Landroid/content/Context;)V

    return-void
.end method

.method private P(Landroid/content/Context;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/high16 v3, 0x41000000    # 8.0f

    .line 18
    .line 19
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/cmg;->N()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->c:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public Q(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->R(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->c:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->c:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->X(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
