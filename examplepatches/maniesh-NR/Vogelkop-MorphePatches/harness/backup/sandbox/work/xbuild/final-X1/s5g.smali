.class public final synthetic Ls5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt5g;


# direct methods
.method public synthetic constructor <init>(Lt5g;B)V
    .registers 3

    iput-byte p2, p0, Ls5g;->a:B

    iput-object p1, p0, Ls5g;->b:Lt5g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ls5g;->a:B

    iget-object p0, p0, Ls5g;->b:Lt5g;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    packed-switch v0, :pswitch_data_4a

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p0, p0, Lt6g;->b:Lot2;

    iget-object v0, p0, Lot2;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx5g;

    new-instance v1, Leme;

    invoke-direct {v1, v0}, Leme;-><init>(Ljava/lang/Object;)V

    new-instance v2, Llt2;

    invoke-direct {v2, p1, v1, p0}, Llt2;-><init>(ILeme;Lot2;)V

    invoke-static {v0, v2}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b
    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p0, p0, Lt6g;->b:Lot2;

    iget-object v0, p0, Lot2;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx5g;

    new-instance v1, Leme;

    invoke-direct {v1, v0}, Leme;-><init>(Ljava/lang/Object;)V

    new-instance v2, Llt2;

    invoke-direct {v2, p1, v1, p0}, Llt2;-><init>(ILeme;Lot2;)V

    invoke-static {v0, v2}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
