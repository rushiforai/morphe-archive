.class public final synthetic Ltj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyj0;


# direct methods
.method public synthetic constructor <init>(Lyj0;B)V
    .registers 3

    iput-byte p2, p0, Ltj0;->a:B

    iput-object p1, p0, Ltj0;->b:Lyj0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Ltj0;->a:B

    const/16 v1, 0x12

    const/16 v2, 0x879

    iget-object p0, p0, Ltj0;->b:Lyj0;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_8e

    new-instance v0, Lhh0;

    iget-object p0, p0, Lyj0;->b:Lt56;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leh0;

    if-nez v4, :cond_28

    new-instance v4, Leh0;

    const/4 v5, 0x2

    invoke-direct {v4, v2, v3, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Leh0;

    :cond_28
    invoke-direct {v0, v4}, Lhh0;-><init>(Leh0;)V

    return-object v0

    :pswitch_2c
    new-instance v0, Lfa0;

    iget-object p0, p0, Lyj0;->b:Lt56;

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lda0;

    if-nez v4, :cond_49

    new-instance v4, Lda0;

    invoke-direct {v4, v2, v3, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lda0;

    :cond_49
    invoke-direct {v0, v4}, Lfa0;-><init>(Lda0;)V

    return-object v0

    :pswitch_4d
    new-instance v0, Luf0;

    iget-object p0, p0, Lyj0;->b:Lt56;

    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpf0;

    if-nez v4, :cond_6a

    new-instance v4, Lpf0;

    const/4 v5, 0x3

    invoke-direct {v4, v2, v3, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lpf0;

    :cond_6a
    invoke-direct {v0, v4}, Luf0;-><init>(Lpf0;)V

    return-object v0

    :pswitch_6e
    new-instance v0, Lqs7;

    iget-object p0, p0, Lyj0;->b:Lt56;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldk0;

    if-nez v4, :cond_8a

    new-instance v4, Ldk0;

    const/16 v5, 0x8

    invoke-direct {v4, v2, v3, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldk0;

    :cond_8a
    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    return-object v0

    :pswitch_data_8e
    .packed-switch 0x0
        :pswitch_6e
        :pswitch_4d
        :pswitch_2c
    .end packed-switch
.end method
