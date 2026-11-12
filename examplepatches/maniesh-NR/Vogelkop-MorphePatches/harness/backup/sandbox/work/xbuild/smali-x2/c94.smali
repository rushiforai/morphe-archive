.class public final synthetic Lc94;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lc94;->a:B

    iput-object p1, p0, Lc94;->b:Lcom/opera/api/Callback;

    iput-object p2, p0, Lc94;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lc94;->a:B

    iget-object v1, p0, Lc94;->c:Ljava/lang/Object;

    iget-object p0, p0, Lc94;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_12

    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_d
    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
