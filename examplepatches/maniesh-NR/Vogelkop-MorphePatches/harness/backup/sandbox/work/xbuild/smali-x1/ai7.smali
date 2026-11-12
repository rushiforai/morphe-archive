.class public final synthetic Lai7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhi7;


# direct methods
.method public synthetic constructor <init>(Lhi7;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lai7;->a:B

    iput-object p1, p0, Lai7;->b:Lhi7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lhi7;Lki5;)V
    .registers 3

    const/4 p2, 0x0

    iput-byte p2, p0, Lai7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lai7;->b:Lhi7;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lai7;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lai7;->b:Lhi7;

    packed-switch v0, :pswitch_data_2c

    invoke-virtual {p0}, Lhi7;->e()V

    return-void

    :pswitch_c
    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object p0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_16
    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_20
        :pswitch_16
        :pswitch_c
    .end packed-switch
.end method
