.class public final synthetic Lrl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lysj;


# direct methods
.method public synthetic constructor <init>(Lysj;B)V
    .registers 3

    iput-byte p2, p0, Lrl3;->a:B

    iput-object p1, p0, Lrl3;->b:Lysj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final f(Lo93;)V
    .registers 4

    iget-byte v0, p0, Lrl3;->a:B

    sget-object v1, Lijm;->b:Lijm;

    iget-object p0, p0, Lrl3;->b:Lysj;

    packed-switch v0, :pswitch_data_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
