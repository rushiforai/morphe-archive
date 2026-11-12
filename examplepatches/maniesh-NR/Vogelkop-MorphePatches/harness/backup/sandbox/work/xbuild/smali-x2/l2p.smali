.class public final Ll2p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm2p;


# direct methods
.method public synthetic constructor <init>(Lm2p;B)V
    .registers 3

    iput-byte p2, p0, Ll2p;->a:B

    iput-object p1, p0, Ll2p;->b:Lm2p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ll2p;->a:B

    iget-object p0, p0, Ll2p;->b:Lm2p;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lm2p;->a:Lf2p;

    invoke-virtual {p0}, Lf2p;->d()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lm2p;->a:Lf2p;

    iget-boolean v0, p0, Lf2p;->a:Z

    if-nez v0, :cond_16

    invoke-virtual {p0}, Lf2p;->destroy()V

    :cond_16
    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
