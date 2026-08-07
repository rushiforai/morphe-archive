.class public Ll/nr30$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nr30;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/nr30;


# direct methods
.method public constructor <init>(Ll/nr30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nr30$a;->b:Ll/nr30;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/nr30$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/nr30$a;->b:Ll/nr30;

    .line 12
    .line 13
    iget-object p0, p0, Ll/nr30;->f:Lv/VImage;

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    :goto_0
    if-gt v0, v1, :cond_2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    instance-of v5, v4, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    .line 27
    .line 28
    if-eqz v5, :cond_1

    .line 29
    .line 30
    check-cast v4, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->getContentView()Ll/czl;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    instance-of v6, v5, Ll/bby;

    .line 37
    .line 38
    if-eqz v6, :cond_1

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->getFeedVisiblePercentInWindow()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    cmpl-float v6, v4, v2

    .line 45
    .line 46
    if-lez v6, :cond_1

    .line 47
    .line 48
    check-cast v5, Ll/bby;

    .line 49
    .line 50
    move v2, v4

    .line 51
    move-object v3, v5

    .line 52
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    if-eqz v3, :cond_4

    .line 56
    .line 57
    iget-boolean p0, p0, Ll/nr30$a;->a:Z

    .line 58
    .line 59
    const p1, 0x3e4ccccd    # 0.2f

    .line 60
    .line 61
    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    cmpl-float p0, v2, p1

    .line 65
    .line 66
    if-lez p0, :cond_3

    .line 67
    .line 68
    invoke-virtual {v3}, Ll/bby;->N()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    cmpg-float p0, v2, p1

    .line 73
    .line 74
    if-gez p0, :cond_4

    .line 75
    .line 76
    invoke-virtual {v3}, Ll/bby;->M()V

    .line 77
    .line 78
    .line 79
    :cond_4
    return-void
.end method

.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    if-eq p2, v0, :cond_1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    if-eq p2, p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/nr30$a;->a:Z

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iput-boolean v0, p0, Ll/nr30$a;->a:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_2
    iput-boolean v0, p0, Ll/nr30$a;->a:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/nr30$a;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/nr30$a;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/nr30$a;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/nr30$a;->b:Ll/nr30;

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/nr30;->l(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/nr30$a;->b:Ll/nr30;

    .line 33
    .line 34
    invoke-static {p0}, Ll/nr30;->d(Ll/nr30;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 p1, 0x1

    .line 39
    const-string p2, "p_meet_view,e_pull,click"

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->N0(ZLjava/lang/String;)Lkotlin/Unit;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
