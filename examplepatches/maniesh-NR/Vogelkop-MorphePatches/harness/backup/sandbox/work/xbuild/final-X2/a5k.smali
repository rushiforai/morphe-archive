.class public final synthetic La5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb5k;


# direct methods
.method public synthetic constructor <init>(Lb5k;B)V
    .registers 3

    iput-byte p2, p0, La5k;->a:B

    iput-object p1, p0, La5k;->b:Lb5k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, La5k;->a:B

    iget-object p0, p0, La5k;->b:Lb5k;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lb5k;->c()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lb5k;->b()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
