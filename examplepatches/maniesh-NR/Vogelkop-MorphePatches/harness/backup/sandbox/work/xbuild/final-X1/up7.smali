.class public final synthetic Lup7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhd;


# direct methods
.method public synthetic constructor <init>(Lhd;B)V
    .registers 3

    iput-byte p2, p0, Lup7;->a:B

    iput-object p1, p0, Lup7;->b:Lhd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lup7;->a:B

    iget-object p0, p0, Lup7;->b:Lhd;

    check-cast p1, Ldnn;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p1, p0}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_d
    invoke-virtual {p1, p0}, Ldnn;->a(Lann;)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
