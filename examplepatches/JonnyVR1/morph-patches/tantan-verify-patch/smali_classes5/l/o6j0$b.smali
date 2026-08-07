.class public final Ll/o6j0$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o6j0;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0016\u0010\u0010\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000fR\u0016\u0010\u0012\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u000f\u00a8\u0006\u0013"
    }
    d2 = {
        "l/o6j0$b",
        "Landroidx/recyclerview/widget/RecyclerView$t;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recyclerView",
        "",
        "dx",
        "dy",
        "",
        "onScrolled",
        "(Landroidx/recyclerview/widget/RecyclerView;II)V",
        "newState",
        "onScrollStateChanged",
        "(Landroidx/recyclerview/widget/RecyclerView;I)V",
        "",
        "a",
        "Z",
        "isScrollingToBottom",
        "b",
        "pullUpDisable",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public final synthetic c:Ll/o6j0;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;


# direct methods
.method public constructor <init>(Ll/o6j0;Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o6j0$b;->c:Ll/o6j0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 5
    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-boolean v0, p0, Ll/o6j0$b;->a:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/o6j0$b;->b:Z

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x1

    .line 38
    sub-int/2addr v0, v1

    .line 39
    if-ne p2, v0, :cond_0

    .line 40
    .line 41
    iget-object p2, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 42
    .line 43
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iget-object v0, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-lt p2, v0, :cond_0

    .line 54
    .line 55
    iget-object p2, p0, Ll/o6j0$b;->d:Lcom/p1/mobile/putong/core/ui/toppicks/OffsetGridLayoutManager;

    .line 56
    .line 57
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    sub-int/2addr p2, v1

    .line 62
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

    .line 67
    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    iget-object v0, p0, Ll/o6j0$b;->c:Ll/o6j0;

    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-gt p2, p1, :cond_0

    .line 81
    .line 82
    invoke-static {}, Ll/joa;->M3()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_0

    .line 87
    .line 88
    iput-boolean v1, p0, Ll/o6j0$b;->b:Z

    .line 89
    .line 90
    const-string p0, "p_intl_picks_main_page,e_intl_picks_purchase_button,click"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ll/o6j0;->G(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p2, p1

    .line 13
    :goto_0
    iput-boolean p2, p0, Ll/o6j0$b;->a:Z

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/o6j0$b;->b:Z

    .line 18
    .line 19
    :cond_1
    iget-object p1, p0, Ll/o6j0$b;->c:Ll/o6j0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/o6j0;->s()Lv/VPullUpRecyclerView;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    int-to-float p1, p1

    .line 30
    const/high16 p2, 0x42a00000    # 80.0f

    .line 31
    .line 32
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    int-to-float p2, p2

    .line 37
    div-float/2addr p1, p2

    .line 38
    const/high16 p2, 0x3f800000    # 1.0f

    .line 39
    .line 40
    cmpl-float p3, p1, p2

    .line 41
    .line 42
    if-lez p3, :cond_2

    .line 43
    .line 44
    move p1, p2

    .line 45
    :cond_2
    const/4 p2, 0x0

    .line 46
    cmpg-float p3, p1, p2

    .line 47
    .line 48
    if-gez p3, :cond_3

    .line 49
    .line 50
    move p1, p2

    .line 51
    :cond_3
    iget-object p2, p0, Ll/o6j0$b;->c:Ll/o6j0;

    .line 52
    .line 53
    invoke-virtual {p2}, Ll/o6j0;->k()Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksTabFrag;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    instance-of p2, p2, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksAct;

    .line 62
    .line 63
    if-nez p2, :cond_4

    .line 64
    .line 65
    iget-object p0, p0, Ll/o6j0$b;->c:Ll/o6j0;

    .line 66
    .line 67
    invoke-static {p0}, Ll/o6j0;->f(Ll/o6j0;)Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    const/high16 p3, 0x437f0000    # 255.0f

    .line 72
    .line 73
    mul-float/2addr p1, p3

    .line 74
    float-to-int p1, p1

    .line 75
    const/16 p3, 0xff

    .line 76
    .line 77
    invoke-static {p1, p3, p3, p3}, Landroid/graphics/Color;->argb(IIII)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-static {p0, p2, p1}, Ll/o6j0;->e(Ll/o6j0;Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;I)V

    .line 82
    .line 83
    .line 84
    :cond_4
    return-void
.end method
