.class public final synthetic La48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld48;


# direct methods
.method public synthetic constructor <init>(Ld48;B)V
    .registers 3

    iput-byte p2, p0, La48;->a:B

    iput-object p1, p0, La48;->b:Ld48;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, La48;->a:B

    iget-object p0, p0, La48;->b:Ld48;

    packed-switch v0, :pswitch_data_1e

    iget-object p0, p0, Ld48;->i:Lj1k;

    invoke-virtual {p0}, Lj1k;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_d
    iget-object p0, p0, Ld48;->h:Lf9l;

    sget-wide v0, Ld48;->l:J

    new-instance v2, Lpn7;

    invoke-direct {v2, v0, v1}, Lpn7;-><init>(J)V

    invoke-virtual {p0, v2}, Lf9l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1a
    invoke-virtual {p0}, Ld48;->b()V

    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_d
    .end packed-switch
.end method
