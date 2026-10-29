.class public Lcom/sauzask/nicoid/NicoidVideoFragment$n;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoFragment;


# virtual methods
.method public onPrepared()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F0:Z

    if-eqz v1, :cond_c

    .line 2
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->p1:Landroid/widget/Button;

    const v1, 0x7f07019d

    goto :goto_11

    :cond_c
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->p1:Landroid/widget/Button;

    const v1, 0x7f07019c

    .line 3
    :goto_11
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 4
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 5
    new-instance v2, Le/e/a/n0;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-direct {v2, v0}, Le/e/a/n0;-><init>(Lcom/devbrackets/android/exomedia/ui/widget/VideoView;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 6
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m0:Z

    .line 7
    iget-object v1, v1, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v1, v2, v0}, Le/e/a/l3/b;->a(Le/e/a/n0;Z)Z

    move-result v0

    if-nez v0, :cond_30

    .line 8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 9
    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0()V

    :cond_30
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_3b

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_3b
    invoke-static {v0}, Le/e/a/ModernControls;->attach(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-static {v0}, Le/e/a/SeriesPlayback;->prepared(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/ModernControls;->update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    sget v1, Le/e/a/ModernControls;->speed:F

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_50

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setPlaybackSpeed(F)Z

    :cond_50
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->prepared(Ljava/lang/Object;Z)V

    invoke-static {v0}, Le/e/a/SeriesPlayback;->prepared(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/ModernControls;->update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer221;->prepared(Ljava/lang/Object;Z)V

    invoke-static {v0}, Le/e/a/VideoOutput227;->prepared(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/BackgroundEntry233;->prepared(Ljava/lang/Object;)V

    return-void
.end method
