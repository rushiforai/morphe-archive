.class public Le/e/a/b3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/e;


# instance fields
.field public final synthetic a:Le/e/a/a3;


# virtual methods
.method public d(I)V
    .registers 5

    const/4 v0, 0x2

    const v1, 0x7f070195

    if-eq p1, v0, :cond_6b

    const/4 v0, 0x3

    const v2, 0x7f070196

    if-eq p1, v0, :cond_5a

    const/4 v0, 0x4

    if-eq p1, v0, :cond_4c

    const/4 v0, 0x5

    if-eq p1, v0, :cond_2c

    const/4 v0, 0x6

    if-eq p1, v0, :cond_16

    goto :goto_7b

    :cond_16
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_7b

    .line 1
    iget-boolean v0, p1, Le/e/a/f0;->b:Z

    if-eqz v0, :cond_26

    .line 2
    invoke-virtual {p1}, Le/e/a/f0;->pause()V

    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    goto :goto_65

    :cond_26
    invoke-virtual {p1}, Le/e/a/f0;->start()V

    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    goto :goto_76

    :cond_2c
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_7b

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result p1

    const/16 v0, 0xbb8

    const/4 v1, 0x0

    if-le p1, v0, :cond_43

    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-virtual {p1, v1}, Le/e/a/f0;->seekTo(I)V

    goto :goto_7b

    :cond_43
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    invoke-static {v1}, Le/e/a/v0;->a(Z)Z

    .line 3
    invoke-virtual {p1, v1}, Le/e/a/a3;->k(Z)Z

    goto :goto_7b

    .line 4
    :cond_4c
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object v0, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz v0, :cond_7b

    const/4 v0, 0x1

    invoke-static {v0}, Le/e/a/v0;->a(Z)Z

    .line 5
    invoke-virtual {p1, v0}, Le/e/a/a3;->k(Z)Z

    goto :goto_7b

    .line 6
    :cond_5a
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_7b

    invoke-virtual {p1}, Le/e/a/f0;->pause()V

    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    .line 7
    :goto_65
    iget-object p1, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    .line 8
    invoke-static {p1, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_7b

    :cond_6b
    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_7b

    invoke-virtual {p1}, Le/e/a/f0;->start()V

    iget-object p1, p0, Le/e/a/b3;->a:Le/e/a/a3;

    .line 9
    :goto_76
    iget-object p1, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    .line 10
    invoke-static {p1, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_7b
    :goto_7b
    return-void
.end method
