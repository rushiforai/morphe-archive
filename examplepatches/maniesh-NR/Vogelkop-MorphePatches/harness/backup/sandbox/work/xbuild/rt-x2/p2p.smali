.class public final Lp2p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La3p;


# direct methods
.method public synthetic constructor <init>(La3p;B)V
    .registers 3

    iput-byte p2, p0, Lp2p;->a:B

    iput-object p1, p0, Lp2p;->b:La3p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lp2p;->a:B

    iget-object p0, p0, Lp2p;->b:La3p;

    packed-switch v0, :pswitch_data_20

    invoke-virtual {p0}, La3p;->r()V

    return-void

    :pswitch_b
    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, La3p;->t:Landroid/app/Activity;

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    iget v2, p0, La3p;->W:I

    if-eq v1, v2, :cond_1c

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_1c
    invoke-virtual {p0}, La3p;->r()V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
