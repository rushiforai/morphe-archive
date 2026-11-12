.class public final synthetic Lm8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luue;


# direct methods
.method public synthetic constructor <init>(Luue;B)V
    .registers 3

    iput-byte p2, p0, Lm8i;->a:B

    iput-object p1, p0, Lm8i;->b:Luue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lm8i;->a:B

    iget-object p0, p0, Lm8i;->b:Luue;

    packed-switch p1, :pswitch_data_20

    invoke-virtual {p0}, Luue;->r0()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Luue;->s0()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Luue;->q0()V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Luue;->t0()V

    return-void

    :pswitch_17
    invoke-virtual {p0}, Luue;->p0()V

    return-void

    :pswitch_1b
    invoke-virtual {p0}, Luue;->o0()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_17
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
