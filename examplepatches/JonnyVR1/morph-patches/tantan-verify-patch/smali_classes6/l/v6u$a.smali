.class public Ll/v6u$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v6u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/v6u;


# direct methods
.method public constructor <init>(Ll/v6u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v6u$a;->a:Ll/v6u;

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
    iget-object v0, p0, Ll/v6u$a;->a:Ll/v6u;

    .line 2
    .line 3
    iget-object v1, v0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    invoke-static {v0}, Ll/v6u;->h0(Ll/v6u;)Ll/rft;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p0, Ll/v6u$a;->a:Ll/v6u;

    .line 15
    .line 16
    iget-object v0, v0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xrc0;->d(Landroidx/recyclerview/widget/RecyclerView;)Ll/yem0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v1, v0, Ll/yem0;->a:I

    .line 23
    .line 24
    if-ltz v1, :cond_1

    .line 25
    .line 26
    iget v1, v0, Ll/yem0;->b:I

    .line 27
    .line 28
    iget-object v2, p0, Ll/v6u$a;->a:Ll/v6u;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v1, 0x0

    .line 39
    :goto_0
    invoke-virtual {v0}, Ll/yem0;->a()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/v6u$a;->a:Ll/v6u;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/v6u;->p0()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/v6u$a;->a:Ll/v6u;

    .line 53
    .line 54
    iget-object v0, v0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_1
    return-void
.end method
