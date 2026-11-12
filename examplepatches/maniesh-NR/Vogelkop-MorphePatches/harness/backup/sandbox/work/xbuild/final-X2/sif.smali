.class public final synthetic Lsif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lisd;

.field public final synthetic c:Lcm;


# direct methods
.method public synthetic constructor <init>(Lisd;Lcm;B)V
    .registers 4

    iput-byte p3, p0, Lsif;->a:B

    iput-object p1, p0, Lsif;->b:Lisd;

    iput-object p2, p0, Lsif;->c:Lcm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lsif;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lsif;->c:Lcm;

    iget-object p0, p0, Lsif;->b:Lisd;

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    new-instance v0, Lvi2;

    iget v3, v2, Lcm;->b:I

    iget-object v2, v2, Lcm;->c:Ljava/lang/String;

    invoke-direct {v0, v3, v2}, Lvi2;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v0, v1, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_1b
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    new-instance v0, Lvi2;

    iget v3, v2, Lcm;->b:I

    iget-object v2, v2, Lcm;->c:Ljava/lang/String;

    invoke-direct {v0, v3, v2}, Lvi2;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v0, v1, v1}, Lvzk;->W(Lvi2;Llv5;Ltvh;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
