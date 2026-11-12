.class public final synthetic Ll6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm6g;


# direct methods
.method public synthetic constructor <init>(Lm6g;B)V
    .registers 3

    iput-byte p2, p0, Ll6g;->a:B

    iput-object p1, p0, Ll6g;->b:Lm6g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ll6g;->a:B

    iget-object p0, p0, Ll6g;->b:Lm6g;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Lm6g;->g()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lm6g;->g()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lm6g;->g()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
