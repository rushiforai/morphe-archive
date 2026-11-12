.class public final synthetic Lm1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;B)V
    .registers 3

    iput-byte p2, p0, Lm1e;->a:B

    iput-object p1, p0, Lm1e;->b:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lm1e;->a:B

    iget-object p0, p0, Lm1e;->b:Lkotlin/jvm/functions/Function1;

    packed-switch v0, :pswitch_data_1a

    check-cast p0, Lzbe;

    invoke-virtual {p0, p1}, Lzbe;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv90;

    return-object p0

    :pswitch_10
    check-cast p0, Ljkc;

    invoke-virtual {p0, p1}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
