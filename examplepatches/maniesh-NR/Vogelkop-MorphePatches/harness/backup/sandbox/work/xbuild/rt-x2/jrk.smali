.class public final synthetic Ljrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqt6;


# direct methods
.method public synthetic constructor <init>(Lqt6;B)V
    .registers 3

    iput-byte p2, p0, Ljrk;->a:B

    iput-object p1, p0, Ljrk;->b:Lqt6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ljrk;->a:B

    iget-object p0, p0, Ljrk;->b:Lqt6;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lqt6;->m()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lqt6;->m()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
