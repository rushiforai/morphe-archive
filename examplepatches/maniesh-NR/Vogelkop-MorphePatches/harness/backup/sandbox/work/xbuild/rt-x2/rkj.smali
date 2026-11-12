.class public final synthetic Lrkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lskj;


# direct methods
.method public synthetic constructor <init>(Lskj;B)V
    .registers 3

    iput-byte p2, p0, Lrkj;->a:B

    iput-object p1, p0, Lrkj;->b:Lskj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lrkj;->a:B

    iget-object p0, p0, Lrkj;->b:Lskj;

    packed-switch v0, :pswitch_data_16

    sget-object v0, Lpkj;->b:Lpkj;

    invoke-virtual {p0, v0}, Lc63;->j0(Ljava/lang/Object;)V

    :goto_c
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_f
    sget-object v0, Lpkj;->a:Lpkj;

    invoke-virtual {p0, v0}, Lc63;->j0(Ljava/lang/Object;)V

    goto :goto_c

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
