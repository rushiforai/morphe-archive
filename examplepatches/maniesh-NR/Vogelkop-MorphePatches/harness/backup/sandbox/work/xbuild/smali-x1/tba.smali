.class public final Ltba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls9i;


# direct methods
.method public synthetic constructor <init>(Ls9i;B)V
    .registers 3

    iput-byte p2, p0, Ltba;->a:B

    iput-object p1, p0, Ltba;->b:Ls9i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ltba;->a:B

    iget-object p0, p0, Ltba;->b:Ls9i;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Ls9i;->T()V

    return-void

    :pswitch_b
    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lro9;

    const/4 v0, 0x3

    iput v0, p0, Lro9;->b:I

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
