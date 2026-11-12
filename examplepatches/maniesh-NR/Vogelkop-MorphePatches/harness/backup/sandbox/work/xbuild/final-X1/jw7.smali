.class public final synthetic Ljw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhcb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbvl;


# direct methods
.method public synthetic constructor <init>(Lbvl;B)V
    .registers 3

    iput-byte p2, p0, Ljw7;->a:B

    iput-object p1, p0, Ljw7;->b:Lbvl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAsInt()I
    .registers 2

    iget-byte v0, p0, Ljw7;->a:B

    iget-object p0, p0, Ljw7;->b:Lbvl;

    packed-switch v0, :pswitch_data_22

    invoke-interface {p0}, Lbvl;->getState()Lpde;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavl;

    iget p0, p0, Lavl;->c:I

    return p0

    :pswitch_14
    invoke-interface {p0}, Lbvl;->getState()Lpde;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavl;

    iget p0, p0, Lavl;->c:I

    return p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
