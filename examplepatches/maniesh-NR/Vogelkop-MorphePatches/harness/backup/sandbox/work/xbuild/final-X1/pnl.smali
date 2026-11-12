.class public final synthetic Lpnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkol;

.field public final synthetic c:[Ldol;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lkol;[Ldol;IB)V
    .registers 5

    iput-byte p4, p0, Lpnl;->a:B

    iput-object p1, p0, Lpnl;->b:Lkol;

    iput-object p2, p0, Lpnl;->c:[Ldol;

    iput p3, p0, Lpnl;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lpnl;->a:B

    packed-switch v0, :pswitch_data_3e

    iget v0, p0, Lpnl;->d:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lpnl;->b:Lkol;

    iget-object p0, p0, Lpnl;->c:[Ldol;

    invoke-virtual {v1, p0, v0}, Lkol;->b([Ldol;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget v0, p0, Lpnl;->d:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lpnl;->b:Lkol;

    iget-object p0, p0, Lpnl;->c:[Ldol;

    invoke-virtual {v1, p0, v0}, Lkol;->b([Ldol;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    iget v0, p0, Lpnl;->d:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lpnl;->b:Lkol;

    iget-object p0, p0, Lpnl;->c:[Ldol;

    invoke-virtual {v1, p0, v0}, Lkol;->b([Ldol;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f
    iget v0, p0, Lpnl;->d:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lpnl;->b:Lkol;

    iget-object p0, p0, Lpnl;->c:[Ldol;

    invoke-virtual {v1, p0, v0}, Lkol;->b([Ldol;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_21
        :pswitch_13
    .end packed-switch
.end method
