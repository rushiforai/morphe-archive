.class public Le/e/a/a3$p;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/a3;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/a3;


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .registers 6

    move-object v0, p1

    check-cast v0, Le/e/a/f0;

    const/4 v1, 0x1

    .line 1
    iput-boolean v1, v0, Le/e/a/f0;->c:Z

    .line 2
    iget-object v2, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    .line 3
    iput v3, v2, Le/e/a/a3;->g0:I

    .line 4
    iget-object v2, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v3

    .line 5
    iput v3, v2, Le/e/a/a3;->h0:I

    .line 6
    iget-object v2, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    .line 7
    iget-boolean v3, v2, Le/e/a/a3;->H0:Z

    if-eqz v3, :cond_25

    .line 8
    iget-object v2, v2, Le/e/a/a3;->p1:Landroid/widget/Button;

    const v3, 0x7f07019d

    .line 9
    invoke-static {v2, v3}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_2e

    .line 10
    :cond_25
    iget-object v1, v2, Le/e/a/a3;->p1:Landroid/widget/Button;

    const v2, 0x7f07019c

    .line 11
    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/4 v1, 0x0

    .line 12
    :goto_2e
    iput-boolean v1, v0, Le/e/a/f0;->e:Z

    .line 13
    iget-object v0, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    .line 14
    iget-object v0, v0, Le/e/a/a3;->g1:Le/e/a/v;

    .line 15
    new-instance v1, Le/e/a/n0;

    invoke-direct {v1, p1}, Le/e/a/n0;-><init>(Landroid/media/MediaPlayer;)V

    iget-object p1, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    .line 16
    iget-boolean p1, p1, Le/e/a/a3;->p0:Z

    .line 17
    iget-object v0, v0, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v0, v1, p1}, Le/e/a/l3/b;->a(Le/e/a/n0;Z)Z

    move-result p1

    if-nez p1, :cond_4a

    .line 18
    iget-object p1, p0, Le/e/a/a3$p;->a:Le/e/a/a3;

    invoke-static {p1}, Le/e/a/a3;->e(Le/e/a/a3;)V

    :cond_4a
    return-void
.end method
