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

    if-eqz v1, :cond_28

    iget v2, p0, Le/e/a/ModernControls$Choice;->mode:I

    if-nez v2, :cond_f

    const/4 v2, 0x0

    invoke-static {v0, v2, p2}, Le/e/a/Quality195;->change(Ljava/lang/Object;ZI)V

    goto :goto_28

    :cond_f
    packed-switch p2, :pswitch_data_2a

    :pswitch_12
    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_20

    :pswitch_15
    const/high16 v2, 0x3f400000    # 0.75f

    goto :goto_20

    :pswitch_18
    const/high16 v2, 0x3fa00000    # 1.25f

    goto :goto_20

    :pswitch_1b
    const/high16 v2, 0x3fc00000    # 1.5f

    goto :goto_20

    :pswitch_1e
    const/high16 v2, 0x40000000    # 2.0f

    :goto_20
    sput v2, Le/e/a/ModernControls;->speed:F

    invoke-virtual {v1, v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setPlaybackSpeed(F)Z

    invoke-static {v0}, Le/e/a/ModernControls;->update(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    :cond_28
    :goto_28
    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_15
        :pswitch_12
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
    .end packed-switch
.end method
