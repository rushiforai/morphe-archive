.class public final Lpt;
.super Lzrj;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lpt;->a:B

    iput-object p1, p0, Lpt;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lna3;I)V
    .registers 5

    iget-byte v0, p0, Lpt;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lpt;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3e

    check-cast p1, Lasj;

    check-cast p0, Lami;

    iget-object p1, p0, Lami;->d:Ljava/lang/Object;

    check-cast p1, Lmgh;

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Lmgh;->f()V

    :cond_15
    iput-object v1, p0, Lami;->c:Ljava/lang/Object;

    return-void

    :pswitch_18
    check-cast p1, Lasj;

    check-cast p0, Lgtj;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lgtj;->f:Z

    return-void

    :pswitch_20
    check-cast p1, Lasj;

    if-eqz p2, :cond_2a

    const/4 p1, 0x1

    if-eq p2, p1, :cond_2a

    sget-object p1, Lhjm;->b:Lhjm;

    goto :goto_2c

    :cond_2a
    sget-object p1, Lhjm;->a:Lhjm;

    :goto_2c
    check-cast p0, Lo93;

    invoke-virtual {p0, p1, p2}, Lo93;->b(Lhjm;I)V

    return-void

    :pswitch_32
    check-cast p1, Lasj;

    sget-object p1, Lu59;->g:Lqt;

    check-cast p0, Lqt;

    if-ne p1, p0, :cond_3c

    sput-object v1, Lu59;->g:Lqt;

    :cond_3c
    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_32
        :pswitch_20
        :pswitch_18
    .end packed-switch
.end method

.method public final bridge synthetic b(Lna3;)V
    .registers 3

    iget-byte v0, p0, Lpt;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1}, Lzrj;->b(Lna3;)V

    return-void

    :pswitch_9
    check-cast p1, Lasj;

    invoke-virtual {p0, p1}, Lpt;->c(Lasj;)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final c(Lasj;)V
    .registers 2

    iget-byte p1, p0, Lpt;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lpt;->b:Ljava/lang/Object;

    check-cast p0, Lgtj;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lgtj;->f:Z

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method
