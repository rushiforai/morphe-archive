.class public final synthetic Lm0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp0h;


# direct methods
.method public synthetic constructor <init>(Lp0h;B)V
    .registers 3

    iput-byte p2, p0, Lm0h;->a:B

    iput-object p1, p0, Lm0h;->b:Lp0h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lm0h;->a:B

    iget-object p0, p0, Lm0h;->b:Lp0h;

    packed-switch v0, :pswitch_data_2c

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lp0h;->g()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lp0h;->g()V

    return-void

    :pswitch_13
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lp0h;->c()V

    return-void

    :pswitch_19
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lp0h;->c()V

    return-void

    :pswitch_1f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lp0h;->f()V

    return-void

    :pswitch_25
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lp0h;->f()V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_25
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
