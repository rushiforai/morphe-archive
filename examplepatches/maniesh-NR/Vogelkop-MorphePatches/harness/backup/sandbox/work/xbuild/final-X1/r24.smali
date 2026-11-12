.class public final Lr24;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lr24;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .registers 2

    iget-byte p0, p0, Lr24;->a:B

    packed-switch p0, :pswitch_data_e

    check-cast p1, [I

    array-length p0, p1

    return p0

    :pswitch_9
    check-cast p1, [B

    array-length p0, p1

    return p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final b()I
    .registers 1

    iget-byte p0, p0, Lr24;->a:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x4

    return p0

    :pswitch_7
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method
