.class public final Luk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lti5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li93;


# direct methods
.method public synthetic constructor <init>(Li93;B)V
    .registers 3

    iput-byte p2, p0, Luk;->a:B

    iput-object p1, p0, Luk;->b:Li93;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 2

    iget-byte v0, p0, Luk;->a:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Luk;->b:Li93;

    check-cast p0, Lwyl;

    invoke-virtual {p0}, Lwyl;->H0()V

    :pswitch_c
    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final y()V
    .registers 2

    iget-byte v0, p0, Luk;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Luk;->b:Li93;

    check-cast p0, Lwk;

    invoke-virtual {p0}, Lwk;->H0()V

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
