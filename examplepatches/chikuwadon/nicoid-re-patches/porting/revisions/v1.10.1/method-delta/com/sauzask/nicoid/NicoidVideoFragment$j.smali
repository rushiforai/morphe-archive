.class public Lcom/sauzask/nicoid/NicoidVideoFragment$j;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/devbrackets/android/exomedia/listener/OnCompletionListener;


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


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V
    .registers 2

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$j;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$j;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-static {v0}, Le/e/a/SeriesPlayback;->repeatCompletion(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-static {v0}, Le/e/a/ModernShorts;->completed(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    return-void

    :cond_10
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$j;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    const/4 v1, 0x1

    .line 1
    iput-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    .line 2
    :try_start_15
    invoke-static {v1}, Le/e/a/v0;->a(Z)Z

    .line 3
    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->k(Z)Z

    move-result v0

    if-eqz v0, :cond_1f

    return-void

    .line 4
    :cond_1f
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment$j;->a:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 5
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F0:Z

    if-nez v1, :cond_41

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v2, 0x7f070196

    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(Z)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(I)V

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_41

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_3c} :catch_3d

    goto :goto_41

    :catch_3d
    move-exception v0

    .line 6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_41
    :goto_41
    return-void
.end method
