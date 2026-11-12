.class public final synthetic Lnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsl;


# direct methods
.method public synthetic constructor <init>(Lsl;B)V
    .registers 3

    iput-byte p2, p0, Lnl;->a:B

    iput-object p1, p0, Lnl;->b:Lsl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lnl;->a:B

    iget-object p0, p0, Lnl;->b:Lsl;

    check-cast p1, Lorb;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0, p1}, Lsl;->c(Lorb;)V

    invoke-virtual {p0}, Lsl;->q()V

    return-void

    :pswitch_10
    invoke-virtual {p0, p1}, Lsl;->c(Lorb;)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
