.class public final synthetic Lzd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lle9;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;B)V
    .registers 6

    iput-byte p5, p0, Lzd9;->a:B

    iput-object p1, p0, Lzd9;->b:Lle9;

    iput-object p2, p0, Lzd9;->c:Ljava/lang/String;

    iput-object p3, p0, Lzd9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lzd9;->e:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 5

    iget-byte v0, p0, Lzd9;->a:B

    iget-object v1, p0, Lzd9;->e:Lcom/opera/api/Callback;

    iget-object v2, p0, Lzd9;->d:Ljava/lang/Object;

    iget-object v3, p0, Lzd9;->c:Ljava/lang/String;

    iget-object p0, p0, Lzd9;->b:Lle9;

    packed-switch v0, :pswitch_data_3c

    check-cast v2, Lcom/opera/api/Callback;

    new-instance v0, Lai2;

    invoke-direct {v0, p0, v1, v3, v2}, Lai2;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-object v0

    :pswitch_15
    check-cast v2, Lhu5;

    check-cast v1, Lhu5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lee9;

    invoke-direct {v0, p0, v1, v3, v2}, Lee9;-><init>(Lle9;Lhu5;Ljava/lang/String;Lhu5;)V

    return-object v0

    :pswitch_22
    check-cast v2, Lue9;

    check-cast v1, Lpe9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lai2;

    invoke-direct {v0, p0, v1, v3, v2}, Lai2;-><init>(Lle9;Lpe9;Ljava/lang/String;Lue9;)V

    return-object v0

    :pswitch_2f
    check-cast v2, Lcn7;

    check-cast v1, Lj12;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lci2;

    invoke-direct {v0, p0, v1, v3, v2}, Lci2;-><init>(Lle9;Lj12;Ljava/lang/String;Lcn7;)V

    return-object v0

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_22
        :pswitch_15
    .end packed-switch
.end method
