.class public final synthetic Ldve;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldmg;
.implements Lfu8;
.implements Lylg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leve;


# direct methods
.method public synthetic constructor <init>(Leve;B)V
    .registers 3

    iput-byte p2, p0, Ldve;->a:B

    iput-object p1, p0, Ldve;->b:Leve;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Lj82;Lov0;Lcmg;II)V
    .registers 12

    iget-byte v0, p0, Ldve;->a:B

    iget-object p0, p0, Ldve;->b:Leve;

    sparse-switch v0, :sswitch_data_2e

    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lr9i;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    return-void

    :sswitch_15
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual/range {p0 .. p5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    return-void

    :sswitch_1d
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual/range {p0 .. p5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    return-void

    :sswitch_25
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual/range {p0 .. p5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    return-void

    nop

    :sswitch_data_2e
    .sparse-switch
        0x0 -> :sswitch_25
        0x3 -> :sswitch_1d
        0x6 -> :sswitch_15
    .end sparse-switch
.end method

.method public final n(Llx8;Lj82;)V
    .registers 4

    iget-byte v0, p0, Ldve;->a:B

    iget-object p0, p0, Ldve;->b:Leve;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->N(Llx8;Lj82;)V

    return-void

    :pswitch_f
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->N(Llx8;Lj82;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_f
    .end packed-switch
.end method

.method public final r(Llx8;Lj82;)V
    .registers 4

    iget-byte v0, p0, Ldve;->a:B

    iget-object p0, p0, Ldve;->b:Leve;

    sparse-switch v0, :sswitch_data_28

    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    :sswitch_f
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    :sswitch_17
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    :sswitch_1f
    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-virtual {p0, p1, p2}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    nop

    :sswitch_data_28
    .sparse-switch
        0x1 -> :sswitch_1f
        0x4 -> :sswitch_17
        0x7 -> :sswitch_f
    .end sparse-switch
.end method
