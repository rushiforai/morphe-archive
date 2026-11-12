.class public final synthetic Lnh8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrh8;


# direct methods
.method public synthetic constructor <init>(Lrh8;B)V
    .registers 3

    iput-byte p2, p0, Lnh8;->a:B

    iput-object p1, p0, Lnh8;->b:Lrh8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lnh8;->a:B

    iget-object p0, p0, Lnh8;->b:Lrh8;

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lrh8;->k:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_d
    invoke-virtual {p0}, Lrh8;->b()V

    return-void

    :pswitch_11
    invoke-virtual {p0}, Lrh8;->b()V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method
