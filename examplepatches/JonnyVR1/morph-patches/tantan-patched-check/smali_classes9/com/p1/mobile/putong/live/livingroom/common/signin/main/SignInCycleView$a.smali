.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->M(Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b(I)V

    return-void
.end method


# virtual methods
.method public final synthetic b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->I(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;)Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 17
    .line 18
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 19
    .line 20
    iget-object p4, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 21
    .line 22
    iget-boolean p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->todaySignInStatus:Z

    .line 23
    .line 24
    invoke-static {p2, p4, p3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->J(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;Ljava/util/List;Z)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const/4 p3, -0x1

    .line 29
    if-eq p1, p3, :cond_0

    .line 30
    .line 31
    if-ge p1, p2, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 34
    .line 35
    new-instance p3, Ll/qbf0;

    .line 36
    .line 37
    invoke-direct {p3, p0, p2}, Ll/qbf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
