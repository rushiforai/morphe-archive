.class public final synthetic Lp52;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq52;


# direct methods
.method public synthetic constructor <init>(Lq52;B)V
    .registers 3

    iput-byte p2, p0, Lp52;->a:B

    iput-object p1, p0, Lp52;->b:Lq52;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lp52;->a:B

    iget-object p0, p0, Lp52;->b:Lq52;

    packed-switch v0, :pswitch_data_1a

    check-cast p1, Lt0i;

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lq52;->a()V

    :cond_e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    check-cast p1, Ldpf;

    invoke-virtual {p0}, Lq52;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
