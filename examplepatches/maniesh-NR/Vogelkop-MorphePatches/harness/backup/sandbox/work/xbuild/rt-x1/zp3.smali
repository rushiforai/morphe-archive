.class public final Lzp3;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Z

.field public final synthetic d:Lt0h;


# direct methods
.method public synthetic constructor <init>(Lt0h;ZB)V
    .registers 4

    iput-byte p3, p0, Lzp3;->b:B

    iput-object p1, p0, Lzp3;->d:Lt0h;

    iput-boolean p2, p0, Lzp3;->c:Z

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 3

    iget-byte v0, p0, Lzp3;->b:B

    iget-boolean v1, p0, Lzp3;->c:Z

    iget-object p0, p0, Lzp3;->d:Lt0h;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lnwf;

    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0, v1}, Lhv3;->j(Z)V

    return-void

    :pswitch_11
    check-cast p0, Lnwf;

    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0, v1}, Lhv3;->j(Z)V

    return-void

    :pswitch_19
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    invoke-virtual {p0, v1}, Lhv3;->j(Z)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_19
        :pswitch_11
    .end packed-switch
.end method

.method public final o()V
    .registers 5

    iget-byte v0, p0, Lzp3;->b:B

    sget-object v1, Lph0;->h:Lph0;

    sget-object v2, Lph0;->f:Lph0;

    iget-boolean v3, p0, Lzp3;->c:Z

    iget-object p0, p0, Lzp3;->d:Lt0h;

    packed-switch v0, :pswitch_data_2c

    check-cast p0, Lnwf;

    if-eqz v3, :cond_12

    move-object v1, v2

    :cond_12
    invoke-virtual {p0, v1}, Lnwf;->v(Lph0;)V

    return-void

    :pswitch_16
    check-cast p0, Lnwf;

    if-eqz v3, :cond_1d

    sget-object v0, Lrq0;->e:Lrq0;

    goto :goto_1f

    :cond_1d
    sget-object v0, Lrq0;->f:Lrq0;

    :goto_1f
    invoke-virtual {p0, v0}, Lnwf;->x(Lrq0;)V

    return-void

    :pswitch_23
    check-cast p0, Lbq3;

    if-eqz v3, :cond_28

    move-object v1, v2

    :cond_28
    invoke-virtual {p0, v1}, Lbq3;->u(Lph0;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method
