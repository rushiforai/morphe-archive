.class public final Lmve;
.super Lr9i;
.source "SourceFile"


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(Luqe;Lfu8;Lylg;Ldmg;B)V
    .registers 6

    iput-byte p5, p0, Lmve;->h:B

    const/16 p5, 0x16

    invoke-direct/range {p0 .. p5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-void
.end method


# virtual methods
.method public final F(Loqe;Lga6;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lmve;->h:B

    packed-switch p0, :pswitch_data_20

    check-cast p1, Lure;

    iget-object p0, p1, Lure;->D:Ljava/util/List;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_15
    check-cast p1, Ldre;

    iget-object p0, p1, Ldre;->D:Llog;

    iget-object p0, p0, Llog;->e:Lkog;

    iget-object p0, p0, Lkog;->b:Lm20;

    iget-object p0, p0, Lm20;->b:Ljava/lang/String;

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final H(Loqe;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lmve;->h:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_1e

    check-cast p1, Lure;

    iget-object p0, p1, Lure;->M:Lw9h;

    if-eqz p0, :cond_f

    iget-object v0, p0, Lw9h;->b:Ljava/lang/String;

    :cond_f
    return-object v0

    :pswitch_10
    check-cast p1, Ldre;

    iget-object p0, p1, Ldre;->D:Llog;

    iget-object p0, p0, Llog;->c:Levj;

    iget-object p0, p0, Levj;->b:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-eqz p0, :cond_1d

    move-object v0, p0

    :cond_1d
    return-object v0

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final I(Loqe;)J
    .registers 3

    iget-byte v0, p0, Lmve;->h:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lr9i;->I(Loqe;)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    check-cast p1, Ldre;

    iget-object p0, p1, Ldre;->D:Llog;

    iget-wide p0, p0, Llog;->f:J

    return-wide p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final J(Loqe;)Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lmve;->h:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Lr9i;->J(Loqe;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    check-cast p1, Ldre;

    iget-object p0, p1, Ldre;->D:Llog;

    iget-object p0, p0, Llog;->d:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
