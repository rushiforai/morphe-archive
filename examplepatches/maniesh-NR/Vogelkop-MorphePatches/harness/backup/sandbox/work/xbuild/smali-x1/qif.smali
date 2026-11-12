.class public final synthetic Lqif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lisd;


# direct methods
.method public synthetic constructor <init>(Lisd;B)V
    .registers 3

    iput-byte p2, p0, Lqif;->a:B

    iput-object p1, p0, Lqif;->b:Lisd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lqif;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lqif;->b:Lisd;

    packed-switch v0, :pswitch_data_28

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    invoke-virtual {p0, v1, v1, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_10
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    invoke-virtual {p0, v1, v1, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_18
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    iget-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Li16;

    iget-object v0, v0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Ltvh;

    invoke-virtual {p0, v1, v1, v0}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_18
        :pswitch_10
    .end packed-switch
.end method
