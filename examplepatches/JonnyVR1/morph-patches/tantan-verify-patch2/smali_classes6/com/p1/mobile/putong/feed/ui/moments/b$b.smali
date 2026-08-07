.class public Lcom/p1/mobile/putong/feed/ui/moments/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/ui/moments/b;->v(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lez v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->k(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$b;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method
