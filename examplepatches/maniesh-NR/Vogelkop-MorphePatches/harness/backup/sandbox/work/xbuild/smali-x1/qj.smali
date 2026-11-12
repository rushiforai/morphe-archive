.class public final synthetic Lqj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lekj;
.implements Ldkj;
.implements Lcom/leanplum/internal/Request$ResponseCallback;
.implements Lcom/leanplum/internal/Request$ErrorCallback;
.implements Ln5o;
.implements Lm9n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;B)V
    .registers 3

    iput-byte p2, p0, Lqj;->a:B

    iput-object p1, p0, Lqj;->b:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final b(Lhjm;)V
    .registers 2

    iget-byte p1, p0, Lqj;->a:B

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    packed-switch p1, :pswitch_data_10

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_b
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method

.method public final error(Ljava/lang/Exception;)V
    .registers 2

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lcom/leanplum/internal/FileTransferManager;->b(Ljava/lang/Runnable;Ljava/lang/Exception;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lqj;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Void;

    packed-switch v0, :pswitch_data_1a

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-object v1

    :pswitch_e
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-object v1

    :pswitch_12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-object v1

    :pswitch_16
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-object v1

    :pswitch_data_1a
    .packed-switch 0x4
        :pswitch_16
        :pswitch_12
        :pswitch_e
    .end packed-switch
.end method

.method public final j()V
    .registers 1

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final response(Lorg/json/JSONObject;)V
    .registers 2

    iget-object p0, p0, Lqj;->b:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lcom/leanplum/internal/FileTransferManager;->a(Ljava/lang/Runnable;Lorg/json/JSONObject;)V

    return-void
.end method
