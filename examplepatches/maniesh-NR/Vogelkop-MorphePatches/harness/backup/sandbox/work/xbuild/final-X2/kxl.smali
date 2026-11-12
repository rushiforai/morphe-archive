.class public final synthetic Lkxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx77;


# direct methods
.method public synthetic constructor <init>(Lx77;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lkxl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkxl;->b:Lx77;

    return-void
.end method

.method public synthetic constructor <init>(Lx77;I)V
    .registers 3

    .line 9
    const/4 p2, 0x0

    iput-byte p2, p0, Lkxl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkxl;->b:Lx77;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lkxl;->a:B

    iget-object p0, p0, Lkxl;->b:Lx77;

    packed-switch v0, :pswitch_data_22

    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Lod9;

    invoke-virtual {v0}, Lryl;->g0()V

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_18
    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
