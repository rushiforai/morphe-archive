.class public final Lsx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 8
    const/4 v0, 0x1

    iput-byte v0, p0, Lsx;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsx;->a:B

    iput-object p1, p0, Lsx;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 5

    iget-byte v0, p0, Lsx;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Lsx;->b:Ljava/lang/Object;

    check-cast p0, Lgtg;

    iput-boolean v2, p0, Lgtg;->a:Z

    return v2

    :pswitch_e
    iget-object v0, p0, Lsx;->b:Ljava/lang/Object;

    check-cast v0, Lzy;

    if-eqz v0, :cond_1a

    invoke-interface {v0, p1}, Lzy;->a(Lyz;)Z

    move-result v2

    iput-object v1, p0, Lsx;->b:Ljava/lang/Object;

    :cond_1a
    return v2

    :pswitch_1b
    iget-object p1, p0, Lsx;->b:Ljava/lang/Object;

    check-cast p1, Lux;

    iput-object v1, p1, Lux;->l:Ljava/lang/String;

    new-instance p1, Lc4;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return v2

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_e
    .end packed-switch
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 4

    iget-byte v0, p0, Lsx;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_24

    iget-object p0, p0, Lsx;->b:Ljava/lang/Object;

    check-cast p0, Lgtg;

    iput-boolean v1, p0, Lgtg;->a:Z

    return-void

    :pswitch_d
    iget-object v0, p0, Lsx;->b:Ljava/lang/Object;

    check-cast v0, Lzy;

    if-eqz v0, :cond_19

    invoke-interface {v0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lsx;->b:Ljava/lang/Object;

    :cond_19
    return-void

    :pswitch_1a
    iget-object p0, p0, Lsx;->b:Ljava/lang/Object;

    check-cast p0, Lux;

    iput-object p1, p0, Lux;->l:Ljava/lang/String;

    iput-byte v1, p0, Lux;->k:B

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_d
    .end packed-switch
.end method
