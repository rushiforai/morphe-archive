.class public final Lzmn;
.super Ldnn;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lzmn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lann;)V
    .registers 2

    iget-byte p0, p0, Lzmn;->a:B

    packed-switch p0, :pswitch_data_e

    invoke-interface {p1}, Lann;->e()V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lann;->d()V

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
