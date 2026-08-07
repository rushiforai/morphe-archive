.class public Ll/j0u$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j0u;->I0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/j0u;


# direct methods
.method public constructor <init>(Ll/j0u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j0u$b;->a:Ll/j0u;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j0u$b;->a:Ll/j0u;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {v0}, Ll/xrc0;->d(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/yem0;->a()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget v1, v0, Ll/yem0;->c:I

    .line 19
    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    iget v1, v0, Ll/yem0;->d:I

    .line 23
    .line 24
    iget-object v2, p0, Ll/j0u$b;->a:Ll/j0u;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Ll/j0u$b;->a:Ll/j0u;

    .line 37
    .line 38
    invoke-static {v1}, Ll/j0u;->z0(Ll/j0u;)Lrx/subjects/b;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget v2, v0, Ll/yem0;->c:I

    .line 43
    .line 44
    iget v0, v0, Ll/yem0;->d:I

    .line 45
    .line 46
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/live/base/util/IntSet;->interval(II)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/j0u$b;->a:Ll/j0u;

    .line 54
    .line 55
    iget-object v0, v0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    return-void
.end method
