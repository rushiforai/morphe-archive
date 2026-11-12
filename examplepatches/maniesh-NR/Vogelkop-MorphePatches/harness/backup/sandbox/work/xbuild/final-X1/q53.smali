.class public final synthetic Lq53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li7d;


# direct methods
.method public synthetic constructor <init>(Li7d;B)V
    .registers 3

    iput-byte p2, p0, Lq53;->a:B

    iput-object p1, p0, Lq53;->b:Li7d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lq53;->a:B

    iget-object p0, p0, Lq53;->b:Li7d;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Li7d;->p0()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Li7d;->r0()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
