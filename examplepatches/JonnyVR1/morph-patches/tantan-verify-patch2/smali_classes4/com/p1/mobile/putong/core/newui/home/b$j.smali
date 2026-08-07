.class public Lcom/p1/mobile/putong/core/newui/home/b$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->B:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->v()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->J6()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->s1(Lcom/p1/mobile/putong/core/newui/home/b;)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->s1(Lcom/p1/mobile/putong/core/newui/home/b;)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$j;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->s1(Lcom/p1/mobile/putong/core/newui/home/b;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
