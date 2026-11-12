.class public final synthetic Lcsj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfsj;


# direct methods
.method public synthetic constructor <init>(Lfsj;B)V
    .registers 3

    iput-byte p2, p0, Lcsj;->a:B

    iput-object p1, p0, Lcsj;->b:Lfsj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lcsj;->a:B

    iget-object p0, p0, Lcsj;->b:Lfsj;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lfsj;->b()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lfsj;->b()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
