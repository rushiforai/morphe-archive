.class public final Lmwf;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lnwf;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lnwf;ZB)V
    .registers 4

    iput-byte p3, p0, Lmwf;->b:B

    iput-object p1, p0, Lmwf;->c:Lnwf;

    iput-boolean p2, p0, Lmwf;->d:Z

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 3

    iget-byte v0, p0, Lmwf;->b:B

    iget-boolean v1, p0, Lmwf;->d:Z

    iget-object p0, p0, Lmwf;->c:Lnwf;

    packed-switch v0, :pswitch_data_16

    iget-object p0, p0, Lnwf;->b:Lhv3;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lhv3;->p(Ljava/lang/String;Z)V

    return-void

    :pswitch_10
    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0, v1}, Lhv3;->j(Z)V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final o()V
    .registers 3

    iget-byte v0, p0, Lmwf;->b:B

    iget-object v1, p0, Lmwf;->c:Lnwf;

    packed-switch v0, :pswitch_data_1a

    sget-object p0, Lxl0;->f:Lxl0;

    invoke-virtual {v1, p0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_d
    iget-boolean p0, p0, Lmwf;->d:Z

    if-eqz p0, :cond_14

    sget-object p0, Lxl0;->u:Lxl0;

    goto :goto_16

    :cond_14
    sget-object p0, Lxl0;->v:Lxl0;

    :goto_16
    invoke-virtual {v1, p0}, Lnwf;->w(Lxl0;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
