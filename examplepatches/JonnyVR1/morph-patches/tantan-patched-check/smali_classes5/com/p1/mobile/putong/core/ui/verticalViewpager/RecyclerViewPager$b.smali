.class public Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->scrollToPosition(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->H(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ltz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->H(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->J(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ge v0, v1, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->F(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->F(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_0

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 73
    .line 74
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->G(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 79
    .line 80
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getCurrentPosition()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;->a(II)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    return-void
.end method
