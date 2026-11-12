.class public final Luld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrjg;


# instance fields
.field public final synthetic a:Lp12;


# direct methods
.method public constructor <init>(Lp12;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luld;->a:Lp12;

    return-void
.end method


# virtual methods
.method public final d(Lsjg;)V
    .registers 6

    iget-object v0, p0, Luld;->a:Lp12;

    iget-object v1, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v1, Lsjg;

    if-ne p1, v1, :cond_9

    return-void

    :cond_9
    iget p1, p1, Lsjg;->a:I

    const/4 v1, 0x3

    if-ne p1, v1, :cond_28

    invoke-virtual {v0}, Lp12;->m()Z

    move-result p1

    if-eqz p1, :cond_28

    iget-object p1, v0, Lp12;->d:Ljava/lang/Object;

    check-cast p1, Lsjg;

    iget-object v1, v0, Lp12;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/MediaPlayerMini;

    new-instance v2, Lzr9;

    const/16 v3, 0x1b

    invoke-direct {v2, p0, p1, v3}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 p0, 0x96

    invoke-virtual {v1, v2, p0, p1}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_28
    iget-object p0, v0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void
.end method

.method public final i(Lsjg;)V
    .registers 3

    iget-object p0, p0, Luld;->a:Lp12;

    iget-object v0, p0, Lp12;->d:Ljava/lang/Object;

    check-cast v0, Lsjg;

    if-ne p1, v0, :cond_9

    return-void

    :cond_9
    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->c()V

    return-void
.end method
