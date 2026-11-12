.class public final Lxp3;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lt0h;


# direct methods
.method public synthetic constructor <init>(Lt0h;B)V
    .registers 3

    iput-byte p2, p0, Lxp3;->b:B

    iput-object p1, p0, Lxp3;->c:Lt0h;

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method

.method private final s()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 2

    iget-byte v0, p0, Lxp3;->b:B

    iget-object p0, p0, Lxp3;->c:Lt0h;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lnwf;

    iget-object p0, p0, Lnwf;->b:Lhv3;

    invoke-virtual {p0}, Lhv3;->i()V

    return-void

    :pswitch_f
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    invoke-virtual {p0}, Lhv3;->m()V

    return-void

    :pswitch_17
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    invoke-virtual {p0}, Lhv3;->i()V

    return-void

    :pswitch_1f
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Leq9;->d(Z)V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final o()V
    .registers 3

    iget-byte v0, p0, Lxp3;->b:B

    sget-object v1, Lph0;->l:Lph0;

    iget-object p0, p0, Lxp3;->c:Lt0h;

    packed-switch v0, :pswitch_data_1e

    check-cast p0, Lnwf;

    invoke-virtual {p0, v1}, Lnwf;->v(Lph0;)V

    return-void

    :pswitch_f
    check-cast p0, Lbq3;

    sget-object v0, Lph0;->j:Lph0;

    invoke-virtual {p0, v0}, Lbq3;->u(Lph0;)V

    return-void

    :pswitch_17
    check-cast p0, Lbq3;

    invoke-virtual {p0, v1}, Lbq3;->u(Lph0;)V

    :pswitch_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
