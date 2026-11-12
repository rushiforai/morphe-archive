.class public final synthetic Lt22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls62;


# direct methods
.method public synthetic constructor <init>(Ls62;B)V
    .registers 3

    iput-byte p2, p0, Lt22;->a:B

    iput-object p1, p0, Lt22;->b:Ls62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lt22;->a:B

    iget-object p0, p0, Lt22;->b:Ls62;

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Ls62;->x:Lg22;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ls62;->p:Lq52;

    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo52;

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
