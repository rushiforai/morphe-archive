.class public final synthetic Ld47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltt2;


# direct methods
.method public synthetic constructor <init>(Ltt2;B)V
    .registers 3

    iput-byte p2, p0, Ld47;->a:B

    iput-object p1, p0, Ld47;->b:Ltt2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ld47;->a:B

    iget-object p0, p0, Ld47;->b:Ltt2;

    check-cast p1, Lz37;

    packed-switch v0, :pswitch_data_32

    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    sget-object v0, Lz37;->b:Lz37;

    if-ne p1, v0, :cond_21

    const/4 p1, 0x1

    goto :goto_22

    :cond_21
    const/4 p1, 0x0

    :goto_22
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c
    invoke-virtual {p0, p1}, Ltt2;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_1b
        :pswitch_15
        :pswitch_f
    .end packed-switch
.end method
