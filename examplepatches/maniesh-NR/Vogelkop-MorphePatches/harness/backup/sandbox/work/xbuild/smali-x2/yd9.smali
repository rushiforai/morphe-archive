.class public final synthetic Lyd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lle9;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Lcom/opera/api/Callback;B)V
    .registers 7

    iput-byte p6, p0, Lyd9;->a:B

    iput-object p1, p0, Lyd9;->b:Lle9;

    iput-object p2, p0, Lyd9;->c:Ljava/lang/String;

    iput-object p3, p0, Lyd9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lyd9;->e:Ljava/lang/Object;

    iput-object p5, p0, Lyd9;->f:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 13

    iget-byte v0, p0, Lyd9;->a:B

    iget-object v1, p0, Lyd9;->f:Lcom/opera/api/Callback;

    iget-object v2, p0, Lyd9;->e:Ljava/lang/Object;

    iget-object v3, p0, Lyd9;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5a

    move-object v7, v3

    check-cast v7, Ljava/lang/String;

    move-object v9, v2

    check-cast v9, Lcom/opera/api/Callback;

    new-instance v4, Lxf1;

    iget-object v5, p0, Lyd9;->b:Lle9;

    iget-object v6, p0, Lyd9;->f:Lcom/opera/api/Callback;

    iget-object v8, p0, Lyd9;->c:Ljava/lang/String;

    invoke-direct/range {v4 .. v9}, Lxf1;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-object v4

    :pswitch_1d
    move-object v9, v3

    check-cast v9, Ljava/lang/String;

    move-object v10, v2

    check-cast v10, Ljava/lang/Runnable;

    new-instance v5, Lnwl;

    iget-object v6, p0, Lyd9;->b:Lle9;

    iget-object v7, p0, Lyd9;->f:Lcom/opera/api/Callback;

    iget-object v8, p0, Lyd9;->c:Ljava/lang/String;

    invoke-direct/range {v5 .. v10}, Lnwl;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-object v5

    :pswitch_2f
    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    move-object v11, v2

    check-cast v11, Lwe9;

    move-object v8, v1

    check-cast v8, Laxl;

    iget-object v7, p0, Lyd9;->b:Lle9;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lnwl;

    iget-object v9, p0, Lyd9;->c:Ljava/lang/String;

    invoke-direct/range {v6 .. v11}, Lnwl;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-object v6

    :pswitch_45
    check-cast v3, Ljava/lang/Long;

    move-object v5, v2

    check-cast v5, Lhu5;

    move-object v2, v1

    check-cast v2, Lj12;

    iget-object v1, p0, Lyd9;->b:Lle9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lee9;

    iget-object v4, p0, Lyd9;->c:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lee9;-><init>(Lle9;Lj12;Ljava/lang/Long;Ljava/lang/String;Lhu5;)V

    return-object v0

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_45
        :pswitch_2f
        :pswitch_1d
    .end packed-switch
.end method
