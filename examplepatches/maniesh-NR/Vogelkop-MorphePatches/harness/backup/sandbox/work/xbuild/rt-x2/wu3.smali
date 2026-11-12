.class public final synthetic Lwu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltvb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lav3;


# direct methods
.method public synthetic constructor <init>(Lav3;B)V
    .registers 3

    iput-byte p2, p0, Lwu3;->a:B

    iput-object p1, p0, Lwu3;->b:Lav3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lwu3;->a:B

    iget-object p0, p0, Lwu3;->b:Lav3;

    packed-switch v0, :pswitch_data_42

    invoke-virtual {p0}, Lav3;->a()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lav3;->a()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lav3;->a()V

    return-void

    :pswitch_13
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_19
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_1e
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_23
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_28
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_2d
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_32
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_37
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    :pswitch_3c
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lav3;->c(I)V

    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_37
        :pswitch_32
        :pswitch_2d
        :pswitch_28
        :pswitch_23
        :pswitch_1e
        :pswitch_19
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
