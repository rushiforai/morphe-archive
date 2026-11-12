.class public final synthetic Lm1c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp1c;

.field public final synthetic c:Lvr9;


# direct methods
.method public synthetic constructor <init>(Lp1c;Lvr9;B)V
    .registers 4

    iput-byte p3, p0, Lm1c;->a:B

    iput-object p1, p0, Lm1c;->b:Lp1c;

    iput-object p2, p0, Lm1c;->c:Lvr9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 4

    iget-byte v0, p0, Lm1c;->a:B

    iget-object v1, p0, Lm1c;->c:Lvr9;

    iget-object p0, p0, Lm1c;->b:Lp1c;

    packed-switch v0, :pswitch_data_1e

    if-eqz p1, :cond_f

    invoke-virtual {v1}, Lvr9;->run()V

    goto :goto_12

    :cond_f
    invoke-virtual {p0}, Lp1c;->f()V

    :goto_12
    return-void

    :pswitch_13
    if-eqz p1, :cond_19

    invoke-virtual {v1}, Lvr9;->run()V

    goto :goto_1c

    :cond_19
    invoke-virtual {p0}, Lp1c;->f()V

    :goto_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
