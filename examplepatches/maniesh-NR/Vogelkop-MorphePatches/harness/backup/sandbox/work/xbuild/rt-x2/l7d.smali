.class public final Ll7d;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm7d;


# direct methods
.method public synthetic constructor <init>(Lm7d;B)V
    .registers 3

    iput-byte p2, p0, Ll7d;->a:B

    iput-object p1, p0, Ll7d;->b:Lm7d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    iget-byte v0, p0, Ll7d;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Ll7d;->b:Lm7d;

    const/4 p1, 0x0

    iput-object p1, p0, Lm7d;->d:Li7d;

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onStart(Lndc;)V
    .registers 3

    iget-byte v0, p0, Ll7d;->a:B

    packed-switch v0, :pswitch_data_1a

    return-void

    :pswitch_6
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    new-instance p1, Ldnb;

    const/16 v0, 0x13

    iget-object p0, p0, Ll7d;->b:Lm7d;

    invoke-direct {p1, p0, v0}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
