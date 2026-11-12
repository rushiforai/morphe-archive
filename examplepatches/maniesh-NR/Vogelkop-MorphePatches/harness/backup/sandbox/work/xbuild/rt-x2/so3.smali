.class public final synthetic Lso3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwo3;


# direct methods
.method public synthetic constructor <init>(Lwo3;B)V
    .registers 3

    iput-byte p2, p0, Lso3;->a:B

    iput-object p1, p0, Lso3;->b:Lwo3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lso3;->a:B

    iget-object p0, p0, Lso3;->b:Lwo3;

    packed-switch v0, :pswitch_data_58

    sget-object v0, Lwo3;->K:Lpsp;

    iget-object p0, p0, Lwo3;->z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyo3;

    iget-object p0, p0, Lyo3;->f:Lva2;

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lwo3;->z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyo3;

    iget-object p0, p0, Lyo3;->f:Lva2;

    return-object p0

    :pswitch_1f
    iget-object p0, p0, Lwo3;->z:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyo3;

    iget-object p0, p0, Lyo3;->f:Lva2;

    return-object p0

    :pswitch_2a
    new-instance v0, Lmv2;

    iget-object v1, p0, Lwo3;->C:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvo3;

    new-instance v2, Lro3;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lro3;-><init>(Lwo3;B)V

    invoke-direct {v0, v1, v2}, Lmv2;-><init>(Lvo3;Lro3;)V

    return-object v0

    :pswitch_3e
    new-instance v0, Lfg;

    iget-object v1, p0, Lwo3;->C:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvo3;

    new-instance v2, Lro3;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lro3;-><init>(Lwo3;B)V

    invoke-direct {v0, v1, v2}, Lfg;-><init>(Lvo3;Lro3;)V

    return-object v0

    :pswitch_52
    new-instance v0, Lvo3;

    invoke-direct {v0, p0}, Lvo3;-><init>(Lwo3;)V

    return-object v0

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_52
        :pswitch_3e
        :pswitch_2a
        :pswitch_1f
        :pswitch_14
    .end packed-switch
.end method
