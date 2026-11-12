.class public final synthetic Lm8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx8e;


# direct methods
.method public synthetic constructor <init>(Lx8e;B)V
    .registers 3

    iput-byte p2, p0, Lm8e;->a:B

    iput-object p1, p0, Lm8e;->b:Lx8e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lm8e;->a:B

    iget-object p0, p0, Lm8e;->b:Lx8e;

    packed-switch v0, :pswitch_data_2c

    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Lx8e;->a()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0}, Lx8e;->b()Li46;

    move-result-object p0

    invoke-interface {p0}, Li46;->d()I

    move-result p0

    invoke-direct {v0, v1, p0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object v0

    :pswitch_19
    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Lx8e;->a()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0}, Lx8e;->b()Li46;

    move-result-object p0

    invoke-interface {p0}, Li46;->d()I

    move-result p0

    invoke-direct {v0, v1, p0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object v0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
