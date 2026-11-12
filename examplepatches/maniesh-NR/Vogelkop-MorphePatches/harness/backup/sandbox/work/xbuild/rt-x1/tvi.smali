.class public final Ltvi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luvi;


# direct methods
.method public synthetic constructor <init>(Luvi;B)V
    .registers 3

    iput-byte p2, p0, Ltvi;->a:B

    iput-object p1, p0, Ltvi;->b:Luvi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Ltvi;->a:B

    iget-object p0, p0, Ltvi;->b:Luvi;

    packed-switch v0, :pswitch_data_14

    iget-object p0, p0, Luvi;->d:Lz22;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    :pswitch_d
    iget-object p0, p0, Luvi;->e:Lza3;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Ltvi;->a:B

    packed-switch v0, :pswitch_data_12

    iget-object p0, p0, Ltvi;->b:Luvi;

    iget-object p0, p0, Luvi;->d:Lz22;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    :pswitch_d
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
