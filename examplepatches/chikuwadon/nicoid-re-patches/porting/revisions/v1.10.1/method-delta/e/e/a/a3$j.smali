.class public Le/e/a/a3$j;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/a3;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Ljava/util/Random;

.field public final synthetic b:Le/e/a/a3;


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .registers 5

    :try_start_0
    iget-object p1, p0, Le/e/a/a3$j;->b:Le/e/a/a3;

    const/4 v0, 0x1

    invoke-static {v0}, Le/e/a/v0;->a(Z)Z

    invoke-static {p1, v0}, Le/e/a/a3;->a(Le/e/a/a3;Z)Z

    move-result p1

    if-eqz p1, :cond_d

    return-void

    :cond_d
    iget-object p1, p0, Le/e/a/a3$j;->b:Le/e/a/a3;

    .line 1
    iget-boolean v0, p1, Le/e/a/a3;->H0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2b

    iget-object v0, p1, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v2, 0x7f070196

    invoke-static {v0, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-virtual {p1, v1}, Le/e/a/a3;->l(Z)V

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Le/e/a/a3;->i(I)V

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz p1, :cond_3c

    invoke-virtual {p1}, Le/e/a/f0;->pause()V

    goto :goto_3c

    :cond_2b
    iget-object v0, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz v0, :cond_3c

    invoke-virtual {v0, v1}, Le/e/a/f0;->seekTo(I)V

    iget-object p1, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-virtual {p1}, Le/e/a/f0;->start()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_3c

    :catch_38
    move-exception p1

    .line 2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3c
    :goto_3c
    return-void
.end method
