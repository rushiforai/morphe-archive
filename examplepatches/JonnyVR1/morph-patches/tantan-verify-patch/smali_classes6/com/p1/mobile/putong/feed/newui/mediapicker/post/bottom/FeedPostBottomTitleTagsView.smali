.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public c:Lv/VRecyclerView;

.field public d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

.field public e:Z

.field public f:Ll/trg;

.field public g:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/oth;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/oth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->g:Ll/x20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/oth;

    invoke-direct {p1, p0}, Ll/oth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->g:Ll/x20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/oth;

    invoke-direct {p1, p0}, Ll/oth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->g:Ll/x20;

    return-void
.end method

.method private synthetic B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->B()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->a:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)Ll/trg;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->f:Ll/trg;

    return-object p0
.end method


# virtual methods
.method public C(Ljava/util/List;Ll/trg;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/trg;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->f:Ll/trg;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->g:Ll/x20;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ll/trg;->h(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;->J(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

    .line 39
    .line 40
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$b;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/kic0;->E(Ll/h80;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->d:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$c;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->e:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 7
    .line 8
    new-instance p2, Lv/VRecyclerView;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 14
    .line 15
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    const/4 p2, -0x1

    .line 18
    const/4 v0, -0x2

    .line 19
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/16 p2, 0x10

    .line 23
    .line 24
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 32
    .line 33
    const/high16 p2, 0x40c00000    # 6.0f

    .line 34
    .line 35
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    sget v0, Ll/qa00;->m:I

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p1, p2, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->c:Lv/VRecyclerView;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->v()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->e:Z

    .line 2
    .line 3
    return p0
.end method
