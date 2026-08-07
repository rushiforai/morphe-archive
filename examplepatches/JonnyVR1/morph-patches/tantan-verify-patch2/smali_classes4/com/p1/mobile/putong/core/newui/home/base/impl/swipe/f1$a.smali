.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->r(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->p(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->q(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/b240;->X8(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1;->q(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/b240;->Y8(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/f1$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->c(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
