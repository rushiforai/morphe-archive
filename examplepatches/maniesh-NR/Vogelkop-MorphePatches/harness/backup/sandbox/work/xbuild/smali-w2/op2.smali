.class public final synthetic Lop2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lob;


# direct methods
.method public synthetic constructor <init>(Lob;B)V
    .registers 3

    iput-byte p2, p0, Lop2;->a:B

    iput-object p1, p0, Lop2;->b:Lob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lop2;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lop2;->b:Lob;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_32

    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-virtual {p0, p1, v1}, Lx5f;->B(ZZ)V

    return-void

    :pswitch_17
    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-virtual {p0, p1, v1}, Lx5f;->z(ZZ)V

    return-void

    :pswitch_24
    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-virtual {p0, p1, v1}, Lx5f;->A(ZZ)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_24
        :pswitch_17
    .end packed-switch
.end method
