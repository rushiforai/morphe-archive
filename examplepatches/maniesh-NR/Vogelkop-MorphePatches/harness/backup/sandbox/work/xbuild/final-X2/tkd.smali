.class public final Ltkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltkd;->a:B

    iput-object p1, p0, Ltkd;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final P(Z)V
    .registers 3

    iget-byte v0, p0, Ltkd;->a:B

    iget-object p0, p0, Ltkd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Lrld;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lrld;->q:Lwld;

    iget-object p0, p0, Lrld;->n:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    invoke-virtual {v0, p0, p1}, Lsc;->k(Ljava/lang/Object;Z)V

    :cond_1e
    return-void

    :pswitch_1f
    check-cast p0, Lcom/opera/android/media/MediaPlayerActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    invoke-virtual {v0, p0, p1}, Lsc;->k(Ljava/lang/Object;Z)V

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
