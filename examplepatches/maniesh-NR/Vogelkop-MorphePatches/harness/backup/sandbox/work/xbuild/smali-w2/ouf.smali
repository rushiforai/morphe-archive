.class public final Louf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Louf;->a:B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Louf;

    if-eqz v0, :cond_c

    check-cast p1, Louf;

    iget-byte p1, p1, Louf;->a:B

    iget-byte p0, p0, Louf;->a:B

    if-eq p0, p1, :cond_e

    :cond_c
    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-byte p0, p0, Louf;->a:B

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Louf;->a:B

    if-eqz p0, :cond_28

    const/4 v0, 0x1

    if-eq p0, v0, :cond_25

    const/4 v0, 0x2

    if-eq p0, v0, :cond_22

    packed-switch p0, :pswitch_data_2c

    const-string v0, "OutputStatus(value="

    const/16 v1, 0x29

    invoke-static {v0, p0, v1}, Lfki;->r(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_16
    const-string p0, "ERROR_OUTPUT_DROPPED"

    return-object p0

    :pswitch_19
    const-string p0, "ERROR_OUTPUT_MISSING"

    return-object p0

    :pswitch_1c
    const-string p0, "ERROR_OUTPUT_ABORTED"

    return-object p0

    :pswitch_1f
    const-string p0, "ERROR_OUTPUT_FAILED"

    return-object p0

    :cond_22
    const-string p0, "UNAVAILABLE"

    return-object p0

    :cond_25
    const-string p0, "AVAILABLE"

    return-object p0

    :cond_28
    const-string p0, "PENDING"

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0xa
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
    .end packed-switch
.end method
