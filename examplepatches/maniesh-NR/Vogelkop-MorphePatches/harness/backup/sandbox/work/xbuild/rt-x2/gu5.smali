.class public final synthetic Lgu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lku5;


# direct methods
.method public synthetic constructor <init>(Lku5;B)V
    .registers 3

    iput-byte p2, p0, Lgu5;->a:B

    iput-object p1, p0, Lgu5;->b:Lku5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lgu5;->a:B

    iget-object p0, p0, Lgu5;->b:Lku5;

    packed-switch v0, :pswitch_data_3a

    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lku5;->e()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lku5;->c()V

    :cond_1c
    invoke-virtual {p0}, Lku5;->g()V

    return-void

    :pswitch_20
    invoke-virtual {p0}, Lku5;->b()V

    return-void

    :pswitch_24
    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    if-eqz v0, :cond_39

    invoke-virtual {p0}, Lku5;->e()Z

    move-result v0

    if-nez v0, :cond_39

    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_39

    invoke-virtual {p0}, Lku5;->c()V

    :cond_39
    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_24
        :pswitch_20
        :pswitch_20
    .end packed-switch
.end method
