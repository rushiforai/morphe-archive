.class public Ll/m900$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m900;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/m900;


# direct methods
.method public constructor <init>(Ll/m900;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m900$b;->a:Ll/m900;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m900$b;->a:Ll/m900;

    .line 2
    .line 3
    invoke-static {v0}, Ll/m900;->G(Ll/m900;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/m900$b;->a:Ll/m900;

    .line 14
    .line 15
    invoke-static {v0}, Ll/m900;->G(Ll/m900;)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/m900$b;->a:Ll/m900;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {v0, v1}, Ll/m900;->H(Ll/m900;Landroid/animation/ValueAnimator;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/m900$b;->a:Ll/m900;

    .line 29
    .line 30
    iget-object v0, v0, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/lit8 v0, v0, -0x1

    .line 37
    .line 38
    :goto_0
    iget-object v1, p0, Ll/m900$b;->a:Ll/m900;

    .line 39
    .line 40
    if-ltz v0, :cond_2

    .line 41
    .line 42
    iget-object v1, v1, Ll/m900;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget-object v2, p0, Ll/m900$b;->a:Ll/m900;

    .line 55
    .line 56
    invoke-static {v2, v1}, Ll/m900;->J(Ll/m900;Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    invoke-static {v1, p0}, Ll/m900;->I(Ll/m900;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
