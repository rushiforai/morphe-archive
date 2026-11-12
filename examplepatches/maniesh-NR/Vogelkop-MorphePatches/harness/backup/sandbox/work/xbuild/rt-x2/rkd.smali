.class public final synthetic Lrkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpa2;
.implements Lm9n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/media/MediaPlayerActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/media/MediaPlayerActivity;B)V
    .registers 3

    iput-byte p2, p0, Lrkd;->a:B

    iput-object p1, p0, Lrkd;->b:Lcom/opera/android/media/MediaPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(Z)V
    .registers 3

    sget v0, Lcom/opera/android/media/MediaPlayerActivity;->t:I

    iget-object p0, p0, Lrkd;->b:Lcom/opera/android/media/MediaPlayerActivity;

    iget-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->r:Z

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v0

    if-eqz v0, :cond_14

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerActivity;->G()V

    return-void

    :cond_14
    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerActivity;->F()V

    :cond_1b
    return-void
.end method

.method public final j()V
    .registers 2

    iget-byte v0, p0, Lrkd;->a:B

    iget-object p0, p0, Lrkd;->b:Lcom/opera/android/media/MediaPlayerActivity;

    packed-switch v0, :pswitch_data_18

    sget v0, Lcom/opera/android/media/MediaPlayerActivity;->t:I

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerActivity;->G()V

    return-void

    :pswitch_d
    sget v0, Lcom/opera/android/media/MediaPlayerActivity;->t:I

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerActivity;->F()V

    :cond_16
    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_d
    .end packed-switch
.end method
