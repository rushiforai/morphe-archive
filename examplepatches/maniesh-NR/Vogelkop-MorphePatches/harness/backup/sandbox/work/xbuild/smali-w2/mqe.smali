.class public final synthetic Lmqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnqe;


# direct methods
.method public synthetic constructor <init>(Lnqe;B)V
    .registers 3

    iput-byte p2, p0, Lmqe;->a:B

    iput-object p1, p0, Lmqe;->b:Lnqe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lmqe;->a:B

    iget-object p0, p0, Lmqe;->b:Lnqe;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lv0f;

    invoke-virtual {p0}, Lnqe;->S()V

    return-void

    :pswitch_d
    check-cast p1, Lcse;

    invoke-virtual {p0}, Lnqe;->S()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
