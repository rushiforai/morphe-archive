.class public final synthetic Lgd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljd9;


# direct methods
.method public synthetic constructor <init>(Ljd9;B)V
    .registers 3

    iput-byte p2, p0, Lgd9;->a:B

    iput-object p1, p0, Lgd9;->b:Ljd9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lgd9;->a:B

    iget-object p0, p0, Lgd9;->b:Ljd9;

    packed-switch v0, :pswitch_data_1c

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljd9;->n:Z

    invoke-virtual {p0}, Ljd9;->z0()V

    return-void

    :pswitch_e
    invoke-virtual {p0}, Lryl;->i0()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Ljd9;->y0()V

    invoke-virtual {p0}, Ljd9;->z0()V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
