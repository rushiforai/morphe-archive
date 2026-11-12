.class public final synthetic Lj4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr4m;


# direct methods
.method public synthetic constructor <init>(Lr4m;B)V
    .registers 3

    iput-byte p2, p0, Lj4m;->a:B

    iput-object p1, p0, Lj4m;->b:Lr4m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lj4m;->a:B

    iget-object p0, p0, Lj4m;->b:Lr4m;

    check-cast p1, Lszb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch v0, :pswitch_data_20

    new-instance v0, Lq4m;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lq4m;-><init>(Lr4m;Lszb;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void

    :pswitch_16
    new-instance v0, Lq4m;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lq4m;-><init>(Lr4m;Lszb;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
