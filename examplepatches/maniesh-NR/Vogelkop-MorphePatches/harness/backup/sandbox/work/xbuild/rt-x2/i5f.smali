.class public final synthetic Li5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lx5f;B)V
    .registers 3

    iput-byte p2, p0, Li5f;->a:B

    iput-object p1, p0, Li5f;->b:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Li5f;->a:B

    iget-object p0, p0, Li5f;->b:Lx5f;

    check-cast p1, Lkotlin/Unit;

    packed-switch v0, :pswitch_data_4c

    iget-object p1, p0, Lx5f;->f:Lmgh;

    invoke-virtual {p1}, Lmgh;->h()Ljf0;

    move-result-object p1

    check-cast p1, Lx56;

    if-nez p1, :cond_16

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_3d

    :cond_16
    :try_start_16
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Lxq0;

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_22} :catch_3b

    const/4 v2, 0x2

    :try_start_23
    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {v1, p1}, Lxq0;->g4(Ljava/io/DataOutputStream;Lx56;)V
    :try_end_29
    .catchall {:try_start_23 .. :try_end_29} :catchall_36

    :try_start_29
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    iget-object p0, p0, Lx5f;->g:Lf11;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->H([B)V

    goto :goto_3b

    :catchall_36
    move-exception p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_3b} :catch_3b

    :catch_3b
    :goto_3b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3d
    return-object p0

    :pswitch_3e
    iget-object p0, p0, Lx5f;->g:Lf11;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->I(Landroid/os/Message;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_3e
    .end packed-switch
.end method
