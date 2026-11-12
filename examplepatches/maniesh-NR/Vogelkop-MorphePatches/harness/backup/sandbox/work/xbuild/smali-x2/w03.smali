.class public final synthetic Lw03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpr;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lpr;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lw03;->a:B

    iput-object p1, p0, Lw03;->b:Lpr;

    iput-object p2, p0, Lw03;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lw03;->a:B

    iget-object v1, p0, Lw03;->c:Ljava/lang/Object;

    iget-object p0, p0, Lw03;->b:Lpr;

    packed-switch v0, :pswitch_data_1e

    iget v0, p0, Lpr;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lpr;->a:I

    if-nez v0, :cond_14

    invoke-virtual {p0, v1}, Lpr;->G(Ljava/lang/Object;)V

    :cond_14
    return-void

    :pswitch_15
    iget v0, p0, Lpr;->a:I

    if-nez v0, :cond_1c

    invoke-virtual {p0, v1}, Lpr;->G(Ljava/lang/Object;)V

    :cond_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
