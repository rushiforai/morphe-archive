.class public final Le/e/a/ModernControls$Choice;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public mode:I


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernControls$Choice;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput p2, p0, Le/e/a/ModernControls$Choice;->mode:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 8

    iget-object v0, p0, Le/e/a/ModernControls$Choice;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_48

    iget v2, p0, Le/e/a/ModernControls$Choice;->mode:I

    if-nez v2, :cond_2f

    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    if-eqz v2, :cond_48

    if-nez p2, :cond_12

    const/4 v3, 0x0

    goto :goto_17

    :cond_12
    const/4 v3, 0x3

    const/4 v4, 0x2

    if-ne p2, v4, :cond_17

    const/4 v3, 0x4

    :cond_17
    :goto_17
    iget v4, v2, Le/e/a/d0;->e:I

    if-eq v3, v4, :cond_48

    iput v3, v2, Le/e/a/d0;->e:I

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v3

    new-instance v1, Ljava/lang/Thread;

    new-instance p1, Le/e/a/ModernControls$Switch;

    invoke-direct {p1, v0, v2, v3, v4}, Le/e/a/ModernControls$Switch;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Le/e/a/d0;J)V

    invoke-direct {v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_48

    :cond_2f
    packed-switch p2, :pswitch_data_4a

    :pswitch_32
    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_40

    :pswitch_35
    const/high16 v2, 0x3f400000    # 0.75f

    goto :goto_40

    :pswitch_38
    const/high16 v2, 0x3fa00000    # 1.25f

    goto :goto_40

    :pswitch_3b
    const/high16 v2, 0x3fc00000    # 1.5f

    goto :goto_40

    :pswitch_3e
    const/high16 v2, 0x40000000    # 2.0f

    :goto_40
    sput v2, Le/e/a/ModernControls;->speed:F

    invoke-virtual {v1, v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setPlaybackSpeed(F)Z

    invoke-static {v0}, Le/e/a/ModernControls;->update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    :cond_48
    :goto_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_35
        :pswitch_32
        :pswitch_38
        :pswitch_3b
        :pswitch_3e
    .end packed-switch
.end method
