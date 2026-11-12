.class public final synthetic Lyc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrma;


# direct methods
.method public synthetic constructor <init>(Lrma;B)V
    .registers 3

    iput-byte p2, p0, Lyc9;->a:B

    iput-object p1, p0, Lyc9;->b:Lrma;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lyc9;->a:B

    iget-object p0, p0, Lyc9;->b:Lrma;

    packed-switch v0, :pswitch_data_5e

    iget-object v0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v0, Lcd9;

    iget v1, p0, Lrma;->b:I

    if-eqz v1, :cond_58

    iget-object v2, p0, Lrma;->i:Ljava/lang/Object;

    check-cast v2, Lih4;

    if-eqz v2, :cond_1f

    invoke-interface {v2}, Lih4;->cancel()V

    const/4 v1, 0x0

    iput-object v1, p0, Lrma;->i:Ljava/lang/Object;

    iget v1, p0, Lrma;->b:I

    if-eqz v1, :cond_58

    :cond_1f
    const/4 v2, 0x0

    iput v2, p0, Lrma;->b:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result p0

    const/4 v1, 0x1

    if-eqz p0, :cond_55

    if-eq p0, v1, :cond_55

    const/4 v1, 0x2

    if-eq p0, v1, :cond_51

    const/4 v2, 0x3

    if-eq p0, v2, :cond_40

    const/4 v2, 0x4

    if-ne p0, v2, :cond_58

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Loc4;

    invoke-direct {p0, v0, v1, v1}, Loc4;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v0, p0}, Lcd9;->z0(Ljava/lang/Runnable;)V

    goto :goto_58

    :cond_40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lbr;

    const/16 v1, 0xc

    const v2, 0x7f140796

    invoke-direct {p0, v0, v2, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v0, p0}, Lcd9;->z0(Ljava/lang/Runnable;)V

    goto :goto_58

    :cond_51
    invoke-virtual {v0, v1}, Lcd9;->A0(I)V

    goto :goto_58

    :cond_55
    invoke-virtual {v0, v1}, Lcd9;->A0(I)V

    :cond_58
    :goto_58
    return-void

    :pswitch_59
    invoke-virtual {p0}, Lrma;->l()V

    return-void

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_59
    .end packed-switch
.end method
