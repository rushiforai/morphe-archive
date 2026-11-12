.class public final synthetic Lm62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls62;


# direct methods
.method public synthetic constructor <init>(Ls62;B)V
    .registers 3

    iput-byte p2, p0, Lm62;->a:B

    iput-object p1, p0, Lm62;->b:Ls62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lm62;->a:B

    iget-object p0, p0, Lm62;->b:Ls62;

    packed-switch v0, :pswitch_data_14

    invoke-virtual {p0}, Ls62;->a()V

    return-void

    :pswitch_b
    iget-object p0, p0, Ls62;->t:Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
