.class public final Lzr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc7d;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Las2;


# direct methods
.method public synthetic constructor <init>(Las2;B)V
    .registers 3

    iput-byte p2, p0, Lzr2;->a:B

    iput-object p1, p0, Lzr2;->b:Las2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(I)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 3

    iget-byte p1, p0, Lzr2;->a:B

    packed-switch p1, :pswitch_data_18

    return-void

    :pswitch_6
    sget-object p1, Lkd6;->a:Lkd6;

    iget-object p0, p0, Lzr2;->b:Las2;

    iput-object p1, p0, Las2;->a:Lkd6;

    sget-object p1, Ljd6;->b:Ljd6;

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Las2;->b(Ltw7;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onSuccess()V
    .registers 3

    iget-byte v0, p0, Lzr2;->a:B

    iget-object p0, p0, Lzr2;->b:Las2;

    packed-switch v0, :pswitch_data_38

    iget-object v0, p0, Las2;->d:Lt3g;

    instance-of v1, v0, Lyr2;

    if-eqz v1, :cond_17

    check-cast v0, Lyr2;

    new-instance p0, Lp3g;

    invoke-direct {p0}, Lp3g;-><init>()V

    iput-object p0, v0, Lyr2;->a:Lt3g;

    goto :goto_20

    :cond_17
    new-instance v0, Lvk1;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lvk1;-><init>(B)V

    iput-object v0, p0, Las2;->c:Lkotlin/jvm/functions/Function0;

    :goto_20
    return-void

    :pswitch_21
    new-instance v0, Lvk1;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Lvk1;-><init>(B)V

    iput-object v0, p0, Las2;->c:Lkotlin/jvm/functions/Function0;

    sget-object v0, Lkd6;->c:Lkd6;

    iput-object v0, p0, Las2;->a:Lkd6;

    new-instance v0, Lsw7;

    invoke-direct {v0, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Las2;->b(Ltw7;)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
