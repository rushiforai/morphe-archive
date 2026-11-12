.class public final Lht3;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lht3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final G(Lb2l;)V
    .registers 3

    iget-byte p0, p0, Lht3;->a:B

    packed-switch p0, :pswitch_data_38

    return-void

    :pswitch_6
    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_14

    const-string p0, "<private tab>"

    goto :goto_1c

    :cond_14
    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    :goto_1c
    if-eqz p0, :cond_36

    sget-object p1, Laik;->a:[Ljava/lang/String;

    const/16 p1, 0x3f

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_2d

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_2d
    invoke-static {p0}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x2d

    invoke-static {p1, p0}, Lks3;->I(ILjava/lang/String;)V

    :cond_36
    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final x(Lb2l;)V
    .registers 3

    iget-byte p0, p0, Lht3;->a:B

    packed-switch p0, :pswitch_data_3c

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_13

    const-string p0, "<private tab>"

    goto :goto_19

    :cond_13
    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    :goto_19
    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isActive()Z

    move-result p1

    if-eqz p1, :cond_3b

    if-eqz p0, :cond_3b

    sget-object p1, Laik;->a:[Ljava/lang/String;

    const/16 p1, 0x3f

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_32

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_32
    invoke-static {p0}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x2d

    invoke-static {p1, p0}, Lks3;->I(ILjava/lang/String;)V

    :cond_3b
    return-void

    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
