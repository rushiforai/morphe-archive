.class public Ll/r0u$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r0u;->K0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r0u;


# direct methods
.method public constructor <init>(Ll/r0u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r0u$b;->a:Ll/r0u;

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
    iget-object v0, p0, Ll/r0u$b;->a:Ll/r0u;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r0u;->A0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/r0u$b;->a:Ll/r0u;

    .line 11
    .line 12
    invoke-static {v0}, Ll/r0u;->B0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/xrc0;->d(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/yem0;->a()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget v1, v0, Ll/yem0;->c:I

    .line 27
    .line 28
    if-ltz v1, :cond_1

    .line 29
    .line 30
    iget v1, v0, Ll/yem0;->d:I

    .line 31
    .line 32
    iget-object v2, p0, Ll/r0u$b;->a:Ll/r0u;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-ge v1, v2, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, Ll/r0u$b;->a:Ll/r0u;

    .line 45
    .line 46
    invoke-static {v1}, Ll/r0u;->z0(Ll/r0u;)Lrx/subjects/b;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget v2, v0, Ll/yem0;->c:I

    .line 51
    .line 52
    iget v0, v0, Ll/yem0;->d:I

    .line 53
    .line 54
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/live/base/util/IntSet;->interval(II)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/r0u$b;->a:Ll/r0u;

    .line 62
    .line 63
    invoke-static {v0}, Ll/r0u;->C0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    return-void
.end method
