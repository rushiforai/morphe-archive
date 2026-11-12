.class public final Lp2f;
.super Lua7;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lq2f;


# direct methods
.method public synthetic constructor <init>(Lq2f;B)V
    .registers 3

    iput-byte p2, p0, Lp2f;->e:B

    iput-object p1, p0, Lp2f;->f:Lq2f;

    const/16 p1, 0x15

    invoke-direct {p0, p1}, Lua7;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final y(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Lp2f;->e:B

    iget-object p0, p0, Lp2f;->f:Lq2f;

    packed-switch p1, :pswitch_data_16

    iget p0, p0, Lq2f;->k:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_e
    iget p0, p0, Lq2f;->l:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
