.class public Le/e/a/k1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/e;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public d(I)V
    .registers 6

    const/4 v0, 0x2

    const v1, 0x7f070195

    if-eq p1, v0, :cond_74

    const/4 v0, 0x3

    const v2, 0x7f070196

    if-eq p1, v0, :cond_63

    const/4 v0, 0x4

    if-eq p1, v0, :cond_5b

    const/4 v0, 0x5

    if-eq p1, v0, :cond_37

    const/4 v0, 0x6

    if-eq p1, v0, :cond_17

    goto/16 :goto_84

    :cond_17
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_84

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_2d

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    goto :goto_6e

    :cond_2d
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    goto :goto_7f

    :cond_37
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_84

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v0

    const-wide/16 v2, 0xbb8

    cmp-long p1, v0, v2

    if-lez p1, :cond_51

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    goto :goto_84

    :cond_51
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v0, 0x0

    :goto_54
    invoke-static {v0}, Le/e/a/v0;->a(Z)Z

    .line 1
    invoke-virtual {p1, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->k(Z)Z

    goto :goto_84

    .line 2
    :cond_5b
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v0, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_84

    const/4 v0, 0x1

    goto :goto_54

    :cond_63
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_84

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 3
    :goto_6e
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    .line 4
    invoke-static {p1, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_84

    :cond_74
    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_84

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    iget-object p1, p0, Le/e/a/k1;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 5
    :goto_7f
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    .line 6
    invoke-static {p1, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_84
    :goto_84
    return-void
.end method
