.class public final synthetic Ld2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le2b;


# direct methods
.method public synthetic constructor <init>(Le2b;B)V
    .registers 3

    iput-byte p2, p0, Ld2b;->a:B

    iput-object p1, p0, Ld2b;->b:Le2b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ld2b;->a:B

    iget-object p0, p0, Ld2b;->b:Le2b;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d
    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
