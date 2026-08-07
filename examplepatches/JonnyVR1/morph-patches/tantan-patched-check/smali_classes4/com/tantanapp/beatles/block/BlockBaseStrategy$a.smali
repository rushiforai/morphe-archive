.class public Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m(Landroid/os/Looper;)Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/block/BlockBaseStrategy;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->a()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o(Landroid/os/Message;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
