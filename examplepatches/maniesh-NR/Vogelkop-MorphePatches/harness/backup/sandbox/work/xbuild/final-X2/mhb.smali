.class public final Lmhb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Lbz;


# direct methods
.method public constructor <init>(Li16;Lhhb;Lhhb;Lbz;)V
    .registers 5

    const/4 p1, 0x0

    iput-byte p1, p0, Lmhb;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmhb;->b:Ljava/lang/Object;

    iput-object p3, p0, Lmhb;->c:Ljava/lang/Object;

    iput-object p4, p0, Lmhb;->d:Lbz;

    return-void
.end method

.method public constructor <init>(Lyxe;Lzy;Laz;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lmhb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmhb;->d:Lbz;

    iput-object p2, p0, Lmhb;->b:Ljava/lang/Object;

    iput-object p3, p0, Lmhb;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 8

    iget-byte v0, p0, Lmhb;->a:B

    iget-object v1, p0, Lmhb;->b:Ljava/lang/Object;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_34

    iget-object v0, p0, Lmhb;->d:Lbz;

    check-cast v0, Lyxe;

    iget-object v3, v0, Lyxe;->b:Lnn7;

    new-instance v4, Lvx;

    const/16 v5, 0x1a

    invoke-direct {v4, p0, v5}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, p1, v4}, Lnn7;->k(Lyz;Lesk;)Z

    move-result v3

    if-eqz v3, :cond_22

    check-cast v1, Lzy;

    invoke-interface {v1, p1}, Lzy;->a(Lyz;)Z

    move-result v2

    goto :goto_2c

    :cond_22
    iget p1, v0, Lyxe;->c:I

    add-int/2addr p1, v2

    iput p1, v0, Lyxe;->c:I

    const-string p1, "Duplicate"

    invoke-virtual {p0, p1}, Lmhb;->onFailed(Ljava/lang/String;)V

    :goto_2c
    return v2

    :pswitch_2d
    check-cast v1, Lhhb;

    invoke-virtual {v1, p1}, Lhhb;->run(Ljava/lang/Object;)V

    return v2

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Lmhb;->a:B

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lmhb;->b:Ljava/lang/Object;

    check-cast p0, Lzy;

    invoke-interface {p0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    :pswitch_d
    iget-object p1, p0, Lmhb;->c:Ljava/lang/Object;

    check-cast p1, Lhhb;

    iget-object p0, p0, Lmhb;->d:Lbz;

    invoke-interface {p0}, Lbz;->b()Ls50;

    move-result-object p0

    invoke-virtual {p1, p0}, Lhhb;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
